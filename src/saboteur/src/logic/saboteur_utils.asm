
; ---- decrease saboteur row
;
sbdecrow:		
		sblcursr
		dec a
		sbscursr
		ret

; ---- increase saboteur row
;
sbincrow:
		sblcursr
		inc a
		sbscursr				
		ret
		
; ---- increase saboteur column
;
sbinccol:
		sblcursc
		inc a
		sbscursc
		ret

; ---- decrease saboteur column
;		
sbdeccol:
		sblcursc
		dec a
		sbscursc
		ret
		
; ---- calculates address of the left corner in shadow screen (X,Y) = (CURRENT COLUMN, A)
; args:  A - row index
; result:			
;			HL - address
scadrlt:
		push de
		ld e,a
		sblcursc
		ld d,a
		call shscradr
		pop de
		ret



