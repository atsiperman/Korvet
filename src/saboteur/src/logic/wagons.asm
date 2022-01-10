; ---- rails data
rails:
        macro mkrail colnum
            db colnum
            mkscradr colnum, 15
        endm

        mkrail 19
        mkrail 16
        mkrail 15
        mkrail 4
        mkrail 1
        mkrail 0

RAILNUM EQU 6
RAILITN EQU 120

railit:
        db RAILITN

        macro RAILITRS       ; resets number of rail iterations
        ld  a,RAILITN
        ld  (railit),a
        endm

        macro W1TRGST ltrgst, rtrgst
        ld  hl,s25trm + 1
        ld  (hl),ltrgst        

        ld  hl,s25trm + 1 + trsize
        ld  (hl),rtrgst
        endm

; ---- procedure for left trigger in wagon-1
;      wagon starts moving left when it fires
;
; result: A - 0 if trigger stopped working
;
wgn1trl:
        ld  a,dirlt
        call wgnmove
        ld  a,(railit)
        dec a
        or  a
        jp  z,.wgtr1
        ld  (railit),a              ; save counter
        ret

.wgtr1:
        RAILITRS                    ; reset counter
        W1TRGST trdisab, tractiv
        xor a
        ret

; ---- procedure for right trigger in wagon-1
;      wagon starts moving right when it fires
;
wgn1trr:        
        ld  a,dirrt
        call wgnmove
        ld  a,(railit)
        dec a
        or  a
        jp  z,.wgtr1
        ld  (railit),a              ; save counter
        ret

.wgtr1:
        RAILITRS                    ; reset counter
        W1TRGST tractiv, trdisab
        xor a
        ret


; ---- procedure for wagon movement
; args: A - direction
;

wgnmove:
        push af
        GRMODON
        ld  hl,rails
        dup RAILNUM
        call clrrail
        edup

        pop af
        call drwrail
        GRMODOFF
        ret

; ---- clear rails
;
clrrail:
        ld  d,(hl)      ; load current column
        ld  e,15        ; row number            
        inc hl          ; move to video address
        push hl

        call shscradr   ; get position in screen buffer
        ex  de,hl
        dec de
        dec de
        dec de          ; get back to sprite address

        pop hl
        load_bc_hl      ; load address in video memory
        push hl

        ld  h,b
        ld  l,c         ; video address in HL        
        ld  c,1
        call drawbktl
        pop hl

        ret

; ---- draw rails
;
; args: A - direction
;
drwrail:   
        cp  a,dirlt
        jp  nz,.wgnm1

        ld  a,29
        ld  (.dwgr11 + 1),a        
        xor a
        ld  (.dwgr14 + 1),a
        ld  bc,SCRADDR + 15 * 64 * 8
        ld  hl,.dwgr12 + 1
        savem_hl_bc
        ld  a, 3ch          ; inc a
        ld  (.dwgr1),a
        ld  a, 13h          ; inc de
        ld  (.dwgr13),a

        jp  .wgnm2

.wgnm1:
        ld  a,0
        ld  (.dwgr11 + 1),a
        ld  a,29
        ld  (.dwgr14 + 1),a
        ld  bc,SCRADDR + 29 + 15 * 64 * 8
        ld  hl,.dwgr12 + 1
        savem_hl_bc
        ld  a, 3dh          ; dec a
        ld  (.dwgr1),a
        ld  a, 1bh          ; dec de
        ld  (.dwgr13),a

.wgnm2:
        ld  hl,rails
        dup RAILNUM
        call .drwrlh
        edup
        ret

.drwrlh:
        ld  a,(hl)      ; load column

.dwgr11:
        cp  29        
        jp  nz,.dwgr1

.dwgr14:
        ld  a,0
        ld (hl),a       ; crossed right border, reset column to 0
        inc hl
.dwgr12:
        ld  de,SCRADDR + 15 * 64 * 8
        savem_hl_de
        jp .dwgr2

.dwgr1:
        inc a           ; increase column
        ld  (hl),a      
        inc hl          
        load_de_hl
.dwgr13:        
        inc de          ; move to the next column in video memory
        dec hl
        ld  (hl),d
        dec hl
        ld  (hl),e
        inc hl
        inc hl
        
.dwgr2:
        ld  bc,railimg
        push hl
        call drawsto
        pop  hl
        
        ret     