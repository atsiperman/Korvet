
maskoproc:
        ret 

bigplate:
        db CMAINREG
        db 1,3
        db 128,127, 128,64, 128,64, 128,96, 224,16, 224,16, 240,8, 240,8, 0,255, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,255, 0,1, 0,1, 0,3, 3,4, 3,4, 7,8, 7,8

smlplate:
        db CMAINREG
        db 1,3
        db 128,127, 128,64, 192,32, 224,16, 128,127, 128,64, 192,32, 224,16, 0,255, 0,0, 0,0, 0,0, 0,255, 0,0, 0,0, 0,0, 0,255, 0,1, 1,2, 3,4, 0,255, 0,1, 1,2, 3,4

s36wfrm:
        db CMAINREG
        db 4,1
        db 129,60, 195,24, 195,24, 195,24, 195,24, 195,24, 195,24, 195,24
        db 195,24, 195,24, 195,24, 195,24, 195,24, 195,24, 195,24, 195,24
        db 195,24, 195,24, 195,24, 195,24, 195,24, 195,24, 195,24, 195,24
        db 195,24, 195,24, 195,24, 195,24, 195,24, 195,24, 195,24, 129,60

s36wfrml:
        db CMAINREG
        db 4,1
        db 15,224, 31,192, 31,192, 31,192, 31,192, 31,192, 31,192, 31,192
        db 31,192, 31,192, 31,192, 31,192, 31,192, 31,192, 31,192, 31,192
        db 31,192, 31,192, 31,192, 31,192, 31,192, 31,192, 31,192, 31,192
        db 31,192, 31,192, 31,192, 31,192, 31,192, 31,192, 31,192, 15,224

s36wfrmr:
        db CMAINREG
        db 4,1
        db 240,7, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3
        db 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3
        db 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3
        db 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 240,7

desk:
        db CMAINREG
        db 4,2
        db 255,0, 255,0, 255,0, 255,0, 248,0, 240,7, 240,7, 240,0, 255,0, 255,0, 255,0, 231,0, 195,24, 3,24, 3,88, 1,0
        db 224,15, 192,31, 128,63, 128,63, 192,0, 254,0, 254,0, 254,0, 0,254, 0,254, 0,250, 0,254, 1,176, 7,176, 7,176, 7,176
        db 254,0, 254,0, 254,0, 254,0, 254,0, 254,0, 254,0, 254,0, 7,176, 7,176, 7,176, 7,176, 7,176, 7,176, 7,176, 7,176
        db 254,0, 254,0, 254,0, 228,0, 192,26, 192,0, 128,63, 0,127, 7,176, 7,176, 7,176, 7,176, 7,176, 3,176, 1,252, 0,254

trash:
        db CMAINREG
        db 2,6
        db 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 248,0, 240,7, 240,4, 240,7, 192,0, 255,0, 255,0, 248,0, 16,7, 0,229, 0,37, 0,231, 0,27, 255,0, 255,0, 255,0, 2,0, 0,120, 0,7, 0,4, 0,196, 255,0, 255,0, 255,0, 63,0, 7,192, 3,56, 3,232, 0,52, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 255,0, 127,0
        db 255,0, 255,0, 252,0, 240,3, 0,12, 0,249, 0,158, 0,241, 128,49, 0,74, 0,70, 0,54, 0,138, 0,255, 0,67, 0,66, 0,163, 0,194, 0,220, 0,97, 0,66, 0,127, 0,225, 0,191, 0,35, 0,254, 0,162, 0,127, 0,20, 0,8, 0,217, 0,38, 0,93, 0,190, 0,226, 0,127, 0,66, 0,252, 0,135, 0,252, 63,128, 63,128, 63,128, 63,0, 1,128, 0,126, 0,34, 0,254

