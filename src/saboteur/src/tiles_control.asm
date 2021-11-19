
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
		or a			; check state
		jp z,rsttile2	; continue if this tile was/is not occupied

		inc hl			; move to attributes
		ld a,(hl)
		inc hl 			; move to data
		and stotile		; is static object ?
		jp nz,rsttile3  ; if yes then do not restore background

		call rstbktl	; restore background otherwise
		jp rsttile3
		
rsttile2:
		inc hl			; move to attributes
		inc hl 			; move to data

rsttile3:
		skip_buf_tile_data hl	; move to the next tile in screen buffer
		
		dec bc
		ld a,b
		or c
		ret z
		
		jp rsttile1		
		

		define CHECK_MASKED_OBJTYPE	1		

; ----- updates tile map for sprite
;		
; args: 
;		HL - address of the object's control block
;		DE - address of the sprite
_objtyp:
		db 0			; object type		
updtilem:			
	if CHECK_MASKED_OBJTYPE
		ld a,(fstrendr)
		or a
		jp z,uptlm11_

		push hl
		ld hl,uptlm2_		
		ld (hl),0
		inc hl		
		ld (hl),0
		inc hl		
		ld (hl),0
		pop hl
		jp uptlm12_

uptlm11_:
		push hl
		ld hl,uptlm2_		
		ld (hl),0C3h
		inc hl		
		ld (hl),LOW uptlm3
		inc hl		
		ld (hl),HIGH uptlm3
		pop hl

		ld a,(hl)		; load object type
		ld (_objtyp),a	; save object type
	endif

uptlm12_:
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

	if CHECK_MASKED_OBJTYPE

		ld a,(_objtyp)
		cp ostobj
		jp nz,uptlm2	; not an object with mask, keep going

		ld a,(hl)
		and 0F0h
		jp nz,uptlm3	; has been occupied, will be cleared, do not mark as occupied

uptlm2_:
		jp uptlm3

uptlm2:
	endif
		ld a,1000b		; mark as occupied
		ld (hl),a

uptlm3:
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
