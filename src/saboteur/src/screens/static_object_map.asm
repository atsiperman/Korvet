;
;	this file contains definitions of static objects for all the screens
;
        macro mkbox33 colnum, rownum
        mkstobj box31img, colnum, rownum
        mkstobj box32img, colnum + 1, rownum
        mkstobj box33img, colnum + 2, rownum
        endm

        macro mkbox34 colnum, rownum
        mkstobj box31img, colnum, rownum
        mkstobj box32img, colnum + 1, rownum
        mkstobj box32img, colnum + 2, rownum
        mkstobj box33img, colnum + 3, rownum
        endm

        macro mkbox35 colnum, rownum
        mkstobj box31img, colnum, rownum
        mkstobj box32img, colnum + 1, rownum
        mkstobj box32img, colnum + 2, rownum
        mkstobj box32img, colnum + 3, rownum
        mkstobj box33img, colnum + 4, rownum
        endm

        macro mkbox43 colnum, rownum
        mkstobj box41img, colnum, rownum
        mkstobj box42img, colnum + 1, rownum
        mkstobj box43img, colnum + 2, rownum
        endm

        macro mkbox44 colnum, rownum
        mkstobj box41img, colnum, rownum
        mkstobj box42img, colnum + 1, rownum
        mkstobj box42img, colnum + 2, rownum
        mkstobj box43img, colnum + 3, rownum
        endm

        macro mkbox45 colnum, rownum
        mkstobj box41img, colnum, rownum
        mkstobj box42img, colnum + 1, rownum
        mkstobj box42img, colnum + 2, rownum
        mkstobj box42img, colnum + 3, rownum
        mkstobj box43img, colnum + 4, rownum
        endm

tapeimn EQU 16

        macro mktapem colnum, rownum
        mkstobj tape11im, colnum, rownum
        mkstobj tape11im, colnum + 1, rownum
        mkstobj tape11im, colnum + 2, rownum
        mkstobj tape14im, colnum + 3, rownum

        mkstobj tape21im, colnum, rownum + 1
        mkstobj tape22im, colnum + 1, rownum + 1
        mkstobj tape22im, colnum + 2, rownum + 1 
        mkstobj tape24im, colnum + 3, rownum + 1 

        mkstobj tape11im, colnum, rownum + 2
        mkstobj tape32im, colnum + 1, rownum + 2
        mkstobj tape11im, colnum + 2, rownum + 2
        mkstobj tape11im, colnum + 3, rownum + 2

        mkstobj tape4im, colnum, rownum + 3
        mkstobj tape4im, colnum + 1, rownum + 3
        mkstobj tape4im, colnum + 2, rownum + 3
        mkstobj tape4im, colnum + 3, rownum + 3
        endm

        macro mktapew colnum, rownum
        mktapem colnum, rownum
        mkstobj tape11im, colnum + 4, rownum
        mkstobj tape14im, colnum + 5, rownum
        mkstobj tape22im, colnum + 4, rownum + 1 
        mkstobj tape24im, colnum + 5, rownum + 1 
        mkstobj tape11im, colnum + 4, rownum + 2
        mkstobj tape11im, colnum + 5, rownum + 2
        mkstobj tape4im, colnum + 4, rownum + 3
        mkstobj tape4im, colnum + 5, rownum + 3
        endm 

s2stom:
        db 5
        mkstobj mrpillar, 8, 4
        mkstobj mrpillar, 13, 4
        mkstobj mrpillar, 18, 4
        mkstobj mrpillar, 23, 4
        mkstobj mrpillar, 28, 4

s25stom:
        db 15
        mkstobj wgnbtml, 12, 14
        mkstobj wgnbtmr, 15, 14
        mkstobj wgncynl, 12, 13
        mkstobj wgncynr, 15, 13
        mkstobj wgncynl, 12, 12
        mkstobj wgncynr, 15, 12
        mkstobj wgnbtml, 12, 11
        mkstobj wgnbtmr, 15, 11
        mkstobj wgnmdl,  12, 10
        mkstobj wgnmdl,  12, 9
        mkstobj wgnmdr,  17, 10
        mkstobj wgnmdr,  17, 9
        mkstobj wgntopl, 12, 8
        mkstobj wgntopr, 15, 8
        mkstobj wgnnm1, 14, 12

