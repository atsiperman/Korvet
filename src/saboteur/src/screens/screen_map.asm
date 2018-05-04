		macro mkscreen scraddr, leftscr, rightsrc, upscr, downscr,objmap
		dw scraddr, leftscr, rightsrc, upscr, downscr,objmap
		endm

leftscrd equ 2	; displacement of left screen's address from the screen map
rigtscrd equ 4	; right screen
upscrd	 equ 6	; up screen
downscrd equ 8	; bottom screen
objmapd	 equ 10 ; object map

; ---- map of screens
scrn1:
scrn3:	mkscreen scrbk3, 0, scrn4, 0, 0, s3objm
scrn4:	mkscreen scrbk4, scrn3, scrn5, 0, 0, 0
scrn5:	mkscreen scrbk5, scrn4, scrn6, 0, 0, 0
scrn6:	mkscreen scrbk6, scrn5, scrn7, 0, scrn11, 0
scrn7:	mkscreen scrbk7, scrn6, scrn8, 0, scrn12, 0
scrn8:	mkscreen scrbk8, scrn7, 0, 0, scrn13, s8objm
scrn9:	mkscreen scrbk9, 0, scrn10,0, scrn14, 0
scrn10:	mkscreen scrbk10, scrn9,0,0,scrn15, s10objm
scrn11:	mkscreen scrbk11, 0,0,scrn6,scrn16, 0
scrn12:	mkscreen scrbk12, 0,0,scrn7,scrn17, 0
scrn13:	mkscreen scrbk13, 0,scrn14,scrn8,scrn18, 0
scrn14:	mkscreen scrbk14, scrn13,scrn15,scrn9,0, 0
scrn15:	mkscreen scrbk15, scrn14,0,scrn10,scrn20, 0
scrn16:	mkscreen scrbk16, 0,scrn17,scrn11,0, 0
scrn17:	mkscreen scrbk17, scrn16,scrn18,scrn12,0, 0
scrn18:	mkscreen scrbk18, scrn17,0,scrn13,0, 0
scrn19:	mkscreen scrbk19, 0,0, 0,scrn21, 0
scrn20:	mkscreen scrbk20, 0,0, scrn15,scrn22, 0
scrn21:	mkscreen scrbk21, 0,0, scrn19,scrn24, 0
scrn22:	mkscreen scrbk22, 0,0, scrn20,scrn23, 0
scrn23:	mkscreen scrbk23, scrn24,0, scrn22,0, 0
scrn24:	mkscreen scrbk24, scrn25,scrn23, scrn21,0, 0
scrn25:	mkscreen scrbk25, scrn26,scrn24, 0,0, 0
scrn26:	mkscreen scrbk26, scrn27,scrn25, 0,0, 0
scrn27:	mkscreen scrbk27, scrn28,scrn26, 0,0, 0
scrn28:	mkscreen scrbk28, scrn29,scrn27, 0,0, 0
scrn29:	mkscreen scrbk29, 0,scrn28, 0,scrn40, 0 

scrn40:	mkscreen scrbk40, 0,scrn41, scrn29,scrn45, 0
scrn41:	mkscreen scrbk41, scrn40,scrn42, 0,scrn44, 0
scrn42:	mkscreen scrbk42, scrn41,0, 0,scrn43, 0
scrn43:	mkscreen scrbk43, scrn44,0, scrn42,scrn53, 0
scrn44:	mkscreen scrbk44, 0,scrn43, scrn41,scrn52, 0
scrn45:	mkscreen scrbk45, 0,0, scrn40,scrn51, 0

scrn51:	mkscreen scrbk51, 0,scrn52, scrn45,0, s51objm
scrn52:	mkscreen scrbk52, scrn51,scrn53, scrn44,scrn55, s52objm
scrn53:	mkscreen scrbk53, scrn52,0, scrn43,0, 0
scrn54:	mkscreen scrbk54, scrn55,0, 0,scrn65, s54objm
scrn55:	mkscreen scrbk55, scrn56,scrn54, scrn52,0, 0
scrn56:	mkscreen scrbk56, scrn57,scrn55, 0,0, 0
scrn57:	mkscreen scrbk57, 0,scrn56, 0,0, 0

scrn60:	mkscreen scrbk60, scrn61,0, 0,0, 0
scrn61:	mkscreen scrbk61, scrn62,scrn60, 0,0, 0
scrn62:	mkscreen scrbk62, 0,scrn61, 0,scrn63, s62objm
scrn63:	mkscreen scrbk63, 0,scrn64, scrn62,0, 0
scrn64:	mkscreen scrbk64, scrn63,scrn65, 0,0, 0
scrn65:	mkscreen scrbk65, scrn64,0, scrn54,0, 0
