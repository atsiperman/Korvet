
; saboteur is jumping in right direction
_sabjmpr1:		
		db CMAINREG			
		DB 6,4
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 248,0, 240,3, 240,7, 240,7, 240,6, 128,7, 255,0, 255,0, 31,0, 15,192, 15,224, 15,224, 15,32, 15,32, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 254,0, 252,0, 248,1, 248,3, 248,2, 248,1, 240,3, 240,7, 0,55, 0,207, 0,191, 0,127, 0,255, 0,255, 0,255, 0,239, 15,224, 7,192, 3,176, 1,248, 0,252, 0,254, 0,223, 0,223, 255,0, 255,0, 255,0, 255,0, 255,0, 127,0, 63,0, 31,128
		DB 224,7, 224,15, 224,15, 224,14, 224,15, 224,7, 224,11, 224,13, 0,159, 0,127, 0,127, 0,255, 0,127, 0,127, 0,159, 0,239, 0,183, 0,227, 0,225, 0,224, 0,192, 0,222, 0,255, 0,255, 31,192, 15,192, 7,224, 7,240, 3,112, 3,120, 3,56, 3,120
		DB 224,14, 224,13, 224,1, 252,1, 252,1, 248,1, 248,3, 248,3, 0,247, 0,119, 0,143, 0,255, 0,251, 0,240, 6,240, 4,224, 0,255, 0,255, 0,254, 0,220, 1,60, 3,120, 7,112, 15,224, 3,120, 3,48, 7,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 248,3, 240,3, 240,7, 240,7, 240,7, 224,7, 224,15, 224,14, 12,193, 28,193, 28,193, 28,129, 60,129, 60,0, 127,0, 127,0, 31,192, 63,128, 63,128, 63,128, 127,0, 127,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 192,14, 192,28, 193,28, 129,24, 131,56, 3,56, 3,120, 3,120, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0


_sabjmpr2:
		db CMAINREG			
		DB 4,3
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 252,1, 248,3, 255,0, 255,0, 255,0, 255,0, 255,0, 15,0, 7,224, 7,240
		DB 255,0, 255,0, 255,0, 252,1, 252,1, 248,3, 248,3, 248,2, 248,3, 240,6, 128,15, 0,183, 0,123, 0,123, 0,251, 0,246, 7,112, 7,48, 7,16, 7,160, 15,192, 31,0, 7,192, 1,56
		DB 248,2, 248,2, 248,0, 252,1, 252,1, 252,1, 252,1, 252,0, 0,237, 0,239, 0,247, 0,123, 0,188, 0,223, 0,199, 0,184, 1,156, 1,220, 1,248, 3,196, 3,52, 3,244, 3,224, 15,0
		DB 254,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 0,125, 0,115, 0,102, 1,0, 255,0, 255,0, 255,0, 255,0, 63,128, 63,0, 127,0, 255,0, 255,0, 255,0, 255,0, 255,0

; saboteur is kicking in right direction
_sabkckr1:
		db CMAINREG			
		DB 5,3
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 254,0, 255,0, 255,0, 255,0, 255,0, 255,0, 3,0, 1,120, 0,252, 255,0, 255,0, 131,0, 129,56, 129,60, 129,60, 129,28, 193,28
		DB 254,0, 254,0, 254,0, 254,0, 254,0, 240,0, 224,6, 224,12, 0,254, 0,234, 0,228, 0,254, 0,254, 0,126, 0,253, 0,255, 193,24, 193,28, 193,28, 129,28, 1,60, 1,124, 1,252, 1,248
		DB 224,11, 224,7, 240,7, 224,7, 224,15, 224,15, 224,15, 224,15, 0,255, 0,251, 0,251, 0,255, 0,223, 0,190, 0,142, 0,118, 3,224, 15,224, 15,224, 7,128, 3,112, 3,248, 3,248, 3,248
		DB 224,15, 224,15, 224,7, 240,0, 252,1, 252,0, 254,0, 255,0, 0,247, 0,241, 0,238, 0,31, 0,191, 0,223, 0,28, 192,11, 3,72, 3,120, 1,248, 1,116, 1,172, 1,188, 1,184, 3,128
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 224,15, 224,15, 224,7, 240,7, 240,7, 240,2, 248,3, 248,3, 63,128, 63,128, 63,128, 31,128, 31,64, 31,192, 31,192, 31,128
.sabkckr1:

