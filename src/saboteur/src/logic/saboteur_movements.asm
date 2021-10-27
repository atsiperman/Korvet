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
		ld d,(hl)				; load current screen column
		
		inc hl
		ld e,(hl)				; load screen row

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

		push hl
		ld a,(sbmvrttb)			; total sprite count
		dec a					; set last sprite by default, it will be switched to 0 in sbgort
		sbscursi
		call sbgort
		pop hl

		inc a					; anything not zero
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

		push hl
		ld a,(sbmvlttb)			; total sprite count
		dec a					; set last sprite by default, it will be switched to 0 in sbgort
		sbscursi
		call sbgolt
		pop hl

		inc a					; anything not zero
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
		ld hl,sbchknpr
		ld (sbmoveh2 + 1),hl
		ld a,ECOLNUM
		ld (sbmoveh3 + 1),a
		ld hl,goscrnrt
		ld (sbmoveh4 + 1),hl
		ld a,SCOLNUM
		ld (sbmoveh5 + 1),a
		ld a,0x3C				; inc a
		ld (sbmoveh6),a
		pop hl
		jp sbmoveh
		
; ---- saboteur is going left
; args: HL - address of control block
;		
sbgolt:
		push hl
		ld hl,sbchknpl
		ld (sbmoveh2 + 1),hl
		ld a,SCOLNUM
		ld (sbmoveh3 + 1),a
		ld hl,goscrnlt
		ld (sbmoveh4 + 1),hl
		ld a,ECOLNUM
		ld (sbmoveh5 + 1),a
		ld a,0x3D				; dec a
		ld (sbmoveh6),a		
		pop hl
		jp sbmoveh
				
; ---- saboteur is moving horizontally
;
; args: HL - address of control block
;		
sbmoveh:
		push hl		
		ld bc,odcursc
		add hl,bc
		ld d,(hl)		; load current screen column
		
		inc hl
		ld e,(hl)		; load screen row
		pop hl
		push de
		push hl
		
		sblddir
		cp dirrt
		jp z,sbmoveh1
		dec d
		jp sbmoveh2
		
sbmoveh1:		
		ld a,d
		add a,SBWI
		ld d,a

sbmoveh2:
		call sbchknpr
		pop hl
		pop de
		or a
		ret z
				
		ld a,d
		
sbmoveh3:		
		ld c,ECOLNUM
		cp c			; staying on the right border
		jp nz,sbmoveh6
		push hl
sbmoveh4:		
		call goscrnrt	; switch screen
		pop hl
		or a
		ret z			; return if screen not changed
		
sbmoveh5:		
		ld a,SCOLNUM 	; index of the first column 
		jp sbmoveh7
		
sbmoveh6:
		inc a			; next column

sbmoveh7:
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
		jp nz,sbmoveh8
		ld a,0
		
sbmoveh8:
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
		
; ---- end of sbmoveh
;


; ---- checks next position on right
; args: HL - address of control block
;		D  - next column
;		E  - current row 
;
; result: 
;		A - 0 not to continue movement 
;
_chkposr:		; initial row
		db 0

sbchknpr:
		ld a,e
		ld (_chkposr),a		; save initial Y
		push hl

		inc e				; Y + 1, one block below head
		call shscradr		; get tile address in HL
		push hl

		ldsprt				
		and bwall
		jp nz,.sbchke		; wall, no movement

		dup 2
			pop hl
			ld de,SROWLEN	; Y + 2, Y + 3
			add hl,de

			push hl
			ldsprt				
			and bwall
			jp nz,.sbchke	; wall, no movement
		edup

		pop hl
		ld de,SROWLEN		; Y + 4
		add hl,de

		push hl
		ldsprt				
		and bwall
		jp z,.sbchk1		; no wall, check floor under saboteur

							; upstairs
		pop hl
		pop hl				; control block
		call sbgoupst
		ld a,1
		ret

.sbchk1:
		pop hl				; restore tile address
		ld de,SROWLEN		; Y + 5, first row under feet
		add hl,de

		ld a,(_chkposr)		; load initial Y
		add 5
		ld e,a
		push de

		; проверить, если может падать - значит надо просто сделать шаг вперёд, на след итерации он упадёт
		; push hl
		; call sbchkfal
		; pop hl
		pop de
		; or a
		; jp nz,.sbchky

		; если упасть не может, тогда проверить, может ли сделать шаг вниз
		push hl
		call sbcangdn
		pop hl
		or a
		jp z,.sbchky

		pop hl			; restore control block
		call sbgodnst	
		ld a,1
		ret

.sbchky:
		pop hl
		ld a,1
		ret

.sbchke:
		pop hl
		pop hl
		xor a
		ret

; ---- checks if saboteur may fall down
; args: 	HL - adress of the right tile in the first row under feet, in shadow screen
;			E  - row index
; result:
;			A - >0 if can fall down
;
sbchkfal:
		push de				; save row
		push hl				; save address
		call _tstflor
		pop hl
		pop de
		or a
		jp nz,_sbchkfln		; floor, can't fall down

		ld a,e
		cp ROWNUM-1			; last screen row ?
		ret z				; yes, return non zero to fall down

		ld de,SROWLEN		; Y + 1, second row under feet
		add hl,de

		call _tstflor
		or a
		jp nz,_sbchkfln:

		inc a				; not a floor, return non zero to fall down
		ret

_sbchkfln:
		xor a
		ret

; ---- checks if suboteur can go downstairs
; args: 	HL - adress of the right tile in the first row under feet, in shadow screen
;			E  - row index
; result:
;			A - >0 if can go down
;
sbcangdn:
		push de				; save row
		push hl				; save address
		call _tstflor
		pop hl
		pop de
		or a
		jp nz,_sbcngdn0		; floor, can't go down

		ld a,e
		cp ROWNUM-1			; last screen row ?
		jp z,_sbcngdn0		; last row, can't go down

		ld de,SROWLEN		; Y + 1, second row under feet
		add hl,de

		call _tstflor
		or a
		ret 			; can go down if there is a floor on Y + 1 row
		
_sbcngdn0:		
		xor a			; there is a floor, no fall
		ret

; ---- checks if specified row contains floor tiles 
; args: 	HL - adress of the right tile in shadow screen				
; result:
;			A - >0 if there is a floor tile in the row
;
_tstflor:
		dup 3
			push hl
			ldsprt	
			pop hl
			and bwall
			ret nz
			dec hl			; skip tile attributes
			dec hl			; X = X - 1
		edup
		xor a
		ret 


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

		inc e			; Y + 1, one block below head
		call shscradr	; get tile address in HL
		push hl

		ldsprt				
		and bwall
		jp nz,.sbchkle		; wall, no movement

		dup 2
			pop hl
			ld de,SROWLEN	; Y + 2, Y + 3
			add hl,de

			push hl
			ldsprt				
			and bwall
			jp nz,.sbchkle	; wall, no movement
		edup

		pop hl
		ld de,SROWLEN		; Y + 4
		add hl,de

		push hl
		ldsprt				
		and bwall
		jp z,.sbchkl1		; no wall, check floor under saboteur

							; upstairs
		pop hl
		pop hl				; control block
		call sbgoupst
		ret

.sbchkl1:
		pop hl
		pop hl
		ld a,1
		ret

.sbchkle:
		pop hl
		pop hl
		xor a
		ret


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
