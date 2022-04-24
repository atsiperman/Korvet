
; ------ clear data on screen change
;
clrscrch:
        xor a
        ld  (othrown),a
        ld  (gthrown),a
        ld  (gfthrwn),a
        ret