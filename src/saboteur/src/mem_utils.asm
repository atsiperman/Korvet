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
		
		