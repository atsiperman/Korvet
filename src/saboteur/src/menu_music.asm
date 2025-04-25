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
.emmusd        

muslen: db 1                    ; melody length in notes
musptr: dw mmusdata + 1         ; pointer to the next note
notelen:
        db 1                    ; note duration

; ------------------------------
; plays music on the menu screen
; ------------------------------

playmmus:        
        ret

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
        ;;or      b               ; then it is a pause
        ;;ret     z               ; play nothing

        ENSND                            
        ret

; ------------------------------
;       enable menu melody
; ------------------------------
enablemm:
        ld      a,1             ; initialize music data
        ld      (notelen),a
        ld      (muslen),a

        xor     a               ; set NOP opcode to enable music
        ld      (playmmus),a
        ret

; ------------------------------
;       disable menu melody
; ------------------------------
disablmm:
        ld      a,0c9h          ; set RET opcode to stop music
        ld      (playmmus),a
        DISSND
        ret
