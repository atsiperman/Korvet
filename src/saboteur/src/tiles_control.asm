		
; ----- updates tile map
;		marks tiles, cleared on previous frame, as empty 
;		marks tiles, occupied by sprites on the previous frame, as to be cleared
;		
updatetm:
		ld hl,tilemap
		ld bc,TILMAPLN
		
stilm1:
		inc hl			; skip displacement
		inc hl
		ld a,(hl)		; load hi byte
		or a
		jp z,stilm_		; is empty
		
		cp TILECLR		; was marked as to be cleared
		jp z,stilm2		; yes, then mark as empty
				
		ld (hl),TILECLR ; if not marked - then mark to be cleared
		jp stilm_
		
stilm2:		
		xor a 			; mark as empty
		ld (hl),a		
		
stilm_:		
		dec bc
		ld a,b
		or c
		ret z
		
		inc hl		
		jp stilm1

; ----- saves sprite tile mp
;		
; args: 
;		HL - address of the object's control block
;		DE - address of the sprite

		db 0			; sprite width
		db 0			; displacement to the next sprite tile row
		
savsptlm:	
		push de
		
		ldcursc			; A - current sprite column		
		ld e,a
		ld d,0
		inc hl
		ld a,(hl)		; A - current row	
		
		ld hl,TMELSIZE*COLNUM
		call multpl		; HL - displacement of the tile of current row
		ld a,e
		ex de,hl
		ld hl,TMELSIZE	
		call multpl		; HL - displacement of column
		add hl,de		; HL - total displacement of a tile
				
		ld de,tilemap
		add hl,de		; HL - address of the tile 
			
		pop de
		push hl			; save address of the first tile on the sprite map
		
		ex de,hl
		
		inc hl			; skip sprite color
		ld c,(hl)		; load width
		inc hl
		ld b,(hl)		; load height
		inc hl
		
		ex de,hl		
						; HL - tile address
						; DE - sprite address
		ld a,b
		rra				; divide height by 8 		
		rra
		rra 
		and 31			; A - height of sprite in rows
		ld b,a
		
		ld a,c			; save width in a var
		ld (savsptlm - 2),a
						
		rla				; mul width on 8
		rla
		rla 
		and ~7		
		sub c
		
		ld (savsptlm - 1),a	; displacement to the next sprite tile row
		
		push bc			; save width from C		
		
savsptm1:
		inc hl
		inc hl			; move to hi byte
		ld a,(hl)		; load tile 
		
		or a			; check is empty
		jp z,savsptm2		; write data if empty		
		
		cp TILECLR		; check is marked to be cleared
		jp nz,savsptm3	; not a marker - occupied, then continue
		
savsptm2:					; save address of a sprite tile
		dec hl
		dec hl
		ld a,(savsptlm - 2)
		ld (hl),a
		inc hl
		ld (hl),e
		inc hl	
		ld (hl),d		
		
savsptm3:		
		inc hl			; next tile in the map
		
		inc de			; move to the next sprite tile
		
		dec c
		jp nz,savsptm1	; next column
		
		dec b
		jp z,savsptm_		; end
		
		ld a,b			; save B counter
		pop bc 			; restore C
		ld b,a
				
		pop hl			; restore address of the first tile in the map row
		push de			; save sprite tile address
		
		;ex de,hl
		ld de,TMELSIZE*COLNUM
		add hl,de		; first tile on the next row in map
		
		pop de
		push hl					
		
		ld a,(savsptlm - 1)
		ex de,hl
		ld e,a
		ld d,0
		add hl,de		; move to the next tile in sprite
		ex de,hl
		pop hl
		push hl
		
		push bc
		jp savsptm1
		
savsptm_:		
		pop bc			; clear stack
		pop hl
		ret
