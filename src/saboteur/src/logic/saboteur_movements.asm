; ---- start to move
; args: 
;		B  - new state
;		C  - direction to move
;
sbstmove:
		push bc
		
		ld hl,sbctrlb
		call sbincrow		; sprite for moving object has less height, so move it down
		
		pop bc
		push bc
		
		ld hl,sbctrlb
		push hl
							; check right dir
		ld a,dirrt
		cp c
		jp nz,sbstmv1
		call sbstgort		
		jp sbstmv2
		
sbstmv1:				
		call sbstgolt
		
sbstmv2:				
							; set new state
		pop hl
		pop bc		
		ld de,odcurst
		add hl,de
		ld (hl),b
		ret		
;
; ----	end of sbstmove:
;

; ---- saboteur starts going right
; args: 
;		HL - address of control block
;
; result:
;		A - zero if no movement
;		
sbstgort:
		push hl
				
		xor a
		snewspa2 sbmvrttb		; save new sprite address
		inc hl		
		ld (hl),a				; save new sprite index
		
		pop hl
		push hl
		
		ld bc,odcursc
		add hl,bc
		ld d,(hl)		; load current screen column
		
		inc hl
		ld e,(hl)		; load screen row
		pop hl
		push hl
		
		ld a,d
		add a,SBWI
		ld d,a
				
		call sbchknpr
		pop hl
		or a
		ret z

		push hl
		scurdir dirrt		
		pop hl
		or c			; anything not zero
		ret		

; ---- saboteur starts going left
; args: HL - address of control block
;
sbstgolt:
		push hl
		
		xor a
		snewspa2 sbmvlttb		; save new sprite address
		inc hl		
		ld (hl),a				; save new sprite index
		
		pop hl
		push hl
		
		ld bc,odcursc
		add hl,bc
		ld d,(hl)		; load current screen column
		
		inc hl
		ld e,(hl)		; load screen row
		pop hl
		push hl
		
		dec d		
		
		call sbchknpl
		pop hl
		or a
		ret z

		push hl
		scurdir dirlt
		pop hl
		xor a
		scurspi
		or c			; anything not zero
		ret		


; ---- continue moving
; args: 
;		C  - direction to move
;			
sbdomove:
		ld hl,sbctrlb
		push hl		
		lddir			; load direction to A
		
		pop hl
		push hl
		
		cp dirrt
		jp nz,sbdomove1	
		call sbgort 	; moving right
		jp esbdomov	
		
sbdomove1:
		cp dirlt
		jp nz,esbdomov
		call sbgolt		; moving left
		
esbdomov:
		pop hl

		ret
;
; ----	end of sbdomove:
;


; ---- saboteur is going right
; args: HL - address of control block
;		
sbgort:
		push hl
		ld bc,odcursc
		add hl,bc
		ld d,(hl)		; load current screen column
		
		inc hl
		ld e,(hl)		; load screen row
		pop hl
		push de
		push hl
		
		ld a,d
		add a,SBWI
		ld d,a
				
		call sbchknpr
		pop hl
		pop de
		or a
		ret z
				
		ld a,d
		ld c,ECOLNUM
		cp c			; staying on the right border
		jp nz,sbgort2
		push hl
		call goscrnrt	; switch screen
		pop hl
		or a
		ret z			; return if screen not changed
		
		ld a,SCOLNUM 	; index of the first column 
		jp sbgort3
		
sbgort2:
		inc a			; next column

sbgort3:
		ld bc,odcursc
		add hl,bc
		ld (hl),a		; save column index

		dec hl
		ld a,(hl)		; cur sprite index in A
		
		push hl
		
		ld hl,sbmvrttb
		ld e,(hl)		; total sprite count		
		inc a
		cp e	
		jp nz,sbgort1
		ld a,0
		