s30stom:
        db 12
        mkbox43 2,9
        mkbox33 5, 10
        mkbox33 11, 10
        mkbox33 24, 10

s46stom:
        db 3
        mkbox33 2, 9

s48stom:
        db 7
        mkstobj barelimg, 3, 10
        mkstobj barelimg, 3, 13
        mkstobj barelimg, 6, 13
        mkstobj barelimg, 13, 13
        mkbox33 24, 13

s49stom:
        db 12
        mkstobj barelimg, 5, 11
        mkbox44 2, 10
        mkbox44 14, 10
        mkbox33 25, 11

s57stom:
        db 17
        mkbox34 1,12
        mkbox33 6,12
        mkbox33 4,9
        mkstobj s57hx,14,8
        mkstobj s57hx,14,9
        mkstobj s57hx,14,10
        mkstobj s57hx,14,11
        mkstobj s57hx,14,12
        mkstobj s57hx,14,13
        mkstobj s57hx,14,14

s58stom:
        db tapeimn * 3
        mktapem 4, 11
        mktapem 11, 11
        mktapem 16, 11

s60stom:
        db 39
        mkstobj s60top, 0, 2
        mkstobj s60top, 1, 2
        mkstobj s60top, 2, 2
        mkstobj s60top, 3, 2
        mkstobj s60top, 4, 2
        mkstobj s60top, 5, 2
        mkstobj s60top, 6, 2
        mkstobj s60top, 7, 2
        mkstobj s60top, 8, 2
        mkstobj s60top, 9, 2
        mkstobj s60top, 10, 2
        mkstobj s60top, 11, 2
        mkstobj s60top, 12, 2
        mkstobj s60top, 13, 2
        mkstobj s60top, 14, 2
        mkstobj s60top, 15, 2
        mkstobj s60top, 16, 2
        mkstobj s60top, 17, 2
        mkstobj s60top, 18, 2
        mkstobj s60top, 19, 2
        mkstobj s60top, 20, 2

        mkstobj s60btm, 0, 7
        mkstobj s60btm, 1, 7
        mkstobj s60btm, 2, 7
        mkstobj s60btm, 3, 7
        mkstobj s60btm, 4, 7
        mkstobj s60btm, 5, 7
        mkstobj s60btm, 6, 7
        mkstobj s60btm, 7, 7
        mkstobj s60btm, 8, 7
        mkstobj s60btm, 9, 7
        mkstobj s60btm, 10, 7
        mkstobj s60btm, 11, 7
        mkstobj s60btm, 12, 7
        mkstobj s60btm, 13, 7
        mkstobj s60btm, 14, 7
        mkstobj s60btm, 15, 7
        mkstobj s60btm, 16, 7
        mkstobj s60btm, 17, 7

s61stom:
        db 39
        mkstobj s60top, 9, 2
        mkstobj s60top, 10, 2
        mkstobj s60top, 11, 2
        mkstobj s60top, 12, 2
        mkstobj s60top, 13, 2
        mkstobj s60top, 14, 2
        mkstobj s60top, 15, 2
        mkstobj s60top, 16, 2
        mkstobj s60top, 17, 2
        mkstobj s60top, 18, 2
        mkstobj s60top, 19, 2
        mkstobj s60top, 20, 2
        mkstobj s60top, 21, 2
        mkstobj s60top, 22, 2
        mkstobj s60top, 23, 2
        mkstobj s60top, 24, 2
        mkstobj s60top, 25, 2
        mkstobj s60top, 26, 2
        mkstobj s60top, 27, 2
        mkstobj s60top, 28, 2
        mkstobj s60top, 29, 2
        mkstobj s60btm, 12, 7
        mkstobj s60btm, 13, 7
        mkstobj s60btm, 14, 7
        mkstobj s60btm, 15, 7
        mkstobj s60btm, 16, 7
        mkstobj s60btm, 17, 7
        mkstobj s60btm, 18, 7
        mkstobj s60btm, 19, 7
        mkstobj s60btm, 20, 7
        mkstobj s60btm, 21, 7
        mkstobj s60btm, 22, 7
        mkstobj s60btm, 23, 7
        mkstobj s60btm, 24, 7
        mkstobj s60btm, 25, 7
        mkstobj s60btm, 26, 7
        mkstobj s60btm, 27, 7
        mkstobj s60btm, 28, 7
        mkstobj s60btm, 29, 7

