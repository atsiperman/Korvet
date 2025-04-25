INTRREG             EQU 0fb28h
INTRREGMSK          EQU 0fb29h
INTRREGVAL          EQU 18              ; 00010110

prevkeys:	    db 0                ; previous keys pressed
lastkeys:	    db 0                ; last keys pressed

intr_counter:       db 50
frame_counter:      db 0
saved_gr_mode_on:   db 0

; ---- scores for killing guard by weapon
killwpgd:
        db 0, 0, 1, 5, 0

; ---- scores for kill guard by punch or kick
killguad:
        db 0, 0, 5, 0, 0


; ---- escape and fight another day
escscor:
        db 0, 1, 0, 0, 0

; ---- escape with disc and bomb set
escwdsbm:
        db 1, 0, 0, 0, 0

                    align 32
INTRTAB             EQU $

                    ORG $ + 32

        ; ; macro mknpause   duration
        ; ; mknote 0, duration
        ; ; endm

NOTE1   EQU     10200
NOTE2   EQU     4300
NOTE3   EQU     5070
NOTE4   EQU     5783
NOTE5   EQU     6700
NOTE6   EQU     8350

NOTE2_1 EQU     NOTE1
NOTE2_2 EQU     3400
NOTE2_3 EQU     3800
NOTE2_4 EQU     4340
NOTE2_5 EQU     5100
NOTE2_6 EQU     5650

; --- menu music data
mmusdata:
        notesnum        .emmusd
        ; --- first part
        dup     2               
                ; --- 1-st phrase
                dup     4
                        mknote          NOTE1, 7
                        ;mknpause        1
                edup
                mknote          NOTE2, 15
                dup     2
                        mknote          NOTE1, 7
                        mknote          NOTE2, 14
                edup
                mknote          NOTE3, 14
                mknote          NOTE4, 14
                ; --- 2-nd phrase
                dup     4
                        mknote          NOTE1, 7
                        ;mknpause        1
                edup
                mknote          NOTE2, 15
                dup     2
                        mknote          NOTE1, 7
                        mknote          NOTE2, 14
                edup
                mknote          NOTE3, 7
                mknote          NOTE4, 7
                mknote          NOTE5, 7
                mknote          NOTE6, 7
        edup

        ; --- second part
                ; --- 3-rd phrase
                dup     4
                        mknote          NOTE2_1, 7
                edup
                mknote          NOTE2_2, 15
                dup     3
                        mknote          NOTE2_1, 7
                        mknote          NOTE2_2, 14
                edup
                mknote          NOTE2_3, 14
                mknote          NOTE2_4, 14
                ; --- 2-nd phrase
                dup     4
                        mknote          NOTE2_1, 7
                edup
                mknote          NOTE2_2, 15
                dup     3
                        mknote          NOTE2_1, 7
                        mknote          NOTE2_2, 14
                edup
                mknote          NOTE2_3, 7
                mknote          NOTE2_4, 7
                mknote          NOTE2_5, 7
                mknote          NOTE2_6, 7

                ; --- 4-th phrase
                dup     4
                        mknote          NOTE2_1, 7
                edup
                mknote          NOTE2_2, 15
                dup     3
                        mknote          NOTE2_1, 7
                        mknote          NOTE2_2, 14
                edup
                mknote          NOTE2_3, 14
                mknote          NOTE2_4, 14
                ; --- 2-nd phrase
                dup     4
                        mknote          NOTE2_1, 7
                edup
                mknote          NOTE2_2, 15
                dup     2
                        mknote          NOTE2_1, 7
                        mknote          NOTE2_2, 14
                edup
                mknote          2850, 7
                mknote          3030, 7 
                mknote          3400, 7
                mknote          3800, 7
                mknote          2850, 7
                mknote          4570, 7
                mknote          5120, 7
                mknote          4570, 7
                mknote          4050, 7
                mknote          4570, 7
                mknote          5120, 7
                mknote          5650, 7
                mknote          6700, 7
                mknote          7650, 7
                mknote          9100, 7
                mknote          10200, 7
        ;mknpause        25
.emmusd        

muslen: db 1                    ; melody length in notes
musptr: dw mmusdata + 1         ; pointer to the next note
notelen:
        db 1                    ; note duration

