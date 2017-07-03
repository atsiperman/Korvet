;        .Z80

;        ASEG

        ORG 100h
		di
        jp start

		include "sbmacro.asm"		
        include "const.asm"
		include "object_def.asm"
		include "screen_control.asm"
		
		include "saboteur_ladder.asm"
		include "saboteur_control.asm"
		
        include "screen_utils.asm"
		include "keyboard.asm"
		include "game.asm"
		include "drawsprite.asm"
		include "screen_draw.asm"
		include "draw_frame.asm"
		include "object_draw.asm"
		
        include "background_sprites.asm"
        include "screens.asm"
		include "screens/screens-11.asm"
		include "screens/screens-23.asm"
				
		include "saboteur_sprites.asm"		
		include "control_data.asm"		
		include "frame_sprites.asm"		
		include "strings.asm"
		include "screen_map.asm"		

start:
        call clrtscr
		call drawfrmt	; draw frame in text ram 		

        ld hl,0
        add hl,sp
        ld (OLDSTK),hl
        ld sp,NEWSTK
		
        GRMODON
		call lutsetup

        ld a,80h 
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

