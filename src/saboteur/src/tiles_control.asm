
; ----- saves current tile map
;		makes a copy of low half byte (current state) into hi half byte (old state)
;		
savetilm:
		ld hl,scrbuf + 2	; address of the first tile's state
		ld bc,TILMAPLN
		ld de,COLWIDB
				
stilm1:
		ld a,(hl)		; load byte
		or a
		jp z,stilm2		; not occupied - continue
		
		rla				; shift to hi half byte - old state
		and 10000b		; clear current state
		ld (hl),a		; save byte
		
stilm2:
		dec bc
		ld a,b
		or c
		ret z
		
		add hl,de
		jp stilm1

; ----- restores tiles which were occupied by sprites
;		
;		
rsttiles:
		ld hl,scrbuf	
		ld bc,TILMAPLN
		
		ld a,COLNUM
				
rsttile1:
		ld e,(hl)		; load sprite address
		inc hl
		ld d,(hl)
		inc hl			; move to tile state

		ld a,(hl)		; load tile state				
		inc hl			; move to attributes
		inc hl 			; move to data

		and a				; check state
		jp z,rsttile2		; continue if this tile was/is not occupied
		
		call rstbktl		; restore background otherwise
		
rsttile2:			
		skip_buf_tile_data hl	; move to the next tile in screen buffer
		
		dec bc
		ld a,b
		or c
		ret z
		
		jp rsttile1		
		
; ----- updates tile map for sprite
;		
; args: 
;		HL - address of the object's control block
;		DE - address of the sprite
		
updtilem:			
		push de			; save sprite address
		call rdsprpos		
		ex de,hl		; address of current position in screen buffer in HL
		inc hl		
		inc hl			; move to tile state
		pop de			; pop sprite address

		push hl			; save address of the tile state
		
		ex de,hl		; sprite address in HL
		inc hl			; skip color
		ld b,(hl)		; load height
		inc hl
		ld c,(hl)		; load width

		ex de,hl		; tile pointer in HL
		
		push bc			; save width in C
		
uptlm1:		
		ld a,1000b		; mark as occupied
		ld (hl),a

		skip_buf_tile hl	; move to the next tile
		dec c
		jp nz,uptlm1	; next column
		
		dec b
		jp z,uptlm_		; end
		ld a,b			; save B counter
		pop bc 			; restore C
		ld b,a
		
		pop de			; restore address first tile in the row
		ex de,hl
		ld de,ROWWIDB
		add hl,de		; next row
		push hl
		
		push bc
		jp uptlm1
		
uptlm_:		
		pop bc			; clear stack
		pop hl
		ret
