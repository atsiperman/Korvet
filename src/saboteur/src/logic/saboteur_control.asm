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
		ld hl,shadscr
		ld de,COLNUM
		
scadrt1:	
		or a 
		jp z,scadrt2
		add hl,de
		dec a
		jp nz,scadrt1
		
scadrt2:		
		sblcursc
		ld e,a
		add hl,de
		
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
		
		
; ---- stop and stay
;
sbstopst:
		sblddir
		cp dirrt
		jp nz,sbstpst1
		ld de, sabsprt
		sbscursp
		jp sbstpste
		
sbstpst1:
		ld de,sabsplt
		sbscursp
		
sbstpste:
		sbscurst sbstay
		ret

; ---- checks if saboteur can do any actions
; result: A - 0 no actions can be done (saboteur is currently falling, jumping etc.)
;		
sbcanact:
		call chkfalng
		or a
		ret z			; exit if is falling down

		sblcurst		
		cp sbkick		; if is kicking		
		jp nz,sbcnact1
		call sbdokick	; continue kicking
		jp sbcnactn
		
sbcnact1:
		cp sbjump
		jp nz,sbcnact2
		call sblongjp
		jp sbcnactn
		
sbcnact2:
		cp sbshjmp
		jp nz, sbcnacty
		call sbdoshjp
		jp sbcnactn

sbcnacty:		
		or 1			; exit with non zero to allow actions
		ret
		
sbcnactn:		
		xor a
		ret
		
; ---- logic when no button pressed
;
sbnoactn:
		ld hl,sbctrlb
		push hl
		
		ldstate
		pop hl
		
		cp sbstay
		jp nz,sbnoact1
							; player is staying, no action									
		call hlinc			; update health 
		ret

sbnoact1:		
		cp sbladr			
		jp nz,sbnoact2
							; player is on the ladder
		call sbstplna		
		ret
		
sbnoact2:		
		push hl
		lddir
		pop hl
		cp dirrt
		jp nz,sbnoact5
							; was moving right
		ldstate	
		cp sbsquat
		jp nz,sbnoact4
							; player is squatting, now stand up									
							
							; player is looking right, decrease column
		ld hl,sbctrlb + odcursc	
		ld a,(hl)			; load column
		dec a
		ld (hl),a
		
sbnoact4:							
		ld de,sabsprt 
		sbscursp			; stop, look at right		
		jp sbststop
		
sbnoact5:
							; was moving left
		ld de,sabsplt
		sbscursp			; stop, look at left

sbststop:
		sbscurst sbstay		; is staying now
		
		sblprvsp		
		call ldsprht
		push af				; save prev height
		
		sblcursp			; load cur sprite 
		call ldsprht		; current height
		pop bc
		sub b				; current is always bigger than previous
		ld c,a				; save the difference
		sblcursr
		sub c				; increase height 
		sbscursr
		ret
		
sbnoacte:		
		pop hl		
		ret
		

; ---- check if can not move on the ladder up and stop if not
;		
sbstplna:			
		;ld a,dirrt
		sblddir
		call sbstplad		; can leave ladder ?
		or a
		ret z
		
		;sbsdir
		sblddir
		call sbleavld		; if yes - stop and stay
		call sbstopst
		ret
