
OLDSTK: dw 0            	; save stack to return to cp/m
tmpstk: dw 0				; to save stack for some operations
	
; ---- LUT 
LUTVAL:
		db 00000000b	    ; CBLACK
		db 00010001b	    ; CBLUE    
		db 01000010b	    ; CRED
		db 01100011b        ; CYELLOW   
    
        ; with text layer
		db 01111000b	    ; CWHITE
		db 00011001b	    ; CBLUE   
        db 00101010b	    ; CGREEN = CRED
		db 00111011b        ; CYELLOW = CYAN

		; black color		
		db 00000100b
		db 00000101b
		db 00000110b
		db 00000111b

		db 00001100b
		db 00001101b
		db 00001110b
		db 00001111b

LUTVAL1:
		db 010000000b	    ; CBLACK
		db 01100001b	    ; CBLUE    
		db 01100010b	    ; CRED
		db 01100011b        ; CYELLOW   
    
        ; with text layer
		db 01101000b	    ; CWHITE
		db 01101001b	    ; CBLUE   
        db 01101010b	    ; CGREEN = CRED
		db 01101011b        ; CYELLOW = CYAN

		; black color		
		db 01000100b
		db 01000101b
		db 01000110b
		db 01000111b

		db 01001100b
		db 01001101b
		db 01001110b
		db 01001111b

TILMAPLN	EQU	ROWNUM * COLNUM

objlist:	dw 0		; pointer to the list of objects on the current screen
sobjlst:	dw 0		; pointer to the list of static objects on the current screen
mobjlst:	dw 0		; pointer to the list of masked objects on the current screen
trigmap:	dw 0		; pointer to the list of triggers on the current screen
tramdef:	dw 0		; pointer to definition of text ram for current screen
fstrdrp:    dw 0        ; pointer to first render post processing procedure
bmobjlst:	dw 0		; pointer to the list of background masked objects on the current screen
scrinitp:	dw 0		; pointer to screen init procedure to be called after screen is decompressed
otramdef:	dw 0		; pointer to definition of text ram for old screen

; otramdef MUST be the last one

            macro skip_buf_tile_spaddr reg_pair
                dup 2
                    inc reg_pair
                edup
            endm

            macro skip_buf_tile_head reg_pair
                dup 4
                    inc reg_pair
                edup
            endm

            macro skip_buf_tile reg_pair
                dup COLWIDB
                    inc reg_pair
                edup
            endm

            macro skip_buf_tile_data reg_pair
                dup 8
                    inc reg_pair
                edup
            endm

bufrows:	dw scrbuf
			dw scrbuf + ROWWIDB
			dw scrbuf + (ROWWIDB * 2)
			dw scrbuf + (ROWWIDB * 3)
			dw scrbuf + (ROWWIDB * 4)
			dw scrbuf + (ROWWIDB * 5)
			dw scrbuf + (ROWWIDB * 6)
			dw scrbuf + (ROWWIDB * 7)
			dw scrbuf + (ROWWIDB * 8)
			dw scrbuf + (ROWWIDB * 9)
			dw scrbuf + (ROWWIDB * 10)
			dw scrbuf + (ROWWIDB * 11)
			dw scrbuf + (ROWWIDB * 12)
			dw scrbuf + (ROWWIDB * 13)
			dw scrbuf + (ROWWIDB * 14)
			dw scrbuf + (ROWWIDB * 15)
			dw scrbuf + (ROWWIDB * 16)
						

SBWI		EQU 4			; width of the saboteur sprite
SBHI		EQU 6			; height of the saboteur sprite
SBJMPHI		EQU 4			; height of the saboteur sprite when jumping
SBJMPWI		EQU 3			; width of the saboteur sprite when jumping
SBWILAD		EQU 2			; width of the saboteur sprite for ladder
SBHILAD		EQU 7			; height of the saboteur sprite for ladder
ESCAPCOL    EQU 11          ; column on the last screen saboteur may escape from 

FSCOLNUM	EQU 3			; column index of the first screen
FSROWNUM 	EQU 8			; row index of the first screen

LECOLNUM	EQU 1					; index of the last column for saboteur on the new screen when going left
ECOLNUM		EQU COLNUM-SBWI-1		; index of the last column for saboteur on the new screen when going right
ECOLNUMJ	EQU COLNUM-SBJMPWI-1	; index of the last column for saboteur on the new screen when jumping

