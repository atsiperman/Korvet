;        .Z80

;        ASEG

        ORG 100h
		di
        jp start

		include "sbmacro.asm"		
        include "const.asm"
        include "screen_utils.asm"
        include "background_sprites.asm"
        include "screens.asm"
		include "keyboard.asm"
		include "game.asm"
		include "saboteur_sprites.asm"
		include "drawsprite.asm"
		include "control_data.asm"
		include "screen_draw.asm"
		include "frame_sprites.asm"
		include "draw_frame.asm"
		include "strings.asm"
		include "screen_map.asm"

start:
        call clrtscr

        ld hl,0
        add hl,sp
        ld (OLDSTK),hl
        ld sp,NEWSTK

        GRMODON
		call lutsetup

        ld a,8eh 
        call fillscr	; clear screen with black

		call drawfrm	; draw frame
		
        GRMODOFF
		
main:					; main cycle
        GRMODON

		call drawscr
				
        GRMODOFF
		
		call gmain		; test keyboard 
		and a		
		jp z,main		; continue if zero

						; exit to cp/m
        ld hl,(OLDSTK)
        ld sp,hl
		ei
        ret

;END 100h

