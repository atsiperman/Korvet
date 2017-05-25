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
		ld hl,0f901h
		ld a,(hl)
		and a,(KDOWN + KLEFT + KRIGHT)
		ld b,a

		ld hl,0f902h	; check key up
		ld a,(hl)
		and a,KUP		
		or b			; combine with previous
		ld b,a
		
		ld hl,0f880h	; check key esc
		ld a,(hl)
		and a,KESC
		or b			; combine with previous
		ld b,a

		ld hl,0f840h	; check key space
		ld a,(hl)
		and a,KSPACE
		or b			; combine with previous
		
		ret
		