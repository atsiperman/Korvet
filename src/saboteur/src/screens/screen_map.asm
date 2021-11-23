		macro mkscreen3 scraddr, leftscr, rightsrc, upscr, downscr,objmap,stomap,txtscrd
		dw scraddr, leftscr, rightsrc, upscr, downscr, objmap, stomap, txtscrd
		endm

		macro mkscreen2 scraddr, leftscr, rightsrc, upscr, downscr,objmap,stomap
		mkscreen3 scraddr, leftscr, rightsrc, upscr, downscr, objmap, stomap, 0
		endm

		macro mkscreen scraddr, leftscr, rightsrc, upscr, downscr,objmap
		mkscreen2 scraddr, leftscr, rightsrc, upscr, downscr, objmap, 0
		endm

leftscrd equ 2		; displacement of left screen's address from the screen map
rigtscrd equ 4		; right screen
upscrd	 equ 6		; up screen
downscrd equ 8		; bottom screen
objmapd	 equ 10 	; object map
stobjmpd equ 12 	; static object map

; ---- map of screens
scrn1:
scrn2:	mkscreen3 scrbk2, 0,     scrn3, 0, 0, 0, 0, scrn2txd
scrn3:	mkscreen scrbk3, scrn2, scrn4, 0, 0, s3objm
scrn4:	mkscreen scrbk4, scrn3, scrn5, scrn72, 0, s4objm
scrn5:	mkscreen scrbk5, scrn4, scrn6, 0, 0, 0
scrn6:	mkscreen scrbk6, scrn5, scrn7, scrn70, scrn11, s6objm
scrn7:	mkscreen scrbk7, scrn6, scrn8, 0, scrn12, s7objm
scrn8:	mkscreen scrbk8, scrn7, 0, scrn68, scrn13, s8objm
scrn9:	mkscreen scrbk9, 0, scrn10,scrn67, scrn14, s9objm
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
scrn28:	mkscreen scrbk28, scrn29,scrn27, 0,0, s28objm
scrn29:	mkscreen scrbk29, 0,scrn28, 0,scrn40, 0 

scrn30:	mkscreen scrbk30, 0,0, 0,scrn39, 0
scrn31:	mkscreen scrbk31, scrn32,0, 0,scrn38, 0
scrn32:	mkscreen scrbk32, scrn33,scrn31, 0,0, s32objm
scrn33:	mkscreen scrbk32, scrn34,scrn32, 0,0, 0
scrn34:	mkscreen scrbk34, 0,scrn33, 0,scrn35, 0
scrn35:	mkscreen scrbk35, 0,scrn36, scrn34,scrn48, s35objm
scrn36:	mkscreen scrbk36, scrn35,scrn37, 0,0, s36objm
scrn37:	mkscreen scrbk37, scrn36,0, 0,0, 0
scrn38:	mkscreen scrbk38, 0,scrn39, scrn31,scrn46, 0
scrn39:	mkscreen scrbk39, scrn38,0, scrn30,0, s39objm

scrn40:	mkscreen scrbk40, 0,scrn41, scrn29,scrn45, 0
scrn41:	mkscreen scrbk41, scrn40,scrn42, 0,scrn44, s41objm
scrn42:	mkscreen scrbk42, scrn41,0, 0,scrn43, 0
scrn43:	mkscreen scrbk43, scrn44,0, scrn42,scrn53, 0
scrn44:	mkscreen scrbk44, 0,scrn43, scrn41,scrn52, 0
scrn45:	mkscreen scrbk45, 0,0, scrn40,scrn51, 0
scrn46:	mkscreen scrbk46, 0,0, scrn38,scrn50, s46objm
scrn48:	mkscreen2 scrbk48, 0,0, scrn35,scrn49, s48objm, s48stom
scrn49:	mkscreen2 scrbk49, 0,0, scrn48,scrn62, s49objm, s49stom

scrn50:	mkscreen scrbk50, 0,0, scrn46,scrn58, 0
scrn51:	mkscreen scrbk51, 0,scrn52, scrn45,0, s51objm
scrn52:	mkscreen scrbk52, scrn51,scrn53, scrn44,scrn55, s52objm
scrn53:	mkscreen scrbk53, scrn52,0, scrn43,0, 0
scrn54:	mkscreen scrbk54, scrn55,0, 0,scrn65, s54objm
scrn55:	mkscreen scrbk55, scrn56,scrn54, scrn52,0, 0
scrn56:	mkscreen scrbk56, scrn57,scrn55, 0,0, 0
scrn57:	mkscreen scrbk57, scrn58,scrn56, 0,0, 0
scrn58:	mkscreen scrbk58, scrn60,scrn57, scrn50,0, 0

scrn60:	mkscreen scrbk60, scrn61,scrn58, 0,0, s60objm
scrn61:	mkscreen scrbk61, scrn62,scrn60, 0,0, 0
scrn62:	mkscreen scrbk62, 0,scrn61, scrn49,scrn63, s62objm
scrn63:	mkscreen scrbk63, 0,scrn64, scrn62,0, 0
scrn64:	mkscreen scrbk64, scrn63,scrn65, 0,0, 0
scrn65:	mkscreen scrbk65, scrn64,0, scrn54,0, 0
scrn66:	mkscreen scrbk66, scrn67,0, 0,0, 0
scrn67:	mkscreen scrbk67, scrn68,scrn66, 0,scrn9, 0
scrn68:	mkscreen scrbk68, 0,scrn67, scrn77,scrn8, 0

