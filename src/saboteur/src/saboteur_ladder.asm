
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
		
		
; ----- do movement on the ladder
; args: HL - address of control block
;		C  - direction
;				
sbdoladr:
		push hl		
		ld e,c				; save direction	
		ldcursr						
		ld c,a				; current row in C
		
		ld a,e
		
		cp dirup
		jp nz,sbdolad1		; not up, go down	
				
		ld a,c
		or a
		jp z,sbdolad2		; first row -> change screen
		
		dec c				; go up
		ld (hl),c			; save new row
		
		pop hl
		push hl
		ldcurp				; address in screen memory in DE
		ld a,d				; move one row up
		sub 2
		ld d,a
		dec hl
		dec hl
		savem_hl_de
				
		jp sbdolad4
		
sbdolad1:					; go down
		inc c
		ld a,ROWNUM - (SBHI+1)
		cp a,c
		jp z,sbdolad3		; last row -> change screen
		ld (hl),c			; save new row

		pop hl
		push hl
		ldcurp				; address in screen memory in DE
		ld a,d				; move one row up
		add 2
		ld d,a
		dec hl
		dec hl
		savem_hl_de
		
		jp sbdolad4
		
sbdolad2:		
		call goscnrup		; change screen
		or a
		jp z,sbdolade		; screen not changed
		
		pop hl
		push hl
		ld a,ROWNUM
		sub a,SBHI+1		; row num on the new screen
		scursr	
		
		dec hl
		dec hl
		ld e,(hl)
		ld d,0
		ld hl,SCRADDR
		add hl,de			; new address in screen memory for current column
		ld bc,((ROWNUM-1)-(SBHI+1))*64
		add hl,de
		ex de,hl
		pop hl
		push hl
		scurp				
				
		jp sbdolad4
		
sbdolad3:
		call goscrndn
		or a
		jp z,sbdolade		; screen not changed
		
		pop hl
		push hl
		xor a				; row num on the new screen				
		scursr				
		
		dec hl
		dec hl
		ld e,(hl)
		ld d,0
		ld hl,SCRADDR
		add hl,de			; new address in screen memory in top row

		pop hl
		push hl
		scurp				
				

sbdolad4:
		pop hl
		push hl
		
		ldcurspi
		push hl
		
		ld hl,sbladtb
		ld e,(hl)		; total sprite count		
		inc a
		cp e	
		jp nz,sbdolad5
		ld a,0
		
sbdolad5:
		pop hl
		ld (hl),a		; save sprite index		
				
		pop hl
		push hl
		ld bc,odcursp
		add hl,bc
		snewspa sbladtb
		
sbdolade:
		pop hl		
		ret

;
; --- end of sbdoladr
;
		
sbstkick:
		ret
		
		
sbdokick:
		ret
		
