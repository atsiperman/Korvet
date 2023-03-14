;        .Z80

;        ASEG

        ORG 100h
        jp start

graph_mode_on:      
        db 0

; -----  switches to graphics mode
;
        macro   GRMODON 
        di
        ld   a,GCONFIG
        ld   (TSYSREG),a
        ld   (graph_mode_on),a
        ei        
        endm

; -----  switches back to CP/M
;
        macro   GRMODOFF 
        di
        ld   a,DOSCONF
        ld   (GSYSREG),a
        xor  a
        ld   (graph_mode_on),a        
        ei
        endm

		;define PRINTFPS

        include "interrupts.asm"
        include "const.asm"
		include "sbmacro.asm"	
		include "object_def.asm"
		include "sprites/dog_sprites.asm"				
		include "control_data.asm"						
		include "screens/trigger_map.asm"		
		include "screens/object_map.asm"

;------ screen buffer		
;
scrbuf:
        ; --- all the code below is located inside screen buffer
        ; it is intended for intialization only, after that it will be destoryed 
		include "drawing/mirror_table.asm"
		include "sprites/guard_sprites.asm"
        include "sprites/saboteur_sprites.asm"
        include "sound_data.asm"
        include "game_init.asm"        
        include "upper_block_def.asm"
        
		include "init.asm"
        ; MIRFLEN - size of the file with mirroring procs & data
        ; minus total length of saboteur sprites data
        ; this place will be reused as a screen buffer

TMPDLEN EQU MIRFLEN + (sabinit.endinit - sabinit) + (sabspend - _sabjmpr1) + (guarde - guardst) + (ginitend - ginitst) + (sndend - sndstrt)
        dw ROWNUM * ROWWIDB
        dup (ROWNUM * ROWWIDB) - TMPDLEN - 4
        db 0
        edup
;------ end of screen buffer		

        display "scrbuf start:   ", scrbuf
        display "scrbuf end:     ", $
        display "scrbuf free:    ", $ - scrbuf - TMPDLEN
        display "scrbuf size:    ", $ - scrbuf
        display "temp data size: ", TMPDLEN
        display "upper page size:", 0fa00h - 0c000h
        display "upper page top: ", uppertop
        display "upper page free:", 0fa00h - uppertop

        if uppertop >= 0fa00h
            error "Upper page size exceeded!!!"
        endif

; ---- END OF SCREEN BUFFER ----

		include "sprites/gun_sprites.asm"
        include "sprites/background_sprites.asm"
		include "sprites/frame_sprites.asm"				
		include "sprites/strings.asm"
		include "sprites/static_object_sprites.asm"
        include "sprites/trigger_sprites.asm"

        include "sprites/sab_sprites_control.asm"

		include "sound.asm"	

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
		
		include "screens/screen_map.asm"		
		
		include "screen_control.asm"
		include "mem_utils.asm"
		
        include "logic/first_render_procs.asm"
		include "logic/dog_control.asm"
		include "logic/guard_control.asm"
        include "logic/guard_action.asm"
		        
		include "tiles_control.asm"

		include "drawing/scrbuf_utils.asm"
		include "drawing/draw_frame.asm"		
        include "drawing/screen_utils.asm"		
		include "drawing/screen_draw.asm"
		include "drawing/object_draw.asm"
        include "drawing/draw_digits.asm"

        include "logic/scores.asm"
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
        include "logic/helpers.asm"
			

        include "logic/helicopter.asm"        
		include "keyboard.asm"
		include "game.asm"
        include "menu.asm"

; -----------------------------------------------------------

start:
		di

        call install_interrupt_handler
		ld a, ALTCHAR
		ld (TVIREG),a

        ld hl,0
        add hl,sp
        ld (OLDSTK),hl
        ;;ld sp,NEWSTK
        ld  sp,100h - 1
		
		call sabinit

        GRMODON
        di
		call lutsetup
        ei
        GRMODOFF

        INITSND
.main:
        call runmenu
        or  a
        jp  z,.exit

        call ginitscr   ; init game screen		
					        
        call gcycle     ; main cycle
        call mkpause
        jp  .main

.exit:
						; exit to cp/m
        ; ; ld hl,(OLDSTK)
        ; ; ld sp,hl

        di
        ld a,RESCONF
        ld (TSYSREG),a

		jp 0			; soft reset

        display 0beffh - $, " bytes free"

        dup 0beffh - $  ; stack guard for the rest
            db 0
        edup

;END 100h

