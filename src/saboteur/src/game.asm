; ----- clear text RAM in timer's area
timeclrt:
		xor a
        ld hl,TRAM + TSTARTC + 21 + 64*(TSTARTR + 9)
		ld c,4
.t1:		
        ld (hl),a
        inc hl
		dec	c
		jp	nz,.t1

        ld hl,TRAM + TSTARTC + 21 + 64*(TSTARTR + 10)
		ld	c,4
.t2:		
        ld (hl),a
        inc hl
		dec	c
		jp	nz,.t2
		ret

; ----- text ram init for constant places like timer
;
txtrinit:
        ld hl,TRAM + TSTARTC + 21 + 64*(TSTARTR + 9)
		ld c,4
		ld	a,CHBOTM
.t1:		
        ld (hl),a
        inc hl
		dec	c
		jp	nz,.t1

        ld hl,TRAM + TSTARTC + 21 + 64*(TSTARTR + 10)
		ld	c,4
		ld	a,CHFULL
.t2:		
        ld (hl),a
        inc hl
		dec	c
		jp	nz,.t2

        ld hl,TRAM + TSTARTC + 5 + 64*(TSTARTR + 9)
        ld  a,15
        ld  c,CHBOTM
        jp filtline
        ;ret

; ----- print text strings
;
ptexts:
        ld  b,NUMFGC
        ld  c,NUMBKC

        ld de,PAYSCRA
        ld hl,paystr
        jp prntstr        
        ;ret 

; ---- set up counters
; args: A - selected level index
setupcnt:
		ld	c,a				; save level index
		ld	b,GUNDELD		; load decrement
		ld	a,(gundelay)	; load initial counter

.gnctr:
		sub b				; reduce counter
		dec	c
		jp	nz,.gnctr		; repeat
		ld	(gundelay),a	; save new counter
		ret

; ---- set up game level
setuplvl:
        ld   hl,lvlproc
        ld   a,(menuptr) 
        dec  a              ; get menu item index
		push af
		call setupcnt
		pop	af
        ld   b,0
        ld   c,a
        add  hl,bc
        add  hl,bc          ; move pointer to the item address
        load_de_hl
        ex   de,hl
        jp   (hl)           ; run game level setup procedure

; ---- init main game screen
ginitscr:
        call clrtscr
        rsctrldata
        rstrmap
        rsobjmap
        call setuplvl
		call rstgtime
        GRMODON
        ;call clrscrn
        ld a,COLORCLR 
        call fillvram	; clear screen with black
		call drawfrm	; draw frame
        call ptexts     ; print const text         
        GRMODOFF
        jp txtrinit


; ---- water top layer state
wttopd:	db  220, 154, 8

; ---- draw dynamic top water layer on screen 1
;
drwtops2:
		ld  b,COLNUM - 7	; number of columns to draw
		jp  drwtops1.drwtop

; ---- draw dynamic top water layer on screen 1
;
drwtops1:
		ld  b,COLNUM		; number of columns to draw

.drwtop:		
		ld	de,wttopd		; load data address		
		ld	c,3				; counter = data length
		ld	hl,SCRADDR + (BOATROW + 1) * 64 * 8

		; ---- draw line
		; ----
.drwtlp:
		push bc
		ld	a,80h + (CBLUE << 1) 			; load foreground color
		ld  (COLRREG),a		; set color register

		xor	a				; reset CY

		ld	a,(de)			; load data byte		
		rra
		jp	nc,.drwcy		; skip next if low bit was not 1		
		or	128				; otherwise put it to the beginning

.drwcy:
		ld  (de),a			; save changes
		
.drwt1:		
		ld	(hl),a
		inc	hl
		dec	b
		jp 	nz,.drwt1

		pop	bc				; restore counters

		; ---- draw back line
		; ----
		dec	hl				; move back to the last drawn column

		push bc
		ld	a,80h + (CCYAN << 1)			; load foreground color
		ld  (COLRREG),a		; set color register

		ld	a,(de)			; load data byte
		cpl
