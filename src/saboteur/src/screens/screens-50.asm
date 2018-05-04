scrbk51:
		spmaplen smap51b,smap51e
smap51b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK7ADDR     ; 2, big yellow brick
		bkindex BK5ADDR		; 3, solid blue 
smap51e:
		mkbyte 3,3			; 1
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkline 10
		db 0

		mkbyte 3,3			; 2
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkline 10
		db 0
		
		mkbyte 3,3			; 3
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 0,1
		mkline 7
		mkbyte 1,1
		mkbyte 1,0
		db 0

		mkbyte 3,3			; 4
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 0,1
		mkline 7
		mkbyte 1,1
		mkbyte 1,0
		db 0

		mkbyte 3,3			; 5
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 0,1
		mkline 7
		mkbyte 1,1
		mkbyte 1,0
		db 0
		
		mkbyte 3,3			; 6
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 0,1
		mkline 7
		mkbyte 1,1
		mkbyte 1,0
		db 0
		
		mkbyte 3,3			; 7
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 0,1
		mkline 7
		mkbyte 1,1
		mkbyte 1,0
		db 0

		mkbyte 3,3			; 8
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 0,1
		mkline 7
		mkbyte 1,1
		mkbyte 1,0
		db 0

		mkbyte 3,3			; 9
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 0,1
		mkline 7
		mkbyte 1,1
		mkbyte 1,0
		db 0
		
		mkbyte 3,3			; 10
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkline 8
		mkbyte 1,1
		db 0

		mkbyte 3,3			; 11
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkline 9
		mkbyte 1,1

		mkdup 2
			mkbyte 3,3		; 12,13
			mkbyte 3,3
			mkbyte 3,3
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkline 9
			mkbyte 1,1
		;edup
		
		mkbyte 3,3			; 14
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkline 9
		mkbyte 1,1

		mkdup 2
			mkbyte 3,3		; 15,16
			mkbyte 3,3
			mkbyte 3,3
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkline 9
			mkbyte 1,1
		;edup

		mkline 13
		db 0
		db 0
		db 0
		
		mscrend
		
; --- end of scrbk51


scrbk52:
		spmaplen smap52b,smap52e
smap52b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
		bkindex BK26ADDR    ; 4, cyan vertical tube
smap52e:
		mkdup 4
			mkline 5
			db 0
			mkbyte 0,1
			mkbyte 2,3
			mkline 6
			mkbyte 1,1
			mkbyte 4,1
			mkbyte 1,1
		;edup 4

		mkline 5			; 5
		db 0
		mkbyte 1,1
		mkbyte 2,3
		mkline 6
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 1,1

		mkline 4			; 6
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 2,3
		mkline 6
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 1,1
		
		mkline 4			; 7
		db 0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,3
		mkline 6
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 1,1

		mkline 3			; 8
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,3
		mkline 6
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 1,1

		mkline 3			; 9
		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 2,3
		mkline 6
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 1,1

		db 0				; 10
		db 0
		mkbyte 0,1
		mkline 3
		mkbyte 1,1
		mkbyte 2,3
		mkline 6
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 1,1
		
		mkdup 5
			mkline 6
			mkbyte 1,1
			mkbyte 2,3
			mkline 6
			mkbyte 1,1
			mkbyte 4,1
			mkbyte 1,1
		;edup 

		mkline 6			; 16
		mkbyte 1,1
		mkbyte 2,3
		mkline 6
		mkbyte 1,1
		db 0
		db 0
		
		mkline 3
		db 0		
		mkbyte 2,3
		mkline 11
		db 0
		
		mscrend
		
; --- end of scrbk52


scrbk53:
		spmaplen smap53b,smap53e
smap53b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube
		bkindex BK23ADDR	; 3, red beam		
smap53e:
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

		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 8
		db 0

		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 9
		db 0
		
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,0
		mkline 10
		db 0

		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 3,0
		mkline 11
		db 0

		mkdup 3
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkline 11
			db 0
		;edup
		
		mkdup 2
			mkline 13
			db 0
			db 0
			db 0
		;edup
		
		mscrend
		
; --- end of scrbk53


scrbk54:
		spmaplen smap54b,smap54e
smap54b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK8ADDR		; 2, blue ladder left bottom
		bkindex BK9ADDR		; 3, blue ladder right bottom
		bkindex BK11ADDR	; 4, blue ladder top left
		bkindex BK12ADDR	; 5, blue ladder top right
