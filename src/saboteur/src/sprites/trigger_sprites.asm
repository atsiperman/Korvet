; ---- sprites for triggered objects

; ---- list of images for triggered objects, which are drawn in the right corner
;
trimglst:
        dw redbrick
        dw shuriken
        dw knife
        dw stone
        dw pipe
        dw granade

; ---- list of objects which can be thrown
othrwlst:
        dw smbrick      ; small brick
        dw smshrkn      ; small shuriken
        dw smknife      ; small knife
        dw smstone
        dw smpipe
        dw smgrnd

smgrnd:
        db CMAINREG
        db 1,1
        db 0,0, 0,56, 0,24, 0,44, 0,60, 0,60, 0,28, 0,0

smbrick:
        db CMAINREG
        db 1,1
        db 0,30, 0,62, 0,122, 0,134, 0,244, 0,248, 0,240, 0,0

smshrkn:
        db CMAINREG
        db 1,1
        db 0,2, 0,198, 0,108, 0,56, 0,28, 0,54, 0,99, 0,64

smknife:
        db CMAINREG
        db 1,1
        db 0,0, 0,4, 0,4, 0,63, 0,255, 0,4, 0,4, 0,0

smstone:
        db CMAINREG
        db 1,1
        db 0,0, 0,60, 0,76, 0,118, 0,118, 0,118, 0,62, 0,0

smpipe:
        db CMAINREG
        db 1,1
        db 255,0, 255,0, 0,0, 0,126, 0,126, 0,0, 255,0, 255,0

shuriken:
        db 4,24
        db 2, 0, 0, 0, 0, CBLUE
        db 2, 0, 0, 128, 0, CBLUE
        db 2, 0, 0, 128, 0, CBLUE
        db 2, 0, 0, 128, 0, CBLUE
        db 2, 0, 1, 128, 0, CBLUE
        db 2, 0, 1, 128, 0, CBLUE
        db 2, 0, 3, 192, 0, CBLUE
        db 2, 0, 127, 240, 0, CBLUE
        db 2, 0, 15, 254, 0, CBLUE
        db 2, 0, 3, 192, 0, CBLUE
        db 2, 0, 1, 128, 0, CBLUE
        db 2, 0, 1, 128, 0, CBLUE
        db 2, 0, 1, 0, 0, CBLUE
        db 2, 0, 1, 0, 0, CBLUE
        db 2, 0, 1, 0, 0, CBLUE
        db 2, 0, 0, 0, 0, CBLUE
        db 2, 0, 0, 0, 0, CBLACK
        db 2, 0, 0, 0, 0, CBLACK
        db 2, 117, 86, 85, 210, CBLACK
        db 2, 69, 85, 85, 26, CBLACK
        db 2, 119, 86, 89, 158, CBLACK
        db 2, 21, 85, 85, 22, CBLACK
        db 2, 117, 37, 85, 210, CBLACK
        db 2, 0, 0, 0, 0, CBLACK

; ---- big red brick in the right bottom corner
redbrick:
        db 4,24
        db CRED, 0, 0, 62, 0, CBLACK
        db CRED, 0, 0, 245, 192, CBLACK
        db CRED, 0, 3, 250, 184, CBLACK
        db CRED, 0, 15, 245, 86, CBLACK
        db CRED, 0, 63, 251, 175, CBLACK
        db CRED, 0, 255, 254, 255, CBLACK
        db CRED, 3, 255, 245, 107, CBLACK
        db CRED, 15, 255, 234, 213, CBLACK
        db CRED, 63, 255, 87, 171, CBLACK
        db CRED, 234, 190, 173, 85, CBLACK
        db CRED, 189, 85, 122, 171, CBLACK
        db CRED, 215, 186, 245, 85, CBLACK
        db CRED, 170, 239, 170, 171, CBLACK
        db CRED, 213, 95, 85, 87, CBLACK
        db CRED, 170, 170, 170, 190, CBLACK
        db CRED, 213, 87, 85, 120, CBLACK
        db CRED, 170, 170, 170, 224, CBLACK
        db CRED, 213, 87, 87, 128, CBLACK
        db CRED, 106, 170, 174, 0, CBLACK
        db CRED, 29, 87, 120, 0, CBLACK
        db CRED, 3, 171, 224, 0, CBLACK
        db CRED, 0, 119, 128, 0, CBLACK
        db CRED, 0, 12, 0, 0, CBLACK
        db CRED, 0, 0, 0, 0, CBLACK

knife:
        db 4,24
        db 2, 0, 0, 0, 12, CBLACK
        db 2, 0, 0, 0, 124, CBLACK
        db 2, 0, 0, 7, 216, CBLACK
        db 2, 0, 0, 15, 184, CBLACK
        db 2, 0, 0, 31, 176, CBLACK
        db 2, 0, 0, 127, 96, CBLACK
        db 2, 0, 0, 254, 192, CBLACK
        db 2, 0, 1, 249, 128, CBLACK
        db 2, 0, 7, 207, 0, CBLACK
        db 2, 0, 15, 190, 0, CBLACK
        db 2, 0, 190, 120, 0, CBLACK
        db 2, 0, 189, 224, 0, CBLACK
        db 2, 3, 95, 128, 0, CBLACK
        db 2, 15, 172, 0, 0, CBLACK
        db 2, 31, 80, 0, 0, CBLACK
        db 2, 223, 72, 0, 0, CBLACK
        db 2, 239, 132, 0, 0, CBLACK
        db 2, 111, 4, 0, 0, CBLACK
        db 2, 116, 0, 0, 0, CBLACK
        db 2, 56, 0, 0, 0, CBLACK
        db 2, 0, 0, 0, 0, CBLACK
        db 2, 0, 0, 0, 0, CBLACK
        db 2, 0, 0, 0, 0, CBLACK
        db 2, 0, 0, 0, 0, CBLACK

