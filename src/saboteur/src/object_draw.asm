
; ----  copies current state to the previous
; args: HL - address of the object's control block
copystat:	
		inc hl				; skip object type
		
		ld a,(hl)			; copy state
		inc hl
		ld (hl),a
		
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
; args: HL - address of the object's control block
drawobj:
		push hl				; save control block address
		
		inc hl				; skip object type
		ld a,(hl)			; cur state
		inc hl
		ld c,(hl)			; prev state
		cp c		
		jp nz,drawobj1		
		pop hl				; clear stack
		ret
		
drawobj1:		
		inc hl
		inc hl				; skip direction
		
		load_de_hl			; load address of the previous position
		
		push hl		
		
		ld hl,SABCLR		
		ex de,hl
		
		call drawspr		; clear old sprite		
		
		pop hl
		
		load_de_hl			; load address of the current position
		push de
		load_de_hl			; load address of the current sprite
		pop hl		
		
		call drawspr		; hl keeps address of the current position
		
		pop hl
		call copystat
		
		ret
