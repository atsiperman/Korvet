; ---- checks if saboteur may fall down
;				
; result:
;			A - 1 if can fall
;
sbcanfal:
		sblcurst
		cp	sbsquat
		jp	nz,.scfs
						; can't fall if in a squatting state
		xor	a
		ret				

.scfs:
		sbcurrh			; get height in A
        inc  a          ; make correction for head height
        inc  a 

		ld e,a
		sblcursr		; current row in A
		add e			; level below feet

		ld e,a			; save row in E
		push de			; save row		
		call _isfloor	
		pop de
		or a
		jp nz,_sbcnfal0 ; floor, return 0

        ld  a,e         ; row in A
		cp  ROWNUM - 1 	; check if this is the last row
        jp  nz,.sbcf1   ; not the last row, do nothing
        sblcursr        ; increase height
        dec a           ; to fit falling figure
        sbscursr        ; save row

.sbcf1:
		inc a
		ret

_sbcnfal0:		
		xor a			; there is a floor, no fall
		ret


; ---- checks if there is no floor on specified row
;
; args:  A - row index
;
; result:
;		A - 1 if there is a floor
;
_isfloor:		
		call scadrlt		; get left position		
		dup 2
			skip_buf_tile hl	; X = X + 1
			ld a,(hl)
			isfloor
			ret nz
		edup
		ret
		
_isflore:
		ld a,1
		ret


; ----- checks, if saboteur is falling down and makes next step if he is
; result:
;		A - 0 if is falling
;
chkfalng:
        sblcurst            ; load state
		
		cp sbfall
		ret nz				; exit if not falling down
		
        sblcursc
		ld d,a				; column in D
        sblcursr            ; row in E
		ld e,a
		
		push de				; save current coordinates
		
		add SBHILAD			; add height of the saboteur to get floor level
		ld e,a				; row in E		
		cp ROWNUM	
		jp c,chkfal1		; continue checking if row is less then ROWNUM
		
		call goscrndn		; row is equal or greater
		pop de		
		or a
		jp nz,chkfal_1
		ld a,1				; screen not changed, stop falling
		ret
		
chkfal_1:
		xor a				; row num on the new screen				
		sbscursr
		ret
		
chkfal1:		
		call shscradr		; get pointer to tile attributes
		ld a,(hl)
		isfloor				; is floor reached down
		jp nz,chkfal2		; floor, stop falling

		ld bc,COLWIDB
		add hl,bc			; check X + 1 position
		
		ld a,(hl)
		isfloor	   	        ; is floor reached down
		jp nz,chkfal2		; floor, stop falling
		
					        ; continue falling down
		pop de
		
		ld a,e				; save next row	
		inc a
		sbscursr
		
		xor a
		ret
		
chkfal2:
		pop de

		dec d				; decrease column
		ld a,d
		sbscursc
		
		call sbdosquat
		PLAYPNCH
		xor a
		ret
	
;
; --- end of chkfalng
;

; ----- starts falling down
; args: 
;
sbstfall:
		sblcursc		
		ld e,a
		
		sblddir				; check direction saboteur was going at
		cp dirrt
		jp z,sbfall1
							; was going left, falling to the right side
		;inc e
		inc e
		ld a,e
		
		jp sbfalle
							
sbfall1:
							; was going right, falling to the left side
		inc e
		ld a,e

sbfalle:
		sbscursc
        sbscurst sbfall
		ld   de,sabfall
		sbscursp			; save sprite address
        ld   de,sbhfall
        sbshdspr            ; set head sprite        
		ret	