; ------------------------------
; plays music on the menu screen
; ------------------------------
playmmus:
        ld      a,(notelen)
        dec     a               ; change counter
        jp      z,.playn        ; play next note if this one is finished
        ld      (notelen),a     ; save counter
        ret                     ; continue playing current note

.playn:
        DISSND

        ld      a,(muslen)      ; notes counter
        dec     a
        jp      nz,.ldnote      ; load next note
                                ; reload melody

        ld      hl,mmusdata + 1 
        ld      (musptr),hl     ; save pointer to the first note
        ld      a,(mmusdata)    ; load melody length

.ldnote:
        ld      (muslen),a      ; save notes counter
        ld      hl,(musptr)     ; load current note pointer
        ex      de,hl           ; move it into DE

        ld      hl,SNDREGD      ; sound register        

        ld      a,(de)          ; load low byte
        ;;ld      c,a             ; save it in C
        ld      (hl),a          ; send low byte
        inc     de              ; to hi byte    
        ld      a,(de)          ; load hi byte
        ;;ld      b,a             ; save it in B
        ld      (hl),a          ; load hi byte
        inc     de      
        ld      a,(de)          ; load duration
        ld      (notelen),a     ; save duration counter
        
        ex      de,hl           ; move pointer to HL
        inc     hl              ; move pointer to the next note
        ld      (musptr),hl     ; save it 

        ;;ld      a,c             ; if BC == 0
        ;;or      b               ; then is a pause
        ;;ret     z               ; play nothing

        ENSND                            
        ret

; ------------------------------
; screen interrupt handler
; ------------------------------
screen_intr_handler:
                di
                push hl
                push af
                push de
                push bc

                ld   a,(graph_mode_on)       
                ld   (saved_gr_mode_on),a    
                or   a
                jp   z,.prntfps                 ; test counter if not in graph mode
                ; GRMODOFF
                ld a,DOSCONF
                ld (GSYSREG),a

.prntfps:

                ifdef PRINTFPS
                call print_fps
                endif    

                ld  a,20h
                ld  (INTRREG),a                 ; finish interrupt processing

                call playmmus                   ; play music from menu

                ld  a,(saved_gr_mode_on)        ; get previous mode
                or  a                           ; was graph on ?
                jp  z,.exit                     ; no - exit

                ; GRMODON
                ld a,GCONFIG
                ld (TSYSREG),a
.exit:
                pop  bc
                pop  de
                pop  af
                pop  hl

                ei
                ret     

        ifdef PRINTFPS
; ----- prints FPS counter

print_fps:
                    ld   a,(intr_counter)
                    dec  a
                    jp   z,.print_frame_counter  ; print frame counter 
                    ld   (intr_counter),a        ; save interrupt counter
                    jp   .end                    ; and exit
                    
.print_frame_counter:
                    ld   hl,0fc00h              ; text RAM to print at
                    ld   a,(frame_counter)      ; load frame counter
                    ld   e,a                    ; save it in E

                    and  ~7                     ; get hi digit
                    rra
                    rra
                    rra
                    add  '0'     

                    ld   (hl),a                 ; print first digit
                    inc  hl                     ; move to the next position

                    ld   a,e                    ; restore frame counter

                    and  7                      ; get low digit
                    add  '0'

                    ld   (hl),a                 ; print second digit

                    xor  a
                    ld  (frame_counter),a       ; reset frame counter

                    ld  a,50
                    ld  (intr_counter),a        ; reset interrupt counter
.end
                    ret   
        endif ; ifdef PRINTFPS

; ------------------------------
;  installs interrupt handlers
; ------------------------------
install_interrupt_handler:
            ; set up control table
            ld  a, INTRREGVAL + (low INTRTAB & ~31) ; control code + hi 3 bits of low address byte
            ld  (INTRREG),a
            ld  a,high INTRTAB
            ld  (INTRREGMSK),a  
            
            ld  a,0C3h                          ; jmp
            ld  (INTRTAB + 4*4),a               ; write instruction code
            ld  hl,screen_intr_handler          ; interrupt routine handler
            ld  (INTRTAB + 4*4 + 1),hl          ; write interrupt routine address

            ld  a,~16                           ; disable all interrupts but 4-th
            ld  (INTRREGMSK),a


            ret
