; ----- prints text string 
; args: DE - address in video memory to print at
;		HL - address of the text string
;       B  - foreground color
;       C  - background color
;
prntstr:
        ld  a,(hl)      ; load string length
        inc hl          ; move pointer to the first digit

.prnts1:
        push af
        push hl
        push de
        call prnchar    ; print char
        pop  de
        pop  hl
        pop  af
        dec  a
        ret  z
        inc  de         ; move pointer to the next column
        inc  hl         ; move pointer to the next digit
        jp .prnts1

; ----- prints numerical string 
; args: DE - address in video memory to print at
;       HL - address of the numerical string
;       B  - foreground color
;       C  - background color
;
prntnum:
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

; ----- prints character
; args: DE - address in video memory to print at
;		HL - address of the char to print
;       B  - foreground color
;       C  - background color
prnchar:
        push de
        xor  a
        ld   d,a
        ld   a,(hl)     ; read symbol's code
        sub  'A'        ; get index of the char in data array 

        rla
        rla
        rla             
        ld  e,a         ; save low byte
        ld  a,d         ; load hi byte
        rla             ; shift hi byte with CY
        ld  d,a         ; save hi byte

        ld   hl,chars
        jp   prnsymb

; ----- prints numerical string 
; args: DE - address in video memory to print at
;		HL - address of the digit to print
;       B  - foreground color
;       C  - background color
prndigt:
        push de
        xor  a
        ld   d,a
        ld   a,(hl)     ; read symbol's code
        rla
        rla
        rla
        ld   e,a
        ld   hl,digits
        jp   prnsymb

prnsymb:
        add  hl,de      ; move pointer to digit data
        pop  de         ; restore video memory address
        ex   de,hl      ; HL - screen address
                        ; DE - data address
        ld   a,8
        ;;dup 8
.prn1:        
        push af
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
        ;;edup
        pop  af
        dec  a
        jp   nz,.prn1
        ret
