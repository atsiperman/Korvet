
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

COLWIDB		EQU 2 + 1 + 1 + 8	; size of one column in screen buffer, bytes
							; 2, sprite address
							; 1 tile state
							; 1, attributes
							; 8 sprite data

ROWWIDB		EQU COLNUM * COLWIDB	; width of the row in screen buffer, bytes  

FRMADDR		EQU GRAM + 16 + 64*32
FRMWIDT		EQU COLNUM + 2
FRMHIGT		EQU 24
FRMADRT		EQU TRAM + 2*64 + 16	; address of the frame in text RAM


SCRADDR 	EQU GRAM + 17 + 64*32 + 64*8 	; start of the working screen


NEWSTK  	EQU 0beffh		; new address of stack

							; logical colors
CBLUE		EQU 0
CGREEN		EQU 1
CRED        EQU 2
CYELLOW		EQU 3
CBLACK		EQU 4

CWHITE		EQU 2		; CRED
CCYAN		EQU 3 		; CYELLOW			

CMAIN 		EQU CBLACK			; color of the main character

;COLORCLR	EQU 80h + ((7 & CMAIN) << 1)	; color to clear working screen
COLORCLR	EQU ((7 & ~CMAIN) << 1) + 1		; color to clear working screen
CMAINREG	EQU ((7 & ~CMAIN) << 1) + 1



		
