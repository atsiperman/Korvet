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
		
		ld d,b			; save counter B in A
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
putspr:
		ex de,hl
				
		inc hl			; skip color
		ld c,(hl)		; sprite width
		inc hl
		ld b,(hl)		; sprite height
		ex de,hl		; DE - pointer to sprite data
		
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
		
		call copytile
		
		pop bc
		pop de
		pop hl
		
showsc2:
		inc hl					; next tile in map
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
				
		dup 8
		
		ld a,(de)					; load data byte
		
		push de
		ex de, hl					; save video address in DE
		
		ld hl,COLRREG				; set color to clear		
		ld (hl), (7 & ~CMAIN) << 1
		
		ex de,hl					; HL - screen address
		cpl
		ld (hl),a					; clear byte
				
		ex de,hl					; HL - color reg
		
		ld (hl), ((7 & ~CMAIN) << 1) + 1	; set main color
		ex de,hl					; HL - screen address		
		
		cpl
		ld (hl),a					; move data byte
		
		pop de						; restore address in buffer
				
		ld bc,64
		add hl,bc					; move to the next video line
		ex de,hl

		ld bc,COLNUM				; move to the next line in buffer
		add hl,bc					
		ex de,hl

		edup
		
		ret
; ------ end of copytile






