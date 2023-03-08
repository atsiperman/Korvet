;
;	this file contains logic for health bar 
;

; ---- checks if saboteur is alive
; result:
;		A - 0 is dead

hlalive:
		ld a,(sbhealth)
		ret

; ---- increase health
;
hlinc:		
		ld hl,hlfrm
		ld	a,(hl)
		or	a
		jp	z,.hl2
		dec	a
		ld (hl),a
		ret
		
.hl2:
		ld	a,HLRGNFRM		; reload regeneration timer
		ld	(hl),a			; and save

		ld hl,sbhealth
		ld a,(hl)			; load health value
		cp HEALMAX
		ret z				; do nothing if max
		or a
		ret z				; do nothing if zero (dead)
		
		inc a				; increase health
		ld (hl),a			; save new value
		
		ret

; ---- decrease health
; args:
;		A - amount to decrease by 
hldec:	
		ld e,a				; save decrement in E	

		ld hl,sbhealth
		ld a,(hl)			; load old value		
		or a
		ret z				; do nothing if zero
				
		sub e				; decrease value
		jp nc,hldec2		; normal way

		xor a				; less than zero, set to zero
		
hldec2:		
		ld (hl),a			; save new value
		ret
		
; ---- draws health bar
;
hldraw:
		ld hl,sbhealth
		ld a,(hl)			; current value
		inc hl
		ld e,(hl)			; old value
		
		cp e
		ret z				; no changes

		ld (hl),a			; save as old value
		ld d,a
			
		rra
		rra
		rra 
		and 31				
		
		ld c,a				; get number of bytes in new value
		ld b,c
				
		setcolor HLCOLRON	; set color to draw		
		
		ld hl,HLSCRADR
		
		ld a,c
		or a
		jp z,hldraw3
		
		ld e,255		
hldraw2:
		push hl
		call hldrwcol
		pop hl
		inc hl
		dec c
		jp nz,hldraw2 
		
hldraw3:					; draw incomplete byte
		ld a,b				; get number of bytes in new value
		rla
		rla
		rla 
		and ~7				; get number of dots in full bytes of new value
		ld c,a
		ld a,d
		sub c				; get number of dots in incomplete byte
		jp z,hldraw6
		
		ld c,a
		xor a
hldraw4:		
		rra
		or 128
		dec c
		jp nz,hldraw4
		ld e,a
		
		push hl
		call hldrwcol		; draw incomplete byte
		
		setcolor HLCOLRRM	; draw empty part
		
		pop hl
		ld a,e
		cpl
		ld e,a
		push hl
		call hldrwcol		
		pop hl
		inc hl		
hldraw6:
		push hl
		setcolor HLCOLRRM		; draw empty part of incomplete byte
		pop hl
		
		ld bc,HLSCRADR + 15		; draw empty part until end
		ld e,255
hldraw7:		
		ld a,h
		cp b
		jp nz,hldraw8
		ld a,l
		cp c
		jp z,hldraw_			; finish		
		
hldraw8:
		push hl
		call hldrwcol
		pop hl
		inc hl
		jp hldraw7
		
hldraw_:		
		ret
		
		
; ---- draw health bar column
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



