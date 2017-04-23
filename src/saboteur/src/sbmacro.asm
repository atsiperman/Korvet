
	; background sprite header
	macro bksh color				
		DB (80h + (color << 1)) 	; color register
	endm