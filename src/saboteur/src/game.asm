; ----- text ram init for constant places like timer
;
txtrinit:
        ld hl,TRAM + TSTARTC + 22 + 64*(TSTARTR + 10)
        ld (hl),CHFULL
        inc hl
        ld (hl),CHFULL

        ld hl,TRAM + TSTARTC + 5 + 64*(TSTARTR + 9)
        ld  a,15
        ld  c,CHBOTM
        call filtline
        ret

; ----- print text strings
;
ptexts:
        ld  b,NUMFGC
        ld  c,NUMBKC

        ld de,PAYSCRA
        ld hl,paystr
        call prntstr
        
        ret 

; ---- init main game screen
ginitscr:
        call clrtscr

        rsctrldata
        rstrmap
        rsobjmap

        ld  hl,sbctrlb
        ld  de,sbheadr
        shdspr 

        GRMODON
        ld a,COLORCLR 
        call fillvram	; clear screen with black
		call drawfrm	; draw frame
        call ptexts     ; print const text         
        GRMODOFF
        call txtrinit
        ret

; ---- main game cycle
;
gcycle:
		DISSND

		call drawscr

		call sbstsnd

        call gtimer         

        sblcurst
        cp   sbescap        ; escaping ?
        jp   nz,.gmc1       ; no, continue game

        call doescape       ; run escape process
        xor  a
        ret

.gmc1:
		call gmain          ; main game logic
		or a		
        ret z
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
				
		call sbcanact	; check if can act
		or a 			
		jp z,gend		; return if zero (no actions)
		
        call kbread
		and 255
		jp nz,gifspace
		call sbnoactn
		jp gend
				
gifspace:       
        ld  c,a
        and KSPACE
        jp  z,gifrtup      ; not space, do text test 

                            ; action
        ld   a,(trtype)  
        or   a          
        jp   z,.gifsp1      ; no triggers, continue
        and  trgmanl
        jp   z,.gifsp1      ; trigger is not manual, continue
        call trigrun        ; run manual trigger
        jp   gend

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
		call sbstjmp		; start jumping
		ret

gkupact4:
		cp sbstay
		jp nz,gkupact5		; not staying, check another state
		call sbstshjp		; start short jump
		ret
		
gkupact5:
		cp sbladr
		jp nz,gkupact22		; if not moving on the ladder, process right direction 		
		call gkup			; else process up if yes
		ret
		
gkupact22:					; process right button in case of invalid key for current state
		ld a,dirrt			; direction is set on entry
		call gkmoveh
		ret
				
			
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
		cp sbsquat		
		call nz,sbdosquat	; squat if is not squatting already
		
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
		call sbstmove
		ret
		
gkrstmv:
		cp sbstmov			; moving started ?
		jp nz,gkrmove		; no, check further state
		ld a,sbmove			; state state to moving
		sbsetst
		call sbdomove		; yes, continue moving
		ret 

gkrmove:
		cp sbmove
		call z,sbdomove		; continue movement
		
		ret
		
; ---- end of gkmoveh

; ---- game timer
;
gtimer:
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
        ; --- end of time, make saboteur dead
        xor a
        ld  (sbhealth),a
        ret

        
