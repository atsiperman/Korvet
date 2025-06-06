strtime:
        db 4,8

        db 0, 130, 8, 39, 32, 3 
        db 0, 154, 107, 231, 44, 3 
        db 0, 154, 107, 226, 44, 3 
        db 0, 134, 104, 96, 32, 3 
        db 0, 154, 9, 229, 52, 3 
        db 0, 154, 121, 231, 52, 3 
        db 0, 154, 121, 231, 52, 3 
        db 0, 130, 120, 39, 52, 3 

nthnear:
        db 4,16

        db 0, 255, 255, 255, 255, 3 
        db 0, 255, 255, 255, 255, 3 
        db 0, 255, 255, 255, 255, 3 
        db 0, 255, 255, 255, 255, 3 
        db 0, 255, 255, 255, 255, 3 
        db 0, 255, 255, 255, 255, 3 
        db 0, 255, 255, 255, 255, 3 
        db 0, 255, 255, 255, 255, 3 
        db 0, 255, 255, 255, 255, 3 
        db 0, 4, 24, 96, 156, 3 
        db 0, 53, 153, 102, 156, 3 
        db 0, 53, 153, 102, 136, 3 
        db 0, 4, 25, 102, 128, 3 
        db 0, 62, 153, 102, 148, 3 
        db 0, 62, 144, 38, 156, 3 
        db 0, 62, 151, 160, 156, 3 

nthnheld:
        db 4,16

        db 0, 0,   0,   0,   0,  0
        db 0, 0,   0,   0,   0,  0
        db 0, 0,   0,   0,   0,  0
        db 0, 0,   0,   0,   0,  0
        db 0, 0,   0,   0,   0,  0
        db 0, 0,   0,   0,   0,  0
        db 0, 0,   0,   0,   0,  0

        db 0, 255, 255, 255, 255, 3 
        db 0, 255, 255, 255, 255, 3 
        db 0, 134, 8, 37, 44, 3 
        db 0, 150, 121, 165, 44, 3 
        db 0, 150, 121, 165, 44, 3 
        db 0, 150, 24, 32, 32, 3 
        db 0, 150, 121, 229, 60, 3 
        db 0, 2, 121, 229, 60, 3 
        db 0, 122, 9, 229, 32, 3 

digits: 
        ; bitmap data for drawing digits
        ; 0 -> 9
        db 0, 126, 66, 66, 70, 70, 126, 0
        db 0, 2, 2, 2, 6, 6, 6, 0
        db 0, 126, 2, 2, 126, 96, 126, 0
        db 0, 126, 2, 30, 6, 6, 126, 0
        db 0, 66, 66, 126, 6, 6, 6, 0
        db 0, 126, 64, 126, 6, 6, 126, 0
        db 0, 126, 64, 126, 70, 70, 126, 0
        db 0, 126, 2, 2, 6, 6, 6, 0
        db 0, 126, 66, 126, 70, 70, 126, 0
        db 0, 126, 66, 126, 6, 6, 6, 0

chars:
        ; bitmap data for drawing chars
        ; A -> J
        db 0, 126, 70, 70, 126, 70, 70, 0
        db 0, 126, 64, 126, 98, 98, 126, 0
        db 0, 100, 100, 100, 102, 102, 126, 2
        db 0, 62, 50, 50, 50, 50, 127, 65
        db 0, 126, 64, 126, 96, 96, 126, 0
        db 0, 126, 90, 90, 126, 24, 24, 0
        db 0, 126, 98, 96, 96, 96, 96, 0
        db 0, 66, 102, 60, 60, 102, 66, 0
        db 0, 70, 70, 78, 94, 118, 102, 0
        db 0, 86, 70, 78, 94, 118, 102, 0
        ; K-T
        db 0, 100, 108, 120, 124, 100, 100, 0
        db 0, 28, 60, 108, 76, 76, 76, 0
        db 0, 98, 118, 126, 106, 98, 98, 0
        db 0, 98, 98, 126, 98, 98, 98, 0
        db 0, 126, 98, 98, 98, 98, 126, 0
        db 0, 126, 98, 98, 98, 98, 98, 0
        db 0, 126, 66, 126, 62, 38, 102, 0
        db 0, 126, 98, 98, 126, 96, 96, 0
        db 0, 126, 98, 96, 96, 98, 126, 0
        db 0, 126, 24, 24, 24, 24, 24, 0
        ; U-CH
        db 0, 70, 70, 126, 6, 6, 126, 0         ; U У
        db 0, 73, 73, 127, 127, 73, 73, 0       ; V Ж
        db 0, 124, 98, 124, 98, 98, 124, 0      ; W В
        db 0, 96, 96, 126, 98, 98, 126, 0       ; X Ь
        db 0, 98, 98, 122, 106, 106, 122, 0     ; Y Ы
        db 0, 126, 6, 60, 6, 6, 126, 0          ; Z З
        db 0, 65, 73, 73, 107, 107, 127, 0      ; [ Ш
        db 0, 126, 6, 30, 6, 6, 126, 0          ; \ Э
        db 0, 66, 66, 106, 106, 106, 127, 1     ; ] Щ
        db 0, 70, 70, 126, 6, 6, 6, 0           ; ^ Ч

        db 0, 94, 82, 114, 82, 90, 94, 0        ; _ Ю
        db 0, 96, 32, 62, 38, 38, 62, 0         ; ` Ъ
        db 0, 8, 62, 40, 62, 10, 62, 8          ; `+1 - $
        db 0, 0, 8, 0, 0, 8, 0, 0               ; `+2 - :
        db 0, 0, 0, 0, 0, 0, 0, 0               ; `+3 - ' ' space

DOLRCH  EQU '`' + 1
COLONCH EQU '`' + 2
SPACECH EQU '`' + 3


authinfo:
        db .ainfo - authinfo - 1
        db "AWTOR",SPACECH,"WERSII",SPACECH,"DLQ",SPACECH,"PK",SPACECH,"KORWET",SPACECH,"CIPERMAN",SPACECH,"ALEKSEJ"
.ainfo        

authdate:
        db 4
        db 2,0,2,5

cliveinf:
        db .clivinf - cliveinf - 1
        db "AWTOR",SPACECH,"ORIGINALXNOJ",SPACECH,"IGRY",SPACECH,"KLAJW",SPACECH,"TAUNSEND"
.clivinf

clivdate:
        db 4, 1,9,8,6

tmcomplt:
        db .complt - tmcomplt - 1
        db "ZADANIE",SPACECH,"WYPOLNENO"
.complt:

dsktaken:
        db .dsktkn - dsktaken - 1
        db "DISK",SPACECH,"WZQT"
.dsktkn:

tmfailed:
        db .tmfail - tmfailed - 1
        db "ZADANIE",SPACECH,"PROWALENO"
.tmfail:

lvlbnst:
        db lvlbnst.endlb - lvlbnst - 1
        db "BONUS",SPACECH,"ZA",SPACECH,"SLOVNOSTX",COLONCH,DOLRCH
.endlb:

totlbns:
        db totlbns.endtb - totlbns - 1
        db "WSEGO",COLONCH,DOLRCH
.endtb: