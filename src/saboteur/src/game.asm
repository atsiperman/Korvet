; ----- make a pause
;
mkpause2:
		ld c,255
mkpause1:
		nop
		dec c
		jp nz,mkpause1
		ret

mkpause4:
		ld b,255
mkpause3:
		call mkpause2
		jp nz,mkpause3
		ret
		
		macro mkpause
		dup 35
		call mkpause4
		edup
		endm
		
; ---- main game logic
; result: A - 0 to continue

gmain:
        call kbread
		and 255
		jp nz,gkifesc
		call sbnoactn
		jp gend
				
gkifesc:		
		ld b,KESC
		cp b
		ret z			; exit button - end game	
		
		ld b,KLEFT
		cp b
		jp nz,gifrt
		call gkleft
		jp gend
		
gifrt:
		ld b,KRIGHT
		cp b
		jp nz,gifup
		call gkright
		jp gend
		
gifup:
		ld b,KUP
		cp b
		jp nz,gifdown
		call gkup
		jp gend		

gifdown:
		ld b,KDOWN
		cp b
		jp nz,gend
		call gkdown
		jp gend		

gend:		
		mkpause
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
		
		ld c,dirup

		cp sbkick			; if is kicking		
		jp nz,gkup2
		call sbdokick		; do kicking
		jp gkupe

gkup2:
		cp sbladr			; if is moving on the ladder
		jp nz,gkup3
		call sbdoladr		; continue movement
		jp gkupe		
			
gkup3:		
		cp sbstay			; if is staying then check
		jp nz,gkupe
		call cangolad		; if can go upstairs
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
		inc hl
		ld (hl),1			; set draw flag
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
		
		ld c,dirdn

gkdn2:
		cp sbladr			; if is moving on the ladder
		jp nz,gkdn3
		call sbdoladr		; continue movement
		jp gkdne		
			
gkdn3:		
		cp sbstay			; if is staying then check
		jp nz,gkdne
		ld c,dirdn
		call cangolad		; if can go downstairs
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
		inc hl
		ld (hl),1			; set draw flag
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
		
		