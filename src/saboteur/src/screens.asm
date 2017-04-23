SCRMAP:
		DW SCRBK2
		DW SCRBK1

SCRBK1:
        dup ROWNUM
			bkindex BK2ADDR
			dup COLNUM - 1
				bkindex BK1ADDR
			edup
        edup
		
SCRBK2:
        dup ROWNUM
			bkindex BK2ADDR
			dup COLNUM - 1
				bkindex BK3ADDR
			edup
        edup
