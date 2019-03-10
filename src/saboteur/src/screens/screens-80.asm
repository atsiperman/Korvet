
scrbk80:
		spmaplen smap80b,smap80e
smap80b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK11ADDR    ; 2, blue ladder left top
		bkindex BK12ADDR    ; 3, blue ladder right top				
		bkindex BK24ADDR    ; 4, yellow ladder left
		bkindex BK25ADDR    ; 5, yellow ladder right		
smap80e:
		mkline 7
		mkbyte 1,1
		mkline 3
		db 0
		mkbyte 2,3
		mkline 4
		db 0
		
		mkdup 15
			mkline 10
			mkbyte 1,1
			mkbyte 4,5
			mkline 3
			mkbyte 1,1
			db 0		
		;edup
		
		db 0
		db 0
		mkline 13
		db 0
		
		mscrend
		
; --- end of scrbk80


scrbk81:
		spmaplen smap81b,smap81e
smap81b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
smap81e:
		mkbyte 1,1
		mkbyte 1,1
		mkline 13
		mkbyte 1,1
		
		mkdup 15
			mkbyte 1,1
			mkbyte 1,1
			mkline 13
			mkbyte 1,1
		;edup
		
		db 0
		db 0
		mkline 13
		db 0
		
		mscrend
		
; --- end of scrbk81

scrbk82:
		spmaplen smap82b,smap82e
smap82b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right
		bkindex BK11ADDR    ; 4, blue ladder top left
		bkindex BK12ADDR    ; 5, blue ladder top right
		bkindex BK31ADDR    ; 6, black and white dots		
smap82e:
		db 0
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 9
		mkbyte 1,1
		
		mkdup 3
			db 0
			mkbyte 0,1
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 9
			mkbyte 1,1
		;edup
		
		mkdup 12
			mkbyte 1,6
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 9
			mkbyte 1,1			
		;edup

		mkline 4
		db 0
		mkbyte 0,4
		mkbyte 5,0
		mkline 9
		db 0
		
		mscrend
		
; --- end of scrbk82
