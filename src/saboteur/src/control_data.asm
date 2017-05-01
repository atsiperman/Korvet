
OLDSTK: dw 0            	; save stack to return to cp/m
tmpstk: dw 0				; to save stack for some operations
	
; ---- LUT 
LUTVAL:
		db 0				; black		
		db 11h				; CBLUE		0001 0001
		db 19h				; CBLUE		0001 1001
		db 0a2h				; CGREEN	1010 0010
 		db 02ah				; CGREEN    0010 1010
		db 0e3h				; CYELLOW   1110 0011
		db 06bh				; CYELLOW   0110 1011
		db 48h				; CRED		0100 1000
		
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
curscr: 	dw scrmap		; pointer to current screen
prevscr:	dw 0			; pointer to previous screen

shadscr:	dup	ROWNUM * COLNUM
			db 0
			edup

			
; ----	saboteur control block			
;
sbctrlb:	
			mkctrlb osabotr,1,sbstay,dirrt,(SCRADDR + 64*8),(SCRADDR + 64*8),sabsprt,0
	
;			db osabotr				; 0, object type
;			db 1					; 1, draw flag
;			db sbstay				; 2, current state of saboteur
;			db dirrt				; 3, direction
;			dw SCRADDR + 64*8 		; 4, previous position
;			dw SCRADDR + 64*8		; 6, current position, top left corner
;			dw sabsprt				; 8, address of the current sprite of saboteur to be drawn
;			db sabspri				; 10, index if the current sprite



				
