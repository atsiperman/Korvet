a_trig  EQU s104trm + 1 + trdodat
b_trig  EQU s105trm + 1 + trdodat
c_trig  EQU s97trm + 1 + trdodat
d_trig  EQU s79trm + 1 + trdodat
e_trig  EQU s51trm + 1 + trdodat        

; ---- set game triggers
; args: A - door state
;
        macro settrigs doorstate
        ld   a,doorstate
        ld   (a_trig),a
        ld   (b_trig),a
        ld   (c_trig),a
        ld   (d_trig),a
        ld   (e_trig),a
        endm        

        macro setbomb trigaddr
        ld      a,tractiv
        ld      (trigaddr),a
        endm
        
        macro settime num
        ld      hl,num
        ld      (timeinit),hl
        endm

        macro setcdtime num
        ld      hl,num
        ld      (timecntd),hl
        endm

        macro setlevel lvl
        ld      a,lvl
        ld      (dlevel),a
        endm
ginitst:

; ---- set up level 1 (open all doors)
;
setlvl1:
        ;settrigs dooropn
        setbomb s30bmb        
        ;settime 0300h
        ;setcdtime 00008h
        ret
        
; ---- set up level 2
;
setlvl2:
        settrigs dooropn
        ld   a,doorcls
        ld   (b_trig),a
        ld   (e_trig),a
        setbomb s80bmb
        settime 0509h
        ;settime 0300h
        setcdtime 0507h
        setlevel 2
        ret

; ---- set up level 3
;
setlvl3:
        settrigs dooropn
        ld   a,doorcls
        ld   (c_trig),a
        ld   (e_trig),a        
        setbomb s98bmb
        settime 0009h  
        setcdtime 0007h
        setlevel 3
        ret

; ---- set up level 4
;
setlvl4:
        settrigs dooropn
        ld   a,doorcls
        ld   (c_trig),a
        ld   (d_trig),a
        ld   (e_trig),a
        setbomb s124bmb
        settime 0008h
        setcdtime 0006h
        setlevel 4
        ret

; ---- set up level 5
;
setlvl5:
        ld   a,doorcls
        ld   (a_trig),a
        ld   (c_trig),a
        ld   (d_trig),a
        ld   (e_trig),a
        ld   a,dooropn
        ld   (b_trig),a
        setbomb s73bmb
        settime 0007h
        setcdtime 0005h
        setlevel 5
        ret

; ---- set up level 6
;
setlvl6:
        settrigs doorcls
        setbomb s100bmb
        settime 0006h
        setcdtime 0503h
        setlevel 6
        ret
        
; ---- address of procs for setting up game level
_lvlproc:
        dw setlvl1
        dw setlvl2
        dw setlvl3
        dw setlvl4
        dw setlvl5
        dw setlvl6

ginitend:        