; ----- clears screen buffer
clrsbuf:
		xor a				
		ld e,a
		ld hl,scrbuf
		ld bc,BUFLEN
		call fillmem
		ret

; ----- puts sprite on the screen buffer
; args: 
;		hl - address on the screen
;		de - address of the sprite
putspr:
		ex de,hl
				
		inc hl			; skip color
		ld c,(hl)		; sprite width
		inc hl
		ld b,(hl)		; sprite height
		ex de,hl
		push bc		
		
putspr1:
		inc de
		ld a,(de)
		ld (hl),a
		inc hl
		dec c
		jp nz,putspr1
		
		dec b
		jp z,putspr_
		
		ld a,b			; save counter B in A
		pop bc			; restore counter in C
		ld b,a			; restore counter B
		push bc			; save new counters
		
		push de			; move to the next screen line
		ld a,COLNUM		
		sub c			; restore initial X position
		ld d,0
		ld e,a
		add hl,de		; get address of the next line
		pop de
		
		jp putspr1
		
putspr_:
		pop bc			; clear stack
		ret
		
; ----- copies screen buffer to video memory
; 
showscr:
		;ld hl,COLRREG				; set color to clear		
		;ld (hl), ((7 & ~CMAIN) << 1) + 1	; set main color
		
		ld hl,SCRADDR
		ld de,scrbuf		
		ld bc,((ROWNUM*8) << 8) | COLNUM ; set counters
		
		;jp showscr1
		
showscr1:
		ld a,(de)		
		push de
		push hl			
		pop de
		
		ld hl,COLRREG				; set color to clear		
		ld (hl), (7 & ~CMAIN) << 1
		
		ex de,hl		; HL - screen address
		cpl
		ld (hl),a		; clear byte
		ex de,hl		; HL - color reg	
		
		ld (hl), ((7 & ~CMAIN) << 1) + 1	; set main color
		ex de,hl		; HL - screen address
		
		pop de
						
		cpl
		ld (hl),a		; move data byte
		
		inc hl
		inc de
		
		dec c
		jp nz,showscr1 	; continue column cycle
		
		dec b
		ret z			; finish
		
		ld c,COLNUM
		
		push bc			; move to the next video line
		ld bc,64 - COLNUM
		add hl,bc
		pop bc
		
		jp showscr1