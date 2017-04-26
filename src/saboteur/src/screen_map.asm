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
scrn4:	mkscreen scrbk4, scrn3, scrn5, 0, 0
scrn5:	mkscreen scrbk5, scrn4, scrn6, 0, 0
scrn6:	mkscreen scrbk6, scrn5, scrn7, 0, 0
scrn7:	mkscreen scrbk7, scrn6, scrn8, 0, 0
scrn8:	mkscreen scrbk8, scrn7, 0, 0, 0
	