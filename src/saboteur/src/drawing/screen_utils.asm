

; ----- calculates address of a tile with specified column and row in screen buffer
; args: 	D - column
;		E - row
; result: 	
;               HL - pointer to a byte with sprite attributes
;			
shscradr:
        ld a,e          ; load current row index
        add a,a		; make address displacement
        ld c,a		
        ld b,0          ; BC - displacement to row address in bytes
        
        ld a,d          ; save col index in A	

        ld hl,bufrows
        add hl,bc	; pointer to row address
        load_de_hl	; save row address in DE
                
        ld c,a		; save column in C

        rla				
        rla
        rla		; multipy by 8
        ld l,a		; save it in L

        xor a
        ld h,a		; zero to H
                        ; L = column index * 8                        
        ld b,a		; B - 0
                        ; C - column index
        
        add hl,bc	; add column index to get column offset in byte
        add hl,bc	; add column index to get column offset in byte
        add hl,bc	; add column index to get column offset in byte
        add hl,bc	; add column index to get column offset in byte

        add hl,de	; column address in HL

        inc hl                          
        inc hl          ; skip sprite address
        inc hl          ; skip tile state
        ret

; -----  clear text screen
;
clrtscr:
        ld hl,0fc00h
        ld bc,1024
        ld d,0

ctslop: ld (hl),d
        inc hl
        dec bc
        ld a,b
        or c
        jp nz, ctslop
        ret

; -----  switches to graphics mode
;
        macro   GRMODON 

        ld hl,TSYSREG
        ld a,GCONFIG
        ;di
        ld (hl),a

        endm

; -----  switches back to CP/M
;
        macro   GRMODOFF 

        ld hl,GSYSREG
        ld a,1ch
        ld (hl),a
        ;ei

        endm

; ----- setup LUT
;
lutsetup:
        ld c,16
        ld de,LUTREG
        ld hl,LUTVAL
		
lutset2:
        ld a,(hl)
        ld (de),a
        inc hl
        dec c
        jp nz,lutset2
        ret
		

; -----  fills screen with color mode in A
; args: A - color mode

fillvram:
        ld hl,COLRREG    ; color reg address
        ld (hl),a       ; switch color mode

        ld hl,GRAM
        ld bc,GRAMLEN
        ld d,255
fsloop:
        ld (hl),d
        inc hl
        dec bc
        ld a,b
        or c
        jp nz,fsloop
        ret

; ----- draws background for current screen
; args: DE - address of the shadow screen model

_bkcolr:
		db 0

drawbkgr:
        ld de,scrbuf
        ld hl,SCRADDR
        ld bc,(ROWNUM << 8) + COLNUM  	; B=ROWNUM lines on screen
					; C=COLNUM sprites in line
startdrw:
        call drawbktl

        push bc
        ld bc, (64 * 8) + 1 - COLNUM
        add hl,bc
        pop bc
        ld c,COLNUM     ; next line of sprites
        dec b
        jp nz,startdrw

        ret


		
; ----- draws background tile in video memory
; args: DE - address of the tile in screen buffer
;       HL - address in video memory
;		C  - number of sprites to draw starting from the current one 
; result:
;		HL - address of the last byte written in video memory
;		
drawbktl:

drawbkt1:
        push hl         ; save video memory address for the first line of the current column
        push bc         ; screen lines counter

        push hl         ; save video memory address
        ex de,hl        ; pointer to screen buffer in HL

        ld e,(hl)       ; load sprite address
        inc hl
        ld d,(hl)       ; to DE
        inc hl
        inc hl          ; skip tile state
        inc hl                  ; skip attributes
        skip_buf_tile_data hl   ; skip data in screen buffer

        ld b,h
        ld c,l          ; save address in screen buffer in BC

        pop hl          ; restore screen address		
        push bc         ; save address in screen buffer

        ld a,(de)	; read back color
        ld c,a          ; save back color in C
        inc de
	        
        ld a,(de)	; read foreground color
        ld b,a		; save fg color in B
        inc de
        inc de		; skip header

        dup 8
                push bc		; save fg color

                ld a,(de)	; load data byte			
                push de		; save data address
                
                ex de,hl	; DE - screen address		
                                
                ld hl,COLRREG	; set color register		
                ld (hl),b	; set main color
                ex de,hl	; HL - screen address
                ld (hl),255	; set main color by default
                
                ex de,hl	; DE - screen address				
                ld (hl),c	; set background color
                
                ex de,hl	; HL - screen address
                cpl		; get bits to be drawn as background
                ld (hl),a	; move data byte

                pop de		; restore data address                        
                inc de          ; next byte from sprite
                
                ld bc,64        ; add 64
                add hl,bc       ; move to the next line on screen
                
                pop bc          ; restore fg color
        edup

        pop de
        pop bc        
        dec c
        jp z,nextline   ; move to the next line of sprites
        pop hl          ; top of the next column on screen
        inc hl
        jp drawbkt1

nextline:
        pop hl          ; restore address of the last column
	ret	
		
	
				