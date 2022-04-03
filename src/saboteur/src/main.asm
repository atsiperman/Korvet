;        .Z80

;        ASEG

        ORG 100h
        jp start

        include "const.asm"
		include "sbmacro.asm"	
		include "object_def.asm"

		include "sprites/gun_sprites.asm"
        include "sprites/background_sprites.asm"
		include "control_data.asm"						

		include "sprites/dog_sprites.asm"		
		include "sprites/saboteur_sprites.asm"				
		include "sprites/frame_sprites.asm"				
		include "sprites/strings.asm"
		include "sprites/guard_sprites.asm"
		include "sprites/static_object_sprites.asm"
        include "sprites/trigger_sprites.asm"

mirtable EQU 0c000h
sabspml1 EQU mirtable + 256
sabspml2 EQU sabspml1 + (sabspmr2 - sabspmr1)
sabspml3 EQU sabspml2 + (sabspmr2 - sabspmr1)
sabspml4 EQU sabspml3 + (sabspmr2 - sabspmr1)

sabsplt  EQU sabspml4 + (sabspmr2 - sabspmr1)

sabjmpl1 EQU sabsplt + (sabspmr1 - sabsprt)
sabjmpl2 EQU sabjmpl1 + (sabjmpr2 - sabjmpr1)

sabkckl1 EQU sabjmpl2 + (sabkckr1 - sabjmpr2)
sabkckl2 EQU sabkckl1 + (sabkckr2 - sabkckr1)

dogspml1 EQU sabkckl2 + sabfall - sabkckr2
dogspml2 EQU dogspml1 + dogspmr2 - dogspmr1
dogspml3 EQU dogspml2 + dogspmr3 - dogspmr2
dogspml4 EQU dogspml3 + dogspmr4 - dogspmr3

scrbuf:									; screen buffer		
; -----------------------------------------------------------
        dup (ROWNUM * ROWWIDB) - 256 ; 256 - size of the mirror table, which will be copied into upper memory page
        db 0
        edup
		include "drawing/mirror_table.asm"
; -----------------------------------------------------------

		include "sound.asm"	
        
		include "screens/object_map.asm"
        include "screens/masked_object_map.asm"
		include "screens/static_object_map.asm"
        include "screens/screens.asm"
		include "screens/screens-11.asm"
		include "screens/screens-20.asm"
		include "screens/screens-30.asm"
		include "screens/screens-40.asm"
		include "screens/screens-50.asm"
		include "screens/screens-60.asm"
		include "screens/screens-70.asm"
		include "screens/screens-80.asm"
		include "screens/screens-90.asm"
		include "screens/screens-100.asm"
		include "screens/screens-110.asm"
		include "screens/screens-120.asm"
		
		include "screens/trigger_map.asm"		
		include "screens/screen_map.asm"		
		
		include "screen_control.asm"
		include "mem_utils.asm"
		include "init.asm"
		
        include "logic/first_render_procs.asm"
		include "logic/dog_control.asm"
		include "logic/guard_control.asm"
		        
		include "tiles_control.asm"

		include "drawing/scrbuf_utils.asm"
		include "drawing/draw_frame.asm"		
        include "drawing/screen_utils.asm"		
		include "drawing/screen_draw.asm"
		include "drawing/object_draw.asm"
        include "drawing/draw_digits.asm"

		include "logic/saboteur_utils.asm"
		include "logic/saboteur_fall.asm"
		include "logic/saboteur_ladder.asm"
		include "logic/saboteur_action.asm"
		include "logic/saboteur_control.asm"
		include "logic/saboteur_movements.asm"
		include "logic/saboteur_jump.asm"
		include "logic/health.asm"
		include "logic/gun_logic.asm"
		include "logic/triggers.asm"
        include "logic/wagons.asm"
				
		include "keyboard.asm"
		include "game.asm"
				
start:
		di
				
		ld a, ALTCHAR
		ld (TVIREG),a
        call clrtscr

		;call drawfrmt	; draw frame in text ram 		

        ld hl,0
        add hl,sp
        ld (OLDSTK),hl
        ld sp,NEWSTK
		
		call sabinit

        GRMODON
		call lutsetup
	
        ld a,COLORCLR 
        call fillvram	; clear screen with black

		call drawfrm	; draw frame
		
        GRMODOFF

main:					; main cycle
		DISSND

		call drawscr
					
		call sbstsnd

		call gmain		; test keyboard 
		or a		
		jp nz,main		; continue if not zero

exit:
						; exit to cp/m
        ld hl,(OLDSTK)
        ld sp,hl
		ei
		
		jp 0			; soft reset


;END 100h

