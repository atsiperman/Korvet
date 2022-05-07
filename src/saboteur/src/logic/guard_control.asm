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

        cp   PNCHDST                    ; close enough to do punch ?
        jp   c,gddopnch                 ; yes, do punch

        cp   KICKDST                    ; close enough to do kick ?
        jp   c,gddokick                 ; yes, do kick

        call gdtrythr                   ; otherwise throw weapon
        ret

gddopnch:
        push hl
        scurst sbpunch         
        pop  hl
        push hl
        lddir
        pop  hl
        cp   dirlt
        jp   z,.dopnchl
        ld   de,gdpnchr
        scurspr 
        ret
.dopnchl:
        ld   de,gdpnchl
        scurspr 
        ret

gddokick:
        ret

; ---- continue guard's action
; args: HL - address of control block
;       A  - current state
gdconact:
        cp  sbpunch
        jp  nz,.gdact1
        call gdststay
        ret

.gdact1:        
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

