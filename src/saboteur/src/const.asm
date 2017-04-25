
SYSREG  	EQU 7fh

TSYSREG 	EQU 0fa00h + SYSREG

GCONFIG 	EQU 6Ch
GREGBASE 	EQU 0bf00h
GSYSREG 	EQU GREGBASE + SYSREG
COLRREG 	EQU GREGBASE + 0bfh
LUTREG		EQU GREGBASE	+ 0fbh

GRAM    	EQU 0c000h
GRAMLEN 	EQU 4000h

SCRADDR 	EQU GRAM ; + 512 + 10		; start of the working screen

ROWNUM  	EQU 17			; number of rows on the working screen
COLNUM  	EQU 30         	; number of columns on the working screen
SCRDISP 	EQU 64 - COLNUM	; displacement on the screen memory to draw next line

NEWSTK  	EQU 0beffh

CBLACK		EQU 0
CBLUE		EQU 1
CGREEN		EQU 2
CYELLOW		EQU 3

CMAIN 		EQU 4			; color of the main character
