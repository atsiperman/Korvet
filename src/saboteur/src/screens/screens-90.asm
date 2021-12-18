
scrbk91:
		spmaplen smap91b,smap91e
smap91b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK11ADDR    ; 2, blue ladder top left
		bkindex BK12ADDR    ; 3, blue ladder top right
		bkindex BK31ADDR    ; 4, black and white dots		
smap91e:
		db 0
		db 0
		mkbyte 0,1
		mkline 7
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0
		
		db 0
		mkbyte 0,1
		mkline 9
		mkbyte 1,1
		mkline 4
		db 0
		
		db 0
		mkbyte 0,1
		mkline 9
		mkbyte 1,1
		mkbyte 1,0		
		mkline 3
		db 0

		db 0
		mkbyte 0,1
		mkline 10
		mkbyte 1,1
		mkline 3
		db 0
		
		mkbyte 1,4		; line 5
		mkline 11
		mkbyte 1,1
		mkbyte 1,0
		db 0
		db 0
		
		mkbyte 1,4		; line 6
		mkline 12
		mkbyte 1,1
		db 0
		db 0
		
		mkbyte 1,4		; line 7
		mkline 12
		mkbyte 1,1
		mkbyte 1,0
		db 0
		
		mkbyte 1,4		; line 8
		mkline 13
		mkbyte 1,1
		db 0

		mkbyte 1,4		; line 9
		mkline 13
		mkbyte 1,1
		mkbyte 1,0

		mkdup 6
			mkbyte 1,4
			mkline 13
			mkbyte 1,1
			mkbyte 1,1
		;edup

		mkbyte 1,4
		mkline 9
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0
		
		mkline 4
		db 0
		mkbyte 0,2
		mkbyte 3,0
		mkline 9
		db 0
		
        db SCREND
        db TXTSMAP
        dw scr91txd
        db SCREND

scr91txd:					; description of the text RAM used by this screen		
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

; --- end of scrbk91


scrbk92:
		spmaplen smap92b,smap92e
smap92b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK6ADDR     ; 2, 2 yellow bricks 
		bkindex BK7ADDR     ; 3, big yellow brick
smap92e:
		mkline 4
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 8
		db 0
		
		mkline 4
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,0
		db 0
		db 0
		mkline 6
		mkbyte 1,1
		
		mkdup 2
			mkline 4
			db 0
			mkline 11
			mkbyte 1,1
		;edup
		
		mkdup 4
			mkline 4
			db 0
			mkline 11
			mkbyte 1,1
		;edup
		
		mkline 9
		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 1,0
		db 0
		db 0
		
		mkbyte 1,2
		mkline 7
		mkbyte 1,1
		mkbyte 2,1
		mkline 3
		mkbyte 1,1
		mkline 3
		db 0
		
		mkbyte 1,3
		mkline 7
		mkbyte 1,1
		mkbyte 3,1
		mkline 2
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0

		mkbyte 1,3
		mkline 7
		mkbyte 1,1
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 4
		db 0

		mkbyte 1,3
		mkline 7
		mkbyte 1,1
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0

		mkbyte 1,3
		mkline 7
		mkbyte 1,1
		mkbyte 3,1
		mkbyte 1,1
		mkline 5
		db 0

		mkbyte 1,3
		mkline 7
		mkbyte 1,1
		mkbyte 3,1
		mkbyte 1,0
		mkline 5
		db 0
		
		mkdup 2
			db 0
			db 0
			mkline 13
			db 0
		;edup
		
		mscrend
		
; --- end of scrbk92


scrbk93:
		spmaplen smap93b,smap93e
smap93b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK11ADDR    ; 2, blue ladder top left
		bkindex BK12ADDR    ; 3, blue ladder top right
		bkindex BK24ADDR    ; 4, yellow ladder left
		bkindex BK25ADDR    ; 5, yellow ladder right
		bkindex BK8ADDR     ; 6, blue ladder left bottom
		bkindex BK9ADDR     ; 7, blue ladder right bottom		
		bkindex BK6ADDR     ; 8, 2 yellow bricks 
		bkindex BK7ADDR     ; 9, big yellow brick		
