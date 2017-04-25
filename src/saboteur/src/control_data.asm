
OLDSTK: 	dw 0            ; save stack to return to cp/m

	
; ---- LUT 
LUTVAL:
		db 0				; black
		db ((8 + CBLUE) << 4) + CBLUE
		db ((8 + CGREEN) << 4) + CGREEN
		db ((8 + CYELLOW) << 4) + CYELLOW
		db ((8 + CMAIN) << 4) + CMAIN
		db 0,0,0
		dup 8
		db 0
		edup
		
; ---- screen control block

SCBLOCK:
CURSCR: 	dw SCRBK1		; pointer to current screen
PREVSCR:	dw 0
MAINSPR:	dw SABSPRT1
MAINPOS:	dw SCRADDR + COLNUM/2 + 64*ROWNUM*8/2

