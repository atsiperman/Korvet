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
				
		cp dogtrn
		jp nz,dogact2	; dog is moving
		
		call dogturn	; dog is turning
		ret				
						
dogact2:		
		push hl
		lddir			; load direction		
				
		pop hl
		cp dirrt
		jp nz,dogact3	; move left
		call dogmvrt	; else move right
		ret
dogact3:		
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
		inc a
		scurspi
		
		pop hl
		push hl
		lddir
		
		cp dirrt
		jp nz,dogturn2		; if not right dir - go to set left 
		
		pop hl				; set next sprite for right direction
		push hl
		ldcurspi			; load sprite index
		pop hl
		snewspa2 dogtnrtb
		ret
		
dogturn2:					; set next sprite for left direction
		pop hl
		push hl
		ldcurspi				; load sprite index
		pop hl		
		snewspa2 dogtnltb
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
		
		
		
		