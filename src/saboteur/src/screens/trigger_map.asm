; ---- map of triggers 

    macro mkbrick colnum, rownum
    mktrig colnum, rownum, trgmanl, trobrck, itmproc
    endm

    macro mkknife colnum, rownum
    mktrig colnum, rownum, trgmanl, troknif, itmproc    
    endm

s3trm:
    db 2
    mkbrick 22, 15
    mkknife 24, 6

s70trm:
    db 1
    mkknife 18, 15