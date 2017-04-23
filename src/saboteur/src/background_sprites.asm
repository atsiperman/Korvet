	; background sprite index
	macro bkindex bkspaddr
		DB (bkspaddr - BKSPRTAB)/2
	endm

BKSPRTAB:
BK1ADDR:	DW BK1DATA
BK2ADDR:	DW BK2DATA
BK3ADDR:	DW BK3DATA

BK1DATA: 	bksh CYELLOW
			DB 1, 125, 93, 93, 69, 125, 1, 255
BK2DATA: 	bksh CBLUE	
			DB 32, 4, 32, 0, 8, 0, 32, 0
BK3DATA: 	bksh CGREEN	
			DB 128, 190, 128, 255, 128, 190, 128, 255 
