

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
		push hl
		ldcurp
		inc de			; increase position
		pop hl
		push hl
		scurp			; set new position

		pop hl
		push hl
		ldcurspi		; cur index in A

		ld hl,sbmvrttb
		ld e,(hl)		; total sprite count		
		inc a
		cp e	
		jp nz,sbgort1
		ld a,0
		
sbgort1:
		pop hl
		push hl		
		scurspi

		ld hl,sbmvrttb + 1  ; sprite table
		ld b,0
		ld c,a
		add hl,bc
		add hl,bc			; 
		load_de_hl			; load sprite address
		
		pop hl				; save new sprite addr
		scurspr				

		ret
		
; ---- saboteur is going left
; args: HL - address of control block
;		
sbgolt:
		push hl
		ldcurp
		dec de			; decrease position
		pop hl
		push hl
		scurp			; set new position

		pop hl
		push hl
		ldcurspi		; cur index in A

		ld hl,sbmvlttb
		ld e,(hl)		; total sprite count		
		inc a
		cp e	
		jp nz,sbgolt1
		ld a,0
		
sbgolt1:
		pop hl
		push hl		
		scurspi

		ld hl,sbmvlttb + 1  ; sprite table
		ld b,0
		ld c,a
		add hl,bc
		add hl,bc			; 
		load_de_hl			; load sprite address
		
		pop hl				; save new sprite addr
		scurspr				

		ret
				