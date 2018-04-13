;
;	this file contains logic of actions saboteur does when fighting  
;

;
;	saboteur is squatting	
;
sbdosquat:
		sbscurst sbsquat	; set new state
		
		sblcursp			; load old sprite
		inc de				; skip color
		inc de				; skip width		
		ld a,(de)			; old sprite height		
		
		ld hl,sabsquat + 2	; new spite, skip color
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
		call dvd8 			; convert difference to rows
		
		ld hl,sbctrlb + odcursr
		ld b,(hl)			; load row
		add b				; add to increment		
		ld (hl),a			; save new row
		
		ld de,sabsquat		; set new sprite
		sbscursp
			
		ret

;
;	saboteur starts kicking
;		
sbstkick:
		ret
		
		
sbdokick:
		ret
	