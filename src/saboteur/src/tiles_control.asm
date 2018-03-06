; ----- clears tile map
;
clrtilem:
		ld hl,tilemap
		ld bc,TILMAPLN
		ld e,0
		
ctilm1:
		ld (hl),e
		dec bc
		ld a,b
		or c
		ret z
		
		inc hl
		jp ctilm1
		
; ----- saves current tile map
;		makes a copy of low half byte (current state) into hi half byte (old state)
;		
savetilm:
		ld hl,tilemap
		ld bc,TILMAPLN
		
stilm1:
		ld a,(hl)		; load byte
		
		rla				; shift to hi half byte - old state
		rla				
		rla
		rla
		
		and 0F0h		; clear current state
		
		ld (hl),a		; save byte
		
		dec bc
		ld a,b
		or c
		ret z
		
		inc hl
		jp stilm1

; ----- updates tile map for sprite
;		
; args: 
;		HL - address of the object's control block
;		DE - address of the sprite

updtilem:	
		push de
		ldcursc			; A - current sprite column		
		ld e,a
		ld d,0
		inc hl
		ld a,(hl)		; A - current row	
		
		ld hl,COLNUM
		call multpl		; HL - displacement of the tile of current row
		add hl,de		; HL - displacement of column 		
		
		ld de,tilemap
		ex de,hl
		add hl,de		; HL - address of the tile 
			
		pop de
		push hl			; save address of the tile
		
		ex de,hl
		inc hl
		ld c,(hl)		; load width
		inc hl
		ld b,(hl)		; load height
		
		ld a,b			; divide height by 8 
		rra			
		rra
		rra 
		and 31			; A - height of sprite in rows
		ld b,a
		ex de,hl
		
		push bc			; save width in C
uptlm1:
		ld a,(hl)		; load tile state
		or 0Fh			; set state
		ld (hl),a
		inc hl
		dec c
		jp nz,uptlm1	; next column
		
		dec b
		jp z,uptlm_		; end
		ld a,b			; save B counter
		pop bc 			; restore C
		ld b,a
		
		pop de			; restore address first tile in the row
		ex de,hl
		ld de,COLNUM
		add hl,de		; next row
		push hl
		
		push bc
		jp uptlm1
		
uptlm_:		
		pop bc			; clear stack
		pop hl
		ret
