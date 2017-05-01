

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
		
							; move object right
		ld de,odcurp
		add hl,de
		push hl				; address of the current pos
		load_de_hl
		inc de				; increase position
		pop hl				
		savem_hl_de			; save new position		
		
							; change sprite
		pop hl
		push hl
		ld de,odcursi		
		add hl,de
		ld (hl),0			; first sprite

		ld hl,sbmvrttb + 1	; skip header
		load_de_hl			; address of the first sprite		
		
		pop	hl
		push hl
		ld bc,odcursp
		add hl,bc
		savem_hl_de			; save sprite address		
				
		jp sbstmve
		
sbstmv1:				
							; check left dir
		ld a,dirlt
		cp c
		jp nz,sbstmv2
		
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

; ---- continue moving
; args: 
;		C  - direction to move
;			
sbdomove:
		ld hl,sbctrlb
		push hl		
		lddir			; load direction to A
		
		cp dirrt
		jp nz,esbdomov	
						; moving right
		pop hl
		push hl
		ldcurp
		inc de
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
		jp nz,sbdomov1
		ld a,0
		
sbdomov1:
		pop hl
		push hl		
		scurspi

		ld hl,sbmvrttb + 1	; sprite table
		ld b,0
		ld c,a
		add hl,bc
		add hl,bc			; 
		load_de_hl			; load sprite address
		
		pop hl				; save new sprite addr
		push hl
		scurspr				
		jp esbdomov	
		
esbdomov:
		pop hl
		push hl
		sdrawf 1
		pop hl		

		ret
;
; ----	end of sbdomove:
;

