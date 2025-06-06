paystr:
        db .paystr - paystr - 1
        db "GONORAR",COLONCH,DOLRCH,SPACECH ;,SPACECH,SPACECH,SPACECH,SPACECH,SPACECH
.paystr

TXTCOLD EQU 5           ; text displacement
TXTCOLN EQU 12          ; column in text video memory

menu:
        dw MNSTSCRA + TXTCOLD, txtlvl0
        dw MNSTSCRA + (VERTDISP * 2) + TXTCOLD, txtlvl1
        dw MNSTSCRA + (VERTDISP * 4) + TXTCOLD, txtlvl2
        dw MNSTSCRA + (VERTDISP * 6) + TXTCOLD, txtlvl3
        dw MNSTSCRA + VERTDISP * 8  + TXTCOLD, txtlvl4
        dw MNSTSCRA + VERTDISP * 10  + TXTCOLD, txtlvl5
        dw MNSTSCRA + VERTDISP * 13 + 2, txtexit
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
        db .txlvl0 - txtlvl0 - 1, "PROSTOJ"
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
        db .txlvl4 - txtlvl4 - 1, "MASTER" ;
.txlvl4:        

txtlvl5:
        db .txlvl5 - txtlvl5 - 1, "PROFI"
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
			mktxtaddr TXTCOLN, 3
			db CHFULL
        mkbyte TXLINEH,7
			mktxtaddr TXTCOLN, 4
			db CHFULL
        mkbyte TXLINEH,7
			mktxtaddr TXTCOLN, 5
                        db CHFULL
        mkbyte TXLINEH,7
			mktxtaddr TXTCOLN, 6
			db CHFULL
        mkbyte TXLINEH,13
			mktxtaddr TXTCOLN, 7
			db CHFULL
        mkbyte TXLINEH,7
			mktxtaddr TXTCOLN, 8
			db CHFULL
        mkbyte TXLINEH,13
			mktxtaddr 9, 10
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
        call fillvram	; clear screen with blue
        call prauthor
        GRMODOFF
        
        call mnshow
        call enablemm   ; enable menu melody
.mnkb:
        call kbread
        or  a
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

        call disablmm   ; disable menu melody
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
        halt
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
        ld   c,7
.mkp:    
        halt
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
        jp prntnum

; ----- prints text for game end
;
prntend:
        halt
        ld d,CHFULL
        call clrtscr.filts

        GRMODON
        ld a,NUMBKC 
        call fillvram                           ; clear screen with blue

        sblcurst
        cp  sbdead
        jp  nz,.prntok  

        ; saboteur is dead
        ;;ld   hl,0               ; remove objects
        ;;ld   (objlist),hl       ; from screen
        ;;call drawscr

        ld  b,DEADFGC
        ld  c,DEADBKC                           
        ld   de,MNTITSCR
        ld   hl,tmfailed                        ; print end game text 
        call prntstr
        jp  .gend

.prntok:        
        ld  b,TEXTFGC
        ld  c,NUMBKC
        ld   de,MNTITSCR
        ld   hl,tmcomplt
        call prntstr

;;.dskbns:
        ld  a,(sbholds)                         ; get object from pocket
        cp  trodisk                             ; is it a disk ?
        jp  z,.pntdsk                           ; print disk text if yes

        ld   hl,escscor                         ; otherwise add score for empty escape
        call addscore
        jp   .elvlbs

.pntdsk:
        ld  hl,escwdsk
        call addscore

        ld      a,(timractv)                    ; load timer mode
        cp      TIMRCNTD                        ; is bomb planted ?
        jp      nz,.pntds2                      ; skip adding score for bomb if no

        ld  hl,escwdab
        call addscore

.pntds2:
        ld  b,TEXTFGC
        ld  c,NUMBKC
        ld   de,MNTITSCR + (VERTDISP * 2) + 4
        ld   hl,dsktaken
        call prntstr

.elvlbs:        
                                                ; add bonus for difficulty level, if any
        ld  a,(dlevel)                          ; load difficulty level
        dec a                                   ; no bonus for the first level
        jp  z,.gend
        
        cp  5                                   ; is the most difficult ?
        jp  nz,.lvbns                           ; skip if not

        push af
                                                ; otherwise add extra bonus
        ld  hl,lvlbnsd                          ; difficulty level bonus
        ld  de,dlvlbns + 5                      ; address of the last byte
        call addscore.adscr                     ; add bonus

        pop  af
        
.lvbns:
        push af
        ld  hl,lvlbnsd                          ; difficulty level bonus
        ld  de,dlvlbns + 5                      ; address of the last byte
        call addscore.adscr                     ; add bonus
        pop  af
        dec  a
        jp   nz,.lvbns

        ld  hl,dlvlbns+1                        ; add level bonus to total number
        call addscore

        ld  b,TEXTFGC
        ld  c,NUMBKC
        push bc
        ld   de,MNTITSCR + (VERTDISP * 4) - 4
        ld   hl,lvlbnst                         ; level bonus text
        call prntstr

        pop  bc                                 ; restore colors
        push bc
        ld   hl,dlvlbns                         ; level bonus number
        ld   de,MNTITSCR + (VERTDISP * 4) + 16
        call prntnum                            ; print level bonus

        pop  bc                                 ; restore colors
        push bc
        ld   de,MNTITSCR + (VERTDISP * 7) + 2
        ld   hl,totlbns                         ; total score text
        call prntstr

        pop  bc                                 ; restore colors
        ld   hl,score                           ; total score
        ld   de,MNTITSCR + (VERTDISP * 7) + 9
        call prntnum                            ; print total score

;;.prnte:
        ;;call drwnums

.gend:
        GRMODOFF

        ld   c,50
        call mkpause.mkp

        jp waitkey
        