SCOLNUM		EQU 2					; index of the start column for saboteur on the new screen when going right
LSCOLNUM	EQU COLNUM-SBWI-2		; index of the start column for saboteur on the new screen when going left
LSCOLNUMJ	EQU COLNUM-SBJMPWI-1

PNCHDST     EQU 3           ; threshold in columns, on which guard may do punch
KICKDST     EQU 4           ; threshold in columns, on which guard may do kick
THRWDST     EQU 15          ; threshold in columns, on which guard may throw weapon
BKSEEDST    EQU 3           ; threshold in columns, on which guard sees saboteur when that is moving from back side

HLCOLRON	EQU	CRED  		; (80h + (CRED << 1)) ; color register to draw health bar
HLCOLRRM	EQU CBLUE 		; (80h + (CBLUE << 1)) ; color register to clear health bar

HLSCRADR	EQU FRMADDR + (FRMHIGT-3)*8*64 + 6	; screen address for the health line
HEALMAX		EQU 120			; max value of health
HLDOGHIT	EQU 5			; hit by the dog
HLKNFHIT	EQU 15			; hit by the guard's knife
HLGUNHIT	EQU 15			; hit by gun
HLGDPNCH	EQU 7			; hit by guard's punch
HLGDPKCK	EQU 12			; hit by guard's kick
HLFALL		EQU 6			; hit due to fall

CPTPAUS     EQU 1
CPTPAUS2    EQU 3

COPTCOL     EQU 6
COPTROW     EQU 5           ; top row of the helicopter when staying
COPTHI      EQU 10          ; full height of the helicopter
COPTWID     EQU 17          ; full width of the helicopter

CPTDRCOL    EQU 14          ; column number from which the door in helicopter's room starts opening

BOATMCOL	EQU 21			; max colum for boat back at the first screen

; start byte of the control data
cdatast:

; ---- helicopter data
;
cptpause:   db CPTPAUS
cptglass:   dw scrbuf + COLWIDB * 11 + ROWWIDB * 8          ; address of copter's cabin (front glass)
cptdradl:   dw scrbuf + COLWIDB * CPTDRCOL + ROWWIDB        ; address of the column in screen buffer where helicopter's door starts opening
cptdradr:   dw scrbuf + COLWIDB * (CPTDRCOL + 1) + ROWWIDB  ; address of the right column of helicopter's door
cptdsadl:   dw SCRADDR + CPTDRCOL + VERTDISP                ; video address of the left part of the door
cptdsadr:   dw SCRADDR + CPTDRCOL + 1 + VERTDISP            ; video address of the right part of the door

cptdritr:   db 10           ; number of iterations to open helicopter's door
cptrow:     db COPTROW      ; top row of the helicopter
cptheit:    db COPTHI       ; height of the helicopter
cptbuf:     dw scrbuf + COLWIDB * COPTCOL + ROWWIDB * COPTROW     ; address of the copter's body 
cptvmem:    dw SCRADDR + COPTCOL + COPTROW * VERTDISP             ; start address in video memory

			;define FULLSTART
			define ENDDEAD			; end game if dead

; ---- screen control block
;
curscr: 	dw scrn17 		; pointer to current screen
prevscr:	dw 0			; pointer to previous screen
fstrendr:	db 1			; flag, if this is the first render on the new screen

;SABSTADR	EQU SCRADDR + 64*8 + FSCOLNUM 	; address for saboteur on the start screen			
;SABSTADR	EQU scrbuf + ROWWIDB + SCOLNUM 	; address for saboteur on the start screen

; ----	saboteur control block			
;
sbctrlb:			
		    ;mkctrlb osabotr,0,sbsquat,dirrt,sbhsqtr,0,sabsqtrt,0,FSCOLNUM,FSROWNUM
			mkctrlb osabotr,0,sbstay,dirrt,sbheadr,0,sabsprt,0,25,8

;sbholds:    db troshrk  ; type of an object being held by saboteur
sbholds:    db trobomb   ; type of an object being held by saboteur
sbhldch:    db 1        ; flag, when object is changed

