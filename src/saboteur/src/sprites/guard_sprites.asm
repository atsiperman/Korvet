;
;	this file contains sprites for the guardian
;

; sprites of a guardian
;	all sprites are working in plain mode
		
; table of addresses of sprites when moving right
;
gdmvrttb:										
		db (gdmvrtte - gdmvrttb - 1) / 2
		dw gdspmr1,gdspmr2,gdspmr3,gdspmr4
gdmvrtte:										

; ----	right 1 
gdsprt:
		db CMAINREG
		DB 6,4
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 252,0, 248,1, 240,3, 240,7, 240,7, 240,7, 0,7, 255,0, 31,0, 15,192, 7,224, 7,240, 7,240, 7,80, 7,32, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 254,0, 252,0, 252,1, 252,1, 252,0, 248,1, 240,3, 240,7, 0,119, 0,231, 0,223, 0,63, 0,255, 0,255, 0,255, 0,255, 7,240, 7,240, 1,240, 0,236, 0,158, 0,254, 0,255, 0,255, 255,0, 255,0, 255,0, 255,0, 255,0, 127,0, 127,0, 63,0
		DB 224,7, 224,15, 224,15, 224,14, 224,14, 224,14, 224,14, 224,7, 0,223, 0,159, 0,47, 0,111, 0,111, 0,119, 0,119, 0,119, 0,239, 0,255, 0,253, 0,253, 0,254, 0,254, 0,254, 0,254, 31,128, 0,192, 0,251, 0,255, 0,127, 0,15, 224,0, 255,0
		DB 240,7, 240,3, 248,3, 248,1, 252,0, 255,0, 255,0, 255,0, 0,180, 0,196, 16,199, 0,7, 96,15, 192,15, 192,31, 192,31, 0,2, 0,255, 0,255, 0,255, 0,255, 0,255, 0,255, 0,207, 127,0, 63,0, 63,128, 31,128, 31,192, 15,192, 15,224, 7,224
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 128,31, 128,63, 128,62, 0,62, 0,126, 0,124, 1,124, 1,124, 0,7, 112,3, 120,3, 248,1, 252,1, 252,1, 252,0, 254,0, 7,240, 7,240, 7,240, 7,240, 7,240, 7,240, 7,240, 15,224
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 1,124, 1,68, 129,60, 129,60, 131,56, 131,56, 1,124, 1,124, 254,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 15,160, 15,224, 15,224, 15,224, 15,224, 7,240, 1,252, 0,254


; sprite moving to the right, phase 1
gdspmr1:	
		db CMAINREG			
		DB 5,4
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 252,0, 248,1, 248,3, 254,0, 252,1, 248,1, 248,3, 8,3, 0,227, 0,223, 0,177, 3,240, 3,248, 3,248, 3,248, 3,200, 3,200, 3,248, 3,240
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 240,3, 240,6, 224,6, 224,13, 224,13, 224,13, 224,11, 224,11, 0,110, 0,239, 0,239, 0,247, 0,247, 0,251, 0,251, 0,253, 0,224, 0,131, 0,79, 0,184, 0,215, 0,207, 0,255, 0,254
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 224,10, 224,4, 240,7, 240,7, 240,7, 240,7, 240,3, 248,1, 0,57, 0,16, 6,208, 7,224, 3,240, 0,248, 0,255, 0,255, 0,248, 3,224, 15,0, 255,0, 255,0, 127,0, 63,0, 31,192
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 252,1, 252,1, 252,1, 252,1, 248,1, 248,3, 240,3, 240,7, 0,255, 0,255, 0,243, 0,227, 0,231, 0,200, 0,223, 0,188, 7,224, 7,240, 7,240, 7,224, 15,192, 31,128, 63,0, 127,0
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 224,7, 192,10, 128,30, 0,60, 0,120, 0,112, 0,124, 0,62, 1,112, 7,96, 15,224, 15,192, 31,192, 31,128, 63,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0