_sabkckr2:
		db CMAINREG			
		DB 5,6
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 252,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 7,0, 255,0, 255,0, 254,0, 252,0, 248,1, 240,3, 192,7, 128,31, 131,0, 1,56, 1,124, 1,252, 1,248, 3,192, 31,192, 31,128, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 248,1, 248,3, 248,3, 248,3, 248,3, 248,3, 248,1, 248,1, 3,240, 2,248, 0,168, 0,145, 0,251, 0,255, 0,255, 0,255, 0,63, 0,126, 0,252, 1,248, 3,240, 7,224, 3,208, 3,232, 63,0, 127,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 248,2, 248,2, 248,3, 248,2, 248,2, 248,0, 254,0, 254,0, 0,254, 0,255, 0,127, 0,199, 0,187, 0,187, 0,221, 0,93, 1,232, 1,116, 1,244, 0,248, 0,251, 0,255, 0,251, 0,247, 255,0, 255,0, 255,0, 0,0, 0,255, 0,255, 0,255, 0,255, 255,0, 255,0, 255,0, 0,0, 0,159, 0,254, 0,254, 0,255, 255,0, 255,0, 255,0, 0,0, 0,135, 0,251, 0,251, 0,255
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 0,110, 0,47, 128,55, 128,31, 192,14, 224,0, 255,0, 255,0, 0,231, 0,79, 0,95, 0,126, 0,127, 0,63, 128,63, 128,31, 0,255, 0,252, 0,192, 0,7, 96,7, 0,15, 0,159, 0,174, 0,30, 64,0, 7,0, 7,240, 7,240, 7,224, 15,0, 127,0, 0,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 192,15, 224,7, 240,3, 248,1, 252,0, 254,0, 255,0, 255,0, 0,232, 3,232, 3,240, 7,224, 15,192, 31,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
.sabkckr2:

; saboteur is falling down
_sabfall:
		db CMAINREG
		DB 7,2
		DB 193,28, 193,28, 193,28, 193,24, 195,24, 128,24, 128,57, 128,59, 193,28, 193,28, 193,28, 193,12, 225,12, 1,12, 1,236, 0,244
		DB 128,58, 128,58, 128,59, 128,61, 128,63, 0,61, 0,95, 0,95, 0,182, 0,86, 0,246, 0,246, 0,246, 0,238, 0,158, 0,254
		DB 0,95, 0,95, 0,95, 0,95, 0,95, 0,111, 0,111, 0,119, 0,254, 0,254, 0,246, 0,246, 0,254, 0,254, 0,252, 1,252
		DB 0,119, 0,119, 0,55, 128,8, 224,8, 224,15, 192,15, 192,31, 1,252, 1,252, 1,248, 1,4, 1,4, 1,252, 1,252, 1,252
		DB 192,31, 192,17, 192,30, 192,31, 192,31, 192,15, 224,15, 224,15, 1,252, 1,248, 1,100, 1,156, 1,188, 1,188, 1,220, 1,220
		DB 224,15, 224,7, 240,7, 240,7, 240,7, 240,7, 240,7, 240,3, 1,220, 1,220, 1,220, 1,220, 1,220, 1,188, 1,220, 1,220
		DB 248,2, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 248,1, 1,88, 3,200, 3,216, 3,216, 3,216, 3,216, 3,216, 3,176

				
; saboteur is squatting from right direction		
_sabsqtrt:
		db CMAINREG			
		DB 4,3
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 1,0, 0,124, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 254,0, 254,0, 254,0, 240,0, 224,6, 192,15, 192,31, 128,29, 0,254, 0,254, 0,254, 0,171, 0,146, 0,254, 0,127, 0,159, 255,0, 255,0, 31,0, 15,192, 15,224, 15,224, 15,224, 7,224
		DB 128,61, 128,56, 128,55, 0,47, 0,111, 0,111, 0,111, 0,107, 0,254, 0,254, 0,254, 0,195, 0,255, 0,255, 0,255, 0,207, 7,240, 7,240, 7,240, 7,112, 7,112, 3,176, 3,184, 3,184
		DB 0,109, 0,55, 128,55, 128,55, 128,55, 0,55, 0,111, 0,111, 0,3, 120,3, 120,3, 120,3, 120,3, 120,3, 120,3, 120,3, 3,184, 3,184, 3,216, 3,216, 3,216, 3,216, 3,216, 3,184

