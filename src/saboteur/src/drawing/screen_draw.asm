

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


; ------ puts byte into shadow screen
; args: 
;		A  - index of a sprite in the local sprite table
;		BC - address of the local sprite table
;		DE - current address in the shadow screen
		macro PUTBSC_

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

; ----- decompresses byte 		
		macro DCMPBYT_
		ld a,(hl)
							; get index from hi half
		rra					
		rra
		rra
		rra		
		
		PUTBSC_				;  put first compressed byte to the shadow screen
		
		inc de				; next byte of shadow screen

		ld a,(hl)			; restore compressed byte		
		
		PUTBSC_				;  put second compressed byte to the shadow screen

		inc de				; next byte in shadow screen		
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
		cp SCREND			; marker of the end 
		jp z,decmprs5		; set pointer to the object list						
		
		and LINELEN			; clear low bits
		cp DUPLEN			; is dup length ?
		jp nz,decmps1_		; no, check line length
		call decmpdup
		jp decmprs1
		
decmps1_:
		call decmpln_
		jp decmprs1			; continue
		
decmprs5:
		ld hl,(curscr)		; pointer to screen control block
		ld bc,objmapd
		add hl,bc
		load_de_hl			; load object map address
		ex de,hl
		
		ld (objlist),hl
		ret
				
		
linecnt_:
		db 0
bytecnt_:
		db 0
cmlinadr:
		dw 0
		
; ----- decompresses duplicated lines
; 		
decmpdup:
		ld a,(hl)			; reload line marker
		and 15				; get number of lines
		ld (linecnt_),a		; save line counter
		inc hl
		ld (cmlinadr),hl		
		
decmpdp2:		
		ld hl,(cmlinadr)
		xor a
		ld (bytecnt_),a		; init byte counter		
		
decmpdp3:		
		
		ld a,(hl)			; load compressed byte
		and LINELEN

		call decmpln_
		ld a,(bytecnt_)
		cp 15
		jp nz,decmpdp3
		
decmpdp6:		
		ld a,(linecnt_)
		dec a
		ret z
		ld (linecnt_),a
		jp decmpdp2

; ----- decompresses a pack of bytes
; 		
		macro INCBCNT
		push hl
		ld h,a				; save byte counter
		ld a,(bytecnt_)
		add h				; increase byte counter
		ld (bytecnt_),a		
		ld a,h
		pop hl
		endm
		
decmpln_:
		cp LINELEN			; is line length ?
		jp nz, decmprs2		; no, start writing data
		
		ld a,(hl)			; yes, reload line length
		and 15				; leave counter only
		push af				; and save
		
		INCBCNT
		
		inc hl				; move to data byte
		jp decmprs3
		
decmprs2:
		ld a,1				; set counter to 1
		INCBCNT
		push af
		ld a,(hl)			; reload data byte
		
decmprs3:		
		DCMPBYT_
		
		pop af				; restore counter
		dec a				
		jp z,decmprs4		; end, continue global cycle
		
		push af				; continue line
		jp decmprs3			

decmprs4:
		inc hl				; move to the next data byte		

		ret
		
; ----- removes objects from screen buffer
;	 UNUSED !!!
;
rmobjsb:
		ld hl,sbctrlb		
		call clrobjsb		
				
		ld hl,(objlist)		; HL - address of the object list
		ld a,h
		or l
		ret z				; address is zero - exit

		ld a,(hl)			; load number of objects
				
		inc hl				; set to the first object
		
rmobjsb1:		
		push hl
		push af
				
		call clrobjsb
		pop af
		pop hl
		
		ld bc,objsize
		add hl,bc
		
		dec a
		jp nz,rmobjsb1		
		
		ret

; ----- draws all objects on the current screen	
;		
drawobjs:		
							; draw saboteur
		ld hl,sbctrlb
		call drawobj
		;ret					;;;;; remove this after debug

		ld hl,(objlist)		; HL - address of the object list
		ld a,h
		or l
		ret z				; address is zero - exit

		ld a,(hl)			; load number of objects
		
		inc hl				; set to the first object
		
drwobjs1:		
		push hl
		push af
		call drawobj
		pop af
		pop hl
		
		ld bc,objsize	
		add hl,bc
		
		dec a
		jp nz,drwobjs1
		
		ret
		
; ----- draws current screen	
;
drawscr:
		ld a,(prevscr)
		or a
		jp z,scrch1_		; initial render, skip screen clearance 
				
scrch1_:		
		call scrchngd		; screen changed ?
		and a		
		jp z,drawobj1		; do not draw if no
		
		call decmrscr		; decompress new screen map
		
		ld de,shadscr		; address of the shadow screen
        call drawbkgr		; draw background

		ld hl,(curscr)		; save current screen as previous
		ld (prevscr),hl		
		
		call clrtilem		; clear tile map
		
		jp drawobj2			; skip saving old tile map
		
drawobj1:					; draw all objects
		;;call rmobjsb
		call savetilm
				
		call rsttiles
		
drawobj2:
				
		call drawobjs
		
		call showscr		; show buffer on the screen
		
		;;call hldraw			; draw health bar
		
		ret
			
			
