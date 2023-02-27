

; ----- calculates address of a tile with specified column and row in screen buffer
; args: D - column
;       E - row
; result: 	
;       HL - pointer to a byte with sprite attributes
;			
shscradr:
        ld a,e          ; load current row index
        add a,a		    ; make address displacement
        ld c,a		
        ld b,0          ; BC - displacement to row address in bytes
        
        ld a,d          ; save col index in A	

        ld hl,bufrows
        add hl,bc	    ; pointer to row address
        load_de_hl	    ; save row address in DE
                
        ld c,a		    ; save column in C

        rla				
        rla
        rla		        ; multipy by 8
        ld l,a		    ; save it in L

        xor a
        ld h,a		    ; zero to H
                        ; L = column index * 8                        
        ld b,a		    ; B - 0
                        ; C - column index
        
        add hl,bc	    ; add column index to get column offset in byte
        add hl,bc	    ; add column index to get column offset in byte
        add hl,bc	    ; add column index to get column offset in byte
        add hl,bc	    ; add column index to get column offset in byte

        add hl,de	    ; column address in HL

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
		
; -----  fills screen with black
;
clrscrn:
        ld a,CBLACK + 128   ; set BLACK in color mode
        ld (COLRREG),a       ; switch color mode
        ld d,0
        jp fillvram.fillvr
        
; -----  fills screen with color mode in A
; args: A - color mode

fillvram:
        ;ld hl,COLRREG    ; color reg address
        ld (COLRREG),a       ; switch color mode
        ld d,255

.fillvr:
        ld hl,GRAM
        ld bc,GRAMLEN

.fsloop:
        ld (hl),d
        inc hl
        dec bc
        ld a,b
        or c
        jp nz,.fsloop
        ret

; ----- draws background for current screen
; args: DE - address of the shadow screen model
; 
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
;	    C  - number of sprites to draw starting from the current one 
; result:
;	    HL - address of the last byte written in video memory
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

        ld a,(hl)       ; load tile attributes

        and stotile     ; is static object ?
        jp  z,_drwbkt2   ; no, keep drawing

        inc hl                  ; move to data byte
        skip_buf_tile_data hl   ; skip data in screen buffer
        ex de,hl                ; pointer to screen buffer in DE
        pop hl          ; restore registers
        pop bc
        dec c
        jp z,nextline   ; move to the next line of sprites
        pop hl          ; top of the next column on screen
        inc hl
        jp drawbkt1     ; skip static object tile

_drwbkt2:
        inc hl                  ; skip attributes
        skip_buf_tile_data hl   ; skip data in screen buffer

        ld b,h
        ld c,l          ; save address in screen buffer in BC

        pop hl          ; restore screen address		
        push bc         ; save address in screen buffer

        ld a,(de)	; read back color
        ld c,a      ; save back color in C
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
                cpl         ; get bits to be drawn as background
                ld (hl),a	; move data byte

                pop de		; restore data address                        
                inc de      ; next byte from sprite
                
                ld bc,64    ; add 64
                add hl,bc   ; move to the next line on screen
                
                pop bc      ; restore fg color
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
		

; ----- marks tiles, occupied by static objects
;
; args: BC - address of the static object
;       DE - X,Y
;			
        macro SETSTO
          ld a,(hl)
          or stotile + fgtile
          ld (hl),a
          skip_buf_tile hl
        endm

stotiles:
        push bc
        call shscradr           ; HL - pointer to attributes in the screen buffer
        pop bc
        ld a,(bc)               ; load object width
        ld e,a
        inc bc                  ; move to height
        ld a,(bc)               ; height in bytes in D
        rra
        rra
        rra                     ; divide by 8
        ld d,a
        ld a,e                  ; load object width
        cp 1
        jp z, .sttil11
        cp 2
        jp z, _sttil21
        cp 4
        jp z, _sttil41
        ld bc,ROWWIDB - (COLWIDB * 3)
.sttil3:
        dup 3        
          SETSTO
        edup
        dec d
        ret z
        add hl,bc
        jp .sttil3

.sttil11:
        ld bc,ROWWIDB - COLWIDB
.sttil1:
        SETSTO
        dec d
        ret z
        add hl,bc
        jp .sttil1

_sttil21:        
        ld bc,ROWWIDB - (COLWIDB * 2)
_sttil2:
        dup 2     
          SETSTO
        edup
        dec d
        ret z
        add hl,bc
        jp _sttil2
        
_sttil41:
        ld bc,ROWWIDB - (COLWIDB * 4)
_sttil4:        
        dup 4          
          SETSTO
        edup
        dec d
        ret z
        add hl,bc
        jp _sttil4

; ----- draws static object in video memory
; args: BC - address of the static object
;       DE - address in video memory
;			
drawsto:
        ld a,(bc)               ; load width
        cp 1
        jp z,.drwsto1
        cp 2
        jp z,.drwsto2
        cp 4
        jp z,.drwsto4          ; draw 4x4 object

.drwsto3:
        ld a,0C3h               ; C3 - JP <address> code
        ld hl,.drws41           
        ld (hl),a
        inc hl
        ld (hl),LOW .drws31
        inc hl
        ld (hl),HIGH .drws31

        ld hl,.drws42
        ld (hl),a
        inc hl
        ld (hl),LOW .drws32
        inc hl
        ld (hl),HIGH .drws32

        jp .drwstos

.drwsto1:
        ld a,0C3h               ; C3 - JP <address> code
        ld hl,.drws41           
        ld (hl),a
        inc hl
        ld (hl),LOW .drws11
        inc hl
        ld (hl),HIGH .drws11

        ld hl,.drws42
        ld (hl),a
        inc hl
        ld (hl),LOW .drws12
        inc hl
        ld (hl),HIGH .drws12

        jp .drwstos

