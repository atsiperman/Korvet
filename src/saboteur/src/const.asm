
SYSREG  	EQU 7fh

TVRGBASE	EQU 0fb00h
TSYSREG 	EQU 0fa00h + SYSREG


TRAM		EQU 0fc00h
TSTARTC		EQU 17			; start colnum number in text RAM
TSTARTR		EQU 2			; start row number in text RAM
TLINELEN    EQU 64          ; length of the text line
           
CHFULL		EQU 171			; full character is occupied (two vertical tiles)
CHBOTM		EQU 172         ; bottom half of the character is occupied
CHTOP		EQU 175         ; top half of the character is occupied

GCONFIG 	EQU 6Ch
GREGBASE 	EQU 0bf00h
GSYSREG 	EQU GREGBASE + SYSREG 
COLRREG 	EQU GREGBASE + 0bfh
LUTREG		EQU GREGBASE + 0fbh

TVISTS      EQU TVRGBASE + 38h
TVIREG		EQU TVRGBASE + 3ah

ATRSET  	EQU 10h 		; set inversion attr
ATRRES  	EQU 20h			; reset inversion attr
ALTCHAR		EQU 4 + 32		; alternative character set + inversion bit off

GRAM    	EQU 0c000h
GRAMLEN 	EQU 4000h

ROWNUM  	EQU 17			; number of rows on the working screen
COLNUM  	EQU 30         	; number of columns on the working screen
MAXCOL      EQU COLNUM - 1  ; max column index
MAXROW      EQU ROWNUM - 1  ; max row index

COLWIDB		EQU 2 + 1 + 1 + 8	; size of one column in screen buffer, bytes
                                ; 2, sprite address
                                ; 1 tile state
                                ; 1, attributes
                                ; 8 sprite data

TLMDATR     EQU 3               ; displacement to tile attributes

ROWWIDB		EQU COLNUM * COLWIDB	; width of the row in screen buffer, bytes  

FRMADDR		EQU GRAM + 16 + 64*32
FRMWIDT		EQU COLNUM + 2
FRMHIGT		EQU 24
FRMADRT		EQU TRAM + 2*64 + 16	; address of the frame in text RAM


SCRADDR 	EQU GRAM + 17 + 64*32 + 64*8 	; start of the working screen
TRIMADR     EQU SCRADDR + 64 * 8 * 18 + 26  ; start of the memory to show triggered image
HELDADR     EQU SCRADDR + 64 * 8 * 18       ; start of the memory to show an object being held
TIMESCRA    EQU SCRADDR + 64 * 8 * 19 + 22
PAYSCRA     EQU SCRADDR + 64 * 8 * 18 + 5   ; start of the memory to print 'PAY' text

NEWSTK  	EQU 0beffh		; new address of stack

                            ; logical colors
CBLACK		EQU 0                            
CBLUE		EQU 1
CRED        EQU 2           
CGREEN		EQU 2   ; CRED + text
CYELLOW		EQU 3
CCYAN		EQU 3   ; CYELLOW + text
CWHITE		EQU 0   ; CBLACK + text

CMAIN 		EQU 4			; color of the main character


;COLORCLR	EQU 80h + ((7 & CMAIN) << 1)	; color to clear working screen
COLORCLR	EQU ((7 & ~CMAIN) << 1) + 1		; color to clear working screen
CMAINREG	EQU ((7 & ~CMAIN) << 1) + 1

NUMFGC      EQU 80h + (CWHITE << 1)
NUMBKC      EQU 80h + (CBLUE << 1)
