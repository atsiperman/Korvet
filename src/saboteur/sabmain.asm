        DEVICE  ZXSPECTRUM48

        include "src/saboteur.asm"

XEND:
        SAVEBIN "out/SAB.COM",0x100,(XEND-0x100)        
