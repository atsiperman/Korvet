; ---- map of triggers 

    macro mkbrick colnum, rownum
    mktrig colnum, rownum, trgmanl, trobrck, itmproc
    endm

    macro mkknife colnum, rownum
    mktrig colnum, rownum, trgmanl, troknif, itmproc    
    endm

    macro mkstone colnum, rownum    
    mktrig colnum, rownum, trgmanl, troston, itmproc    
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

s70trm:
    db 1
    mkknife 18, 15