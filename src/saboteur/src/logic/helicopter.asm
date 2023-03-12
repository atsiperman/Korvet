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

; -----------------------------------------------------------
; ----  macros for drawing helicopter when it's flying out
;------------------------------------------------------------

        ; macro mkdelay iternum
        ;     ld   c,iternum
        ;     call mkpause.mkp
        ; endm

        macro coptdoor_draw_tile scrbufadr_ptr, video_adr_ptr, oper
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
            coptdoor_draw_tile cptdradl, cptdsadl, dec
            copt_replace_tile cptdradl
            dup COLWIDB + 2                                 ; move pointer to the previous column for the next iteration
                dec  hl
            edup
            ld   (cptdradl),hl                              ; address of the next column in screen buffer from left side                        
        endm

        macro copt_open_door_right
            coptdoor_draw_tile cptdradr, cptdsadr, inc
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
        call rprepcpt
        jp   rprepdor        

; ---- prepare door
;
rprepdor:
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

; ---- restore border around copter in the screen buffer
;
rprepcpt:   
        ld   de,BK3DATA                                                 ; address of background data
        ld   c,TLOCUPID
        ld   b,COPTHI - 1

        ld   a,COPTWID
        ld   hl,scrbuf + COLWIDB * COPTCOL + ROWWIDB * (COPTROW + 1)  ; address of the start column under propeller in screen buffer

        push af
        push bc

.prp1:        
        call .prpbuf
        pop  bc
        pop  af
        dec  b
        ret  z

        push af
        push bc
        ld   bc,ROWWIDB - COLWIDB * COPTWID
        add  hl,bc
        jp   .prp1


.prpbuf:
        skip_buf_tile_spaddr hl
        ld   (hl),c             ; set tile into updated state        
        dup COLWIDB - 2         ; move pointer to the next column
            inc  hl
        edup
        dec  a        
        jp   nz,.prpbuf
        ret

; ---- start escape process
; result:
;       A - 0 when escape process finished, 1 - not yet
doescape:
        call cptopndr           ; open top door
        call flytop             ; fly to the top line
        call flyout             ; fly out
                                            ; clear top line after copter has gone
        ld   hl,SCRADDR + COPTCOL
        ld   de,scrbuf + COLWIDB * COPTCOL
        call flytop.cpt5
        DISSND
        ret

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

        STARTSND 60000
        copt_open_door_left
        DISSND
        STARTSND 65000
        copt_open_door_right
        DISSND

        dup 7
        halt                    ; delay
        edup

        jp   cptopndr           ; repeat until door is open

; ---- helicopter flies to the roof
;
flytop:
        ld   a,(cptrow)
        or   a
        ret  z

        call .movtop
        call cptdelay
        jp   flytop

.movtop:
        dec  a              ; decrease row
        ld   (cptrow),a     ; and save

        ld  hl,(cptvmem)
        ld   bc,VERTDISP
        sub_hl_bc

        ex   de,hl
        ld   (cptvmem),hl   ; save address for the next iteration
        ex   de,hl

.cpt1:        
        push de             ; save upper row
        ld   hl,(cptbuf)    ; load copter's tile address
        ex   de,hl          ; into DE        
        pop  hl             ; restore vmem address
        
        ld   a,(cptheit)    ; load copter height 
        ld   c,a            ; into C
                
        push bc

.cpt2:
        ld  c,COPTWID

.cpt3:        
        push bc
        push hl
        skip_buf_tile_spaddr de
        GRMODON
        call copytile
        GRMODOFF
        pop  hl
        inc  hl            
        pop bc
        dec c
        jp  nz,.cpt3

        pop  bc
        dec  c
        jp   z,.cpt4
        push bc

        ld   bc,VERTDISP - COPTWID
        add  hl,bc          ; move to the next screen line
        ex   de,hl
        ld   bc,ROWWIDB - COPTWID * COLWIDB    
        add  hl,bc          ; move to the next line in buffer
        ex   de,hl
        jp   .cpt2

.cpt4:                      ; restore line under the copter
        ld   bc,VERTDISP - COPTWID
        add  hl,bc          ; move to the next screen line        

.cpt5:
        ld   de,scrbuf + COLWIDB * COPTCOL

        ld   c,COPTWID
        GRMODON
        call drawbktl
        GRMODOFF

        ret

; ---- helicopter flies out
;
flyout:
        ld   a,(cptheit)
        dec  a              ; decrease height
        ld   (cptheit),a    ; and save
        ret  z

        cp   a,COPTHI / 5
        jp   nz,.flout
        ld   a,CPTPAUS2
        ld   (cptpause),a
        ld   a,(cptheit)    ; restore height

.flout:
        call .movout
        call cptdelay
        jp   flyout

.movout:
        ; A - current height 
        ld   hl,(cptbuf)
        ld   bc,ROWWIDB
        add  hl,bc
        ld   (cptbuf),hl    ; save address for the next iteration
        ex   de,hl
        ld   hl,(cptvmem)   ; load video address        
        ld   c,a            ; save copter's height into C                
        push bc

.cpt2:
        ld  c,COPTWID

.cpt3:        
        push bc
            push hl
            skip_buf_tile_spaddr de
            GRMODON
            call copytile
            GRMODOFF
            pop  hl
            inc  hl            
        pop bc
        dec c
        jp  nz,.cpt3

        pop  bc
        dec  c
        jp   z,.cpt4
        push bc

        ld   bc,VERTDISP - COPTWID
        add  hl,bc                          ; move to the next screen line
        ex   de,hl
        ld   bc,ROWWIDB - COPTWID * COLWIDB    
        add  hl,bc                          ; move to the next line in buffer
        ex   de,hl
        jp   .cpt2

.cpt4:                                      ; restore line under the copter
        ld   bc,VERTDISP - COPTWID
        add  hl,bc                          ; move to the next screen line
        jp flytop.cpt5

; ---- makes a pause when copter is moving
;
cptdelay:
        ld  a,(cptpause)
.delay:
        STARTSND 30000
        halt
        DISSND
        halt
        dec a
        jp  nz,.delay
        ret
