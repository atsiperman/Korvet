
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
		
        db SCREND
        db TXTSMAP
        dw scr82txd
        db SCREND

scr82txd:					; description of the text RAM used by this screen		
		mkbyte TXLINEV,1
			mktxtaddr 1, 2
			db CHBOTM
		mkbyte TXLINEV,5
			mktxtaddr 1, 3
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 1, 8
			db CHTOP

        db SCREND
		
; --- end of scrbk82


scrbk83:
		spmaplen smap83b,smap83e
smap83b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right
		bkindex BK11ADDR    ; 4, blue ladder top left
		bkindex BK12ADDR    ; 5, blue ladder top right
		bkindex BK31ADDR    ; 6, black and white dots		
smap83e:


; --- end of scrbk83

scrbk84:
		spmaplen smap84b,smap84e
smap84b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK11ADDR    ; 2, blue ladder top left
		bkindex BK12ADDR    ; 3, blue ladder top right
		bkindex BK31ADDR    ; 4, black and white dots		
smap84e:
		mkdup 4
			mkline 13
			mkbyte 1,1
			mkbyte 1,0
			db 0
		;edup
		
		mkdup 11
			mkline 13			
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 4,1
		;edup
		
		mkline 3
		db 0
		mkline 11
		mkbyte 1,1
		mkbyte 4,1
		
		mkline 8
		db 0
		mkbyte 2,3		
		mkline 6
		db 0

		db SCREND
        db OBJMAP
        dw s84objm
        db STOMAP
        dw s84stom
        db TXTSMAP
        dw scr75txd
        db SCREND

; --- end of scrbk84


scrbk85:
		spmaplen smap85b,smap85e
smap85b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
smap85e:
		mkline 5
		db 0
		mkline 6
		db 0
		mkbyte 0,1
		mkline 3
		mkbyte 1,1
		
		mkline 7
		mkbyte 1,1
		db 0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		
		mkdup 13
			mkbyte 1,1
			mkbyte 1,1
			mkline 13
			mkbyte 1,1
		;edup 
		
		mkdup 2
			mkline 6
			db 0
			mkbyte 0,1
			mkbyte 1,1
			mkbyte 1,1
			mkline 6
			db 0
		;edup

		db SCREND
        db STOMAP
        dw s85stom
        db SCREND

; --- end of scrbk85

scrbk86:
		spmaplen smap86b,smap86e
smap86b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right
smap86e:
		mkdup 15
			db 0
			mkline 3
			mkbyte 1,1
			mkbyte 2,3
			mkline 10
			mkbyte 1,1
		;edup
		
		mkdup 2
			db 0
			db 0
			mkline 13
			db 0
		;edup

		db SCREND
        db STOMAP
        dw s86stom
        db SCREND

; --- end of scrbk86


scrbk87:
		spmaplen smap87b,smap87e
smap87b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right
		bkindex BK11ADDR    ; 4, blue ladder top left
		bkindex BK12ADDR    ; 5, blue ladder top right		
smap87e:
		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 2,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		db 0
		db 0
		mkbyte 0,1
		mkline 4
		mkbyte 1,1

		mkdup 15
			db 0
			mkline 3
			mkbyte 1,1
			mkbyte 2,3
			mkline 10
			mkbyte 1,1
		;edup

		mkline 4
		db 0
		mkbyte 4,5
		mkline 10
		db 0

		db SCREND
        db STOMAP
        dw s87stom
        db SCREND

; --- end of scrbk87


scrbk88:
		spmaplen smap81b,smap81e
smap88b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
smap88e:
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
		
		db SCREND
        db STOMAP
        dw s88stom
        db SCREND
		
; --- end of scrbk88

scrbk89:
		spmaplen smap89b,smap89e
smap89b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right
		bkindex BK31ADDR    ; 4, black and white dots		
smap89e:
		mkdup 4
			mkline 6
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 5
			mkbyte 1,1
			mkbyte 1,0
			db 0
		;edup
		mkdup 12
			mkline 6
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 5
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 4,1
		;edup
		db 0
		db 0
		mkline 13
		db 0

		db SCREND
        db STOMAP
        dw s89stom
        db TXTSMAP
        dw scr75txd
        db SCREND

; --- end of scrbk89
