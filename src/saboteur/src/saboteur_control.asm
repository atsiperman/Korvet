

; ---- logic when no button pressed
;
sbnoactn:
		ld hl,sbctrlb
		push hl
		
		ldstate
		cp sbstay
		jp nz,sbnoact1	
							; player is staying, no action
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
;		C  - direction to move
;
sbstmove:
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
		scurst sbmove
		ret
;
; ----	end of sbstmove:
;

; ---- saboteur starts going right
; args: HL - address of control block
;
sbstgort:
							; move object right
		push hl
		ldcurp
		inc de				; increase position
		pop hl				
		push hl
		scurp				; save new position		
		
		pop hl
		push hl
		ld a,0				; set first sprite
		scurspi

		ld hl,sbmvrttb + 1	; skip header
		load_de_hl			; address of the first sprite		
		
		pop	hl
		push hl
		scurspr				; save sprite address		
		
		pop hl
		scurdir dirrt
		ret		
;
; ----	end of sbgort:
;


; ---- saboteur starts going left
; args: HL - address of control block
;
sbstgolt:
							; move object left
		push hl
		ldcurp		
		dec de				; decrease position
		pop hl				
		push hl
		scurp				; save new position		
		
		pop hl
		push hl
		ld a,0				; set first sprite
		scurspi

		ld hl,sbmvlttb + 1	; skip header
		load_de_hl			; address of the first sprite		
		
		pop	hl
		push hl
		scurspr				; save sprite address		
		
		pop hl
		scurdir dirlt
		ret		
;
; ----	end of sbgort:
;


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
		ld bc,odcursc
		add hl,bc
		ld a,(hl)		; load current screen column
		ld c,ECOLNUM
		cp c			; staying on the right border
		jp nz,sbgort2
		push hl
		call goscrnrt	; switch screen
		pop hl
		ld a,SCOLNUM 	; index of the first column 
		jp sbgort3
		
sbgort2:
		inc a			; next column

sbgort3:		
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
		
; ---- saboteur is going left
; args: HL - address of control block
;		
sbgolt:
		ld bc,odcursc
		add hl,bc
		ld a,(hl)		; load current screen column
		ld c,SCOLNUM
		cp c			; staying on the left border
		jp nz,sbgolt2
		push hl
		call goscrnlt	; switch screen
		pop hl
		ld a,ECOLNUM 	; index of the last column 
		jp sbgolt3
		
sbgolt2:
		dec a			; next column

sbgolt3:		
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
		ld c,SCOLNUM
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

				