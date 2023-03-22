
; ------ clear data on screen change
;
clrscrch:
        xor a
        ld  (othrown),a     ; clear object thrown by saboteur
        ld  (gthrown),a     ; clear object thrown by guard
        ld  (gfthrwn),a     ; clear flag that object has been thrown by guard
        ld  (gfsbseen),a    ; clear flag that saboteur has been seen by guard
        ld  (gunshd),a      ; clear gun shell data (points to direction)
        
        ld  a,(gundelay)
        ld  (gunshfr),a     ; set gun delay before firings
        ret


