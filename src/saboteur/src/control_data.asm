
OLDSTK: dw 0            	; save stack to return to cp/m
tmpstk: dw 0				; to save stack for some operations
	
; ---- LUT 
LUTVAL:
		db 00010000b	; CBLUE		0001 0001
		db 00100001b	; CGREEN    0010 0010
		db 01000010b	; CRED		0100 0011
		db 01100011b    ; CYELLOW   0110 0100
				
		db 10011000b	; CBLUE		0001 0001
		db 10101001b	; CGREEN    0010 0010
		db 11001010b	; CRED		0100 0011
		db 11101011b    ; CYELLOW   0110 0100

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

scrbuf:									; screen buffer		
			dup ROWNUM * ROWWIDB
			db 0
			edup
	
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

HLCOLRON	EQU	CRED  		; (80h + (CRED << 1)) ; color register to draw health bar
HLCOLRRM	EQU CBLUE 		;	(80h + (CBLUE << 1)) ; color register to clear health bar

HLSCRADR	EQU FRMADDR + (FRMHIGT-3)*8*64 + 6	; screen address for the health line
HEALMAX		EQU 120			; max value of health
HLDOGHIT	EQU 6			; hit by the dog

;SABSTADR	EQU SCRADDR + 64*8 + SCOLNUM 	; address for saboteur on the start screen			
SABSTADR	EQU scrbuf + ROWWIDB + SCOLNUM 	; address for saboteur on the start screen
			

; ---- screen control block
;
curscr: 	dw scrn48 		; pointer to current screen
prevscr:	dw 0			; pointer to previous screen

; ----	saboteur control block			
;
sbctrlb:	
		;mkctrlb osabotr,0,sbstay,dirrt,SABSTADR,sabsprt,0,SCOLNUM,SROWNUM
		mkctrlb osabotr,0,sbstay,dirrt,SABSTADR,sabsprt,0,6,10
			
; ----	saboteur health
;			
sbhealth:
		db HEALMAX			; 0, current health
		db 0				; 1, old value

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