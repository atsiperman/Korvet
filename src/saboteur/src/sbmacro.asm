
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
	
	; header of moving sprites
	; all sprites are working in plain mode
	macro sabsphd 
		db ((7 & ~CMAIN) << 1) + 1	; color register for moving sprites
		db 4, 48
	endm
	
	macro load_de_hl
		ld e,(hl)
		inc hl
		ld d,(hl)
	endm
	
	macro setcolor color	
		ld a,80h + (color<< 1)
		ld hl,COLRREG
		ld (hl),a
	endm