sbgort1:
		pop hl
		ld (hl),a		; save sprite index
		
		push hl
		
		ld hl,sbmvrttb + 1  ; sprite table
		ld b,0
		ld c,a
		add hl,bc
		add hl,bc			; 
		load_de_hl			; load sprite address
		
		pop hl				; save new sprite addr
		dec hl
		ld (hl),d
		dec hl
		ld (hl),e

		ret
		
; ---- end of sbgort
;

; ---- saboteur is going left
; args: HL - address of control block
;		
sbgolt:
		push hl
		ld bc,odcursc
		add hl,bc
		ld d,(hl)		; load current screen column
		
		inc hl
		ld e,(hl)		; load screen row
		pop hl
		push de
		push hl
		
		dec d		
		
		call sbchknpl
		pop hl
		pop de
		or a
		ret z
				
		ld a,d
		
		ld c,SCOLNUM
		cp c			; staying on the left border
		jp nz,sbgolt2
		push hl
		call goscrnlt	; switch screen
		pop hl
		or a
		ret z			; return if screen not changed
		
		ld a,ECOLNUM 	; index of the last column 
		jp sbgolt3
		
sbgolt2:
		dec a			; next column

sbgolt3:		
		ld bc,odcursc
		add hl,bc
		ld (hl),a		; save column index
		push af			; save column index on stack

		dec hl
		ld a,(hl)		; cur sprite index in A
		
		push hl
		
		ld hl,sbmvlttb
		ld e,(hl)		; total sprite count		
		inc a
		cp e	
		jp nz,sbgolt1
		xor a
		
sbgolt1:
		pop hl
		ld (hl),a		; save sprite index
		
		push hl
		
		ld hl,sbmvlttb + 1  ; sprite table
		ld b,0
		ld c,a
		add hl,bc
		add hl,bc			; 
		load_de_hl			; load sprite address
		
		pop hl				; save new sprite addr
		dec hl
		ld (hl),d
		dec hl
		ld (hl),e

		dec hl
		ld d,(hl)
		dec hl
		ld e,(hl)
		
		pop af
		ld c,ECOLNUM
		cp c
		jp z,sbgolt4
		dec de			; change position
		jp sbgolte
		
sbgolt4:				; set first column on the same row
		push hl
		ld hl,ECOLNUM - SCOLNUM
		add hl,de
		ld d,h
		ld e,l
		pop hl
sbgolte:		
		savem_hl_de		; set new position

		ret

; ---- end of sbgolt
;

; ---- checks next position on right
; args: HL - address of control block
;		D  - next column
;		E  - current row 
;
; result: 
;		A - 0 not to continue movement 
;
sbchknpr:		
		push hl
		push de
		
		ldcurspr
		ex de,hl
		inc hl 				; skip color
		inc hl				; skip width
		ld a,(hl)			; load height
		call dvd8			; get row count
		
		sub 4				; repeat from the top point to the 3 blocks above the floor
		ld c,a
		
		pop de
		pop hl
		push hl
		push bc				; save C
		
		ld hl,shadscr
		
		ld b,0
		ld c,d
		add hl,bc			; X + 1 position (right side + 1)
		
		ld c,e
		;inc c
		ld de,COLNUM
							; calculate Y + 1, head's row
sbchkn1:					
		add hl,de
		dec c
		jp nz,sbchkn1
		
		pop bc						
		;ld c,SBHI-4			; repeat from the top point to the 3 blocks above the floor
sbchkn2:		
							; X, Y - top-left or top-right point BEFORE the saboteur
		push hl				
		
		ldsprt		
		and bwall
		jp nz,sbchke0		; wall, no movement
		
		pop hl
		ld de,COLNUM
		add hl,de			
		
		dec c
		jp nz,sbchkn2		
		
		ld c,3				; go down
		ld de,COLNUM
sbchkn3:		
		add hl,de
		dec c
		jp nz,sbchkn3
		
							; X,(Y + SBHI-1) - one block upper
		dec hl				
		push hl

		ldsprt
		and bwall
		jp z,sbchk1
							; upstairs
		pop hl
		pop hl				; control block
		call sbgoupst
		ret
		
