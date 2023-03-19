
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
;       HL - pointer to the attributes of the first tile in screen buffer
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

; ---- screen init procedure for screen N-1
s1iprc:
        ld  hl,drwtops1
        ld  (addnldrw),hl
        ret

; ---- screen init procedure for screen N-2
s2iprc:
        ld  hl,drwtops2
        ld  (addnldrw),hl

                                        ; make red horizontal slab a wall
        ld  a,bwall     
        ld  hl, scrbuf + COLWIDB * 23 + ROWWIDB * 7 + TLMDATR
        ld  de,COLWIDB
        ld  c,7
.s2trp:        
        ld  (hl),a
        add hl,de
        dec c
        jp  nz,.s2trp
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

; ---- screen init procedure for screen N-32/33
s32iprc:
        ld   hl,(curscr)        ; get current screen address
        ld   a,l                ; is it screen33 ?
        cp   LOW scrn33         
        ret  nz                 ; no
        ld   a,h
        cp   HIGH scrn33
        ret  nz                 ; no

        xor  a                  ; otherwise clear which must be on screen32 only
        ld   hl,objlist                  
        ld   (hl),a
        inc  hl
        ld   (hl),a
        ret


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

; ---- screen init procedure for screen N-113
s113iprc:
        ld  a,(dlevel)
        cp  6
        ret nz

        ld  hl, scrbuf + COLWIDB * 19 + ROWWIDB * 15

.s113c:
        ld  c,5                                         ; number of blocks


.s113r:        
        ld  de, BK1DATA                                 ; yellow L

.s113s:        
        savem_hl_de             ; save sprite address
        xor     a
        ld      (hl),a
        inc     hl              ; skip tile state        
        inc     de              ; skip colors
        inc     de              
        ld      a,(de)          ; load attributes
        ld      (hl),a          ; save attributes
        inc     hl              ; move to tile data
        skip_buf_tile_data hl
        dec c
        jp nz,.s113r
        ret

; ---- screen init procedure for screen N-114
s114iprc:
        ld  a,(dlevel)
        cp  6
        jp  z,.s114_
        cp  5
        ret nz

.s114_:
        ld hl,TRAM + TSTARTC + 8 + 64*(TSTARTR + 6)
        ld (hl),CHFULL
        ld hl,TRAM + TSTARTC + 13 + 64*(TSTARTR + 6)
        ld (hl),CHFULL

        ld  hl, scrbuf + COLWIDB * 21 + ROWWIDB * 11
        call s113iprc.s113c
        ld  hl, scrbuf + COLWIDB * 7 + ROWWIDB * 11
        ld  c,8
        call  s113iprc.s113r

        ld  hl, scrbuf + COLWIDB * 8 + ROWWIDB * 11
        ld  de, BK26DATA
        inc c
        call s113iprc.s113s

        ld  hl, scrbuf + COLWIDB * 13 + ROWWIDB * 11
        ld  de, BK26DATA
        inc c
        jp   s113iprc.s113s

; ---- screen init procedure for screen N-116
s116iprc:
        ld  a,(dlevel)
        cp  6
        jp  z,.ss16_
        cp  5
        ret nz

.ss16_:
        ld  hl, scrbuf + COLWIDB * 5 + ROWWIDB * 8
        ld  c,10
        jp s113iprc.s113r

; ---- screen init procedure for screen N-119
s119iprc:
        ld  a,(dlevel)
        cp  6
        ret nz

        ld hl,TRAM + TSTARTC + 8 + 64*(TSTARTR + 5)
        ld (hl),CHFULL

        ld  hl, scrbuf + COLWIDB * 6 + ROWWIDB * 10
        call s113iprc.s113c

        ld  hl, scrbuf + COLWIDB * 8 + ROWWIDB * 10
        ld  de, BK26DATA
        inc c
        jp   s113iprc.s113s

; ---- screen init procedure for screen N-120
s120iprc:
        ld  a,(dlevel)
        cp  6
        jp  z,.s120_
        cp 5
        ret nz

.s120_:
        ld  hl, scrbuf + ROWWIDB * 13
        jp s113iprc.s113c

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

        jp cptcabin
        