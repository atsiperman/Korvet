; ---- start to move
; args: 
;		C  - direction to move
;
sbstmove:
        ld b,sbstmov
		push bc
		
		ld hl,sbctrlb
		call sbincrow		; sprite for moving object has less height, so move it down
		
		pop bc
		push bc
		
		ld hl,sbctrlb
		push hl
							; check right dir
		ld a,dirlt
		cp c
		jp z,sbstmv1
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
		
        ld  de,sbhwalkr         ; save
        sbshdspr                ; sprite head

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

        ld  a,dirrt
        sbsdir
               					; A = dirrt - anything not zero
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

        ld  de,sbhwalkl         ; save
        sbshdspr                ; sprite head

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

		xor a
        sbscursi

        ld   a,dirlt
        sbsdir

                        ; A = dirlt - anything not zero
		ret		


; ---- continue moving
; args: C  - direction to move
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
		ld hl,sbmvrttb
		ld (sbmoveh9 + 1),hl
		inc hl
		ld (sbmoveh10 + 1),hl
		pop hl
		jp sbmoveh
		
; ---- saboteur is going left
; args: HL - address of control block
;		
sbgolt:
		push hl
		ld hl,sbchknpl
		ld (sbmoveh2 + 1),hl
		ld a,LECOLNUM ; SCOLNUM
		ld (sbmoveh3 + 1),a
		ld hl,goscrnlt
		ld (sbmoveh4 + 1),hl
		ld a,LSCOLNUM ; ECOLNUM
		ld (sbmoveh5 + 1),a
		ld a,0x3D				; dec a
		ld (sbmoveh6),a	
		ld hl,sbmvlttb
		ld (sbmoveh9 + 1),hl
		inc hl
		ld (sbmoveh10 + 1),hl
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
		
		sblddir			; load current direction
		cp dirrt		; check direction
		jp z,sbmoveh1	
		dec d			; going left
		jp sbmoveh2
		
sbmoveh1:				; going right
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
		push af			; save next column
		push hl			; save control block
		call sbstepud	; go upstairs/go downstairs if possible
		pop hl
		pop af

		ld bc,odcursc
		add hl,bc
		ld (hl),a		; save column index

		dec hl
		ld a,(hl)		; cur sprite index in A
		
		push hl

sbmoveh9:		
		ld hl,sbmvrttb
		ld e,(hl)		; total sprite count		
		inc a
		cp e	
		jp nz,sbmoveh8
		ld a,0
		
sbmoveh8:
		pop hl
		ld (hl),a		; save sprite index
		cp 3            ; is it the last sprite ?
		call z, sndstep	
		push hl
		
sbmoveh10:		
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

; ---- checks & does step upstairs/downstairs if possible
; args:
;
sbstepud:
		sblcursp			; load current sprite address
		ldsprht 			; load sprite height
		ld e,a				; save height in E

        inc  e              ; add only half of head height to stop on feet level
		sblcursr			; load current screen row
		add e
		ld e,a				; save row in E

		sblcursc			; load current column
		ld d,a				; save it in D

		sblddir				; load direction
		cp dirrt
		jp nz,_sbstpud1
		ld a,d				; move column into A		
		add SBWI - 1
		ld d,a				; save it in D

_sbstpud1:
		push de				; save row 
		call shscradr		; get pointer to screen buffer
		push hl
		call sbtrygup		; restore row
		pop hl
		pop de
		or a
		ret nz				; went up, return

		ld bc,ROWWIDB + COLWIDB	; for left direction by default
		sblddir
		cp dirlt
		jp z,_sbstpud2
		ld bc,ROWWIDB - COLWIDB	; for right direction
_sbstpud2:				
		add hl,bc			; first row under feet 
		inc e				; correct row index
		call sbtrygdn		; try to go down
		ret


; ---- saboteur goes up if possible
; args: 	HL - adress of the right tile in the first row above feet
;			
; result:
;			A - >0 if went up
;
sbtrygup:		
		ld a,(hl)			; test feet level
		and bwall
		jp z,_sbcngupn		; no wall, can't go up

		call sbdecrow
		ld a,1
		ret

_sbcngupn:
		xor a
		ret

; ---- saboteur goes down if possible
; args: 	HL - adress of the second tile in the first row under feet
;			E  - row index
; result:
;			A - >0 if can go down
;
sbtrygdn:
		ld a,(hl)			; test first block under feet
		isfloor	
		ret nz				; wall, do nothing

		ld a,e
		cp ROWNUM-1
		jp nz,_sbstpud3		
		xor a				; last row, can't go down
		ret

_sbstpud3:				
		ld bc,ROWWIDB		; two blocks under feet, X +/- 2
		add hl,bc			; second block under feet
		ld a,(hl)
		isfloor
		ret z				; no wall, do nothing

		call sbincrow
		ld a,1
		ret

; ---- checks next position on right or left
; args: HL - address of control block
;		D  - next column
;		E  - current row 
;
; result: 
;		A - 0 not to continue movement 
;
_chkposr:		; initial row
		db 0

sbchknpl:
		ld bc,ROWWIDB + COLWIDB	; displacement for the last tiles
		jp _sbchknp

sbchknpr:
		ld bc,ROWWIDB - COLWIDB

_sbchknp:
		ld a,e
		ld (_chkposr),a		; save initial Y
		push bc

		inc e				; Y + 1, one block below head
		call shscradr		; get tile address in HL

		ld a,(hl)
		and bwall
		jp nz,.sbchke		; wall, no movement

		ld de,ROWWIDB	
		
		add hl,de			; Y + 2
		ld a,(hl)
		and bwall
		jp nz,.sbchke		; wall, no movement

		push hl
		add hl,de			; Y + 3
		ld a,(hl)
		pop hl
		and bwall
		jp z,.sbchky		; no wall, can move

		pop bc
		push bc

		add hl,bc			; Y + 3, neighbour
		ld a,(hl)
		and bwall
		jp nz,.sbchke		; wall, no movement

		ld de,ROWWIDB	
		
		add hl,de			; Y + 4, neighbour
		ld a,(hl)
		and bkroof
		jp z,.sbchke		; no wall, no movement

.sbchky:
		pop bc
		ld a,1
		ret

.sbchke:
		pop bc
		xor a
		ret



; ---- test saboteur's position after screen switch and move him up/down if necessary
;	this is a workaround for some screens like 17/18
;   when the floor level changes on the border
;   so the saboteur has to be moved up/down after screen switch
;
sbtstpos:
		sblcurst			; load current state
							; position has to be fixed when he :

		cp	sbmove			; is moving
		jp 	z,sbstepud

		cp	sbstmov			; or is going to move
		jp 	z,sbstepud		

		cp	sbstay			; or is staying
		jp 	z,sbstepud		

		cp sbjump
		jp 	z,sbstepud		

		cp sbshjmp
		jp 	z,sbstepud		

		ret


