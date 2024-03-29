		
; ---- stop and stay
;
sbstopst:
        sblddir
	cp  dirrt
	jp  nz,sbstpst1
	ld  de,sabsprt
	sbscursp
        ld  de,sbheadr
        sbshdspr
	jp sbstpste
		
sbstpst1:
	ld de,sabsplt
	sbscursp
        ld  de,sbheadl
        sbshdspr
		
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

        call sbcanfal	; check if he must fall down	
        or a
        jp z,sbcnacty
                                        ; start falling down
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
        sblcurst		
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
        cp sbsquat
        jp nz,.sbnoac4

        sblddir
        cp   dirlt
        jp   z,.sbnoac5
                                                ; was moving right
                                                        ; player is squatting, now stand up																
                                                        ; player is looking right, decrease column
        ld   hl,sbctrlb + odcursc	
        ld   a,(hl)			        ; load column
        dec  a
        ld   (hl),a
		
.sbnoac4:
        sblddir
        cp   dirlt
        jp   z,.sbnoac5

        ld  de,sabsprt 
        sbscursp		; stop, look at right		
        ld  de,sbheadr
        sbshdspr                ; set head sprite
        jp .sbstop
		
.sbnoac5:
                                ; was moving left
        ld de,sabsplt
        sbscursp		; stop, look at left
        ld  de,sbheadl
        sbshdspr                ; set head sprite

.sbstop:
        sbscurst sbstay		; is staying now
        
        sblprvsp		; load previous
        ldsprht                 ; sprite height
        push af			; save prev height
		
        sblcursp		; load cur sprite 
        ldsprht			; current height

        pop  bc                 ; restore prev height in B
        sub  b			; current is always bigger than previous
		
        ld   c,a		; save the difference
        sblcursr
        sub  c			; increase height 
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

; ---- saboteur throws a weapon object
;       A  - keys pressed mask
sbthrow:
        push af                         ; save keys

        ld   a,(sbholds)

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
        ld   b,a                        ; save direction in B

        pop  af                         ; restore keys        
        and  KDOWN                      ; need to throw down ?
        jp   z,.thrws                   ; skip if not

        ld   a,dirdn
        or   b                          ; combine directions
        ld   b,a                        ; save direction in B

.thrws:
        ld   a,b
        ld   (othrown),a                ; save direction of an object to fly
        and  dirrt
        jp   z,.sbthr1

        inc  c                          ; throw right

.sbthr1:       
        ld   a,c
        ld   de,othrown + odfcoln       ; save address in DE, it will be used for storing rownum
        ld   (de),a                     ; save colnum

        sblcursr
        inc  a
        inc  de                         ; move to rownum
        ld   (de),a

        xor  a
        ld   (sbholds),a    ; object is thrown
        inc  a
        ld   (sbhldch),a    ; redraw object

        call playthrw
                                ; check next column to move
        ; fall down to movthrnw


; ---- moving weapon thrown by saboteur
;
movthrnw:
        ld   a,(othrown)
        or   a
        ret  z              ; 0 direction means no object is moving

        ld  hl,othrown
        ld  (wpobjp),hl
        ld  hl,othrown + odfcoln
        ld  (wpcolp),hl
        ld  hl,othrown + odfrown
        ld  (wprowp),hl

        ld  hl,movweap.chkokil       ; start address of the code to test against guard/dog
        ld  (movweap.kiljp + 1),hl

        ; --- fall down to movweap      
        ;;jp  movweap                   



wpobjp:  dw 0       ; pointer to object
wpcolp:  dw 0       ; pointer to object's column
wprowp:  dw 0       ; pointer to object's row

; ---- move thrown weapon
;
movweap:
        ld   hl,(wpobjp)        
        ld   d,(hl)             ; save direction in D

        push de                 ; save direction

        ld   hl,(wpcolp)
        ld   c,(hl)             ; load colnum into C

        ld   a,d                ; restore direction in A
        and  dirrt
        jp   nz,.mvthr1

        ld   a,c                ; moving left
        cp   2                  ; last column on the left, stop moving
        jp   c,.mvthre

        dec  a
        dec  a
        ld   hl,(wpcolp)
        ld   (hl),a
        jp   .mvthr2

.mvthr1:
        ld   a,c
        cp   COLNUM - 2
        jp   nc,.mvthre

        inc  a
        inc  a
        ld   hl,(wpcolp)
        ld   (hl),a

.mvthr2:
        ld   d,a            ; save column in D
        ld   hl,(wprowp)
        ld   a,(hl)         ; load row 
        ld   e,a            ; save row in E

        pop  af                 ; restore direction
        and  dirdn              ; fly down too ?
        jp   z,.mvthv           ; skip correction if not
        inc  e                  ; move down
        ld   (hl),e             ; save new row

.mvthv:        
        call shscradr

        ld   a,(hl)
        and  bwall
.kiljp:        
        jp   z,.chkokil         ; no wall - keep flying, check if alive object is on the way
        push af                 ; symmetrical push, to be cleared on exit
        PLYWEAPN                ; wall, play sound 

.mvthre:
        pop  af                 ; clear stack
        xor  a
        ld   hl,(wpobjp)
        ld   (hl),a         ; movement is finished
        ret

