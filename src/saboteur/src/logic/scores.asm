
; ---- kill guard by weapon
killwpgd:
        db 0, 0, 1, 5, 0

; ---- kill guard by punch or kick
killguad:
        db 0, 0, 5, 0, 0

; ---- escape and fight another day
escape:
        db 0, 1, 0, 0, 0

; ---- get disc
diskscor:
; ---- swipe disk to bomb
dsk2bomb:
; ---- escape with disc
escwdsk:
        db 0, 5, 0, 0, 0

; ---- escape with disc and bomb set
escwdsbm:
        db 1, 0, 0, 0, 0

; ---- add score for killed object
; args:
;       HL - address of the score data
addscore:   
        ld   de,score + 5       ; address of the last byte
        ld   bc,4
        add  hl,bc              ; move pointer to the last byte
        ld   c,5
        xor  a                  ; clear carry flag
        push af                 ; save CARRY flag
.ads1:
            pop  af             ; restore CARRY flag
            ld   a,(de)         ; get score digit
            adc  a,(hl)         ; add to the current score
            cp   10             ; >= 10 ?
            jp   c,.ads2        ; no, continue loop
            sub  10             ; leave the remainder only
            ld   (de),a         ; save new digit to score
            scf                 ; set CARRY flag to be added to the next digit
            jp   .ads3          
.ads2:           
            ld   (de),a         ; save new digit to score
            xor  a              ; clear carry flag
.ads3:            
            push af             ; save CARRY flag
            dec  de
            dec  hl
        dec  c
        jp   nz,.ads1
        pop  af                 ; clear stack
        
        ld   a,1
        ld  (scorchg),a
        ret


