;
;	this file contains logic for guards 
;

; ---- guard control procedure
; args: HL - address of control block
;
guardact:
        ld   a,(gfthrwn)                ; is object thrown ?
        or   a
        ret  nz                         ; yes, go back

        ld   a,(gthrown)                ; is object flying ?
        or   a
        ret  nz                         ; yes, go back

        ex   de,hl                       ; load control block into HL
        call gdthrow
		ret

; ---- guard throws a weapon object
; args: HL - address of control block
;
gdthrow:
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
        ret  z              ; 0 direction means no object is moving

        ld  hl,gthrown
        ld  (wpobjp),hl
        ld  hl,gthrown + odfcoln
        ld  (wpcolp),hl
        ld  hl,gthrown + odfrown
        ld  (wprowp),hl

        ld  hl,movweap.chksbkl      ; start address of the code to test against saboteur
        ld  (movweap.kiljp + 1),hl

        jp  movweap         ; check next column to move on

