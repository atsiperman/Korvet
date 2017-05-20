
; ----- check, if saboteur can go upstairs or downstairs
; args: HL - address of control block
;		C  - direction
; result:
;		A - 0 if not a ladder
;
cangolad:
		ldcursc
		ld e,a				; E - column
		inc e				; next column	
		inc hl
		ld a,(hl)			; A - row
		
		ld hl,shadscr
		
		ld d,0
		add hl,de			; X next position
		
		add a,SBHI-1		; add height to the current row
		ld b,a
		
		ld a,dirdn
		cp c		
		jp nz,sbcanld1
		
		inc b				; plus one block for down direction

sbcanld1:		
		ld a,b
		ld bc,COLNUM
							; calculate Y 
sbcanld2:	
		add hl,bc
		dec a
		jp nz,sbcanld2
		
		push hl
		ldsprt
		pop hl
		and bladder
		ret nz
				
		xor a
		ret 		
		
;
; --- end of sbcanlad
;

; ----- starts movement on the ladder
; args: HL - address of control block
;		B  - new state
;		C  - direction
;		
sbstladr:
		push hl
		ld de,odcurst		
		add hl,de
		
		ld (hl),sbladr		; save state
		
		inc hl
		ld (hl),c			; save direction
				
		inc hl				
		inc hl				; skip prev position
		inc hl				; current position
		
		push hl				; address of the screen memory
		load_de_hl
		inc de				; one column right
		ld a,d				; move one row up
		sub 2
		ld d,a		
		pop hl
		savem_hl_de			; save new position
		
		ld de,sablad1		
		savem_hl_de			; save address of the first sprite
		
		ld (hl),0			; index of the sprite
		inc hl
		
		ld a,(hl)
		inc a
		ld (hl),a			; one column right
		
		inc hl
		ld a,(hl)
		dec a
		ld (hl),a			; one row upper
		
		pop hl		
		ret		
;
; --- end of sbstladr
;
		
		
sbdoladr:
		ret
		
sbstkick:
		ret
		
		
sbdokick:
		ret
		