s64stom:
        db 15
        mkstobj wgnbtml, 12, 14
        mkstobj wgnbtmr, 15, 14
        mkstobj wgncynl, 12, 13
        mkstobj wgncynr, 15, 13
        mkstobj wgncynl, 12, 12
        mkstobj wgncynr, 15, 12
        mkstobj wgnbtml, 12, 11
        mkstobj wgnbtmr, 15, 11
        mkstobj wgnmdl,  12, 10
        mkstobj wgnmdl,  12, 9
        mkstobj wgnmdr,  17, 10
        mkstobj wgnmdr,  17, 9
        mkstobj wgntopl, 12, 8
        mkstobj wgntopr, 15, 8
        mkstobj wgnnm2, 14, 12

s66stom:
        db 27
        mkbox33 2,13
        mkbox33 6,13
        mkbox34 11,13
        mkbox33 16,13
        mkbox33 23,13

        mkbox34 8,10
        mkbox33 14,10
        
        mkbox34 11,7

s67stom:
        db 18
        mkbox33 8,10
        mkbox34 12,10
        mkbox34 5,13
        mkbox34 9,13
        mkbox33 15,13

s73stom:
        db 7
        mkstobj barelimg, 11, 11
        mkstobj barelimg, 17, 9
        mkstobj barelimg, 15, 12
        mkstobj barelimg, 18, 12
        mkstobj barelimg, 21, 13
        mkstobj barelimg, 24, 13
        mkstobj barelimg, 21, 10

s74stom:
        db 10
        mkstobj barelimg, 0, 13
        mkstobj barelimg, 3, 13
        mkstobj barelimg, 7, 12
        mkbox33 20, 12
        mkbox34 25, 13


s75stom:
        db 22
        mkbox34 2, 13
        mkbox34 4, 10
        mkbox33 7, 13
        mkstobj barelimg, 12,13
        mkbox33 24, 13
        mkbox33 19, 13
        mkbox34 21, 10

s77stom:
        db 7
        mkstobj barelimg, 3, 10
        mkstobj barelimg, 2, 13        
        mkstobj barelimg, 5, 13
        mkbox34 19, 13

s78stom:
        db 12
        mkstobj barelimg, 7, 13
        mkstobj barelimg, 25, 13
        mkstobj barelimg, 22, 13
        mkstobj barelimg, 23, 10
        mkstobj barelimg, 17, 10
        mkbox33 11, 13
        mkbox34 16, 13

s79stom:
        db 13
        mkstobj barelimg, 6, 13
        mkstobj barelimg, 9, 13
        mkstobj barelimg, 8, 10
        mkstobj barelimg, 19, 13
        mkstobj barelimg, 22, 13
        mkstobj barelimg, 25, 13
        mkstobj barelimg, 21, 10
        mkstobj barelimg, 25, 10
        mkstobj barelimg, 23, 7
        mkbox34 14, 13

s80stom:
        db 18
        mkstobj barelimg, 2, 13
        mkstobj barelimg, 5, 13
        mkstobj barelimg, 8, 13
        mkstobj barelimg, 12, 13
        mkstobj barelimg, 3, 10
        mkstobj barelimg, 7, 10
        mkstobj barelimg, 10, 10
        mkstobj barelimg, 5, 7
        mkbox33 16, 13
        mkbox34 24, 13
        mkbox33 25, 10

s81stom:
        db 20
        mkstobj barelimg, 11, 13
        mkstobj barelimg, 14, 13
        mkstobj barelimg, 12, 10
        mkstobj barelimg, 15, 10
        mkstobj barelimg, 26, 13
        mkbox33 7,13
        mkbox34 15,13
        mkbox34 20,13
        mkbox34 18,10

s82stom:
        db 15
        mkbox33 2,13
        mkbox34 15,13
        mkbox34 21,13
        mkbox34 18,10

