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

s3trm:
    db 2
    mkstone 24, 6
    mkbrick 22, 15

s16trm:
    db 3    
    mkstone 12,14
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
    db 1
    mkgrnd 6, 12

s51trm:
    db 1
    mkdesk 19,15,dooropn

s57trm:
    db 1
    mkpipe 5, 14

s64trm:
    db 2
    mktrig           13, 14, trgauto + trxonly, wgntract, wgn2trl
    mktrig2 trdisab, 15, 14, trgauto + trxonly, wgntract, wgn2trr        ; right trigger is disabled 

s70trm:
    db 1
    mkknife 18, 15

s105trm:
    db 1
    mkdesk 23,8,dooropn

s113trm:
    db 1
    mkpipe 2, 10
