
    ; ---- init sound register
    macro INITSND
        ld hl,SNDREGM
        ld (hl),SNDMOD
    endm

    ; ---- starts playing sound specified
    macro STARTSND pitch
        ld hl,SNDREGD
        ld (hl),LOW pitch
        ld (hl),HIGH pitch
        ENSND
    endm

    ; ---- sends sound data
    macro SENDSND lo, hi
        ld hl,SNDREGD
        ld (hl),lo
        ld (hl),hi
    endm

    ; ---- sends sound data via preloaded HL
    macro _SENDSND lo, hi
        ld (hl),lo
        ld (hl),hi
    endm

    ; ---- plays sound of weapon hit
    macro PLYWEAPN
        call playwpn
    endm

; ---- plays sound of a weapon throw
playthrw:
        ld      de,sndthrow
        ld      b,1
        jp      playsmps

; ---- plays sound of punch hit 
playpnch:
        ld      de,sndpunch
        jp      playsnd

; ---- plays sound of bomb explosion
plyxlpsn:        
        ld      de,sndxplsn
        jp      playsnd

; ---- plays sound of weapon hit 
playwpn:
        ld      de,sndgunsh
        jp      playsnd

; ---- plays sound of disk ejection
playdscs:
        ld      de,dsksnd
        ld      b,3
        jp      playsmps

; ---- plays simple sound from the buffer provided
; args: DE - buffer to play from
;       B  - count of repetition
;
playsmps:
        ENSND
        ld hl,SNDREGD
        ld a,(de)               ; load counter

.replay:   
        push af                 ; save counter
        push de                 ; save buffer
        ;ld a,(de)               ; load counter
        ld c,a                  ; save it in C

.play:        
        inc de                  
        ld a,(de)
        ld (hl),a

        inc de                  
        ld a,(de)
        ld (hl),a

        dup 3
                halt
        edup

        dec c                   ; number of sounds
        jp   nz,.play

        pop  de                 ; restore buffer
        pop  af                 ; restore sound counter
        dec  de                 

        dec b                   ; number of replays
        jp  nz,.replay

        DISSND
        ret

; ---- plays sound synchronously from the buffer provided
;  args: DE - sound buffer
;
playsnd:
        ld  a,(de)              ; load number of iterations
        ld  c,a                 ; init iteration counter
        inc de                  ; move to the note counter
.plstrt:                         
        push de
        ld  a,(de)              ; load number of notes
        ld  b,a                 ; init note counter

.pls1:
        inc de                  ; move to the next note

        DISSND

        ld  hl,SNDREGD          ; sound register        

        ld  a,(de)              ; load data
        inc  de                 ; to hi byte    

        ld  (hl),a              ; send low byte

        ld  a,(de)              ; load hi byte
        ld  (hl),a              ; send hi byte
        ENSND                            

.pls2:
        inc de                  ; to duration
        ld  a,(de)              ; load duration low byte
.pls3:
        dec a
        jp  nz,.pls3            ; delay

        dec b                   ; number of notes
        jp  nz,.pls1

        pop de
        dec c                   ; number of iterations
        jp  nz,.plstrt          ; continue playing if not finished
        DISSND
        ret                         

; ---- make a sound when saboteur makes a step
sndstep:       
        push af
        push hl
        STARTSND 0fffh
        ld  a,255
.sbs1:  dec a
        jp  nz,.sbs1
        DISSND
        pop hl
        pop af
        ret

; ---- wait for the blank to start
;
; waitblnk:
;         ld   a,(TVISTS)
;         and  2
;         jp   z,waitblnk

; .waitbl1
;         ld   a,(TVISTS)
;         and  2
;         jp   nz,.waitbl1

;         ret
