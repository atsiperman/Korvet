;
;	this file contains logic for guards 
;

; ---- guard control procedure
; args: DE - address of control block
;
guardact:
        ex   de,hl                       ; load control block into HL

        push hl
        ldstate
        pop  hl
        cp   objdead        
        ret z

        cp   sbstay
        jp   z,.gdact1                  ; is staying, check for next action
        call gdconact                   ; continue action
        ret

.gdact1:
        ld   a,(gfsbseen)                
        or   a                          ; seen saboteur ?
        jp   z,.gdact2                  ; no, continue watching

        push hl
        call gdseesab                   ; otherwise check whether he is visible or not
        pop  hl
        or   a
        ret  z                          ; doesn't see saboteur, do nothing
        and  c                          ; changed direction ?
        ret  nz                         ; yes, do nothing

        call gdstact                    ; see saboteur, direction not changed - start action
        ret

.gdact2:
        call gdseesab                   ; otherwise check whether he is visible or not
        or   a
        ret  z
        ld   (gfsbseen),a
        ret

; ---- start guard action
; args: HL - address of control block
;       D  - distance to saboteur
gdstact:
        ld   a,d

        cp   PNCHDST                    ; close enough to punch ?
        jp   c,gdstpnch                 ; yes, do punch

        cp   KICKDST                    ; close enough to kick ?
        jp   c,gdstkick                 ; yes, do kick

        cp   THRWDST                    ; close enough to throw weapon ?
        call c,gdtrythr                 ; yes, throw weapon

        ret

; ---- continue guard's action
; args: HL - address of control block
;       A  - current state
gdconact:
        push hl
        push af
        call .gconact
        pop  de
        pop  hl
        or   a
        ret  z                          ; action has finished

        ld   a,d                        ; check action type
        cp   sbkick
        call z,gdchkck                  ; make column correction if this is a kick
        ret

; ---- continue guard's action
; args: HL - address of control block
;       A  - current state
; result:
;       A  - 0 if action has finished
.gconact:
        push hl
        ldcurspi                        ; load current sprite index
        inc  a                          ; move to the next sprite
        pop  hl
        push hl
        scurspi                         ; save new sprite index

        ld   b,a                        ; save it in B

        ld   hl,(gsprtab)               ; load address of sprite table for current action
        ld   a,(hl)                     ; load total number of sprites

        cp   b                          ; is it the last one ?
        jp   z,.gdact1                  ; yes, stop action
        
        ld   a,b                        ; save current index in A
        inc  hl                         ; move to the pointer on the first sprite
        add  a                          ; get diplacement to the sprite with current index
        ld   d,0
        ld   e,a
        add  hl,de                      ; move pointer to the next sprite address
        load_de_hl                      ; load address into DE

        pop  hl
        scurspr                         ; save next sprite
        ret

.gdact1:
        pop  hl
        push hl
        ldstate
        pop  hl
        cp   sbkick
        jp   nz,.gdst

        push hl
        ldcursr                         ; load current screen row into A
        inc  a                          ; increase row
        ld   (hl),a     
        pop  hl
        push hl
        lddir
        pop  hl
        cp   dirrt
        jp   z,.gdst
        push hl
        ldcursc
        dec  a
        ld   (hl),a
        pop  hl        

.gdst:
        call gdststay                   ; stay and stop   
        xor  a     
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
        ld   de,gdpnchr
        scurspr 
        ld   hl,gdpnchrb
        ld   (gsprtab),hl
        ret

.dopnchl:
        ld   de,gdpnchl
        scurspr 
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
        ld   de,gdkckr1
        scurspr         
        ld   hl,gdkckrb
        ld   (gsprtab),hl
        jp   .do2
.do1:
        ld   de,gdkckl1
        scurspr
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
        ldcursc         ; starts kick, decrease column for left direction
        dec  a
        ld   (hl),a
        ret

.gdcr2:
        cp  ((gdkckre - gdkckrb - 1) / 2) - 2
        ret nz
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
        ldcursc         ; starts kick, decrease column for left direction
        dec  a
        dec  a
        ld   (hl),a
        ret

.gdcl2:
        cp  ((gdkckre - gdkckrb - 1) / 2) - 2
        ret nz
        ldcursc         ; ends kick, increase column for left direction
        inc  a
        inc  a
        ld   (hl),a
        ret

; ---- set guard into stay state
; args: HL - address of control block
;       
gdststay:
        push hl
        scurst sbstay         
        pop  hl
        push hl
        lddir
        pop  hl
        cp   dirlt
        jp   z,.gs1
        ld   de,gdsprt
        scurspr 
        ret
.gs1:
        ld   de,gdsplt
        scurspr 
        ret

; ---- checks whether guard sees saboteur
; args: HL - address of control block
; result:
;       A - 1 - yes, 0 - no
;       D - distance to the saboteur
;       C - 1 - yes, 0 - no, flag, whether direction has been changed
gdseesab:
        push hl

        ldcursc
        ld   d,a                        ; save column in D
        pop  hl
        push hl

        ldcursr
        ld   e,a                        ; save row in E
        pop  hl
        push hl

        lddir                           ; load guard's direction
        pop  hl
        cp   dirlt
        jp   z,.gdslt
                                        ; looking right
        sblcursc                        ; load saboteur's column
        ld   c,a
        ld   a,d
        sub  c                          ; A = guard col - sab col
        jp   c,.gdsyes
        cp   BKSEEDST                   ; exceed minimal visibility distance ?
        jp   nc,.gdno                   ; no, do nothing

        or   a
        jp   z,.gdsyes                  ; column matches

        push hl
        scurdir dirlt
        pop  hl
        ld   de,gdsplt
        scurspr
        jp   .gdsyesc                   ; yes, with direction change

.gdslt:                                 ; looking left
        sblcursc                        ; load saboteur's column
        sub  d
        jp   c,.gdsyes
        cp   BKSEEDST                   ; exceed minimal visibility distance ?
        jp   nc,.gdno                   ; no, do nothing

        or   a
        jp   z,.gdsyes                  ; column matches

        push hl
        scurdir dirrt
        pop  hl
        ld   de,gdsprt
        scurspr

.gdsyesc:                               ; see saboteur, changed direction
        ld   d,a
        ld   a,1
        ld   c,a
        ret

.gdsyes:                                ; see saboteur, no direction change
        cpl
        inc  a                          ; get positive distance
        ld   d,a
        ld   a,1
        ld   c,0
        ret

.gdno:
        xor  a
        ret        

; ---- try to throw guard's weapon
; args: HL - address of control block
;
gdtrythr:
        ld   a,(gfthrwn)                ; is object thrown ?
        or   a
        ret  nz                         ; yes, go back

        ld   a,(gthrown)                ; is object flying ?
        or   a
        ret  nz                         ; yes, go back

;         call gdthrow
; 		ret

; ; ---- guard throws a weapon object
; ; args: HL - address of control block
; ;
; gdthrow:
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

