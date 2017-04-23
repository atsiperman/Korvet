
SYSREG  EQU 7fh

TSYSREG EQU 0fa00h + SYSREG

GCONFIG EQU 6Ch
GRGBASE EQU 0bf00h
GSYSREG EQU GRGBASE + SYSREG
COLRREG EQU GRGBASE + 0bfh

GRAM    EQU 0c000h
GRAMLEN EQU 4000h

SCRADDR EQU GRAM ;+512+16 ; start of the working screen

ROWNUM  EQU 17			; number of rows on the working screen
COLNUM  EQU 30         	; number of columns on the working screen


NEWSTK  EQU 0beffh

CBLACK	EQU 0
CBLUE	EQU 1
CGREEN	EQU 2
CYELLOW	EQU 6
