
; ---- main game logic
; result: A - 0 to continue

gmain:
        call kbread
		and 255
		;jp z,gmain
		ret z
		
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
		xor a		
		ret

; ----- move up
gkup:
		nextscreen upscrd
		
; ----- move down
gkdown:
		nextscreen downscrd
		
; ----- move left
gkleft:	
		nextscreen leftscrd


; ----- move right
gkright:	
		nextscreen rigtscrd

		