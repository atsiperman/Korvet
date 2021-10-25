
; ---- implements logic for gun objects
; args:
;		DE - address of the object's control block
;
gunact:    
        ex de,hl            ; gun's control block to HL

        ld a,(sbctrlb + odcursc)    ; load X of the saboteur
        inc a                       ; get next column
        ld d,a                      ; save X + 1 in D
        
        push hl

        ldcursc             ; load gun's X into A
        pop hl

        cp d                ; check saboteurs X position
        jp nz,gunact2
        
        ld de,gundn         ; set gun to look down
        scurspr
        ret

gunact2:
        jp c,gunact3
        ld de,gunlt
        scurspr
        ret

gunact3:       
        ld de,gunrt
        scurspr
        ret
