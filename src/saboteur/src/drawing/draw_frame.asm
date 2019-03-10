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
	
; ---- draws static text 	
drfrmtxt:		
		ld hl,FRMADDR + (FRMHIGT-2)*8*64 + 22
		ld de,strtime
		call drawspr
		
		ld hl,FRMADDR + ((FRMHIGT-3)*8 - 1)*64 + 27
		ld de,nthnear
		call drawspr				

		ld hl,FRMADDR + ((FRMHIGT-3)*8 - 1)*64 + 1
		ld de,nthnheld
		call drawspr
		ret

; ----- draws frame around working screen
drawfrm:		
		call drfrmtxt
		
		setcolor CRED
		
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

		; middle line
		ld b,FRMWIDT-2
		ld hl,FRMADDR + (FRMHIGT-6)*8*64 + 1
		ld de,frmbotm
		call drwfrm2

		; health bar delimiter
		ld b,15
		ld hl,FRMADDR + (FRMHIGT-4)*8*64 + 6
		ld de,frmbotm
		call drwfrm2

		; left column
		ld b,FRMHIGT - 2
		ld hl,FRMADDR + 64*8
		ld de,frmleft
		call drwfrm3

		; second column
		ld b,6
		ld hl,FRMADDR + (FRMHIGT-6)*8*64 + 5
		ld de,frmleft
		call drwfrm3

		; 3-rd column
		ld b,6
		ld hl,FRMADDR + (FRMHIGT-6)*8*64 + 21
		ld de,frmleft
		call drwfrm3

		; 4-th column
		ld b,6
		ld hl,FRMADDR + (FRMHIGT-6)*8*64 + 26
		ld de,frmleft
		call drwfrm3

		; right column
		ld b,FRMHIGT - 2
		ld hl,FRMADDR + FRMWIDT - 1 + 64*8 
		ld de,frmright
		call drwfrm3

		ret


; ----
; ----	draws part of the frame's color which is in the text RAM
;
; drawfrmt:		
		; ld hl,TVIREG
		; ld (hl),ATRSET			; turn on inversion
		
		; ld hl,FRMADRT
		; ld b,FRMHIGT/2
		
		; ld de,64
		
		; ld a,0		
								; ; left frame column
		; call drfrmtv

								; ; top frame row
		; ld hl,FRMADRT + 1
		; ld b,COLNUM
		; call drfrmth
		
								; ; right frame column
		; ld hl,FRMADRT + COLNUM + 1
		; ld b,FRMHIGT/2
		; call drfrmtv

								; ; first bottom frame column 
		; ld hl,FRMADRT + (FRMHIGT/2 - 3) * 64 + 5
		; ld b,3
		; call drfrmtv			
		
								; ; second bottom frame column 
		; ld hl,FRMADRT + (FRMHIGT/2 - 3) * 64 + 21
		; ld b,3
		; call drfrmtv
		
								; ; ; third bottom frame column 
		; ld hl,FRMADRT + (FRMHIGT/2 - 3) * 64 + 26
		; ld b,3
		; call drfrmtv
		
								; ; health bar 
		; ld hl,FRMADRT + (FRMHIGT/2 - 2) * 64 + 6
		; ld b,COLNUM
		; call drfrmth
		; ld hl,FRMADRT + (FRMHIGT/2 - 1) * 64 + 6
		; ld b,COLNUM
		; call drfrmth
		

								; ; middle frame row 
		; ld hl,FRMADRT + (FRMHIGT/2 - 3) * 64 + 1
		; ld b,COLNUM
		; call drfrmth
		
								; ; bottom frame row 
		; ld hl,FRMADRT + (FRMHIGT/2 - 1) * 64 + 1
		; ld b,COLNUM
		; call drfrmth
		
		; ld hl,TVIREG
		; ld (hl),ATRRES			; turn off inversion
		; ret 
		
; ; ----- draws vertical part of the frame
; ;			
; drfrmtv:
		; ld (hl),a
		; add hl,de
		; dec b
		; jp nz,drfrmtv
		; ret
		
; ; ----- draws horizontal part of the frame
; ;			
; drfrmth:
		; ld (hl),a
		; inc hl
		; dec b
		; jp nz,drfrmth
		; ret
		