sbchk1:
		pop hl
		ld de,COLNUM
		add hl,de			; X,Y - floor
		push hl
		ldsprt
		and bwall + bladder
		jp nz,sbchke1		; floor continues
		
		; ------
							; X - 2,Y - floor under saboteur
		pop hl
		dec hl
		push hl

		ldsprt
		and bwall
		jp nz,sbchke1		; wall, go further

		pop hl
		ld de,COLNUM
		add hl,de			; X - 2,Y - 1 - one block under floor
		push hl
		ldsprt
		and bwall + bladder
		jp nz,sbrdn			; can't fall down
		
		pop hl
		pop hl				; control block
		ld c,dirrt
		call sbstfall		; start falling down
		xor a
		ret
		
sbrdn:						
							; no wall - downstairs
		pop hl
		pop hl				; control block
		call sbgodnst
		ret
	
sbchke1:					
		pop hl
		pop hl
		ld a,1
		ret
		
sbchke0:				
		pop hl
		pop hl
		xor a
		ret
		
; ---- end of sbchknpr
;

; ---- checks next position on left
; args: HL - address of control block
;		D  - next column
;		E  - current row 
;
; result: 
;		A - 0 not to continue movement 
;
sbchknpl:		
		push hl
		push de
		
		ldcurspr
		ex de,hl
		inc hl 				; skip color
		inc hl				; skip width
		ld a,(hl)			; load height
		call dvd8			; get row count
		
		sub 4				; repeat from the top point to the 3 blocks above the floor
		ld c,a
		
		pop de
		pop hl
		push hl
		push bc				; save C
		
		ld hl,shadscr
		
		ld b,0
		ld c,d
		add hl,bc			; X next position
		
		ld c,e
		;inc c				
		ld de,COLNUM
							
sbchkln1:					; calculate Y, head's row	
		add hl,de
		dec c
		jp nz,sbchkln1
		
		pop bc				; repeat from the top point to the 3 blocks above the floor
sbchkln2:		
							; X, Y - top-left or top-right point BEFORE the saboteur
		push hl				
		
		ldsprt		
		and bwall
		jp nz,sbchkle0		; wall, no movement
		
		pop hl
		ld de,COLNUM
		add hl,de			
		
		dec c
		jp nz,sbchkln2		
		
		ld c,3				; go down
		ld de,COLNUM
sbchkl3:		
		add hl,de
		dec c
		jp nz,sbchkl3
		
							; X - 1,(Y + SBHI-1) - one block upper
		inc hl				
		push hl

		ldsprt
		and bwall
		jp z,sbchkl1		; not wall
							; upstairs
		pop hl
		pop hl				; control block
		call sbgoupst
		ret
		
sbchkl1:
		pop hl
		ld de,COLNUM
		add hl,de			; X - 1,Y - floor
		push hl
		ldsprt
		and bwall + bladder
		jp nz,sbchkle1		; floor continues
				
		; ------
							; X - 2,Y - floor under saboteur
		pop hl
		inc hl
		push hl

		ldsprt
		and bwall
		jp nz,sbchkle1		; wall, go further
		
							; no wall - downstairs
		pop hl
		pop hl				; control block
		call sbgodnst
		ret
	
sbchkle1:					
		pop hl
		pop hl
		ld a,1
		ret
		
sbchkle0:				
		pop hl
		pop hl
		xor a
		ret
		
; ---- end of sbchknpl
;

; ---- go upstairs
; args: HL - address of control block
;
sbgoupst:		
		ld bc,odcursr
		add hl,bc
		ld a,(hl)
		dec a
		ld (hl),a
		ld a,1
		ret
				
; ---- go downstairs
; args: HL - address of control block
;
sbgodnst:
		ld bc,odcursr
		add hl,bc
		ld a,(hl)
		inc a
		ld (hl),a
		ret
