		macro mkscreen scraddr, leftscr, rightsrc, upscr, downscr
		dw scraddr, leftscr, rightsrc, upscr, downscr
		endm

leftscrd equ 2
rigtscrd equ 4
upscrd	 equ 6	
downscrd equ 8

; ---- map of screens
scrmap:
scrn3:	mkscreen scrbk3, 0, scrn4, 0, 0
scrn4:	mkscreen scrbk4, scrn3, 0, 0, 0
	