fencelt:
        db CMAINREG
        db 4,1
        db 63,128, 31,64, 15,160, 7,80, 2,40, 64,21, 96,11, 112,7
        db 120,3, 120,3, 120,3, 120,3, 120,3, 120,3, 120,3, 120,3
        db 120,3, 120,3, 120,3, 120,3, 120,3, 120,3, 120,3, 56,3
        db 24,195, 8,99, 128,51, 192,27, 224,15, 240,7, 248,3, 252,1

fenceltl:
        db CMAINREG
        db 3,1
        db 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3
        db 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3
        db 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3, 248,3

fencert:
        db CMAINREG
        db 4,1
        db 252,1, 248,2, 240,5, 224,10, 64,20, 2,168, 6,208, 14,224
        db 30,192, 30,192, 30,192, 30,192, 30,192, 30,192, 30,192, 30,192
        db 30,192, 30,192, 30,192, 30,192, 30,192, 30,192, 30,192, 28,192
        db 24,195, 16,198, 1,204, 3,216, 7,240, 15,224, 31,192, 63,128

fencertl:
        db CMAINREG
        db 3,1
        db 31,192, 31,192, 31,192, 31,192, 31,192, 31,192, 31,192, 31,192
        db 31,192, 31,192, 31,192, 31,192, 31,192, 31,192, 31,192, 31,192
        db 31,192, 31,192, 31,192, 31,192, 31,192, 31,192, 31,192, 31,192

plrchain:
        db CMAINREG
        db 1,4
        db 255,0, 127,0, 31,128, 1,224, 0,62, 192,3, 252,0, 255,0, 255,0, 255,0, 255,0, 255,0, 15,0, 0,240, 0,31, 224,0, 255,0, 255,0, 255,0, 255,0, 224,0, 0,31, 0,240, 15,0, 255,0, 254,0, 240,1, 0,14, 0,249, 6,128, 127,0, 255,0

mrpillar:
      db 1,24
      db CBLACK,0,  CBLUE
      db CBLACK,60, CBLUE
      db CBLACK,255,CBLUE
      db CBLACK,183,CBLUE
      db CBLACK,108,CBLUE
      db CBLACK,92, CBLUE
      db CBLACK,126,CBLUE
      db CBLACK,58, CBLUE
      db CBLACK,54, CBLUE
      db CBLACK,108,CBLUE
      db CBLACK,92, CBLUE
      db CBLACK,126,CBLUE
      db CBLACK,58, CBLUE
      db CBLACK,54, CBLUE
      db CBLACK,108,CBLUE
      db CBLACK,92, CBLUE
      db CBLACK,126,CBLUE
      db CBLACK,58, CBLUE
      db CBLACK,54, CBLUE
      db CBLACK,110,CBLUE
      db CBLACK,92, CBLUE
      db CBLACK,124,CBLUE
      db CBLACK,62, CBLUE
      db CBLACK,126,CBLUE

barelimg:
        db 3,24
        db CRED, 255, 255, 254, CYELLOW
        db CRED, 128, 0, 2, CYELLOW
        db CRED, 189, 239, 122, CYELLOW
        db CRED, 253, 239, 126, CYELLOW
        db CRED, 125, 239, 124, CYELLOW
        db CRED, 123, 239, 188, CYELLOW
        db CRED, 123, 239, 188, CYELLOW
        db CRED, 123, 239, 188, CYELLOW
        db CRED, 192, 0, 6, CYELLOW
        db CRED, 215, 239, 214, CYELLOW
        db CRED, 183, 239, 218, CYELLOW
        db CRED, 183, 239, 218, CYELLOW
        db CRED, 183, 239, 218, CYELLOW
        db CRED, 183, 239, 218, CYELLOW
        db CRED, 215, 239, 214, CYELLOW
        db CRED, 192, 0, 6, CYELLOW
        db CRED, 123, 239, 188, CYELLOW
        db CRED, 123, 239, 188, CYELLOW
        db CRED, 123, 239, 188, CYELLOW
        db CRED, 125, 239, 124, CYELLOW
        db CRED, 253, 239, 126, CYELLOW
        db CRED, 189, 239, 122, CYELLOW
        db CRED, 128, 0, 2, CYELLOW
        db CRED, 255, 255, 254, CYELLOW

