;
;	this file contains logic for jumps
;

; ---- switch screen if necessary during jump
;
; result: 
;			A - 1 if can proceeed, 0 - screen has been changed
jmpbordr:
		sblddir
		cp dirrt
		jp z,.jmprt
							; moving left
		sblcursc
		cp LECOLNUM			; is first column
		ret	nz				; return column as result != 0

		call goscrnlt		; switch screen
		or a
		jp z,.jmpret1		; screen not changed - no more way, return NON-zero to let him stop

							; screen has been changed, setup new position
		ld a,LSCOLNUMJ 		; index of the first column from right side
		sbscursc
		xor	a
		ret
				
.jmprt:						; moving right
		sblcursc
		cp ECOLNUMJ			; is last column
		ret	nz				; return column as result != 0

		call goscrnrt		; switch screen
		or a
		jp z,.jmpret1		; screen not changed - no more way, return NON-zero to let him stop

		ld a,SCOLNUM 		; index of the first column 
		sbscursc
		xor	a
		ret

.jmpret1:
		inc	a
		ret

; ---- checks if it is possible to jump
;
; args:     A - row to check
; result: 
;			A - 0 if no space to jump
;
canjmp:
		push af 			; save row
		
		sblddir
		cp dirrt
		jp z,canjmp1
 							; moving left
		pop af
		ld e,a				; save Y in E
		sblcursc			
		dec a				; check column on the left
		ld d,a				; save X in D		
		call shscradr		; get top left position
		jp canjmp5
		
canjmp1:					; moving right
 		sblcursc			
		add SBWI			; check right position for sprite in stay mode
		ld d,a				; save column number
		sblcurst			; load current state
		cp	sbstay			; decrease right column if not staying
		jp	z,canjmp2
		dec	d

canjmp2:		
		pop af
		ld e,a				; save row number
		call shscradr		; get top right position 
		
canjmp5:
		ld a,(hl)
		and bwall
		jp nz,canjmpn		; wall, no way
		
		dup 3
			ld de,ROWWIDB
			add hl,de			; Y = Y + 1
			ld a,(hl)
			and bwall
			jp nz,canjmpn		; wall, no way
		edup

		ld a,1				; yes, can jump
		ret
		
canjmpn:
		xor a
		ret

canjmpn2:
		pop af
		xor a
		ret
		
		
; ---- starts long jump
; 
sbstjmp:		
		sblcursr			; load row
		dec a
		dec a
		call canjmp
		or a
		ret z
		
		sbscurst sbjump 
		sblddir
		cp dirlt
		jp z,_sbstj1
        ld  de,sbhjmp1r
        sbshdspr            ; set head sprite
		ld de,sabjmpr1
		jp _sbstj2

_sbstj1:
        ld  de,sbhjmp1l
        sbshdspr            ; set head sprite
		ld de,sabjmpl1

_sbstj2:
		sbscursp
		xor a
		sbscursi
		call sbdecrow
		ret
		
; ---- starts short jump
; 		
sbstshjp:	
		sblcursr			; load row
		dec a
		call canjmp
		or a
		ret z
		
		sbscurst sbshjmp
		xor a
		sbscursi

        sblddir
        cp   a,dirlt
        jp   z,.sbsj1
		ld   de,sabjmpr1
		sbscursp
        ld   de,sbhjmp1r
        sbshdspr
        ret

.sbsj1:        
		ld de,sabjmpl1
		sbscursp
        ld   de,sbhjmp1l
        sbshdspr
		ret

; ---- do short jump
; 				
sbdoshjp:
		ld a,SBSJPSPN - 2
		ld (_sbdjp2_ + 1),a
		ld a,SBSJPSPN - 1
		ld (_sbdjp1_ + 1),a		

		sblddir
		cp dirlt
		jp z,_sbdoshj
		ld hl,sabjpsrb + 1
		ld (sbdojp4 + 1),hl
		jp sbdojp

_sbdoshj:
		ld hl,sabjpslb + 1
		ld (sbdojp4 + 1),hl
		jp sbdojp

; ---- do long jump
; 						
sblongjp:
		ld a,SBJPSPN - 2
		ld (_sbdjp2_ + 1),a
		ld a,SBJPSPN - 1
		ld (_sbdjp1_ + 1),a

		sblddir
		cp dirlt
		jp z,_sblongj
		ld hl,sabjmprb + 1
		ld (sbdojp4 + 1),hl
		jp sbdojp

_sblongj:
		ld hl,sabjmplb + 1
		ld (sbdojp4 + 1),hl
		jp sbdojp
		
; ---- do jump
; 				
sbdojp:
		sblcursi			; load sprite index
		or a
		jp z,_sbdjp3_		; 0-th sprite, just started jumping, do not check next column 

_sbdjp2_:		
		cp (SBJPSPN - 2)    ; check index of the current sprite 
		jp z,sbdojpe		; stop jump if this is the previous sprite before the last one


_sbdjp1_:		
		cp (SBJPSPN - 1)	; check index of the current sprite 
		jp z,_sbjstay		; jump has been finished, stay and be ready

							; otherwise do check if we can move forward
		call jmpbordr		; need to switch screen ?
		or	a
		ret	z

		sblcursr			; load current row
		call canjmp
		or a
		jp z,sbdojpe

_sbdjp3_:
		sblcursi			; load sprite index
		inc a 				; increase sprite index		
		sbscursi			; save index of the next sprite 
						