s84stom:
        db 16
        mkbox33 2, 12
        mkbox33 6, 13
        mkstobj barelimg, 10, 13
        mkstobj barelimg, 13,13
        mkstobj barelimg, 12, 10
        mkbox34 19, 13
        mkbox33 25, 13

s85stom:
        db 12
        mkstobj crane, 14, 2
        mkstobj crane, 14, 6
        mkstobj barelimg, 2, 12
        mkstobj barelimg, 3, 9
        mkbox35 4, 12
        mkbox33 21, 12

s86stom:
        db 8
        mkstobj barelimg, 2, 12
        mkstobj barelimg, 5, 12
        mkstobj barelimg, 16, 12
        mkstobj barelimg, 19, 12
        mkstobj barelimg, 22, 12
        mkstobj barelimg, 18, 9
        mkstobj barelimg, 21, 9
        mkstobj barelimg, 19, 6

s87stom:
        db 9
        mkbox43 18, 12
        mkstobj barelimg, 2, 10
        mkstobj barelimg, 3, 13
        mkstobj box22img, 14, 14
        mkstobj box22img, 20, 14
        mkstobj box22img, 23, 14
        mkstobj barelimg, 26, 13

s88stom:
        db 13
        mkbox45 4, 12
        mkbox45 12, 12
        mkbox33 20, 13

s89stom:
        db 13
        mkstobj barelimg, 2, 13
        mkstobj barelimg, 5, 13
        mkstobj barelimg, 8, 13
        mkstobj barelimg, 11, 13
        mkstobj barelimg, 3, 10
        mkstobj barelimg, 6, 10
        mkstobj barelimg, 9, 10
        mkstobj barelimg, 5, 7
        mkstobj barelimg, 8, 7
        mkstobj barelimg, 6, 4
        mkstobj barelimg, 18, 13
        mkstobj barelimg, 22, 13
        mkstobj barelimg, 25, 13

s91stom:
        db 3
        mkbox33 2,13

s93stom:
        db 3
        mkstobj barelimg, 11, 9
        mkstobj barelimg, 14, 9 
        mkstobj barelimg, 25, 9

s97stom:
        db tapeimn
        mktapem 1, 3

s98stom:
        db 29
        mkbox34 3,7
        mkstobj box22img, 5,5
        mkstobj box22img, 7,5
        mkbox33 8,7
        mkbox34 23,7
        mkbox34 19,7
        mkbox33 20,4
        mkbox34 23,4
        mkbox35 21,1


s99stom:
        db 4
        mkstobj barelimg, 16, 4
        mkstobj barelimg, 14, 7
        mkstobj barelimg, 17, 7
        mkstobj barelimg, 23, 7

s100stom:
        db 21
        mkbox33 2, 2
        mkbox34 2, 5
        mkbox33 8, 5
        mkstobj barelimg, 12, 5

        mkstobj barelimg, 3, 10
        mkstobj barelimg, 2, 13
        mkstobj barelimg, 5, 13

        mkstobj barelimg, 16, 13
        mkstobj barelimg, 19, 13
        mkstobj barelimg, 22, 13
        mkstobj barelimg, 25, 13

        mkstobj barelimg, 18, 10
        mkstobj barelimg, 22, 10
        mkstobj barelimg, 25, 10

s101stom:
        db 7
        mkbox33 2, 8
        mkbox44 2, 11

s103stom:
        db 3
        mkstobj barelimg, 8, 6
        mkstobj barelimg, 12, 6
        mkstobj barelimg, 19, 5

s104stom:
        db tapeimn * 2
        mktapem 1, 11
        mktapem 17, 11

s122stom:
        db 18
        mkbox33 4, 12
        mkbox33 14, 12
        mkbox33 17, 12
        mkbox33 21, 12
        mkbox33 15, 9
        mkbox33 19, 9

s124stom:
        db 3 + tapeimn * 2
        mkbox33 15, 13
        mktapem 4, 12
        mktapem 24, 12

s125stom:
        db tapeimn * 5
        mktapem 1, 12
        mktapem 7, 12
        mktapem 13, 12
        mktapem 18, 12
        mktapem 25, 12

s126stom:
        db (tapeimn * 3) + 8
        mktapem 2, 12
        mktapew 7, 12
        mktapem 25, 12
