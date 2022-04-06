; ----- runs menu
; result: A - 0 to exit, non-zero - start game
;
runmenu:
        GRMODON
        ld a,COLORCLR 
        call fillvram	; clear screen with black
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
        ret z           ; KSPACE - start game, return current A (>0)
        jp  .mnkb

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
