

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

; ----	draws object
; args: 
;		HL - address of the object's control block
;
drawobj:
		push hl				; save control block address
		
		ldcurspr			; load address of the current sprite
		pop hl				; restore address of the control block
		push hl
		
		call savsptlm		; save sprite in the tile map
		
		pop hl
		call copystat
		
		ret
