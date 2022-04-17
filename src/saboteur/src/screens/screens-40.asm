scrbk40:
		spmaplen smap40b,smap40e
smap40b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
smap40e:
		mkdup 9
			db 0
			db 0
			mkline 5
			mkbyte 1,1
			mkbyte 2,3
			mkline 7
			mkbyte 1,1
		;edup
		
		mkline 3
		db 0
		mkline 4
		mkbyte 1,1
		mkbyte 2,3
		mkline 7
		mkbyte 1,1
		
		mkline 3
		db 0
		mkbyte 0,1
		mkline 3
		mkbyte 1,1		
		mkbyte 2,3
		mkline 7
		mkbyte 1,1
		
		mkline 4
		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 2,3
		mkline 7
		mkbyte 1,1
		
		mkline 4
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,3
		mkline 7
		mkbyte 1,1
		
		mkbyte 1,1
		mkbyte 1,0
		mkline 7
		db 0
		mkline 6
		mkbyte 1,1
		
		mkbyte 1,1
		mkbyte 1,1
		mkline 10
		db 0
		mkbyte 0,2
		mkbyte 3,0
		db 0
				
		mkbyte 1,1		; --- TODO: cyan L
		mkbyte 1,1
		mkbyte 1,0
		mkline 5
		db 0
		mkline 4
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0
		
		mkbyte 1,1		; --- TODO: cyan L
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		db 0
		mkline 6
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0
		
		mscrend
		
; --- end of scrbk40

scrbk41:
		spmaplen smap41b,smap41e
smap41b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
		bkindex BK26ADDR    ; 4, cyan vertical tube
		bkindex BK23ADDR	; 5, red beam
smap41e:
		mkdup 5
			mkline 7
			mkbyte 1,1
			mkline 8
			db 0
		;edup
		
		mkdup 9
			mkline 13
			mkbyte 1,1
			mkbyte 4,1
			mkbyte 1,1
		;edup
		
		mkline 6
		db 0
		mkbyte 2,3
		db 0
		mkline 4
		mkbyte 5,5
		mkbyte 5,1
		mkbyte 4,1
		mkbyte 1,1
		
		mkline 5
		db 0
		mkbyte 0,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1
		mkline 3
		mkbyte 5,5

		mkline 5
		db 0
		mkbyte 0,1
		mkbyte 2,3
		mkline 6
		mkbyte 1,1		
		mkbyte 4,1
		mkbyte 1,1
		

        db SCREND
        db OBJMAP
        dw s41objm
        db MSKOMAP
        dw s41mom
        db TRIGMAP
        dw s41trm
        db TXTSMAP
        dw scr41txd
        db SCREND

scr41txd:
		mkbyte TXLINEV,5
			mktxtaddr 26, 3
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 26, 8
			db CHBOTM

		db SCREND
		
; --- end of scrbk41
		
		
scrbk42:
		spmaplen smap42b,smap42e
smap42b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube
		bkindex BK23ADDR	; 3, red beam
smap42e:
		mkdup 5
			mkline 13
			db 0
			db 0
			db 0
		;edup
		
		mkbyte 1,2			; 6
		mkbyte 1,1
		mkbyte 1,1
		mkline 12
		db 0
		
		mkbyte 1,2			; 7
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 11
		db 0
		
		mkbyte 1,2			; 8
		mkline 3
		mkbyte 1,1
		mkline 11
		db 0

		mkbyte 1,2			; 9
		mkline 3
		mkbyte 1,1
		mkbyte 1,0
		mkline 10
		db 0

		mkbyte 1,2			; 10
		mkline 4
		mkbyte 1,1
		mkline 10
		db 0

		mkbyte 1,2			; 11
		mkline 4
		mkbyte 1,1
		mkbyte 1,0
		mkline 9
		db 0

		mkbyte 1,2			; 12
		mkline 5
		mkbyte 1,1
		mkline 9
		db 0

		mkbyte 1,2			; 13
		mkline 5
		mkbyte 1,1
		mkbyte 1,0
		mkline 8
		db 0

		mkbyte 1,2			; 14
		mkline 6
		mkbyte 1,1
		mkline 8
		db 0
		
		mkbyte 1,2
		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		mkline 7
		db 0
		
		mkbyte 3,3
		mkbyte 3,3
		mkline 5
		mkbyte 1,1
		mkbyte 1,0
		mkline 7
		db 0

		mkbyte 1,2
		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		mkline 7
		db 0

		db SCREND		
        db TXTSMAP
        dw scr42txd
        db SCREND

