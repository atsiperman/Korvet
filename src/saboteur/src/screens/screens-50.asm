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

		dup 2
			mkbyte 3,3		; 12,13
			mkbyte 3,3
			mkbyte 3,3
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkline 9
			mkbyte 1,1
		edup
		
		mkbyte 3,3			; 14
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkline 9
		mkbyte 1,1

		dup 2
			mkbyte 3,3		; 15,16
			mkbyte 3,3
			mkbyte 3,3
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkline 9
			mkbyte 1,1
		edup

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
		dup 4
			mkline 5
			db 0
			mkbyte 0,1
			mkbyte 2,3
			mkline 6
			mkbyte 1,1
			mkbyte 4,1
			mkbyte 1,1
		edup 4

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
		
		dup 5
			mkline 6
			mkbyte 1,1
			mkbyte 2,3
			mkline 6
			mkbyte 1,1
			mkbyte 4,1
			mkbyte 1,1
		edup 

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
		dup 8
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkline 3
			mkbyte 1,1
			mkbyte 1,0
			mkline 7
			db 0
		edup

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

		dup 3
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkline 11
			db 0
		edup
		
		dup 2
			mkline 13
			db 0
			db 0
			db 0
		edup
		
		mscrend
		
; --- end of scrbk53
