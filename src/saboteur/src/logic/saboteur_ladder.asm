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
		ld e,a
		
		pop hl
		push de				; save current coordinates
		push hl
		
		add SBHILAD			; add height of the saboteur to get floor level
		ld e,a				; row in E		
		cp ROWNUM	
		jp nz,chkfal1
		
		call goscrndn	
		pop hl
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
		call shscradr		; get address of the sprites' index
		push hl
		ldsprt
		call isfloor		; is floor reached down
		pop hl
		or a				
		jp nz,chkfal2		; floor, stop falling

		inc hl				; check X + 1 position
		ldsprt
		call isfloor		; is floor reached down
		or a
		jp nz,chkfal2		; floor, stop falling
		
					; continue falling down
		pop hl
		pop de
		
		ld a,e				; save next row	
		inc a
		scursr			
		
		xor a
		ret
		
chkfal2:
		pop hl
		pop de

		dec d				; decrease column
		ld a,d
		scursc
		
		call sbdosquat
		xor a
		ret
	
;
; --- end of chkfalng
;

; ----- starts falling down
; args: 
;		C	- direction
;
sbstfall:
		push bc
		sblcursc
		
		pop bc
		
		ld e,a
		
		ld a,c
		cp dirlt
		jp z,sbfall1
							; falling to the right side
		inc e
		inc e
		ld a,e
		
		jp sbfalle
							
sbfall1:
							; falling to the left side
		ld a,e

sbfalle:
		sbscursc
		ld de,sabfall
		sbscursp			; save sprite address
		sbscurst sbfall
		ret	

;
; --- end of sbstfall
;
		
; ----- check, if saboteur can go upstairs or downstairs
; args: HL - address of control block
;		;;;B  - state
;		C  - vertical direction
; result:
;		A - 0 if not a ladder
;			index of the left column of the ladder if success
;
;		The idea is to check tiles from left to right position according to current sprite width.
;       Success - if two tiles of ladder type found.
; 		Skip left hand column if he's looking in right direction or right hand column if looking on the left side.
cangolad:
		sblcurst
		ld b,a
		
		push bc				; save state and direction
		sblcursp			; DE - sprite address
		call ldsprht		; load sprite height
		ld e,a				; save height in E
		
		sblcursr
		add e				; Y + 1 from bottom position (under feet, for down direction by default)
		ld b,a				; save Y in B
				
		ld a,c
		cp dirup
		jp z,sbcanld1
		
		ld a,ROWNUM 		; is bottom line ?
		cp b
		jp nz,sbcanld2		; check level under feet if no		
		
sbcanld1:				
		dec b				; Y = Y - 1 (feet level)
		
sbcanld2:
		ld a,b		
		call scadrlt
		
		pop bc				; restore state and direction
		sblcursc
		ld e,a				; save current column
		
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
		inc hl				; skip position behind (first left column for right direction)
		
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
		pop de				; restore start column
		ld a,SBWI-1			
		sub c				; calculate number of tiles tested
		dec a
		add e				; calculate index of the first column with ladder
		ret
		
sbcanld5:		
		inc b				; increase counter
		
sbcanld7:
		inc hl				; next column
		dec c
		jp nz,sbcanld4		; continue check
		
							; nothing found
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
;		C  - vertical direction
;		
sbstladr:
		sbscursc		
		sbscurst sbladr
		
		ld a,c

		cp dirdn
		jp z,sbstlad2
		call sbdecrow
		
sbstlad2:		
		ld de,sablad1		
		sbscursp
		
		xor a
		sbscursi			

		ret		
;
; --- end of sbstladr
;
		

; ----- do movement on the ladder
; args: HL - address of control block
;		C  - vertical direction
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
		
		push bc
		ld c,e
		call cangolad
		pop bc
		or a
		jp z,sbdolade		
		
		dec c				; go up
		ld a,c
		sbscursr
		jp sbdolad4
		
sbdolad1:					; go down
		ld a,ROWNUM - SBHILAD
		cp c
		jp z,sbdolad3		; last row -> change screen
		
		push bc
		ld c,e
		call cangolad
		pop bc
		or a
		jp z,sbdolade		
		
		inc c
		ld a,c
		sbscursr
		jp sbdolad4
		
sbdolad2:					; change screen UP
		call goscrnup		
		or a
		jp z,sbdolade		; screen not changed
		
		pop hl
		push hl
		ld a,ROWNUM
		sub SBHILAD 		; row num on the new screen
		scursr	
						
		jp sbdolad4
		
sbdolad3:					; change screen DOWN
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
		sblcursc			; shift 1 col left for left direction
		dec a
		sbscursc

		ld hl,sbctrlb
		call sbincrow		; sprite has less height	
		ret
		
		
		