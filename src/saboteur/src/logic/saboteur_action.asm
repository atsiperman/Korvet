;
;	this file contains logic of actions saboteur does when fighting  
;

;
;	saboteur is squatting	
;
sbdosquat:
		sbscurst sbsquat	; set new state
		
		sblcursp			; load old sprite
		dec de 				; move to width
		dec de				; skip width		
		ld a,(de)			; old sprite height		
		
		ld hl,sabsqtrt - 2	; new sprite, skip width
		ld b,(hl)			; new sprite height
		cp b
		jp c,sbdsqt2		; if old h < new h
		sub b				; new h (in B) < old h (in A)
		
		jp sbdsqt3		
		
sbdsqt2:					; old h < new h
		ld c,a				
		ld a,b				
		sub c						
		
sbdsqt3:
		;;call dvd8 			; convert difference to rows
		ld b,a
				
		ld hl,sbctrlb + odcursr
		ld b,(hl)			; load row
		add b				; add to increment		
		ld (hl),a			; save new row

		ld de,sabsqtrt		; set new sprite 
		sbscursp		

		sblddir
		cp dirlt
		jp nz,sbdsqt4

		ret
		
sbdsqt4:
		ld hl,sbctrlb + odcursc
		ld a,(hl)			; load column
		inc a
		ld (hl),a
		
		ret

;
;	saboteur starts kicking
;		
sbstkick:
		sblddir
		cp dirrt
		jp nz,sbstkck1
							; kick in right direction
		ld hl,sabkckrb + 1
		jp sbstkcke
		
sbstkck1:		
		sblcursc			; correct X position when kicking in left direction, move sprite to the right
		inc a
		sbscursc
		ld hl,sabkcklb + 1
		
sbstkcke:		
		load_de_hl
		sbscursp			; set first sprite		
		xor a	
		sbscursi			; set sprite index
		sbscurst sbkick		; set new state		
		
		sblcursr			; move him up to show the jump
		dec a
		sbscursr
		ret		
		

;
;	saboteur is kicking
;				
sbdokick:
		ld a,(sabkckrb)		; load number of sprites		
		ld c,a				; save in C
		
		sblcursi			; load sprite index
		inc a
		cp c
		jp z,sbdokcke		; last sprite, stop kicking

		sbscursi			; set next sprite index
		
		ld c,a				; save sprite index
		sblddir				; load direction
		cp dirrt
		jp nz,sbdokck1		; left direction
		
		ld a,c
		ld hl,sbctrlb + odcursp	
		snewspa sabkckrb			; set address of the next sprite (index in A)

		ld c,a				; save sprite index
		cp SBKCKI2			; back to initial position
		jp z,sbdokck3		; correct X position
		cp SBKCKI1
		jp z,sbdokck2		; phase change, correct X position
		ret
		
sbdokck1:
		ld a,c
		ld hl,sbctrlb + odcursp	
		snewspa sabkcklb			; set address of the next sprite (index in A)
		
		ld c,a				; save sprite index
		cp SBKCKI1
		jp z,sbdokck4		; correct X position when first phase is changed		
		cp SBKCKI2			; back to initial position
		jp z,sbdokck5		; correct X position
		ret

sbdokck2:		
		sblcursc			; correct X position, move sprite to the left
		dec a
		sbscursc
		ret
		
sbdokck3:		
		sblcursc			; correct X position, move sprite to the right
		inc a
		sbscursc
		ret

sbdokck4:
		sblcursc			; correct X position, move sprite to the left on two columns
		dec a
		dec a
		sbscursc
		ret

sbdokck5:
		sblcursc			; correct X position, move sprite to the left on two columns
		inc a
		inc a
		sbscursc
		ret
		
sbdokcke:	
		sblcursr			; move him down after jump
		inc a
		sbscursr
		call sbstopst		; stop and stay
		
		sblddir				; load direction
		cp dirrt
		ret z
		jp sbdokck2			; go to initial column
	