scrbk60:
		spmaplen smap60b,smap60e
smap60b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK5ADDR		; 2, solid blue 
		bkindex BK29ADDR    ; 3, solid red
		bkindex BK36ADDR    ; 4, red right top edge
		bkindex BK37ADDR    ; 5, red right bottom edge
		bkindex BK38ADDR	; 6, top black half
		bkindex BK39ADDR	; 7, bottom black half
		bkindex BK30ADDR	; 8, solid green
smap60e:
							; 1
		mkline 13
		mkbyte 3,3
		mkbyte 3,4
		mkbyte 1,1
							; 2
		mkline 13
		mkbyte 3,3					
		mkbyte 3,5
		mkbyte 1,1

							; 3		
		mkline 10
		mkbyte 6,6
		mkbyte 6,1
		mkline 4
		mkbyte 1,1

							; 4		
		mkline 10
		mkbyte 8,8
		mkbyte 8,1
		mkline 4
		mkbyte 1,1
		
							; 5		
		mkline 10
		mkbyte 8,8
		mkline 5
		mkbyte 1,1		
							; 6
		mkline 10
		mkbyte 8,8
		mkline 5			
		mkbyte 1,1		
							; 7
		mkline 9	
		mkbyte 8,8
		mkbyte 8,1
		mkline 5			
		mkbyte 1,1		
							; 8
		mkline 9
		mkbyte 7,7
		mkbyte 7,1
		mkline 5			
		mkbyte 1,1		
		
		mkdup 7
			mkline 9
			mkbyte 2,2		
			mkline 6
			mkbyte 1,1
		;edup
		
		mkdup 2
			mkline 14
			db 0
			db 0
		;edup
		mscrend
		
; --- end of scrbk60

scrbk61:
		spmaplen smap61b,smap61e
smap61b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK5ADDR		; 2, solid blue 
		bkindex BK29ADDR    ; 3, solid red
		bkindex BK27ADDR    ; 4, red left top edge
		bkindex BK28ADDR    ; 5, red left bottom edge
smap61e:
		mkbyte 1,1			; 1
		mkbyte 4,3
		mkline 13
		mkbyte 3,3

		mkbyte 1,1			; 2
		mkbyte 5,3
		mkline 13
		mkbyte 3,3

		mkline 4			; 3
		mkbyte 1,1
		mkbyte 1,2
		mkline 10
		mkbyte 2,2

		mkline 4			; 4
		mkbyte 1,1
		mkbyte 1,2
		mkline 10
		mkbyte 2,2
		
		mkline 5			; 5
		mkbyte 1,1
		mkline 10
		mkbyte 2,2

		mkline 5			; 6
		mkbyte 1,1
		mkline 10
		mkbyte 2,2
		
		mkline 5			; 7
		mkbyte 1,1
		mkbyte 1,2
		mkline 9
		mkbyte 2,2

		mkline 5			; 8
		mkbyte 1,1
		mkbyte 1,2
		mkline 9
		mkbyte 2,2
		
		mkdup 7
			mkline 6
			mkbyte 1,1
			mkline 9
			mkbyte 2,2
		;edup
		
		mkdup 2
			mkline 14
			db 0
			db 0
		;edup
		mscrend
		
; --- end of scrbk61

scrbk62:
		spmaplen smap62b,smap62e
smap62b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right				
		bkindex BK4ADDR		; 4, blue bricks
		bkindex BK8ADDR		; 5, blue ladder left bottom
		bkindex BK9ADDR		; 6, blue ladder right bottom
		bkindex BK11ADDR	; 7, blue ladder top left
		bkindex BK12ADDR	; 8, blue ladder top right
smap62e:
		mkdup 11
			db 0
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 9
			mkbyte 1,1			
		;edup
		
		db 0				; 12
		db 0
		mkbyte 7,8
		mkline 7
		db 0
		mkline 5
		mkbyte 1,1
		
		db 0				; 13
		db 0
		mkbyte 5,6
		mkline 7
		db 0
		mkbyte 0,1
		mkline 4
		mkbyte 1,1

		db 0				; 14
		db 0
		mkbyte 5,6
		mkline 8
		db 0
		mkline 4
		mkbyte 1,1

		db 0				; 15
		mkbyte 0,4
		mkbyte 5,6
		mkbyte 4,0
		mkline 7
		db 0
		mkbyte 0,1
		mkline 3
		mkbyte 1,1
		
		mkdup 2
			db 0				; 16,17
			mkbyte 4,4
			mkbyte 5,6
			mkbyte 4,4
			mkline 11
			db 0
		;edup
		
		mscrend
		
; --- end of scrbk62


scrbk63:
		spmaplen smap63b,smap63e
smap63b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK8ADDR		; 2, blue ladder left bottom
		bkindex BK9ADDR		; 3, blue ladder right bottom
