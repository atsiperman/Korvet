

; ----- puts sprite on the screen buffer
;		
; args: 
;		HL - address on the screen buffer
;		DE - address of the sprite
;
_putsp_x: dw 0			; start X address of the last row

putspr:
 		ld (_putsp_x),hl	; save start address of the first row

		ex de,hl        ; sprite address in HL

		inc hl			; skip color
		ld b,(hl)		; sprite height
        inc hl
        ld c,(hl)		; sprite width        
		inc hl
		ex de,hl		; DE - pointer to sprite data
		
		push bc		
		
putspr1:
		push bc

        skip_buf_tile_head hl  ; skip attributes

        dup 8
            ld a,(de)		; load mask from sprite
            ld b,(hl)		; load existing data, if any

            and b			; clear points to be occupied by sprite		
            ld b,a			; save background line
            inc de
            ld a,(de)		; load byte from sprite

            or b			; combine with background
            ld (hl),a		; save new image
            inc hl
            inc de
        edup

		pop bc
		dec c
		jp nz,putspr1
		
		dec b
		jp z,putspr_
		
		ld a,b			    ; save counter B in A
		pop bc			    ; restore counter in C
		ld b,a			    ; restore counter B
		push bc			    ; save new counters

		push de			    ; save pointer to sprite data
		ld hl,(_putsp_x)	; restore initial X position
		ld de, ROWWIDB
		add hl,de			; get address of the next row in screen buffer
		ld (_putsp_x),hl	; save it
		pop de
		
		jp putspr1
		
putspr_:
		pop bc			    ; clear stack
		ret

				
; ----- copies screen buffer to video memory
; 
showscr:		
		ld hl,SCRADDR
		ld de,scrbuf + 2				; pointer to tile state
		ld bc,(ROWNUM << 8) + COLNUM
		
		push bc
		
showsc1:			
		ld a,(de)
		or a
		jp z, showsc2			; tile not changed
		
		push hl
		push de
		push bc
		
		call copytile			; copy current tile to video memory
		
		pop bc
		pop de
		pop hl
		
showsc2:
		inc hl					; move to the next column in video memory		
		skip_buf_tile_de 		; move to the next column in screen buffer	
		
		dec c		
		jp nz,showsc1
		
showsc3:						; next row
		dec b
		jp z,showsc_			; end
		
		ld a,b					; save B counter
		pop bc					; restore C counter
		ld b,a
		push bc					; save new counters
				
		ld bc,64*8 - COLNUM 	; move to the next row in video memory		
		add hl,bc

		pop bc
		push bc
		jp showsc1
		
showsc_:
		pop bc 					; clear stack
		ret
; ------ end of	showscr
		
		
; ----	copy tile to video memory
; args: 
;		HL - address in video memory
;		DE - source address in screen buffer pointing to tile state
;

copytile:
		inc de				; move to attributes
		ld a,(de)			; load attributes
		and fgtile
		jp z,_cpytil1		; copy if tile is not foreground
		dec de				; restore address in DE, to get it shifted outside
		ret

_cpytil1:
		inc de				; move to data base

		dup 8
			ld b,((7 & ~CMAIN) << 1) + 1	; save main color in B
			ld a,(de)					; load data byte
			
			push de						; save address in screen buffer
			ex de, hl					; save video address in DE
			
			ld hl,COLRREG				; 
			ld (hl), b					; set main color
						
			ld (de),a					; set data bits					
			dec b						; set color to clear		
			ld (hl),b					
			cpl							; get bits to clear
			ld (de),a					; move data byte
			
			ex de,hl					; HL - screen address
			pop de						; restore address in buffer
					
			ld bc,64
			add hl,bc					; move to the next video line
			inc de
		edup

		ret
		
		
; ----- restores background tile in screen buffer
; args: 
;       HL - address of the first data byte in screen buffer
;		DE - address of the tile's sprite 		
;
rstbktl:
        push hl         ; screen buffer address
        push bc         

        ld  a,(de)        
		inc de			; skip back color		
		inc de			; skip foreground color
		inc de			; skip sprite attributes

        cp  DEFBLCK
        jp  nz,.rstbk1  ; clear data for a tile if its background is not black 

                        ; restore background for regular sprite
		dup 8
			ld a,(de)		; load data byte	
			cpl 			; get background bits
			ld (hl),a		
			inc de
			inc hl
		edup
		
		pop bc
		pop hl

        ret 

.rstbk1:
        xor a           
        dup 8
			ld (hl),a		
			inc hl
        edup

		pop bc
		pop hl

		ret			
		