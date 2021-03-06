; sprites of a dog
;	all sprites are working in plain mode
		
; table of addresses of dog sprites when moving right
;
dogmvrtb:										
dogmvltb:
		db (dogmvrte - dogmvrtb - 1) / 2
		dw dogspmr1,dogspmr2,dogspmr3,dogspmr4
dogmvrte:										


; number of sprites for a moving dog
;
DOGSPRN	EQU (dogmvrte - dogmvrtb - 1) / 2
		

; table of addresses of dog sprites when turning left
;
dogtnltb:										
		db (dogtnlte - dogtnltb - 1) / 2
		dw dogsptn2,dogsptn1
dogtnlte:		

; table of addresses of dog sprites when turning right
;
dogtnrtb:
		db (dogtnrte - dogtnrtb - 1) / 2
		dw dogsptn2,dogsptn1
dogtnrte:		
		
; dog moving right
dogspmr1:
dogspml1:
		objhead
		DB 4,24
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,128
		DB 0,0,1,248
		DB 0,0,1,244
		DB 0,0,3,62
		DB 0,1,254,255
		DB 15,255,247,120
		DB 23,255,239,190
		DB 239,255,239,192
		DB 15,255,247,128
		DB 31,239,255,128
		DB 31,247,255,192
		DB 13,244,253,224
		DB 14,240,2,240
		DB 14,224,0,48
		DB 28,96,0,88
		DB 48,192,0,44
		DB 96,192,0,55
		DB 64,128,0,3
		DB 96,192,0,0
		DB 32,112,0,0

dogspmr2:
		objhead
		DB 4,24
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,112
		DB 0,31,224,252
		DB 0,63,255,246
		DB 1,255,255,127
		DB 2,255,255,191
		DB 5,255,255,220
		DB 121,252,127,192
		DB 0,224,31,192
		DB 5,192,7,0
		DB 29,192,14,224
		DB 35,128,12,96
		DB 14,0,8,48
		DB 120,0,24,16
		DB 192,0,16,24
		DB 0,0,48,15
		DB 0,0,48,7
		DB 0,0,24,0

dogspmr3:
		objhead
		DB 4,24
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,112
		DB 0,15,0,236
		DB 0,63,255,126
		DB 0,127,239,190
		DB 1,255,239,232
		DB 3,127,255,134
		DB 4,254,255,128
		DB 136,127,127,128
		DB 112,15,127,0
		DB 0,6,224,0
		DB 0,6,96,0
		DB 0,13,48,0
		DB 0,12,16,0
		DB 0,5,24,0
		DB 0,6,15,0
		DB 0,3,7,0
		DB 0,1,0,0
		
dogspmr4:
		objhead
		DB 4,24
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,112
		DB 0,15,0,236
		DB 0,63,255,126
		DB 0,127,239,190
		DB 1,255,239,232
		DB 3,127,255,134
		DB 4,254,255,128
		DB 136,127,127,128
		DB 112,15,127,0
		DB 0,6,188,0
		DB 0,6,134,0
		DB 0,13,115,0
		DB 0,12,193,128
		DB 0,5,128,128
		DB 0,6,97,0
		DB 0,3,50,0
		DB 0,1,0,0				
				
; dog turning 
dogsptn1:
		objhead
		DB 4,24
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,14,0,0
		DB 0,127,110,0
		DB 0,127,95,128
		DB 0,255,109,128
		DB 0,255,114,128
		DB 0,247,182,0
		DB 0,247,190,0
		DB 0,235,210,0
		DB 0,237,237,0
		DB 0,196,242,0
		DB 1,132,198,0
		DB 1,132,198,0
		DB 1,140,66,0
		DB 0,204,66,0
		DB 0,196,98,0
		DB 0,102,102,0
		DB 0,102,102,0
		
; dog turning 
dogsptn2:
		objhead
		DB 4,24
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,0,0
		DB 0,0,112,0
		DB 0,118,254,0
		DB 1,250,254,0
		DB 1,182,255,0
		DB 1,78,255,0
		DB 0,109,239,0
		DB 0,125,239,0
		DB 0,75,215,0
		DB 0,183,183,0
		DB 0,79,35,0
		DB 0,99,33,128
		DB 0,99,33,128
		DB 0,66,49,128
		DB 0,66,51,0
		DB 0,70,35,0
		DB 0,102,102,0
		DB 0,102,102,0
