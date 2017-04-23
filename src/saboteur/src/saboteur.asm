;        .Z80

;        ASEG

        ORG 100h
		di
        jp start

OLDSTK: dw 0            ; save stack to return to cp/m
CURSCR: dw SCRMAP		; pointer to current screen

		include "sbmacro.asm"		
        include "const.asm"
        include "screen_utils.asm"
        include "background_sprites.asm"
        include "screens.asm"
		include "keyboard.asm"
		include "game.asm"

start:
        call clrtscr

        ld hl,0
        add hl,sp
        ld (OLDSTK),hl
        ld sp,NEWSTK

        GRMODON

        ld a,8eh 
        call fillscr
        GRMODOFF

main:					; main cycle
        GRMODON

		ld a,80h
		call clrwscr
		
		ld hl,(CURSCR)
		ld e,(hl)
		inc hl
		ld d,(hl)
        call drawbkgr

        GRMODOFF
		
		call gmain
		and a		
		jp z,main		; continue if zero

						; exit to cp/m
        ld hl,(OLDSTK)
        ld sp,hl
		ei
        ret

;END 100h

