
OLDSTK: dw 0            	; save stack to return to cp/m
tmpstk: dw 0				; to save stack for some operations
	
; ---- LUT 
LUTVAL:

		db 00000000b	; CBLACK
		db 00010001b	; CBLUE    
		db 01000010b	; CRED
		db 01100011b    ; CYELLOW   
    
        ; with text layer
		db 01111000b	; CWHITE
		db 00011001b	; CBLUE   
        db 00101010b	; CGREEN = CRED
		db 00111011b    ; CYELLOW = CYAN

		; black color		
		db 00000100b
		db 00000101b
		db 00000110b
		db 00000111b

		db 00001100b
		db 00001101b
		db 00001110b
		db 00001111b

TILMAPLN	EQU	ROWNUM * COLNUM

objlist:	dw 0		; pointer to the list of objects on the current screen
sobjlst:	dw 0		; pointer to the list of static objects on the current screen
mobjlst:	dw 0		; pointer to the list of masked objects on the current screen
trigmap:	dw 0		; pointer to the list of triggers on the current screen
tramdef:	dw 0		; pointer to definition of text ram for current screen
fstrdrp:    dw 0        ; pointer to first render post processing procedure
otramdef:	dw 0		; pointer to definition of text ram for old screen
; otramdef MUST be the last one

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
						
						
SCOLNUM		EQU 1			; index of the start column for saboteur on the new screen
ECOLNUM		EQU COLNUM-6	; index of the last column for saboteur on the new screen
SROWNUM 	EQU 1			; index of the start row
ECOLNUMJ	EQU COLNUM-5	; index of the last column for saboteur on the new screen when jumping
SBWI		EQU 4			; width of the saboteur sprite
SBHI		EQU 6			; height of the saboteur sprite
SBJMPHI		EQU 4			; height of the saboteur sprite when jumping
SBJMPWI		EQU 3			; width of the saboteur sprite when jumping
SBWILAD		EQU 2			; width of the saboteur sprite for ladder
SBHILAD		EQU 7			; height of the saboteur sprite for ladder

PNCHDST     EQU 3           ; threshold in columns, on which guard may do punch
KICKDST     EQU 6           ; threshold in columns, on which guard may do kick
BKSEEDST    EQU 3           ; threshold in columns, on which guard sees saboteur when that is moving from back side

HLCOLRON	EQU	CRED  		; (80h + (CRED << 1)) ; color register to draw health bar
HLCOLRRM	EQU CBLUE 		; (80h + (CBLUE << 1)) ; color register to clear health bar

HLSCRADR	EQU FRMADDR + (FRMHIGT-3)*8*64 + 6	; screen address for the health line
HEALMAX		EQU 120			; max value of health
HLDOGHIT	EQU 6			; hit by the dog
HLKNFHIT	EQU 15			; hit by the guard's knife

SABSTADR	EQU SCRADDR + 64*8 + SCOLNUM 	; address for saboteur on the start screen			
;SABSTADR	EQU scrbuf + ROWWIDB + SCOLNUM 	; address for saboteur on the start screen

; start byte of the control data
cdatast:

; ---- screen control block
;
curscr: 	dw scrn30 		; pointer to current screen
prevscr:	dw 0			; pointer to previous screen
fstrendr:	db 1			; flag, if this is the first render on the new screen

; ----	saboteur control block			
;
sbctrlb:	
		    ;mkctrlb osabotr,0,sbstay,dirrt,SABSTADR,sabsprt,0,SCOLNUM,SROWNUM
            mkctrlb osabotr,0,sbstay,dirrt,SABSTADR,sabsprt,0,7,7 ; 30
            ;mkctrlb osabotr,0,sbstay,dirrt,SABSTADR,sabsprt,0,7,9 ; 35

sbholds:    db troshrk  ; type of an object being held by saboteur
sbhldch:    db 1        ; flag, when object is changed

TIMEGFRM    EQU 10
curtime:    db 2, 9, 9          ; current time: 2 digits, from high digit to low
curtimef:   db TIMEGFRM         ; current game frame
ctimechg:   db 1                ; current time changed

score:      db 5, 0,0,0,0,0     ; score digits, from high to low
scorchg:    db 1                ; score changed

; ---- object thrown by saboteur
;
othrown:    
            db 0        ; direction where object has been thrown            
            dw 0        ; image address of an object thrown
            db 0        ; colnum
            db 0        ; rownum

; ---- flag, whether object has been already thrown by guard on the current screen
;
gfthrwn:    db 0

; ---- flag, whether guard has seen the saboteur
;
gfsbseen:   db 0

; ---- object thrown by guard
;
gthrown:    db 0        ; direction where object has been thrown            
            dw 0        ; image address of an object thrown
            db 0        ; colnum
            db 0        ; rownum

trigchd:	db 0		; flag, = 1 when trigger has been changed 
trtype:     db 0        ; trigger type (auto/manual)
curtrig:	dw 0		; pointer to the current trigger data
trproc:	    dw 0		; pointer to the current trigger's procedure
trotptr:    dw 0        ; pointer to trigger's object type
trdtptr:    dw 0        ; pointer to trigger's custom data

; ----	saboteur health
;			
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