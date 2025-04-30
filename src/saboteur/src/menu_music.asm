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


LONGNOTE EQU    13
SHRTNOTE EQU    7 
LNGNOTE2 EQU    13

; --- menu music data
mmusdata:
        notesnum        .emmusd
        ; --- first part
        dup     2               
                ; --- 1-st phrase
                dup     4
                        mknote          NOTE1, SHRTNOTE
                edup
                mknote          NOTE2, LNGNOTE2
                dup     2
                        mknote          NOTE1, SHRTNOTE
                        mknote          NOTE2, LONGNOTE
                edup
                mknote          NOTE3, LONGNOTE
                mknote          NOTE4, LONGNOTE
                ; --- 2-nd phrase
                dup     4
                        mknote          NOTE1, SHRTNOTE
                edup
                mknote          NOTE2, LNGNOTE2
                dup     2
                        mknote          NOTE1, SHRTNOTE
                        mknote          NOTE2, LONGNOTE
                edup
                mknote          NOTE3, SHRTNOTE
                mknote          NOTE4, SHRTNOTE
                mknote          NOTE5, SHRTNOTE
                mknote          NOTE6, SHRTNOTE
        edup

        ; --- second part
                ; --- 3-rd phrase
                dup     4
                        mknote          NOTE2_1, SHRTNOTE
                edup
                mknote          NOTE2_2, LNGNOTE2
                dup     3
                        mknote          NOTE2_1, SHRTNOTE
                        mknote          NOTE2_2, LONGNOTE
                edup
                mknote          NOTE2_3, LONGNOTE
                mknote          NOTE2_4, LONGNOTE
                ; --- 2-nd phrase
                dup     4
                        mknote          NOTE2_1, SHRTNOTE
                edup
                mknote          NOTE2_2, LNGNOTE2
                dup     3
                        mknote          NOTE2_1, SHRTNOTE
                        mknote          NOTE2_2, LONGNOTE
                edup
                mknote          NOTE2_3, SHRTNOTE
                mknote          NOTE2_4, SHRTNOTE
                mknote          NOTE2_5, SHRTNOTE
                mknote          NOTE2_6, SHRTNOTE

                ; --- 4-th phrase
                dup     4
                        mknote          NOTE2_1, SHRTNOTE
                edup
                mknote          NOTE2_2, LNGNOTE2
                dup     3
                        mknote          NOTE2_1, SHRTNOTE
                        mknote          NOTE2_2, LONGNOTE
                edup
                mknote          NOTE2_3, LONGNOTE
                mknote          NOTE2_4, LONGNOTE
                ; --- 2-nd phrase
                dup     4
                        mknote          NOTE2_1, SHRTNOTE
                edup
                mknote          NOTE2_2, LNGNOTE2
                dup     2
                        mknote          NOTE2_1, SHRTNOTE
                        mknote          NOTE2_2, LONGNOTE
                edup
                mknote          2850, SHRTNOTE
                mknote          3030, SHRTNOTE 
                mknote          3400, SHRTNOTE
                mknote          3800, SHRTNOTE
                mknote          2850, SHRTNOTE
                mknote          4570, SHRTNOTE
                mknote          5120, SHRTNOTE
                mknote          4570, SHRTNOTE
                mknote          4050, SHRTNOTE
                mknote          4570, SHRTNOTE
                mknote          5120, SHRTNOTE
                mknote          5650, SHRTNOTE
                mknote          6700, SHRTNOTE
                mknote          7650, SHRTNOTE
                mknote          9100, SHRTNOTE
                ;;mknote          10200, SHRTNOTE
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

        ld      bc,0ffh           ; make a pause
.mmpause:        
        dec     bc
        ld      a,c
        or      b
        jp      nz,.mmpause

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
