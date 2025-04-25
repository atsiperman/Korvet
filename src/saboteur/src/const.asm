
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

RESCONF     EQU 0h
DOSCONF     EQU 1Ch
GCONFIG 	EQU 6Ch
GREGBASE 	EQU 0bf00h
GSYSREG 	EQU GREGBASE + SYSREG 
COLRREG 	EQU GREGBASE + 0bfh
LUTREG		EQU GREGBASE + 0fbh

SNDREGD 	EQU     0FB00H     ; sound data register
SNDREGM 	EQU     0FB03H     ; sound mode register
SNDREGS 	EQU     0FB32H     ; enable sound register

SNDEN   	EQU     8       ; enable sound 
SNDDIS  	EQU     0       ; disable sound
SNDMOD  	EQU     36h     ; timer sound mode 

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

VERTDISP    EQU 64*8
SCRADDR 	EQU GRAM + 17 + VERTDISP * 5      ; start of the working screen
TRIMADR     EQU SCRADDR + VERTDISP * 18 + 26  ; start of the memory to show triggered image
HELDADR     EQU SCRADDR + VERTDISP * 18       ; start of the memory to show an object being held
TIMESCRA    EQU SCRADDR + VERTDISP * 19 + 22
PAYSCRA     EQU SCRADDR + VERTDISP * 18 + 5   ; start of the memory to print 'PAY' text
SCORSCRA    EQU PAYSCRA + 10                ; start of the memory to print scores

MNTITSCR    EQU SCRADDR + VERTDISP * 2 + 7
MNSTSCRA    EQU MNTITSCR + (VERTDISP * 4)

NEWSTK  	EQU 0beffh		; new address of stack

                            ; logical colors
CBLACK		EQU 0                            
CBLUE		EQU 1
CRED        EQU 2           
CGREEN		EQU 2           ; CRED + text
CYELLOW		EQU 3
CCYAN		EQU 3           ; CYELLOW + text
CWHITE		EQU 0           ; CBLACK + text

CMAIN 		EQU 4			; color of the main character


COLORCLR	EQU 80h + (CMAIN << 1)	; color to clear working screen
;COLORCLR	EQU ((7 & ~CMAIN) << 1) + 1		; color to clear working screen
;COLORCLR	EQU 128 + CBLACK        		; color to clear working screen
CMAINREG	EQU ((7 & ~CMAIN) << 1) + 1

DEADFGC     EQU 80h + (CRED << 1)
DEADBKC     EQU 80h + (CBLUE << 1)

;DEADFGC     EQU ((7 & ~CRED) << 1) + 1
;DEADBKC     EQU ((7 & ~CBLUE) << 1) + 1

NUMFGC      EQU 80h + (CWHITE << 1)
NUMBKC      EQU 80h + (CBLUE << 1)

TIMEFGCI    EQU 80h + (CRED << 1)           ; inverted foreground color for timer
TIMEBKCI    EQU 80h + (CYELLOW << 1)        ; inverted background color for timer

TEXTFGC     EQU 80h + (CWHITE << 1)

AUTHFGC     EQU 80h + (CGREEN << 1)
CLIVEFGC    EQU 80h + (CRED << 1)

AUTHSCRA    EQU SCRADDR - 8 + VERTDISP * 23
CLIVSCRA    EQU SCRADDR - 5 - VERTDISP * 2


SCREND	EQU 255
LINELEN EQU 15 << 4
DUPLEN	EQU 14 << 4

TXLINEV EQU 1
TXLINEH EQU 2

OBJMAP  EQU 1       ; object map marker
STOMAP  EQU 2       ; static object map marker
MSKOMAP EQU 3       ; masked object map marker
TRIGMAP EQU 4       ; trigger map
TXTSMAP EQU 5       ; text screen map marker
FSTRDRP EQU 6       ; first render post processing procedure
BMSOMAP EQU 7       ; background masked object map marker
SCRINIP EQU 8		; screen initialization procedure to be called after screen decompression

		macro mktxtaddr colnum, rownum
		dw TRAM + TSTARTC + colnum + 64*(TSTARTR + rownum)
		endm

		; sprite map length
		macro spmaplen	bmap, emap
		db	(emap - bmap)
		endm

		macro mscrend
		db	SCREND
        db	SCREND
		endm

		macro mkbyte hi,lo
		db (hi << 4) | lo
		endm
								
		macro mkline len
		db LINELEN | len
		endm
		
		macro mkdup len
		db DUPLEN | len
		endm

		; ---- enable sound 
		macro ENSND
			ld hl,SNDREGS
			ld (hl),SNDEN
		endm

		; ---- disable sound
		macro DISSND
			ld hl,SNDREGS
			ld (hl),SNDDIS
		endm

        ; ---- defines number of notes
        macro notesnum endlabl
            db (endlabl - ($+1)) / 3    ; number of notes
        endm

        macro mknote pitch, duration
            dw pitch
            db duration
        endm
