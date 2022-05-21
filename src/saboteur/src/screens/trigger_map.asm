; ---- map of triggers 

    macro mkgrnd colnum, rownum
    mktrig colnum, rownum, trgmanl, trogrnd, itmproc
    endm

    macro mkpipe colnum, rownum
    mktrig colnum, rownum, trgmanl, tropipe, itmproc
    endm

    macro mkbrick colnum, rownum
    mktrig colnum, rownum, trgmanl, trobrck, itmproc
    endm

    macro mkknife colnum, rownum
    mktrig colnum, rownum, trgmanl, troknif, itmproc    
    endm

    macro mkstone colnum, rownum    
    mktrig colnum, rownum, trgmanl, troston, itmproc    
    endm

    macro mkdesk colnum, rownum, data
    mktrig3 tractiv, colnum, rownum, trgmanl, trodskn, deskproc, data
    endm    

trmapst:    ; start of trigger map

s3trm:
    db 2
    mkdesk 24, 6, 0
    mkbrick 22, 15

s8trm:
    db 1
    mkbrick 21, 15

s9trm:
    db 1
    mkknife 17, 13

s16trm:
    db 3    
    mkstone 11,14
    mkstone 21,14
    mkbrick 23,14

s23trm:
    db 1
    mkbrick 7, 13

s25trm:
    db 2
    mktrig           13, 14, trgauto + trxonly, wgntract, wgn1trl
    mktrig2 trdisab, 15, 14, trgauto + trxonly, wgntract, wgn1trr        ; right trigger is disabled 

s30trm:
    db 3
    mkgrnd 6, 12
    mkdesk 17,12,0
    mktrig 24, 12, trgmanl, trobomb, itmproc

s41trm:
    db 1
    mkdesk 4,13,0

s45trm:
    db 1
    mkknife 23, 15

s51trm:
    db 1
    mkdesk 19,15,dooropn

s57trm:
    db 1
    mkpipe 5, 14

s60trm:
    db 1
    mkdesk 24,14,0

s61trm:
    db 2
    mkdesk 13,14,0
    mkdesk 19,14,0

s64trm:
    db 2
    mktrig           13, 14, trgauto + trxonly, wgntract, wgn2trl
    mktrig2 trdisab, 15, 14, trgauto + trxonly, wgntract, wgn2trr        ; right trigger is disabled 

s65trm:
    db 1
    mkbrick 8, 14

s66trm:
    db 1
    mkgrnd 24,15

s70trm:
    db 1
    mkknife 18, 15

s79trm:
    db 1
    mkdesk 3, 6, 0

s91trm:
    db 1
    mkknife 18, 15

s101trm:
    db 1
    mkstone 5, 14

s102trm:
    db 1
    mkknife 12, 8

s105trm:
    db 1
    mkdesk 23,8,dooropn

s113trm:
    db 1
    mkpipe 2, 10

trmapend:    ; end of trigger map