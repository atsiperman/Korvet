; ----- checks whether it is free above 
; result:
;		A - 0 if there is a wall above 
;
freeabov:
        sblcursr        ; load row
        or  a
        jp  z,.cango    ; top row, can go up, screen border will be checked in other place
        dec a
        ld  e,a
        sblcursc        ; load column
        inc a
        ld  d,a
        call shscradr
        ld  a,(hl)
        and  bwall
        jp  z,.cango    ; no wall, can go up
        xor a
        ret 
.cango:
        inc a           ; can go up
        ret


; ----- check, if saboteur can go up or down on the ladder
; args: HL - address of control block
;		C  - vertical direction
; result:
;		A - 0 if not a ladder
;			index of the left column of the ladder if success
;
;		The idea is to check tiles from left to right position according to current sprite width.
;       Success - if two neighbour tiles of ladder type found, following one by one.
; 		Skip left hand column if he's looking in right direction or right hand column if looking on the left side.
cangolad:
		sblcurst
		ld b,a
		
		push bc				; save state and direction
		sblcursp			; DE - sprite address
		ldsprht				; load sprite height, it may be different depending on the current state
		ld e,a				; save height in E
		        
        inc  e				; add head height of 2 rows
        inc  e        		

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

		skip_buf_tile hl	; skip position behind (first left column for right direction)
		
sbcanld3:
		push de

sbcanld4:
		ld a,(hl)			; check tile type at X,Y
		and bladder		
		jp z,sbcanld7		; if not a ladder then continue
							; else check if more than one tile discovered
							
		rra					; bladder = 2, so shift it right
		and b				; already found anything ?
		jp z,sbcanld5		; clear counter if not

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
		jp sbcanld8			; continue

sbcanld7:
		ld	b,a				; A = 0 here, clear counter

sbcanld8:
		skip_buf_tile hl	; next column
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

        ld  de,sbhlad1
        sbshdspr            ; set head sprite

		ret		
;
; --- end of sbstladr
;
		

; ----- do movement on the ladder
; args: HL - address of control block
;		C  - vertical direction
;				
sbdoladr:
		ld e,c				; save direction	
		ldcursr						
		ld c,a				; current row in C
		
		ld a,e		
		cp dirdn
		jp z,sbdolad1		; go down	
				
		ld a,c
		or a
		jp z,sbdolad2		; first row -> change screen		
		
		ld c,e
		call cangolad
		or a
		jp z,sbdolade		

        call freeabov       ; is free above ?

        or  a
        jp  nz,.sbgup1      ; free, go up

        ; temporary change one row up
        sblcursr
        dec a
        sbscursr
		ld c,dirup
		call cangolad
        ld  c,a             ; save result

        ; restore current row
        sblcursr        
        inc a               
        sbscursr            
        ld  a,c             ; get result back
        or  a               ; check if row above feet is a ladder
        jp  z,.sbgup1       ; 0 - ladder ends on the current row, so we need to allow to go one row up        
        xor a               ; 1 - ladder will continue, do not move since it is not free above
        ret

.sbgup1:
        sblcursr            ; reload row
        dec a               ; go up
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
		
		ld a,ROWNUM
		sub SBHILAD 		; row num on the new screen
		sbscursr	
						
		jp sbdolad4
		
sbdolad3:					; change screen DOWN
		call goscrndn	
		or a
		jp z,sbdolade		; screen not changed
		
		xor a				; row num on the new screen				
        sbscursr
		
sbdolad4:
							; calculate new sprite index and address
        sblcursi
		
		ld hl,sbladtb
		ld e,(hl)			; total sprite count		
		inc a
		cp e	
		jp nz,sbdolad5
		ld a,0
		
sbdolad5:
        sbscursi            ; save sprite index						
                            
        ld   hl,sbctrlb     ; calc and save new sprite address
        snewspa2 sbladtb

        ld   hl,sbctrlb     ; calc and save new sprite address for head
		ld   bc,odhdspr
		add  hl,bc
		snewspa sbladhtb

sbdolade:
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
		
		sblcursc			; load current column
		dec a				; X - 1
		ld d,a				; save column in D

		sblcursr			; load current row
		add SBHILAD	- 1		; get one level up from the floor 
		ld e,a				; save row in E

		push bc
		call shscradr		; get pointer to tile attributes in HL
		pop bc
	
		ld a,c
		cp dirlt
		jp z,sbstpld3
		ld de,COLWIDB*3
		add hl,de			; calculate X position for right direction
		
sbstpld3:		
		ld a,(hl)			; Y - 1
		and bwall
		jp nz,sbstpldn		; wall above the floor, can't move there		
		
		ld de,ROWWIDB
		add hl,de			; Y = Y + 1
		ld a,(hl)
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
		jp sbincrow		; sprite has less height	
		;ret
		
		
		