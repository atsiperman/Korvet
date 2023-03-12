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

    ; ---- plays sound of strike
;     macro PLAYPNCH
;         ;ld  de,sndpunch
;         ;call playsnd
;         call playpnch
;     endm

    ; ---- plays sound of weapon hit
    macro PLYWEAPN
        call playwpn
        ;ld  de,sndgunsh
        ;call playsnd
    endm

; ---- plays sound of punch hit 
playpnch:
        ld  de,sndpunch
        jp playsnd

; ---- plays sound of weapon hit ejection
playwpn:
        ld  de,sndgunsh
        jp playsnd

; ---- plays sound of weapon hit ejection
plyxlpsn:        
        ld b,3        
        ld hl,(explsnp)
        ld de,SNDREGD		; load sound data pointer
        
.plxpl:        
        dup 2
                ld a,(hl)       ; load data byte from buffer
                ld (de),a       ; send it to the sound register
                inc hl           
        edup
        dup 3
                halt
        edup
        dec b
        jp  nz,.plxpl
        ld  (explsnp),hl        ; save current pointer
        ret

; ---- disk sound data
dsksnd:
        db (.esnd - dsksnd) / 2
        dw 100, 305, 510, 405, 150, 700, 210, 110
.esnd:        

; ---- plays sound of disk ejection
playdscs:
        ld      de,dsksnd
        ld      b,3         
        jp      playsmps

;         ENSND
;         ld hl,SNDREGD

;         ld b, 08h                 ; repeat count

; .replay:   
;         ld  de,playdscs + 1
;         ld  c,35
;         ;ld de,dsksnd            ; load data pointer
;         ;ld a,(de)               ; load counter
;         ;ld c,a                  ; save it in C

; .play:        
;         inc de                  
;         ld a,(de)
;         ld (hl),a

;         inc de                  
;         ld a,(de)
;         ;and b
;         ld (hl),a

;         dup 3
;                 halt
;         edup

;         dec c
;         jp   nz,.play

;         ; dec b
;         ; jp  nz,.replay
;         DISSND
;         ret

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
        ;;push bc                 ; save counters

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
        ;;inc de
        ;;ld  c,a
        ;;ld  a,(de)              ; load duration hi byte
        ;;ld  b,a
.pls3:
        ;;dec bc
        ;;ld  a,c
        ;;or  b
        dec a
        jp  nz,.pls3            ; delay

        ;;pop bc                  ; restore counters
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
            db (endlabl - ($+1)) / 3    ; number of notes
        endm

        macro mknote pitch, duration
            dw pitch
            db duration
        endm

; ---- sound of a gun shell
sndgunsh:
        db 2                   ; number of iterations
        notesnum .endsnd
        dup 2
                mknote 10, 50
                dup 4
                mknote 65535, 255
                edup
        edup
.endsnd        

; ---- sound of a punch/kick
sndpunch:
        db 8                   ; number of iterations
        notesnum .endsnd
        ;dup 2
                mknote 10, 50
                dup 6
                mknote 65535, 255
                edup
        ;edup
.endsnd        
