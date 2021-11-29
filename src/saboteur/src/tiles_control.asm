
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
		ld de,ROWWIDB

		push bc			; save width in C
		
uptlm1:	
		ld a,1000b		; mark as occupied

uptlm2:		
		ld (hl),a

uptlm3:
		skip_buf_tile hl	; move to the next tile
		dec c
		jp nz,uptlm2	; next column
		
		dec b
		jp z,uptlm_		; end
		ld a,b			; save B counter
		pop bc 			; restore C
		ld b,a
		
		pop hl			; restore address first tile in the row
		add hl,de		; next row
		push hl
		
		push bc
		jp uptlm1
		
uptlm_:		
		pop bc			; clear stack
		pop hl
		ret


; ----- updates tile map for masked object
;		
; args: 
;		HL - object control block
;		
utlmmobj:			
		ld a,(fstrendr)
		or a
        ret  z

		load_bc_hl		; load pointer in screen buffer into BE
		load_de_hl		; load image address into DE
		ld l,c
		ld h,b			; tile pointer into HL
		inc hl
		inc hl			; move to tile state

		push hl			; save address of the tile state
		
		ex de,hl		; sprite address in HL
		inc hl			; skip color
		ld b,(hl)		; load height
		inc hl
		ld c,(hl)		; load width

		ex de,hl		; tile pointer in HL
		ld de,ROWWIDB

		push bc			; save width in C

.utlmo1:
		ld a,1000b		; mark as occupied
		ld (hl),a

		skip_buf_tile hl	; move to the next tile
		dec c
		jp nz,.utlmo1		; next column
		
		dec b
		jp z,.utlmoe		; end
		ld a,b				; save B counter
		pop bc 				; restore C
		ld b,a
		
		pop hl				; restore address first tile in the row
		add hl,de			; next row
		push hl
		
		push bc
		jp .utlmo1
		
.utlmoe:		
		pop bc				; clear stack
		pop hl
		ret

; ---- update tile map for thrown object
;
utlmtho:
        ld   hl,othrown
        ld   a,(hl)
        or   a
        ret  z                      

        inc  hl
        load_de_hl                  ; load image address into DE
        push de

        ld   d,(hl)                 ; save colnum in D
        inc  hl
        ld   e,(hl)                 ; save rownum in E

        call shscradr               ; get pointer to a tile for thrown object

        dec  hl                     ; move to tile state
		ld   a,1000b		        ; mark as occupied
		ld   (hl),a

        dec  hl
        dec  hl                     ; move to tile start

        pop  de
        call putspr

        ret
