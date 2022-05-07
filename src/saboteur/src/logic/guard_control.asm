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
        
        ld   a,(gfsbseen)                
        or   a                          ; seen saboteur ?
        jp   nz,.gdact1                 ; do action if yes

        call gdseesab                   ; otherwise check whether he is visible or not
        ret

.gdact1:
        call gdtrythr                
        ret


; ---- checks whether guard sees saboteur
; args: HL - address of control block
; result:
;       A - 1 - yes, 0 - no
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
        sub  d
        jp   nc,.gdsyes
        ret

.gdslt:                                 ; looking left
        sblcursc                        ; load saboteur's column
        sub  d
        jp   c,.gdsyes
        ret

.gdsyes:
        ld   a,1
        ld   (gfsbseen),a
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