.drwt2:		
		ld	(hl),a
		dec	hl
		dec	b
		jp 	nz,.drwt2

		pop	bc
		dec	c
		inc	de				; move to the next sprite byte
		push bc				; save counters
		ld	bc,65			; HL was pointing to the column before the beginning of prevous line
		add hl,bc			; so displacement to the next line in video memory is 64 + 1
		pop	bc				; restore counters
		jp	nz,.drwtlp		

		ret

; ---- moves boat at the beginning
;
gboat:
		ld hl,(sobjlst)		; HL - address of the static objects list
		ld c,(hl)			; load number of boat parts
		
		inc hl				; set to the first object

		ld  a,(hl)			; load column
		cp	BOATMCOL		; reached max col ?
		ret	z				; finish if yes

.gbmove:		
		inc	a				; increase column 
		ld	(hl),a			; save column
		dup 4
			inc	hl			; move to the screen address
		edup
		load_de_hl			; load into DE
		inc	de				; increase screen address
		dec	hl	
		dec hl
		savem_hl_de			; save new screen address

		ld  a,(hl)			; load column of the next part

		dec	c
		jp	nz,.gbmove		; move other parts

		sblcursc			; move saboteur
		inc	a				; to the next column
		sbscursc			; save it

		call updobjs		; update objects state		
		
		call rsttiles		; restore tiles background according to current objects location
		call drawobjs		; draw active objects		

		STARTSND 55000

		GRMODON

		call showscr		; show buffer on the screen		
		call drawstos		; draw boat at new position				

							; clear tile behind the boat
		ld hl,(sobjlst) 
		dup 5
			inc	hl			; move to the screen address of the boat 
		edup
		load_de_hl			; load screen address
		dec	de				; get previous column
		ex	de,hl			; screen address to HL
		ld  de,scrbuf		; empty tile to DE
		ld	c,1				; draw one tile

		call drawbktl

		call drwtops1		; draw water top

		GRMODOFF

		DISSND

		dup 2
		halt				; delay
		edup

		jp gboat

; ---- jump from the boat
;
sbdojump:
		call sbstopst
		sblcursr			; load current row into A
		dec	a
		dec	a
		dec	a
		sbscursr			; save it back
		call sbstshjp		; jump from boat
		jp drawscr
		;ret

; ---- main game cycle
;
gcycle:
		ifdef FULLSTART
		rsboat
		call drawscr
		call mkpause
		call gboat
		call sbdojump
		endif

.gloop:
		call drawscr
        call gtimer         

        sblcurst
        cp   sbescap        ; escaping ?
        jp   nz,.gmc1       ; no, continue game

        call doescape       ; run escape process
		jp	.gmcend

.gmc1:
		call gmain          ; main game logic
		or a		
        jp	z,.gmcend

        ld  a,(frame_counter)
        inc a
        ld  (frame_counter),a

		jp .gloop           ; continue if not zero

.gmcend:
		call prntend		; print text for end of game 
        xor  a
        ret

; ---- main game logic
; result: A - 0 to stop, other - continue game
;
gmain:        
        call trigact
        or  a
        ret nz

        call movthrnw       ; move thrown object if any
        call movgweap       ; move guard's weapon if any
		call gaction		; process objects        		
		call sbmain			; process saboteur
		push af
		call trigtst		; process triggers
		pop	 af
		ret

; ---- calls action logic for other objects
;				
gaction:
		ld hl,(objlist)		; HL - address of the object list
		ld a,h
		or l
		ret z				; address is zero - exit

		ld a,(hl)			; load number of objects
		inc hl				; set to the first object
				
gaction1:		
		push hl
		push af

		ld de,gaction2
		push de				; put next instruction address on stack
		
		push hl				; save control block
		inc hl
		load_de_hl			; load address of object action procedure
		ex de,hl
		pop de				; load control block to DE
		jp (hl)				; call object action procedure
		
gaction2:					; it will return on this line
		pop af
		pop hl
		
		ld bc,objsize					
		add hl,bc
		
		dec a
		jp nz,gaction1

		ret
			
