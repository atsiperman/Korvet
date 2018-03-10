		
; ---- main game logic
; result: A - 0 to stop

gmain:
		call gaction
		
		call sbmain
		ret

; ---- calls action logic for other objects
;				
gaction:
		ld hl,objlist
		load_de_hl
		ex de,hl			; HL - address of the object list
		ld a,(hl)			; number of objects
		or a
		ret z				; no objects

		ld bc,objsize	
		inc hl				; set to the first object
		
gaction1:		
		push bc
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
		pop bc
		
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
		;ret z
		
		call chkfalng
		or a
		jp z,gend		; exit if is falling down

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
		jp z,gkduck			; duck if can't go

		pop hl
		push hl		
		call sbstladr		; start moving on the ladder
		jp gkdne
				
gkduck:
		pop hl
		push hl		
		call sbstkick		; duck
		
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
		
		