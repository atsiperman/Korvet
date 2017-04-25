

; ----- checks if screen has changed
; result: A - 0 if not changed, 
scrchngd:
		ld hl,(curscr)
		ex de,hl
		ld hl,(prevscr)
		ld a,l
		cp e
		jp nz,scrchng2
		ld a,h
		cp d
		jp nz,scrchng2
		ld a,0
		ret
scrchng2:	
		ld a,1
		ret
			
		
; ----- draws current screen	
drawscr:
		call scrchngd		; screen changed ?
		and a		
		jp z,drawobjs		; do not draw if no
		
		ld a,80h
		call clrwscr
		
		ld hl,(curscr)		; pointer to screen control block
		load_de_hl			; load address of the current screen
        call drawbkgr

		ld hl,(curscr)		; save current screen as previous
		ld (prevscr),hl		
		
drawobjs:					; draw all objects
		ret
							; clear old sprite
		ld de,SABCLR
		ld hl,(MAINPOS)		
		call drawspr
		
		ld hl,(MAINSPR)
		ex de,hl								
		ld hl,(MAINPOS)		
		call drawspr
		
		ret
			
			
