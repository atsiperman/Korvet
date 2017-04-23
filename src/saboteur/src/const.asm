
SYSREG  EQU 7fh

TSYSREG EQU 0fa00h + SYSREG

GCONFIG EQU 6Ch
GRGBASE EQU 0bf00h
GSYSREG EQU GRGBASE + SYSREG
COLRREG EQU GRGBASE + 0bfh

GRAM    EQU 0c000h
GRAMLEN EQU 4000h

SCRADDR EQU GRAM       ; start of working screen
SCRLEN  EQU 2000h      ; length of working screen
COLNUM  EQU 32         ; number of columns on screen

NEWSTK  EQU 0beffh
