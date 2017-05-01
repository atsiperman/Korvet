
	; background sprite header
	macro bksh color				
		DB (80h + (color << 1)) 	; color register
	endm
	
	; header of a generic sprite
	macro sprhead color,wi,hi
		DB (80h + (color << 1)) 	; color register
		DB wi
		DB hi
	endm
	
	; ---- header of moving sprites
	;
	; all moving sprites are working in plain mode
	;
	macro sabsphd 
		db ((7 & ~CMAIN) << 1) + 1	; color register for moving sprites
		db 4, 48
	endm
	
	macro load_de_hl
		ld e,(hl)
		inc hl
		ld d,(hl)
		inc hl
	endm
	
	macro savem_hl_de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
	endm

	macro load_bc_hl
		ld c,(hl)
		inc hl
		ld b,(hl)
		inc bc
	endm

	macro savem_hl_bc
		ld (hl),c
		inc hl
		ld (hl),b
		inc hl
	endm
	
	; ---- moves to the next screen
	; args:	disp - displacement from the beginning of the screen map to the next screen pointer
	;
	macro nextscreen disp
		ld hl,(curscr)	; load block of the current screen
		ld de,disp
		add hl,de		; pointer to next screen address
		load_de_hl
		ld a,e
		or d			
		ret z			; do nothing if address is zero
		ex de,hl
		ld (curscr),hl	; save address of the next screen block
		ret	
	endm
	
	macro setcolor color	
		ld a,80h + (color<< 1)
		ld hl,COLRREG
		ld (hl),a
	endm
	