; ---- main logic for saboteur
; result: A - 0 to stop
;		
sbmain:		
		call hlalive
		or a
		ifdef ENDDEAD
		ret z			; stop if dead
		endif

		ld a,(lastkeys)
		ld (prevkeys),a
		xor	a
		ld (lastkeys),a	; reset keys

		call sbcanact	; check if can act
		or a 			
		jp z,gend		; return if zero (no actions)
		
        call kbread
		ld  (lastkeys),a	

		or a
		jp nz,.sbm1
		call sbnoactn
		jp gend
				
.sbm1:				
        ld  b,a             ; save key bits
        sblcurst
        cp  sbmove          ; is moving ?
        jp  z,.sbm2         ; yes, do check keys

        cp  sbsquat         ; is squatting ?
        jp  nz,.sbm1_1      ; no, stop checking for released keys
        ld  a,b             ; restore key bits        
        and KDOWN           ; is down button still pressed ?
		jp	nz,.sbsqt		; already squatting

                            ; if not pressed any more
        call sbnoactn       ; then stand up
        jp gend

.sbsqt:
		call sbtstsqt
		jp	gend

.sbm1_1:
        ld  a,b             ; restore key bits
        jp  gifspace        ; go normal way
.sbm2:
        sblddir             ; load direction
        cp  dirlt           ; left ?
        ld  a,b             ; restore key bits        
        jp  nz,.sbm3        ; no, then check right dir
                            ; left dir
        and KLEFT           ; is left button still pressed ?
        jp  nz,.sbm5        ; yes, continue movement

.sbm3:        
        and KRIGHT          ; is right button still pressed ?
        jp  nz,.sbm5        ; yes, continue movement

.sbm4:  
        call sbdecrow       ; decrement row, since staying sprite is taller
        call sbstopst
        jp   gend

.sbm5:  
        ld  a,b             ; restore key bits

gifspace:       
        ld  c,a				; save keys in C
        and KSPACE
        jp  z,.gsprl      	; not space, test for released SPACE

        sblcurst            ; load state
        cp  sbstay          ; is staying ?
		jp	z,.gdoact		; do action if yes

		cp	sbpunch			; already punching ?
        jp  nz,gifrtup      ; do next test if no


.gdoact:
                            ; else do action
        ld   a,(trtype)  
        or   a          
        jp   z,.gifsp1      ; no triggers, continue
        and  trgmanl
        jp   z,.gifsp1      ; trigger is not manual, continue

		ld   a,(prevkeys)  	; get prev keys
		and	 KSPACE			; was SPACE already pressed ?
		jp	 nz,gend		; yes, do nothing

        call trigrun        ; run manual trigger if this is the first SPACE pressure
		or	 a				; did anything happen ?
        jp   nz,gend		; finish if yes
							; otherwise do punch
.gifsp1:
		ld	a,c				; restore keys in A
        call sbhand         ; throw the object being held or do a punch        
        jp   gend

.gsprl:						; test for released SPACE key
		sblcurst
		cp	sbpunch			; was punching ?
		jp	nz,gifrtup		; make next test if not

		call sbstopst		; otherwise stay normally
		jp	gend

gifrtup:
        ld a,c
		cp KRIGHT + KUP	; right + up
		jp z,gifupdo
		cp KLEFT + KUP	; left + up
		jp nz,giflt
		
gifupdo:
		call gkupact
		jp gend
		
giflt:
		ld c,a
		and KLEFT
		jp z,gifrt

		ld a,dirlt
		call gkmoveh
		jp gend
		
gifrt:
		ld a,c
		and KRIGHT
		jp z,gifup

		ld a,dirrt
		call gkmoveh
		jp gend
		
gifup:
		ld a,c
		and KUP
		jp z,gifdown
		call gkup
		jp gend		

gifdown:
		ld a,c
		and KDOWN
		jp z,gkifesc
		call gkdown
		jp gend


gkifesc:		
	ifndef FULLSTART
		ld a,c
		cp KESC
		jp nz,gend
		xor a
		ret z			; exit button - end game	
	endif

gend:		
		ld a,1
		ret

