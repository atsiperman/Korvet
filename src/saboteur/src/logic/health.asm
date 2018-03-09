;
;	this file contains logic for health bar 
;

; ---- increase health
;
hlinc:
		ld hl,sbhealth
		ld a,(hl)
		cp HEALMAX
		ret z				; do nothing
		
		ld e,a				
		
		rra
		rra
		rra 
		and 31				
		rla
		rla
		rla 
		and ~7				; number of dots in full bytes		
		
		ld d,a
		ld a,e
		inc a				; increase health
		ld (hl),a			; save new value
		
		sub d				; calculate increment relative to the last full byte
		
		inc hl
		ld (hl),HLBINCR		; save change type
		inc hl
		ld (hl),a			; save increment
		
		ret
		
; ---- draws health bar
;
hldraw:
		ld hl,sbhealth + 1
		ld a,(hl)
		or a
		ret z				; no changes
		
		inc hl		
				
		ld a,(hl)			; load number of dots to draw
		or a
		ret z				; no changes
		
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
		
		cp HLBINCR
		jp nz,hldraw2		; decrement
		
		call hlbincr
		jp hldraw_
		
hldraw2:		
		call hlbclear		; draw decrement
		
hldraw_:	
		ld a,0				; clear change type
		ld (sbhealth + 1),a
		ret
		
; ---- increases health bar
; args:
;		B - number of full bytes 
;		C - number of dots in the last incomplete byte
;
hlbincr:
		setcolor HLCOLRON
		
		ld hl,sbhealth + 3	; load current position of the right border
		load_de_hl			
		ex de,hl
				
		ld e,255
		push bc
		
hlincr2:					; draw full bytes
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
		ld e,0
		
hlincr4:					; create data for extra dots	
		xor a
		or c
		jp z,hlincr5		; draw result
		
		ld a,e
		rra
		or 128
		ld e,a				; save result in E
		dec c
		jp hlincr4
		
hlincr5:						
		ld a,e
		or a
		jp z,hlincr6		; no extra dots to draw
		
		push hl
		call hldrwcol
		pop hl
		
hlincr6:
		pop bc		
		ex de,hl
		ld hl,sbhealth + 3
		savem_hl_de
		ret
		
; ---- reduces health bar
; args:
;		B - number of full bytes 
;		C - number of dots in the last incomplete byte
;
hlbclear:
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



