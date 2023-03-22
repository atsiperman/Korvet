mirtable EQU 0c400h

sbheadr  EQU mirtable + 256
sbheadl  EQU sbheadr + (_sbmvrh.sbmvre - _sbmvrh)

sbhpnchr EQU sbheadl + (_sbmvrh.sbmvre - _sbmvrh)
sbhpnchl EQU sbhpnchr + (_sbpnch.sbpnche - _sbpnch)

sbhdkk1r EQU sbhpnchl + (_sbpnch.sbpnche - _sbpnch)
sbhdkk1l EQU sbhdkk1r + (_gdhdkk1.heade - _gdhdkk1)

sbhdkk2r EQU sbhdkk1l + (_gdhdkk1.heade - _gdhdkk1)
sbhdkk2l EQU sbhdkk2r + (_gdhdkk2.heade - _gdhdkk2)

sbhwalkr EQU sbhdkk2l + (_gdhdkk2.heade - _gdhdkk2)
sbhwalkl EQU sbhwalkr + (_gdhwalk.heade - _gdhwalk)

sbhjmp1r EQU sbhwalkl + (_gdhwalk.heade - _gdhwalk)
sbhjmp2r EQU sbhjmp1r + (_sbhjpr1.esabh - _sbhjpr1)

sbhjmp1l EQU sbhjmp2r + (_sbhjpr2.esabh - _sbhjpr2)
sbhjmp2l EQU sbhjmp1l + (_sbhjpr1.esabh - _sbhjpr1)

sbhfall  EQU sbhjmp2l + (_sbhjpr2.esabh - _sbhjpr2)
sbhsqtr  EQU sbhfall + (_sbhfall.esabh - _sbhfall)

sbhlad1  EQU sbhsqtr + (_sbhsqtr.esabh - _sbhsqtr)
sbhlad2  EQU sbhlad1 + (_sbhlad1.esabh - _sbhlad1)

sabjmpr1 EQU sbhlad2 + (_sbhlad1.esabh - _sbhlad1)
sabjmpr2 EQU sabjmpr1 + (_sabjmpr2 - _sabjmpr1)
sabkckr1 EQU sabjmpr2 + (_sabkckr1 - _sabjmpr2)
sabkckr2 EQU sabkckr1 + (_sabkckr2 - _sabkckr1)
sabfall  EQU sabkckr2 + (_sabfall - _sabkckr2)
sabsqtrt EQU sabfall + (_sabsqtrt - _sabfall)
sablad1  EQU sabsqtrt + (_sablad1 - _sabsqtrt)
sablad2  EQU sablad1 + (_sablad2 - _sablad1)
sabsprt  EQU sablad2 + (_sabsprt - _sablad2)
sabspmr1 EQU sabsprt + (_sabspmr1 - _sabsprt)
sabspmr2 EQU sabspmr1 + (_sabspmr2 - _sabspmr1)
sabspmr3 EQU sabspmr2 + (_sabspmr3 - _sabspmr2)
sabspmr4 EQU sabspmr3 + (_sabspmr4 - _sabspmr3)
sabdead  EQU sabspmr4 + (_sabdead - _sabspmr4)

sabspml1 EQU sabdead + (_sabdead.sbdead - _sabdead)
sabspml2 EQU sabspml1 + (sabspmr2 - sabspmr1)
sabspml3 EQU sabspml2 + (sabspmr2 - sabspmr1)
sabspml4 EQU sabspml3 + (sabspmr2 - sabspmr1)

sabsplt  EQU sabspml4 + (sabspmr2 - sabspmr1)

sabjmpl1 EQU sabsplt + (sabspmr1 - sabsprt)
sabjmpl2 EQU sabjmpl1 + (sabjmpr2 - sabjmpr1)

sabkckl1 EQU sabjmpl2 + (sabkckr1 - sabjmpr2)
sabkckl2 EQU sabkckl1 + (sabkckr2 - sabkckr1)

sabpnchr EQU sabkckl2 + _sabfall - _sabkckr2
sabpnchl EQU sabpnchr + (_sabpnch.endpnch - _sabpnch)

dogspml1 EQU sabpnchl + (_sabpnch.endpnch - _sabpnch)
dogspml2 EQU dogspml1 + dogspmr2 - dogspmr1
dogspml3 EQU dogspml2 + dogspmr3 - dogspmr2
dogspml4 EQU dogspml3 + dogspmr4 - dogspmr3

ctrldata EQU dogspml4 + dogspmr4 - dogspmr3
objmdata EQU ctrldata + cdataend - cdatast
trmdata  EQU objmdata + objmend - objmst

gdheadr  EQU trmdata + trmapend - trmapst
gdheadl  EQU gdheadr + (_gdhead.heade - _gdhead)

gdhpnchr EQU gdheadl + (_gdhead.heade - _gdhead)
gdhpnchl EQU gdhpnchr + (_gdhpnch.heade - _gdhpnch)

gdhdkk1r EQU gdhpnchl + (_gdhpnch.heade - _gdhpnch)
gdhdkk1l EQU gdhdkk1r + (_gdhdkk1.heade - _gdhdkk1)

gdhdkk2r EQU gdhdkk1l + (_gdhdkk1.heade - _gdhdkk1)
gdhdkk2l EQU gdhdkk2r + (_gdhdkk2.heade - _gdhdkk2)

gdhwalkr EQU gdhdkk2l + (_gdhdkk2.heade - _gdhdkk2)
gdhwalkl EQU gdhwalkr + (_gdhwalk.heade - _gdhwalk)

ginitmem EQU gdhwalkl + (_gdhwalk.heade - _gdhwalk)

; ---- address of procs for setting up game level
lvlproc  EQU ginitmem + (_lvlproc - ginitst)

dsksnd   EQU lvlproc + (ginitend - ginitst)
sndgunsh EQU dsksnd + (scdsksnd.endsnd - scdsksnd)
sndpunch EQU sndgunsh + (sndgnshd.endsnd - sndgnshd)
sndxplsn EQU sndpunch + (sndpnchd.endsnd - sndpnchd)
sndthrow EQU sndxplsn + (dexplsn.endsnd - dexplsn)

uppertop EQU sndthrow + (dthrwsnd.endsnd - dthrwsnd)


; ----- no more space in upper memory block
