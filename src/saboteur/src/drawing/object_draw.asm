

; ----  copies current state to the previous
; args: HL - address of the object's control block
copystat:	
		push hl

		ldcurp				; load address of the current position		
		
		pop hl	
		push hl
							; save to previous position		
		sprevp
		
		pop hl
		push hl
		
		ldcurspr			; load current sprite address
		pop hl
		sprvspr				; save as previous sprite address
		ret

; ----	reads address of the object in the screen buffer
; args: 
;		HL - address of the object's control block
;
; result:
;		DE - address(position) in the screen buffer
;		
rdsprpos:
		push hl
		ldcursr			; load current row index
		add a,a			; make address displacement
		ld c,a
		ld b,0
		ld hl,bufrows
		add hl,bc		; pointer to row address
		load_de_hl
		pop hl
		
		ldcursc 
		ex de,hl
		ld c,a
		ld b,0
		add hl,bc
		ex de,hl
		
		ret
		
; ----	clears object in the screen buffer
; args: HL - address of the object's control block
;
clrobjsb:
		push hl				; save control block address
		
		ldprvsp				; load previous sprite address
		ex de,hl
		
		inc hl				; skip color
		ld c,(hl)			; load width 
		inc hl
		ld b,(hl)			; load height
								
		pop hl	
		push bc
		
		ldprevp				; load previous position
		ex de,hl
		
		pop bc
		
		call clrspr
		ret

; ----	draws object
; args: HL - address of the object's control block
drawobj:
		push hl				; save control block address		
		
		call rdsprpos		; load address of the current position into DE	
		pop hl
		
		push hl
		scurp		
		pop hl
		
		push hl
		
		push de
		ldcurspr			; load address of the current sprite

		pop bc
		
		pop hl				; load control block address
		push hl
		push bc
		
		push de				; save sprite address
				
		;;call mirrspr		; possibly new sprite address if left direction

		pop bc				; load original sprite address
		pop hl				; load current position
		push bc
		
		call putspr			; put sprite to screen buffer
		
		pop de				; restore sprite address
		pop hl				; restore object control block
		push hl
		
		call updtilem		; update tile map
		
		pop hl
		call copystat
		
		ret
		

; ----- puts sprite on the screen 
;		
; args: 
;		hl - address on the screen
;		de - address of the sprite
;
; ; ; putsprN:
; ; ; 		ex de,hl				
; ; ; 		inc hl			; skip color
; ; ; 		ld c,(hl)		; sprite width
; ; ; 		inc hl
; ; ; 		ld b,(hl)		; sprite height
; ; ; 		ex de,hl		; DE - pointer to sprite data

; ; ; _psprN:
; ; ; 		inc de			; skip mask
; ; ; 		ld a,(de)					; load data byte
; ; ; 		push de						; save address of sprite data

; ; ; 		ex de,hl							; DE - video addr
; ; ; 		ld hl,COLRREG
; ; ; 		ld (hl), ((7 & ~CMAIN) << 1) + 1	; set main color
; ; ; 		ex de,hl							; HL - video address
; ; ; 		ld (hl),a							; set data bits

; ; ; 		ex de,hl						; DE - video addr
; ; ; 		ld (hl), ((7 & ~CMAIN) << 1)	; set color to clear				
; ; ; 		cpl								; get bits to clear
; ; ; 		ld (hl),a						; move data byte

; ; ; 		pop de		
; ; ; 		dec c
; ; ; 		jp z,_psprN		; move to the next video row

; ; ; _psprN2:
; ; ; 		dec b
; ; ; 		jp z,_psprNe

; ; ; 		push bc
; ; ; 		jp _psprN

; ; ; _psprNe:		
; ; ; 		ret

		
;
; ----	mirrors sprite if direction is left
;		always makes copy of the sprite into buffer in order to get equal movement speed in both directions
;		returns original address of the sprite if this is right direction
;
		macro MIRSPCPY
		ld a,(hl)
		ld (de),a
		inc hl
		inc de		
		endm
		
; args: 
;		HL - address of the object's control block	
;		DE - sprite address
;
; result:
;		DE - address of a sprite to be drawn 
;			 original address for right direction 
;			 sprite buffer for left direction
;
		
mirrspr:
		push de
		push hl
				
		ex de,hl			; sprite address in HL
		ld de,sprtbuf
		
		MIRSPCPY			; copy color
		
		MIRSPCPY			; copy width
		ld c,a				; save width in C
		MIRSPCPY			; copy height
				
		dec hl
		ld b,0
		add hl,bc			; HL points to the last byte in the first line
		push bc				; save width only
		
		ld b,a 				; save height in B
		
mirrspr1:
		ld a,(hl)
		MIRRBYTE
		ld (de),a
				
		dec hl
		inc de		
		
		dec c
		jp nz,mirrspr1
		
		dec b
		jp z,mirrspr_		; finish

		ld a,b				; save height
		pop bc				; restore width
		push bc
		
		add hl,bc
		add hl,bc			; set to the end of the next line
		ld b,a				; restore height counter
		jp mirrspr1
		
mirrspr_:
		pop bc
		
		pop hl
		lddir
		cp dirrt
		pop de
		ret z
		
		ld de,sprtbuf
		ret