box22img:
      db 2,16
      db 0,255, 255, 3
      db 0,216,  21, 3
      db 0,168,  27, 3
      db 0,216,  21, 3
      db 0,255, 255, 3
      db 0,138, 177, 3
      db 0,138, 177, 3
      db 0,138, 177, 3
      db 0,138, 177, 3
      db 0,138, 177, 3
      db 0,138, 177, 3
      db 0,143, 241, 3
      db 0,168, 21,  3
      db 0,168, 21, 3
      db 0,136, 17,  3
      db 0,255, 255, 3    

box31img:
      db 1,24
      db 0,255, 3 
      db 0,216, 3
      db 0,168, 3 
      db 0,216, 3
      db 0,255, 3 
      db 0,138, 3  
      db 0,138, 3 
      db 0,138, 3 
      db 0,138, 3
      db 0,138, 3
      db 0,143, 3
      db 0,168, 3
      db 0,168, 3
      db 0,136, 3
      db 0,143, 3
      db 0,138, 3  
      db 0,138, 3 
      db 0,138, 3  
      db 0,138, 3 
      db 0,143, 3  
      db 0,168, 3 
      db 0,168, 3
      db 0,136, 3 
      db 0,255, 3

box32img:
      db 1,24
      db 0,255, 3
      db 0,0,   3 
      db 0,0,   3
      db 0,0,   3
      db 0,255, 3
      db 0,170, 3
      db 0,170, 3 
      db 0,170, 3 
      db 0,170, 3 
      db 0,170, 3 
      db 0,255, 3 
      db 0,0,   3 
      db 0,0,   3 
      db 0,0,   3 
      db 0,255, 3
      db 0,170, 3 
      db 0,170, 3 
      db 0,170, 3 
      db 0,170, 3 
      db 0,255, 3 
      db 0,0,   3 
      db 0,0,   3 
      db 0,0,   3 
      db 0,255, 3    

box33img:
       db 1,24
       db 0,255, 3
       db 0,21,  3
       db 0,27,  3
       db 0,21,  3
       db 0,255, 3
       db 0,177, 3
       db 0,177, 3
       db 0,177, 3
       db 0,177, 3
       db 0,177, 3
       db 0,241, 3
       db 0,21,  3
       db 0,21,  3
       db 0,17,  3
       db 0,241, 3
       db 0,177, 3
       db 0,177, 3
       db 0,177, 3
       db 0,177, 3
       db 0,241, 3
       db 0,21,  3
       db 0,21,  3
       db 0,17,  3
       db 0,255, 3    


box41img:
      db 1,32
      db 0,255, 3 
      db 0,216, 3
      db 0,168, 3 
      db 0,216, 3
      db 0,255, 3 
      db 0,138, 3  
      db 0,138, 3 
      db 0,138, 3 
    
      db 0,138, 3
      db 0,138, 3
      db 0,143, 3
      db 0,168, 3
      db 0,168, 3
      db 0,136, 3
      db 0,143, 3
      db 0,138, 3  

      db 0,138, 3
      db 0,138, 3
      db 0,143, 3
      db 0,168, 3
      db 0,168, 3
      db 0,136, 3
      db 0,143, 3
      db 0,138, 3  

      db 0,138, 3 
      db 0,138, 3  
      db 0,138, 3 
      db 0,143, 3  
      db 0,168, 3 
      db 0,168, 3
      db 0,136, 3 
      db 0,255, 3

