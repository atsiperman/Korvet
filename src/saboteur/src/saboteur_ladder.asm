; ----- checks, if saboteur is falling down and makes next step if he is
; result:
;		A - 0 if is falling
;
chkfalng:
		ld hl,sbctrlb
		push hl
		ldstate				; load state
		
		cp sbfall
		pop hl
		ret nz				; exit if not falling down
		
		push hl
		ldcursc
		ld d,a				; column in D
		inc hl
		ld a,(hl)			; row in E
		inc a				; next row
		ld e,a
		
		pop hl
		push de				; save current coordinates
		push hl
		
		add SBHI			; add height of the saboteur to get floor level
		ld e,a				; row in E		
		
		call shscradr		; get address of the sprites' index
		ldsprt
		call isfloor
		pop hl
		pop de
		or a
		jp z,contfall
		
		push hl
		dec d				; decrease column
		ld a,d
		scursc
		
		pop hl
		push hl
		scurst sbstay		; set new state

		pop hl
		push hl
		ldcurp
		dec de				; decrease screen address
		dec hl
		dec hl
		savem_hl_de			
		
		pop hl
		push hl
		ld a,0
		scurspi				; sprite index
		dec hl	
		dec hl
		ld de,sabsprt		; sprite for staying 
		savem_hl_de
		
		pop hl
		inc hl
		ld (hl),1			; redraw
		ret
		
contfall:		
							; continue falling down
		push hl
		ld a,e				; save next row	
		scursr			
		
		pop hl
		push hl
		ldcurp		
							; increase row
		ld a,d
		add 2
		ld d,a
		dec hl
		dec hl
		savem_hl_de
		pop hl
		inc hl
		ld (hl),1			; redraw
		xor a		
		ret
;
; --- end of chkfalng
;

; ----- starts falling down
; args: HL 	- address of control block
;		C	- direction
;
sbstfall:
		push bc
		push hl
		ldcursc
		
		pop hl
		pop bc
		push hl
		
		ld e,a
		
		ld a,c
		cp dirrt
		jp z,sbfall1
							; falling to the left side
		dec e
		dec e
		ld a,e
		
		ldcurp
		dec de
		dec de
		
		jp sbfalle
							; falling to the right side
sbfall1:
		inc e
		inc e
		ld a,e
		
		ldcurp
		inc de
		inc de
		
sbfalle:
		dec hl
		dec hl
		savem_hl_de			; save new screen position
		
		ld de,sabfall
		savem_hl_de			; save sprite address
		
		pop hl
		push hl		
		scursc		
		;ld (hl),a
		pop hl		
		scurst sbfall		
		ret	

;
; --- end of sbstfall
;



; ----- check, if saboteur can go upstairs or downstairs
; args: HL - address of control block
;		B  - state
;		C  - direction
; result:
;		A - 0 if not a ladder
;
cangolad:
		push bc				; save direction
		
		ldcursc
		ld e,a				; E - column
		inc e				; next column	
		inc hl
		ld a,(hl)			; A - row
		
		ld hl,shadscr
		
		ld d,0
		add hl,de			; X next position
				
		add a,SBHI-1		; add height to reach floor top
		
		pop bc				; pop direction
		
		ld e,a				; save counter
		
		ld a,dirdn
		cp c		
		jp nz,sbcanld1		; if not down start calculation

		inc e 				; if down then check floor level
		
sbcanld1:
		
		ld a,sbladr			
		cp b
		jp nz,sbcanld2
		
		inc e 				; if already moving then height is bigger		
		
sbcanld2:		
		ld bc,COLNUM
							; calculate Y 
sbcanld3:	
		add hl,bc
		dec e
		jp nz,sbcanld3
		
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
		call goscrnup		; change screen
		or a
		jp z,sbdolade		; screen not changed
		
		pop hl
		push hl
		ld a,ROWNUM
		sub SBHI+1		; row num on the new screen
		scursr	
		
		dec hl
		ld e,(hl)
		ld d,0
		ld hl,SCRADDR
		add hl,de			; new address in screen memory for current column
		ld bc,(ROWNUM-(SBHI+1))*8*64
		add hl,bc
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
		ld e,(hl)
		ld d,0
		ld hl,SCRADDR
		add hl,de			; new address in screen memory in top row
		ex de,hl

		pop hl
		push hl
		scurp				
				

sbdolad4:
		pop hl
		push hl
							; calculate new sprite index and address
		ldcurspi			
		push hl
		
		ld hl,sbladtb
		ld e,(hl)			; total sprite count		
		inc a
		cp e	
		jp nz,sbdolad5
		ld a,0
		
sbdolad5:
		pop hl
		ld (hl),a			; save sprite index		
				
		pop hl
		push hl
		ld bc,odcursp
		add hl,bc
		snewspa sbladtb		; calc and save new sprite address
		
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
		
