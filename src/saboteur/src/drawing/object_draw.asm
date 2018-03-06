

; ----  copies current state to the previous
; args: HL - address of the object's control block
copystat:	
		push hl
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
							; save to previous position		
		ld (hl),e
		inc hl
		ld (hl),d		
		
		pop hl
		push hl
		
		ldcurspr			; load current sprite address
		pop hl
		sprvsp				; save as previous sprite address
		ret

; ----	reads address of the object in the screen buffer
; args: 
;		HL - address of the object's control block
;
; result:
;		DE - address(position) in the screen buffer
;		
rdsprpos:
		push hl
		ldcursr			; load current row index
		add a,a			; make address displacement
		ld c,a
		ld b,0
		ld hl,bufrows
		add hl,bc		; pointer to row address
		load_de_hl
		pop hl
		
		ldcursc 
		ex de,hl
		ld c,a
		ld b,0
		add hl,bc
		ex de,hl
		
		ret
		
; ----	clears object in the screen buffer
; args: HL - address of the object's control block
;
clrobjsb:
		push hl				; save control block address
		
		ldprvsp				; load previous sprite address
		ex de,hl
		
		inc hl				; skip color
		ld c,(hl)			; load width 
		inc hl
		ld b,(hl)			; load height
								
		pop hl	
		push bc
		
		ldprevp				; load previous position
		ex de,hl
		
		pop bc
		
		call clrspr
		ret

; ----	draws object
; args: HL - address of the object's control block
drawobj:
		push hl				; save control block address		
		call rdsprpos		; load address of the current position into DE	
		pop hl
		
		push hl
		scurp		
		pop hl
		
		push hl
		
		push de
		ldcurspr			; load address of the current sprite
		pop hl				; restore address of the current position
		push de				; save sprite address
		
		call putspr			; put sprite to screen buffer
		
		pop de				; restore sprite address
		pop hl				; restore object control block
		push hl
		
		call updtilem		; update tile map
		
		pop hl
		call copystat
		
		ret
