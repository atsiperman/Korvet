
	macro bksh color		; background sprite header
	DB (80h + (color << 1)) ; color register
	endm