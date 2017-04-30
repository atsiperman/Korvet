

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
		
		ld a, ROWNUM * (COLNUM/2)
		ld (decmcnt),a		; save counter
		
decmprs1:
		ld a,(hl)
		push af				; save compressed byte in A		
		
		rra
		rra
		rra
		rra		
		and 15				; index of the first sprite
				
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
		
		inc de				; next byte of shadow screen

		pop af				; restore compressed byte		
		and 15
		push hl
		push de
		ld d,0
		ld e,a
		ld h,b
		ld l,c				; screen address		
		add hl,de			; add index of sprite		
		ld a,(hl)			; index of sprite in global table
		pop de
		ex de,hl
		ld (hl),a			; write it to the shadow screen
		ex de,hl
		pop hl				; restore pointer to the next byte

		inc de
		inc hl
		ld a,(decmcnt)		; save counter
		dec a
		ret	z
		ld (decmcnt),a		; save counter
		jp decmprs1
		
; ----- draws current screen	
drawscr:
		call scrchngd		; screen changed ?
		and a		
		jp z,drawobjs		; do not draw if no
		
		ld a,80h
		call clrwscr
		
		call decmrscr
		
		ld de,shadscr		; address of the shadow screen
        call drawbkgr

		ld hl,(curscr)		; save current screen as previous
		ld (prevscr),hl		
		
drawobjs:					; draw all objects

							; draw saboteur
		ld hl,sbctrlb
		call drawobj
		
		ret
			
			
