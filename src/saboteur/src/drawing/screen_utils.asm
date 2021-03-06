
; --- checks type of a sprite
; args:		A - sprite type
; result:	A - 0 if not a floor type (something to walk on)
;
isfloor:
		and bwall + bladder
		ret 

; 
; ----- calculates address in memory of specified column and row of shadow screen
;	args: 	D - column
;			E - row
; result: 	HL - address 
;			
shscradr:
		ld hl,shadscr
		
		ld b,0
		ld c,d
		add hl,bc			; X position
		
		ld c,COLNUM
		ld a,e
							; calculate Y 
		or a
		ret z

spadrcr1:				
		add hl,bc
		dec a
		jp nz,spadrcr1
		
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
        ld hl,SCRADDR
        ld bc,(ROWNUM << 8) + COLNUM  	; B=ROWNUM lines on screen
										; C=COLNUM sprites in line
startdrw:
		call drawbktl

        push bc
        ld bc,64-COLNUM+1
        add hl,bc
        pop bc
        ld c,COLNUM     ; next line of sprites
        dec b
        jp nz,startdrw

        ret


		
; ----- draws background tile in video memory
; args: DE - address of the tile in shadow screen model
;       HL - address in video memory
;		C  - number of sprites to draw starting from the current one 
; result:
;		HL - address of the last byte written in video memory
;		
drawbktl:

drawbkt1:
        push hl         ; out address
        push de         ; sprite pointer
        push bc         ; screen lines counter

        ex de,hl
        ld b,0
        ld c,(hl)
        ld hl,BKSPRTAB
        add hl,bc
        add hl,bc       ; pointer to sprite's address
        push de         ; save screen address
        ld e,(hl)
        inc hl
        ld d,(hl)
		
		ld a,(de)		; read back color
		ld (_bkcolr),a	; save it 		
		inc de
		
        ld a,(de)		; read foreground color
        ld b,a			
		inc de
		inc de			; skip header
		
        pop hl          ; restore screen address		
        ld c,8
sprloop:
        ld a,(de)		; load data byte	
		
		push de			; save data address
		
		ex de,hl		; DE - screen address		
		
		push bc			; save foreground color and counter
		
		ld hl,COLRREG	; set color regiter		
		ld (hl),b		; set main color
		ex de,hl		; HL - screen address
		ld (hl),255		; set main color by default
		
		ex de,hl		; DE - screen address				
		ld hl,_bkcolr
		ld b,(hl)		; get background color
		ld hl,COLRREG	; set color register`
		ld (hl),b		; set background color
		
		ex de,hl		; HL - screen address
		cpl				; get bits to be drawn as background
		ld (hl),a		; move data byte
		pop bc
						
		pop de			; restore data address
		
        inc de          ; next byte from sprite
        dec c           ; sprite counter
        jp z,sprend
        push de
        ld de,64        ; add 64
        add hl,de       ; move to the next line on screen
        pop de
        jp sprloop

sprend: pop bc          ; sprite finished
        pop de
        inc de          ; move to the next sprite
        dec c
        jp z,nextline   ; move to the next line of sprites
        pop hl          ; top of the next column on screen
        inc hl
        jp drawbkt1

nextline:
        pop af          ; clear stack from prev hl
		ret	
		
	
				