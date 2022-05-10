; ---- control logic for helicopter

; ---- draw green glass for helicopter cabin
;
cptcabin:        
        ld   hl,cptglass        ; pointer to cabins' glass address in video buffer
        load_de_hl              ; load address
        ex   de,hl              ; into HL
        ld   de,BK30ADDR        ; pointer to background data                
        
        dup 3
            dup 4
                savem_hl_de             ; save glass address
                    dup COLWIDB - 2
                        inc  hl
                    edup
            edup
            ld   bc,ROWWIDB - (COLWIDB * 4) ; move to the next row
            add  hl,bc
        edup

        ret