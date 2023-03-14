        ; ---- defines number of notes
        macro notesnum endlabl
            db (endlabl - ($+1)) / 3    ; number of notes
        endm

        macro mknote pitch, duration
            dw pitch
            db duration
        endm

sndstrt:

; ---- disk sound data
scdsksnd:
        db (.esnd - scdsksnd) / 2
        dw 100, 305, 
        dw 510, 405,
        dw 150, 500,
        dw 210, 110
.esnd:        

; ---- sound of a gun shell
sndgnshd:
        db 2                   ; number of iterations
        notesnum .endsnd
        dup 2
                mknote 10, 50
                dup 4
                mknote 65535, 255
                edup
        edup
.endsnd        

; ---- sound of a punch/kick
sndpnchd:
        db 8                   ; number of iterations
        notesnum .endsnd
        ;dup 2
                mknote 10, 50
                dup 6
                mknote 65535, 255
                edup
        ;edup
.endsnd        

; ---- bomb explosion sound
dexplsn:                        
        db 50                   ; number of iterations
        notesnum .endsnd
        mknote 60000, 50
        mknote 65535, 255
.endsnd:        	

sndend: