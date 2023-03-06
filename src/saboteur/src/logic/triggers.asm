
; ---- runs manual trigger
;
trigrun:
        ld   hl,(trproc)    ; trigger is manual, load trigger procedure
        jp   (hl)           ; call trigger
        ret

; ---- runs auto trigger
;
; result:
;       A - 1 if trigger action is in progress
;
trigact:
        ld  a,(trtype)
        or  a
        ret z               ; return if no triggers set
        and trgauto
        jp  nz,.tract1      ; run auto trigger
        xor a        
        ret

.tract1:
        ld  hl,(trproc)     ; load trigger proc
        jp  (hl)
        or  a
        ret nz              ; return, trigger is in progress
        
        ld  (trtype),a      ; clear trigger
        ret 

; ---- check for the triggers on the screen
;
trigtst:
        ld hl,(trigmap)
        ld a,h
        or l 
        ret z

        xor a
        ld  (trigchd),a                 ; clear trigger changed flag         

        ld  a,(hl)
        inc hl				; set to the first object

        push af
        ex   de,hl                      ; save trigger pointer in DE
        ld   hl,(sbctrlb + odcursp)     ; load current sprite address
        inc  hl                         ; skip color
        ld   a,(hl)                     ; load height        
        ld   hl,sbctrlb + odcursc
        load_bc_hl                      ; load Y,X into BC        
        inc  c                          ; use X + 1 cooridate 
        add  a,b                        ; add height to current Y
        inc  a                          ; only half height of the head to get to the feet level
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
        inc hl              ; move to colnum
        ld  a,(hl)          ; load trigger location X
        cp  c               ; compare to saboteur's X coordinate
        jp  nz,.tract5      ; not equal, go to the next iteration

        inc hl              ; move to trigger type
        ld  a,(hl)          ; load trigger type
        inc hl              ; move to rownum
        ld  c,a             ; save trigger type in C
        and trxonly         ; check if only X is required
        jp  nz,.tract6      ; X only trigger, go to trigger proc

        ld a,(hl)           ; load trigger location Y        
        cp b                ; compare to saboteur's Y coordinate
        jp nz,.tract5       ; not equal, go to the next iteration

.tract6:
        ld  a,c 
        ld  (trtype),a      ; save current trigger's type

        inc hl              ; move to trigger object type
        ld  (trotptr),hl    ; save pointer to current trigger's object type
        inc hl

        inc hl              ; move to trigger procedure
        load_de_hl          ; load trigger's procedure
        ex  de,hl
        ld  (trproc),hl     ; save current trigger's procedure

        ex  de,hl
        ld  (trdtptr),hl    ; save pointer to triggers custom data

        pop hl              ; restore pointer to the trigger
        ld  (curtrig),hl    ; save pointer to the current trigger
        pop hl              ; clear stack

        and trgmanl
        jp  nz,.tract7      ; do not set flag if this is auto trigger
        ld  hl,(trotptr)
        load_de_hl          ; load activation procedure address
        ex  de,hl
        ld  a,h
        or  l
        ret z               ; exit if no activation procedure specified
        jp  (hl)            ; call activation procedure

.tract7:
        ld  (trigchd),a     ; set flag, trigger changed, A != 0 here
        ret

.tract5:
        pop  hl             ; restore trigger pointer

.tract4:
        skip_trigger hl

.tract3:
        pop af
        dec a
        jp  nz,.tract1

        ld  hl,(curtrig)
        ld  a,h
        or  l
        ret z              ; no triggers had been set previously, just return
                            ; some trigger had been found, but it is not found this time
        ld  hl,0
        xor a
        ld  (trproc),hl
        ld  (curtrig),hl
        ld  (trotptr),hl
        ld  (trdtptr),hl
        ld  (trtype),a

        inc a
        ld  (trigchd),a     ; set flag, to get trigger image cleared
        ret


; ---- procedure for desk triggers
;
deskproc:
        ld  hl,(trotptr)    ; load pointer to current trigger's object type
        ld  a,(hl)          ; load current desk type
        cp  trodskn         ; is normal ?
        jp  z,.dskp1        ; yes, switch to pressed                            
        ld  c,trodskn       ; otherwise switch back to normal
        jp  .dskp2

.dskp1:
        ld  c,trodskp       ; switch to pressed

.dskp2:
        ld  hl,(trdtptr)    ; load pointer to triggers data
        ;load_de_hl         ; load data
        ;ld  a,e
        ;or  d
        ld      a,(hl)      ; load data
        or      a
        ret z               ; return if no data specified, then do not change image

                        ; switch door state
        cpl                     ; invert bits
        and doorcls + dooropn   ; leave allowed bits
        ;dec hl
        ;dec hl              ; save low byte only
        ld  (hl),a          ; save new value

.dskpe:
        ld  hl,(trotptr)    ; load pointer to current trigger's object type
        ld  (hl),c          ; save new trigger type
        ld  a,c
        ld  (trigchd),a     ; refresh triggered image
        ret

; ---- procedure for simple items triggers (brick, pipe, etc.)
; result: 
;       A - 0 if nothing changed, both objects are empty
;       
itmproc:
        ld   hl,(trotptr)   ; load pointer to current trigger's object type
        ld   de,sbholds     ; pointer to what saboteur holds

        ld   a,(de)         ; what saboteur holds
        ld   b,(hl)         ; new object type

        ld   c,a            ; save current object
        or   b              ; is anything available ?
        ret  z              ; return if no objects nowhere
        
        ld   (hl),c         ; move current object to trigger's location
        ld   a,b            ; save new object type in A
        ld   (de),a         ; give new object type to saboteur

        inc  a
        ld   (trigchd),a    ; refresh triggered image
        ld   (sbhldch),a    ; refresh held object image
        ret

; ---- procedure for disk trigger
;       activates it at the first call 
;       set correct data in current trigger descriptor 
;
dsktproc:
        ld      hl,s37trd
        ld      a,(hl)          ; load trigger state
        or      a               ; activated ?
        jp      z,.dsk0         ; yes, run trigger
                                ; activate trigger                                
        xor     a               ; set a = 0
        ld      (hl),a  	; save flag, tigger is activated

        ld      hl,diskscor     ; add score
        call    addscore        ; for disk
        call    playdscs
        
.dsk0:
        ld      a,(timractv)    ; load timer mode
        cp      a,TIMRCNTD      ; is bomb planted ?
        ret     z               ; return if yes

        ld      a,(sbholds)     ; load what saboteur holds
        cp      trobomb         ; is it a bomb ?
        jp      z,.dskp1        ; run new timer if yes

        xor     a
        ld      (timractv),a    ; disable game timer if no bomb planted
        jp      .dskrun
        
.dskp1:
        ld      hl,(trdtptr)    ; load pointer to triggers data
        ld      a,(hl)          ; load data
        cp      trodisk         ; is it a disk ?
        jp      nz,.dskp2       ; skip adding scores if no

                                ; exchanging bomb to disk
        ld      hl,dsk2bomb     ; add score
        call    addscore        ; for bomb

.dskp2:
        ld      a,TIMRCNTD      ; switch timer into 
        ld      (timractv),a    ; countdown mode
        
.dskrun: 
        ld      hl,(trdtptr)
        ld      (trotptr),hl
        jp      itmproc

; ---- draws image of the triggered object
;
; args: HL - address of the image to be drawn
;       DE - address in video memory
drawtrim:
        ld   c,l
        ld   b,h
        jp drawsto

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
