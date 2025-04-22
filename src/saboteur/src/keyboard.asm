KUP		EQU 1
KDOWN	EQU 4
KESC	EQU 8
KLEFT	EQU 10h
KRIGHT	EQU 40h
KSPACE  EQU 80h


; -----  reads keyboard state
; result: A - key mask
;
kbread:	
		ld hl,0f903h		; test arrow keys
		ld a,(hl)
		ld c,a

		ld hl,0f8ffh		; other keys
		ld a,(hl)
		or c				; add saved in C		
		ret
		
; -----  waits for any key to be pressed
; result: A - key mask
;
waitkey:
        call kbread
        or  a
        jp  z,waitkey
		ret
