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

		sblddir
		cp dirlt
		jp nz,sbdsqt4

		ret
		
sbdsqt4:
		ld hl,sbctrlb + odcursc
		ld a,(hl)			; load column
		inc a
		ld (hl),a
		
		ret

;
;	saboteur starts kicking
;		
sbstkick:
		sblddir
		cp dirrt
		jp nz,sbstkck1
							; kick in right direction
		ld hl,sabkckrb + 1
		jp sbstkcke
		
sbstkck1:		
		sblcursc			; correct X position when kicking in left direction, move sprite to the right
		inc a
		sbscursc
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

.kick1:        
		cp c
		jp z,sbdokcke		; last sprite, stop kicking

		sbscursi			; set next sprite index
		
		ld c,a				; save sprite index
		sblddir				; load direction
		cp dirrt
		jp nz,sbdokck1		; left direction
		
		ld a,c
		ld hl,sbctrlb + odcursp	
		snewspa sabkckrb			; set address of the next sprite (index in A)

		ld c,a				; save sprite index
		cp SBKCKI2			; back to initial position
		jp z,sbdokck3		; correct X position
		cp SBKCKI1
		jp z,sbdokck2		; phase change, correct X position
		ret
		
sbdokck1:
		ld a,c
		ld hl,sbctrlb + odcursp	
		snewspa sabkcklb			; set address of the next sprite (index in A)
		
		ld c,a				; save sprite index
		cp SBKCKI1
		jp z,sbdokck4		; correct X position when first phase is changed		
		cp SBKCKI2			; back to initial position
		jp z,sbdokck5		; correct X position
		ret

sbdokck2:		
		sblcursc			; correct X position, move sprite to the left
		dec a
		sbscursc
		ret
		
sbdokck3:		
		sblcursc			; correct X position, move sprite to the right
		inc a
		sbscursc
		ret

sbdokck4:
		sblcursc			; correct X position, move sprite to the left on two columns
		dec a
		dec a
		sbscursc
		ret

sbdokck5:
		sblcursc			; correct X position, move sprite to the left on two columns
		inc a
		inc a
		sbscursc
		ret
		
sbdokcke:	
		sblcursr			; move him down after jump
		inc a
		sbscursr
		call sbstopst		; stop and stay
		
		sblddir				; load direction
		cp dirrt
		ret z
		jp sbdokck2			; go to initial column
	

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
        inc hl
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
        inc  a          ; check for column inside body
        cp   e
        jp   z,.mkdead
        inc  a          ; check for column inside body
        cp   e
        jp   nz,.endtst

.mkdead:
        pop  hl
        call setdead
        ret

.endtst:        
        pop hl
        ret



