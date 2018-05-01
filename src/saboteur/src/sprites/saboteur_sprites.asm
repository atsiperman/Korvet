; sprites of main character
;	all sprites are working in plain mode
		
; table of addresses of saboteur sprites when moving right
;
sbmvrttb:										
sbmvlttb:
		db (sbmvrtte - sbmvrttb - 1) / 2
		dw sabspmr1,sabspmr2,sabspmr3,sabspmr4
sbmvrtte:										

; table of addresses of saboteur sprites when moving on the ladder
;
sbladtb:
		db (sbladtbe - sbladtb - 1) / 2
		dw sablad1,sablad2
sbladtbe:

; table of addresses of saboteur sprites when kicking right
;		
sabkckrb:
sabkcklb:
		db (sabkckre - sabkckrb - 1) / 2
		dw sabkckr1, sabkckr1, sabkckr2, sabkckr2, sabkckr2, sabkckr2, sabkckr2, sabkckr1, sabkckr1
sabkckre:

SBKCKI1 EQU 2		; index of the sprite when 1-st phase changes 
SBKCKI2 EQU 7		; index of the sprite when 2-nd phase changes 

; table of addresses of saboteur sprites for long jump
;		
sabjmprb:
		db (sabjmpre - sabjmprb - 1) / 2 
		dw sabjmpr1, sabjmpr2, sabjmpr2, sabjmpr2, sabjmpr2, sabjmpr2, sabjmpr2, sabjmpr2, sabjmpr1
sabjmpre:

SBJPSPN	EQU (sabjmpre - sabjmprb - 1) / 2  


; table of addresses of saboteur sprites for short jump
;		
sabjpshb:
		db (sabjpshe - sabjpshb - 1) / 2 
		dw sabjmpr1, sabjmpr2, sabjmpr2, sabjmpr2, sabjmpr1
sabjpshe:

SBSJPSPN EQU (sabjpshe - sabjpshb - 1) / 2  

; saboteur is jumping in right direction
sabjmpr1:		
		db CMAINREG			
		db 4, 48
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,3,192,0
		DB 0,7,224,0
		DB 0,7,224,0
		DB 0,6,0,0
		DB 0,7,0,0
		DB 0,55,224,0
		DB 0,207,192,0
		DB 1,191,176,0
		DB 3,127,248,0
		DB 2,255,252,0
		DB 1,255,254,0
		DB 3,255,223,0
		DB 7,239,223,128
		DB 7,159,183,192
		DB 15,127,227,192
		DB 15,127,225,224
		DB 14,255,224,240
		DB 15,127,192,112
		DB 7,127,222,120
		DB 11,159,255,56
		DB 13,239,255,120
		DB 14,247,255,120
		DB 13,119,255,48
		DB 1,143,254,0
		DB 1,255,220,0
		DB 1,251,60,0
		DB 1,240,120,0
		DB 3,240,112,0
		DB 3,224,224,0
		DB 3,193,192,0
		DB 3,193,128,0
		DB 7,193,128,0
		DB 7,129,128,0
		DB 7,129,0,0
		DB 7,0,0,0
		DB 15,0,0,0
		DB 14,0,0,0
		DB 14,0,0,0
		DB 28,0,0,0
		DB 28,0,0,0
		DB 24,0,0,0
		DB 56,0,0,0
		DB 56,0,0,0
		DB 120,0,0,0
		DB 120,0,0,0

sabjmpr2:
		db CMAINREG			
		db 3, 24
		DB 0,0,0
		DB 0,0,0
		DB 0,1,224
		DB 0,3,240
		DB 0,3,112
		DB 0,6,48
		DB 0,15,16
		DB 1,55,160
		DB 1,123,192
		DB 3,123,0
		DB 3,251,192
		DB 2,246,56
		DB 2,237,156
		DB 2,239,220
		DB 0,247,250
		DB 1,123,198
		DB 1,188,54
		DB 1,223,244
		DB 1,199,224
		DB 0,184,0
		DB 0,125,128
		DB 0,115,0
		DB 0,102,0
		DB 0,0,0
				
