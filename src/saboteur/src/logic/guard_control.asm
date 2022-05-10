;
;	this file contains logic for guards 
;

; ---- guard control procedure
; args: DE - address of control block
;
guardprc:
        ex   de,hl                       ; load control block into HL

        push hl
        ldstate
        pop  hl
        cp   objdead        
        ret z

        cp   sbstay
        jp   z,.gdact2                  ; if staying then check for the next action

        cp   sbmove
        jp   z,.gdact1                  ; if moving then continue moving

        call gdconact                   ; continue action
        ret

.gdact1:
        call gfcontmv                   ; continue moving
        ret

.gdact2:
        ld   a,(gfsbseen)                
        or   a                          ; seen saboteur ?
        jp   z,.gdact3                  ; no, continue watching

        push hl
        call gdseesab                   ; otherwise check whether he is visible or not
        pop  hl
        or   a
        ret  z                          ; doesn't see saboteur, do nothing
        and  c                          ; changed direction ?
        push af
        call nz,gdststay                ; change sprite if yes
        pop  af
        ret  nz                         ; and return

        call gdstact                    ; otherwise: seen saboteur, direction not changed - start action
        ret

.gdact3:
        push hl
        call gdseesab                   ; check whether saboteur is visible or not
        ld   (gfsbseen),a
        pop  hl
        or   a
        ret  z                          ; doesn't see saboteur, do nothing
        and  c                          ; changed direction ?
        ret  z                          ; no, do nothing
        call gdststay                   ; change sprite
        ret

; ---- guard starts moving
; args: HL - address of control block
;       
gdstmov:
        push hl
        ldcursr                         ; load screen row
        inc  a                          ; increase it
        ld   (hl),a                     ; and save
        pop hl

        push hl
        lddir
        cp   dirlt
        jp   z,.gdmlt
                                        ; start moving right
        ld   hl,gdmvrttb
        ld   (gsprtab),hl               ; save sprite table address
        pop  hl
        push hl
        ld   de,gdspmr1                 ; save sprite address
        scurspr     
        jp   .gdme

.gdmlt: 
        ld   hl,gdmvlttb
        ld   (gsprtab),hl               ; save sprite table address
        pop  hl
        push hl
        ld   de,gdspml1                 ; save sprite address
        scurspr 

.gdme:
        pop  hl
        push hl
        xor  a
        scurspi
        pop  hl
        scurst sbmove
        ret

; ---- guard stops moving
; args: HL - address of control block
;       
gdstopmv:
        push hl
        ldcursr                         ; load screen row
        dec  a                          ; decrease it
        ld   (hl),a                     ; and save
        pop  hl
        jp   gdststay                   ; stop and stay


; ---- guard continues moving
; args: HL - address of control block
;       
gfcontmv:
        push hl
        call gdseesab                   ; otherwise check whether he is visible or not
        pop  hl
        push de                         ; save distance between sab and guard
        push hl

        or   a
        jp   z,.gfcm1                   ; doesn't see saboteur, stop moving
        and  c                          ; changed direction ?
        jp   z,.gfcmv                   ; no, continue movement
                                        ; otherwise switch direction
        lddir
        cp   dirlt
        jp   z,.gfclt1
        ld   hl,gdmvlttb                ; is moving right, change to sprite table for left dir
        jp   .gfclt2

.gfclt1:        
        ld   hl,gdmvrttb                ; is moving left, change to sprite table for right dir
.gfclt2:
        ld   (gsprtab),hl               ; save new sprite table

.gfcmv:
        pop  hl                         ; restore control block
        pop  de                         ; restore distance
        ld   a,d        
        cp   PNCHDST
        jp   c,.gfcm2                   ; close enough, stop moving        
                                        ; too far, keep moving

        push hl
        ldcursc
        pop  hl
        push af                         ; save column
        push hl
        lddir
        pop  hl
        cp   dirlt
        jp   z,.gfcmlt
        pop  af                         ; restore column
        inc  a                          ; moving right, inc column
        jp   .gfcmlt2
.gfcmlt:
        pop  af                         ; restore column
        dec  a                          ; moving left, dec column

.gfcmlt2:
        push hl                 
        scursc                          ; save current column
        pop  hl

        push hl
        call gchgspr                    ; change sprite index
        pop  hl
        or   a
        ret  nz                         ; not the last sprite, do nothing
        scurspi                         ; set index to 0
        ret

.gfcm1:
                                        ; stop moving, clear stack
        pop  hl                         ; restore control block
        pop  de                         ; restore distance

.gfcm2:                                        
        push hl        
        ldcursr                         ; load screen row
        dec  a                          ; increase it
        ld   (hl),a                     ; and save
        pop  hl

        call gdststay                   ; stop and stay
        ret

