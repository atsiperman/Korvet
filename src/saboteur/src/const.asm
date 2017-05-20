
SYSREG  	EQU 7fh

TSYSREG 	EQU 0fa00h + SYSREG

GCONFIG 	EQU 6Ch
GREGBASE 	EQU 0bf00h
GSYSREG 	EQU GREGBASE + SYSREG
COLRREG 	EQU GREGBASE + 0bfh
LUTREG		EQU GREGBASE + 0fbh

GRAM    	EQU 0c000h
GRAMLEN 	EQU 4000h

SCRADDR 	EQU GRAM + 1 + 64*8 	; start of the working screen

ROWNUM  	EQU 17			; number of rows on the working screen
COLNUM  	EQU 30         	; number of columns on the working screen

FRMADDR		EQU GRAM
FRMWIDT		EQU COLNUM + 2
FRMHIGT		EQU 24

NEWSTK  	EQU 0beffh		; new address of stack

CBLACK		EQU 0
CBLUE		EQU 1
CGREEN		EQU 2
CYELLOW		EQU 3
CMAIN 		EQU 4			; color of the main character
CRED		EQU 2

SCOLNUM		EQU 1			; index of the start column for saboteur on the new screen
ECOLNUM		EQU COLNUM-6	; index of the last column for saboteur on the new screen
SABSTADR	EQU SCRADDR + 64*8 + SCOLNUM
SROWNUM 	EQU 1			; index of the start row

SBWI		EQU 4			; width of the saboteur sprite
SBHI		EQU 6			; height of the saboteur sprite
		