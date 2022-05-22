; sprites of main character
;	all sprites are working in plain mode

; table of addresses of saboteur sprites when moving right
;
sbmvrttb:										
		db (sbmvrtte - sbmvrttb - 1) / 2
		dw sabspmr1,sabspmr2,sabspmr3,sabspmr4
sbmvrtte:										

sbmvlttb:
		db (sbmvltte - sbmvlttb - 1) / 2
		dw sabspml1,sabspml2,sabspml3,sabspml4
sbmvltte:										

; table of addresses of saboteur sprites when moving on the ladder
;
sbladtb:
		db (sbladtbe - sbladtb - 1) / 2
		dw sablad1,sablad2
sbladtbe:

; head sprites for ladder
;
sbladhtb:
		db (sbladhtb.endtab - sbladhtb - 1) / 2
		dw sbhlad1,sbhlad2
.endtab:

; table of addresses of saboteur sprites when kicking right
;		
sabkckrb:
		db (sabkckre - sabkckrb - 1) / 2
		dw sabkckr1, sabkckr1, sabkckr2, sabkckr2, sabkckr2, sabkckr2, sabkckr1, sabkckr1
sabkckre:

; table of addresses of saboteur sprites when kicking left
;		
sabkcklb:
		db (sabkckle - sabkcklb - 1) / 2
		dw sabkckl1, sabkckl1, sabkckl2, sabkckl2, sabkckl2, sabkckl2, sabkckl1, sabkckl1
sabkckle:

; table of addresses of saboteur sprites for long jump
;		
sabjmprb:
		db (sabjmpre - sabjmprb - 1) / 2 
		dw sabjmpr1, sabjmpr2, sabjmpr2, sabjmpr2, sabjmpr2, sabjmpr2, sabjmpr2, sabjmpr2, sabjmpr1
sabjmpre:

sabjmplb:
		db (sabjmple - sabjmplb - 1) / 2 
		dw sabjmpl1, sabjmpl2, sabjmpl2, sabjmpl2, sabjmpl2, sabjmpl2, sabjmpl2, sabjmpl2, sabjmpl1
sabjmple:


; table of addresses of saboteur sprites for short jump
;		
sabjpsrb:
		db (sabjpsre - sabjpsrb - 1) / 2 
		dw sabjmpr1, sabjmpr2, sabjmpr2, sabjmpr2, sabjmpr1
sabjpsre:

sabjpslb:
		db (sabjpsle - sabjpslb - 1) / 2 
		dw sabjmpl1, sabjmpl2, sabjmpl2, sabjmpl2, sabjmpl1
sabjpsle:

SBKCKI1  EQU 2		; index of the sprite when 1-st phase changes 
SBKCKI2  EQU 6		; index of the sprite when 2-nd phase changes 
SBKICKI  EQU 3      ; index of the sprite when it is necessary to check whether some object is kicked

SBJPSPN	 EQU (sabjmpre - sabjmprb - 1) / 2  
SBSJPSPN EQU (sabjpsre - sabjpsrb - 1) / 2  


; ----------- guard actions ----------------

; table of addresses of guard sprites when punching right
;		
gdpnchrb:
		db (gdpnchre - gdpnchrb - 1) / 2
		dw sabpnchr, sabpnchr, sabpnchr, sabpnchr
gdpnchre:

; table of addresses of guard sprites when punching left
;		
gdpnchlb:
		db (gdpnchle - gdpnchlb - 1) / 2
		dw sabpnchl, sabpnchl, sabpnchl, sabpnchl
gdpnchle:
