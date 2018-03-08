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

		inc de			; pointer to the first sprite address
		ex de,hl
		load_de_hl		; read sprite address in DE
		
		pop hl
		push hl
		scurspr			; set new sprite address
		
		pop hl			
		scurspi			; set new sprite index
		ret
		
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
				
		push hl
		lddir			; load direction		
				
		pop hl
		cp dirrt
		jp nz,dogact2	; move left
		call dogmvrt	; else move right
		ret
dogact2:		
		call dogmvlt	; move left
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
		ld bc,odcursp
		add hl,bc
		snewspa dogmvrtb
			
		ret
						
dogmvrt3:				; change direction
		pop hl
		ld a,dirlt
		ld de,dogmvltb
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
		ld bc,odcursp
		add hl,bc
		snewspa dogmvltb
			
		ret
						
dogmvlt3:				; change direction
		pop hl
		ld a,dirrt
		ld de,dogmvrtb
		call dogchdir
		ret
