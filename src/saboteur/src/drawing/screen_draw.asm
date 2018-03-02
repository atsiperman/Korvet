

; ----- checks if screen has changed
; result: A - 0 if not changed, 
scrchngd:
		ld hl,(curscr)
		ex de,hl
		ld hl,(prevscr)
		ld a,l
		cp e
		jp nz,scrchng2
		ld a,h
		cp d
		jp nz,scrchng2
		ld a,0
		ret
scrchng2:	
		ld a,1
		ret

decmcnt:
		db 0		; counter of bytes in compressed screen
		

; ------ puts byte into shadow screen
; args: 
;		A  - index of a sprite in the local sprite table
;		HL - address of the local sprite table
;		DE - current address in the shadow screen
		macro putbsc_

		and 15				; index of the first sprite in A
		push hl
		push de
		ld d,0
		ld e,a
		ld h,b				; screen address		
		ld l,c				; from bc to hl
		add hl,de			; add index of sprite
		ld a,(hl)			; index of sprite in global table
		
		pop de
		ex de,hl
		ld (hl),a			; write it to the shadow screen
		ex de,hl
		pop hl				; restore pointer to the next byte
		
		endm
		
; ----- decompresses current screen into shadow area
; 
decmrscr:		
		ld hl,(curscr)		; pointer to screen control block
				
		load_de_hl			; load address of the current screen
		ex de,hl

		ld d,0
		ld e,(hl)			; length of local sprite map		
		inc hl
		push hl
		pop	bc				; keep screen address in BC as pointer to local sprite map		
		
		add hl,de			; now hl points to the first sprite's index
		
		ld de,shadscr		; pointer to the shadow screen	
		
decmprs1:
		ld a,(hl)			; load compressed byte into A			
		cp SCREND
		ret z				; marker of the end 
		
		and LINELEN			; clear low bits
		cp LINELEN			; is line length ?
		jp nz, decmprs2		; no, start writing data
		
		ld a,(hl)			; yes, reload line length
		and 15				; leave counter only
		push af				; and save
		
		inc hl				; move to data byte
		jp decmprs3
		
decmprs2:
		ld a,1				; set counter to 1
		push af
		ld a,(hl)			; reload data byte
		
decmprs3:		
		ld a,(hl)

		rra
		rra
		rra
		rra		
		
		putbsc_
		
		inc de				; next byte of shadow screen

		ld a,(hl)			; restore compressed byte		
		
		putbsc_

		inc de				; next byte in shadow screen

		pop af				; restore counter
		dec a				
		jp z, decmprs4		; end, continue global cycle
		
		push af				; continue line
		jp decmprs3			

decmprs4:
		inc hl				; move to the next data byte
		jp decmprs1			; continue
		

; ----- removes objects from screen buffer
;
rmobjsb:
		ld hl,sbctrlb
		call clrobjsb
		ret
		
; ----- draws current screen	
;
drawscr:
		call scrchngd		; screen changed ?
		and a		
		jp z,drawobjs		; do not draw if no
		
		ld a,80h
		call clrwscr
		
		call decmrscr
		
		ld de,shadscr		; address of the shadow screen
        call drawbkgr		; draw background

		ld hl,(curscr)		; save current screen as previous
		ld (prevscr),hl		
		
		call clrtilem		; clear tile map
		
		jp drawobj1			; skip saving old tile map
		
drawobjs:					; draw all objects
		call savetilm
		
drawobj1:					
		call rmobjsb		; remove objects from screen buffer
		
							; draw saboteur
		ld hl,sbctrlb
		call drawobj

		call showscr		; show buffer on the screen
		
		ret
			
			
