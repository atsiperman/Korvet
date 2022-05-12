; ---- control logic for helicopter

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

; macros for drawing helicopter when it's flying out
        macro sub_hl_bc  ; DE = HL - BC
            ld   a,l            
            sub  c              ; A = L - C
            ld   e,a            ; save low byte in E
            ld   a,h
            sbc  b              ; A = H - B - (1)
            ld   d,a            ; save high byte in D
        endm

        macro mkdelay iternum
            ld   c,iternum
            call mkpause.mkp
        endm

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
        mkdelay 2
        ret 

; ---- start escape process
; result:
;       A - 0 when escape process finished, 1 - not yet
doescape:
        call cptopndr
        call cptfly
        call cptflybd
        ret

; .does2:
;         xor  a
;         ret

; ---- open door above helicopter
; args: A - number of iterations left
; result:
;       A - non-zero
cptopndr:
        ld   a,(cptdritr)
        or   a
        ret  z

        dec  a 
        ld   (cptdritr),a

        copt_open_door_left
        copt_open_door_right

        mkdelay 5
        jp   cptopndr           ; repeat until door is open

; ---- helicopter flies out
;
cptfly: 
        ld   a,(cptrow)        
        or   a
        ret  z

        dec  a              ; decrease row
        ld   (cptrow),a     ; and save

        call cptcpbuf       ; move up in the buffer
        call cptshow        ; copy buffer to the screen
        dup 2
        call mkpause        
        edup
        jp   cptfly         ; repeat until copter reaches the top row

; ---- helicopter flies out when top row is reached
;
cptflybd
        ld   a,(cptheit)        
        or   a
        ret  z

        dec  a              ; decrease height
        ld   (cptheit),a    ; and save
        or   a
        ret  z              

        call cptcpbuf       ; move up in the buffer
        call cptshow        ; copy buffer to the screen
        dup 2
        call mkpause        
        edup
        jp   cptflybd         ; repeat until copter reaches the top row

; ---- moves up helicopter in screen buffer
;
cptcpbuf:
        ld   hl,(cptaddr)   ; load copter's address into HL
        push hl
        ld   bc,ROWWIDB
        sub_hl_bc

        ld   a,(cptrow)     ; load row
        or   a              ; the last one ?
        jp   z,.cptm1       ; skip saving new address

        ex   de,hl
        ld   (cptaddr),hl   ; save new address of the top row
        ex   de,hl

.cptm1:
        pop  hl             ; restore old tile address

        ld   a,(cptheit)    ; load copter's height
        ld   c,a            ; into C
        push bc             ; save counter

.cptm2:        
        ld   bc,COLWIDB * COPTWID               ; width of the one line of tiles in bytes
        call copymem
         
        pop  bc
        dec  c
        ret  z

        push bc                                 ; save counter
        ld   bc,ROWWIDB - COLWIDB * COPTWID
        ex   de,hl
        add  hl,bc
        ex   de,hl
        add  hl,bc          ; move pointers to the next lines
        jp   .cptm2

; ---- show helicopter on the screen
;
cptshow:
        ld  hl,(cptvmem)
        ld   bc,VERTDISP
        sub_hl_bc

        ld   a,(cptrow)     ; load row
        or   a              ; the last one ?
        jp   z,.cpt1        ; skip saving new address

        ex   de,hl
        ld   (cptvmem),hl   ; save address for the next iteration
        ex   de,hl

.cpt1:        
        push de             ; save upper row
        ld   hl,(cptaddr)   ; load copter's tile address
        ex   de,hl          ; into DE        
        pop  hl             ; restore vmem address
        
        ld   a,(cptheit)    ; load copter height 
        ld   c,a            ; into C
                
        push bc

.cpt2:
        dup COPTWID
            push hl
            skip_buf_tile_spaddr de
            GRMODON
            call copytile
            GRMODOFF
            pop  hl
            inc  hl            
        edup

        pop  bc
        dec  c
        ret  z
        push bc

        ld   bc,VERTDISP - COPTWID
        add  hl,bc          ; move to the next screen line
        ex   de,hl
        ld   bc,ROWWIDB - COPTWID * COLWIDB    
        add  hl,bc          ; move to the next line in buffer
        ex   de,hl
        jp   .cpt2
