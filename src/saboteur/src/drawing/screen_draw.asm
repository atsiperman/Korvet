

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
		cp SCREND			; marker of the end of the screen map defition
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
        push hl             ; save current pointer to screen map data
        ld hl,(tramdef)     ; save old text RAM definition
        ld (otramdef),hl

        ld   hl,objlist
        xor  a
        dup (otramdef - objlist)
            ld   (hl),a
            inc  hl
        edup

        pop  hl             ; restore data pointer
        inc  hl             ; move to the next data byte
.decmp6:
		ld   a,(hl)			; load compressed byte into A
        inc  hl
		cp   SCREND			; marker of the end 
        ret  z

        cp   OBJMAP
        jp   nz,.decmp7
		load_de_hl			; load object map address
		ex   de,hl		
		ld   (objlist),hl		; save pointer to the object list
        ex   de,hl		
        jp   .decmp6

.decmp7:
        cp   STOMAP
        jp   nz,.decmp8
		load_de_hl			; load static object map address to DE
		ex de,hl
		ld (sobjlst),hl		; save pointer to the list of static objects
        ex   de,hl		
        jp   .decmp6

.decmp8:
        cp   MSKOMAP
        jp   nz,.decmp9
		load_de_hl			; load masked object map address to DE
		ex de,hl
		ld (mobjlst),hl		; save pointer to the list of masked objects
        ex   de,hl		
        jp   .decmp6

.decmp9:
        cp   TXTSMAP
        jp   nz,.decmp10
		load_de_hl			; load text RAM definition
		ex de,hl
		ld (tramdef),hl
        ex   de,hl		
        jp   .decmp6

.decmp10:
        cp   TRIGMAP
        jp   nz,.decmp11
		load_de_hl			; load pointer to the list of triggers
		ex de,hl
		ld (trigmap),hl
        ex   de,hl		
        jp   .decmp6

.decmp11:
        cp  FSTRDRP
        jp  nz,.decmp12
		load_de_hl			; load text first render post processing procedure address
		ex  de,hl
		ld  (fstrdrp),hl
        ex  de,hl		
        jp  .decmp6

.decmp12:
        inc  hl
        jp   .decmp6
			
		
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

		PUTBSC_				;  put first compressed byte to the shadow screen
		
		ld a,(hl)			; restore compressed byte		
		and 15				; index of the first sprite in A

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

; ----- draws an object being held by saboteur
;		
drwheldo:
        ld   a,(sbhldch)
        or   a
        ret  z              ; nothing changed

        ld   a,(sbholds)
        or   a
        jp   nz,.drwhl1     ; draw object
        ld   hl,HELDADR
        ld   de,drnohld     ; draw text 'nothing held'
        call clrtrim        ; clear object image
        jp   .drwhle

.drwhl1:
        ld   hl,trimglst
        dec  a              ; get image index from object type
        ld   c,a
        ld   b,0
        add  hl,bc
        add  hl,bc          ; pointer to image address
        load_de_hl          ; read image address
        ex   de,hl          ; into HL
        ld   de,HELDADR
		call drawtrim		; draw triggered image

.drwhle:
		xor	 a
		ld	 (sbhldch),a	; clear trigger flag
		ret	


; ----- draws triggered objects 
;		
drawtrig:        
		ld	 a,(trigchd)
		or	 a
		ret	 z				; nothing triggered
        
		ld	 hl,(trotptr)	; load pointer to the trigger object type
        ld   a,h
        or   l
        jp   z,.drwtr1      ; no triggers, clear image

        ld   a,(hl)         ; load object type into A
		or	 a
		jp	 nz, .drwtr2	; not zero, draw triggered image

.drwtr1:
        ld   hl,TRIMADR
        ld   de,drnoner     ; restore text 'nothing near'
		call clrtrim		; clear triggered image
		jp	 .drwtre

.drwtr2:
        ld   hl,trimglst
        dec  a              ; get image index from object type
        ld   c,a
        ld   b,0
        add  hl,bc
        add  hl,bc          ; pointer to image address
        load_de_hl          ; read image address
        ex   de,hl          ; into HL
        ld   de,TRIMADR
		call drawtrim		; draw triggered image

