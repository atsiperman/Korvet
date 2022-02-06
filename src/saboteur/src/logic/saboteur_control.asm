		
; ---- stop and stay
;
sbstopst:
		sblddir
		cp dirrt
		jp nz,sbstpst1
		ld de, sabsprt
		sbscursp
		jp sbstpste
		
sbstpst1:
		ld de,sabsplt
		sbscursp
		
sbstpste:
		sbscurst sbstay
		ret

; ---- checks if saboteur can do any actions
;
; result: 
;		A - 0 no actions can be done (saboteur is currently falling, jumping etc.)
;		
sbcanact:
		call chkfalng
		or a
		ret z			; exit if is falling down

		sblcurst		
		cp sbkick		; if is kicking		
		jp nz,sbcnact1
		call sbdokick	; continue kicking
		jp sbcnactn
		
sbcnact1:
		cp sbjump		; jumping
		jp nz,sbcnact2
		call sblongjp
		jp sbcnactn
		
sbcnact2:
		cp sbshjmp		; short jump
		jp nz, sbcnact3
		call sbdoshjp
		jp sbcnactn

sbcnact3:		
		cp sbladr
		jp z,sbcnacty
		;;cp sbstay
		;;jp nz,sbcnacty	; not staying, should not fall since is not falling already

		;;jp sbcnacty

		call sbcanfal	; check if he must fall down	
		or a
		jp z,sbcnacty
						; start falling down
		ld hl,sbctrlb
		call sbstfall
		jp sbcnactn

sbcnacty:
		or 1			; exit with non zero to allow actions
		ret
		
sbcnactn:		
		xor a
		ret
		
; ---- logic when no button pressed
;
sbnoactn:
		ld hl,sbctrlb
		push hl
		
		ldstate
		pop hl
		
		cp sbstay
		jp nz,.sbnoact
							; player is staying, no action									
		call hlinc			; update health 
		ret

.sbnoact:		
		cp sbstmov			; check if just started moving
		jp nz,.sbnoac1		; no

							; yes, need to do at least one step
		sblddir				; load current direction
		ld c,a
		call sbdomove		; do at least one movement since it was allowed

.sbnoac1:
		cp sbladr			
		jp nz,.sbnoac2
							; player is on the ladder
		call sbstplna		
		ret
		
.sbnoac2:		
		sblddir
		cp dirrt
		jp nz,.sbnoac5
							; was moving right
		ldstate	
		cp sbsquat
		jp nz,.sbnoac4
							; player is squatting, now stand up									
							
							; player is looking right, decrease column
		ld hl,sbctrlb + odcursc	
		ld a,(hl)			; load column
		dec a
		ld (hl),a
		
.sbnoac4:							
		ld de,sabsprt 
		sbscursp			; stop, look at right		
		jp .sbstop
		
.sbnoac5:
							; was moving left
		ld de,sabsplt
		sbscursp			; stop, look at left

.sbstop:
		sbscurst sbstay		; is staying now
		
		sblprvsp		
		ldsprht
		push af				; save prev height
		
		sblcursp			; load cur sprite 
		ldsprht				; current height
		pop bc
		sub b				; current is always bigger than previous
		ld c,a				; save the difference
		sblcursr
		sub c				; increase height 
		sbscursr
		ret
		
.sbnoace:		
		pop hl		
		ret
		

; ---- check if can move on the ladder up and stop if not
;		
sbstplna:			
		ld hl,sbctrlb
		ld c,dirup
		call cangolad
		or a
		ret nz
		
		sblddir
		call sbleavld		; if yes - stop and stay
		call sbstopst
		ret

; ---- saboteur throws an object
;
sbthrow:
        ld   a,(sbholds)
        or   a
        ret  z                          ; nothing is held, return

        ld   hl,othrwlst
        dec  a                          ; get image index from object type
        ld   c,a
        ld   b,0
        add  hl,bc
        add  hl,bc                      ; pointer to image address
        load_de_hl                      ; read image address
        ex   de,hl                      ; into HL

        ld   (othrown + odflimg),hl     ; save image address
        sblcursc
        ld   c,a                        ; save column in C
        inc  c                          ; make correction if throwing left

        sblddir                         ; load current direction into A
        ld   (othrown),a                ; save direction of an object to fly
        cp   dirlt
        jp   z,.sbthr1

        inc  c                          ; throw right

.sbthr1:       
        ld   a,c
        ld   de,othrown + odfcoln        
        ld   (de),a                     ; save colnum

        sblcursr
        inc  a
        inc  de                         ; move to rownum
        ld   (de),a

.sbthre:
        xor  a
        ld   (sbholds),a    ; object is thrown
        inc  a
        ld   (sbhldch),a    ; redraw object

        jp   movthrn        ; check next column to 