scrn70:	mkscreen scrbk70, scrn71,0, scrn75, scrn6, 0
scrn71:	mkscreen scrbk71, scrn72,scrn70, 0, scrn6, 0
scrn72:	mkscreen scrbk72, 0,scrn71, scrn73, scrn4, 0
scrn73:	mkscreen2 scrbk73, 0,scrn74, 0, scrn72, 0, s73stom
scrn74:	mkscreen2 scrbk74, scrn73,scrn75, 0, scrn71, 0, s74stom
scrn75:	mkscreen2 scrbk75, scrn74,0, scrn84, scrn70, 0, s75stom

scrn77:	mkscreen scrbk77, 0,scrn78, scrn82, scrn68, 0
scrn78:	mkscreen scrbk78, scrn77,scrn79, 0, 0, 0
scrn79:	mkscreen scrbk79, scrn78,0, 0, 0, 0

scrn80:	mkscreen scrbk80, scrn81,0, scrn93, 0, 0
scrn81:	mkscreen scrbk81, scrn82,scrn80, 0, 0, 0
scrn82:	mkscreen scrbk82, 0,scrn81, scrn91, scrn77, 0

scrn84:	mkscreen2 scrbk84, scrn85,0, 0,scrn75, 0, s84stom
scrn85:	mkscreen2 scrbk85, scrn86,scrn84, 0,scrn74, 0, s85stom
scrn86:	mkscreen2 scrbk86, 0,scrn85, scrn87,0, 0, s86stom
scrn87:	mkscreen2 scrbk87, 0,scrn88, scrn100,scrn86, 0, s87stom
scrn88:	mkscreen scrbk81, scrn87,scrn89, 0,0, 0
scrn89:	mkscreen2 scrbk89, scrn88,0, scrn98,0, 0, s89stom

scrn91:	mkscreen scrbk91, 0,scrn92, 0,scrn82, 0
scrn92:	mkscreen scrbk92, scrn91,scrn93, 0,0, 0
scrn93:	mkscreen scrbk93, scrn92,0, scrn94,scrn80, 0
scrn94:	mkscreen scrbk94, scrn95,0, scrn107,scrn93, 0
scrn95:	mkscreen scrbk95, scrn96,scrn94, 0,scrn92, 0
scrn96:	mkscreen scrbk96, scrn97,scrn95, 0,0, 0
scrn97:	mkscreen scrbk97, 0,scrn96, 0,0, 0
scrn98:	mkscreen scrbk98, scrn99,0, 0,scrn89, 0
scrn99:	mkscreen scrbk99, scrn100,scrn98, scrn102,0, 0

scrn100:	mkscreen scrbk100, 0,scrn99, 0,scrn87, 0
scrn101:	mkscreen scrbk101, 0,scrn102, 0,0, 0
scrn102:	mkscreen scrbk102, scrn101,scrn103, 0,scrn99, 0
scrn103:	mkscreen3 scrbk103, scrn102,0, scrn112,0, 0, 0, scrn103txd
scrn104:	mkscreen scrbk104, 0,scrn105, 0,0, 0
scrn105:	mkscreen scrbk105, scrn104,scrn106, scrn110,0, 0
scrn106:	mkscreen scrbk106, scrn105,scrn107, 0,scrn95, 0
scrn107:	mkscreen scrbk107, scrn106,0, 0,scrn94, 0
scrn108:	mkscreen scrbk108, scrn109,0, 0,scrn107, 0
scrn109:	mkscreen scrbk109, scrn110,scrn108, 0,0, 0

scrn110:	mkscreen scrbk110, scrn111,scrn109, 0,scrn105, 0
scrn111:	mkscreen scrbk111, scrn112,scrn110, 0,0, 0
scrn112:	mkscreen scrbk112, scrn113,scrn111, scrn117,scrn103, 0
scrn113:	mkscreen scrbk113, scrn114,scrn112, 0,scrn102, 0
scrn114:	mkscreen scrbk114, 0,scrn113, scrn115,scrn101, 0
scrn115:	mkscreen scrbk115, 0,scrn116, 0,scrn114, 0
scrn116:	mkscreen scrbk116, scrn115,scrn117, scrn126,scrn113, 0
scrn117:	mkscreen scrbk117, scrn116,scrn118, 0,scrn112, 0
scrn118:	mkscreen scrbk118, scrn117,scrn119, scrn124,scrn111, 0
scrn119:	mkscreen scrbk119, scrn118,scrn120, 0,scrn110, 0

scrn120:	mkscreen scrbk120, scrn119,scrn121, scrn122,scrn109, 0
scrn121:	mkscreen scrbk121, scrn120,0, 0,scrn108, 0
scrn122:	mkscreen scrbk122, scrn123,0, 0,scrn120, 0
scrn123:	mkscreen scrbk123, 0,scrn122, 0,0, 0
scrn124:	mkscreen scrbk124, scrn125,0, 0,scrn118, 0
scrn125:	mkscreen scrbk125, scrn126,scrn124, 0,0, 0
scrn126:	mkscreen scrbk126, 0,scrn125, 0,scrn116, 0