TIMEGFRM    EQU 3
TIMEUPDF	EQU	10
TIMRCNTD	EQU 2				; timer is in countdown mode

timrfst:	db 0				; timer frame state
timractv:	db 1				; timer state, 0 - disabled, 1 - active, TIMRCNTD - countdown mode
timepad:	db 4, SPACECH, SPACECH, SPACECH, SPACECH
curtime:    db 2,9,9	        ; current time: 2 digits, from high digit to low
curtimef:   db TIMEGFRM         ; current game frame
timeupdf:	db TIMEUPDF			; timer update frame
ctimechg:   db 1                ; current time changed

score:      db 5, 0,0,0,0,0     ; score digits, from high to low
scorchg:    db 1                ; score changed

GUNDELAY	EQU 20

; ---- gun shell data
gunshd:
            db 0        ; direction shell is moving to            
            dw gunshl   ; image address of the shell
            db 0        ; colnum
            db 0        ; rownum
			macro skip_gun_sprite regpair
			inc	regpair
			inc	regpair
			inc	regpair
			endm

gunshfr:	db 0		; frame count
gundir:		db 0		; current gun direction

; ---- object thrown by saboteur
;
othrown:    
            db 0        ; direction where object has been thrown            
            dw 0        ; image address of an object thrown
            db 0        ; colnum
            db 0        ; rownum

; ---- object thrown by guard
;
gthrown:    db 0        ; direction where object has been thrown            
            dw 0        ; image address of an object thrown
            db 0        ; colnum
            db 0        ; rownum

; ----  flags
gfthrwn:    db 0        ; whether object has been already thrown by guard on the current screen
gfsbseen:   db 0        ; whether guard has seen the saboteur
gsprtab:    dw 0        ; sprite table for current guard's action

trigchd:	db 0		; flag, = 1 when trigger has been changed 
trtype:     db 0        ; trigger type (auto/manual)
curtrig:	dw 0		; pointer to the current trigger description
trproc:	    dw 0		; pointer to the current trigger's procedure
trotptr:    dw 0        ; pointer to trigger's object type
trdtptr:    dw 0        ; pointer to trigger's custom data

HLRGNFRM	EQU 1		; number of frames for health regeneration

; ----	saboteur health
;			
hlfrm:	db HLRGNFRM

sbhealth:
		db HEALMAX			; 0, current health
		db 0				; 1, old value

; marker of the last data byte
cdataend:

		; ---- current state
		macro sblcurst
		ld a,(sbctrlb + odcurst)
		endm

		macro sbsetst 
		ld (sbctrlb + odcurst),a
		endm
		
		macro sbscurst newstate
		ld a,newstate
		ld (sbctrlb + odcurst),a
		endm

        ; ---- save current head sprite
        macro sbshdspr
		ld hl,sbctrlb + odhdspr
		ld (hl),e
		inc hl
		ld (hl),d
        endm
        
		; ---- save current sprite 
		macro sbscursp
		ld hl,sbctrlb + odcursp
		ld (hl),e
		inc hl
		ld (hl),d
		endm
	
		macro sblcursp
		ld hl,(sbctrlb + odcursp)
		ex de,hl
		endm
				
		; ---- current sprite index
		macro sblcursi
		ld a,(sbctrlb + odcursi)
		endm
		
		macro sbscursi
		ld (sbctrlb + odcursi),a
		endm

		; ---- previous sprite
		macro sblprvsp
		ld hl,sbctrlb + odprvsp
		load_de_hl
		endm
		
		; ---- current screen row
		macro sblcursr
		ld a,(sbctrlb + odcursr)
		endm
		
		macro sbscursr
		ld (sbctrlb + odcursr),a
		endm

		; ---- current screen column
		macro sblcursc
		ld a,(sbctrlb + odcursc)
		endm
		
		macro sbscursc
		ld (sbctrlb + odcursc),a
		endm

		; ---- direction
		macro sblddir
		ld a,(sbctrlb + oddir)
		endm
		
		macro sbsdir
		ld (sbctrlb + oddir),a
		endm
		
		; ---- vertical direction
		macro sbldvdir
		ld a,(sbctrlb + odvdir)
		endm
		
		macro sbsvdir
		ld (sbctrlb + odvdir),a
		endm		