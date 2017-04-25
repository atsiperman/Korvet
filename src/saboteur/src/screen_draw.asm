

; ----- checks if screen has changed
; result: A - 0 if not changed, 
scrchngd:
		ld hl,(CURSCR)
		ex de,hl
		ld hl,(PREVSCR)
		ld a,l
		cp e
		jp z,scrchng2
		ld a,h
		cp d
		jp z,scrchng2
		ld a,1
		ret
scrchng2:	
		ld a,0
		ret
			
		
; ----- draws current screen	
drawscr:
		call scrchngd
		and a		
		jp z,drawobjs
		
		ld a,80h
		call clrwscr
		
		ld hl,(CURSCR)
		ex de,hl
        call drawbkgr

		ld hl,(CURSCR)		; save current screen as previous
		ld (PREVSCR),hl		
		
drawobjs:					; draw all objects

							; clear old sprite
		ld de,SABCLR
		ld hl,(MAINPOS)		
		call drawspr

		ld hl,(MAINSPR)
		ex de,hl				
				
		ld hl,(MAINPOS)		
		call drawspr
		
		ret
			
			
