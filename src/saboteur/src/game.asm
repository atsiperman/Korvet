
; ---- main game logic
; result: A - 0 to continue

gmain:
        call kbread
		and 255
		;ret nz
		jp z,gmain
		
		ld b,KUP
		cp b
		ret z			; exit button - end game	
		
		ld b,KLEFT
		cp b
		jp nz, gifrt
		call gkleft
		jp gend
		
gifrt:
		ld b,KRIGHT
		cp b
		call z,gkright
		
gend:	
		xor a		
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
		

		