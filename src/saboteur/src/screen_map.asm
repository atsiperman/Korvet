		macro mkscreen scraddr, leftscr, rightsrc, upscr, downscr
		dw scraddr, leftscr, rightsrc, upscr, downscr
		endm

leftscrd equ 2	; displacement of left screen's address from the screen map
rigtscrd equ 4	; right screen
upscrd	 equ 6	; up screen
downscrd equ 8	; bottom screen

; ---- map of screens
scrmap:
scrn1:
scrn3:	mkscreen scrbk3, 0, scrn4, 0, 0
scrn4:	mkscreen scrbk4, scrn3, scrn5, 0, 0
scrn5:	mkscreen scrbk5, scrn4, scrn6, 0, 0
scrn6:	mkscreen scrbk6, scrn5, scrn7, 0, scrn11
scrn7:	mkscreen scrbk7, scrn6, scrn8, 0, 0
scrn8:	mkscreen scrbk8, scrn7, scrn9, 0, 0
scrn9:	mkscreen scrbk9, scrn8, scrn10,0,0
scrn10:	mkscreen scrbk10, scrn9,0,0,0
scrn11:	mkscreen scrbk11, 0,0,scrn6,0
	