sbdojp4:		
		ld hl,sabjmprb + 1	; save pointer to first sprite in HL
		ld b,0
		ld c,a				; save current sprite index in C

		add hl,bc
		add hl,bc
		load_de_hl			; get address of the current sprite in DE
		sbscursp			; save new sprite address

		or	a
		ret z				; nothing more for 0-th sprite

		cp 1				; do column change only 
		jp nz,sbdojp5		; if sprite index > 1
		jp sbjrdec
						    ; keep old column for the first small sprite 
		
sbdojp5:		
		sblddir
		cp dirrt
		jp z,sbdojp9
		jp  sbdeccol		; do move left
		
sbdojp9:
		jp  sbinccol		; do move right
			
sbdojpe:
		jp  sbstopjp

_sbjstay:		
		jp  sbstopst		; jump finished, stop and stay


; ---- dec row when starts jumping, change head sprite
;				
sbjrdec:
        sblddir             ; load direction
        cp  dirrt
        jp  z,.sbjr1
        ld   de,sbhjmp2l
        sbshdspr
        jp sbdecrow
.sbjr1: 
        ld   de,sbhjmp2r
        sbshdspr
        jp sbdecrow

; ---- stop jump, check the place around and find row and column to land
;				
;
sbstopjp:
		call jmpbordr		; need to switch screen ?
		or	a
		ret	z				; return if yes

		sblddir

		cp dirrt
		jp z,_sbstpjr

_sbstpj1:
        ld   de,sbhjmp1l
        sbshdspr
		call sblandlh
		call sblandv
		ret

_sbstpjr:
        ld   de,sbhjmp1r
        sbshdspr
		call sblandrh
		call sblandv
		ret

; ---- finds place to land in horizontal direction to the right
;
sblandrh:
		sblcursc		; load column
		add SBJMPWI		; next column on the right
		ld d,a			; save column in D
		sblcursr		; load row
		ld e,a			; save row in E
		call shscradr	; get position (X,Y) in HL
		push hl			; save address
		ld bc,ROWWIDB
		dup 3
			ld a,(hl)		; read attributes
			and bwall		; is wall ?
			jp nz,.sble		; yes, no move 
			add hl,bc		; Y = Y + 1
		edup

		; current position is the one before the last one
		; so we'll need to move yet one time for the last sprite
		; so we need to test position X + 2

		;sblcursc			; test next column, since staying sprite is wider
		;inc	a


		pop hl				; restore (X,Y)
		push hl
		ld bc,COLWIDB
		add hl,bc			; X = X + 1
							; start with (X + 1,Y)
		ld bc,ROWWIDB
		dup 3
			ld a,(hl)		; read attributes
			and bwall		; is wall ?
			jp nz,.sble2	; yes, no move 
			add hl,bc		; Y = Y + 1
		edup

							; make movement for the last sprite
		sblcursc			; load column
		inc a				; move right, it's free
		sbscursc			; save column

		pop bc				; clear stack
		ret

.sble:
							; there is a wall immediately on the right
							; so move left since the last sprite is wider
		sblcursc			; load column
		dec a				
		sbscursc			; save column

		pop bc				; clear stack
		ret

.sble2:
		pop bc				; clear stack
		ret


; ---- finds place to land in horizontal direction to the left
;
sblandlh:
		sblcursc		; load column
		dec a			; test column on the left side before (X - 1)
		ld d,a			; save column in D

		sblcursr		; load row
		ld e,a			; save row in E
		call shscradr	; get position (X - 2,Y) in HL

		ld bc,ROWWIDB
		dup 3
			ld a,(hl)		; read attributes
			and bwall		; is wall ?
			jp nz,_slndlhe	; yes, no move 
			add hl,bc		; Y = Y + 1
		edup
							; current position is the one before the last one
							; so we'll need to move yet one time for the last sprite
		sblcursc			; load column
		dec a				; move left, it's free
		sbscursc			; save column

_slndlhe:
		;pop hl				; clear stack
		ret
		

		
; ---- finds place to land in vertical direction to the right
;
sblandv:
		sblcursc
		ld d,a			; save column in D

		sblcursr		; load row
		add  SBJMPHI		; row under feet
		ld e,a			; save row in E
		call shscradr	; get position (X,Y) in HL

		push hl				

		dup 4
			ld bc,COLWIDB
			dup 3
				ld a,(hl)
				and bkroof	
				jp nz,_stlnd1	; wall, land on this row
				add hl,bc		; next column
			edup
			sblcursr
			inc a				; inc row		
			sbscursr			; save row
			pop hl				; restore first column
			ld bc,ROWWIDB		
			add hl,bc			; move to the next row
			push hl
		edup

		sblcursr
		sub 4				; no wall found, keep current coordinates	
		sbscursr			; save row

		jp _stlnd5				

_stlnd1:
		sblcursr		; load current row
		sub (SBHI - SBJMPHI)	; dec row to let him stay
		sbscursr

_stlnd5:
		pop bc 					; clear stack

		sblddir
		cp dirlt
		jp z,_stlnd3			; leave current column for left direction

		ld de,sabjmpr1
		jp _stlnd4

_stlnd3:
		ld de,sabjmpl1

_stlnd4:		
		sbscursp

		sblcurst				; load current state
		cp sbshjmp
		jp z,_stlnd2

		ld a,SBJPSPN - 1		; number of sprites for long jump
		sbscursi				; set last sprite index
		ret

_stlnd2:
		ld a,SBSJPSPN - 1		; number of sprites for short jump
		sbscursi				; set last sprite index
		ret
