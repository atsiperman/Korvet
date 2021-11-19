

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
;		DE - current address in the screen buffer
		macro PUTBSC_

		;and 15				; index of the first sprite in A
		push hl
		push de

		ld d,0
		ld e,a

		ld h,b				; local sprite table		
		ld l,c				; from bc to hl
		add hl,de			; add index of sprite

		ld e,(hl)			; sprite index in global table
		ld hl,BKSPRTAB
		add hl,de
		add hl,de			; address of the current sprite
		load_de_hl			; in DE

		pop hl				; restore screen buffer pointer

		ld (hl),e			; save sprite address
		inc hl
		ld (hl),d
		inc hl				; move pointer to tile state
		ld (hl),0			; clear tile state
		inc hl				; move pointer to attributes

		inc de				; skip back color				
		inc de				; skip color
		ld a,(de)			; load and save sprite attributes
		ld (hl),a
		inc hl					; move pointer to data
		skip_buf_tile_data hl 	; skip data bytes

		ex de,hl			; address in screen buffer into DE

		pop hl				; restore pointer to the next byte
		
		endm
		
; ----- decompresses current screen into shadow area
; 
decmrscr:		
		ld hl,(curscr)		; pointer to screen control block
				
		load_de_hl			; load address of the current screen
		ex de,hl			; address of the screen in HL

		ld d,0
		ld e,(hl)			; length of local sprite map		
		inc hl
		push hl
		pop	bc				; keep screen address in BC as pointer to local sprite map		
		
		add hl,de			; now hl points to the first tile data
		
		ld de,scrbuf		; pointer to the screen buffer	
		
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
		
		ld (objlist),hl		; save pointer to the object list

		ld hl,(curscr)		; pointer to screen control block
		ld bc,stobjmpd
		add hl,bc
		load_de_hl			; load static object map address
		ex de,hl
		ld (sobjlst),hl		; save pointer to the list of static objects

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
							; ----- decompresses byte 		
		ld a,(hl)
							; get index from hi half
		rra					
		rra
		rra
		rra		
		and 15				; index of the first sprite in A

		cp STATOBJ
		jp nz,_dcmpr31		; not a static object, normal decompress

							; init tile for a static object
		inc de			
		inc de				; skip sprite address
		xor a				; clear tile state
		ld (de),a			; save tile state
		inc de				; move to attributes
		ld a,stotile + fgtile
		ld (de),a			; mark tile as a static object
		inc de
		skip_buf_tile_data de 	; skip data bytes

		jp _dcmpr32

_dcmpr31:
		PUTBSC_				;  put first compressed byte to the shadow screen
		
_dcmpr32:		
		ld a,(hl)			; restore compressed byte		
		and 15				; index of the first sprite in A

		cp STATOBJ
		jp nz,_dcmpr33		; not a static object, normal decompress

							; init tile for a static object
		inc de			
		inc de				; skip sprite address
		xor a				; clear tile state
		ld (de),a			; save tile state
		inc de				; move to attributes
		ld a,stotile + fgtile	
		ld (de),a			; mark tile as a static object
		inc de
		skip_buf_tile_data de 	; skip data bytes
		jp _dcmpr34

_dcmpr33:
		PUTBSC_				;  put second compressed byte to the shadow screen
							; ----- end decompresses byte 		
_dcmpr34:
		pop af				; restore counter
		dec a				
		jp z,decmprs4		; end, continue global cycle
		
		push af				; continue line
		jp decmprs3			

decmprs4:
		inc hl				; move to the next data byte		

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
		
; ----- draws static objects
;
drawstos:
		ld hl,(sobjlst)		; HL - address of the object list
		ld a,h
		or l
		ret z				; address is zero - exit

		ld a,(hl)			; load number of objects
		
		inc hl				; set to the first object
        
_drwsto1:		
		push hl
		push af
		
		load_de_hl			; load pointer to video RAM into DE
		load_bc_hl			; load object address into BC
		
		call drawsto
		pop af
		pop hl
		
		ld bc,stobjsz	
		add hl,bc
		
		dec a
		jp nz,_drwsto1
		
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
		
		ld a,1
		ld (fstrendr),a		; set flag for first render

		call decmrscr		; decompress new screen map
		
        call drawbkgr		; draw background
		call drawstos		; draw static objects

		ld hl,(curscr)		; save current screen as previous
		ld (prevscr),hl		
				
		jp drawobj2			; skip saving old tile map
		
drawobj1:					; draw all objects
		call savetilm		; save old tiles state

drawobj2:
		call updobjs		; update objects state		
		call rsttiles		; restore tiles background according to current objects location
				
		call drawobjs
		
		call showscr		; show buffer on the screen
		
		call hldraw			; draw health bar

		xor a
		ld (fstrendr),a		; reset set flag for first render

		ret
			
			
