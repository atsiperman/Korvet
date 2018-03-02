; ---- fills memory with byte
; args: 
;		HL - memory address to write
;		BC - length
; 		E  - byte to write
fillmem:
		ld (hl),e
		inc hl
        dec bc
        ld a,b
        or c
        jp nz,fillmem
		ret
		
; ---- copies bytes from one region to another
; args: 
;		HL - source
; 		DE - destination
;		BC - length
copymem:
		ld a,(hl)
		ld (de),a
		inc hl
		inc de
        dec bc
        ld a,b
        or c
        jp nz,copymem
		ret		

; ---- multiplies two numbers
; args: 
;		HL - multiplicand
; 		A - multiplier
; result:
;		HL - result
;
multpl:	
		ld b,h
		ld c,l
		ld hl,0
		
		or a			; return 0 if multiplier is 0
		ret z
		
multpl2:		
		add hl,bc
		dec a		
		ret z
		jp multpl2
		
		