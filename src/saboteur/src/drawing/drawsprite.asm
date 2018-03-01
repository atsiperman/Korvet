
; ---- draws sprite on the screen
; args: hl - address on the screen
;		de - address of the sprite

drawspr:
		ex de,hl
		
		ld a,(hl)
		push hl
		ld hl,COLRREG
		ld (hl),a
		pop hl
		
		inc hl
		ld c,(hl)		; sprite width
		inc hl
		ld b,(hl)		; sprite height
		ex de,hl
		push bc		
		
drspr:
		inc de
		ld a,(de)
		ld (hl),a
		inc hl
		dec c
		jp nz,drspr
		
		dec b
		jp z,drspend
		
		ld a,b			; restore counter in C
		pop bc
		ld b,a
		push bc
		
		push de			; move to the next screen line
		ld a,64
		sub c
		ld d,0
		ld e,a
		add hl,de
		pop de
		
		jp drspr
		
drspend:
		pop bc			; clear stack
		ret
		