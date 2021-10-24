
DEFBLCK EQU ((7 & ~CMAIN) << 1) + 1

	macro scrnhd
	; screen header
	endm

	macro mkcolor color
	db (80h + (color << 1)) 	; color register in LAYER mode
	endm 
	
	; background sprite header
	macro bksh color
		;db 80h + (CBLACK << 1)		; black color for background by default
		db DEFBLCK					; black color for background by default (in plain mode)
		db 80h + (color << 1)		; color register
		db 0						; background is a texture
	endm

	macro bksh_b bkcolor, color
		db (80h + (bkcolor << 1))	; background color 
		db (80h + (color << 1)) 	; color register
		db 0						; background is a texture
	endm
	
	macro bksh2 color,btype
		db DEFBLCK					; black color for background by default (in plain mode)
		db (80h + (color << 1)) 	; color register
		db btype					; sprite type
	endm

	macro bksh3 bkcolor,color,btype
		db (80h + (bkcolor << 1))	; background color 
		db (80h + (color << 1)) 	; color register
		db btype					; sprite type
	endm
	
	; header of a generic sprite
	macro sprhead color,wi,hi
		db (80h + (color << 1)) 	; color register
		db wi
		db hi
	endm
	
	; ---- header of moving sprites
	;
	; all moving sprites are working in plain mode
	;
	macro sabsphd 			; header for saboteur when staying
		db CMAINREG			; color register for moving sprites
		db 4, 48
	endm

	macro sbspmvhd			; header for saboteur when moving
		db CMAINREG			
		db 4, 40
	endm
	
	macro sbspldhd			; header for saboteur on the ladder
		db CMAINREG			
		db 2, 56
	endm
	
	macro sbsqthd			; header for saboteur when squatting
		db CMAINREG			
		db 3, 32
	endm

	macro objhead
		db CMAINREG			; color register for moving sprites
	endm
	
	macro load_de_hl
		ld e,(hl)
		inc hl
		ld d,(hl)
		inc hl
	endm
	
	macro savem_hl_de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
	endm

	macro load_bc_hl
		ld c,(hl)
		inc hl
		ld b,(hl)
		inc bc
	endm

	macro savem_hl_bc
		ld (hl),c
		inc hl
		ld (hl),b
		inc hl
	endm
		
	macro setcolor color	
		ld a,80h + (color<< 1)
		ld hl,COLRREG
		ld (hl),a
	endm
	
	macro ldsprt
		ld d,0
		ld e,(hl)			; sprite index
		ld hl,BKSPRTAB
		add hl,de
		add hl,de			; address of the current sprite
		load_de_hl			; in DE

		inc de				; skip back color
		inc de				; skip color 
		ld a,(de)			; sprite type
	endm
;	
;	macro ldscrst			; loads start of the screen into HL
;		ld hl,(curscr)		; pointer to screen control block
;		load_de_hl			; load address of the current screen
;		ex de,hl

;		ld d,0
;		ld e,(hl)			; length of local sprite map		
;		inc hl
;		add hl,de
;	endm
	
; ---- calculates height in rows of the current sprite
;
; result:
;			A - height in rows
;
	macro sbcurrh
		sblcursp
		inc de		; skip color
		ld a,(de)	; load height 
	endm


; ---- loads sprite height in tiles
; args: 
; 		DE - sprite address
;
; result:
;		A - result
;
	macro ldsprht
		inc de		; skip color
		ld a,(de)	; read height
	endm

	