; saboteur moving on the ladder 1
_sablad1:
		db CMAINREG
		DB 7,2
		DB 255,0, 255,0, 255,0, 195,0, 129,24, 129,60, 129,60, 1,56, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 0,112, 0,115, 0,103, 0,103, 0,103, 0,103, 0,119, 0,119, 31,0, 15,192, 15,224, 15,224, 15,224, 0,224, 0,230, 0,230
		DB 0,99, 0,92, 0,63, 128,63, 128,63, 128,63, 128,63, 128,63, 0,215, 0,51, 0,251, 0,251, 0,251, 0,251, 0,251, 0,254
		DB 128,63, 128,63, 128,63, 128,63, 128,31, 128,32, 128,32, 0,63, 0,252, 1,248, 3,248, 3,248, 3,240, 7,16, 3,48, 3,248
		DB 0,127, 0,255, 0,255, 0,223, 0,239, 0,240, 0,252, 0,124, 3,248, 3,248, 3,248, 1,248, 1,252, 1,252, 0,252, 0,126
		DB 1,92, 1,100, 1,60, 129,60, 128,60, 128,30, 192,30, 192,30, 0,126, 0,62, 128,62, 128,30, 128,62, 0,60, 1,124, 1,88
		DB 192,14, 224,14, 224,13, 224,13, 224,1, 224,11, 224,11, 224,11, 3,232, 3,240, 7,224, 15,224, 15,192, 15,192, 7,224, 3,240


; saboteur moving on the ladder 2
_sablad2:
		db CMAINREG
		DB 7,2
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 195,0, 129,24, 129,60, 129,60, 128,28
		DB 248,0, 240,3, 240,7, 240,7, 240,7, 0,7, 0,103, 0,103, 0,14, 0,206, 0,230, 0,230, 0,230, 0,230, 0,238, 0,238
		DB 0,235, 0,204, 0,223, 0,223, 0,223, 0,223, 0,223, 0,127, 0,198, 0,58, 0,252, 1,252, 1,252, 1,252, 1,252, 1,252
		DB 0,63, 128,31, 192,31, 192,31, 192,15, 224,8, 192,12, 192,31, 1,252, 1,252, 1,252, 1,252, 1,248, 1,4, 1,4, 0,252
		DB 192,31, 192,31, 192,31, 128,31, 128,63, 128,63, 0,63, 0,126, 0,254, 0,255, 0,255, 0,251, 0,247, 0,15, 0,63, 0,62
		DB 0,126, 0,124, 1,124, 1,120, 1,124, 0,60, 128,62, 128,26, 128,58, 128,38, 128,60, 129,60, 1,60, 1,120, 3,120, 3,120
		DB 192,23, 192,15, 224,7, 240,7, 240,3, 240,3, 224,7, 224,15, 3,112, 7,112, 7,176, 7,176, 7,128, 7,208, 7,208, 7,208

; ----	saboteur right 1 
_sabsprt:
		db CMAINREG
		DB 6,4
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 252,0, 248,1, 240,3, 240,7, 240,7, 240,7, 0,7, 255,0, 31,0, 15,192, 7,224, 7,240, 7,240, 7,80, 7,32, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 254,0, 252,0, 252,1, 252,1, 252,0, 248,1, 240,3, 240,7, 0,119, 0,231, 0,223, 0,63, 0,255, 0,255, 0,255, 0,255, 7,240, 7,240, 1,240, 0,236, 0,158, 0,254, 0,255, 0,255, 255,0, 255,0, 255,0, 255,0, 255,0, 127,0, 127,0, 63,0
		DB 224,7, 224,15, 224,15, 224,14, 224,14, 224,14, 224,14, 224,7, 0,223, 0,159, 0,47, 0,111, 0,111, 0,119, 0,119, 0,119, 0,239, 0,255, 0,253, 0,253, 0,254, 0,254, 0,254, 0,254, 31,128, 0,192, 0,251, 0,255, 0,127, 0,15, 224,0, 255,0
		DB 240,7, 240,3, 248,3, 248,1, 252,0, 255,0, 255,0, 255,0, 0,180, 0,196, 16,199, 0,7, 96,15, 192,15, 192,31, 192,31, 0,2, 0,255, 0,255, 0,255, 0,255, 0,255, 0,255, 0,207, 127,0, 63,0, 63,128, 31,128, 31,192, 15,192, 15,224, 7,224
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 128,31, 128,63, 128,62, 0,62, 0,126, 0,124, 1,124, 1,124, 0,7, 112,3, 120,3, 248,1, 252,1, 252,1, 252,0, 254,0, 7,240, 7,240, 7,240, 7,240, 7,240, 7,240, 7,240, 15,224
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 1,124, 1,68, 129,60, 129,60, 131,56, 131,56, 1,124, 1,124, 254,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 15,160, 15,224, 15,224, 15,224, 15,224, 7,240, 1,252, 0,254