smap63e:
		mkdup 2
			db 0
			mkbyte 1,1
			mkbyte 2,3
			mkbyte 1,1
			mkline 11
			db 0
		;edup
		
		db 0				; 3
		mkbyte 1,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1
		mkline 7
		db 0

		db 0				; 4
		mkbyte 1,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1
		mkbyte 1,0
		mkline 6
		db 0

		db 0				; 5
		mkbyte 1,1
		mkbyte 2,3
		mkline 6
		mkbyte 1,1
		mkline 6
		db 0

		db 0				; 6
		mkbyte 1,1
		mkbyte 2,3
		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		mkline 5
		db 0

		db 0				; 7
		mkbyte 1,1
		mkbyte 2,3
		mkline 7
		mkbyte 1,1
		mkline 5
		db 0

		db 0				; 8
		mkbyte 1,1
		mkbyte 2,3
		mkline 12
		mkbyte 1,1

		mkline 5			; 9
		db 0
		mkline 10
		mkbyte 1,1

		mkline 5			; 10
		db 0
		mkbyte 0,1
		mkline 9
		mkbyte 1,1

		mkline 6			; 11
		db 0
		mkline 9
		mkbyte 1,1

		mkline 6			; 12
		db 0
		mkbyte 0,1
		mkline 8
		mkbyte 1,1

		mkline 7			; 13
		db 0
		mkline 8
		mkbyte 1,1

		mkline 7			; 14
		db 0
		mkbyte 0,1
		mkline 7
		mkbyte 1,1

		mkline 8			; 15
		db 0
		mkline 7
		mkbyte 1,1
		
		mkdup 2
			mkline 14
			db 0
			db 0
		;edup
		mscrend
		
; --- end of scrbk63


scrbk64:
		spmaplen smap64b,smap64e
smap64b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
smap64e:
		mkdup 7
			mkline 14
			db 0
			db 0
		;edup
		mkdup 8
			mkline 14
			mkbyte 1,1
			mkbyte 1,1
		;edup
		
		mkdup 2
			mkline 14
			db 0
			db 0
		;edup
		
		mscrend
		
; --- end of scrbk64

scrbk65:
		spmaplen smap65b,smap65e
smap65b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK8ADDR		; 2, blue ladder left bottom
		bkindex BK9ADDR		; 3, blue ladder right bottom
smap65e:
		mkline 12
		db 0
		mkbyte 0,2
		mkbyte 3,0
		db 0
		
		mkline 4			; 2
		db 0
		mkbyte 0,1
		mkline 7
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0

		mkline 4			; 3
		db 0
		mkline 8
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0
		
		mkline 3			; 4
		db 0
		mkbyte 0,1
		mkline 8
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0

		mkline 3			; 5
		db 0
		mkline 9
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0

		mkline 2			; 6
		db 0
		mkbyte 0,1
		mkline 9
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0
		
		mkline 2			; 7
		db 0
		mkline 10
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0
		
		mkline 12			; 8
		mkbyte 1,1
		mkline 3
		db 0

		mkline 11			; 9
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0

		mkline 11			; 10
		mkbyte 1,1
		mkline 4
		db 0
		
		mkline 10			; 11
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0

		mkline 10			; 12
		mkbyte 1,1
		mkline 5
		db 0

		mkline 9			; 13
		mkbyte 1,1
		mkbyte 1,0
		mkline 5
		db 0

		mkline 9			; 14
		mkbyte 1,1
		mkline 6
		db 0

		mkline 8			; 15
		mkbyte 1,1
		mkbyte 1,0
		mkline 6
		db 0
		
		mkdup 2
			mkline 14
			db 0
			db 0
		;edup
		
		mscrend
		
; --- end of scrbk65



scrbk66:
		spmaplen smap66b,smap66e
smap66b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR     ; 1, green squares
		bkindex BK31ADDR    ; 2, black and white dots
smap66e:

		db 0
		db 0
		mkline 13
		db 0

		mkdup 15
			mkbyte 1,1
			mkline 13
			mkbyte 1,1
			mkbyte 2,1
		;edup
		
		db 0
		db 0
		mkline 13
		db 0
		
		mscrend
		
; --- end of scrbk66

scrbk67:
		spmaplen smap67b,smap67e
smap67b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR     ; 1, green squares
		bkindex BK13ADDR    ; 2, green ladder bottom left
		bkindex BK14ADDR    ; 3, green ladder bottom right
smap67e:
		db 0
		db 0
		mkline 13
		db 0
		
		mkdup 15
			mkbyte 1,1
			mkbyte 1,1
			mkline 13
			mkbyte 1,1
		;edup
		
		db 0
		mkbyte 2,3
		mkline 8
		db 0
		mkbyte 2,3
		mkline 4
		db 0
		
		mscrend
		
; --- end of scrbk67

scrbk68:
		spmaplen smap68b,smap68e
smap68b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR     ; 1, green squares
		bkindex BK13ADDR    ; 2, green ladder bottom left
		bkindex BK14ADDR    ; 3, green ladder bottom right
		bkindex BK31ADDR    ; 4, black and white dots
smap68e:
		mkline 4
		db 0
		mkbyte 0,2
		mkbyte 3,0
		mkbyte 2,3
		mkbyte 0,2
		mkbyte 3,0
		mkline 6
		db 0
		
		mkdup 3
			db 0
			mkbyte 0,1
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkbyte 2,3
			mkbyte 1,2
			mkbyte 3,1
			mkline 6
			mkbyte 1,1
		;edup

		mkdup 12
			mkbyte 1,4
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkbyte 2,3
			mkbyte 1,2
			mkbyte 3,1
			mkline 6
			mkbyte 1,1
		;edup

		db 0
		db 0
		mkbyte 0,2
		mkbyte 3,0
		mkline 11
		db 0
		
		mscrend
		
; --- end of scrbk68