SCRMAP:
		DW SCRBK2
		DW SCRBK1

SCRBK1:
        dup ROWNUM
		DB (BK2ADDR - BKSPRTAB)/2
		dup COLNUM - 1
        DB (BK1ADDR - BKSPRTAB)/2
		edup
        edup
		
SCRBK2:
        dup ROWNUM
		DB (BK4ADDR - BKSPRTAB)/2
		dup COLNUM - 1
        DB (BK3ADDR - BKSPRTAB)/2
		edup
        edup
