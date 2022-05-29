a_trig  EQU s104trm + 1 + trdodat
b_trig  EQU s105trm + 1 + trdodat
c_trig  EQU s97trm + 1 + trdodat
d_trig  EQU s79trm + 1 + trdodat
e_trig  EQU s51trm + 1 + trdodat

ginitst:

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

; ---- set up level 1 (open all doors)
;
setlvl1:
        settrigs dooropn
        
; ---- set up level 2
;
setlvl2:
        settrigs dooropn
        ld   a,doorcls
        ld   (b_trig),a
        ld   (e_trig),a
        ret

; ---- set up level 3
;
setlvl3:
        settrigs dooropn
        ld   a,doorcls
        ld   (c_trig),a
        ld   (e_trig),a
        ret

; ---- set up level 4
;
setlvl4:
        settrigs dooropn
        ld   a,doorcls
        ld   (c_trig),a
        ld   (d_trig),a
        ld   (e_trig),a
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
        ret

; ---- set up level 6
;
setlvl6:
        settrigs doorcls
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