scr42txd:
		mkbyte TXLINEV,5
			mktxtaddr 1, 3
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 1, 8
			db CHBOTM

		db SCREND

		
; --- end of scrbk42


scrbk43:
		spmaplen smap43b,smap43e
smap43b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube
		bkindex BK23ADDR	; 3, red beam
smap43e:
		mkdup 7
			mkbyte 1,2
			mkline 6
			mkbyte 1,1
			mkbyte 1,0
			mkline 7
			db 0
		;edup

		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1 
		mkline 3
		mkbyte 1,1
		mkbyte 1,0
		mkline 7
		db 0

		mkline 4
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 7
		db 0

		mkdup 8
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkline 3
			mkbyte 1,1
			mkbyte 1,0
			mkline 7
			db 0			
		;edup
		
		db SCREND		
        db TXTSMAP
        dw scr43txd
        db SCREND

scr43txd:
		mkbyte TXLINEV,1
			mktxtaddr 1, 0
			db CHBOTM

		mkbyte TXLINEV,3
			mktxtaddr 1, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 1, 4
			db CHTOP

		mkbyte TXLINEV,4
			mktxtaddr 1, 5
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 6, 4
			db CHTOP

		mkbyte TXLINEV,4
			mktxtaddr 6, 5
			db CHFULL

		db SCREND
		
; --- end of scrbk43

scrbk44:
		spmaplen smap44b,smap44e
smap44b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
		bkindex BK26ADDR    ; 4, cyan vertical tube
		bkindex BK23ADDR	; 5, red beam
smap44e:
		mkdup 8
			mkline 5
			db 0
			mkbyte 0,1
			mkbyte 2,3
			mkline 6
			mkbyte 1,1
			mkbyte 4,1
			mkbyte 1,1
		;edup
		
		mkline 5
		db 0
		mkbyte 0,1
		mkbyte 2,3
		mkline 4
		mkbyte 1,1
		mkline 4
		mkbyte 5,5

		mkdup 8
			mkline 5
			db 0
			mkbyte 0,1
			mkbyte 2,3
			mkline 6
			mkbyte 1,1
			mkbyte 4,1
			mkbyte 1,1
		;edup
		
		db SCREND		
        db TXTSMAP
        dw scr44txd
        db SCREND

scr44txd:
		mkbyte TXLINEV,1
			mktxtaddr 26, 0
			db CHBOTM

		mkbyte TXLINEV,3
			mktxtaddr 26, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 26, 4
			db CHTOP

		mkbyte TXLINEV,4
			mktxtaddr 26, 5
			db CHFULL

        db SCREND
		
; --- end of scrbk44

scrbk45:
		spmaplen smap45b,smap45e
smap45b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
		bkindex BK7ADDR     ; 4, big yellow brick
		bkindex BK5ADDR		; 5, solid blue 
