; ---- draws frame's sprite
; args: HL - memory address to write
;		DE - address of the sprite
drwfrm1:
		ld c,8		
drwfrm1c:		
		ld a,(de)
		ld (hl),a
		dec c
		ret z
		inc de
		push de
		ld de,64
		add hl,de
		pop de
		jp drwfrm1c

; ---- draws line of frame's sprite
; args: HL - memory address to write
;		DE - address of the sprite
;		B  - number of sprites
drwfrm2:
		push hl
		push de
		
		call drwfrm1
		
		pop de
		pop hl
		
		dec b
		ret z
		
		inc hl
		jp drwfrm2
		
; ---- draws column of frame's sprite
; args: HL - memory address to write
;		DE - address of the sprite
;		B  - number of sprites
drwfrm3:
		push de
		call drwfrm1		
		pop de		
		dec b
		ret z
		
		push de
		ld de,64
		add hl,de
		pop de
		jp drwfrm3
		

; ----- draws frame around working screen
drawfrm:		
		
		ld a,80h + (CRED << 1)
		ld hl,COLRREG
		ld (hl),a
		
		; left top
		ld hl,FRMADDR
		ld de,frmlttop
		call drwfrm1
				
		; right top
		ld hl,FRMADDR + FRMWIDT - 1
		ld de,frmrttop
		call drwfrm1
		
		; left bottom
		ld hl,FRMADDR + (FRMHIGT-1)*8*64
		ld de,frmltbtm
		call drwfrm1

		; right bottom
		ld hl,FRMADDR + (FRMHIGT-1)*8*64 + FRMWIDT - 1
		ld de,frmrtbtm
		call drwfrm1
	
		; top line
		ld b,FRMWIDT-2
		ld hl,FRMADDR + 1
		ld de,frmtop
		call drwfrm2
		
		; bottom line
		ld b,FRMWIDT-2
		ld hl,FRMADDR + (FRMHIGT-1)*8*64 + 1
		ld de,frmbotm
		call drwfrm2
		
		; left column
		ld b,FRMHIGT - 2
		ld hl,FRMADDR + 64*8
		ld de,frmleft
		call drwfrm3

		; right column
		ld b,FRMHIGT - 2
		ld hl,FRMADDR + FRMWIDT - 1 + 64*8 
		ld de,frmright
		call drwfrm3

		ret
