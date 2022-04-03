; ----- prints numerical string 
; args: DE - address in video memory to print at
;		HL - address of the numerical string
;       B  - foreground color
;       C  - background color
;
pntnum:
        ld  a,(hl)      ; load string length
        inc hl          ; move pointer to the first digit

.prnt1:  
        push af
        push hl
        push de
        call prndigt    ; print digit
        pop  de
        pop  hl
        pop  af
        dec  a
        ret  z
        inc  de         ; move pointer to the next column
        inc  hl         ; move pointer to the next digit
        jp .prnt1

; ----- prints numerical string 
; args: DE - address in video memory to print at
;		HL - address of the digit to print
;       B  - foreground color
;       C  - background color
prndigt:
        push de
        xor  a
        ld   d,a
        ld   a,(hl)     ; read digit code
        rla
        rla
        rla
        ld   e,a
        ld   hl,digits
        add  hl,de      ; move pointer to digit data
        pop  de         ; restore video memory address
        ex   de,hl      ; HL - screen address
                        ; DE - data address

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
        ret