; saboteur sprite moving to the right, phase 1
_sabspmr1:	
		db CMAINREG			
		DB 5,4
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 252,0, 248,1, 248,3, 252,0, 252,1, 248,1, 248,3, 8,3, 0,227, 0,223, 0,177, 3,240, 3,248, 3,248, 3,248, 3,200, 3,200, 3,248, 3,240
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 240,3, 240,6, 224,6, 224,13, 224,13, 224,13, 224,11, 224,11, 0,110, 0,239, 0,239, 0,247, 0,247, 0,251, 0,251, 0,253, 4,224, 0,131, 0,79, 0,184, 0,215, 0,207, 0,255, 0,254
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 224,10, 224,4, 240,7, 240,7, 240,7, 240,7, 240,3, 248,1, 0,57, 0,16, 6,208, 7,240, 7,224, 7,240, 7,240, 3,240, 0,248, 3,224, 15,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 248,0, 252,1, 252,0, 254,0, 254,0, 252,0, 240,1, 0,7, 0,123, 3,248, 1,248, 1,252, 0,252, 0,254, 0,254, 0,254, 0,248, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 248,3, 240,3, 240,7, 240,7, 240,6, 240,4, 241,0, 255,0, 0,253, 0,248, 3,128, 63,0, 127,0, 255,0, 255,0, 255,0, 3,240, 7,112, 7,80, 7,112, 7,112, 1,48, 128,60, 128,62, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0

; saboteur sprite moving to the right, phase 2
_sabspmr2:
		db CMAINREG	
		DB 5,4
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 252,0, 248,1, 248,3, 254,0, 252,1, 248,1, 248,3, 8,3, 0,227, 0,223, 0,177, 3,240, 3,248, 3,248, 3,248, 3,200, 3,200, 3,248, 3,240
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 240,3, 240,6, 224,6, 224,13, 224,13, 224,13, 224,11, 224,11, 0,110, 0,239, 0,239, 0,247, 0,247, 0,251, 0,251, 0,253, 0,224, 0,131, 0,79, 0,184, 0,215, 0,207, 0,255, 0,254
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 224,10, 224,4, 240,7, 240,7, 240,7, 240,7, 240,3, 248,1, 0,57, 0,16, 6,208, 7,224, 3,240, 0,248, 0,255, 0,255, 0,248, 3,224, 15,0, 255,0, 255,0, 127,0, 63,0, 31,192
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 252,1, 252,1, 252,1, 252,1, 248,1, 248,3, 240,3, 240,7, 0,255, 0,255, 0,243, 0,227, 0,231, 0,200, 0,223, 0,188, 7,224, 7,240, 7,240, 7,224, 15,192, 31,128, 63,0, 127,0
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 224,7, 192,10, 128,30, 0,60, 0,120, 0,112, 0,124, 0,62, 1,112, 7,96, 15,224, 15,192, 31,192, 31,128, 63,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0

; saboteur sprite moving to the right, phase 3
_sabspmr3:
		db CMAINREG	
		DB 5,4
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 252,0, 248,1, 248,3, 252,0, 252,1, 248,1, 248,3, 8,3, 0,227, 0,223, 0,177, 3,240, 3,248, 3,248, 3,248, 3,200, 3,200, 3,248, 3,240
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 240,3, 240,6, 224,6, 224,13, 224,13, 224,13, 224,11, 224,11, 0,110, 0,239, 0,239, 0,247, 0,247, 0,251, 0,251, 0,253, 4,224, 0,131, 0,79, 0,184, 0,215, 0,207, 0,255, 0,254
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 224,10, 224,4, 240,7, 240,7, 240,7, 240,7, 240,3, 248,3, 0,57, 0,16, 6,208, 7,224, 3,240, 0,248, 0,255, 0,255, 0,248, 3,224, 15,0, 255,0, 255,0, 127,0, 63,0, 31,128
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 248,1, 248,1, 248,3, 240,3, 240,7, 224,7, 224,15, 0,15, 0,255, 0,255, 0,255, 0,243, 0,229, 0,198, 0,207, 0,143, 31,192, 31,192, 31,192, 31,192, 31,128, 63,128, 63,0, 127,0
		DB 248,0, 224,3, 192,15, 192,31, 192,28, 193,28, 193,28, 192,14, 0,223, 0,220, 0,224, 0,0, 255,0, 255,0, 255,0, 255,0, 0,30, 0,30, 0,24, 1,24, 193,28, 224,12, 224,14, 224,0, 127,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0

