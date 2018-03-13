
	macro scrnhd
	; screen header
	endm

	macro mkcolor color
	DB (80h + (color << 1)) 	; color register
	endm 
	
	; background sprite header
	macro bksh color
		DB (80h + (color << 1)) 	; color register
		db 0						; background is a texture
	endm
	
	macro bksh2 color,btype
		DB (80h + (color << 1)) 	; color register
		db btype					; sprite type
	endm
		
	; header of a generic sprite
	macro sprhead color,wi,hi
		DB (80h + (color << 1)) 	; color register
		DB wi
		DB hi
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

	macro sbduckhd
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

		inc de				; sprite type
		ex de,hl
		ld a,(hl)				
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
	
	