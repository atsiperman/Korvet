; ---- sprites for triggered objects

; ---- list of images for triggered objects, which are drawn in the right corner
;
trimglst:
        dw redbrick
        dw shuriken

; ---- list of objects which can be thrown
othrwlst:
        dw smbrick      ; small brick
        dw smshrkn      ; small shuriken

smbrick:
        db CMAINREG
        db 1,1
        db 0,30, 0,62, 0,122, 0,134, 0,244, 0,248, 0,240, 0,0

smshrkn:
        db CMAINREG
        db 1,1
        db 0,2, 0,198, 0,108, 0,56, 0,28, 0,54, 0,99, 0,64

shuriken:
        db 4,24
        db 2,0, CBLUE,255, 2,0, CBLUE,255, 2,0, CBLUE,255, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,128, CBLUE,127, 2,0, CBLUE,255, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,0, CBLUE,255, 2,128, CBLUE,127, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,128, CBLUE,127, 2,0, CBLUE,255, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,1, CBLUE,254, 2,128, CBLUE,127, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,128, CBLUE,127, 2,1, CBLUE,254, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,3, CBLUE,252, 2,192, CBLUE,63, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,240, CBLUE,15, 2,127, CBLUE,128, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,15, CBLUE,240, 2,254, CBLUE,1, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,192, CBLUE,63, 2,3, CBLUE,252, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,1, CBLUE,254, 2,128, CBLUE,127, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,128, CBLUE,127, 2,1, CBLUE,254, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,1, CBLUE,254, 2,0, CBLUE,255, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,0, CBLUE,255, 2,1, CBLUE,254, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,1, CBLUE,254, 2,0, CBLUE,255, 2,0, CBLUE,255
        db 2,0, CBLUE,255, 2,0, CBLUE,255, 2,0, CBLUE,255, 2,0, CBLUE,255

        db 3,0, CBLACK,255, 3,0, CBLACK,255, 3,0, CBLACK,255, 3,0, CBLACK,255
        db 3,0, CBLACK,255, 3,0, CBLACK,255, 3,0, CBLACK,255, 3,0, CBLACK,255
        db 3,117, CBLACK,138, 3,86, CBLACK,169, 3,85, CBLACK,170, 3,210, CBLACK,45
        db 3,26, CBLACK,229, 3,85, CBLACK,170, 3,85, CBLACK,170, 3,69, CBLACK,186

        db 3,119, CBLACK,136, 3,86, CBLACK,169, 3,89, CBLACK,166, 3,158, CBLACK,97
        db 3,22, CBLACK,233, 3,85, CBLACK,170, 3,85, CBLACK,170, 3,21, CBLACK,234
        db 3,117, CBLACK,138, 3,37, CBLACK,218, 3,85, CBLACK,170, 3,210, CBLACK,45
        db 3,0, CBLACK,255, 3,0, CBLACK,255, 3,0, CBLACK,255, 3,0, CBLACK,255

; ---- big red brick in the right bottom corner
redbrick:
        db 4,24
        db 0,255, CRED,0, 0,255, CRED,0, 0,193, CRED,62, 0,255, CRED,0
        db 0,63, CRED,192, 0,10, CRED,245, 0,255, CRED,0, 0,255, CRED,0
        db 0,255, CRED,0, 0,252, CRED,3, 0,5, CRED,250, 0,71, CRED,184
        db 0,169, CRED,86, 0,10, CRED,245, 0,240, CRED,15, 0,255, CRED,0
        db 0,255, CRED,0, 0,192, CRED,63, 0,4, CRED,251, 0,80, CRED,175
        db 0,0, CRED,255, 0,1, CRED,254, 0,0, CRED,255, 0,255, CRED,0
        db 0,252, CRED,3, 0,0, CRED,255, 0,10, CRED,245, 0,148, CRED,107
        db 0,42, CRED,213, 0,21, CRED,234, 0,0, CRED,255, 0,240, CRED,15
        db 0,192, CRED,63, 0,0, CRED,255, 0,168, CRED,87, 0,84, CRED,171
        db 0,170, CRED,85, 0,82, CRED,173, 0,65, CRED,190, 0,21, CRED,234
        db 0,66, CRED,189, 0,170, CRED,85, 0,133, CRED,122, 0,84, CRED,171
        db 0,170, CRED,85, 0,10, CRED,245, 0,69, CRED,186, 0,40, CRED,215
        db 0,85, CRED,170, 0,16, CRED,239, 0,85, CRED,170, 0,84, CRED,171
        db 0,168, CRED,87, 0,170, CRED,85, 0,160, CRED,95, 0,42, CRED,213
        db 0,85, CRED,170, 0,85, CRED,170, 0,85, CRED,170, 0,65, CRED,190
        db 0,135, CRED,120, 0,170, CRED,85, 0,168, CRED,87, 0,42, CRED,213
        db 0,85, CRED,170, 0,85, CRED,170, 0,85, CRED,170, 0,31, CRED,224
        db 0,127, CRED,128, 0,168, CRED,87, 0,168, CRED,87, 0,42, CRED,213
        db 0,149, CRED,106, 0,85, CRED,170, 0,81, CRED,174, 0,255, CRED,0
        db 0,255, CRED,0, 0,135, CRED,120, 0,168, CRED,87, 0,226, CRED,29
        db 0,252, CRED,3, 0,84, CRED,171, 0,31, CRED,224, 0,255, CRED,0
        db 0,255, CRED,0, 0,127, CRED,128, 0,136, CRED,119, 0,255, CRED,0
        db 0,255, CRED,0, 0,243, CRED,12, 0,255, CRED,0, 0,255, CRED,0
        db 0,255, CRED,0, 0,255, CRED,0, 0,255, CRED,0, 0,255, CRED,0
