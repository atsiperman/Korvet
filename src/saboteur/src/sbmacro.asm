
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
	
	macro load_de_hl
		ld e,(hl)
		inc hl
		ld d,(hl)
	endm