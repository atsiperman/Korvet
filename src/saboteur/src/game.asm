		
; ---- main game logic
; result: A - 0 to stop

gmain:
		call gaction
		
		call sbmain
		ret

; ---- calls action logic for other objects
;				
gaction:
		ld hl,(objlist)		; HL - address of the object list
		ld a,h
		or l
		ret z				; address is zero - exit

		ld a,(hl)			; load number of objects
		inc hl				; set to the first object
				
gaction1:		
		push hl
		push af

		ld de,gaction2
		push de				; put next instruction address on stack
		
		push hl				; save control block
		inc hl
		load_de_hl			; load address of object action procedure
		ex de,hl
		pop de				; load control block to DE
		jp (hl)				; call object action procedure
		
gaction2:		
		pop af
		pop hl
		
		ld bc,objsize					
		add hl,bc
		
		dec a
		jp nz,gaction1

		ret
			
; ---- main logic for saboteur
; result: A - 0 to stop
;		
sbmain:		
		call hlalive
		or a
		;ret z			; stop if dead
				
		call sbcanact	; check if can act
		or a 			
		jp z,gend		; return if zero (no actions)
		
        call kbread
		and 255
		jp nz,gkifesc
		call sbnoactn
		jp gend
				
gkifesc:		
		cp KESC
		jp nz,giflt
		xor a
		ret z			; exit button - end game	
						
giflt:
		cp KLEFT
		jp nz,gifrt
		call gkleft
		jp gend
		
gifrt:
		cp KRIGHT
		jp nz,gifup
		call gkright
		jp gend
		
gifup:
		cp KUP
		jp nz,gifdown
		call gkup
		jp gend		

gifdown:
		cp KDOWN
		jp nz,gend
		call gkdown
		jp gend		

gend:		
		ld a,1
		ret

; ---- checks if saboteur can do any actions
; result: A - 0 no actions can be done (saboteur is currently falling, jumping etc.)
;		
sbcanact:
		call chkfalng
		or a
		ret z			; exit if is falling down

		sblcurst		
		cp sbkick		; if is kicking		
		jp nz,sbcnact1
		call sbdokick	; continue kicking
		jp sbcnactn
		
sbcnact1:
		cp sbjump
		jp nz,sbcnact2
		; call sbdojp
		jp sbcnactn
		
sbcnact2:
		cp sbshjmp
		jp nz, sbcnacty
		; call sbdoshjp
		jp sbcnactn

sbcnacty:		
		or 1			; exit with non zero to allow actions
		ret
		
sbcnactn:		
		xor a
		ret
		
; ----- move up
;
gkup:
		ld hl,sbctrlb
		push hl
		ldstate 			; load state to A
		pop hl
		push hl
		
		ld b,a		
		ld c,dirup

		cp sbkick			; if is kicking		
		jp nz,gkup2
		call sbdokick		; do kicking
		jp gkupe

gkup2:
		cp sbladr			; if is moving on the ladder
		jp nz,gkup3
		push hl
		push bc
		call cangolad
		pop bc
		pop hl		
		or a
		jp z,gkup3			; can not continue movement
		call sbdoladr		; continue movement
		jp gkupe		
			
gkup3:		
		cp sbstay			; if is staying then check
		jp nz,gkupe
		push hl
		push bc		
		call cangolad		; if can go upstairs
		pop bc
		pop hl		
		or a
		jp z,gkstkick		; start kicking if no

		pop hl
		push hl		
		call sbstladr		; start moving on the ladder
		jp gkupe
				
gkstkick:
		pop hl
		push hl		
		call sbstkick		; start kicking		
		
gkupe:
		pop hl
		ret
		;nextscreen upscrd
		
; ----- move down
;
gkdown:
		ld hl,sbctrlb
		push hl
		ldstate 			; load state to A
		pop hl
		push hl
		
		ld b,a
		ld c,dirdn

gkdn2:
		cp sbladr			; if is moving on the ladder
		jp nz,gkdn3
		push hl
		push bc
		call cangolad
		pop bc
		pop hl		
		or a
		jp z,gkdn3			; can not continue movement
		
		call sbdoladr		; continue movement
		jp gkdne		
			
gkdn3:		
		cp sbstay			; if is staying then check
		jp nz,gkdne
		push hl
		push bc		
		call cangolad		; if can go downstairs
		pop bc
		pop hl		
		or a
		jp z,gksquat		; squat if can't go

		pop hl
		push hl		
		call sbstladr		; start moving on the ladder
		jp gkdne
				
gksquat:
		pop hl
		push hl		
		cp sbsquat		
		call nz,sbdosquat	; squat if is not squatting already
		
gkdne:
		pop hl
		ret
		;nextscreen downscrd
		
; ----- move left
;
gkleft:	
		ld hl,sbctrlb
		ldstate				; load state to A

		ld bc,(sbmove << 8) + dirlt
		
		cp sbstay			; start movement if is staying
		jp nz, gklmove
		call sbstmove
		jp gklefte
		
gklmove:
		cp sbmove
		jp nz,gkllad
		call sbdomove		; continue movement
		jp gklefte

gkllad:
		cp sbladr
		jp nz,gklefte
		call sbstmove		; leave ladder
		jp gklefte
		
gklefte:		
		ret

; ----- move right
; 
gkright:
		ld hl,sbctrlb
		ldstate				; load state to A

		ld bc,(sbmove << 8) + dirrt
		
		cp sbstay			
		jp nz, gkrmove
		call sbstmove
		jp gkrighte
		
gkrmove:
		cp sbmove
		jp nz,gkrlad
		call sbdomove		; continue movement
		jp gkrighte

gkrlad:
		cp sbladr
		jp nz,gkrighte
		call sbstmove		; leave ladder		
		jp gkrighte
		
gkrighte:
		ret
		
		