smap45e:
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0
		
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0
		
		mkdup 2
			mkbyte 5,5
			mkbyte 5,5
			mkbyte 5,5
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 0,1
			mkline 6
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			db 0		
		;edup 

		mkbyte 5,5			; 5 
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0

		mkbyte 5,5			; 6
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,1
		mkline 6
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0

		mkbyte 5,5			; 7
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,1
		mkline 6
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0
		
		mkbyte 5,5			; 8
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,1
		mkline 6
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0

		mkdup 2
			mkbyte 5,5		; 9,10
			mkbyte 5,5
			mkbyte 5,5
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 4,1
			mkline 6
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			db 0		
		;edup

		mkbyte 5,5			; 11
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,1
		mkline 6
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0		

		mkbyte 5,5			; 12
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,1
		mkline 6
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0		

		mkbyte 5,5			; 13
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		db 0
		mkbyte 0,1		
		mkline 3
		mkbyte 1,1		
		mkbyte 1,2
		mkbyte 3,1
		db 0		

		mkbyte 5,5			; 14
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 1,1
		mkline 4
		db 0		
		mkline 3
		mkbyte 1,1		
		mkbyte 1,2
		mkbyte 3,1
		db 0		

		mkbyte 5,5			; 15
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 1,1
		mkline 4
		db 0		
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1		
		mkbyte 1,2
		mkbyte 3,1
		db 0		

		mkbyte 5,5			; 15
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 1,1
		mkline 5
		db 0		
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0		

		mkbyte 5,5			; 16
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 1,1
		mkline 10
		db 0		
		
        db SCREND
        db MSKOMAP
        dw s45mom
        db TRIGMAP
        dw s45trm
        db FSTRDRP
        dw s45rndr
        db SCREND
		
; --- end of scrbk45

scrbk46:
		spmaplen smap46b,smap46e
smap46b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
		bkindex BK26ADDR    ; 4, cyan vertical tube
		bkindex BK23ADDR	; 5, red beam
smap46e:
		mkdup 9
			db 0
			mkline 7
			mkbyte 1,1
			mkbyte 4,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkbyte 1,1
			db 0
			db 0
		;edup
		
		mkdup 3
			db 0
			mkline 7
			mkbyte 1,1
			mkbyte 4,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkbyte 1,1
			db 0
			db 0
		;edup

		mkbyte 0,5
		mkline 9
		mkbyte 5,5
		mkbyte 5,2
		mkbyte 3,5
		mkbyte 5,5
		mkbyte 5,0
		db 0
		
		mkdup 4
			db 0
			mkline 7
			mkbyte 1,1
			mkbyte 4,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkbyte 1,1
			db 0
			db 0
		;edup
		
        db SCREND
        db OBJMAP
        dw s46objm
        db STOMAP
        dw s46stom
        db TXTSMAP
        dw scr46txd
        db SCREND

scr46txd:
		mkbyte TXLINEV,1
			mktxtaddr 16, 0
			db CHBOTM
		
		mkbyte TXLINEV,5
			mktxtaddr 16, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 16, 6
			db CHTOP

		mkbyte TXLINEV,2
			mktxtaddr 16, 7
			db CHFULL

		mscrend
; --- end of scrbk46


scrbk48:
		spmaplen smap48b,smap48e
smap48b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
smap48e:
		mkdup 8
			db 0
			db 0
			mkline 9
			mkbyte 1,1
			mkbyte 2,3
			mkbyte 1,1
			mkbyte 1,1
			db 0
		;edup
		
		mkline 5
		db 0
		mkbyte 2,3
		mkline 9
		db 0
		
		mkdup 7
			db 0
			mkline 4
			mkbyte 1,1
			mkbyte 2,3
			mkline 8
			mkbyte 1,1
			db 0
		;edup
		
		mkline 10
		db 0
		mkbyte 0,2
		mkbyte 3,0
		mkline 3
		db 0
		
        db SCREND
        db OBJMAP
        dw s48objm
        db STOMAP
        dw s48stom
        db SCREND
		
; --- end of scrbk48


scrbk49:
		spmaplen smap49b,smap49e
smap49b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
		bkindex BK7ADDR     ; 4, big yellow brick
smap49e:
		mkdup 7
			db 0
			mkline 9
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkbyte 1,1
			mkbyte 1,1
			db 0
		;edup

		mkdup 3
			db 0
			mkline 9
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 4,1			
		;edup
		
		db 0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,1
		
		db 0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,1

		db 0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,1

		db 0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,1

		mkline 4
		db 0
		mkbyte 0,2
		mkbyte 3,0
		mkline 9
		db 0

		mkdup 2
			mkline 4
			db 0
			mkbyte 0,2
			mkbyte 3,0
			mkline 9
			db 0
		;edup
		
        db SCREND
        db OBJMAP
        dw s49objm
        db STOMAP
        dw s49stom
        db SCREND

		
; --- end of scrbk49
