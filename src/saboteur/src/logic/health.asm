;
;	this file contains logic for health bar 
;

; ---- increase health
;
hlinc:
		ld hl,sbhealth
		inc hl				; check increment type
		ld a,(hl)			
		or a				
		ret nz				; do nothing if already changed
		dec hl				; go back to the health value
		
		ld a,(hl)
		cp HEALMAX
		ret z				; do nothing
		
		ld e,a				
		
		call floorbyt		; number of dots in full bytes		
		
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

; ---- decrease health
; args:
;		A - amount to decrease by 
hldec:	
		ld e,a				; save decrement in E	

		ld hl,sbhealth
		ld a,(hl)			; load old value		
		or a
		ret z				; do nothing if zero
				
		ld d,a				; save old value in D
		sub e				; decrease value
		jp nc,hldec2		; normal way

		xor a				; less than zero, set to zero
		
hldec2:		
		ld (hl),a			; save new value
		ld c,a				; and in C	
		
							; calculate decrement
		ld a,d				; get old value
		call floorbyt		; get number of dots in full bytes		
		ld b,a				; save it in B				
		ld a,d				
		sub b
		jp nz,hldec3		; there were extra dots, needs to be aligned to the full byte
		
		ld a,d				; restore old value
		jp hldec4
hldec3:
		ld a,b
		add 8				; round to the full byte
		
hldec4:				
		sub c				; calculate decrement 
		
		inc hl
		ld (hl),HLBDECR		; save change type
		inc hl
		ld (hl),a			; save decrement
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
		jp z,hldraw_		; no changes
		
		ld e,a				; save it in E

		call floorbyt		; number of full bytes to be drawn in B
				
		ld c,a
		ld a,e
		sub c				; number of dots in incomplete byte
		
		ld c,a				; BC - number of full bytes | number of dots in the last incomplete byte
		
		ld a,(sbhealth + 1)
		
		call hlbincr		; do change	
		
hldraw_:	
		xor a				; clear change type
		ld (sbhealth + 1),a
		ret
		
; ---- increases health bar
; args:
;		A - change type, HLBINCR / HLBDECR
;		B - number of full bytes 
;		C - number of dots in the last incomplete byte
;
hlbincr:
		ld e,a
		
		push bc
		
		cp HLBINCR				; check change type
		jp nz,hlbincr22		
								; increment
		setcolor HLCOLRON
		ld a,1Fh
		ld (hlincr41),a  		; set code RRA
		ld a,128
		ld (hlincr42 + 1),a
		ld a,23h			
		ld (hlincr24),a			; set code INC HL
		
		ld hl,(sbhealth + 3) 	; load current address
								; check it is not exceeded
		ld bc,HLSCRADR - 1
		ld a,h
		cp b
		jp nz,hlbincr28
		ld a,l
		cp c
		jp nz,hlbincr28
		inc hl
		
		jp hlbincr28
		
hlbincr22:						; decrement
		setcolor HLCOLRRM	
		ld a,17h
		ld (hlincr41),a  		; set code RRA
		ld a,1
		ld (hlincr42 + 1),a
		ld a,2bh
		ld (hlincr24),a			; set code DEC HL
		
		ld hl,(sbhealth + 3) 	; load current address
								; check it is not exceeded
		ld bc,HLSCRADR + 15
		ld a,h
		cp b
		jp nz,hlbincr28
		ld a,l
		cp c
		jp nz,hlbincr28
		dec hl

hlbincr28:		
								; HL contains current address in screen memory
		pop bc
		ld a,e
				
		ld e,255
		push bc
		
hlincr2:					; draw full bytes
		xor a
		or b
		jp z,hlincr3		; no more full bytes
		
		push hl		
		call hldrwcol
		pop hl
		
hlincr24:
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
		
hlincr41:
		rra
		
hlincr42:
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



