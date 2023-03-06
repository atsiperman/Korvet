; ----- text ram init for constant places like timer
;
txtrinit:
        ld hl,TRAM + TSTARTC + 21 + 64*(TSTARTR + 9)
		dup 4
        ld (hl),CHBOTM
        inc hl
		edup
        ld hl,TRAM + TSTARTC + 21 + 64*(TSTARTR + 10)
		dup 4
        ld (hl),CHFULL
        inc hl
		edup

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

; ---- set up game level
setuplvl:
        ld   hl,lvlproc
        ld   a,(menuptr) 
        dec  a              ; get menu item index
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

        GRMODON
        ;call clrscrn
        ld a,COLORCLR 
        call fillvram	; clear screen with black
		call drawfrm	; draw frame
        call ptexts     ; print const text         
        GRMODOFF
        jp txtrinit
        ;ret

; ---- main game cycle
;
gcycle:
		;DISSND

		call drawscr
        call gtimer         

        sblcurst
        cp   sbescap        ; escaping ?
        jp   nz,.gmc1       ; no, continue game

        call doescape       ; run escape process
		call prntend		; print text for end of game 
        xor  a
        ret

.gmc1:
		call gmain          ; main game logic
		or a		
        ret z

        ld  a,(frame_counter)
        inc a
        ld  (frame_counter),a

		jp gcycle           ; continue if not zero


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
		;ret z			; stop if dead

		ld a,(lastkeys)
		ld (prevkeys),a
		xor	a
		ld (lastkeys),a	; reset keys

		call sbcanact	; check if can act
		or a 			
		jp z,gend		; return if zero (no actions)
		
        call kbread
		ld  (lastkeys),a	

		and 255
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
        jp  nz,.sbm1_1      ; go normal way if yes
                            ; if not pressed any more
        call sbnoactn       ; then stand up
        jp gend

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
        ld  c,a
        and KSPACE
        jp  z,gifrtup      ; not space, do next test 

        sblcurst            ; load state
        cp  sbstay          ; is staying ?
        jp  nz,gifrtup      ; do next test if no

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
        call sbhand        ; throw the object being held or do a punch        
        jp   gend
						
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

        sblcurst
        cp  sbsquat     ; is squatting ?
        jp  z,gend      ; yes, stop check, we can't move left-right

		ld a,dirlt
		call gkmoveh
		jp gend
		
gifrt:
		ld a,c
		and KRIGHT
		jp z,gifup

        sblcurst
        cp  sbsquat     ; is squatting ?
        jp  z,gend      ; yes, stop check, we can't move left-right

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
		ld a,c
		cp KESC
		jp nz,gend
		xor a
		ret z			; exit button - end game	

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
		ld a,dirrt
		jp gkupact2		
		
gkupact1:					; prepare code for left direction
		ld a,dirlt
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
		call sbstopst
		ret		
		
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

; ---- game timer
;
gtimer:
		ld	a,(timractv)	; load timer state
		or	a				; and test it
		ret z				; exit if timer is disabled

        ld  hl,curtimef     
        ld  a,(hl)          ; load current timer frame
        or  a
        jp  z,.gt1          ; already zero, reload timer
        dec a
        ld  (hl),a          ; save new value
        ret

.gt1:
        inc a
        ld  (ctimechg),a    ; set flag

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
        
.gtend:
		ld  a,(timractv)	; load timer mode
		cp	TIMRCNTD		; is in countdown mode ?
		jp	nz,.gtdie		; no, just make it dead

		GRMODON

		ld	c,10			; number of iteration
.gte2:		
		push bc

        ld c,16				; LUT size
        ld de,LUTREG
        ld hl,LUTVAL1
		call lutset2
		dup 6
			halt
		edup
		
        ld c,16
        ld de,LUTREG
        ld hl,LUTVAL
		call lutset2
		dup 6
			halt
		edup

		pop	bc
		dec	c
		jp	nz,.gte2

		GRMODOFF
.gtdie:		
        ; --- end of time, make saboteur dead
        xor a
        ld  (sbhealth),a		
		ld  (timractv),a		; disable timer 

        ret

        