box42img:
      db 1,32
      db 0,255, 3
      db 0,0,   3 
      db 0,0,   3
      db 0,0,   3
      db 0,255, 3
      db 0,170, 3
      db 0,170, 3 
      db 0,170, 3 

      db 0,170, 3 
      db 0,170, 3 
      db 0,255, 3 
      db 0,0,   3 
      db 0,0,   3 
      db 0,0,   3 
      db 0,255, 3
      db 0,170, 3 

      db 0,170, 3 
      db 0,170, 3 
      db 0,255, 3 
      db 0,0,   3 
      db 0,0,   3 
      db 0,0,   3 
      db 0,255, 3
      db 0,170, 3 

      db 0,170, 3 
      db 0,170, 3 
      db 0,170, 3 
      db 0,255, 3 
      db 0,0,   3 
      db 0,0,   3 
      db 0,0,   3 
      db 0,255, 3    

box43img:
       db 1,32
       db 0,255, 3
       db 0,21,  3
       db 0,27,  3
       db 0,21,  3
       db 0,255, 3
       db 0,177, 3
       db 0,177, 3
       db 0,177, 3

       db 0,177, 3
       db 0,177, 3
       db 0,241, 3
       db 0,21,  3
       db 0,21,  3
       db 0,17,  3
       db 0,241, 3
       db 0,177, 3

       db 0,177, 3
       db 0,177, 3
       db 0,241, 3
       db 0,21,  3
       db 0,21,  3
       db 0,17,  3
       db 0,241, 3
       db 0,177, 3

       db 0,177, 3
       db 0,177, 3
       db 0,177, 3
       db 0,241, 3
       db 0,21,  3
       db 0,21,  3
       db 0,17,  3
       db 0,255, 3    

tape11im:
        db 1,8
        db CBLACK, 0, CBLACK
        db CBLACK, 0, CBLACK
        db CBLACK, 0, CBLACK
        db CBLACK, 0, CBLACK
        db CBLACK, 0, CBLACK
        db CBLACK, 0, CBLACK
        db CBLACK, 0, CBLACK
        db CBLACK, 0, CBLACK

tape14im:
        db 1,8
        db CBLACK, 255, CRED
        db CBLACK, 255, CRED
        db CBLACK, 251, CRED
        db CBLACK, 219, CRED
        db CBLACK, 223, CRED
        db CBLACK, 255, CRED
        db CBLACK, 247, CRED
        db CBLACK, 246, CRED

tape21im:
        db 1,8
        db CBLACK, 223, CYELLOW
        db CBLACK, 255, CYELLOW
        db CBLACK, 255, CYELLOW
        db CBLACK, 251, CYELLOW
        db CBLACK, 255, CYELLOW
        db CBLACK, 255, CYELLOW
        db CBLACK, 239, CYELLOW
        db CBLACK, 255, CYELLOW

tape22im:
        db 1,8
        db CMAIN, 243, CCYAN
        db CMAIN, 201, CCYAN
        db CMAIN, 137, CCYAN
        db CMAIN, 182, CCYAN
        db CMAIN, 200, CCYAN
        db CMAIN, 201, CCYAN
        db CMAIN, 231, CCYAN
        db CMAIN, 255, CCYAN

tape24im:
        db 1,8
        db CBLACK, 254, CYELLOW
        db CBLACK, 247, CYELLOW
        db CBLACK, 247, CYELLOW
        db CBLACK, 223, CYELLOW
        db CBLACK, 223, CYELLOW
        db CBLACK, 253, CYELLOW
        db CBLACK, 253, CYELLOW
        db CBLACK, 255, CYELLOW

tape32im:
        db 1,8
        db CMAIN, 255, CGREEN
        db CMAIN, 175, CGREEN
        db CMAIN, 175, CGREEN
        db CMAIN, 175, CGREEN
        db CMAIN, 173, CGREEN
        db CMAIN, 173, CGREEN
        db CMAIN, 255, CGREEN
        db CMAIN, 255, CGREEN

tape4im:
        db 1,8
        db CBLACK, 255, CMAIN
        db CBLACK, 255, CMAIN
        db CBLACK, 0, CMAIN
        db CBLACK, 255, CMAIN
        db CBLACK, 255, CMAIN
        db CBLACK, 255, CMAIN
        db CBLACK, 219, CMAIN
        db CBLACK, 255, CMAIN