; ---- continue guard's action
; args: HL - address of control block
;       A  - current state
gdconact:      
        push af
        push hl

        ldstate 
        cp   sbmove                     ; moving ?
        jp   nz,.gdc2                   ; no, continue action

        call gdseesab                   ; see saboteur ?
        or   a
        pop  hl
        jp   z,.gdc1                    ; doesn't see saboteur, stop and stay
        and  c                          ; changed direction ?
        jp   z,.gdc2                    ; no, continue action

.gdc1:
        pop  af
        jp gdststay

.gdc2:
        pop  hl
        pop af

        push hl
        push af
        call .gconact
        pop  de
        pop  hl
        or   a
        ret  z                          ; action has finished

        ld   a,d                        ; check action type
        cp   sbkick
        call z,gdchkck                  ; make column correction if this is a kick
        ret

; ---- continue guard's action
; args: HL - address of control block
;       A  - current state
; result:
;       A  - 0 if action has finished
.gconact:
        push hl
        call gchgspr
        pop  hl
        or   a
        jp   z,.gdact1
        ret

.gdact1:
        push hl
        ldstate
        pop  hl
        cp   sbkick
        jp   nz,.gdst

        push hl
        ldcursr                         ; load current screen row into A
        inc  a                          ; increase row
        ld   (hl),a     
        pop  hl
        push hl
        lddir
        pop  hl
        cp   dirrt
        jp   z,.gdst
        push hl
        ldcursc
        dec  a
        ld   (hl),a
        pop  hl        

.gdst:
        call gdststay                   ; stop and stay
        xor  a     
        ret

; ---- changes action sprite
; args: HL - address of control block
;       A  - current state
; result:
;       A  - 0 if this is the last sprite
;
gchgspr:
        push hl
        ldcurspi                        ; load current sprite index
        inc  a                          ; move to the next sprite
        pop  hl
        push hl
        scurspi                         ; save new sprite index

        ld   b,a                        ; save it in B

        ld   hl,(gsprtab)               ; load address of sprite table for current action
        ld   a,(hl)                     ; load total number of sprites

        cp   b                          ; is it the last one ?
        jp   z,.gd1                     ; yes, stop action

        ld   a,b                        ; save current index in A
        inc  hl                         ; move to the pointer on the first sprite
        add  a                          ; get diplacement to the sprite with current index
        ld   d,0
        ld   e,a
        add  hl,de                      ; move pointer to the next sprite address
        load_de_hl                      ; load address into DE

        pop  hl
        scurspr                         ; save next sprite
        ret

.gd1:
        pop  hl
        xor  a
        ret

; ---- set guard into stay state
; args: HL - address of control block
;       
gdststay:
        push hl
        scurst sbstay         
        pop  hl
        push hl
        lddir
        pop  hl
        cp   dirlt
        jp   z,.gs1
        ld   de,gdsprt
        scurspr 
        ret
.gs1:
        ld   de,gdsplt
        scurspr 
        ret

; ---- checks whether guard sees saboteur
; args: HL - address of control block
; result:
;       A - 1 - yes, 0 - no
;       D - distance to the saboteur
;       C - 1 - yes, 0 - no, flag, whether direction has been changed
gdseesab:
        push hl

        ldcursc
        ld   d,a                        ; save column in D
        pop  hl
        push hl

        ldcursr
        ld   e,a                        ; save row in E
        pop  hl
        push hl

        lddir                           ; load guard's direction
        pop  hl
        cp   dirlt
        jp   z,.gdslt
                                        ; looking right
        sblcursc                        ; load saboteur's column
        ld   c,a
        ld   a,d
        sub  c                          ; A = guard col - sab col
        jp   c,.gdsyes                  ; saboteur is on the right - return yes

        ld   d,a                        ; save current distance
        ld   a,(gfsbseen)
        or   a                          ; seen saboteur already ?
        ld   a,d
        jp   nz,.gdsr1                  ; if yes then just change direction
                                        
        cp   BKSEEDST                   ; if no then: exceed minimal visibility distance ?
        jp   nc,.gdno                   ; no, do nothing

.gdsr1:
        or   a
        jp   z,.gdsyes                  ; column matches

        scurdir dirlt
        jp   .gdsyesc                   ; yes, with direction change

.gdslt:                                 ; looking left
        sblcursc                        ; load saboteur's column
        sub  d
        jp   c,.gdsyes

        ld   d,a                        ; save current distance
        ld   a,(gfsbseen)
        or   a                          ; seen saboteur already ?
        ld   a,d
        jp   nz,.gdsrl1                 ; if yes then just change direction

        cp   BKSEEDST                   ; if no then: exceed minimal visibility distance ?
        jp   nc,.gdno                   ; no, do nothing

.gdsrl1:
        or   a
        jp   z,.gdsyes                  ; column matches
        scurdir dirrt
        
.gdsyesc:                               ; see saboteur, changed direction
        ld   d,a
        ld   a,1
        ld   c,a
        ret

.gdsyes:                                ; see saboteur, no direction change
        cpl
        inc  a                          ; get positive distance
        ld   d,a
        ld   a,1
        ld   c,0
        ret

.gdno:
        xor  a
        ret        


