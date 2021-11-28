; ---- triggers logic

; ---- triggers logic processing
trigact:
        ld hl,(trigmap)
        ld a,h
        or l 
        ret z

        xor a
        ld  (trigchd),a    ; clear trigger changed flag         

        ld  a,(hl)
        inc hl				            ; set to the first object

        push af
        ex   de,hl                      ; save trigger pointer in DE
        ld   hl,(sbctrlb + odcursp)     ; load current sprite address
        inc  hl                         ; skip color
        ld   a,(hl)                     ; load height        
        ld   hl,sbctrlb + odcursc
        load_bc_hl                      ; load Y,X into BC        
        inc  c                          ; use X + 1 cooridate 
        add  a,b                        ; add height to current Y
        dec  a                          ; get feet level
        ld   b,a                        ; save feet level in B
        ex   de,hl                      ; get trigger pointer back into HL
        pop  af

.tract1:
        push af
        ld   a,(hl)
        or a                ; check trigger state
        jp  z,.tract4       ; go to the next trigger if this one is disabled

.tract2:
        inc  hl             ; move to colnum
        ld  a,(hl)          ; load trigger location X
        inc  hl             ; move to rownum
        cp c                ; compare to saboteur's X coordinate
        jp   nz,.tract5     ; not equal, go to the next iteration

        ld  a,(hl)          ; load trigger location Y
        cp  b               ; compare to saboteur's Y coordinate
        jp   nz,.tract5     ; not equal, go to the next iteration

        ld   a,1
        ld   (trigchd),a    ; set flag, trigger changed 

        inc  hl             ; move to the image address
        load_de_hl          ; load trigger image into DE
        ex   de,hl
        ld   (trimage),hl   ; save trigger's image
        ex   de,hl
        load_de_hl          ; load trigger's procedure
        ex   de,hl
        ld   (curtrig),hl   ; save current trigger's procedure
        pop  af
        ret

.tract5:
        dup 5
            inc  hl         ; skip current trigger
        edup
        jp   .tract3

.tract4:
        skip_trigger hl

.tract3:
        pop  af
        dec  a
        jp nz,.tract1

.tracte:
        ld   hl,(trimage)
        ld   a,h
        or   l
        ret  z              ; no triggers had been set previously, just return
                            ; some trigger had been found, but it is not found this time
        xor  a              
        ld   hl,trimage     ; clear image address, to get trigger image cleared
        ld   (hl),a
        inc  hl
        ld   (hl),a

        ld   hl,curtrig     ; clear trigger's procedure
        ld   (hl),a
        inc  hl
        ld   (hl),a

        inc a
        ld (trigchd),a     ; set flag, to get trigger image cleared
        ret


; ---- procedure for simple items triggers (brick, desk, etc.)
itmproc:
        ret


; ---- draws image of the triggered object
;
; args: HL - address of the image to be drawn
;
;
drawtrim:
        ld   de,TRIMADR
        ld   c,l
        ld   b,h
        call drawsto
        ret

; ---- clear image of the triggered object
;
clrtrim:
        ld  a,CMAINREG
        ld  (COLRREG),a

        ld  hl,TRIMADR
        ld  a,255
        dup 12
            dup 4
                ld  (hl),a
                inc hl                    
            edup  
            ld   bc,63
            add  hl,bc
            dup 4
                ld  (hl),a
                dec hl        
            edup  
            ld   bc,65
            add  hl,bc
        edup

        jp   drnoner    ; draw text 'NOTHING NEAR'
        ret        