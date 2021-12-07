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

s2stom:
        db 5
        mkstobj mrpillar, 8, 4
        mkstobj mrpillar, 13, 4
        mkstobj mrpillar, 18, 4
        mkstobj mrpillar, 23, 4
        mkstobj mrpillar, 28, 4

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
        db 9
        mkstobj barelimg, 2, 12
        mkstobj barelimg, 3, 9
        mkbox34 4, 12
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