; ----- up and right or left
;
; args: 
;		A - keys pressed
;
gkupact:
		and KLEFT
		jp nz,gkupact1
							; prepare code for right direction

		sblddir
		cp	dirrt			; looking right ?
		jp	nz,sbstkick		; do kick if not - he's looking in opposite direction
		jp gkupact2		
		
gkupact1:					; prepare code for left direction
		sblddir
		cp	dirlt			; looking left ?
		jp	nz,sbstkick		; do kick if not - he's looking in opposite direction
							; main logic
gkupact2:
		ld (gkupact3+1),a		; set arguments for further calls
		ld (gkupact22 + 1),a

		sblcurst
		cp sbmove
		jp nz,gkupact4		; not moving, check another state
							
							; else start jumping in required direction
		sblddir
		
gkupact3:		
		cp dirrt			; direction is set on entry
		jp nz,gkupact22		; if not correct direction then just process right/left button		
		jp sbstjmp		; start jumping
		;ret

gkupact4:
		cp sbstay
		jp nz,gkupact5		; not staying, check another state
		jp  sbstshjp		; start short jump
		;ret
		
gkupact5:
		cp sbladr
		jp nz,gkupact22		; if not moving on the ladder, process right direction 		
		jp gkup			; else process up if yes
		;ret
		
gkupact22:					; process right button in case of invalid key for current state
		ld a,dirrt			; direction is set on entry
		jp gkmoveh
		;ret
				
			
; ----- move up
;
gkup:
		ld hl,sbctrlb
		push hl
		ldstate 			; load state to A
		pop hl
		push hl
		
		ld b,a		
		ld c,dirup

		cp sbkick			; if is kicking		
		jp nz,gkup2
		call sbdokick		; do kicking
		jp gkupe

gkup2:
		cp sbladr			; if is moving on the ladder
		jp nz,gkup3
		push hl
		push bc
		call cangolad
		pop bc
		pop hl		
		or a
		jp z,gkup2_			; can not continue movement
		call sbdoladr		; continue movement
		jp gkupe
		
gkup2_:	
		call sbstplna		; stop and stay 
		jp gkupe		
			
gkup3:		
		cp sbstay			; if is staying then check
		jp nz,gkupe
		push hl
		push bc		
		call cangolad		; if can go upstairs
		pop bc
		pop hl		
		or a        
		jp z,gkescap		; check can escape

		pop hl
		push hl		
		call sbstladr		; start moving on the ladder
		jp gkupe

gkescap:
        ld  de,scrn123      ; last screen in DE
        ld  hl,(curscr)     ; current screen in HL
        ld  a,e             ; check low byte
        cp  l               ; are equal ?
        jp  nz,gkstkick		; start kicking if no
        ld  a,d             ; check high byte
        cp  h               ; are equal ?
        jp  nz,gkstkick		; start kicking if no
        sblcursc            ; load current column
        cp  ESCAPCOL        ; is it the last one ?
        jp  nz,gkstkick		; start kicking if no
        pop hl
        jp  strtescp        ; start escape process

gkstkick:
		pop hl
		push hl		
		call sbstkick		; start kicking		
		
gkupe:
		pop hl
		ret
		;nextscreen upscrd
		
; ----- move down
;
gkdown:
		ld hl,sbctrlb
		push hl
		ldstate 			; load state to A
		pop hl
		push hl
		
		ld b,a
		ld c,dirdn

gkdn2:
		cp sbladr			; if is moving on the ladder
		jp nz,gkdn3		
		call sbdoladr		; continue movement
		jp gkdne		
			
gkdn3:		
		cp sbstay			; if is staying then check
		jp nz,gkdne
		push hl
		push bc		
		call cangolad		; if can go downstairs
		pop bc
		pop hl		
		or a
		jp z,gksquat		; squat if can't go

		pop hl
		push hl		
		call sbstladr		; start moving on the ladder
		jp gkdne
				
gksquat:
		pop hl
		push hl		
        ld  a,b
        cp  sbstay
		call z,sbdosquat	; squat if staying
		
gkdne:
		pop hl
		ret
		

