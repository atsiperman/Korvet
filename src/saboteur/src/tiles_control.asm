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
		or a
		jp z,stilm2		; not occupied - continue
		
		rla				; shift to hi half byte - old state

		; ; rla				
		; ; rla
		; ; rla
		
		;; and 0F0h		; clear current state		
		ld (hl),a		; save byte
		
stilm2:
		dec bc
		ld a,b
		or c
		ret z
		
		inc hl
		jp stilm1

; ----- restores tiles which were occupied by sprites
;		
;		
sbuftlc:		; tile counter in screen buffer
		db 0
		
rsttiles:
		ld hl,shadscr
		ld (shcurtl),hl			; init current tile in shadow screen
		ld de,scrbuf			; DE - screen buffer
		
		ld a,COLNUM
		ld (sbuftlc),a
		
		ld hl,tilemap
		ld bc,TILMAPLN
				
rsttile1:
		ld a,(hl)		; load byte
		push hl
		
		ld h,a			; save data byte
				
		and a				; check state
		jp z,rsttile2		; continue if this tile was/is not occupied
		
							; restore background otherwise
		push hl
		ld hl,(shcurtl)
		
		call rstbktl
		
		pop hl
		
rsttile2:	
		
		skip_buf_tile de	; move to the next tile in screen buffer
		
		ld hl,(shcurtl)		; move to the next tile in shadow screen	
		inc hl				; move to attributes byte
		inc hl				; skip tile attributes
		ld (shcurtl),hl
		
		ld a,(sbuftlc)
		dec a
		jp nz,rsttile3
		
		ld a,COLNUM		
		
rsttile3:	
		ld (sbuftlc),a
		
		pop hl
						
		dec bc
		ld a,b
		or c
		ret z
		
		inc hl
		jp rsttile1		
		
; ----- updates tile map for sprite
;		
; args: 
;		HL - address of the object's control block
;		DE - address of the sprite

updobjid:
		db 0			; object type
		
updtilem:			
		push de
		
		; ; ld a,(hl)			
		; ; ld (updobjid),a ; save object type
		
		ldcursc			; A - current sprite column		
		ld e,a
		ld d,0

; ----------------------------
		push de			; save column index

		inc hl
		ld e,(hl)		; A - current row
		
		ld hl, tilemapa	; load address table of tile map	
		add hl, de		
		add hl, de		; pointer to the required row
		ld e,(hl)
		inc hl
		ld d,(hl)		; read address of the row into DE
		ex de,hl		; move it to HL

		pop de			; restore column index
		add hl, de		; move to column address

			
; ----------------------------

		pop de			; pop sprite address
		push hl			; save address of the tile
		
		ex de,hl
		inc hl			; skip color
		ld b,(hl)		; load height
		inc hl
		ld c,(hl)		; load width

		ex de,hl
		
		push bc			; save width in C
		
uptlm1:		
		push bc
		ld a,(hl)		; load tile state		
		or 8			; save 1000 bin
		ld (hl),a
		;;jp uptlm2

		; ; ld b,a			; save state
		; ; and 0Fh			; leave object id
		; ; jp nz,uptlm2	; if occupied, do nothing
		
		; ; 				; free, save obj id				
		; ; ld a,b
		; ; and 0f0h		; leave prev obj id
		; ; ld b,a
		; ; ld a,(updobjid)	; load new obj id
		; ; or b
		; ; ld (hl),a		
		
;;uptlm2:			
		pop bc
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
