
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
; args:
;			A - row number
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


; ---- checks if saboteur may fall down
;				
; result:
;			A - 1 if can fall
;
sbcanfal:
		sbcurrh			; get height
		ld d,a
		sblcursr		; current row in A
		add d			; level below feet

		cp ROWNUM		; check if this is the last row
		ret z			; return A > 0 to fall if saboteur is on the last row

		ld d,a			; save row in D
		push de			; save row		
		call _isfloor	
		pop de
		or a
		jp nz,_sbcnfal0 ; floor, return 0

		inc a			; check Y + 1
		call _isfloor	
		or a
		jp nz,_sbcnfal0 ; floor, return 0

		inc a
		ret

_sbcnfal0:		
		xor a			; there is a floor, no fall
		ret


; ---- checks if there is no floor on specified row
;
; args:	D - column
;		E - row
;					
;
; result:
;		A - 1 if there is a floor
;
		macro SBONFLOOR
		skip_buf_tile hl	; X = X + 1
		ld a,(hl)
		and bwall
		ret nz
		endm

_isfloor:
		call scadrlt		; get left position		
		SBONFLOOR
		SBONFLOOR
		SBONFLOOR
		ret
		
_isflore:
		ld a,1
		ret