; ----- move horizontally
; args:
;		A - direction to move
;
gkmoveh:
		ld c,a				; save direction in C

		sblcurst			; load state to A
		
		cp sbladr
		jp nz,gkright1		; not on the ladder, check next state
		
		push bc				; save direction
		ld a,c
		call sbstplad		; test if can leave ladder
		pop bc				; restore direction / clear stack
		or a
		ret z				; can't move, return

		
		ld a,c				; switch to stay mode in required direction
		sbsdir
		push bc
		call sbleavld		; make coordinates fix
		pop bc
		jp gkmvstmv

gkright1:		
		sblddir
		cp c		
		jp z,gkmvstay		; continue, if correct direction

		ld a,c				; else switch direction and stay
		sbsdir
        sblcurst
        cp  sbstay
        call nz,sbdecrow    ; decrement row if not staying, since staying sprite is taller
		jp sbstopst
		;ret		
		
gkmvstay:
		sblcurst
		cp sbstay			
		jp nz,gkrstmv		; if not staying then continue moving

gkmvstmv:					; else start movement
		            		; C - direction
		jp sbstmove
		;ret
		
gkrstmv:
		cp sbstmov			; moving started ?
		jp nz,gkrmove		; no, check further state
		ld a,sbmove			; state state to moving
		sbsetst
		jp sbdomove		; yes, continue moving
		;ret 

gkrmove:
		cp sbmove
		call z,sbdomove		; continue movement
		
		ret
		
; ---- end of gkmoveh

; ---- restart game timer in coundown mode
gtimcntd:
        ld      hl,(timecntd)		; restart timer
		ld		(curtime + 1),hl
		jp		rldtimef

; ---- restart game timer
rstgtime:
        ld      hl,(timeinit)		; restart timer
		ld		(curtime + 1),hl
		jp		rldtimef

; ---- reload game time update frame counter
rldtimef:
		ld	a,TIMEUPDF		; reload update timer counter
		ld (timeupdf),a
		ret

; ---- game timer
;
gtimer:
		ld	a,(timractv)	; load timer state
		or	a				; and test it
		ret z				; exit if timer is disabled

		ld	hl,timeupdf		; timer update counter
		ld	a,(hl)			; load counter
		or  a				; is it zeroed on the previous frame ?
		jp	z,.gtst			; call timer procedure if yes
		dec	a				; reduce counter otherwise
		ld	(hl),a
		ret

.gtst:
        ld	a,TIMEUPDF		; reload update timer counter
		ld	(hl),a			; save it
        ld  (ctimechg),a    ; set flag

        ld  hl,curtimef     
        ld  a,(hl)          ; load current timer frame
        or  a
        jp  z,.gt1          ; already zero, reload timer
        dec a
        ld  (hl),a          ; save new value
        ret

.gt1:
        ld  (hl),TIMEGFRM   ; reload timer
        ld  hl,curtime + 2  ; pointer to the last digit of the timer
        ld  a,(hl)
        or  a               ; is zero from the last frame ?
        jp  z,.gt2
        dec a        
        ld  (hl),a
        ret
.gt2:
        dec hl              ; move pointer to the high digit
        ld  a,(hl)
        or  a               ; is zero from the last frame ?
        jp  z,.gtend
        dec a
        ld  (hl),a
        inc hl
        ld  (hl),9          ; reload low digit
        ret
        
.gtend:						; time elapsed, finish game

		ld  a,(timractv)	; load timer mode
		cp	TIMRCNTD		; is in countdown mode ?
		jp	nz,.gtdie		; no, just make it dead

							; the bomb has been planted, let's explode it!		
		ENSND

		ld	c,15			; number of iteration
.gte2:		
		push bc

        ld hl,LUTVAL1
		call lutxplsn		

        ld hl,LUTVAL
		call lutxplsn

		pop	bc
		dec	c
		jp	nz,.gte2
		
		DISSND
.gtdie:		
        ; --- end of time, make saboteur dead
		ld	a,255			;
		call hldec			;  make saboteur dead

        xor a        
		ld  (timractv),a		; disable timer 

		ret

; ----- 
lutxplsn:
        ld c,16				; LUT size
        ld de,LUTREG

		GRMODON
		call lutset2
		GRMODOFF

		jp plyxlpsn
        
