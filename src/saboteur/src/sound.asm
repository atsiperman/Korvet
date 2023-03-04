SNDREGD EQU     0FB00H     ; sound data register
SNDREGM EQU     0FB03H     ; sound mode register
SNDREGS EQU     0FB32H     ; enable sound register

SNDEN   EQU     8       ; enable sound 
SNDDIS  EQU     0       ; disable sound
SNDMOD  EQU     36h     ; timer sound mode 

    ; ---- init sound register
    macro INITSND
        ld hl,SNDREGM
        ld (hl),SNDMOD
    endm

    ; ---- enable sound 
    macro ENSND
        ld hl,SNDREGS
        ld (hl),SNDEN
    endm

    ; ---- disable sound
    macro DISSND
        ld hl,SNDREGS
        ld (hl),SNDDIS
    endm

    ; ---- starts playing sound specified
    macro STARTSND lo, hi
        ld hl,SNDREGD
        ld (hl),lo
        ld (hl),hi
        ENSND
    endm

    ; ---- plays sound of strike
    macro PLAYPNCH
        ld  de,sndpunch
        call playsnd
    endm

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
        push bc                 ; save counters

        inc de                  ; move to the next note
        ld  hl,SNDREGD          ; sound register        

        ld  a,(de)              ; load data
        inc  de                 ; to hi byte    

        ;; or  a                   ; is a pause ?
        ;; jp  z,.pls2
        ld  (hl),a              ; send low byte

        ld  a,(de)              ; load hi byte
        ld  (hl),a              ; send hi byte
        ENSND                            

.pls2:
        inc de                  ; to duration
        ld  a,(de)              ; load duration low byte
        inc de
        ld  c,a
        ld  a,(de)              ; load duration hi byte
        ld  b,a
.pls3:
        dec bc
        ld  a,c
        or  b
        jp  nz,.pls3            ; delay

        DISSND

        pop bc                  ; restore counters
        dec b                   ; number of notes
        jp  nz,.pls1

        pop de
        dec c                   ; number of iterations
        jp  nz,.plstrt          ; continue playing if not finished
        ret                         

; ---- make a sound when saboteur makes a step
sbstsnd:
        ld a,(sbctrlb + odcurst)    ; load current state
        cp sbmove
        ret nz

        ld a,(sbctrlb + odcursi)    ; load sprite index
        cp 3                        ; step sound if this is last sprite
        ret nz
        
        STARTSND 255, 255
        ld  a,255
.sbs1:  dec a
        jp  nz,.sbs1
        DISSND

        ret

; ---- wait for the blank to start
;
waitblnk:
        ld   a,(TVISTS)
        and  2
        jp   z,waitblnk

.waitbl1
        ld   a,(TVISTS)
        and  2
        jp   nz,.waitbl1

        ret

        ; ---- defines number of notes
        macro notesnum endlabl
                db (endlabl - ($+1)) / 4    ; number of notes
        endm

        macro mknote pitch, duration
            dw pitch
            dw duration
        endm
; ---- sound of a gun shell
sndgunsh:
sndpunch:
        db 1                   ; number of iterations
        notesnum .endsnd
        mknote 50535, 701
        mknote 501, 200
        mknote 65535, 701
        mknote 501, 200
.endsnd        

