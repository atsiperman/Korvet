
; ------ clear data on screen change
;
clrscrch:
        xor a
        ld  (othrown),a     ; clear object thrown by saboteur
        ld  (gthrown),a     ; clear object thrown by guard
        ld  (gfthrwn),a     ; clear flag that object has been thrown by guard
        ld  (gfsbseen),a    ; clear flag that saboteur has been seen by guard
        ret