; saboteur is kicking in right direction
sabkckr1:		
		db CMAINREG			
		db 3, 40
		DB 0,0,0
		DB 0,0,0
		DB 0,0,0
		DB 0,0,56
		DB 0,0,60
		DB 0,0,60
		DB 0,120,28
		DB 0,252,28
		DB 0,254,24
		DB 0,234,28
		DB 0,228,28
		DB 0,254,28
		DB 0,254,60
		DB 0,126,124
		DB 6,253,252
		DB 12,255,248
		DB 11,255,224
		DB 7,251,224
		DB 7,251,224
		DB 7,255,128
		DB 15,223,112
		DB 15,190,248
		DB 15,142,248
		DB 15,118,248
		DB 15,247,72
		DB 15,241,120
		DB 7,238,248
		DB 0,31,116
		DB 1,191,172
		DB 0,223,188
		DB 0,28,184
		DB 0,11,128
		DB 0,15,128
		DB 0,15,128
		DB 0,7,128
		DB 0,7,128
		DB 0,7,64
		DB 0,2,192
		DB 0,3,192
		DB 0,3,128
		
sabkckr2:
		db CMAINREG			
		db 6, 40
		DB 0,0,0,0,0,0
		DB 0,0,0,56,0,0
		DB 0,0,0,124,0,0
		DB 0,0,0,252,0,0
		DB 0,0,1,248,0,0
		DB 0,0,3,192,0,0
		DB 0,0,7,192,0,0
		DB 0,0,31,128,0,0
		DB 1,240,63,0,0,0
		DB 3,248,126,0,0,0
		DB 3,168,252,0,0,0
		DB 3,145,248,0,0,0
		DB 3,251,240,0,0,0
		DB 3,255,224,0,0,0
		DB 1,255,208,0,0,0
		DB 1,255,232,0,0,0
		DB 2,254,232,0,0,0
		DB 2,255,116,0,0,0
		DB 3,127,244,0,0,0
		DB 2,199,248,0,0,0
		DB 2,187,251,255,159,135
		DB 0,187,255,255,254,251
		DB 0,221,251,255,254,251
		DB 0,93,247,255,255,255
		DB 0,110,231,255,30,0
		DB 0,47,79,252,0,0
		DB 0,55,95,192,0,0
		DB 0,31,126,7,240,0
		DB 0,14,127,7,240,0
		DB 0,0,63,15,224,0
		DB 0,0,63,159,0,0
		DB 0,0,31,174,0,0
		DB 0,0,15,232,0,0
		DB 0,0,7,232,0,0
		DB 0,0,3,240,0,0
		DB 0,0,1,224,0,0
		DB 0,0,0,192,0,0
		DB 0,0,0,0,0,0
		DB 0,0,0,0,0,0
		DB 0,0,0,0,0,0
		
; saboteur is falling down
sabfall:
		sbspldhd
		DB 28,28
		DB 28,28
		DB 28,28
		DB 24,12
		DB 24,12
		DB 24,12
		DB 57,236
		DB 59,244
		DB 58,182
		DB 58,86
		DB 59,246
		DB 61,246
		DB 63,246
		DB 61,238
		DB 95,158
		DB 95,254
		DB 95,254
		DB 95,254
		DB 95,246
		DB 95,246
		DB 95,254
		DB 111,254
		DB 111,252
		DB 119,252
		DB 119,252
		DB 119,252
		DB 55,248
		DB 8,4
		DB 8,4
		DB 15,252
		DB 15,252
		DB 31,252
		DB 31,252
		DB 17,248
		DB 30,100
		DB 31,156
		DB 31,188
		DB 15,188
		DB 15,220
		DB 15,220
		DB 15,220
		DB 7,220
		DB 7,220
		DB 7,220
		DB 7,220
		DB 7,188
		DB 7,220
		DB 3,220
		DB 2,88
		DB 3,200
		DB 3,216
		DB 3,216
		DB 3,216
		DB 3,216
		DB 3,216
		DB 1,176
				
; saboteur is squatting from right direction		
sabsqtrt:
		sbsqthd		
		DB 0,0,0
		DB 0,0,0
		DB 0,0,0
		DB 0,0,0
		DB 0,0,0
		DB 0,0,0
		DB 0,0,0
		DB 0,124,0
		DB 0,254,0
		DB 0,254,0
		DB 0,254,0
		DB 0,171,192
		DB 6,146,224
		DB 15,254,224
		DB 31,127,224
		DB 29,159,224
		DB 61,254,240
		DB 56,254,240
		DB 55,254,240
		DB 47,195,112
		DB 111,255,112
		DB 111,255,176
		DB 111,255,184
		DB 107,207,184
		DB 109,3,184
		DB 55,3,184
		DB 55,3,216
		DB 55,3,216
		DB 55,3,216
		DB 55,3,216
		DB 111,3,216
		DB 111,3,184

