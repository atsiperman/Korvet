
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
		
			
shadscr:					; map of the current screen
			dup	ROWNUM * COLNUM
			db 0
			edup

objlist:	dw 0			; pointer to the list of objects on the current screen

scrbuf:						; screen buffer		
			dup BUFLEN
			db 0
			edup

bufrows:	;;dup ROWNUM
			dw scrbuf
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
			;;edup
			
TILMAPLN	EQU	ROWNUM * COLNUM

tilemap:					; map of tiles, low half map - current state, hi half map - previous state
			dup TILMAPLN
			db 0
			edup

tilemapa:	dw tilemap
			dw tilemap + COLNUM
			dw tilemap + (COLNUM * 2)
			dw tilemap + (COLNUM * 3)
			dw tilemap + (COLNUM * 4)
			dw tilemap + (COLNUM * 5)
			dw tilemap + (COLNUM * 6)
			dw tilemap + (COLNUM * 7)
			dw tilemap + (COLNUM * 8)
			dw tilemap + (COLNUM * 9)
			dw tilemap + (COLNUM * 10)
			dw tilemap + (COLNUM * 11)
			dw tilemap + (COLNUM * 12)
			dw tilemap + (COLNUM * 13)
			dw tilemap + (COLNUM * 14)
			dw tilemap + (COLNUM * 15)
			dw tilemap + (COLNUM * 16)


curtile:	dw 0			; address of the current tile in video memory	
shcurtl:	dw 0			; current tile address in shadow screen
			

; ---- screen control block
;
curscr: 	dw scrn3 		; pointer to current screen
prevscr:	dw 0			; pointer to previous screen
			
			
SCOLNUM		EQU 1			; index of the start column for saboteur on the new screen
ECOLNUM		EQU COLNUM-6	; index of the last column for saboteur on the new screen
SROWNUM 	EQU 1			; index of the start row
SBWI		EQU 4			; width of the saboteur sprite
SBHI		EQU 6			; height of the saboteur sprite

SBWILAD		EQU 2			; width of the saboteur sprite for ladder
SBHILAD		EQU 7			; height of the saboteur sprite for ladder

HLCOLRON	EQU	CRED  ; (80h + (CRED << 1)) ; color register to draw health bar
HLCOLRRM	EQU CBLUE ;	(80h + (CBLUE << 1)) ; color register to clear health bar

HLSCRADR	EQU FRMADDR + (FRMHIGT-3)*8*64 + 6	; screen address for the health line
HEALMAX		EQU 120			; max value of health
HLDOGHIT	EQU 4			; hit by the dog

;SABSTADR	EQU SCRADDR + 64*8 + SCOLNUM 	; address for saboteur on the start screen			
SABSTADR	EQU scrbuf + ROWWIDB + SCOLNUM 	; address for saboteur on the start screen
			
; ----	saboteur control block			
;
sbctrlb:	
		mkctrlb osabotr,0,sbstay,dirrt,SABSTADR,sabsprt,0,SCOLNUM,SROWNUM
		;mkctrlb osabotr,0,sbstay,dirrt,SABSTADR,sabsprt,0,5,7
			
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
			
		; ---- current sprite 
		macro sbscursp
		ld hl,sbctrlb + odcursp
		ld (hl),e
		inc hl
		ld (hl),d
		endm
	
		macro sblcursp
		ld hl,(sbctrlb + odcursp)
		ex de,hl
		;load_de_hl
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