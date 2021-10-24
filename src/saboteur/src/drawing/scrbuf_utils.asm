

; ----- puts sprite on the screen buffer
;		
; args: 
;		hl - address on the screen buffer
;		de - address of the sprite
;
_putsp_x: dw 0			; start X address of the last row

putspr:
 		ld (_putsp_x),hl	; save start address of the first row

		ex de,hl        ; sprite address in HL

        dec hl          ; move to width
        ld c,(hl)		; sprite width
        inc hl

		inc hl			; skip color
		inc hl
		ld b,(hl)		; sprite height
		inc hl
		ex de,hl		; DE - pointer to sprite data
		
		push bc		
		
putspr1:
		push bc

        inc hl              ; skip attributes

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
		
		ld a,b			; save counter B in A
		pop bc			; restore counter in C
		ld b,a			; restore counter B
		push bc			; save new counters

		push de			; save pointer to sprite data
		ld hl,(_putsp_x)	; restore initial X position
		ld de, ROWWIDB
		add hl,de			; get address of the next row in screen buffer
		ld (_putsp_x),hl	; save it
		pop de
		
		jp putspr1
		
putspr_:
		pop bc			; clear stack
		ret

				
; ----- copies screen buffer to video memory
; 
showscr:		
		ld hl,SCRADDR
		ld (curtile),hl			; init address of the current tile in video memory
		
		ld hl,tilemap		
		ld de,scrbuf
		ld bc,(ROWNUM << 8) + COLNUM
		
		push bc
		
showsc1:			
		ld a,(hl)
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
		inc hl					; next tile in tile map
		
		push hl
		ld hl,(shcurtl)			; move to the next column in screen map
		inc hl
		ld (shcurtl),hl
		pop hl

		dup 9
			inc de					; move to the next column in buffer	
		edup

		dec c
		jp z, showsc3			; next row
		
		push hl
		
		ld hl,(curtile)			; move to the next column in video memory
		inc hl
		ld (curtile),hl
		
		pop hl		
		
		jp showsc1
		
showsc3:		
		dec b
		jp z,showsc_			; end
		
		ld a,b					; save B counter
		pop bc					; restore C counter
		ld b,a
		push bc					; save new counters
				
		push hl
		
		ld bc,64*8 - COLNUM + 1
		ld hl,(curtile)			; move to the next row in video memory		
		add hl,bc
		ld (curtile),hl
				
		pop hl
		pop bc
		push bc
		jp showsc1
		
showsc_:
		pop bc 					; clear stack
		ret
; ------ end of	showscr
		
		
; ----	copy tile to video memory
; args: 
;		DE - source address in screen buffer
;

copytile:
		ld hl,(curtile)				; address of current tile in video memory
				
		inc de		; skip attributes

		dup 8
			ld a,(de)					; load data byte
			
			push de						; save address in screen buffer
			ex de, hl					; save video address in DE
			
			ld hl,COLRREG				; 
			ld (hl), ((7 & ~CMAIN) << 1) + 1	; set main color
			
			ex de,hl					; HL - screen address

			ld (hl),a					; set data bits
					
			ex de,hl					; HL - color reg
			
			ld (hl), ((7 & ~CMAIN) << 1)	; set color to clear		
			ex de,hl					; HL - screen address			
			cpl							; get bits to clear
			ld (hl),a					; move data byte
			
			pop de						; restore address in buffer
					
			ld bc,64
			add hl,bc					; move to the next video line
			inc de
		edup

		ret
		
		
; ----- restores background tile in screen buffer
; args: HL - address of the tile in shadow screen model
;       DE - address in screen buffer
;		
rstbktl:
        push hl         ; tile in shadow screen
        push de         ; screen buffer address
        push bc         

        ld b,0
        ld c,(hl)
        ld hl,BKSPRTAB
        add hl,bc
        add hl,bc       ; pointer to sprite's address
		
        push de         ; save screen address
        ld e,(hl)
        inc hl
        ld d,(hl)		; back tile image address in DE
		
		inc de			; skip back color		
		inc de			; skip foreground color
		inc de			; skip header
		
        pop hl          ; restore screen address in HL
		inc hl			; skip attributes
		
		dup 8
			ld a,(de)		; load data byte	
			cpl 			; get background bits
			ld (hl),a		
			inc de
			inc hl
		edup
		
		pop bc
		pop de
		pop hl
		
		ret			
		