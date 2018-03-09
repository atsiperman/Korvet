;
;	this file contains logic for health bar 
;

; ---- draws health bar
;
hldraw:
		ld hl,sbhealth + 1
		ld a,(hl)
		or a
		ret z				; no changes
		
		inc hl		
				
		ld a,(hl)			; load number of dots to draw
		ld e,a				; save it in E
		
		rra
		rra
		rra 
		and 31				; number of full bytes to be drawn
		
		ld b,a				; save it in B
		
		rla
		rla
		rla 
		and ~7				; number of dots in full bytes
		
		ld c,a
		ld a,e
		sub c				; number of dots in incomplete byte
		
		ld c,a				; BC - number of full bytes | number of dots in the last incomplete byte
		
		ld a,(sbhealth + 1)
		
		cp HLINCR
		jp nz,hldraw2		; decrement
		
		call hlincr
		jp hldraw_
		
hldraw2:		
		call hlclear		; draw decrement
		
hldraw_:	
		ld a,0
		ld (sbhealth + 1),a
		ret
		
; ---- reduces health bar
; args:
;		B - number of full bytes 
;		C - number of dots in the last incomplete byte
;
hlincr:
		setcolor HLCOLRON
		
		ld hl,sbhealth + 3	; load current position of the right border
		load_de_hl			
		ex de,hl
				
		ld e,255
hlincr2:
		xor a
		or b
		jp z,hlincr3		; no more full bytes
		
		push hl		
		call hldrwcol
		pop hl
		
		inc hl				; next byte in the top row
		dec b
		jp hlincr2
		
hlincr3:
			
hlincr4:
		
		ret
		
; ---- reduces health bar
; args:
;		B - number of full bytes 
;		C - number of dots in the last incomplete byte
;
hlclear:
		ret
		
		
; ---- draw healh bar column
; args:
;		HL - screen address of the top byte
;		E  - byte to be drawn
;
hldrwcol:
		push bc		
		ld bc,64
		ld a,2*8		; two screen rows

hldrwc2:		
		ld (hl),e
		dec a
		jp z,hldrwc_
		
		add hl,bc
		
		jp hldrwc2
		
hldrwc_:		
		pop bc
		ret



