; ----- clears screen buffer
clrsbuf:
		xor a				
		ld e,a
		ld hl,scrbuf
		ld bc,BUFLEN
		call fillmem
		ret

; ----- clears sprite on the screen buffer
;		
; args: 
;		HL - address on the screen
;		BC - height and width of the sprite
clrspr:
		push bc	
clrspr1:
		xor a
		ld (hl),a
		inc hl
		dec c
		jp nz,clrspr1
		
		dec b
		jp z,clrspr_
		
		ld d,b			; save counter B in D
		pop bc			; restore counter in C
		ld b,d			; restore counter B
		push bc			; save new counters
		
		ld a,COLNUM		
		sub c			; restore initial X position
		ld d,0
		ld e,a
		add hl,de		; get address of the next line
		
		jp clrspr1
		
clrspr_:
		pop bc			; clear stack
		ret

; ----- puts sprite on the screen buffer
;		
; args: 
;		hl - address on the screen
;		de - address of the sprite
;
putspr:
		ex de,hl
				
		inc hl			; skip color
		ld c,(hl)		; sprite width
		inc hl
		ld b,(hl)		; sprite height
		ex de,hl		; DE - pointer to sprite data
		
		push bc		
		
putspr1:
		push bc
		inc de
		ld a,(de)		; load byte from sprite
		ld b,(hl)		; load existing data, if any
		or b			; combine them
		ld (hl),a		; save new image
		inc hl
		pop bc
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
		inc hl					; next tile in map
		
		push hl
		ld hl,(shcurtl)			; move to the next column in shadow screen
		inc hl
		ld (shcurtl),hl
		pop hl
		
		dec c
		jp z, showsc3			; next row
		
		push hl
		
		ld hl,(curtile)			; move to the next column in video memory
		inc hl
		ld (curtile),hl
		
		pop hl		
		
		inc de					; move to the next column in buffer	
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
		
		ex de,hl				; move to the next column in buffer	
		ld bc,COLNUM*7 + 1
		add hl,bc
		ex de,hl
		
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
				
		push bc
		
		ld b,8						; tile's height	
		;dup 8
		push bc

cptile2:
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
			ex de,hl

			ld bc,COLNUM				; move to the next line in buffer
			add hl,bc					
			ex de,hl

		pop bc
		dec  b
		jp z, cptile_
		push bc
		jp cptile2
;		edup
		
cptile_:
		pop bc
		ret
; ------ end of copytile

		
		
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
		
        pop hl          ; restore screen address
        ld bc,(8 << 8) + COLNUM		; load B - counter, C - increment in screen buffer
rstbktl2:
		;ld a,255
        ld a,(de)		; load data byte	
		cpl 			; get background bits
		ld (hl),a
		dec b
		jp z,rstbktl_
		
		inc de
		ld a,b			; save counter
		ld b,0
		add hl,bc
		ld b,a			; restore counter
		jp rstbktl2
		
rstbktl_:
		pop bc
		pop de
		pop hl
		
		ret			
		