.drwsto2:
        ld a,0C3h               ; C3 - JP <address> code
        ld hl,.drws41           
        ld (hl),a
        inc hl
        ld (hl),LOW .drws21
        inc hl
        ld (hl),HIGH .drws21

        ld hl,.drws42
        ld (hl),a
        inc hl
        ld (hl),LOW .drws22
        inc hl
        ld (hl),HIGH .drws22

        jp .drwstos

.drwsto4:
        xor a                   ; 00 - NOP
        ld hl,.drws41           ; overwrite jump instructions
        dup 3
          ld (hl),a
          inc hl
        edup
        ld hl,.drws42
        dup 3
          ld (hl),a
          inc hl
        edup

.drwstos:
        inc bc          ; move to height
        ld a,(bc)       ; load object height
        ld l,a          ; save in L
        push hl         ; save height counter

        inc bc          ; move to data bytes

.drwso31:
        ld  hl,COLRREG	; set color register
        ld  a,(bc)      ; load foreground color         
        rla     
        add 80h         ; make color mask
        ld  (hl),a	    ; set main color
        inc bc          ; move to data byte
        
.drws41:
        nop             ; jump or nop
        nop             ; jump or nop
        nop             ; jump or nop                

        ld   a,(bc)     ; load image byte
        ld   (de),a     ; write to video ram
        inc  de         ; move to next column in video memory
        inc  bc         ; move to next byte in object data

.drws31:        
        ld   a,(bc)     ; load image byte
        ld   (de),a     ; write to video ram
        inc  de         ; move to next column in video memory
        inc  bc         ; move to next byte in object data

.drws21:        
        ld   a,(bc)     ; load image byte
        ld   (de),a     ; write to video ram
        inc  de         ; move to next column in video memory
        inc  bc         ; move to next byte in object data

.drws11:
        ld   a,(bc)     ; load image byte
        ld   (de),a     ; write to video ram

                        ; switch to backgound color
        inc  bc         ; move to background color
        ld   a,(bc)     ; load background color
        rla     
        add  80h        ; make color mask
        ld   (hl),a     ; set background color

        push bc         ; save last byte of the current line
        dec  bc         ; move to background data byte

                        ; start moving back and draw background

.drws42:
        nop             ; jump or nop
        nop             ; jump or nop
        nop             ; jump or nop                

        ld   a,(bc)     ; load image byte
        cpl         
        ld   (de),a     ; write to video ram
        dec  de         ; move to next column in video memory
        dec  bc         ; move to next byte in object data

.drws32:        
        ld   a,(bc)     ; load image byte
        cpl         
        ld   (de),a     ; write to video ram
        dec  de         ; move to next column in video memory
        dec  bc         ; move to next byte in object data

.drws22:        
        ld   a,(bc)     ; load image byte
        cpl         
        ld   (de),a     ; write to video ram
        dec  de         ; move to next column in video memory
        dec  bc         ; move to next byte in object data

.drws12:        
        ld   a,(bc)     ; load image byte
        cpl         
        ld   (de),a     ; write to video ram

.drwso2:
        push hl         ; save color reg
        ld   hl,64      ; load displacement to the video line in the last column
        add  hl,de
        ex   de,hl      ; save new address of video cell in DE
        pop  hl
        pop  bc         ; restore address of the last byte in current line
        inc  bc

        pop hl          ; restore height counter
        dec l
        ret z
        push hl         ; save decreased counter 
        jp .drwso31     ; continue loop


; ----- clears text ram for current screen
;
clrtxscr:
        ld hl,(otramdef)
        ld a,h
        or l
        ret z			    ; address is zero, nothing to draw
        
        ld a,0AFh           ; xor a
        ld (_drtrm2_),a
        ld (_drtrm3_),a
        jp _drtrams

; ----- draws text ram for current screen
;
drawtram:       
        ld hl,(tramdef)
        ld a,h
        or l
        ret z				    ; address is zero, nothing to draw

; ----- draws text ram in coded form
;args: HL - address of text ram definition
;
drwtram:
        ld a,7eh                ; ld a,(hl)
        ld (_drtrm2_),a
        ld (_drtrm3_),a

_drtrams:                
;        GRMODOFF

_drtram1:
        ld a,(hl)
        inc hl
        ld c,a                  ; save in C
        cp SCREND
        jp z,_drtrame           ; end of data

        and 0F0h                ; leave hi half
        cp TXLINEV << 4
        jp z,_drtram3           ; process vertical line

        ld a,c                  ; reload data byte
        and 0Fh			        ; leave counter
        ld c,a
        load_de_hl              ; load text RAM address

_drtrm2_:
        ld a,(hl)		        ; load byte
        inc hl

_drtram2:
        ld (de),a               ; set character
        inc de                  ; move to the next column
        dec c
        jp nz, _drtram2
        jp _drtram1

_drtram3:
        ld a,c                  ; reload data byte
        and 0Fh			        ; leave counter
        ld c,a
        load_de_hl              ; load text RAM address
_drtrm3_:
        ld a,(hl)		        ; load byte
        inc hl
        push hl

_drtram4:
        ld (de),a               ; set character
        push bc
        ld bc,64
        ex de,hl
        add hl,bc               ; move to the next line in text ram
        ex de,hl
        pop bc
        dec c
        jp nz, _drtram4
        pop hl
        jp _drtram1

_drtrame:
;        GRMODON
        ret
