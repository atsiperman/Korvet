
; ---- calculates height in rows of the current sprite
;
; result:
;			A - height in rows
;
sbcurrh:
		sblcursp
		inc de		; skip color
		inc de		; skip width
		ld a,(de)	; load height in bytes
		call dvd8	; get height in rows
		ret

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

; ---- calculates address of the right corner in shadow screen (X + WIDTH,Y) = (CURRENT COLUMN + WIDTH, A)
; args:
;			A - row number
; result:			
;			HL - address
scadrrt:
		call scadrlt
		push hl
		sblcursp
		inc de 					; skip color		
		ld a,(de)				; read width
		ld b,0
		ld c,a
		pop hl
		add hl,bc				; get right column
		ret
				
; ---- checks if saboteur may fall down
;
; result:
;			A - 0 if can not fall
;
		macro SBCANFAL exitlabl
		inc hl			; X = X + 1
		push hl
		ldsprt	
		pop hl
		call isfloor
		jp nz,exitlabl
		endm
		
sbcanfal:
		call sbcurrh	; get height
		ld d,a
		sblcursr
		add d			; level below feet
		
		call scadrlt	; get left position
		
		SBCANFAL sbcnfaln
		SBCANFAL sbcnfaln
		SBCANFAL sbcnfaln

		ld a,1			; no floor - may fall down
		ret
		
sbcnfaln:
		xor a
		ret

		
; ---- switches next sprite for actions (jump, fight, etc.)
; 		moves to the next sprite if available
; args:
;			HL - sprite table
; result:
;			A - 0 if no more sprite to draw
;		
; sbnxspra:
		; ld c,(hl)			; load number of sprite 
		; sblcursi			; load sprite index
		; inc a 
		; cp a
		; jp z,sbnxspae
		; sbscursi
		; inc hl
		; ld b,0
		; ld c,a
		; add hl,bc
		; add hl,bc
		; load_de_hl
		; sbscursp
		
; sbnxspae:
		; xor a				; no more sprites, stop moving
		; ret
		
		