; ----	implements logic of dog object
; args: 
;		DE - address of the object's control block
;		
dogact:
		ex de,hl

		push hl		
		ldstate 		; load state
		pop hl
		
		cp sbdead
		ret z			; dead - do nothing
				
		cp dogtrn
		jp nz,dogact2	; dog is moving
		
		push hl
		call dogturn	; dog is turning
		pop	hl
		
		jp dogact_
						
dogact2:				
		push hl
		lddir			; load direction						
		pop hl
		
		cp dirrt
		jp nz,dogact3	; move left
		push hl
		call dogmvrt	; else move right
		pop	hl

		jp dogact_
		
dogact3:		
		push hl
		call dogmvlt	; move left
		pop	hl
		
dogact_:		
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
		inc hl						; skip color
		inc	hl						; skip height
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
		inc hl						; skip color
		inc	hl						; skip height
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
		ret c						; then no hit (B < E)
		
		ld a,d						; if right saboteur column is
		cp b						; less than right dog column
		ret c						; then no hit (D < B)
		
		jp dogbites
		
dogbite2:							; check left direction		
		ld a,d						; if right saboteur column is
		cp c						; less than left dog column
		ret c						; than no hit (D < C)
		
		ld a,c						; if left dog column is
		cp e						; less than left saboteur column
		ret c						; than no hit (C < E)
		
dogbites:
		ld a,HLDOGHIT				; set health hit
		jp hldec
		
		
; ----	makes a test whether dog's head crosses saboteur vertical axis
; args: 
;		HL - address of the object's control block
;
; result:
;		A - 0 if not on the same level
;
dogbitev:				
		ldcursr						; load dog's row
		ld e,a						; save it in E		
		inc e						; inc row since visible dog height is less than sprite height

		sblcursr					; get saboteur's top row
		ld c,a						; save it in C
					
		ld hl,(sbctrlb + odcursp)   ; load sprite address		
		inc hl						; skip color
		ld a,(hl)					; load sprite height
		inc	a						; increase by half of head height to get feet level
		add c						; add to row
		ld	d,a						; save bottom row in D
				
		cp e						; if dog row is below saboteur's feet
		jp c,dogbitv_				; then no hit (D < C)
		
		ld a,e						; move dog's row into A
		cp c						; test against saboteur's top row
		jp c,dogbitv_				; if saboteur's head is below dog's head then no hit
		
		inc	a
		ret
		
dogbitv_:
		xor a			; no hit		
		ret		