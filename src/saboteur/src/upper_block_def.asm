mirtable EQU 0c000h

sbheadr  EQU mirtable + 256
sbheadl  EQU sbheadr + (_gdhead.heade - _gdhead)

sbhpnchr EQU sbheadl + (_gdhead.heade - _gdhead)
sbhpnchl EQU sbheadr + (_gdhpnch.heade - _gdhpnch)

sbhdkk1r EQU sbhpnchl + (_gdhpnch.heade - _gdhpnch)
sbhdkk1l EQU sbhdkk1r + (_gdhdkk1.heade - _gdhdkk1)

sbhdkk2r EQU sbhdkk1l + (_gdhdkk1.heade - _gdhdkk1)
sbhdkk2l EQU sbhdkk2r + (_gdhdkk2.heade - _gdhdkk2)

sbhwalkr EQU sbhdkk2l + (_gdhdkk2.heade - _gdhdkk2)
sbhwalkl EQU sbhwalkr + (_gdhwalk.heade - _gdhwalk)

sabjmpr1 EQU sbhwalkl + (_gdhwalk.heade - _gdhwalk)

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
gdhpnchl EQU gdheadr + (_gdhpnch.heade - _gdhpnch)

gdhdkk1r EQU gdhpnchl + (_gdhpnch.heade - _gdhpnch)
gdhdkk1l EQU gdhdkk1r + (_gdhdkk1.heade - _gdhdkk1)

gdhdkk2r EQU gdhdkk1l + (_gdhdkk1.heade - _gdhdkk1)
gdhdkk2l EQU gdhdkk2r + (_gdhdkk2.heade - _gdhdkk2)

gdhwalkr EQU gdhdkk2l + (_gdhdkk2.heade - _gdhdkk2)
gdhwalkl EQU gdhwalkr + (_gdhwalk.heade - _gdhwalk)

; gdsprt   EQU trmdata + trmapend - trmapst
; gdsplt   EQU gdsprt + sabspmr1 - sabsprt

; gdpnchr  EQU gdsplt + sabspmr1 - sabsprt
; gdpnchl  EQU gdpnchr + (_sabpnch.endpnch - _sabpnch)

; gdkckl1  EQU gdpnchl + (_sabpnch.endpnch - _sabpnch)
; gdkckl2  EQU gdkckl1 + (_sabkckr1.sabkckr1 - _sabkckr1)

; gdkckr1  EQU gdkckl2 + (_sabkckr2.sabkckr2 - _sabkckr2)
; gdkckr2  EQU gdkckr1 + (_sabkckr1.sabkckr1 - _sabkckr1)

; gdspml1  EQU gdkckr2 + (_sabkckr2.sabkckr2 - _sabkckr2)
; gdspml2  EQU gdspml1 + (sabspmr2 - sabspmr1)
; gdspml3  EQU gdspml2 + (sabspmr2 - sabspmr1)
; gdspml4  EQU gdspml3 + (sabspmr2 - sabspmr1)

; ----- no more space in upper memory block