; saboteur sprite moving to the right, phase 4
_sabspmr4:
		db CMAINREG	
		DB 5,4
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 252,0, 248,1, 248,3, 252,0, 252,1, 248,1, 248,3, 8,3, 0,227, 0,223, 0,177, 3,240, 3,248, 3,248, 3,248, 3,200, 3,200, 3,248, 3,240
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 240,3, 240,6, 224,6, 224,13, 224,13, 224,13, 224,11, 224,11, 0,110, 0,239, 0,239, 0,247, 0,247, 0,251, 0,251, 0,253, 4,224, 0,131, 0,79, 0,184, 0,215, 0,207, 0,255, 0,254
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 224,10, 224,4, 240,7, 240,7, 240,7, 240,7, 240,3, 240,3, 0,57, 0,16, 6,208, 7,224, 3,240, 3,248, 1,248, 0,252, 0,248, 3,224, 15,0, 255,0, 255,0, 255,0, 255,0, 255,0
		DB 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 248,0, 224,3, 240,7, 224,7, 224,15, 192,15, 128,31, 0,62, 0,254, 0,252, 0,254, 0,255, 0,255, 0,191, 0,15, 96,3, 248,1, 252,0, 127,0, 63,0, 31,128, 31,192, 31,192, 15,192, 15,224, 15,224
		DB 128,11, 128,59, 0,60, 1,112, 7,96, 15,224, 15,192, 31,192, 1,240, 7,128, 63,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 254,0, 254,0, 255,0, 255,0, 255,0, 255,0, 255,0, 15,160, 7,224, 7,112, 7,112, 7,112, 0,112, 0,124, 0,62

_sabdead:
        db CMAINREG
        db 2,6
        db 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 254,0, 255,0, 255,0, 255,0, 255,0, 248,0, 240,3, 192,7, 0,30, 255,0, 255,0, 255,0, 255,0, 0,0, 0,254, 0,255, 0,31, 255,0, 255,0, 255,0, 255,0, 255,0, 63,0, 7,128, 0,240, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 127,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
        db 240,0, 224,7, 224,15, 224,15, 0,15, 0,111, 0,247, 0,224, 0,253, 0,253, 0,255, 0,255, 0,252, 0,235, 0,139, 0,5, 0,236, 0,243, 0,253, 0,142, 0,98, 0,158, 0,253, 0,242, 0,31, 0,255, 0,255, 0,224, 0,255, 0,255, 0,252, 0,115, 15,0, 1,224, 0,124, 0,159, 0,231, 0,251, 0,253, 0,28, 255,0, 255,0, 127,0, 0,0, 0,254, 0,255, 0,255, 0,126
.sbdead

_sabpnch:
        db CMAINREG
        db 6,4
        db 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 252,0, 248,1, 240,3, 240,7, 240,7, 240,7, 240,7, 255,0, 31,0, 15,192, 7,224, 7,240, 7,240, 7,80, 7,32, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0
        db 255,0, 255,0, 255,0, 254,0, 254,0, 254,0, 254,0, 254,0, 128,7, 0,119, 0,111, 0,223, 0,222, 0,223, 0,223, 0,207, 7,240, 7,240, 1,240, 0,236, 0,62, 0,192, 0,255, 0,255, 255,0, 255,0, 255,0, 240,0, 128,7, 0,63, 0,255, 0,255
        db 254,0, 254,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 0,215, 0,217, 0,110, 0,111, 0,111, 128,55, 128,55, 128,15, 0,255, 0,252, 0,2, 0,254, 0,254, 0,254, 0,254, 0,254, 0,240, 7,0, 63,0, 31,192, 15,224, 15,224, 31,192, 31,0
        db 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 240,4, 240,4, 240,7, 240,7, 224,15, 192,15, 192,31, 192,31, 0,2, 0,255, 0,255, 0,255, 0,255, 0,255, 0,255, 0,207, 127,0, 63,0, 63,128, 31,128, 31,192, 15,192, 15,224, 7,224
        db 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 192,31, 128,63, 128,62, 128,62, 0,126, 0,124, 1,124, 1,124, 0,7, 112,3, 120,3, 248,1, 252,1, 252,1, 252,0, 254,0, 7,240, 7,240, 7,240, 7,240, 7,240, 7,240, 7,240, 15,224
        db 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 1,124, 1,68, 129,60, 129,60, 131,56, 131,56, 1,124, 1,124, 254,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 15,160, 15,224, 15,224, 15,224, 15,224, 7,240, 1,252, 0,254
.endpnch


sabspend: