
; ---- changes state of yellow door
; 
; args: A - new tile type
;       HL - address of the first tile
ylwdorst:
        ld  bc, ROWWIDB
        dup 6
            ld  (hl),a
            add hl,bc       ; move to next row
        edup
        ret

; ---- first render post processor for screen N-45.
;
s45rndr:
        ld  hl, scrbuf + COLWIDB * 10 + ROWWIDB * 5 + TLMDATR        
        ld  a,doorcls
        jp  doorprc

; ---- first render post processor for screen N-55.
;
s55rndr:
        ld  hl, scrbuf + COLWIDB * 27 + ROWWIDB * 9 + TLMDATR        
        ld  a,(s51trm + 1 + trdodat)
        jp  doorprc

; ---- first render post processor for screen N-107.
;
s107rndr:
        ld  hl, scrbuf + COLWIDB * 6 + ROWWIDB * 3 + TLMDATR
        ld  a,(s105trm + 1 + trdodat)
        jp  doorprc

; ---- door open/close procedure
;
; args: A - current door state
;       HL - address of the first tile in screen buffer
;
doorprc:
        cp  doorcls
        jp  z,.dorp1        ; door is closed

        ld  a,(hl)          ; open door
        and ~bwall
        call ylwdorst
        ret

.dorp1:                     ; close door
        ld  a,(hl)
        or  bwall
        call ylwdorst
        ret
