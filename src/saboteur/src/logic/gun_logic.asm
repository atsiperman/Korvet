; ---- move gun shell
;
gunshmov:        
        ld      hl,gunshd
        ld      a,(hl)          ; load gun direction
        skip_gun_sprite hl      ; move to colnum
        ld      d,(hl)          ; save colnum in D
        inc     hl
        ld      e,(hl)          ; save rownum in E

        push    hl

        cp      dirdn
        jp      z,.movedn
        cp      dirrt
        jp      z,.movert
                                ; moving left
        dec     d               ; change colnum
        jp      .movedn

.movert:
                                ; moving right
        inc     d               ; change colnum

.movedn:
        inc     e                       ; increase row
        push    de                      ; save col and row
        call    shscradr                ; get pointer to a tile for gun shell
        ld      a,(hl)                  ; load tile attributes
        and     bwall + broof           ; is floor/wall reached ?
        jp      nz,.movend              ; yes, stop moving

                                        ; otherwise update tile map
        pop     de                      ; restore col and row
        pop     hl                      ; restore pointer to rownum
        ld      (hl),e                  ; save row
        dec     hl
        ld      (hl),d                  ; save col
        ret                             ; continue flight

.movend:
        pop     hl                      ; clear stack
        pop     hl                      ; clear stack
        xor     a                       ; finish shell flight
        ld      (gunshd),a              ; clear shell direction
        ld      a,GUNDELAY
        ld      (gunshfr),a             ; reload gun timer
        ret

; ---- implements logic for gun shot fire
; args:
;       HL - address of the object's control block
;
gunfire:
        ld      a,(gunshfr)
        or      a               ; delay finished ?
        jp      z,.gnf1         ; fire if yes
        dec     a               ; no, decrease delay
        ld      (gunshfr),a     ; save remaining delay
        ret
.gnf1:        
        ld      a,(gunshd)      ; load direction
        or      a               ; is already fired ?
        jp      nz,gunshmov     ; move shell position if yes
        
                                ; do fire
        push    hl
        ld      de,gunshd

        ld      a,(gundir)      ; current gun direction
        ld      (de),a          ; save shell direction
        skip_gun_sprite de      ; skip shell sprite address to colnum

        cp      dirrt                   
        jp      z,.gnfrt        ; gun is looking right
        cp      dirlt           
        jp      z,.gnflt        ; gun is looking left

        ldcursc                 ; load gun column
        jp      .gnfrow

.gnfrt:        
        ldcursc                 ; load gun column
        inc     a               
        jp      .gnfrow

.gnflt: 
        ldcursc                 ; load gun column
        dec     a

.gnfrow:
        ld      (de),a          ; save shell column
        inc     de              ; move to rownum

        pop     hl
        ldcursr                 ; load gun row
        inc     a               ; 
        ld      (de),a          ; save shell row
        ret

; ---- implements logic for gun objects
; args:
;	DE - address of the object's control block
;
gunact:    
        ex de,hl            ; gun's control block to HL

        push hl
        call gunfire
        pop  hl

        ld a,(sbctrlb + odcursc)    ; load X of the saboteur
        inc a                       ; get next column
        ld d,a                      ; save X + 1 in D
        
        push hl

        ldcursc             ; load gun's X into A
        pop hl

        cp d                ; check saboteurs X position
        jp nz,gunact2
        
        ld a,dirdn
        ld (gundir),a
        ld de,gundn         ; set gun to look down
        scurspr
        ret

gunact2:
        jp c,gunact3
        ld a,dirlt
        ld (gundir),a
        ld de,gunlt
        scurspr
        ret

gunact3:       
        ld a,dirrt
        ld (gundir),a
        ld de,gunrt
        scurspr
        ret
