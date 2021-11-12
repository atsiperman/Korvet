;
;	this file contains logic for jumps
;

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
		
		sblcursc
		cp SCOLNUM			; is first column
		jp nz,canjmp1_
		call goscrnlt		; switch screen
		or a
		jp z,canjmpn2		; return if screen not changed
		ld a,ECOLNUM 		; index of the first column 
		sbscursc
		
canjmp1_:		
		pop af
		call scadrlt		; get top left position
		jp canjmp5
		
canjmp1:		
		sblcursc
		cp ECOLNUM			; is last column
		jp nz,canjmp2
		call goscrnrt		; switch screen
		or a
		jp z,canjmpn2		; return if screen not changed
		ld a,SCOLNUM 		; index of the first column 
		sbscursc
		
canjmp2:	
		add SBWI			; check right position for sprite in stay mode
		ld d,a				; save column number
		pop af
		ld e,a				; save row number
		call shscradr		; get top right position 
		
canjmp5:
		ld a,(hl)
		and bwall
		jp nz,canjmpn		; wall, no way
		
		dup 2
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
		ld de,sabjmpr1
		jp _sbstj2

_sbstj1:
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
		ld de,sabjmpr1
		sbscursp
		xor a
		sbscursi
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
		cp (SBJPSPN - 1)	; check index of the next sprite 
		jp z,_sbjstay		; jump has been finished, stay and be ready

							; otherwise do check if we can move forward
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
;		push bc				; save current sprite index on stack

		add hl,bc
		add hl,bc
		load_de_hl			; get address of the current sprite in DE
		sbscursp			; save new sprite address

		;sblcursi
		cp 1
		jp nz,sbdojp5
		call sbdecrow
		ret					; keep old column for the first small sprite 

		; cp (SBJPSPN - 1)			
		; ret z				; skip column change for last sprite
		
sbdojp5:		
		sblddir
		cp dirrt
		jp z,sbdojp9
		call sbdeccol		; do move left
		ret
		
sbdojp9:
		call sbinccol		; do move right
		ret
			
sbdojpe:
		call sbstopjp
		ret

_sbjstay:		
		call sbstopst		; jump finished, stop and stay
		ret	


; ---- stop jump, check the place around and find row and column to land
;				
;
sbstopjp:
		sblddir

		cp dirrt
		jp z,_sbstpjr


_sbstpj1:
		ret

_sbstpjr:
		call sbstjrh
		call sbstjrv
		ret

; ---- finds place to land in horizontal direction to the right
;
sbstjrh:
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
			jp nz,_sbstpjr1	; yes, no move 
			add hl,bc		; Y = Y + 1
		edup

		sblcursc			; load column
		inc a				; move right, it's free
		sbscursc			; save column

		pop hl				; restore (X,Y)
		push hl
		ld bc,COLWIDB		
		add hl,bc			; X = X + 1
							; start with (X + 1,Y)
		dup 3
			ld a,(hl)		; read attributes
			and bwall		; is wall ?
			jp nz,_sbstpjr1	; yes, no move 
			add hl,bc		; Y = Y + 1
		edup

		sblcursc			; load column
		inc a				; move right, it's free
		sbscursc			; save column

_sbstpjr1:
		pop bc				; clear stack
		ret
		
; ---- finds place to land in vertical direction to the right
;
sbstjrv:
		sblcursc
		ld d,a			; save column in D
		sblcursr		; load row
		add SBJMPHI		; row under feet
		ld e,a			; save row in E
		call shscradr	; get position (X,Y) in HL

		push hl				

		dup 4
			ld bc,COLWIDB
			dup 3
				ld a,(hl)
				and bwall	
				jp nz,_stjrv1	; wall, land on this row
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

_stjrv1:
		sblcursr
		sub (SBHI - SBJMPHI)	; dec row to let him stay
		sbscursr

		sblcursc
		dec a					; dec column, staying sprite is wider
		sbscursc

		ld a,SBJPSPN - 1	
		sbscursi				; set last sprite index

		ld de,sabjmpr1
		sbscursp

		pop bc 					; clear stack
		ret

