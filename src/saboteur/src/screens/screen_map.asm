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
scrn7:	mkscreen scrbk7, scrn6, scrn8, 0, scrn12
scrn8:	mkscreen scrbk8, scrn7, 0, 0, scrn13
scrn9:	mkscreen scrbk9, 0, scrn10,0, scrn14
scrn10:	mkscreen scrbk10, scrn9,0,0,scrn15
scrn11:	mkscreen scrbk11, 0,0,scrn6,scrn16
scrn12:	mkscreen scrbk12, 0,0,scrn7,scrn17
scrn13:	mkscreen scrbk13, 0,scrn14,scrn8,scrn18
scrn14:	mkscreen scrbk14, scrn13,scrn15,scrn9,0
scrn15:	mkscreen scrbk15, scrn14,0,scrn10,scrn20
scrn16:	mkscreen scrbk16, 0,scrn17,scrn11,0	
scrn17:	mkscreen scrbk17, scrn16,scrn18,scrn12,0	
scrn18:	mkscreen scrbk18, scrn17,0,scrn13,0	
scrn19:	mkscreen scrbk19, 0,0, 0,scrn21
scrn20:	mkscreen scrbk20, 0,0, scrn15,scrn22
scrn21:	mkscreen scrbk21, 0,0, scrn19,scrn24
scrn22:	mkscreen scrbk22, 0,0, scrn20,scrn23
scrn23:	mkscreen scrbk23, scrn24,0, scrn22,0
scrn24:	mkscreen scrbk24, scrn25,scrn23, scrn21,0
scrn25:	mkscreen scrbk25, scrn26,scrn24, 0,0
scrn26:	mkscreen scrbk26, scrn27,scrn25, 0,0
scrn27:	mkscreen scrbk27, scrn28,scrn26, 0,0
scrn28:	mkscreen scrbk28, scrn29,scrn27, 0,0
scrn29:	mkscreen scrbk29, 0,scrn28, 0,0