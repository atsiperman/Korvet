KLEFT	EQU 16
KRIGHT	EQU 64
KUP		EQU 8
KDOWN	EQU 0

KEYMASK EQU (KLEFT + KRIGHT + KUP + KDOWN)

; -----  reads key board state
; result: A - key mask
kbread:	
		ld hl,0f820h
		ld a,(hl)
		and a,KEYMASK
		ret
		