; ---- moving thrown object
;
movthrn:
        ld   a,(othrown)
        or   a
        ret  z                      ; 0 direction means no object is moving

        ld   d,a                    ; save direction in D

        ld   a,(othrown + odfcoln)  ; load colnum
        ld   c,a                    ; save in C

        ld   a,d                    ; restore direction in A
        cp   dirrt
        jp   z,.mvthr1

        ld   a,c                    ; moving left
        cp   2                      ; last column on the left, stop moving
        jp   c,.mvthre

        dec  a
        dec  a
        ld   (othrown + odfcoln),a
        jp   .mvthr2

.mvthr1:
        ld   a,c
        cp   COLNUM - 2
        jp   nc,.mvthre

        inc  a
        inc  a
        ld   (othrown + odfcoln),a

.mvthr2:
        ld   d,a
        ld   a,(othrown + odfrown)  ; load row 
        ld   e,a
        call shscradr

        ld   a,(hl)
        and  bwall
        jp   z,.chkokil             ; no wall - keep flying, check if alive object is on the way

.mvthre:
        xor  a
        ld   (othrown),a            ; movement is finished
        ret

.chkokil:
		ld hl,(objlist)		; HL - address of the object list
		ld a,h
		or l
		ret z				; address is zero - exit

		ld a,(hl)			; load number of objects
		
		inc hl				; set to the first object

.chokil:		
		push af
		push hl

        ldstate
        cp  objdead
        jp  z,.chokile      ; object is dead, no actions
        
        pop  hl
        push hl
        ldcursc
        ld   b,a             ; save column in D
        inc  hl
        ld   c,(hl)          ; save row in C

        ld   a,(othrown + odfrown)  ; load weapon's Y
        cp   c
        jp   c,.chokile    ; less than object's Y, fying over the object
        
        ld   a,(othrown + odfcoln)  ; load weapon's X
        cp   b
        jp   c,.chokile    ; less than object's X, has not reached object yet

        pop  hl
        push hl
        push bc
        ldcurspr            ; load pointer to sprite into DE
        ex   hl,de           
        pop  bc             ; restore X,Y       
        inc  hl             ; move to height
        ld   a,c            ; load object's row into A
        add  a,(hl)         ; get Y under feet
        ld   e,a            ; save Y in E
        ld   a,(othrown + odfrown)  ; load weapon's Y
        cp   e
        jp   nc,.chokile     ; greater or equal to object's Y, fying under the object

        inc  hl             ; move to object sprite width
        ld   a,b            ; load object's column into A
        add  a,(hl)         ; get X after objects right border
        ld   e,a            ; save X in E
        ld   a,(othrown + odfcoln)  ; load weapon's X
        cp   e
        jp   nc,.chokile     ; greater or equal to object's right border, not inside object's box

        pop  hl
        pop  af
        push hl
        scurst objdead
        pop  hl
        ld   a,(hl)         ; load object type
        cp   oguard
        jp   nz,.chokil1     ; set guard sprite
        ld   de,sabdead
        jp   .chokil2

.chokil1:
        ld   de,dogdedsp     ; set dog dead

.chokil2:        
        push hl
        scurspr 
        pop  hl
        call .mvdown
        xor  a
        ld   (othrown),a            ; movement is finished
        ret

.chokile:
		pop hl
		pop af
		
		ld bc,objsize	
		add hl,bc
		
		dec a
		jp nz,.chokil
		
		ret

; ---- moves down dead sprite until wall tile is found
; args: HL - address of control block 
;
.mvdown:
        push hl
        ldcurspr        
        ex   de,hl      ; sprite pointer into HL
        inc  hl         ; skip color
        ld   e,(hl)     ; load sprite height into E
        inc  hl         ; move to width
        ld   d,(hl)     ; save width in D

        pop  hl
        push hl         ; save control block
        
        push de         ; save sprite dimensions
        ldcursc     
        ld   d,a        ; load current column into D
        inc  hl
        ld   a,(hl)     ; load current row into A
        add  e          ; add sprite height, start with line under object
        pop  de         ; restore dimensions
        ld   e,a        ; save row in E
        push de
        call shscradr   ; pointer to tile attributes in HL
        pop  de
        push de         ; save counters
        push hl         ; save initial pointer to tile attrs
.mvdn1:
        ld   a,(hl)
        and  bkroof     ; is something to lie on
        jp   z,.mvdn2   ; no, continue
                        ; yes, write new row and exit
        ld   a,e        ; save row in A
        pop  de         ; clear stack
        pop  de         ; clear stack        

        pop  hl         ; restore control block
        push hl

        ldcurspr        
        ex   de,hl      ; load sprite pointer into HL
        inc  hl         ; skip color
        ld   e,(hl)     ; load sprite height
        sub  e          ; decrease row by sprite height

        pop  hl         ; restore control block
        scursr
        ret

.mvdn2:
        dec  d        
        jp   z,.mvdn3       ; stop iteration, start next one
        skip_buf_tile hl    ; move to the next tile
        jp   .mvdn1

.mvdn3:
        pop  hl         ; restor pointer to the first tile
        pop  de         ; restore counters
        inc  e          ; inc row numbers
        ld   bc,ROWWIDB
        add  hl,bc      ; move pointer to the next line
        push de
        push hl
        jp   .mvdn1


        

