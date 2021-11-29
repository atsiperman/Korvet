
; ---- runs manual trigger
;
trigrun:
        ld   hl,(trproc)    ; trigger is manual, load trigger procedure
        jp   (hl)           ; call trigger
        ret

; ---- check for the triggers on the screen
;
trigact:
        ld hl,(trigmap)
        ld a,h
        or l 
        ret z

        xor a
        ld  (trigchd),a                 ; clear trigger changed flag         

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
        or   a              ; check trigger state
        jp   z,.tract4      ; go to the next trigger if this one is disabled

        push hl             ; save pointer to the current trigger

.tract2:
        inc  hl             ; move to colnum
        ld   a,(hl)         ; load trigger location X
        inc  hl             ; move to rownum
        cp   c              ; compare to saboteur's X coordinate
        jp   nz,.tract5     ; not equal, go to the next iteration

        ld a,(hl)           ; load trigger location Y
        cp b                ; compare to saboteur's Y coordinate
        jp nz,.tract5       ; not equal, go to the next iteration

        pop  af
        ld   (trigchd),a    ; set flag, trigger changed, A != 0 here

        inc  hl             ; move to the image address
        load_de_hl          ; load trigger's procedure
        ex   de,hl
        ld   (trproc),hl    ; save current trigger's procedure

        ex   de,hl
        ld   a,(hl)
        ld   (trtype),a     ; save current trigger's type
        inc  hl             ; move to trigger object type
        ld   (trotptr),hl   ; save pointer to current trigger's object type

        pop  hl             ; restore pointer to the trigger
        ld   (curtrig),hl   ; save pointer to the current trigger
        ret

.tract5:
        pop  hl             ; clear stack

.tract4:
        skip_trigger hl

.tract3:
        pop  af
        dec  a
        jp nz,.tract1

        ld   hl,(curtrig)
        ld   a,h
        or   l
        ret  z              ; no triggers had been set previously, just return
                            ; some trigger had been found, but it is not found this time
        ld   hl,0
        xor  a
        ld   (trproc),hl
        ld   (curtrig),hl
        ld   (trotptr),hl
        ld   (trtype),a

        inc  a
        ld  (trigchd),a     ; set flag, to get trigger image cleared
        ret


; ---- procedure for simple items triggers (brick, desk, etc.)
;
itmproc:
        ld   hl,(trotptr)   ; load pointer to current trigger's object type
        ld   de,sbholds     ; pointer to what saboteur holds

        ld   a,(de)         ; what saboteur holds
        ld   b,(hl)         ; new object type
        ld   (hl),a         ; move current object to trigger's location
        ld   a,b            ; save new object type in A
        ld   (de),a         ; give new object type to saboteur

        ld   a,1
        ld   (trigchd),a    ; refresh triggered image
        ld   (sbhldch),a    ; refresh held object image
        ret


; ---- draws image of the triggered object
;
; args: HL - address of the image to be drawn
;       DE - address in video memory
drawtrim:
        ld   c,l
        ld   b,h
        call drawsto
        ret

; ---- clear image of the triggered object
; args: HL - address of the image to be drawn
;       DE - address of the procedure to restore text
;
clrtrim:
        ld  a,CMAINREG
        ld  (COLRREG),a

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

        ex   de,hl
        jp   (hl)           ; restore text
        ret        