RAILROW EQU MAXROW - 1
RAILNUM EQU 6
RAILITN EQU 120             ; number of iterations for wagon triggers

; ---- rails data
rails:
        macro mkrail colnum
            db colnum
            mkscradr colnum, RAILROW
        endm

        mkrail 19
        mkrail 16
        mkrail 15
        mkrail 4
        mkrail 1
        mkrail 0

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

        macro W2TRGST ltrgst, rtrgst
        ld  hl,s64trm + 1
        ld  (hl),ltrgst        
        ld  hl,s64trm + 1 + trsize
        ld  (hl),rtrgst
        endm

; ---- procedure for triggers in wagons
;
; result: A - 0 if trigger stopped working
;
wgn1trl:
        ld  hl,wgtr_1 + 1
        ld  bc,wgtr1
        savem_hl_bc
        ld  a,dirlt
        jp  wgnact

wgn1trr:        
        ld  hl,wgtr_1 + 1
        ld  bc,wgtr2
        savem_hl_bc
        ld  a,dirrt
        jp  wgnact

wgn2trl:
        ld  hl,wgtr_1 + 1
        ld  bc,wgtr3
        savem_hl_bc
        ld  a,dirlt
        jp  wgnact

wgn2trr:        
        ld  hl,wgtr_1 + 1
        ld  bc,wgtr4
        savem_hl_bc
        ld  a,dirrt
        jp  wgnact

; ---- wagon action
;
; result: A - 0 if trigger stopped working
;
wgnact:
        call wgnmove
        ld  a,(railit)
        dec a
        or  a
wgtr_1:        
        jp  z,wgtr1
        ld  (railit),a              ; save counter
        ret

wgtr1:
        RAILITRS                    ; reset counter
        W1TRGST trdisab,tractiv
        xor a
        ret
wgtr2:
        RAILITRS                    ; reset counter
        W1TRGST tractiv, trdisab
        xor a
        ret
wgtr3:
        RAILITRS                    ; reset counter
        W2TRGST trdisab,tractiv
        xor a
        ret
wgtr4:
        RAILITRS                    ; reset counter
        W2TRGST tractiv, trdisab
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
        ld  e,RAILROW   ; row number            
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
        jp  z,.wgnm1
        ld  hl,rails
        dup RAILNUM
        call drwrrt
        edup
        ret

.wgnm1:
        ld  hl,rails
        dup RAILNUM
        call drwrlt
        edup
        ret

; ---- draw rails for wagon moving in left direction
;
drwrlt:
        ld  a,(hl)      ; load column
        cp  29        
        jp  nz,.drwrl1

        xor a
        ld (hl),a       ; crossed right border, reset column to 0
        inc hl
        ld  de,SCRADDR + RAILROW * 64 * 8
        savem_hl_de
        jp .drwrl2

.drwrl1:
        inc a           ; increase column
        ld  (hl),a      
        inc hl          
        load_de_hl
        inc de          ; move to the next column in video memory
        dec hl
        ld  (hl),d
        dec hl
        ld  (hl),e
        inc hl
        inc hl
        
.drwrl2:
        ld  bc,railimg
        push hl
        call drawsto
        pop  hl
        
        ret     

; ---- draw rails for wagon moving in right direction
;
drwrrt:
        ld  a,(hl)      ; load column
        or  a        
        jp  nz,.drwrr1

        ld  a,MAXCOL
        ld (hl),a       ; crossed left border, reset column to MAXCOL
        inc hl
        ld  de,SCRADDR + MAXCOL + RAILROW * 64 * 8
        savem_hl_de
        jp .drwrr2

.drwrr1:
        dec a           ; increase column
        ld  (hl),a      
        inc hl          
        load_de_hl
        dec de          ; move to the next column in video memory
        dec hl
        ld  (hl),d
        dec hl
        ld  (hl),e
        inc hl
        inc hl
        
.drwrr2:
        ld  bc,railimg
        push hl
        call drawsto
        pop  hl
        
        ret             