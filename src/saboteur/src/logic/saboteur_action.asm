;
;	this file contains logic of actions saboteur does when fighting  
;

;
;	saboteur is squatting	
;
sbdosquat:
		sbscurst sbsquat	; set new state
		
		sblcursp			; load old sprite
		inc de				; skip color
		ld a,(de)			; old sprite height		
		
		ld hl,sabsqtrt + 1	; new sprite, skip color
		ld b,(hl)			; new sprite height
		cp b
		jp c,sbdsqt2		; if old h < new h
		sub b				; new h (in B) < old h (in A)		
		jp sbdsqt3		
		
sbdsqt2:					; old h < new h
		ld c,a				
		ld a,b				
		sub c						
		
sbdsqt3:
		ld b,a
				
		ld hl,sbctrlb + odcursr
		ld b,(hl)			; load row
		add b				; add to increment		
		ld (hl),a			; save new row

		ld de,sabsqtrt		; set new sprite 
		sbscursp		

        ld de,sbhsqtr
        sbshdspr            ; set head sprite

		sblddir
		cp dirlt
        ret z

		ld hl,sbctrlb + odcursc
		ld a,(hl)			; load column
		inc a
		ld (hl),a
		ret

; ---- test whether is squatting under water
sbtstsqt:
		ld	hl,sbctrlb + odcursc
		ld	d,(hl)					; load screen column into D
		inc	hl
		ld	e,(hl)					; load screen row into E
		inc	e						; head is always 2 rows, so skip empty one above
		call shscradr				; get tile address
		ld	a,(hl)					; get attributes
		and	bwater					; is it water ?
		ret	z						; return if not
		ld	a,HLWATER
		jp hldec

; ----- tests two tiles for a roof attrs
; args: D - column
;       E - row
; result: 	
;       A - 0 if no wall/roof in two tiles starting from specified one
;			
iswalabv:
		push de						; save coordinates
		call shscradr				; get address of tile attrs
		pop	de

		ld	a,(hl)					; load attrs		
		and bkroof					; is anything here ?
		ret	nz

		inc	d						; move to the next column
		call shscradr				; get address of tile attrs
		ld	a,(hl)					; load attrs		
		and bkroof					; is anything here ?
		ret
;
;	saboteur starts kicking
;		
sbstkick:
		ld 	hl,sbctrlb + odcursc
		ld	d,(hl)					; load column into D		
		inc	hl
		ld	e,(hl)					; load row into E
		dec	e						; get tile above head
		inc	d						; test first middle column
		call iswalabv				; is wall above head ?
		or	a
		ret	nz

		sblddir
		cp dirrt
		jp nz,sbstkck1

        ld  de,sbhdkk1r
        sbshdspr
							; kick in right direction
		ld hl,sabkckrb + 1
		jp sbstkcke
		
sbstkck1:		
		sblcursc			; correct X position when kicking in left direction, move sprite to the right
		inc a
		sbscursc
        ld  de,sbhdkk1l
        sbshdspr

		ld hl,sabkcklb + 1
		
sbstkcke:		
		load_de_hl
		sbscursp			; set first sprite		
		xor a	
		sbscursi			; set sprite index
		sbscurst sbkick		; set new state		
		
		sblcursr			; move him up to show the jump
		dec a
		sbscursr
		ret		

; ---- stops kick when it is in the first phase and brings saboteur to initial position
tstpkick:
		sblddir				; load direction
		cp  dirrt			; looking right ?
		jp  z,.stpk			; skip changes if yes

							; looking left, make correction for X
		ld	hl,sbctrlb + odcursc	; load column
		ld	a,(hl)					; into A
		dec	a				; make correction
		ld	(hl),a			; save it back

.stpk:
		ld	hl,sbctrlb + odcursr
		ld	a,(hl)			; load current row
		inc	a				; move him down to stay
		ld	(hl),a			; save it

		jp	sbstopst		; stop and stay
							

;
;	saboteur is kicking
;				
sbdokick:
		ld a,(sabkckrb)		; load number of sprites		
		ld c,a				; save in C
		
		sblcursi			; load sprite index
		inc a
        cp  SBKICKI
        jp  nz,.kick1

        push af		
        call tstokick       ; test if an object is kicked
        pop  af		

		jp .kick2			; continue motion

.kick1:        
		cp c
		jp z,sbdokcke		; last sprite, stop kicking

.kick2:
		sbscursi			; set next sprite index
		
		ld c,a				; save sprite index
		sblddir				; load direction
		cp dirlt
        ld a,c              ; move sprite index back to a
		jp z,sbdokck1		; left direction
		
		ld a,c              ; looking right
		ld hl,sbctrlb + odcursp	
		snewspa sabkckrb			; set address of the next sprite (index in A)

            				; save sprite index
		cp SBKCKI1
		jp z,sbdokck2		; phase change, correct X position

		cp SBKCKI2			; back to initial position
		jp z,sbdokck3		; correct X position
		ret
		
