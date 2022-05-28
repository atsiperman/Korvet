
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

; ---- door open/close procedure: adds/removes 'bwall' in tile attributes
;
; args: A - current door state
;       HL - pointer to the attribtues of the first tile in screen buffer
;
doorprc:
        cp  doorcls
        jp  z,.dorp1        ; door is closed

        ld  a,(hl)          ; open door
        and ~bwall
        jp ylwdorst

.dorp1:                     ; close door
        ld  a,(hl)
        or  bwall
        jp ylwdorst

; ---- draws door in the screen buffer: changes sprite address to the door tiles
;
; args: 
;       A  - door height
;       HL - pointer to the first tile in screen buffer
;
drawdoor:
        ld  bc, ROWWIDB - 3
        ld  de, DOORTILE
.drd1:        
        savem_hl_de
        inc  hl                     ; skip tile state
        ld   (hl),bwall
        add  hl,bc                   ; move to next row
        dec  a
        jp   nz,.drd1
        ret
        

; ---- first render post processor for screen N-9.
;
s9rndr:
        ld   hl, scrbuf + COLWIDB * 26 + ROWWIDB * 6
        ld   a,(s104trm + 1 + trdodat)
        cp   doorcls
        jp   z,.cls
        ld   a,1
        jp   drawdoor
.cls:        
        ld   a,8
        jp   drawdoor

; ---- first render post processor for screen N-37.
;
s37rndr:
        ; --- set left border
        ld  hl, scrbuf + COLWIDB * 25 + ROWWIDB * 7 + TLMDATR
        ld  a,bwall
        ld  bc, ROWWIDB
        dup 7
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

; ---- first render post processor for screen N-52.
;
s52rndr:
        ld   hl, scrbuf + COLWIDB * 2 + ROWWIDB * 9
        ld   a,(s79trm + 1 + trdodat)
        cp   doorcls
        jp   z,.cls
        ld   a,1
        call   drawdoor
        ld   hl,scl52txd
        jp   drwtram
.cls:        
        ld   a,7
        jp   drawdoor

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

s122rndr:
        ld  hl, scrbuf + COLWIDB * 2 + ROWWIDB * 8 + TLMDATR
        ld  a,(s97trm + 1 + trdodat)
        jp  doorprc

; ---- first render post processor for screen N-123.
;
s123rnd:
        ; --- set left border
        ld  hl, scrbuf + COLWIDB * 10 + ROWWIDB * 7 + TLMDATR
        ld  a,bwall
        call ylwdorst

        ; --- set wall above plate to make saboteur go in
        ld  hl, scrbuf + COLWIDB * 10 + ROWWIDB * 14 + TLMDATR
        ld  bc, COLWIDB
        dup 5
            ld  (hl),a
            add hl,bc       ; move to next row
        edup

        call cptcabin
        ret
        