smap93e:
		db 0
		db 0
		mkline 8
		mkbyte 1,1
		mkbyte 4,5
		mkline 3
		mkbyte 1,1
		db 0

		mkbyte 1,8
		mkline 9
		mkbyte 1,1
		mkbyte 4,5
		mkline 3
		mkbyte 1,1
		db 0

		mkdup 7
			mkbyte 1,9
			mkline 9
			mkbyte 1,1
			mkbyte 4,5
			mkline 3
			mkbyte 1,1
			db 0
		;edup

		db 0
		db 0
		mkline 8
		mkbyte 1,1
		mkbyte 4,5
		mkline 3
		mkbyte 1,1
		db 0

		db 0
		db 0
		mkbyte 0,1
		mkline 7
		mkbyte 1,1
		mkbyte 4,5
		mkline 3
		mkbyte 1,1
		db 0

		mkline 3
		db 0
		mkline 7
		mkbyte 1,1
		mkbyte 4,5
		mkline 3
		mkbyte 1,1
		db 0

		mkline 10
		db 0
		mkbyte 2,3
		mkline 4
		db 0
		
		mkdup 4
			mkline 10
			db 0
			mkbyte 6,7
			mkline 4
			db 0		
		;edup 
		mscrend
		
; --- end of scrbk93


scrbk94:
		spmaplen smap94b,smap94e
smap94b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK11ADDR    ; 2, blue ladder top left
		bkindex BK12ADDR    ; 3, blue ladder top right
		bkindex BK24ADDR    ; 4, yellow ladder left
		bkindex BK25ADDR    ; 5, yellow ladder right
		bkindex BK8ADDR     ; 6, blue ladder left bottom
		bkindex BK9ADDR     ; 7, blue ladder right bottom		
smap94e:
		mkline 12
		db 0
		mkbyte 4,5
		db 0
		db 0

		mkline 11
		db 0
		mkbyte 0,1
		mkbyte 4,5
		mkbyte 1,0
		db 0
		
		mkline 11
		db 0
		mkbyte 1,1
		mkbyte 4,5
		mkbyte 1,1
		db 0
		
		mkline 10
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 4,5
		mkbyte 1,1
		db 0

		mkline 10
		db 0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,5
		mkbyte 1,1
		db 0

		mkdup 8
			mkline 12
			mkbyte 1,1
			mkbyte 4,5
			mkbyte 1,1
			db 0
		;edup

		mkline 10
		db 0
		mkbyte 2,3
		mkline 4
		db 0

		mkdup 3
			mkline 10
			db 0
			mkbyte 6,7
			mkline 4
			db 0		
		;edup 
		
		mscrend
; --- end of scrbk94



scrbk95:
		spmaplen smap95b,smap95e
smap95b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK5ADDR    ; 2, solid blue
smap95e:
		mkdup 5
			mkline 4
			db 0
			mkbyte 0,2
			mkline 3
			mkbyte 2,2
			mkline 7
			db 0
		;edup
		
		mkdup 3
			mkline 4
			db 0
			mkbyte 0,2
			mkline 3
			mkbyte 2,2
			db 0
			db 0
			mkline 5
			mkbyte 1,1
		;edup

		mkline 4
		db 0
		mkbyte 0,2
		mkbyte 2,2
		mkbyte 2,0
		mkline 3
		db 0
		mkline 5
		mkbyte 1,1
		
		mkdup 4
			mkline 4
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 2,2
			mkbyte 2,1
			mkline 8
			mkbyte 1,1
		;edup

		mkline 4
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 2,2
		mkbyte 2,1
		mkline 6
		mkbyte 1,1
		db 0
		db 0

		mkline 4
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 2,2
		mkbyte 2,1
		mkline 5
		mkbyte 1,1
		mkline 3
		db 0

		mkline 4
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 2,2
		mkbyte 2,1
		mkline 3
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0

		mkline 4
		db 0
		mkbyte 0,2
		mkbyte 2,2
		mkbyte 2,0
		mkline 8
		db 0
		
		mscrend
; --- end of scrbk95


scrbk96:
		spmaplen smap96b,smap96e