sbdokck1:                   ; looking left
		ld hl,sbctrlb + odcursp	
		snewspa sabkcklb			; set address of the next sprite (index in A)
		
		ld c,a				; save sprite index
		cp SBKCKI1
		jp z,sbdokck4		; correct X position when first phase is changed	
			
		cp SBKCKI2			; back to initial position
		jp z,sbdokck5		; correct X position
		ret

sbdokck2:		
		ld 	hl,sbctrlb + odcursc
		ld	d,(hl)					; load column into D		
		inc	hl
		ld	e,(hl)					; load row into E
		inc	e						; get feet level
		inc	e								
		inc	d						; get right side
		inc	d
		inc	d						
		call iswalabv				; is wall on the right ?
		or	a
		jp 	nz,tstpkick				; stop if yes
		
		sblcursc			; correct X position, move sprite to the left
		dec a
		sbscursc
        ld  de,sbhdkk2r
        sbshdspr
		ret
		
sbdokck3:		
		sblcursc			; correct X position, move sprite to the right
		inc a
		sbscursc
        ld  de,sbhdkk1r
        sbshdspr
		ret

sbdokck4:
		ld 	hl,sbctrlb + odcursc
		ld	d,(hl)					; load column into D		
		inc	hl
		ld	e,(hl)					; load row into E
		inc	e						; get feet level
		inc	e										
		dec	d						; get left side
		dec d
		call iswalabv				; is wall on the left ?
		or	a
		jp nz,tstpkick				; stop if yes

		sblcursc			; correct X position, move sprite to the left on two columns
		dec a
		dec a
		sbscursc
        ld  de,sbhdkk2l
        sbshdspr
		ret

sbdokck5:
		sblcursc			; correct X position, move sprite to the left on two columns
		inc a
		inc a
		sbscursc
        ld  de,sbhdkk1l
        sbshdspr
		ret
		
sbdokcke:	
		sblcursr			; move him down after jump
		inc a
		sbscursr
		call sbstopst		; stop and stay
		
		sblddir				; load direction
		cp dirrt
		ret z        
		;;jp sbdokck2		
                        	; go to initial column
		sblcursc			; correct X position, move sprite to the left
		dec a
		sbscursc
        ret
	

; ---- makes a test whether saboteur is kicking someone
;
tstokick:
		ld hl,(objlist)		; HL - address of the object list
		ld a,h
		or l
		ret z				; address is zero - exit

        sblcursp            ; load saboteur sprite 
        ex  de,hl           ; into HL
		inc hl			    ; skip color
        inc hl				; skip height
        ld c,(hl)		    ; sprite width        

        sblcursr            ; load saboteur's row
        inc a               ; get kick row
        inc a
        ld  b,a             ; save row into B
        sblcursc            ; load saboteur's column
        ld  e,a             ; into E
        sblddir             ; load direction
        cp dirlt
        jp  z,.tst1
        ld  a,c             ; load sprite width into A
        add e               ; calculate right column
        dec a
        ld  e,a             ; save it in E
        
.tst1:
        ld  c,e             ; save feet column in C

		ld hl,(objlist)		; HL - address of the object list
		ld a,(hl)			; load number of objects
		
		inc hl				; set to the first object
		
.loop:
		push hl
		push af
        push bc
		call .tstobj
        pop bc
		pop af
		pop hl
		
		ld de,objsize	
		add hl,de
		
		dec a
		jp nz,.loop
		ret

; args: HL - object control block
;       B  - feet row
;       C  - feet column
.tstobj:        
        push hl         ; save control block        
        push bc

        ldcursr         ; load screen row
        ld  d,a         ; save it in D
        pop bc
        ld  a,b         ; feet row into A
        cp  d           ; compare with object's start row
        jp  c,.endtst   ; exit if start row is greater than feet row - object is under feet

        pop  hl
        push hl
        push bc         ; save row/col

        push de         ; save row
		ldcurspr		; load address of the current sprite into DE				        
		inc de			; skip color
		ld a,(de)		; sprite height
        pop de          ; restore row in D
        add d
        dec a
        pop bc          ; restore saboteur's row/col
        cp  b           ; compare sab's row with obj's bottom row in E
        jp  c,.endtst

        pop  hl
        push hl
        ld  e,c         ; save saboteur's column in E
        ldcursc         ; load screen column
				        
        cp   e			; check for column inside body
        jp   nc,.endtst ; not inside, return
		dup 2		
        inc  a          ; check right border
		edup		
        cp   e			; check for column inside body
        jp   c,.endtst	; not inside, return

.mkdead:
        pop  hl
        
        ld   a,(hl)
        cp   oguard
        jp   nz,.mkd1       ; add scores for guard only
        push hl
        ld   hl,killguad
        call addscore
        pop  hl

.mkd1:
        call setdead
		jp playpnch

.endtst:        
        pop hl
        ret



