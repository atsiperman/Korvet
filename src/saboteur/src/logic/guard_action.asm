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

        xor  a                          
        call gdwalabv                   ; is wall above head ?
        or   a
        jp   nz,.gd4                    ; return if yes

        ld   de,gdstkick                ; no wall, do kick
        ld   a,d
        ret

.gd2:
        cp   THRWDST                    ; far enough to throw weapon ?
        jp   nc,.gd3                    ; yes, try throw
        xor  a                          ; otherwise do nothing
        ret

.gd3:        
        ld   a,(gfthrwn)                ; is object thrown ?
        or   a        
        jp   nz,.gdnw                   ; yes, wait until it is flying

        ld   de,gdtrythr                ; yes, do throw
        ld   a,d
        ret

.gdnw:
        ld   a,(gthrown)                ; still flying ?
        or   a
        jp   z,.gd4                     ; not ready, if no

        ld   de,gdwait                  ; wait for flight to finish
        ret                             ; return A > 0

.gd4:
        xor  a
        ret

; ---- guard waits for thrown weapon
gdwait:
        ret

; ---- start guard action
; args: HL - address of control block
;       D  - distance to saboteur
gdstact:
        push    de                      ; save distance
        call gdsabcy                    ; see saboteur by Y ?
        pop     de                      ; restore distance
        or      a                       
        ret     z                       ; return if not

        push hl                         ; keep control block for action procedure, if happens
        call gdrdyact
        pop  hl                         ; restore control block

        or   a                          ; ready for action ?
        jp   z,gdstmov                  ; no, start movement
        
        push de                         ; otherwise save action procedure address
        ret                             ; return to action procedure - start it

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
        ld   hl,sabkckrb
        ld   (gsprtab),hl
        jp   .do2
.do1:
        ld   de,sabkckl1
        scurspr
        pop  hl
        push hl
        ld   de,gdhdkk1l
        shdspr        

        ld   hl,sabkcklb
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


; ---- checks whether guard hits saboteur
; args: HL - address of control block
;       A  - direction
ghitsab:
        push    af              ; save direction
        push    hl              ; control block

        ldcursr                 ; load guards row in A
        inc     a               ; get height
        inc     a               ; of hand/leg
        ld      d,a             ; save it in D
        pop     hl

        sblcursr                ; load sab row
        cp      d               ; is guard hits below sab's top ?
        jp      c,.ght          ; continue if yes

        pop     af              ; clear stack
        ret

.ght:
        push    hl
        ld      hl,(sbctrlb + odcursp)          ; load current sprite
        inc     hl                              ; skip color
        ld      e,(hl)                          ; load height
        add     e                               ; get saboteur's feet level
        pop     hl
        
        cp      d               ; is guard hits below sab's bottom ?
        jp      nc,.ght2        ; continue if not

        pop     af              ; clear stack
        ret

.ght2:
        pop     af
        cp      dirlt           ; test which direction to process
        jp      z,.ghtlt

                                ; saboteur is on the right
        push    hl
        ldcurspr                ; load current sprite into DE
        inc     de              ; skip color
        inc     de              ; skip height
        ld      a,(de)          ; load width
        ld      d,a             ; save it in D

        pop     hl
        push    hl
        ldcursc                 ; load screen column into A
        pop     hl
        add     d               ; get right column of
        dec     a               ; the guard
        ld      d,a             ; save it in D

        sblcursc                ; load saboteur's column into A
        cp      d
        ret     nc
        add     SBWI-2          ; get right border
        cp      d
        ret     c               ; nothing to do if outside
        jp      .ghit           ; do hit otherwise

.ghtlt:                         ; saboteur is on the left
        push    hl
        ldcursc                 ; load screen column into A
        pop     hl
        ld      d,a             ; save it in D
        sblcursc                ; load saboteur's column into A
        
.gtst:        
        cp      d               ; is inside saboteur ?
        ret     nc              ; return if no
        add     SBWI-1          ; get right side column
        cp      d               ; is inside saboteur ?
        ret     c               ; nothing to do if outside

.ghit:
        ldstate
        cp   sbkick
        jp   z,.ghtkck
        ld   a,HLGDPNCH        
        jp   .gdohit

.ghtkck:        
        ld   a,HLGDPKCK

.gdohit:        
        call hldec
        jp playpnch
        ;ret



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
        ldcursc         ; starts kick, decrease column for right direction        
        dec  a
        ld   (hl),a
        ret

.gdcr2:
        cp   3
        jp   nz,.gdcr3
                        ; time to test hits' target
        push hl
        push af
        ld   a,dirrt
        call ghitsab
        pop  af
        pop  hl

.gdcr3:        
        cp  ((sabkckre - sabkckrb - 1) / 2) - 2
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
        cp   3
        jp   nz,.gdcl3
                        ; time to test hits' target
        push hl
        push af
        ld   a,dirlt
        call ghitsab
        pop  af
        pop  hl

.gdcl3:
        cp  ((sabkckre - sabkckrb - 1) / 2) - 2
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
        call playthrw

        ; fall down to movgweap

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