wgnbtml:
        db 3,8
        db CBLUE, 127, 255, 255, CMAIN
        db CBLUE, 127, 255, 255, CMAIN
        db CBLUE, 127, 255, 255, CMAIN
        db CBLUE, 127, 255, 255, CMAIN
        db CBLUE, 127, 255, 255, CMAIN
        db CBLUE, 127, 255, 255, CMAIN
        db CBLUE, 127, 255, 255, CMAIN
        db CBLUE, 127, 255, 255, CMAIN

wgnbtmr:
        db 3,8
        db CBLUE, 255, 255, 254, CMAIN
        db CBLUE, 255, 255, 254, CMAIN
        db CBLUE, 255, 255, 254, CMAIN
        db CBLUE, 255, 255, 254, CMAIN
        db CBLUE, 255, 255, 254, CMAIN
        db CBLUE, 255, 255, 254, CMAIN
        db CBLUE, 255, 255, 254, CMAIN
        db CBLUE, 255, 255, 254, CMAIN        

wgncynl:
        db 3,8
        db CCYAN, 127, 255, 255, CMAIN
        db CCYAN, 127, 255, 255, CMAIN
        db CCYAN, 127, 255, 255, CMAIN
        db CCYAN, 127, 255, 255, CMAIN
        db CCYAN, 127, 255, 255, CMAIN
        db CCYAN, 127, 255, 255, CMAIN
        db CCYAN, 127, 255, 255, CMAIN
        db CCYAN, 127, 255, 255, CMAIN

wgncynr:
        db 3,8
        db CCYAN, 255, 255, 254, CMAIN
        db CCYAN, 255, 255, 254, CMAIN
        db CCYAN, 255, 255, 254, CMAIN
        db CCYAN, 255, 255, 254, CMAIN
        db CCYAN, 255, 255, 254, CMAIN
        db CCYAN, 255, 255, 254, CMAIN
        db CCYAN, 255, 255, 254, CMAIN
        db CCYAN, 255, 255, 254, CMAIN                

wgnmdl:
        db 1,8
        db CBLUE, 127, CMAIN
        db CBLUE, 127, CMAIN
        db CBLUE, 127, CMAIN
        db CBLUE, 127, CMAIN
        db CBLUE, 127, CMAIN
        db CBLUE, 127, CMAIN
        db CBLUE, 127, CMAIN
        db CBLUE, 127, CMAIN

wgnmdr:
        db 1,8
        db CBLUE, 254, CMAIN
        db CBLUE, 254, CMAIN
        db CBLUE, 254, CMAIN
        db CBLUE, 254, CMAIN
        db CBLUE, 254, CMAIN
        db CBLUE, 254, CMAIN
        db CBLUE, 254, CMAIN
        db CBLUE, 254, CMAIN        

wgntopl:
        db 3,8
        db CBLUE, 192, 0, 0, CMAIN
        db CBLUE, 191, 255, 255, CMAIN
        db CBLUE, 127, 255, 255, CMAIN
        db CBLUE, 127, 255, 255, CMAIN
        db CBLUE, 127, 255, 255, CMAIN
        db CBLUE, 127, 255, 255, CMAIN
        db CBLUE, 127, 255, 255, CMAIN
        db CBLUE, 127, 255, 255, CMAIN

wgntopr:
        db 3,8
        db CBLUE, 0, 0, 3, CMAIN
        db CBLUE, 255, 255, 253, CMAIN
        db CBLUE, 255, 255, 254, CMAIN
        db CBLUE, 255, 255, 254, CMAIN
        db CBLUE, 255, 255, 254, CMAIN
        db CBLUE, 255, 255, 254, CMAIN
        db CBLUE, 255, 255, 254, CMAIN
        db CBLUE, 255, 255, 254, CMAIN