.chksbkl:
        ld  a,1             ; number of objects - saboteur only
        ld  hl,sbctrlb
        jp  .chokil         

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

        ld   a,(hl)
        cp   ogun
        jp   z,.chokile      ; no actions for gun

        ldstate
        cp   sbdead
        jp   z,.chokile      ; object is dead, no actions
        
        pop  hl
        push hl
        ldcursc
        ld   b,a             ; save column in B
        inc  hl
        ld   c,(hl)          ; save row in C

        ld   hl,(wprowp)
        ld   a,(hl)         ; load weapon's Y

        cp   c
        jp   c,.chokile     ; less than object's Y, fying over the object

        ld   hl,(wpcolp)
        ld   a,(hl)         ; load weapon's X
        cp   b
        jp   c,.chokile     ; less than object's X, has not reached object yet

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

        push hl
        ld   hl,(wprowp)
        ld   a,(hl)         ; load weapon's Y
        pop  hl
        
        cp   e
        jp   nc,.chokile    ; greater or equal to object's Y, flying under the object

        inc  hl             ; move to object sprite width
        ld   a,b            ; load object's column into A
        add  a,(hl)         ; get X after objects right border
        ld   e,a            ; save X in E

        ld   hl,(wpcolp)
        ld   a,(hl)         ; load weapon's X
        cp   e
        jp   nc,.chokile    ; greater or equal to object's right border, not inside object's box

        pop  hl
        pop  af
        
        ld  a,(hl)          ; load object type
        cp  osabotr         ; is saboteur ?
        jp  nz,.chok1       ; no, set dead
        ld  a,HLKNFHIT
        call hldec
        PLYWEAPN
        jp   .chok3         ; goto exit

.chok1:
        cp   odog
        jp   z,.chok2       ; skip adding scores for dog
        push hl
        ld   hl,killwpgd
        call addscore
        pop  hl

.chok2:        
        call setdead      
        PLYWEAPN

.chok3:
        xor  a
        ld   hl,(wpobjp)
        ld   (hl),a         ; movement is finished
        ret

.chokile:
        pop hl
        pop af
        
        ld bc,objsize	
        add hl,bc
        
        dec a
        jp nz,.chokil
        
        ret

; ---- makes object dead: sets state and sprite for dead object
; args: HL - address of control block 
;
setdead:
        push hl
        scurst sbdead
        pop  hl
        push hl
        ld   de,0           ; clear sprite
        shdspr              ; for head
        pop  hl
        ld   a,(hl)         ; load object type
        cp   odog
        jp   z,.std1        ; set dog sprite
        ld   a,odead
        ld   (hl),a         ; change type to dead to make it easier to draw sprite without head
        ld   de,sabdead
        jp   .std2

.std1:
        ld   de,dogdedsp     ; set dog dead

.std2:        
        push hl
        scurspr 
        pop  hl
        ;jp .mvdead

; ---- moves down dead sprite until wall tile is found
; args: HL - address of control block 
;
.mvdead:
        push hl
        ldcurspr        
        ex   de,hl      ; sprite pointer into HL
        inc  hl         ; skip color
        ld   e,(hl)     ; load sprite height into E

        inc  hl         ; move to width
        ld   d,(hl)     ; save width in D

        pop  hl
        push hl         ; save control block
        
        ldcursc     
        ld   d,a        ; load current column into D

        inc  hl
        ld   a,(hl)     ; load current row into A
        add  e          ; add sprite height, start with line under object in the middle by X
        ld   e,a        ; save row in E

        push de
        call shscradr   ; pointer to tile attributes in HL
        pop  de         ; restore row in E

        ld   bc,ROWWIDB

.mvdn1:
        ld   a,(hl)
        and  bladder            ; is staying on the ladder
        jp   z,.mvdn2           ; continue if not
        skip_buf_tile_hl        ; otherwise find first tile without ladder
        jp   .mvdn1

.mvdn2:
        ld   a,(hl)
        and  bkroof     ; is something to lie on ?
        jp   z,.mvdn3   ; no, continue
                                
                        ; yes, write new row and exit
                        
        ld   a,e        ; save row in A

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

.mvdn3:
        inc  e          ; inc row numbers
        add  hl,bc      ; move pointer to the next line
        jp   .mvdn1


; ---- throw the object being held or do a punch        
; args:
;       A  - keys pressed mask
sbhand:        
        push af                 ; save keys pressed

        sbscurst sbpunch    ; set punch state
        sblddir             ; load direction

        cp  dirrt
        jp  z,.hand1
                            ; left direction
        ld  de,sabpnchl
        sbscursp 
        ld  de,sbhpnchl
        sbshdspr
        jp  .hand2

.hand1:
                            ; right direction
        ld  de,sabpnchr
        sbscursp 
        ld  de,sbhpnchr
        sbshdspr

.hand2:
        pop  de                 ; restore keys in D
        ld   a,(sbholds)
        or   a
        jp   z,tstokick         ; nothing is held, do punch
        cp   trodskn            ; bomb or disk ?
        ld   a,d                ; copy keys into A
        jp   c,sbthrow          ; throw if not
        jp   tstokick           ; otherwise do punch if object can not be thrown

