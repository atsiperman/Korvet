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
		add SBWI			; check right position for sprite in stay mode
		ld d,a				; save column number
		pop af
		ld e,a				; save row number
		call shscradr		; get top right position 
		
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
		ld b,a
		push bc
		
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

		pop bc				; restore current sprite index and number of sprites
		ld a,b			
		cp 2				; skip column change for first jump
		ret z
		cp c			
		ret z				; skip column change for last sprite
		
		sblddir
		cp dirrt
		jp z,sbdojp9
		call sbdeccol
		ret
		
sbdojp9:
		call sbinccol
		ret
		
sbdojpe:
		pop bc
		call sbstopjp
		ret
				
; ---- stop jump
;		
;		
sbstopjp:		
		sbcurrh				; load height in rows
		ld d,a
		sblcursr
		inc a
		push af
		call scadrlt		; get bottom left position under feet		
		
		ld c,4
		
sbstopj2:		
		push hl
		ldsprt
		pop hl
		and bwall
		jp nz,sbstopj4		; wall, no way
		inc hl
		dec c
		jp nz,sbstopj2
							; no floor - fall down
		pop af
		call sbstopst
		ret
		
sbstopj4:		
		call sbstopst
		
		sbcurrh				; load height in rows
		ld d,a
		pop af				; restore bottom row		
		sub d	
		dec a
		sbscursr
		ret
						
		