smap96b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
smap96e:
		db 0
		db 0
		mkline 13
		db 0
		
		mkline 11
		mkbyte 1,1
		mkline 4
		db 0
		
		mkline 11
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0

		mkline 12
		mkbyte 1,1
		mkline 3
		db 0

		mkline 12
		mkbyte 1,1
		mkbyte 1,0
		db 0
		db 0

		mkline 13
		mkbyte 1,1
		db 0
		db 0
		
		mkline 13			; line 7
		mkbyte 1,1
		mkbyte 1,0
		db 0

		db 0
		db 0
		mkbyte 0,1
		mkline 11
		mkbyte 1,1
		db 0

		mkline 3			; line 9
		db 0
		mkline 11
		mkbyte 1,1
		mkbyte 1,0
		
		mkline 3
		db 0
		mkbyte 0,1
		mkline 11
		mkbyte 1,1

		mkline 4			; line 11
		db 0
		mkline 11
		mkbyte 1,1

		mkline 4			; line 12
		db 0
		mkbyte 0,1
		mkline 10
		mkbyte 1,1
		
		mkline 5			; line 13
		db 0
		mkline 10
		mkbyte 1,1

		mkline 5			; line 14
		db 0
		mkbyte 0,1
		mkline 9
		mkbyte 1,1

		mkline 6			; line 15
		db 0
		mkline 9
		mkbyte 1,1
		
		mkline 6			; line 16
		db 0
		mkbyte 0,1
		mkline 8
		mkbyte 1,1

		db 0
		db 0
		mkline 13
		db 0
		
		mscrend
; --- end of scrbk96



scrbk97:
		spmaplen smap97b,smap97e
smap97b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK4ADDR		; 2, blue bricks		
smap97e:
		db 0
		db 0
		mkline 13
		db 0

		mkdup 2
			db 0
			db 0
			mkline 13
			mkbyte 1,1
		;edup
		
		mkdup 4
			db 0
			db 0
			mkline 13
			mkbyte 1,1
		;edup

		mkdup 4
			db 0
			db 0
			mkline 13
			db 0
		;edup

		mkdup 6
			db 0
			db 0
			mkline 11
			mkbyte 2,2
			db 0
			db 0
		;edup
		
		mscrend
; --- end of scrbk97


scrbk98:
		spmaplen smap98b,smap98e
smap98b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK11ADDR    ; 2, blue ladder top left
		bkindex BK12ADDR    ; 3, blue ladder top right
		bkindex BK24ADDR    ; 4, yellow ladder left
		bkindex BK25ADDR    ; 5, yellow ladder right
		bkindex BK8ADDR     ; 6, blue ladder left bottom
		bkindex BK9ADDR     ; 7, blue ladder right bottom		
smap98e:
		mkdup 10
			mkline 13
			mkbyte 1,1
			mkbyte 1,0
			db 0
		;edup
		
		mkline 6
		db 0
		mkbyte 0,2
		mkbyte 3,0
		mkline 7
		db 0

		mkline 6
		db 0
		mkbyte 0,6
		mkbyte 7,0
		mkline 7
		db 0
		
		mkdup 5
			mkline 6
			mkbyte 1,1
			mkbyte 1,4
			mkbyte 5,1			
			mkline 5
			mkbyte 1,1
			mkbyte 1,0
			db 0			
		;edup
		
		mscrend
; --- end of scrbk98



scrbk99:
		spmaplen smap99b,smap99e
smap99b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right
smap99e:

		mkdup 7
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 12
			mkbyte 1,1
		;edup
		
		mkline 3
		db 0
		mkbyte 0,1
		mkline 11
		mkbyte 1,1
		
		mkline 4
		db 0
		mkline 11
		mkbyte 1,1
		
		mkline 4
		db 0
		mkbyte 0,1
		mkline 10
		mkbyte 1,1
		
		mkdup 2
			db 0
			db 0
			mkline 13
			db 0
		;edup
		
		db 0			; line 13
		db 0
		mkbyte 0,1
		mkline 12
		mkbyte 1,1
		
		db 0
		db 0
		mkline 13
		mkbyte 1,1
		
		db 0
		mkbyte 0,1
		mkline 13
		mkbyte 1,1
		
		db 0
		mkbyte 1,1
		mkline 13
		mkbyte 1,1

		mkbyte 0,1
		mkbyte 1,1
		mkline 13
		mkbyte 1,1
		
		db SCREND
        db STOMAP
        dw s99stom
        db MSKOMAP
        dw s99mom
        db SCREND

; --- end of scrbk99

