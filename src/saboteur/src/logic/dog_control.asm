; ----	implements logic of dog object
; args: 
;		DE - address of the object's control block
;		
dogact:
		ex de,hl
		push hl
		
		ldstate 		; load state
		pop hl
		
		cp dogdead		
		ret z			; dead - do nothing
		
		push hl		
		
		cp dogtrn
		jp nz,dogact2	; dog is moving
		
		pop hl
		call dogturn	; dog is turning
		push hl
		jp dogact_
						
dogact2:				
		lddir			; load direction		
				
		pop hl
		
		cp dirrt
		jp nz,dogact3	; move left
		push hl
		call dogmvrt	; else move right
		
		jp dogact_
		
dogact3:		
		push hl
		call dogmvlt	; move left
		
dogact_:		
		pop hl
		call dogbite	; check if dog is biting saboteur
		
		ret
				
; ----	dog is moving right
; args: 
;		HL - address of the object's control block
;
dogmvrt:	
		push hl
		ldcursc
		pop hl
		
		ld e,a
		
		push hl
		ldmaxc
		pop hl
		push hl
		
		cp e			; compare max col in A and current col in E		
		jp z,dogmvrt3	; equal - on the right border, go to change direction
		
						; move to the next position						
		inc e
		ld a,e
		scursc			; set next column
		pop hl
		push hl
		ldcurspi		; load current sprite index
		
		ld hl,dogmvrtb
		ld e,(hl)		; load number of sprites
		inc a
		cp e			; check index
		jp nz,dogmvrt2	; max not achieved 
		xor a			; else begin from 0
		
dogmvrt2:	
		pop hl
		push hl
		scurspi
		
		pop hl
		snewspa2 dogmvrtb
			
		ret
						
dogmvrt3:				; change direction
		pop hl
		ld a,dirlt
		ld de,dogtnltb
		call dogchdir
		ret
		
; ----	dog is moving left
; args: 
;		HL - address of the object's control block
;
dogmvlt:	
		push hl
		ldcursc
		pop hl
		
		ld e,a
		
		push hl
		ldminc
		pop hl
		push hl
		
		cp e			; compare max col in A and current col in E		
		jp z,dogmvlt3	; equal - on the right border, go to change direction
		
						; move to the next position						
		dec e
		ld a,e
		scursc			; set next column
		pop hl
		push hl
		ldcurspi		; load current sprite index into A
		
		ld hl,dogmvltb
		ld e,(hl)		; load number of sprites
		inc a
		cp e			; check index
		jp nz,dogmvlt2	; max not achieved 
		xor a			; else begin from 0
		
dogmvlt2:	
		pop hl
		push hl
		scurspi
		
		pop hl
		snewspa2 dogmvltb
			
		ret
						
dogmvlt3:				; change direction
		pop hl
		ld a,dirrt
		ld de,dogtnrtb
		call dogchdir
		ret

; ----	dog changes direction
; args: 
;		HL - address of the object's control block
;		DE - sprite tab
;		A  - direction
;
dogchdir:
		push hl	
		
		ld bc,oddir
		add hl,bc
		ld (hl),a		; save new direction
				
		ex de,hl
		inc hl
		load_de_hl		; read sprite address in DE

		pop hl
		push hl
		scurspr			; set new sprite address
		
		pop hl			
		push hl
		xor a
		scurspi			; set new sprite index
		
		pop hl
		scurst dogtrn
		ret
		
; ----	dog is turning back
; args: 
;		HL - address of the object's control block
dogturn:
		push hl
		ldcurspi		; load current sprite index
		or a
		jp nz,dogturn3  ; finished, switch to moving state
				
		pop hl
		push hl
		lddir
		
		cp dirrt
		jp nz,dogturn2		; if not right dir - go to set left 
		
		pop hl				; set next sprite for right direction
		push hl
		ldcurspi			; load sprite index
		inc a
		pop hl
		push hl
		snewspa2 dogtnrtb
		pop hl
		scurspi
		
		ret
		
