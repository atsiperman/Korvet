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

        macro cpboat
        savedata s1stom, s2stom, save1stom
        endm

        macro rsboat
        rstordata s1stom, s2stom, save1stom
        endm


; ----- initializes data
;
        
sabinit:
        ; copy level initialization code into upper memory block
        ld  hl,scdsksnd
        ld  de,dsksnd
        ld  bc,scdsksnd.esnd - scdsksnd
        call copymem              

        ld  hl,ginitst
        ld  de,ginitmem
        ld  bc,ginitend - ginitst
        call copymem              
        ld   hl,lvlproc - (_lvlproc - setlvl1)
        ld   (lvlproc),hl
        ld   hl,lvlproc - (_lvlproc - setlvl2)
        ld   (lvlproc + 2),hl
        ld   hl,lvlproc - (_lvlproc - setlvl3)
        ld   (lvlproc + 4),hl
        ld   hl,lvlproc - (_lvlproc - setlvl4)
        ld   (lvlproc + 6),hl
        ld   hl,lvlproc - (_lvlproc - setlvl5)
        ld   (lvlproc + 8),hl
        ld   hl,lvlproc - (_lvlproc - setlvl6)
        ld   (lvlproc + 10),hl

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
        cpboat
        
        call .initsbsp
        jp .initgdsp
        ;ret

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

        ; heads        
        ld  hl,_sabrth
        ld  de,sbheadr
        ld  bc,_sabrth.sbrthe - _sabrth
        call copymem
        ld  hl,sbheadr
        ld  de,sbheadl
		call mirrspr

        ld  hl,_sbmvrh
        ld  de,sbhwalkr
        ld  bc,_sbmvrh.sbmvre - _sbmvrh
        call copymem
        ld  hl,sbhwalkr
        ld  de,sbhwalkl
		call mirrspr

        ld  hl,_skcrh1
        ld  de,sbhdkk1r
        ld  bc,_skcrh1.skcrhe1 - _skcrh1
        call copymem
        ld  hl,sbhdkk1r
        ld  de,sbhdkk1l
		call mirrspr

        ld  hl,_skcrh2
        ld  de,sbhdkk2r
        ld  bc,_skcrh2.skcrhe2 - _skcrh2
        call copymem
        ld  hl,sbhdkk2r
        ld  de,sbhdkk2l
		call mirrspr

        ld  hl,_sbpnch
        ld  de,sbhpnchr
        ld  bc,_sbpnch.sbpnche - _sbpnch
        call copymem
        ld  hl,sbhpnchr
        ld  de,sbhpnchl
		call mirrspr

        ld  hl,_sbhjpr1
        ld  de,sbhjmp1r
        ld  bc,_sbhjpr1.esabh - _sbhjpr1
        call copymem
        ld  hl,sbhjmp1r
        ld  de,sbhjmp1l
		call mirrspr

        ld  hl,_sbhjpr2
        ld  de,sbhjmp2r
        ld  bc,_sbhjpr2.esabh - _sbhjpr2
        call copymem
        ld  hl,sbhjmp2r
        ld  de,sbhjmp2l
		call mirrspr

        ld  hl,_sbhfall
        ld  de,sbhfall
        ld  bc,_sbhfall.esabh - _sbhfall
        call copymem

        ld  hl,_sbhsqtr
        ld  de,sbhsqtr
        ld  bc,_sbhsqtr.esabh - _sbhsqtr
        call copymem

        ld  hl,_sbhlad1
        ld  de,sbhlad1
        ld  bc,_sbhlad1.esabh - _sbhlad1
        call copymem

        ld  hl,_sbhlad2
        ld  de,sbhlad2
        ld  bc,_sbhlad2.esabh - _sbhlad2
        jp copymem

        ;ret

.initgdsp:
        ; guard sprites

        ld  hl,_gdhead
        ld  de,gdheadl
        ld  bc,_gdhead.heade - _gdhead
        call copymem
        ld  hl,gdheadl
        ld  de,gdheadr
		call mirrspr

        ld  hl,_gdhpnch
        ld  de,gdhpnchr
        ld  bc,_gdhpnch.heade - _gdhpnch
        call copymem
        ld  hl,gdhpnchr
        ld  de,gdhpnchl
		call mirrspr

        ld  hl,_gdhdkk1
        ld  de,gdhdkk1l
        ld  bc,_gdhdkk1.heade - _gdhdkk1
        call copymem
        ld  hl,gdhdkk1l
        ld  de,gdhdkk1r
		call mirrspr

        ld  hl,_gdhdkk2
        ld  de,gdhdkk2l
        ld  bc,_gdhdkk2.heade - _gdhdkk2
        call copymem
        ld  hl,gdhdkk2l
        ld  de,gdhdkk2r
		call mirrspr

        ld  hl,_gdhwalk
        ld  de,gdhwalkl
        ld  bc,_gdhwalk.heade - _gdhwalk
        call copymem
        ld  hl,gdhwalkl
        ld  de,gdhwalkr
		jp mirrspr

        ; ---- guard move sprite/left ---
		;ret
.endinit		