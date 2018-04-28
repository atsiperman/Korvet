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
		call isfloor		; is floor reached down
		pop hl
		pop de
		or a
		jp z,contfall		; no, continue falling
		
		push hl
		dec d				; decrease column
		ld a,d
		scursc
		
		pop hl
		push hl
		scurst sbstay		; set new state

		pop hl
		
		ld a,0
		scurspi				; sprite index
		dec hl	
		dec hl
		ld de,sabsprt		; sprite for staying 
		savem_hl_de
		
		ret
		
contfall:		
							; continue falling down
		push hl
		ld a,e				; save next row	
		scursr			
		
		pop hl
		
		ldcurp		
							; increase row
		ld a,d
		add 2
		ld d,a
		dec hl
		dec hl
		savem_hl_de
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
;			index of the left column of the ladder if success
;
;		The idea is to check tiles from left to right position according to current sprite width.
;       Success - if two tiles of ladder type found.
; 		Skip left column if he's looking in right direction or right column if looking on the left side.
cangolad:
		sblcurst
		ld b,a
		
		push bc				; save state and direction
		sblcursp			; DE - sprite address
		call ldsprht		; load sprite height
		ld e,a				; save height in E
		
		sblcursr
		add e				; Y + 1 from bottom position (for down direction by default)
		;inc a				; Y = Y + 1 for down direction
		ld b,a				; save Y in B
				
		ld a,c
		cp dirdn
		jp z,sbcanld1
							; moving up
		dec b				; Y = Y - 1 (feet level)
		
sbcanld1:
		ld hl,shadscr
		ld de,COLNUM

sbcanld2:
		add hl,de
		dec b
		jp nz,sbcanld2		; calculate address of Y position
				
		sblcursc			; load column
		ld e,a
		add hl,de			; calculate X position
		
		pop bc				; restore state and direction
		ld a,b				; save state
		
		ld b,0				; B will keep counter of ladder tiles found
		
		ld c,SBWILAD		; width on the ladder by default
		cp sbladr
		jp z,sbcanld3		; we're on the ladder, 
		
							; check width if not on the ladder yet
							
		ld c,SBWI-1			; check width-1 for left direction (skip position behind)
		sblddir
		cp dirrt
		jp nz,sbcanld3

		inc e				; skip column
		inc hl				; skip position behind (first column for right direction)
		
sbcanld3:
		push de

sbcanld4:
		push hl				; check tile type in X,Y
		ldsprt
		pop hl
		and bladder		
		jp z,sbcanld7		; if not a ladder then continue
							; else check if more than one tile discovered
		rra					; bladder = 2, so shift it right
		and b					
		jp z,sbcanld5				
							; not zero if B already contains 1, then success
							; calculate left ladder column
		pop de
		ld a,SBWI-1
		sub c
		dec a
		add e
		ret
		
sbcanld5:		
		inc b				; increase counter
		
sbcanld7:
		inc hl				; next column
		dec c
		jp nz,sbcanld4		; continue check
		
		pop de				; clear stack
		xor a				
		ret 
;
; --- end of sbcanlad
;

; ----- starts movement on the ladder
; args: 
;		A  - column index to start (from cangolad)
;		B  - new state
;		C  - direction
;		
sbstladr:
		sbscursc
		
		sbscurst sbladr
		
		ld a,c
		sbsdir				; save direction

		ld hl,sbctrlb
		
		cp dirup		
		jp z,sbstlad1
		call sbincrow
		
sbstlad1:
		call sbdecrow
		
		ld de,sablad1		
		sbscursp
		
		xor a
		sbscursi			; index of the sprite
				
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
		
		cp dirdn
		jp z,sbdolad1		; go down	
				
		ld a,c
		or a
		jp z,sbdolad2		; first row -> change screen		
		dec c				; go up
		ld (hl),c			; save new row
		jp sbdolad4
		
sbdolad1:					; go down
		inc c
		ld a,ROWNUM - (SBHI+1)
		cp a,c
		jp z,sbdolad3		; last row -> change screen
		ld (hl),c			; save new row		
		jp sbdolad4
		
sbdolad2:					; change screen
		call goscrnup		
		or a
		jp z,sbdolade		; screen not changed
		
		pop hl
		push hl
		ld a,ROWNUM
		sub SBHI+1		; row num on the new screen
		scursr	
						
		jp sbdolad4
		
sbdolad3:
		call goscrndn
		or a
		jp z,sbdolade		; screen not changed
		
		pop hl
		push hl
		xor a				; row num on the new screen				
		scursr				
		
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
		
; ----- checks if it is possible to leave ladder
; args:
;		A - direction to move (left or right)
; result:
;		A - 0 if can not leave ladder
;		
sbstplad:
		ld c,a				; save direction
		sblcursr			; load current row
		add SBHILAD	- 1		; get one level up from the floor 
		
		ld hl,shadscr		
		ld de,COLNUM
		
sbstpld1:					; calculate Y for floor level
		add hl,de
		dec a
		jp nz,sbstpld1
		
		sblcursc			; load current column		
		dec a
		ld e,a		
							; calculate X - 1
		add hl,de
		
		sblddir
		cp dirlt
		jp z,sbstpld3
		ld de,SBWILAD + 1
		add hl,de			; calculate X position for right direction
		
sbstpld3:		
		push hl
		ldsprt				; Y - 1
		pop hl
		and bwall
		jp nz,sbstpldn		; wall above the floor, can't move there		
		
		ld de,COLNUM
		add hl,de			; Y = Y + 1
		ldsprt				
		and bwall
		ret nz				; wall on the floor, can move
		
sbstpldn:
		xor a
		ret
		
; ----- switches to staying position from ladder 
; args:
;		A - direction to move (left or right)
;		
sbleavld:
		cp dirrt
		jp z,sblavld1
		
		sblcursc			; shift 1 col left for left direction
		dec a
		sbscursc

sblavld1:
		ld hl,sbctrlb
		call sbincrow		; sprite has less height	
		ret
		
		
		