stone:
        db 4,24
        db CBLUE, 255, 255, 255, 255,CYELLOW
        db CBLUE, 255, 255, 255, 255,CYELLOW
        db CBLUE, 255, 255, 255, 255,CYELLOW
        db CBLUE, 255, 255, 255, 255,CYELLOW
        db CBLUE, 255, 255, 143, 255,CYELLOW
        db CBLUE, 255, 255, 3, 255,CYELLOW
        db CBLUE, 255, 254, 193, 255,CYELLOW
        db CBLUE, 255, 142, 192, 255,CYELLOW
        db CBLUE, 255, 1, 192, 63,CYELLOW
        db CBLUE, 255, 64, 224, 31,CYELLOW
        db CBLUE, 254, 192, 96, 15,CYELLOW
        db CBLUE, 254, 192, 32, 15,CYELLOW
        db CBLUE, 254, 224, 0, 15,CYELLOW
        db CBLUE, 255, 96, 3, 15,CYELLOW
        db CBLUE, 255, 112, 6, 7,CYELLOW
        db CBLUE, 255, 184, 12, 7,CYELLOW
        db CBLUE, 255, 206, 12, 15,CYELLOW
        db CBLUE, 254, 119, 128, 31,CYELLOW
        db CBLUE, 254, 56, 60, 63,CYELLOW
        db CBLUE, 255, 255, 255, 249,CYELLOW
        db CBLUE, 231, 251, 255, 255,CYELLOW
        db CBLUE, 255, 255, 255, 255,CYELLOW
        db CBLUE, 255, 255, 255, 255,CYELLOW
        db CBLUE, 255, 255, 255, 255,CYELLOW

pipe:
        db 4,24
        db CYELLOW, 0, 0, 0, 0, CBLUE
        db CYELLOW, 0, 0, 0, 0, CBLUE
        db CYELLOW, 0, 0, 0, 0, CBLUE
        db CYELLOW, 0, 0, 0, 0, CBLUE
        db CYELLOW, 127, 255, 255, 254, CBLUE
        db CYELLOW, 96, 0, 0, 2, CBLUE
        db CYELLOW, 113, 62, 7, 202, CBLUE
        db CYELLOW, 127, 255, 255, 250, CBLUE
        db CYELLOW, 127, 255, 255, 242, CBLUE
        db CYELLOW, 127, 255, 255, 254, CBLUE
        db CYELLOW, 0, 0, 0, 0, CBLUE
        db CYELLOW, 0, 0, 0, 0, CBLUE
        db CYELLOW, 0, 0, 0, 0, CBLUE
        db CYELLOW, 0, 0, 0, 0, CBLUE
        db CYELLOW, 0, 0, 0, 0, CBLUE
        db CYELLOW, 0, 0, 0, 0, CBLUE

        db CYELLOW, 0, 0, 0, 0, CBLACK
        db CYELLOW, 63, 62, 126, 124, CBLACK
        db CYELLOW, 33, 8, 66, 64, CBLACK
        db CYELLOW, 33, 8, 66, 124, CBLACK
        db CYELLOW, 63, 8, 126, 64, CBLACK
        db CYELLOW, 32, 8, 64, 64, CBLACK
        db CYELLOW, 32, 62, 64, 124, CBLACK
        db CYELLOW, 0, 0, 0, 0, CBLACK

granade:
        db 4,24
        db CGREEN, 0, 0, 0, 0, CBLUE
        db CGREEN, 0, 0, 0, 0, CBLUE
        db CGREEN, 0, 0, 0, 224, CBLUE
        db CGREEN, 0, 0, 57, 176, CBLUE
        db CGREEN, 0, 0, 13, 24, CBLUE
        db CGREEN, 0, 15, 246, 24, CBLUE
        db CGREEN, 0, 126, 123, 112, CBLUE
        db CGREEN, 0, 207, 157, 160, CBLUE
        db CGREEN, 1, 242, 109, 192, CBLUE
        db CGREEN, 3, 253, 246, 192, CBLUE
        db CGREEN, 7, 114, 246, 192, CBLUE
        db CGREEN, 15, 111, 106, 192, CBLUE
        db CGREEN, 15, 95, 170, 192, CBLUE
        db CGREEN, 27, 191, 190, 192, CBLUE
        db CGREEN, 27, 95, 220, 192, CBLUE
        db CGREEN, 58, 239, 220, 192, CBLUE
        db CGREEN, 61, 247, 172, 192, CBLUE
        db CGREEN, 61, 251, 105, 192, CBLUE
        db CGREEN, 22, 253, 249, 128, CBLUE
        db CGREEN, 31, 98, 113, 128, CBLUE
        db CGREEN, 12, 159, 227, 0, CBLUE
        db CGREEN, 15, 231, 199, 0, CBLUE
        db CGREEN, 3, 255, 142, 0, CBLUE
        db CGREEN, 0, 254, 0, 0, CBLUE
