
; ---- test gun shell tile for wall and saboteur
; args:
;       D - shell column
;       E - shell row
;
; result:
;       A - 0 if nothing found
;       D - updated shell column
;       E - updated shell row
;
tstgunsh:
        ld      a,(gunshd)              ; get shell direction 
        cp      dirdn
        jp      z,.movedn
        cp      dirrt
        jp      z,.movert
                                        ; moving left
        dec     d                       ; change colnum
        jp      .movedn

.movert:
                                        ; moving right
        inc     d                       ; change colnum

.movedn:
        inc     e                       ; increase row
        push    de                      ; save col and row

        call    shscradr                ; get pointer to a tile for gun shell
        ld      a,(hl)                  ; load tile attributes
        and     bwall + broof           ; is floor/wall reached ?
        jp      nz,.movend              ; yes, stop moving

        pop     de
        push    de

        ld hl,(sbctrlb + odcursp)       ; load current sprite into HL
        inc     hl                      ; skip color
        inc     hl                      ; skip height
        ld      a,(hl)                  ; load width
        ld      (.sabwid),a             ; save it

        sblcursr                        ; load saboteur row
        inc     e                       ; increase row to use NC flag
        cp      e                       ; is shell inside saboteur body ?
        jp      nc,.exit                ; exit if no

        sblcursc                        ; load saboteur left column
        inc     d                       ; increase column to use NC flag
        cp      d                       ; test shell column
        jp      nc,.exit                ; test tile map if shell is outside saboteur's body        
        ld      hl,.sabwid
        add     (hl)                    ; get next col after saboteur 
        dec     a                       ; get right border
        dec     d                       ; get back to shell column
        cp      d                       ; is shell inside body ?
        jp      c,.exit                 ; exit if outside 

                                        ; saboteur hit!
    	ld      a,HLGUNHIT              ; set health hit
	call    hldec
                                        
.movend:
        ld      de,sndgunsh
        call    playsnd

        pop     de                      ; clear stack
        xor     a                       ; finish shell flight
        ld      (gunshd),a              ; clear shell direction
        ld      a,GUNDELAY
        ld      (gunshfr),a             ; reload gun timer
        inc     a
        ret

.exit:
        pop     de
        xor     a                       ; nothing found
        ret

.sabwid:                               ; saboteur width
        db      0

; ---- move gun shell by two tiles, test each tile for the wall/floor
;
gunshmov:        
        ld      hl,gunshd + 3   
        ld      d,(hl)                  ; save colnum in D
        inc     hl
        ld      e,(hl)                  ; save rownum in E

        dup 2
                push    hl
                call    tstgunsh        ; test next tile
                pop     hl
                or      a
                ret     nz              ; return if met anything        
        edup
                
                                        ; otherwise save current position
        ld      (hl),e                  ; save row
        dec     hl
        ld      (hl),d                  ; save col
        ret                             ; continue flight

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
        ldcursc                 ; load gun column
        ld      (de),a          ; save shell column
        inc     de              ; move to rownum

        pop     hl
        ldcursr                 ; load gun row
        ld      (de),a          ; save shell row
        jp      gunshmov        ; make first move

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
