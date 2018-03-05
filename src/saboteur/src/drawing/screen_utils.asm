
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
		
		ld bc,COLNUM
							; calculate Y 
spadrcr1:					
		add hl,bc
		dec e
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

fillscr:
        ld hl,COLRREG    ; color reg address
        ld (hl),a       ; switch to color mode

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

; -----  fills working screen with color mode in A
; args: A - color mode

clrwscr:
        ld hl,COLRREG    ; color reg address
        ld (hl),a       ; switch to color mode

		ld de,64 - COLNUM
        ld hl,SCRADDR
        ld bc,(ROWNUM*8 << 8) + COLNUM 	; B=ROWNUM*8 lines on screen
										; C=COLNUM sprites in line
		ld a,255
cwsloop:
        ld (hl),a
        inc hl
        dec c
        jp nz,cwsloop
		ld c,COLNUM
		add hl,de
		dec b
		jp nz,cwsloop
        ret

; ----- draws background for current screen
; args: DE - address of the screen model

drawbkgr:
        ld hl,SCRADDR
        ld bc,(ROWNUM << 8) + COLNUM  	; B=ROWNUM lines on screen
										; C=COLNUM sprites in line
startdrw:
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
		
        ld hl,COLRREG   ; set sprite color
        ld a,(de)
        ld (hl),a
		inc de
		inc de			; skip header
		
        pop hl          ; restore screen address
        ld c,8
sprloop:
        ld a,(de)
        ld (hl),a
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
        jp startdrw

nextline:
        pop af          ; clear stack from prev hl
        push bc
        ld bc,64-COLNUM+1
        add hl,bc
        pop bc
        ld c,COLNUM     ; next line of sprites
        dec b
        jp nz,startdrw

        ret

; ----- clears tile in video memory
; args: 
;		DE - address of the tile in video memory
clrtile:
		push hl
		push bc

		ld c,8

        ld hl,COLRREG    	; color reg address
        ld (hl),COLORCLR	; switch to color mode		
		ld a,255
		ex de,hl
		ld de,64
clrtil1:			
		ld (hl),a
		add hl,de
		dec c
		jp nz,clrtil1
		
		pop bc
		pop hl
		ret

; ----- redraws tile in the video memory
; args: 
;		HL - tile address in the map
;		DE - video memory address of the tile

redrtile:		
		push bc
		push de
		
		ld a,(hl)		; load sprite width
		ld b,a
		ld c,8
	
		inc hl			; load sprite address to DE
		ld e,(hl)
		inc hl
		ld d,(hl)
		ex de,hl		; HL - sprite tile address
		
		pop de			; restore video memory address
		
redrtil1:		
		ld a,(hl)
		
		push hl						; save sprite address
			
		ld hl,COLRREG				; set color to clear		
		ld (hl),COLORCLR
	
		ex de,hl					; HL - screen address	
		cpl		
		ld (hl),a					; clear byte
				
		ex de,hl					; HL - color reg
		
		ld (hl),CMAINREG			; set main color
		
		ex de,hl					; HL - screen address				
		cpl
		ld (hl),a					; move data byte
		
		ex de,hl					; DE - screen address				
		
		pop hl						; restore sprite address
				
		dec c
		jp z,redrtil_
		
		push bc
		
		ld c,b						; go to the next line in sprite
		ld b,0		
		add hl,bc
				
		ld c,64
		ex de,hl
		add hl,bc					; go to the next screen line in video memory
		ex de,hl
		
		pop bc
		jp redrtil1
		
redrtil_:		
		pop bc
		ret

; ----- draws tile map
;		
drawtlm:
		
		ld hl,tilemap
		ld bc,(ROWNUM << 8) + COLNUM
		ld de,SCRADDR
		
		push bc			; save counter from C
				
drwtlm1:		
		inc hl
		inc hl			; move to hi byte
		ld a,(hl)		; load tile 
		
		or a			; check is empty
		jp z,drwtlm3	; do nothing
						
		cp TILECLR		; check is marked to be cleared
		jp nz,drwtlm2	; no, go draw sprite tile
		
		push de
		call clrtile	; clear tile		
		pop de
		
		jp drwtlm3
		
drwtlm2:				; redraw tile
		push hl
		push de
		
		dec hl
		dec hl
		
		call redrtile
		pop de
		pop hl
				
drwtlm3:
		inc hl
		inc de
		dec c
		jp nz,drwtlm1

		dec b
		jp z,drwtlm_
				
		ex de,hl
		push bc
		ld bc,64*8 - COLNUM
		add hl,bc
		ex de,hl
		pop bc
		
		ld a,b			; restore counter in C
		pop bc
		ld b,a
		push bc
		
		jp drwtlm1
		
drwtlm_:
		pop bc			; clear stack
		ret
			