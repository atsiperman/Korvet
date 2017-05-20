


; ---- logic when no button pressed
;
sbnoactn:
		ld hl,sbctrlb
		push hl
		
		ldstate
		
		cp sbstay
		jp nz,sbnoact3
							; player is staying, no action
		pop hl
		ret

sbnoact3:		
		cp sbladr			
		jp nz,sbnoact1		
							; player is on the ladder, no action
		pop hl		
		ret
		
sbnoact1:
		pop hl
		push hl
		lddir
		cp dirrt
		jp nz,sbnoact2
							; was moving right
		ld de,sabsprt 
		pop hl
		push hl		
		scurspr  			; stop, look at right
		
		pop hl
		push hl
		scurdir dirrt
		
		jp sbnoacte
		
sbnoact2:		
		pop hl
		push hl
		lddir
		cp dirlt
		jp nz,sbnoacte
							; was moving left
		ld de,sabsplt
		pop hl
		push hl
		scurspr 			; stop, look at left
		
		pop hl
		push hl
		scurdir dirlt


sbnoacte:		
		pop hl
		push hl
		sdrawf 1
		pop hl
		scurst sbstay		; is staying now
		ret
		
; ---- start move
; args: 
;		B  - new state
;		C  - direction to move
;
sbstmove:
		push bc
		
		ld hl,sbctrlb
		push hl
							; check right dir
		ld a,dirrt
		cp c
		jp nz,sbstmv1
		call sbstgort		
		jp sbstmve
		
sbstmv1:				
							; check left dir
		ld a,dirlt
		cp c
		jp nz,sbstmv2
		call sbstgolt
		jp sbstmve
		
sbstmv2:		

sbstmve:
		pop hl
		push hl		
		sdrawf 1
		pop hl		
							; set new state
		pop bc		
		ld de,odcurst
		add hl,de
		ld (hl),b
		ret
;
; ----	end of sbstmove:
;

; ---- saboteur starts going right
; args: HL - address of control block
;
sbstgort:
		push hl
		scurdir dirrt		
		;ld hl,sbmvrttb		; number of sprites
		;ld a,(hl)			; set first sprite
		;dec a				; index of last sprite
		pop hl
		;push hl
		xor a
		scurspi

		;pop hl
		;call sbgort			; start movement
		ret		

; ---- saboteur starts going left
; args: HL - address of control block
;
sbstgolt:
		push hl
		scurdir dirlt
		;ld hl,sbmvlttb		; number of sprites
		;ld a,(hl)			; set first sprite
		;dec a				; index of last sprite
		pop hl
		;push hl
		xor a
		scurspi

		;pop hl
		;call sbgolt			; start movement
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
		jp esbdomov
		
esbdomov:
		pop hl
		sdrawf 1

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
		push af			; save column index on stack

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

		dec hl
		ld d,(hl)
		dec hl
		ld e,(hl)
		
		pop af
		ld c,SCOLNUM
		cp c
		jp z,sbgort4
		inc de			; increase position
		jp sbgorte
		
sbgort4:				; set first column on the same row
		ld a,e
		ld c,ECOLNUM - SCOLNUM
		sub c
		ld e,a
		ld a,d
		sbc 0
		ld d,a		
		
sbgorte:		
		savem_hl_de		; set new position

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
		ld a,0
		
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
		
		ld hl,shadscr
		
		ld b,0
		ld c,d
		add hl,bc			; X next position
		
		ld c,e
		inc c
		ld de,COLNUM
							; calculate Y + 1, head's row
sbchkn1:					
		add hl,de
		dec c
		jp nz,sbchkn1
		
		
		ld c,SBHI-4			; repeat from the top point to the 3 blocks above the floor
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
		
		ld c,2				; go down
		ld de,COLNUM
sbchkn3:		
		add hl,de
		dec c
		jp nz,sbchkn3
		
							; X - 1,(Y + SBHI-1) - one block upper
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
		add hl,de			; X - 1,Y - floor
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
		
		ld hl,shadscr
		
		ld b,0
		ld c,d
		add hl,bc			; X next position
		
		ld c,e
		inc c				
		ld de,COLNUM
							; calculate Y + 1, head's row
sbchkln1:					
		add hl,de
		dec c
		jp nz,sbchkln1
		
		
		ld c,SBHI-4			; repeat from the top point to the 3 blocks above the floor
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
		
		ld c,2				; go down
		ld de,COLNUM
sbchkl3:		
		add hl,de
		dec c
		jp nz,sbchkl3
		
							; X + 1,(Y + SBHI-1) - one block upper
		inc hl				
		push hl

		ldsprt
		and bwall
		jp z,sbchkl1
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
							; X + 2,Y - floor under saboteur
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
		dec hl
		dec hl
		dec hl
		dec hl
		dec hl
		dec hl
		push hl
		load_de_hl			; current address in screen memory		
		ld a,d				; move one row upper
		sub 2
		ld d,a
		pop hl
		savem_hl_de
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
		dec hl
		dec hl
		dec hl
		dec hl
		dec hl
		dec hl
		push hl
		load_de_hl			; current address in screen memory		
		ld a,d				; move one row down
		add 2
		ld d,a
		pop hl
		savem_hl_de
		ret
		
		
		
