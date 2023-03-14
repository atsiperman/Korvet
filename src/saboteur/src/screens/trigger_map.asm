; ---- map of triggers 

    macro mktrig colnum, rownum, trtype, objtype, procaddr
    mktrig2 tractiv, colnum, rownum, trtype, objtype, procaddr
    endm

    macro mktrig2 trstate, colnum, rownum, trtype, objtype, procaddr
    mktrig3 trstate, colnum, rownum, trtype, objtype, procaddr, 0
    endm

    macro mktrig3 trstate, colnum, rownum, trtype, objtype, procaddr, data
    db trstate				
    db colnum
    db trtype               ; trigger type - manual/auto
    db rownum
    dw objtype              ; object type (brick, desk, etc.) / auto trigger activation procedure
    dw procaddr
    db data                 ; custom data
    endm

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

    macro mkdesk colnum, rownum
    mktrig3 tractiv, colnum, rownum, trgmanl, trodskn, deskproc, dooropn
    endm    

    macro mkbomb colnum, rownum
    mktrig2 trdisab, colnum, rownum, trgmanl, trobomb, itmproc
    endm

trmapst:    ; start of trigger map

s3trm:
    db 2
    mkdesk 24, 6
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
    mkdesk 17,12
s30bmb:
    mkbomb 24, 12
    ;mktrig 24, 12, trgmanl, trobomb, itmproc

s35trm:
    db 1
    mkdesk 19, 14

s37trm:
    db 1
    mktrig3 tractiv, 22, 14, trgmanl, trodskn, dsktproc, trodisk

s37trd:         ; data for trigger from screen 37 (DISK)
    db 1        ; trigger is active

s41trm:
    db 1
    mkdesk 4,13

s45trm:
    db 1
    mkknife 23, 15

s51trm:
    db 1
    mkdesk 19,15

s57trm:
    db 1
    mkpipe 5, 14

s60trm:
    db 1
    mkdesk 24,14

s61trm:
    db 2
    mkdesk 13,14
    mkdesk 19,14

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
    db 2
    mkdesk 7, 6
    mkknife 18, 15

s73trm:
    db 1
s73bmb:
    mkbomb 17,14

s75trm:
    db 1
    mkgrnd 7,15

s79trm:
    db 1
    mkdesk 3, 15

s80trm:
    db 1
s80bmb:
    mkbomb 24, 15

s91trm:
    db 1
    mkknife 18, 15

s94trm:
    db 1
    mkdesk 14, 12

s95trm:
    db 3
    mkdesk 3, 15
    mkdesk 21, 14
    mkpipe 13, 7


s97trm:
    db 5
    mkdesk 6, 6
    mkdesk 9, 6
    mkdesk 12, 6
    mkdesk 15, 6
    mkdesk 18, 6

s98trm:
    db 1
s98bmb:
    mkbomb 21,9

s100trm:
    db 1
s100bmb:
    mkbomb 23,15

s101trm:
    db 1
    mkstone 5, 14

s102trm:
    db 2
    mkknife 12, 8
    mkdesk 18, 8

s104trm:
    db 4
    mkdesk 11, 14
    mkdesk 6, 14
    mkdesk 8, 14
    mkdesk 14, 14

s105trm:
    db 1
    mkdesk 23,8

s106trm:
    db 2
    mkdesk 3,8
    mkdesk 21,8

s113trm:
    db 1
    mkpipe 2, 10

s120trm:
    db 1
    mkdesk 13,12

s122trm:
    db 1
    mkstone 21, 14

s124trm:
    db 1
s124bmb:
    mkbomb 16, 15


trmapend:    ; end of trigger map