
; ----- updates state of all the objects on the screen
;       updates tile map according to sprites locations
;
updobjs:
		ld hl,sbctrlb
		call updobj

		ld hl,(objlist)		; HL - address of the object list
		ld a,h
		or l
		ret z				; address is zero - exit

		ld a,(hl)			; load number of objects
		
		inc hl				; set to the first object
        
updobjs1:		
		push hl
		push af
		call updobj
		pop af
		pop hl
		
		ld bc,objsize	
		add hl,bc
		
		dec a
		jp nz,updobjs1
		
		ret

; ----- updates state of the object provided
; args:
;		 HL - address of the object's control block 
;
updobj:
		push hl				; save control block address		
		
		call rdsprpos		; load address of the current position into DE	
		pop hl
		
		push hl
		scurp		
		pop hl

		push hl
		ldcurspr			; load address of the current sprite
		pop hl				; load control block address

		call updtilem

		ret
		
; ----  copies current state to the previous
; args:
;		 HL - address of the object's control block
;
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
		load_de_hl		; save row address in DE
		pop hl
		
		ldcursc 		; load column index into A
		ld c,a			; save column in C

		rla				
		rla
		rla				; multipy by 8 
		ld l,a			; save it in L

		xor a
		ld h,a			; zero to H
						; L = column index * 8
						;
		ld b,a			; B - 0
						; C - column index
		
		add hl,bc		; add 9-th column index to get column offset in byte

		add hl,de		; column address in HL
		
		ex de,hl
		
		ret
		

; ----	draws object
; args: HL - address of the object's control block
drawobj:
		push hl
		ldcurp				; load current position in screen buffer to DE
		pop hl				; load control block address

		push hl				; save control block
		push de				; save current position 

		ldcurspr			; load address of the current sprite into DE		

		pop hl				; restore position in screen buffer
		call putspr			; put sprite to screen buffer

		pop hl				; load original sprite address
				
		call copystat
		
		ret

		
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

