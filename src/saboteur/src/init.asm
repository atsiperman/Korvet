
; ----- initializes data
;
        
sabinit:
        ; copy saboteur sprites into upper memory block
        ld  hl,_sabjmpr1
        ld  de,sabjmpr1
        ld  bc,_sabdead.sbdead - _sabjmpr1
        call copymem                        

        ; copy mirror table
        call cpmirtab

        ; mirror sprites 
        ld  hl,dogspmr1
        ld  de,dogspml1
		call mirrspr

        ld  hl,dogspmr2
        ld  de,dogspml2
		call mirrspr

        ld  hl,dogspmr3
        ld  de,dogspml3
		call mirrspr

        ld  hl,dogspmr4
        ld  de,dogspml4
		call mirrspr

        ld  hl,sabspmr1
        ld  de,sabspml1
		call mirrspr

        ld  hl,sabspmr2
        ld  de,sabspml2
		call mirrspr

        ld  hl,sabspmr3
        ld  de,sabspml3
		call mirrspr

        ld  hl,sabspmr4
        ld  de,sabspml4
		call mirrspr

        ld  hl,sabsprt
        ld  de,sabsplt
		call mirrspr

        ld  hl,sabjmpr1
        ld  de,sabjmpl1
		call mirrspr

        ld  hl,sabjmpr2
        ld  de,sabjmpl2
		call mirrspr

        ld  hl,sabkckr1
        ld  de,sabkckl1
		call mirrspr

        ld  hl,sabkckr2
        ld  de,sabkckl2               
		call mirrspr

		ret
		
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
