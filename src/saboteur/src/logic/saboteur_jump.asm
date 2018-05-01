;
;	this file contains logic for jumps
;

; ---- checks if it is possible to jump
;
; args:
;			A - row to check
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
		pop af
		call scadrrt		; get top right position 
		
canjmp5:
		push hl		
		ldsprt
		pop hl
		and bwall
		jp nz,canjmpn		; wall, no way
		
		ld de,COLNUM		
		add hl,de			; Y = Y + 1
		ldsprt
		and bwall
		jp nz,canjmpn		; wall, no way
		
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
		ld de,sabjmpr1
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
		ld a,SBSJPSPN - 1
		ld (sbdojp1+1),a
		ld hl,sabjpshb
		ld (sbdojp + 1),hl
		jp sbdojp

; ---- do long jump
; 						
sblongjp:
		ld a,SBJPSPN - 1
		ld (sbdojp1+1),a
		ld hl,sabjmprb
		ld (sbdojp + 1),hl
		jp sbdojp
		
; ---- do jump
; 				
sbdojp:
		ld hl,sabjmprb
		ld c,(hl)			; load number of sprites
		sblcursi			; load sprite index
		inc a 
		cp c
		jp z,sbdojpe

		sbscursi
		
		cp 1
		jp nz,sbdojp1
		call sbdecrow
		jp sbdojp4
				
sbdojp1:
		cp (SBJPSPN - 1)
		jp nz,sbdojp3
		call sbincrow
		jp sbdojp4
		
sbdojp3:
		sblcursr
		
sbdojp4:		
		call canjmp
		or a
		jp z,sbdojpe

		sblcursi
		
		ld hl,sabjmprb + 1
		ld b,0
		ld c,a
		add hl,bc
		add hl,bc
		load_de_hl
		sbscursp
		
		sblddir
		cp dirrt
		jp z,sbdojp9
		call sbdeccol
		ret
		
sbdojp9:
		call sbinccol
		ret
		
sbdojpe:
		call sbstopjp
		ret
				
; ---- stop jump
;		
;
		macro SBSTJTST exitlabl
		push hl
		ldsprt
		pop hl
		and bwall
		jp nz,exitlabl		; wall, no way
		inc hl
		endm
		
sbstopjp:		
		call sbcurrh		; load height in rows
		ld d,a
		sblcursr
		inc a
		push af
		call scadrlt		; get bottom left position under feet		
		
		SBSTJTST sbstopj4
		SBSTJTST sbstopj4
		SBSTJTST sbstopj4
		SBSTJTST sbstopj4
		
		jp sbstopj8			; no floor - fall down
		
sbstopj4:		
		call sbstopst
		
		call sbcurrh		; load height in rows
		ld d,a
		pop af				; restore bottom row		
		sub d	
		dec a
		sbscursr
		ret
		
sbstopj8:		
		pop af
		call sbstopst
		ret
						
		