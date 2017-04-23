;        .Z80

;        ASEG

        ORG 100h
        jp main

OLDSTK: dw 0            ; save stack to return to cp/m

        include "const.asm"
        include "screen_utils.asm"
        include "background_sprites.asm"
        include "background.asm"

main:
        call clrtscr

        ld hl,0
        add hl,sp
        ld (OLDSTK),hl
        ld sp,NEWSTK

        GRMODON

        ld a,80h
        call fillscr

; main cycle
        ld de,SCRBK1
        call drawbkgr

        GRMODOFF
        call bgkprsd

; exit to cp/m
        ld hl,(OLDSTK)
        ld sp,hl
        ret

;END 100h

