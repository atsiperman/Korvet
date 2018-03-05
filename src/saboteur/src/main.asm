;        .Z80

;        ASEG

        ORG 100h
		di
        jp start

		include "sbmacro.asm"		
        include "const.asm"
		include "object_def.asm"
		include "screen_control.asm"
		include "mem_utils.asm"
		include "control_data.asm"
		include "init.asm"
		
		include "tiles_control.asm"
		include "saboteur_ladder.asm"
		include "saboteur_control.asm"
		
		;include "drawing/scrbuf_utils.asm"
		include "drawing/drawsprite.asm"
		include "drawing/draw_frame.asm"		
		include "drawing/screen_draw.asm"
        include "drawing/screen_utils.asm"		
		
		include "drawing/object_draw.asm"		
		
		include "keyboard.asm"
		include "game.asm"
				
        include "sprites/background_sprites.asm"				
		include "sprites/saboteur_sprites.asm"				
		include "sprites/frame_sprites.asm"				
		include "sprites/strings.asm"
		
        include "screens/screens.asm"
		include "screens/screens-11.asm"
		include "screens/screens-23.asm"		
		include "screens/screen_map.asm"		

start:
		call sabinit
		
        call clrtscr
		call drawfrmt	; draw frame in text ram 		

        ld hl,0
        add hl,sp
        ld (OLDSTK),hl
        ld sp,NEWSTK
		
        GRMODON
		call lutsetup

		;call clrsbuf		; clear buffer
		
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

