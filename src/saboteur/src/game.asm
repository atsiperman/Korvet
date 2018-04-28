		
; ---- main game logic
; result: A - 0 to stop

gmain:
		call gaction		; process objects		
		call sbmain			; process saboteur
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
		
gaction2:					; it will return on this line
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
		jp nz,gifrtup
		xor a
		ret z			; exit button - end game	
						
gifrtup:				
		cp KRIGHT + KUP	; right + up
		jp z,gifupdo
		cp KLEFT + KUP	; left + up
		jp nz,giflt
		
gifupdo:
		call gkupact
		jp gend
		
giflt:
		cp KLEFT
		jp nz,gifrt
		ld a,dirlt
		call gkmoveh
		jp gend
		
gifrt:
		cp KRIGHT
		jp nz,gifup
		ld a,dirrt
		call gkmoveh
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

; ----- up and right or left
;
; args: 
;		A - keys pressed
;
gkupact:
		and KLEFT
		jp z,gkupact1
							; prepare code for right direction
		ld a,dirrt
		jp gkupact2		
		
gkupact1:					; prepare code for left direction
		ld a,dirlt
							; main logic
gkupact2:
		ld (gkupact3+1),a		; set arguments for further calls
		ld (gkupact22 + 1),a

		sblcurst
		cp sbmove
		jp nz,gkupact4		; not moving, check another state
							
							; else start jumping in required direction
		sblddir
		
gkupact3:		
		cp dirrt			; direction is set on entry
		jp nz,gkupact22		; if not correct direction then just process right/left button		
		;call sbstjmp		 ; start jumping
		ret

gkupact4:
		cp sbstay
		jp nz,gkupact5		; not staying, check another state
		;call sbstshjp		 ; start short jump
		ret
		
gkupact5:
		cp sbladr
		jp nz,gkupact22		; if not moving on the ladder, process right direction 		
		call gkup			; else process up if yes
		ret
		
gkupact22:					; process right button in case of invalid key for current state
		ld a,dirrt			; direction is set on entry
		call gkmoveh
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
		

; ----- move horizontally
; args:
;		A - direction to move
;
gkmoveh:
		ld c,a				; save direction in C
		sblddir
		cp c		
		jp z,gkright1		; continue, if correct direction

		ld a,c
		sbsdir
		call sbstopst
		ret
		
gkright1:		
		ld hl,sbctrlb
		sblcurst			; load state to A
		
		cp sbladr
		jp nz,gkmvstay		; not on the ladder, check next state
		;call sbstplad		 ; test if can leave ladder
		;or a
		;jp nz,gkmvstay			
		;call sbstmove		; leave ladder		
		call sbstopst
		ret
		
gkmvstay:				
		cp sbstay			
		jp nz,gkrmove		; not staying, check next state
		ld b,sbmove			; B - state, C - direction
		call sbstmove
		ret
		
gkrmove:
		cp sbmove
		call z,sbdomove		; continue movement
		ret
		
; ---- end of gkmoveh

