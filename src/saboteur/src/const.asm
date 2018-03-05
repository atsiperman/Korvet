
SYSREG  	EQU 7fh

TVRGBASE	EQU 0fb00h
TSYSREG 	EQU 0fa00h + SYSREG


TRAM		EQU 0fc00h

GCONFIG 	EQU 6Ch
GREGBASE 	EQU 0bf00h
GSYSREG 	EQU GREGBASE + SYSREG 
COLRREG 	EQU GREGBASE + 0bfh
LUTREG		EQU GREGBASE + 0fbh

TVISTS      EQU TVRGBASE + 38h
TVIREG		EQU TVRGBASE + 3ah

ATRSET  	EQU 10h 		; set inversion attr
ATRRES  	EQU 20h			; reset inversion attr

GRAM    	EQU 0c000h
GRAMLEN 	EQU 4000h

ROWNUM  	EQU 17			; number of rows on the working screen
COLNUM  	EQU 30         	; number of columns on the working screen

FRMADDR		EQU GRAM + 16 + 64*32
FRMWIDT		EQU COLNUM + 2
FRMHIGT		EQU 24
FRMADRT		EQU TRAM + 2*64 + 16	; address of the frame in text RAM


SCRADDR 	EQU GRAM + 17 + 64*32 + 64*8 	; start of the working screen


NEWSTK  	EQU 0beffh		; new address of stack

							; logical colors
CBLACK		EQU 0
CBLUE		EQU 1
CGREEN		EQU 2
CYELLOW		EQU 3
CMAIN 		EQU 4			; color of the main character
CRED		EQU 2

COLORCLR	EQU (7 & ~CMAIN) << 1	; color to clear working screen
CMAINREG	EQU ((7 & ~CMAIN) << 1) + 1

BUFLEN		EQU ROWNUM * COLNUM * 8	; size of the screen buffer

; --------- tile map constants
; ---------
TILMAPLN	EQU	ROWNUM * COLNUM
TILEFREE	EQU 0			; empty tile
TILECLR		EQU 255			; tile to be cleared

		