.drwtre:
		xor	 a
		ld	 (trigchd),a	; clear trigger flag
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

; ----- draws all masked objects on the current screen	
;		
drwmobjs:		
		ld hl,(mobjlst)		; HL - address of the masked objects list
		ld a,h
		or l
		ret z				; address is zero - exit

		ld a,(hl)			; load number of objects
		
		inc hl				; set to the first object
		
.drwmo1:		
		push hl
		push af
		
		load_bc_hl		; load pointer in screen buffer into BE
		load_de_hl		; load image address into DE
		ld l,c
		ld h,b			; tile pointer into HL

		call putspr		; put sprite to screen buffer

		pop af
		pop hl
		
		ld bc,mobjsz	
		add hl,bc
		
		dec a
		jp nz,.drwmo1
		
		ret

; ----- draws static objects
;
drawstos:
		ld hl,(sobjlst)		; HL - address of the static objects list
		ld a,h
		or l
		ret z				; address is zero - exit

		ld a,(hl)			; load number of objects
		
		inc hl				; set to the first object
        
.drwsto1:		
		push hl
		push af
		
		ld d,(hl)			; load X
		inc hl				
		ld e,(hl)			; load Y
		inc hl
		load_bc_hl			; load object address into BC

		push hl
		push bc		
		call stotiles		; set tiles occupied by static object
		pop bc				; restore object address
		pop hl				; restore object pointer

		load_de_hl			; load pointer to video RAM into DE		

		call drawsto
		pop af
		pop hl
		
		ld bc,stobjsz	
		add hl,bc
		
		dec a
		jp nz,.drwsto1
		
		ret

; ----- call first render post processor
;
postproc:
        ld  hl,(fstrdrp)
        ld  a,h
        or  l
        ret z
        ; ex  de,hl           ; save proc address in DE
        ; ld  hl,0
        ; ld  (fstrdrp),hl    ; clear proc address
        ; ex  de,hl
        jp  (hl)
        ret 
        
; ----- draws numbers (time, score)
;
drwnums:
        ld  a,(ctimechg)
        or  a
        jp  z,.drn1        ; no change, skip drawing
        ld  hl,curtime
        ld  de,TIMESCRA
        ld  b,NUMFGC
        ld  c,NUMBKC
        call prntnum
        xor a
        ld  (ctimechg),a
        
.drn1:  
        ld  a,(scorchg)
        or  a
        ret z              ; no change, skip drawing
        ld  hl,score
        ld  de,SCORSCRA
        ld  b,NUMFGC
        ld  c,NUMBKC
        call prntnum
        xor a
        ld  (scorchg),a

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

        call waitblnk
		call clrtxscr		; clear text ram for old screen		
		call drawtram		; draw text ram for new screen
        GRMODON
		call drawstos		; draw static objects
        call drawbkgr		; draw background
        call postproc
        GRMODOFF
		call drawtram		; draw text ram for new screen
        call clrscrch       ; clear data before moving to another screen
		ld hl,(curscr)		; save current screen as previous
		ld (prevscr),hl		
				
		jp drawobj2			; skip saving old tile map
		
drawobj1:					; draw all objects
		call savetilm		; save old tiles state

drawobj2:
		call updobjs		; update objects state		
		call updmobjs		; update masked objects state
		call rsttiles		; restore tiles background according to current objects location
        call utlmtho        ; update thrown object state
        call utlmthog       ; update state of an object thrown by guard
				
		call drawobjs		; draw active objects
		call drwmobjs		; draw masked objects

        ;call waitblnk
        GRMODON

		call drawtrig		; draw triggered image, if any
        call drwheldo       ; draw an object being held by saboteur
		call showscr		; show buffer on the screen		
		call hldraw			; draw health bar
        call drwnums        ; draw current time

        GRMODOFF

		xor a
		ld (fstrendr),a		; reset set flag for first render

		ret
			
			
