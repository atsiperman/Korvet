INTRREG             EQU 0fb28h
INTRREGMSK          EQU 0fb29h
INTRREGVAL          EQU 18              ; 00010110

prevkeys:	        db 0			; previous keys pressed
lastkeys:	        db 0			; last keys pressed

intr_counter:       db 0
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

; ------------------------------
; screen interrupt handler
; ------------------------------
screen_intr_handler:
                    di
                    push hl
                    push af
                    push de

                    ld   a,(graph_mode_on)       
                    ld   (saved_gr_mode_on),a    
                    or   a
                    jp   z,.test_counter         ; test counter if not in graph mode
                    ; GRMODOFF
                    ld a,DOSCONF
                    ld (GSYSREG),a

.test_counter:
                    ld   a,(intr_counter)
                    cp   50
                    jp   nc,.print_frame_counter ; print frame counter if interrupt counter >= 50
                    inc  a                       ; increase interrupt counter
                    ld   (intr_counter),a        ; save it
                    jp   .end                    ; and exit
                    
.print_frame_counter:
                    ld   hl,0fc00h 
                    ld   a,(frame_counter)      ; load frame counter
                    ld   e,a                    ; save it in E

                    ld  a,e
                    and  ~7                     ; get hi digit
                    rra
                    rra
                    rra
                    ;rra
                    add  '0'     

                    ld   (hl),a
                    inc  hl

                    ld   a,e

                    and  7                     ; get low digit
                    add  '0'

                    ld   (hl),a
                    inc  hl

                    xor  a
                    ld  (frame_counter),a       ; reset frame counter
                    ld  (intr_counter),a        ; reset interrupt counter

.end
                    ld  a,20h
                    ld  (INTRREG),a         ; finish interrupt processing

                    ld  a,(saved_gr_mode_on)    ; get previous mode
                    or  a                       ; was graph on ?
                    jp  z,.exit                  ; no - exit

                    ; GRMODON
                    ld a,GCONFIG
                    ld (TSYSREG),a
.exit:
                    pop  de
                    pop  af
                    pop  hl

                    ei                    
                    ret   

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
