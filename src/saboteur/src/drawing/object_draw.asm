

; ----  copies current state to the previous
; args: HL - address of the object's control block
copystat:	
		inc hl				; skip object type
		
		ld (hl),0			; reset draw flag
		inc hl
		
		
		inc hl
		inc hl				; skip direction		
		push hl				
		inc hl
		inc hl		
		load_de_hl			; load address of the current position		
		
		pop hl
		ld (hl),e
		inc hl
		ld (hl),d		
		
		ret

; ----	clears object in the screen buffer
; args: HL - address of the object's control block
clrobjsb:
		push hl				; save control block address
		ldprevp				; load previous position
		ex de,hl
		
		ld de,SABCLR
		call putspr
		pop hl		
		ret

; ----	draws object
; args: HL - address of the object's control block
drawobj:
		push hl				; save control block address
		
		ldcurp				; load address of the current position
		push de
		load_de_hl			; load address of the current sprite
		pop hl				; restore address of the current position
		
		call putspr			; put sprite to screen buffer
		
		pop hl
		call copystat
		
		ret
