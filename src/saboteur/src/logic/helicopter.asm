; ---- control logic for helicopter

        macro copt_draw_tile scrbufadr_ptr, video_adr_ptr, oper
            ld   hl,(scrbufadr_ptr)
            ex   de,hl
            ld   hl,(video_adr_ptr)
            ld   c,1            
            push hl
            oper hl
            ld   (video_adr_ptr),hl            
            pop  hl
            GRMODON
            call drawbktl
            GRMODOFF
        endm

        macro copt_replace_tile address
            ld   a,TLOCUPID                 ; tile state 
            ld   hl,(address)               ; address of the start column in screen buffer             
            ld   de,BK3DATA                 ; address of background data
            inc  hl
            inc  hl
            ld   (hl),a                     ; make tile to be updated
        endm

        macro copt_open_door_left
            copt_draw_tile cptdradl, cptdsadl, dec
            copt_replace_tile cptdradl
            dup COLWIDB + 2                                 ; move pointer to the previous column for the next iteration
                dec  hl
            edup
            ld   (cptdradl),hl                              ; address of the next column in screen buffer from left side                        
        endm

        macro copt_open_door_right
            copt_draw_tile cptdradr, cptdsadr, inc
            copt_replace_tile cptdradr
            dup COLWIDB - 2                                 ; move pointer to the next column for the next iteration
                 inc  hl
            edup
            ld   (cptdradr),hl                              ; address of the next column in screen buffer from left side
        endm

; ---- start escape process
;
strtescp:
        sbscurst sbescap

        ld   a,21
        ld   hl,scrbuf + COLWIDB * 4 + ROWWIDB               ; address of the start column in screen buffer             
        ld   de,BK3DATA                                      ; address of background data

.stesc1:
        savem_hl_de            ; save background data
        dup COLWIDB - 2        ; move pointer to the next column
            inc  hl
        edup
        dec  a        
        jp   nz,.stesc1

        copt_open_door_left
        ret 

; ---- start escape process
; result:
;       A - 0 when escape process finished, 1 - not yet
doescape:
        ld   a,(cptdritr)
        or   a
        jp   z,.does1

        call cptopndr
        ret

.does1:
        xor  a
        ret

; ---- open door above helicopter
; args: A - number of iterations left
; result:
;       A - non-zero
cptopndr:
        dec  a        
        ld   (cptdritr),a
        copt_open_door_left
        copt_open_door_right
        ret

; ---- draw green glass for helicopter cabin
;
cptcabin:        
        ld   hl,(cptglass)                  ; load address of cabins' glass address in video buffer
        ld   de,BK30DATA                    ; pointer to background data                
         
        dup 3
            dup 4
                savem_hl_de                 ; save glass address
                    dup COLWIDB - 2
                        inc  hl
                    edup
            edup
            ld   bc,ROWWIDB - (COLWIDB * 4) ; move to the next row
            add  hl,bc
        edup

        ret