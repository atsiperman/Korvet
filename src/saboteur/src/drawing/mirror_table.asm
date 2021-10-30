
; ; ; --------------------------
; ; ;
; ; ; table with bytes mirrored to their original values

; ; MIRTHADR	EQU $ >> 8		; hi byte of mirror table's address

; ; mirtable:
; ; 		db 0, 128, 64, 192, 32, 160, 96, 224, 16, 144, 80, 208, 48, 176, 112, 240
; ; 		db 8, 136, 72, 200, 40, 168, 104, 232, 24, 152, 88, 216, 56, 184, 120, 248
; ; 		db 4, 132, 68, 196, 36, 164, 100, 228, 20, 148, 84, 212, 52, 180, 116, 244
; ; 		db 12, 140, 76, 204, 44, 172, 108, 236, 28, 156, 92, 220, 60, 188, 124, 252
; ; 		db 2, 130, 66, 194, 34, 162, 98, 226, 18, 146, 82, 210, 50, 178, 114, 242
; ; 		db 10, 138, 74, 202, 42, 170, 106, 234, 26, 154, 90, 218, 58, 186, 122, 250
; ; 		db 6, 134, 70, 198, 38, 166, 102, 230, 22, 150, 86, 214, 54, 182, 118, 246
; ; 		db 14, 142, 78, 206, 46, 174, 110, 238, 30, 158, 94, 222, 62, 190, 126, 254
; ; 		db 1, 129, 65, 193, 33, 161, 97, 225, 17, 145, 81, 209, 49, 177, 113, 241
; ; 		db 9, 137, 73, 201, 41, 169, 105, 233, 25, 153, 89, 217, 57, 185, 121, 249
; ; 		db 5, 133, 69, 197, 37, 165, 101, 229, 21, 149, 85, 213, 53, 181, 117, 245
; ; 		db 13, 141, 77, 205, 45, 173, 109, 237, 29, 157, 93, 221, 61, 189, 125, 253
; ; 		db 3, 131, 67, 195, 35, 163, 99, 227, 19, 147, 83, 211, 51, 179, 115, 243
; ; 		db 11, 139, 75, 203, 43, 171, 107, 235, 27, 155, 91, 219, 59, 187, 123, 251
; ; 		db 7, 135, 71, 199, 39, 167, 103, 231, 23, 151, 87, 215, 55, 183, 119, 247
; ; 		db 15, 143, 79, 207, 47, 175, 111, 239, 31, 159, 95, 223, 63, 191, 127, 255

; ; msprbuf:
; ; 		dup 512
; ; 		db 0
; ; 		edup

; ; ;
; ; ; ----	mirrors sprite if direction is left
; ; ;		always makes copy of the sprite into buffer in order to get equal movement speed in both directions
; ; ;		returns original address of the sprite if this is right direction
; ; ;
; ; ; args: 
; ; ;		HL - address of the object's control block	
; ; ;		DE - sprite address
; ; ;
; ; ; result:
; ; ;		DE - address of a sprite to be drawn 
; ; ;			 original address for right direction 
; ; ;			 sprite buffer for left direction
; ; ;

; ; 		macro MIRSPCPY
; ; 		ld a,(hl)
; ; 		ld (de),a
; ; 		inc hl
; ; 		inc de		
; ; 		endm

; ; mirrspr:
; ; 		;push hl

; ; 		ex de,hl			; sprite address in HL
; ; 		ld de,msprbuf

; ; 		MIRSPCPY			; copy color
		
; ; 		MIRSPCPY			; copy height
; ; 		ld b,a				; save height in B
; ; 		MIRSPCPY			; copy width
; ; 		ld c,a				; save width in C

; ; 		push bc
; ; _mirrsp1:
; ; 		push bc
; ; 		ld b,MIRTHADR
; ; 		dup 16
; ; 			ld c,(hl)		; load sprite byte
; ; 			ld a,(bc)		; load mirrored byte
; ; 			ld (de),a		; save mirrored byte
; ; 			inc hl
; ; 			inc de
; ; 		edup
; ; 		pop bc
; ; 		dec c
; ; 		jp nz, _mirrsp1		; continue if width is not zero
		
; ; 		pop bc				; restore width in C
; ; 		dec b
; ; 		jp z,_mirrsp2
; ; 		push bc				; save decreased height counter
; ; 		jp _mirrsp1

; ; _mirrsp2:
; ; 		ld de,msprbuf
; ; 		ret