; saboteur moving on the ladder 1
sablad1:
		sbspldhd
		DB 0,0
		DB 0,0
		DB 0,0
		DB 0,0
		DB 24,0
		DB 60,0
		DB 60,0
		DB 56,0
		DB 112,0
		DB 115,192
		DB 103,224
		DB 103,224
		DB 103,224
		DB 103,224
		DB 119,230
		DB 119,230
		DB 99,215
		DB 92,51
		DB 63,251
		DB 63,251
		DB 63,251
		DB 63,251
		DB 63,251
		DB 63,254
		DB 63,252
		DB 63,248
		DB 63,248
		DB 63,248
		DB 31,240
		DB 32,16
		DB 32,48
		DB 63,248
		DB 127,248
		DB 255,248
		DB 255,248
		DB 223,248
		DB 239,252
		DB 240,252
		DB 252,252
		DB 124,126
		DB 92,126
		DB 100,62
		DB 60,62
		DB 60,30
		DB 60,62
		DB 30,60
		DB 30,124
		DB 30,88
		DB 14,232
		DB 14,240
		DB 13,224
		DB 13,224
		DB 1,192
		DB 11,192
		DB 11,224
		DB 11,240

; saboteur moving on the ladder 2
sablad2:
		sbspldhd
		DB 0,0
		DB 0,0
		DB 0,0
		DB 0,0
		DB 0,24
		DB 0,60
		DB 0,60
		DB 0,28
		DB 0,14
		DB 3,206
		DB 7,230
		DB 7,230
		DB 7,230
		DB 7,230
		DB 103,238
		DB 103,238
		DB 235,198
		DB 204,58
		DB 223,252
		DB 223,252
		DB 223,252
		DB 223,252
		DB 223,252
		DB 127,252
		DB 63,252
		DB 31,252
		DB 31,252
		DB 31,252
		DB 15,248
		DB 8,4
		DB 12,4
		DB 31,252
		DB 31,254
		DB 31,255
		DB 31,255
		DB 31,251
		DB 63,247
		DB 63,15
		DB 63,63
		DB 126,62
		DB 126,58
		DB 124,38
		DB 124,60
		DB 120,60
		DB 124,60
		DB 60,120
		DB 62,120
		DB 26,120
		DB 23,112
		DB 15,112
		DB 7,176
		DB 7,176
		DB 3,128
		DB 3,208
		DB 7,208
		DB 15,208

; ----	saboteur right 1 
sabsprt:
sabsplt:
		sabsphd
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,1,224,0
		DB 0,3,240,0
		DB 0,7,240,0
		DB 0,7,240,0
		DB 0,6,176,0
		DB 0,6,80,0
		DB 0,119,240,0
		DB 0,231,240,0
		DB 1,223,240,0
		DB 1,63,236,0
		DB 0,255,30,0
		DB 1,255,254,0
		DB 3,255,255,0
		DB 7,255,255,0
		DB 7,223,239,128
		DB 15,159,255,192
		DB 15,47,253,251
		DB 14,111,253,255
		DB 14,111,254,127
		DB 14,119,254,15
		DB 14,119,254,0
		DB 7,119,254,0
		DB 7,180,2,0
		DB 3,196,255,0
		DB 3,199,255,128
		DB 1,7,255,128
		DB 0,15,255,192
		DB 0,15,255,192
		DB 0,31,207,224
		DB 0,31,7,224
		DB 0,31,3,240
		DB 0,62,3,240
		DB 0,62,1,240
		DB 0,62,1,240
		DB 0,124,1,240
		DB 0,124,0,240
		DB 0,124,0,224
		DB 0,124,0,160
		DB 0,124,0,224
		DB 0,68,0,224
		DB 0,60,0,224
		DB 0,60,0,224
		DB 0,56,0,224
		DB 0,56,0,240
		DB 0,124,0,252
		DB 0,124,0,254

; saboteur sprite moving to the right, phase 1
sabspmr1:	
		sbspmvhd
		DB 0,0,0,240
		DB 0,0,1,248
		DB 0,0,1,248
		DB 0,0,3,248
		DB 0,0,3,200
		DB 0,0,227,200
		DB 0,1,223,248
		DB 0,3,177,240
		DB 0,3,110,224
		DB 0,6,239,131
		DB 0,6,239,79
		DB 0,13,247,184
		DB 0,13,247,215
		DB 0,13,251,207
		DB 0,11,251,255
		DB 0,11,253,254
		DB 0,10,57,248
		DB 0,4,16,224
		DB 0,7,208,0
		DB 0,7,224,0
		DB 0,7,240,0
		DB 0,7,248,0
		DB 0,3,255,0
		DB 0,1,255,192
		DB 0,1,255,224
		DB 0,1,255,240
		DB 0,1,243,240
		DB 0,1,227,224
		DB 0,1,231,192
		DB 0,3,200,128
		DB 0,3,223,0
		DB 0,7,188,0
		DB 0,7,112,0
		DB 0,10,96,0
		DB 0,30,224,0
		DB 0,60,192,0
		DB 0,120,192,0
		DB 0,112,128,0
		DB 0,124,0,0
		DB 0,62,0,0

