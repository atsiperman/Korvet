        macro savedata startptr, endptr, dest
        ld  hl,startptr
        ld  de,dest
        ld  bc,endptr - startptr
        call copymem
        endm

        macro rstordata startptr, endptr, dest
        ld  hl,dest
        ld  de,startptr
        ld  bc,endptr - startptr
        call copymem
        endm

        macro cpctrldata
        savedata cdatast, cdataend, ctrldata
        endm

        macro rsctrldata
        rstordata cdatast, cdataend, ctrldata
        endm

        macro cptrmap
        savedata trmapst, trmapend, trmdata
        endm

        macro rstrmap
        rstordata trmapst, trmapend, trmdata
        endm

        macro cpobjmap
        savedata objmst, objmend, objmdata
        endm

        macro rsobjmap
        rstordata objmst, objmend, objmdata
        endm


; ----- initializes data
;
        
sabinit:
        ; copy saboteur sprites into upper memory block
        ld  hl,_sabjmpr1
        ld  de,sabjmpr1
        ld  bc,_sabdead.sbdead - _sabjmpr1
        call copymem                        

        ld  hl,_sabpnch
        ld  de,sabpnchr
        ld  bc,_sabpnch.endpnch - _sabpnch
        call copymem                        

        cpctrldata
        cptrmap
        cpobjmap

        call .initsbsp
        call .initgdsp
        ret

.initsbsp:
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

        ld  hl,sabpnchr
        ld  de,sabpnchl               
		call mirrspr

        ret

.initgdsp:
        ; guard sprites

        ; ---- guard stays sprite/left 
        ld  hl,sabsplt
        ld  de,gdsplt
        ld  bc,sabspmr1 - sabsprt
        call copymem

        ld  hl,gdhead
        ld  de,gdsplt + SPRHLEN
        ld  bc,gdhead.heade - gdhead
        call copymem

        ld  hl,gdsplt
        ld  de,gdsprt               
		call mirrspr
        ; ---- guard stays sprite/left --- 

        ; ---- guard punch sprite/left 
        ld  hl,sabpnchr
        ld  de,gdpnchr
        ld  bc,_sabpnch.endpnch - _sabpnch
        call copymem

        ld  hl,gdhdpnch
        ld  de,gdpnchr + SPRHLEN
        ld  bc,gdhdpnch.heade - gdhdpnch
        call copymem

        ld  hl,gdpnchr
        ld  de,gdpnchl              
		call mirrspr
        ; ---- guard punch sprite/left ---

        ; ---- guard kick sprite/left 
        ld  hl,sabkckl1
        ld  de,gdkckl1
        ld  bc,_sabkckr1.sabkckr1 - _sabkckr1
        call copymem

        ld  hl,gdhdkick1
        ld  de,gdkckl1 + SPRHLEN
        ld  bc,gdhdkick1.heade - gdhdkick1
        call copymem

        ld  hl,sabkckl2
        ld  de,gdkckl2
        ld  bc,_sabkckr2.sabkckr2 - _sabkckr2
        call copymem

        ld  hl,gdhdkick2
        ld  de,gdkckl2 + SPRHLEN
        ld  bc,gdhdkick2.heade - gdhdkick2
        call copymem

        ld  hl,gdkckl1
        ld  de,gdkckr1
		call mirrspr

        ld  hl,gdkckl2
        ld  de,gdkckr2
		call mirrspr
        ; ---- guard kick sprite/left ---

		ret
.endinit		