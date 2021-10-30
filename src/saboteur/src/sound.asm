SNDREGD EQU     0FB00H     ; sound data register
SNDREGM EQU     0FB03H     ; sound mode register
SNDREGS EQU     0FB32H     ; enable sound register

SNDEN   EQU     8       ; enable sound 
SNDDIS  EQU     0       ; disable sound
SNDMOD  EQU     36h     ; timer sound mode 

    macro ENSND lo,hi
        ld hl,SNDREGM
        ld (hl),SNDMOD
        ld hl,SNDREGD
        ld (hl),lo
        ld (hl),hi
        ld hl,SNDREGS
        ld (hl),SNDEN
    endm

    macro DISSND
        ld hl,SNDREGS
        ld (hl),SNDDIS
    endm

; ---- make a sound when saboteur makes a step
sbstsnd:
        ld a,(sbctrlb + odcurst)   ; load current state
        cp sbmove
        ret nz

        ld a,(sbctrlb + odcursi)    ; load sprite index
        cp 3                        ; step sound if this is last sprite
        ret nz
        
        ENSND 255, 255

        ret
