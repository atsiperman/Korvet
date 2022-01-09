
; --------------------------
;
; table with bytes mirrored to their original values

MIRTHADR	EQU $ >> 8		; hi byte of mirror table's address

        align 256

        assert (LOW $) == 0, Invalid start address for mirror table!!!
        
mirtable:
		db 0, 128, 64, 192, 32, 160, 96, 224, 16, 144, 80, 208, 48, 176, 112, 240
		db 8, 136, 72, 200, 40, 168, 104, 232, 24, 152, 88, 216, 56, 184, 120, 248
		db 4, 132, 68, 196, 36, 164, 100, 228, 20, 148, 84, 212, 52, 180, 116, 244
		db 12, 140, 76, 204, 44, 172, 108, 236, 28, 156, 92, 220, 60, 188, 124, 252
		db 2, 130, 66, 194, 34, 162, 98, 226, 18, 146, 82, 210, 50, 178, 114, 242
		db 10, 138, 74, 202, 42, 170, 106, 234, 26, 154, 90, 218, 58, 186, 122, 250
		db 6, 134, 70, 198, 38, 166, 102, 230, 22, 150, 86, 214, 54, 182, 118, 246
		db 14, 142, 78, 206, 46, 174, 110, 238, 30, 158, 94, 222, 62, 190, 126, 254
		db 1, 129, 65, 193, 33, 161, 97, 225, 17, 145, 81, 209, 49, 177, 113, 241
		db 9, 137, 73, 201, 41, 169, 105, 233, 25, 153, 89, 217, 57, 185, 121, 249
		db 5, 133, 69, 197, 37, 165, 101, 229, 21, 149, 85, 213, 53, 181, 117, 245
		db 13, 141, 77, 205, 45, 173, 109, 237, 29, 157, 93, 221, 61, 189, 125, 253
		db 3, 131, 67, 195, 35, 163, 99, 227, 19, 147, 83, 211, 51, 179, 115, 243
		db 11, 139, 75, 203, 43, 171, 107, 235, 27, 155, 91, 219, 59, 187, 123, 251
		db 7, 135, 71, 199, 39, 167, 103, 231, 23, 151, 87, 215, 55, 183, 119, 247
		db 15, 143, 79, 207, 47, 175, 111, 239, 31, 159, 95, 223, 63, 191, 127, 255

		macro MIRSPCPY
            ld a,(hl)
            ld (de),a
            inc hl
            inc de		
		endm

;
; ----	mirrors sprite 
;
; args: 
;		HL - source sprite address
;		DE - destination buffer 
;
msprtwi: db 0
msprtwb: db 0

mirrspr:
		MIRSPCPY			; copy color		
		MIRSPCPY			; copy height
		ld b,a				; save height in B
		MIRSPCPY			; copy width
		ld c,a				; save width in C
        ld  (msprtwi),a     ; save sprite width

        push bc             ; save counters

        rla
        rla
        rla                 
        rla                 ; width in bytes (8 mask + 8 data)
        ld  (msprtwb),a     ; save sprite width in bytes

        ld  b,0
        ld  c,a
        ex  de,hl           ; destination address in HL
        add hl,bc           
        ex  de,hl           ; start address of the last tile in DE
        
        pop bc              ; restore counters

.mirsp1:
        dup 16                  ; move pointer to the start address of the tile
            dec de              
        edup
        push de                 ; save start tile address

        push bc                 ; save counters

        ld  b, HIGH mirtable

        dup 16                  ; 8 + 8 = mask + data
            ld  c,(hl)          ; load data byte
            ld  a,(bc)          ; load mirrored byte
            ld  (de),a          ; save mirrored byte in destination buffer        
            inc hl
            inc de
        edup

        pop bc
        dec c
        jp  z,.mirsp2

        pop de                  ; restore last tile start address
                                ; move to the previous tile
        jp  .mirsp1

.mirsp2:
        dec b
        jp  z,.mirend

        pop de                  ; restore last tile start address
        push bc                 ; save counters

        ld  b,0
        ld  a,(msprtwb)
        ld  c,a
        ex  de,hl
        add hl,bc               ; move to the end of the current line in destination buffer
        add hl,bc               ; move to the end of the next line in destination buffer
        ex  de,hl

        pop bc

        ld  a,(msprtwi)         ; save current line counter
        ld  c,a                 ; restore line width
        jp .mirsp1

.mirend:
        pop de
        ret




