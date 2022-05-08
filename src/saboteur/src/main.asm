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
		include "sprites/frame_sprites.asm"				
		include "sprites/strings.asm"
		include "sprites/static_object_sprites.asm"
        include "sprites/trigger_sprites.asm"
		include "screens/trigger_map.asm"		
		include "screens/object_map.asm"

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
        include "logic/helpers.asm"        
				
;------ screen buffer		
;
scrbuf:
		include "sprites/guard_sprites.asm"
        include "sprites/saboteur_sprites.asm"
		include "drawing/mirror_table.asm"

mirtable EQU 0c000h
sabjmpr1 EQU mirtable + 256

sabjmpr2 EQU sabjmpr1 + (_sabjmpr2 - _sabjmpr1)
sabkckr1 EQU sabjmpr2 + (_sabkckr1 - _sabjmpr2)
sabkckr2 EQU sabkckr1 + (_sabkckr2 - _sabkckr1)
sabfall  EQU sabkckr2 + (_sabfall - _sabkckr2)
sabsqtrt EQU sabfall + (_sabsqtrt - _sabfall)
sablad1  EQU sabsqtrt + (_sablad1 - _sabsqtrt)
sablad2  EQU sablad1 + (_sablad2 - _sablad1)
sabsprt  EQU sablad2 + (_sabsprt - _sablad2)
sabspmr1 EQU sabsprt + (_sabspmr1 - _sabsprt)
sabspmr2 EQU sabspmr1 + (_sabspmr2 - _sabspmr1)
sabspmr3 EQU sabspmr2 + (_sabspmr3 - _sabspmr2)
sabspmr4 EQU sabspmr3 + (_sabspmr4 - _sabspmr3)
sabdead  EQU sabspmr4 + (_sabdead - _sabspmr4)

sabspml1 EQU sabdead + (_sabdead.sbdead - _sabdead)
sabspml2 EQU sabspml1 + (sabspmr2 - sabspmr1)
sabspml3 EQU sabspml2 + (sabspmr2 - sabspmr1)
sabspml4 EQU sabspml3 + (sabspmr2 - sabspmr1)

sabsplt  EQU sabspml4 + (sabspmr2 - sabspmr1)

sabjmpl1 EQU sabsplt + (sabspmr1 - sabsprt)
sabjmpl2 EQU sabjmpl1 + (sabjmpr2 - sabjmpr1)

sabkckl1 EQU sabjmpl2 + (sabkckr1 - sabjmpr2)
sabkckl2 EQU sabkckl1 + (sabkckr2 - sabkckr1)

sabpnchr EQU sabkckl2 + _sabfall - _sabkckr2
sabpnchl EQU sabpnchr + (_sabpnch.endpnch - _sabpnch)

dogspml1 EQU sabpnchl + (_sabpnch.endpnch - _sabpnch)
dogspml2 EQU dogspml1 + dogspmr2 - dogspmr1
dogspml3 EQU dogspml2 + dogspmr3 - dogspmr2
dogspml4 EQU dogspml3 + dogspmr4 - dogspmr3

ctrldata EQU dogspml4 + dogspmr4 - dogspmr3
objmdata EQU ctrldata + cdataend - cdatast
trmdata  EQU objmdata + objmend - objmst

gdsprt   EQU trmdata + trmapend - trmapst
gdsplt   EQU gdsprt + sabspmr1 - sabsprt

gdpnchr  EQU gdsplt + sabspmr1 - sabsprt
gdpnchl  EQU gdpnchr + (_sabpnch.endpnch - _sabpnch)

gdkckl1  EQU gdpnchl + (_sabpnch.endpnch - _sabpnch)
gdkckl2  EQU gdkckl1 + (_sabkckr1.sabkckr1 - _sabkckr1)

gdkckr1  EQU gdkckl2 + (_sabkckr2.sabkckr2 - _sabkckr2)
gdkckr2  EQU gdkckr1 + (_sabkckr1.sabkckr1 - _sabkckr1)

gdspml1  EQU gdkckr2 + (_sabkckr2.sabkckr2 - _sabkckr2)
gdspml2  EQU gdspml1 + (sabspmr2 - sabspmr1)
gdspml3  EQU gdspml2 + (sabspmr2 - sabspmr1)
gdspml4  EQU gdspml3 + (sabspmr2 - sabspmr1)

; ----- no more space in upper memory block

		include "init.asm"
        ; MIRFLEN - size of the file with mirroring procs & data
        ; minus total length of saboteur sprites data
        ; this place will be reused as a screen buffer

TMPDLEN EQU MIRFLEN + (sabinit.endinit - sabinit) + (sabspend - _sabjmpr1) + (guarde - guardst) 
        dw TMPDLEN
        dw ROWNUM * ROWWIDB
        dup (ROWNUM * ROWWIDB) - TMPDLEN
        db 0
        edup

; --- reserve space for other sprites here, there is no more space in upper memory block
gdspmr1:
        dup  sabspmr2 - sabspmr1
        db 0
        edup
gdspmr2:
        dup  sabspmr2 - sabspmr1
        db 0
        edup
gdspmr3:
        dup  sabspmr2 - sabspmr1
        db 0
        edup
gdspmr4:
        dup  sabspmr2 - sabspmr1
        db 0
        edup

		include "keyboard.asm"
		include "game.asm"
        include "menu.asm"

; -----------------------------------------------------------

start:
		di
				
		ld a, ALTCHAR
		ld (TVIREG),a

        ld hl,0
        add hl,sp
        ld (OLDSTK),hl
        ld sp,NEWSTK
		
		call sabinit

        GRMODON
		call lutsetup
        GRMODOFF

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
        ld hl,(OLDSTK)
        ld sp,hl
		;ei		

        ld a,RESCONF
        ld (TSYSREG),a

		jp 0			; soft reset


;END 100h

