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
		ret
		;nextscreen upscrd
		
; ----- move down
;
gkdown:
		ret
		;nextscreen downscrd
		
; ----- move left
;
gkleft:	
		ld hl,sbctrlb
		push hl
		
		ldstate
		
		ld c,dirlt
		
		pop hl
		cp sbstay			
		call z,sbstmove
		
		ret

; ----- move right
; 
gkright:
		ld hl,sbctrlb
		ldstate				; load direction to A

		ld c,dirrt
		
		cp sbstay			
		jp nz, gkrmove
		call sbstmove
		jp gkrighte
		
gkrmove:
		cp sbmove
		jp nz,gkrighte
		call sbdomove		; continue movement
		jp gkrighte
		
gkrighte:
		ret
		
		