; saboteur sprite moving to the right, phase 2
sabspmr2:
		sbspmvhd
		DB 0,0,0,240
		DB 0,0,1,248
		DB 0,0,1,248
		DB 0,0,3,248
		DB 0,0,3,200
		DB 0,0,227,200
		DB 0,1,223,248
		DB 0,3,177,240
		DB 0,3,110,224
		DB 0,6,239,131
		DB 0,6,239,79
		DB 0,13,247,184
		DB 0,13,247,215
		DB 0,13,251,207
		DB 0,11,251,255
		DB 0,11,253,254
		DB 0,10,57,248
		DB 0,4,16,224
		DB 0,7,208,0
		DB 0,7,224,0
		DB 0,7,240,0
		DB 0,7,248,0
		DB 0,3,255,0
		DB 0,3,255,128
		DB 0,1,255,192
		DB 0,1,255,192
		DB 0,3,255,192
		DB 0,3,243,192
		DB 0,7,229,128
		DB 0,7,198,128
		DB 0,15,207,0
		DB 0,15,143,0
		DB 0,223,30,0
		DB 3,220,30,0
		DB 15,224,24,0
		DB 31,0,24,0
		DB 28,0,28,0
		DB 28,0,12,0
		DB 28,0,14,0
		DB 14,0,0,0

; saboteur sprite moving to the right, phase 3
sabspmr3:
		sbspmvhd
		DB 0,0,0,240
		DB 0,0,1,248
		DB 0,0,1,248
		DB 0,0,3,248
		DB 0,0,3,200
		DB 0,0,227,200
		DB 0,1,223,248
		DB 0,3,177,240
		DB 0,3,110,224
		DB 0,6,239,131
		DB 0,6,239,79
		DB 0,13,247,184
		DB 0,13,247,215
		DB 0,13,251,207
		DB 0,11,251,255
		DB 0,11,253,254
		DB 0,10,57,248
		DB 0,4,16,224
		DB 0,7,208,0
		DB 0,7,224,0
		DB 0,7,240,0
		DB 0,7,248,0
		DB 0,3,248,0
		DB 0,3,252,0
		DB 0,7,254,0
		DB 0,7,255,0
		DB 0,15,255,128
		DB 0,15,191,192
		DB 0,31,15,192
		DB 0,62,3,192
		DB 0,254,1,224
		DB 3,252,0,224
		DB 11,240,0,160
		DB 59,128,0,224
		DB 60,0,0,112
		DB 112,0,0,112
		DB 96,0,0,112
		DB 224,0,0,112
		DB 192,0,0,124
		DB 192,0,0,62

; saboteur sprite moving to the right, phase 4
sabspmr4:
		sbspmvhd
		DB 0,0,0,240
		DB 0,0,1,248
		DB 0,0,1,248
		DB 0,0,3,248
		DB 0,0,3,200
		DB 0,0,227,200
		DB 0,1,223,248
		DB 0,3,177,240
		DB 0,3,110,224
		DB 0,6,239,131
		DB 0,6,239,79
		DB 0,13,247,184
		DB 0,13,247,215
		DB 0,13,251,207
		DB 0,11,251,255
		DB 0,11,253,254
		DB 0,10,57,248
		DB 0,4,16,224
		DB 0,7,208,0
		DB 0,7,240,0
		DB 0,7,224,0
		DB 0,7,240,0
		DB 0,3,240,0
		DB 0,1,240,0
		DB 0,1,248,0
		DB 0,0,248,0
		DB 0,0,252,0
		DB 0,0,252,0
		DB 0,0,254,0
		DB 0,1,254,0
		DB 0,7,254,0
		DB 0,123,248,0
		DB 3,253,240,0
		DB 3,248,112,0
		DB 7,128,80,0
		DB 7,0,112,0
		DB 6,0,112,0
		DB 4,0,48,0
		DB 0,0,60,0
		DB 0,0,62,0
