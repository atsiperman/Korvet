paystr:
        db .paystr - paystr - 1
        db "GONORAR",COLONCH,DOLRCH,SPACECH,SPACECH,SPACECH,SPACECH,SPACECH,SPACECH
.paystr

menu:
        dw MNSTSCRA, txtlvl0
        dw MNSTSCRA + (VERTDISP * 2), txtlvl1
        dw MNSTSCRA + (VERTDISP * 4), txtlvl2
        dw MNSTSCRA + (VERTDISP * 6), txtlvl3
        dw MNSTSCRA + VERTDISP * 8, txtlvl4
        dw MNSTSCRA + VERTDISP * 10, txtlvl5
        dw MNSTSCRA + VERTDISP * 13, txtexit
menue:

menuptr:
        db 1        ; number of the current menu item
        dw menu     ; address of the menu item data

MENUITS EQU 4                               ; menu item size, bytes
MENUITN EQU (menue - menu) / MENUITS 

menutit:
        db .menut - menutit - 1, "UROWENX", SPACECH, "SLOVNOSTI"
.menut:


txtlvl0:
        db .txlvl0 - txtlvl0 - 1, "O^ENX",SPACECH,"LEGKIJ"
.txlvl0:

txtlvl1:
        db .txlvl1 - txtlvl1 - 1, "LEGKIJ"
.txlvl1:

txtlvl2:        
        db .txlvl2 - txtlvl2 - 1, "SREDNIJ"
.txlvl2:        

txtlvl3:
        db .txlvl3 - txtlvl3 - 1, "TRUDNYJ"
.txlvl3:        

txtlvl4:
        db .txlvl4 - txtlvl4 - 1, "O^ENX",SPACECH,"TRUDNYJ"
.txlvl4:        

txtlvl5:
        db .txlvl5 - txtlvl5 - 1, "TQVELYJ"
.txlvl5:        

txtexit:
        db .txtext - txtexit - 1, "WYJTI",SPACECH,"IZ",SPACECH,"IGRY"
.txtext:

menutxt:
        mkbyte TXLINEH,15
			mktxtaddr 7, 1
			db CHFULL
        mkbyte TXLINEH,2
			mktxtaddr 22, 1
			db CHFULL

        mkbyte TXLINEH,12
			mktxtaddr 7, 3
			db CHFULL
        mkbyte TXLINEH,7
			mktxtaddr 7, 4
			db CHFULL
        mkbyte TXLINEH,7
			mktxtaddr 7, 5
            db CHFULL
        mkbyte TXLINEH,7
			mktxtaddr 7, 6
			db CHFULL
        mkbyte TXLINEH,13
			mktxtaddr 7, 7
			db CHFULL
        mkbyte TXLINEH,7
			mktxtaddr 7, 8
			db CHFULL
        mkbyte TXLINEH,13
			mktxtaddr 7, 10
			db CHFULL
        db SCREND

; ----- runs menu
; result: A - 0 to exit, non-zero - start game
;
runmenu:
        call clrtscr

        ld   hl,menutxt
        call drwtram

        ; fill in text ram for author's information
        ld hl,TRAM + 9 + 64*14
        ld  a,(authinfo)
        add 6               ; total length text and date
        ld  c,CHFULL
        call filtline
        
        GRMODON
        ld a,NUMBKC 
        call fillvram	; clear screen with black
        call prauthor
        GRMODOFF
        
        call mnshow

.mnkb:
        call kbread
		and 255
		jp  z,.mnkb

        cp  KESC
        jp  nz,.mn1
        xor a           ; ESC - exit
        ret
        
.mn1:
        cp  KUP
        jp  z,.mnup

        cp  KDOWN
        jp  z,.mndown

        cp  KSPACE
        ;ret z           ; KSPACE - start game, return current A (>0)
        jp  nz,.mnkb

        ld  a,(menuptr) ; load selected item number
        cp  MENUITN
        ret nz          ; A != 0 and not the last item -> start game
        xor a           ; last item is selected - exit game -> return 0 to exit
        ret 

.mnup:
        ld  a,(menuptr)
        cp  1
        jp  z,.mnkb
        dec a
        ld  hl,(menuptr + 1)
        dup MENUITS             ; move pointer to previous item
            dec hl                  
        edup
        jp .mnkb2

.mndown:
        ld  a,(menuptr)
        cp  MENUITN
        jp  z,.mnkb
        inc a
        ld  hl,(menuptr + 1)
        dup MENUITS             ; move pointer to next item
            inc hl                  
        edup

.mnkb2:
        ld  (menuptr),a         ; save current item number
        ld  (menuptr + 1),hl    ; save new pointer    

        call mnshow
        call mkpause

        jp  .mnkb

; ----- shows menu
;
mnshow:
        GRMODON

        ld  b,NUMFGC
        ld  c,NUMBKC

        ld   de,MNTITSCR
        ld   hl,menutit
        call prntstr

        ld   a,1
        ld   hl,menu
.mn1:
        load_de_hl      ; load screen address
        push de
        load_de_hl      ; load string pointer
        pop  bc
        push hl
        push bc        
        ex  de,hl
        pop  de         ; restore screen address
        push af
        ld  b,a         ; save current item number
        ld  a,(menuptr) ; load selected item number
        cp  b
        jp  z,.mn2      ; current = selected

        ld  b,NUMFGC
        ld  c,NUMBKC
        jp  .mn3

.mn2:
        ld  c,NUMFGC
        ld  b,NUMBKC
.mn3:
        call prntstr
        pop  af
        pop  hl
        inc  a
        cp   MENUITN + 1
        jp  nz,.mn1

        GRMODOFF
        ret        

; ----- makes a pause
;
mkpause:
        ld   c,10
.mkp:        
        call waitblnk
        dec  c
        jp   nz,.mkp
        ret

; ----- prints author information
;
prauthor:
        ld  b,CLIVEFGC
        ld  c,NUMBKC
        ld   de,CLIVSCRA
        ld   hl,cliveinf
        call prntstr

        ld  b,CLIVEFGC
        ld  c,NUMBKC
        ld  de,CLIVSCRA + 027h
        ld  hl,clivdate
        call prntnum

        ld  b,AUTHFGC
        ld  c,NUMBKC
        ld   de,AUTHSCRA
        ld   hl,authinfo
        call prntstr

        ld  b,AUTHFGC
        ld  c,NUMBKC
        ld  de,AUTHSCRA + 02Dh
        ld  hl,authdate
        call prntnum

        ret