dogturn2:					; set next sprite for left direction
		pop hl
		push hl
		ldcurspi				; load sprite index
		inc a
		pop hl		
		push hl
		snewspa2 dogtnltb
		pop hl
		scurspi
		ret		
				
dogturn3:	
		pop hl
		push hl
		scurst dogmove
		
		pop hl
		push hl
		ld a,DOGSPRN - 1	; set max sprite index to make it to start form the first one		
		xor a
		scurspi
		
		pop hl
		push hl
		lddir
		
		pop hl
		cp dirrt
		jp nz,dogturn_
				
		call dogmvrt
		ret
		
dogturn_:		
		call dogmvlt
		ret
		
		
		
; ----	check if dog is biting saboteur
; args: 
;		HL - address of the object's control block
;
dogbite:				
		push hl
		
		call dogbitev		
		pop hl		
		or a
		ret z						; return if no vertical crossing
		
dogbite1:		
		push hl
		ldcurspr					; load sprite address		
		ex de,hl
		inc hl
		ld d,(hl)					; load width
				
		pop hl
		push hl
		ldcursc						; load dog's column
		ld e,a
		add d
		dec a
		ld d,a						; E - left column, D - right column
				
		push de
				
		ld a,(sbctrlb + odcursc)
		ld e,a						; save saboteur column
					
		ld hl,(sbctrlb + odcursp)	; load sprite address
		inc hl
		ld a,(hl)					; and sprite width
		add e
		dec a
		ld d,a						; E - left column, D - right column
		
		pop bc		
		pop hl
		
		push de						; saboteur data
		push bc						; dog data
				
		lddir						; load direction
		
					; ----------- do check 
		pop bc
		pop de
		
		cp dirrt					
		jp nz,dogbite2
									; check right direction (right column)
		ld a,b						; if right dog column is
		cp e						; less than left saboteur column
		jp c,dogbite_				; then no hit (B < E)
		
		ld a,d						; if right saboteur column is
		cp b						; less than right dog column
		jp c,dogbite_				; then no hit (D < B)
		
		jp dogbites
		
dogbite2:							; check left direction		
		ld a,d						; if right saboteur column is
		cp c						; less than left dog column
		jp c,dogbite_				; than no hit (D < C)
		
		ld a,c						; if left dog column is
		cp e						; less than left saboteur column
		jp c,dogbite_				; than no hit (C < E)
		
dogbites:
		ld a,HLDOGHIT				; set health hit
		call hldec

dogbite_:
		ret
		
		
; ----	check if dog is on the same level with saboteur
; args: 
;		HL - address of the object's control block
;
; result:
;		A - 0 if not on the same level
;
dogbitev:				
		push hl
		ldcurspr					; load sprite address		
		ex de,hl
		dec hl						; move to width
		dec hl						; skip width
		ld a,(hl)					; load height
		ld d,a						; number of rows	
		
		pop hl
		ldcursr						; load dog's row
		ld e,a
		add d				
		dec a
		ld d,a						; dog: E - top row, D - bottom row
								
		ld a,(sbctrlb + odcursr)
		ld c,a						; save saboteur top row
					
		ld hl,(sbctrlb + odcursp)	; load sprite address		
		dec hl						; move to width
		dec hl						; skip width		
		ld a,(hl)					; load sprite height
		add c
		dec a
		ld b,a						; saboteur: C - top row, B - bottom row
				
					; ----------- do check 
		ld a,d						; if bottom dog row is
		cp c						; less than top saboteur row
		jp c,dogbitv_				; then no hit (D < C)

		ld a,b						; if bottom saboteur row is
		cp e						; less than top dog row
		jp c,dogbitv_				; then no hit (B < E)
		
		ld a,1
		ret
		
dogbitv_:
		xor a			; no hit		
		ret		