wgnwind:
        db CMAINREG
        db 2,4
        db 0,131, 124,1, 124,1, 124,1, 124,1, 124,1, 0,131, 0,255, 0,131, 124,1, 124,1, 124,1, 124,1, 124,1, 0,131, 0,255, 0,131, 124,1, 124,1, 124,1, 124,1, 124,1, 0,131, 0,255, 0,131, 124,1, 124,1, 124,1, 124,1, 124,1, 0,131, 0,255
        db 0,131, 124,1, 124,1, 124,1, 124,1, 124,1, 0,131, 0,255, 0,131, 124,1, 124,1, 124,1, 124,1, 124,1, 0,131, 0,255, 0,131, 124,1, 124,1, 124,1, 124,1, 124,1, 0,131, 0,255, 0,131, 124,1, 124,1, 124,1, 124,1, 124,1, 0,131, 0,255

wgnnm1:
        db 2,16
        db CBLUE, 0, 0, CWHITE
        db CBLUE, 127, 254, CWHITE
        db CBLUE, 127, 254, CWHITE
        db CBLUE, 127, 126, CWHITE
        db CBLUE, 127, 126, CWHITE
        db CBLUE, 127, 126, CWHITE
        db CBLUE, 127, 126, CWHITE
        db CBLUE, 127, 126, CWHITE
        db CBLUE, 126, 126, CWHITE
        db CBLUE, 126, 126, CWHITE
        db CBLUE, 126, 126, CWHITE
        db CBLUE, 126, 126, CWHITE
        db CBLUE, 126, 126, CWHITE
        db CBLUE, 127, 254, CWHITE
        db CBLUE, 127, 254, CWHITE
        db CBLUE, 0, 0, CWHITE

wgnnm2:
        db 2,16
        db CBLUE, 0, 0, CWHITE
        db CBLUE, 127, 254, CWHITE
        db CBLUE, 112, 14, CWHITE
        db CBLUE, 113, 206, CWHITE
        db CBLUE, 127, 206, CWHITE
        db CBLUE, 127, 206, CWHITE
        db CBLUE, 112, 14, CWHITE
        db CBLUE, 112, 14, CWHITE
        db CBLUE, 115, 254, CWHITE
        db CBLUE, 115, 254, CWHITE
        db CBLUE, 115, 254, CWHITE
        db CBLUE, 115, 142, CWHITE
        db CBLUE, 112, 14, CWHITE
        db CBLUE, 127, 254, CWHITE
        db CBLUE, 127, 254, CWHITE
        db CBLUE, 0, 0, CWHITE

railimg:
        db 1,8
        db CMAIN, 195, CWHITE
        db CMAIN, 153, CWHITE
        db CMAIN, 189, CWHITE
        db CMAIN, 60, CWHITE
        db CMAIN, 126, CWHITE
        db CMAIN, 126, CWHITE
        db CMAIN, 255, CWHITE
        db CMAIN, 255, CWHITE

s57hx:
        db 2,8
        db CCYAN, 15, 248, CMAIN
        db CCYAN, 51, 228, CMAIN
        db CCYAN, 60, 156, CMAIN
        db CCYAN, 62, 124, CMAIN
        db CCYAN, 57, 156, CMAIN
        db CCYAN, 39, 228, CMAIN
        db CCYAN, 31, 248, CMAIN
        db CCYAN, 63, 252, CMAIN

s57hndl:
        db CMAINREG
        db 2,1
        db 129,60, 129,60, 195,24, 195,24, 195,24, 195,24, 129,60, 129,60
        db 129,60, 129,60, 195,24, 195,24, 195,24, 195,24, 129,60, 129,60

s57hlt:
        db CMAINREG
        db 1,1
        db 195,24, 192,24, 192,25, 192,31, 192,31, 192,25, 192,24, 195,24

s57hrt:
        db CMAINREG
        db 1,1
        db 195,24, 3,24, 3,152, 3,248, 3,248, 3,152, 3,24, 195,24
