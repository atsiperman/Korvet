; ---- check whether the guard is ready for action
; args: HL - address of control block
;       D  - distance to saboteur
; result:
;       A  - 0 - not ready
;       DE - address of action procedure
;
gdrdyact:
        ld   a,d

        cp   PNCHDST                    ; close enough to punch ?
        jp   nc,.gd1                    ; not yet
        ld   de,gdstpnch                ; yes, do punch
        ld   a,d
        ret
.gd1:
        cp   KICKDST                    ; close enough to kick ?
        jp   nc,.gd2                    ; not yet
        ld   de,gdstkick                ; yes, do kick
        ld   a,d
        ret

.gd2:
        cp   THRWDST                    ; close enough to throw weapon ?
        jp   c,.gd3                     ; yes, try throw
        xor  a                          ; otherwise do nothing
        ret

.gd3:        
        ld   a,(gfthrwn)                ; is object thrown ?
        or   a        
        jp   nz,.gd4                    ; yes, skip throwing
        ld   de,gdtrythr                ; yes, do trhow
        ld   a,d
        ret

.gd4:
        xor  a
        ret


; ---- start guard action
; args: HL - address of control block
;       D  - distance to saboteur
gdstact:
        push hl
        call gdrdyact
        pop  hl
        or   a                          ; ready for action ?
        jp   z,.gd1                     ; no, start movement
        push de                         ; save action procedure address
        ret                             ; return to action procedure - start it

.gd1:
        call gdstmov                    ; start move otherwise 
        ret

; ---- guard starts punch action
; args: HL - address of control block
;       
gdstpnch:
        push hl
        scurst sbpunch         
        pop  hl

        push hl
        xor  a
        scurspi 
        pop  hl

        push hl
        lddir
        pop  hl
        cp   dirlt
        jp   z,.dopnchl
        ld   de,sabpnchr
        push hl
        scurspr
        pop  hl
        ld   de,gdhpnchr
        shdspr

        ld   hl,gdpnchrb
        ld   (gsprtab),hl
        ret

.dopnchl:
        ld   de,sabpnchl
        push hl
        scurspr
        pop  hl
        ld   de,gdhpnchl
        shdspr
        ld   hl,gdpnchlb
        ld   (gsprtab),hl
        ret


; ---- guard starts kick action
; args: HL - address of control block
;       
gdstkick:
        push hl
        scurst sbkick         
        pop  hl
        push hl
        lddir
        pop  hl
        push hl
        cp   dirlt
        jp   z,.do1
        ld   de,sabkckr1        
        scurspr
        pop  hl
        push hl
        ld   de,gdhdkk1r
        shdspr        
        ld   hl,gdkckrb
        ld   (gsprtab),hl
        jp   .do2
.do1:
        ld   de,sabkckl1
        scurspr
        pop  hl
        push hl
        ld   de,gdhdkk1l
        shdspr        

        ld   hl,gdkcklb
        ld   (gsprtab),hl

        pop  hl
        push hl
        ldcursc
        inc  a                          ; increase column if kick in the left direction
        ld   (hl),a        

.do2:        
        pop  hl
        push hl
        xor  a
        scurspi

        pop  hl        
        ldcursr         ; load current screen row into A
        dec  a          ; decrease row
        ld   (hl),a     
        ret

; ---- change column if guard is kicking
; args: HL - address of control block
;       
gdchkck:
        push hl
        lddir   
        pop  hl
        cp   dirlt
        jp   z,.gdcl1

        push hl
        ldcurspi
        pop  hl
        cp   2
        jp   nz,.gdcr2
        push hl
        ld   de,gdhdkk2r
        shdspr        
        pop  hl        
        ldcursc         ; starts kick, decrease column for left direction
        dec  a
        ld   (hl),a
        ret

.gdcr2:
        cp  ((gdkckre - gdkckrb - 1) / 2) - 2
        ret nz
        push hl
        ld   de,gdhdkk1r
        shdspr        
        pop  hl        
        ldcursc         ; ends kick, increase column for left direction
        inc  a
        ld   (hl),a
        ret

.gdcl1:
        push hl
        ldcurspi
        pop  hl
        cp   2
        jp   nz,.gdcl2        
        push hl
        ld   de,gdhdkk2l
        shdspr        
        pop  hl        
        ldcursc         ; starts kick, decrease column for left direction
        dec  a
        dec  a
        ld   (hl),a
        ret

.gdcl2:
        cp  ((gdkckre - gdkckrb - 1) / 2) - 2
        ret nz
        push hl
        ld   de,gdhdkk1l
        shdspr        
        pop  hl        
        ldcursc         ; ends kick, increase column for left direction
        inc  a
        inc  a
        ld   (hl),a
        ret        


; ---- try to throw guard's weapon
; args: HL - address of control block
;
gdtrythr:
        ld   a,(gthrown)                ; is object flying ?
        or   a
        ret  nz                         ; yes, go back

        push hl                         ; save control block

        ld   hl,smknife
        ld   (gthrown + odflimg),hl     ; save image address

        pop  hl                         ; restore control block
        push hl                         ; save control block
        ldcursc
        ld   c,a                        ; save column in C
        inc  c                          ; make correction if throwing left

        pop  hl                         ; restore control block
        push hl                         ; save control block
        push bc                         ; save column from C

        lddir                           ; load current direction into A
        pop  bc                         ; restore colum in C
        ld   (gthrown),a                ; save direction of an object to fly
        cp   dirlt
        jp   z,.gdthr1

        inc  c                          ; throw right

.gdthr1:       
        ld   a,c
        ld   de,gthrown + odfcoln       ; save address in DE, it will be used for storing rownum
        ld   (de),a                     ; save colnum

        pop  hl                         ; restore control block

        ldcursr                         ; load current row
        inc  a
        inc  de                         ; move to rownum
        ld   (de),a

        inc  a              ; just any non zero value
        ld   (gfthrwn),a    ; object is thrown


; ---- move weapon object thrown by guard
;
movgweap:
        ld   a,(gthrown)
        or   a
        ret  z                      ; 0 direction means no object is moving

        ld  hl,gthrown
        ld  (wpobjp),hl
        ld  hl,gthrown + odfcoln
        ld  (wpcolp),hl
        ld  hl,gthrown + odfrown
        ld  (wprowp),hl

        ld  hl,movweap.chksbkl      ; start address of the code to test against saboteur
        ld  (movweap.kiljp + 1),hl

        jp  movweap                 ; check next column to move on        