; sprite moving to the right, phase 2
gdspmr2:
		db CMAINREG			
		DB 5,4
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 252,0, 248,1, 248,3, 254,0, 252,1, 248,1, 248,3, 8,3, 0,227, 0,223, 0,177, 3,240, 3,248, 3,248, 3,248, 3,200, 3,200, 3,248, 3,240
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 240,3, 240,6, 224,6, 224,13, 224,13, 224,13, 224,11, 224,11, 0,110, 0,239, 0,239, 0,247, 0,247, 0,251, 0,251, 0,253, 0,224, 0,131, 0,79, 0,184, 0,215, 0,207, 0,255, 0,254
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 224,10, 224,4, 240,7, 240,7, 240,7, 240,7, 240,3, 248,1, 0,57, 0,16, 6,208, 7,224, 3,240, 0,248, 0,255, 0,255, 0,248, 3,224, 15,0, 255,0, 255,0, 127,0, 63,0, 31,192
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 252,1, 252,1, 252,1, 252,1, 248,1, 248,3, 240,3, 240,7, 0,255, 0,255, 0,243, 0,227, 0,231, 0,200, 0,223, 0,188, 7,224, 7,240, 7,240, 7,224, 15,192, 31,128, 63,0, 127,0
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 224,7, 192,10, 128,30, 0,60, 0,120, 0,112, 0,124, 0,62, 1,112, 7,96, 15,224, 15,192, 31,192, 31,128, 63,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0


; sprite moving to the right, phase 3
gdspmr3:
		db CMAINREG	
		DB 5,4
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 252,0, 248,1, 248,3, 252,0, 252,1, 248,1, 248,3, 8,3, 0,227, 0,223, 0,177, 3,240, 3,248, 3,248, 3,248, 3,200, 3,200, 3,248, 3,240
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 240,3, 240,6, 224,6, 224,13, 224,13, 224,13, 224,11, 224,11, 0,110, 0,239, 0,239, 0,247, 0,247, 0,251, 0,251, 0,253, 4,224, 0,131, 0,79, 0,184, 0,215, 0,207, 0,255, 0,254
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 224,10, 224,4, 240,7, 240,7, 240,7, 240,7, 240,3, 240,3, 0,57, 0,16, 6,208, 7,224, 3,240, 3,248, 1,248, 0,252, 0,248, 3,224, 15,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 248,0, 224,3, 240,7, 224,7, 224,15, 192,15, 128,31, 0,62, 0,254, 0,252, 0,254, 0,255, 0,255, 0,191, 0,15, 96,3, 248,1, 252,0, 127,0, 63,0, 31,128, 31,192, 31,192, 15,192, 15,224, 15,224
		DB 128,11, 128,59, 0,60, 1,112, 7,96, 15,224, 15,192, 31,192, 1,240, 7,128, 63,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 254,0, 254,0, 255,0, 255,0, 255,0, 255,0, 255,0, 15,160, 7,224, 7,112, 7,112, 7,112, 0,112, 0,124, 0,62



; sprite moving to the right, phase 4
gdspmr4:
		db CMAINREG	
		DB 5,4
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 252,0, 248,1, 248,3, 252,0, 252,1, 248,1, 248,3, 8,3, 0,227, 0,223, 0,177, 3,240, 3,248, 3,248, 3,248, 3,200, 3,200, 3,248, 3,240
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 240,3, 240,6, 224,6, 224,13, 224,13, 224,13, 224,11, 224,11, 0,110, 0,239, 0,239, 0,247, 0,247, 0,251, 0,251, 0,253, 4,224, 0,131, 0,79, 0,184, 0,215, 0,207, 0,255, 0,254
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 224,10, 224,4, 240,7, 240,7, 240,7, 240,7, 240,3, 248,1, 0,57, 0,16, 6,208, 7,240, 7,224, 7,240, 7,240, 3,240, 0,248, 3,224, 15,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 248,0, 252,1, 252,0, 254,0, 254,0, 252,0, 240,1, 0,7, 0,123, 3,248, 1,248, 1,252, 0,252, 0,254, 0,254, 0,254, 0,248, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 248,3, 240,3, 240,7, 240,7, 240,6, 240,4, 241,0, 255,0, 0,253, 0,248, 3,128, 63,0, 127,0, 255,0, 255,0, 255,0, 3,240, 7,112, 7,80, 7,112, 7,112, 1,48, 128,60, 128,62, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0