smap54e:
		mkdup 4
			mkline 15
			db 0
		;edup
		
		mkline 3
		db 0
		mkline 8
		mkbyte 1,1
		mkline 4
		db 0

		mkline 2
		db 0
		mkbyte 0,1
		mkline 8
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0

		mkline 2
		db 0
		mkline 10
		mkbyte 1,1
		mkline 3
		db 0
		
		db 0
		mkbyte 0,1
		mkline 10
		mkbyte 1,1
		mkbyte 1,0
		mkline 2
		db 0
		
		mkdup 7
			mkline 12
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			db 0
		;edup
		
		mkline 12
		db 0
		mkbyte 0,4
		mkbyte 5,0
		db 0

		mkline 12
		db 0
		mkbyte 0,2
		mkbyte 3,0
		db 0
		
		mscrend
		
; --- end of scrbk54


scrbk55:
		spmaplen smap55b,smap55e
smap55b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK7ADDR     ; 2, big yellow brick		
		bkindex BK6ADDR		; 3, 2 yellow bricks 
		bkindex BK24ADDR	; 4, yellow ladder left
		bkindex BK25ADDR	; 5, yellow ladder right
		bkindex BK4ADDR		; 6, blue bricks
smap55e:
		mkdup 4
			mkline 3
			mkbyte 1,1
			mkbyte 4,5
			mkline 9
			mkbyte 1,1
			mkline 2
			db 0
		;edup

		mkline 3
		mkbyte 1,1
		mkbyte 4,5
		mkbyte 1,1
		mkline 8
		mkbyte 1,1
		mkline 2
		db 0

		mkline 3
		mkbyte 1,1
		mkbyte 4,5
		mkbyte 1,1
		mkbyte 1,1
		mkline 7
		mkbyte 1,1
		mkline 2
		db 0

		mkline 3
		mkbyte 1,1
		mkbyte 4,5
		mkbyte 1,1
		mkbyte 1,1
		mkline 7
		mkbyte 1,1
		mkline 2
		db 0

		mkline 3
		mkbyte 1,1
		mkbyte 4,5
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 6
		mkbyte 1,1
		mkline 2
		db 0
		

		mkline 4			; 9 
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 6
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 6,6

		mkline 5			; 10
		db 0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 6,6

		mkline 5			; 11
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 6,6

		mkline 6			; 12
		db 0
		mkbyte 1,1
		mkbyte 1,1
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 6,6

		mkline 6			; 13
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 6,6
		
		mkline 7			; 14
		db 0
		mkbyte 1,1
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 6,6

		mkline 7			; 15
		db 0
		mkbyte 0,1
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 6,6

		mkdup 2				
			mkline 14
			db 0
			db 0
		;edup
		
		mscrend
		
; --- end of scrbk55


scrbk56:
		spmaplen smap56b,smap56e
smap56b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK1ADDR		; 1, yellow L
smap56e:
		mkline 14
		db 0
		db 0
		
		mkline 10			; 2
		db 0
		mkline 5
		mkbyte 1,1

		mkline 9			; 3
		db 0
		mkbyte 0,1
		mkline 5
		mkbyte 1,1
		
		mkline 9			; 4
		db 0
		mkline 6
		mkbyte 1,1
		
		mkline 8			; 5
		db 0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		
		mkline 4			; 6
		db 0
		mkline 8
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1

		mkline 3			; 7
		db 0
		mkbyte 0,1
		mkline 8
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1

		mkline 3			; 8
		db 0
		mkline 8
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		
		mkline 5			; 9
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		db 0
		db 0
		
		mkline 5			; 10
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		db 0

		mkline 4			; 11
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0

		mkline 4			; 12
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		mkbyte 1,1
		mkbyte 1,1
		mkline 4
		db 0

		mkline 4			; 13
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 9
		db 0

		mkline 4			; 14
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 9
		db 0
		
		mkline 4			; 15
		mkbyte 1,1
		mkbyte 1,1
		mkline 10
		db 0
		
		mkdup 2
			mkline 15
			db 0
		;edup 
		
		mscrend
		
; --- end of scrbk56

scrbk57:
		spmaplen smap57b,smap57e
smap57b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK1ADDR		; 1, yellow L
smap57e:
		mkdup 8
			mkline 14
			db 0
			db 0
		;edup
		
		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		mkbyte 0,0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1

		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		mkbyte 0,0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		
		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		mkbyte 0,0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		
		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		mkbyte 0,0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		
		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		mkbyte 0,0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		
		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		mkbyte 0,0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		
		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		mkbyte 0,0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		
		mkdup 2
		mkline 14
			db 0
			db 0
		;edup

		mscrend
		
; --- end of scrbk57
