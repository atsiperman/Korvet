
; ---- main game logic
; result: A - 0 to continue

gmain:
        call kbread
		and 255
		jp z,gmain
		;ret z
		
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
		jp nz,gend
		call gkup
		jp gend		
		
gend:	
		xor a		
		ret

; ----- move up
gkup:
		;ld hl,MAINPOS
		;load_de_hl
		;ex de,hl
		ld hl,SCRADDR
		
		ld de,SABSPRT1
		call drawspr

		ret
		
; ----- move left
gkleft:	
		ld hl,(CURSCR)
		dec hl
		dec hl
		ld (CURSCR),hl
		ret

; ----- move right
gkright:	
		ld hl,(CURSCR)
		inc hl
		inc hl
		ld (CURSCR),hl
		ret
		

		