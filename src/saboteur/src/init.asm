
; ----- initializes data
;

        
sabinit:
        call cpmirtab
        
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
		
