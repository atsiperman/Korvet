
; ----- updates state of all the objects on the screen
;       updates tile map according to sprites locations
;
updobjs:
		ld hl,sbctrlb
		call updobj

		ld hl,(objlist)		; HL - address of the object list
		ld a,h
		or l
		ret z				; address is zero - exit

		ld a,(hl)			; load number of objects
		
		inc hl				; set to the first object
        
updobjs1:		
		push hl
		push af
		call updobj
		pop af
		pop hl
		
		ld bc,objsize	
		add hl,bc
		
		dec a
		jp nz,updobjs1
		
		ret

; ----- updates state of all the background masked objects on the screen
;       updates tile map according to objects locations
;
updbkmob:
		ld hl,(bmobjlst)		; HL - address of the masked objects list
        jp updmobjs.updmo

; ----- updates state of all the masked objects on the screen
;       updates tile map according to objects locations
;
updmobjs:
		ld hl,(mobjlst)		; HL - address of the masked objects list

.updmo:
		ld a,h
		or l
		ret z				; address is zero - exit

		ld a,(hl)			; load number of objects
		
		inc hl				; set to the first object
        
.updmo1:		
		push hl
		push af		
		call utlmmobj
		pop af
		pop hl
		
		ld bc,mobjsz	
		add hl,bc
		
		dec a
		jp nz,.updmo1
		
		ret

; ----- updates state of the object provided
; args:
;		 HL - address of the object's control block 
;
updobj:
		push hl				; save control block address		
		
		call rdsprpos		; load address of the current position into DE	
		pop hl
		
		push hl
		scurp		
		pop hl

		push hl
		ldcurspr			; load address of the current sprite
		pop hl				; load control block address

		call updtilem

		ret
		
; ----  copies current state to the previous
; args:
;		 HL - address of the object's control block
;
copystat:	
		;push hl

		; ldcurp				; load address of the current position		
		
		; pop hl	
		; push hl
		; 					; save to previous position		
		; sprevp
		
		; pop hl

		push hl		
		ldcurspr			; load current sprite address
		pop hl
		sprvspr				; save as previous sprite address
		ret

; ----	reads address of the object in the screen buffer
; args: 
;		HL - address of the object's control block
;
; result:
;		DE - address(position) in the screen buffer
;		
rdsprpos:
		push hl
		ldcursr			; load current row index
		add a,a			; make address displacement
		ld c,a			
		ld b,0
		ld hl,bufrows
		add hl,bc		; pointer to row address
		load_de_hl		; save row address in DE
		pop hl
		
		ldcursc 		; load column index into A
		ld c,a			; save column in C

		rla				
		rla
		rla				; multipy by 8
		ld l,a			; save it in L

		xor a
		ld h,a			; zero to H
						; L = column index * 8
						;
		ld b,a			; B - 0
						; C - column index
		
		add hl,bc		; add column index to get column offset in byte
		add hl,bc		; add column index to get column offset in byte
		add hl,bc		; add column index to get column offset in byte
		add hl,bc		; add column index to get column offset in byte

		add hl,de		; column address in HL
		
		ex de,hl
		
		ret
		

; ----	draws object
; args: HL - address of the object's control block
;
drawobj:        
		push hl
		ldcurp				; load current position in screen buffer to DE
		pop hl				; restore control block address

        push de				; save pointer to screen buffer
        push hl
        ohdcorct .draw1 
        pop  hl
        pop de				; restore pointer to screen buffer

                            ; draw head sprite
		push hl				; save control block
		push de				; save pointer to screen buffer
        ldhdspr 			; load address of the head sprite into DE				
		pop  hl				; restore position in screen buffer
        push hl             ; save it again for the body sprite
		call putspr			; put sprite to screen buffer
        pop  hl				; restore position in screen buffer
        ld   bc,ROWWIDB * 2 ; move pointer
        add  hl,bc          ; two lines down
        ex   de,hl          ; save it in DE
        pop  hl             ; restore control block
        jp   .draw2

.draw1:        
        pop  hl             ; restore control block
        pop  de				; restore pointer to screen buffer

.draw2:
		push hl				; save control block
		push de				; save pointer to screen buffer

		push hl
		ldcurspr			; load address of the current sprite into DE		
		pop hl
		
		pop hl				; restore position in screen buffer
		call putspr			; put sprite to screen buffer

		pop hl				; load original sprite address
				
		call copystat
		
		ret
