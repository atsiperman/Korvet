
OLDSTK: dw 0            	; save stack to return to cp/m
tmpstk: dw 0				; to save stack for some operations
	
; ---- LUT 
LUTVAL:
		db 0				; black		
		db 11h				; CBLUE		0001 0001
		db 19h				;           0001 1001
		db 0a2h				; CGREEN	1010 0010
 		db 04ah				; red       1100 1010
		db 0e3h				; CYELLOW   1110 0011
		db 06bh				;           0110 1011
		db 08h				;     		0000 1000
		
CMAINHI	EQU 0h				; hi byte of the main color
		
		db CMAINHI + 04h	; CMAIN     0000 0100
		db CMAINHI + 05h	; CMAIN     0000 0101
		db CMAINHI + 06h	; CMAIN     0000 0110
		db CMAINHI + 07h	; CMAIN     0000 0111		
		db CMAINHI + 0ch	; CMAIN     0000 1100
		db CMAINHI + 0dh	; CMAIN     0000 1101
		db CMAINHI + 0eh	; CMAIN     0000 1110
		db CMAINHI + 0fh	; CMAIN     0000 1111		
				

; ---- screen control block
;
curscr: 	dw scrn1		; pointer to current screen
prevscr:	dw 0			; pointer to previous screen
			
shadscr:					; map of the current screen
			dup	ROWNUM * COLNUM
			db 0
			edup

objlist:	dw 0			; pointer to the list of objects on the current screen
scrbuf:						; screen buffer		
			dup BUFLEN
			db 0
			edup

bufrows:	dup ROWNUM
			dw 0
			edup
			
TILMAPLN	EQU	ROWNUM * COLNUM

tilemap:					; map of tiles, low half map - current state, hi half map - previous state
			dup TILMAPLN
			db 0
			edup

curtile:	dw 0			; address of the current tile in video memory	
			
SCOLNUM		EQU 1			; index of the start column for saboteur on the new screen
ECOLNUM		EQU COLNUM-6	; index of the last column for saboteur on the new screen
SROWNUM 	EQU 1			; index of the start row
SBWI		EQU 4			; width of the saboteur sprite
SBHI		EQU 6			; height of the saboteur sprite

HLCOLRON	EQU	CRED  ; (80h + (CRED << 1)) ; color register to draw health bar
HLCOLRRM	EQU CBLUE ;	(80h + (CBLUE << 1)) ; color register to clear health bar

HLSCRADR	EQU FRMADDR + (FRMHIGT-3)*8*64 + 6	; screen address for the health line
HLDECR		EQU 1
HLINCR		EQU 2

;SABSTADR	EQU SCRADDR + 64*8 + SCOLNUM 	; address for saboteur on the start screen			
SABSTADR	EQU scrbuf + COLNUM*8 + SCOLNUM 	; address for saboteur on the start screen
			
; ----	saboteur control block			
;
sbctrlb:	
			mkctrlb osabotr,0,sbstay,dirlt,SABSTADR,sabsprt,0,SCOLNUM,SROWNUM
			
; ----	saboteur health
;			
sbhealth:
			db 120			; current health
			db HLINCR		; health change type, 0 - no change, 1 - decrease, 2 - increase
			db 120			; number of dots to draw/remove
			dw HLSCRADR		; current address of the right border of the health line
			
			

			

