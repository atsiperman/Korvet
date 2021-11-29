		
; ---- stop and stay
;
sbstopst:
		sblddir
		cp dirrt
		jp nz,sbstpst1
		ld de, sabsprt
		sbscursp
		jp sbstpste
		
sbstpst1:
		ld de,sabsplt
		sbscursp
		
sbstpste:
		sbscurst sbstay
		ret

; ---- checks if saboteur can do any actions
;
; result: 
;		A - 0 no actions can be done (saboteur is currently falling, jumping etc.)
;		
sbcanact:
		call chkfalng
		or a
		ret z			; exit if is falling down

		sblcurst		
		cp sbkick		; if is kicking		
		jp nz,sbcnact1
		call sbdokick	; continue kicking
		jp sbcnactn
		
sbcnact1:
		cp sbjump		; jumping
		jp nz,sbcnact2
		call sblongjp
		jp sbcnactn
		
sbcnact2:
		cp sbshjmp		; short jump
		jp nz, sbcnact3
		call sbdoshjp
		jp sbcnactn

sbcnact3:		
		cp sbladr
		jp z,sbcnacty
		;;cp sbstay
		;;jp nz,sbcnacty	; not staying, should not fall since is not falling already

		;;jp sbcnacty

		call sbcanfal	; check if he must fall down	
		or a
		jp z,sbcnacty
						; start falling down
		ld hl,sbctrlb
		call sbstfall
		jp sbcnactn

sbcnacty:
		or 1			; exit with non zero to allow actions
		ret
		
sbcnactn:		
		xor a
		ret
		
; ---- logic when no button pressed
;
sbnoactn:
		ld hl,sbctrlb
		push hl
		
		ldstate
		pop hl
		
		cp sbstay
		jp nz,sbnoact1
							; player is staying, no action									
		call hlinc			; update health 
		ret

sbnoact1:		
		cp sbstmov			; check if just started moving
		jp nz,_sbnoact1		; no

							; yes, need to do at least one step
		sblddir				; load current direction
		ld c,a
		call sbdomove		; do at least one movement since it was allowed

_sbnoact1:
		cp sbladr			
		jp nz,sbnoact2
							; player is on the ladder
		call sbstplna		
		ret
		
sbnoact2:		

		sblddir
		cp dirrt
		jp nz,sbnoact5
							; was moving right
		ldstate	
		cp sbsquat
		jp nz,sbnoact4
							; player is squatting, now stand up									
							
							; player is looking right, decrease column
		ld hl,sbctrlb + odcursc	
		ld a,(hl)			; load column
		dec a
		ld (hl),a
		
sbnoact4:							
		ld de,sabsprt 
		sbscursp			; stop, look at right		
		jp sbststop
		
sbnoact5:
							; was moving left
		ld de,sabsplt
		sbscursp			; stop, look at left

sbststop:
		sbscurst sbstay		; is staying now
		
		sblprvsp		
		ldsprht
		push af				; save prev height
		
		sblcursp			; load cur sprite 
		ldsprht				; current height
		pop bc
		sub b				; current is always bigger than previous
		ld c,a				; save the difference
		sblcursr
		sub c				; increase height 
		sbscursr
		ret
		
sbnoacte:		
		pop hl		
		ret
		

; ---- check if can move on the ladder up and stop if not
;		
sbstplna:			
		ld hl,sbctrlb
		ld c,dirup
		call cangolad
		or a
		ret nz
		
		sblddir
		call sbleavld		; if yes - stop and stay
		call sbstopst
		ret

; ---- saboteur throws an object
;
sbthrow:
        ld   a,(sbholds)
        or   a
        ret  z                          ; nothing is held, return

        ld   hl,othrwlst
        dec  a                          ; get image index from object type
        ld   c,a
        ld   b,0
        add  hl,bc
        add  hl,bc                      ; pointer to image address
        load_de_hl                      ; read image address
        ex   de,hl                      ; into HL

        ld   (othrown + odflimg),hl     ; save image address
        sblcursc
        ld   c,a                        ; save column in C
        inc  c                          ; make correctin for if throwing left

        sblddir                         ; load current direction into A
        ld   (othrown),a                ; save direction of an object to fly
        cp   dirlt
        jp   z,.sbthr1

        inc  c                          ; throw right

.sbthr1:       
        ld   a,c
        ld   de,othrown + odfcoln        
        ld   (de),a                     ; save colnum

        sblcursr
        inc  a
        inc  de                         ; move to rownum
        ld   (de),a

.sbthre:
        xor  a
        ld   (sbholds),a    ; object is thrown
        inc  a
        ld   (sbhldch),a    ; redraw object

        jp   movthrn        ; check next column to 



; ---- moving thrown object
;
movthrn:
        ld   a,(othrown)
        or   a
        ret  z                      ; 0 direction means no object is moving

        ld   d,a                    ; save direction in D

        ld   a,(othrown + odfcoln)  ; load colnum
        ld   c,a                    ; save in C

        ld   a,d                    ; restore direction in A
        cp   dirrt
        jp   z,.mvthr1

        ld   a,c                    ; moving left
        cp   2                      ; last column on the left, stop moving
        jp   c,.mvthre

        dec  a
        dec  a
        ld   (othrown + odfcoln),a
        ret

.mvthr1:
        ld   a,c
        cp   COLNUM - 2
        jp   nc,.mvthre

        inc  a
        inc  a
        ld   (othrown + odfcoln),a
        ret

.mvthre:
        xor  a
        ld   (othrown),a            ; movement is finished
        ret
