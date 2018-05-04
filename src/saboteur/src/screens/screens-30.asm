

scrbk38:
		spmaplen smap38b,smap38e
smap38b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
		bkindex BK26ADDR    ; 4, cyan vertical tube
		bkindex BK23ADDR	; 5, red beam
smap38e:
						; 1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0
		mkbyte 0,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 3
		mkbyte 1,1
		db 0
		db 0

						; 2
		mkbyte 1,1
		mkbyte 1,1
		mkline 5
		db 0
		mkbyte 0,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 3
		mkbyte 1,1
		mkbyte 1,0
		mkline 5
		db 0
		mkbyte 0,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1
		
						; 4
		mkbyte 1,1
		mkline 6
		db 0
		mkbyte 0,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 5
		mkbyte 1,0
		mkline 6
		db 0
		mkbyte 0,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 6
		mkline 5		
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 7
		mkline 5
		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 8
		mkline 4
		db 0
		mkbyte 0,1
		mkline 3
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 9
		mkline 4
		db 0
		mkline 4
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 10
		mkline 3
		db 0
		mkbyte 0,1
		mkline 4
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 11
		mkline 3
		db 0
		mkline 5
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 12
		mkline 2
		db 0
		mkbyte 0,1
		mkline 5
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 13
		mkline 2
		db 0
		mkline 6
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1
		
		mkbyte 0,5		; 14
		mkline 9
		mkbyte 5,5
		mkbyte 5,2
		mkbyte 3,5
		mkbyte 5,5
		mkbyte 5,0
		db 0
		
		mkdup 3
			db 0			; 15
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
		
		mscrend
		
; --- end of scrbk38


scrbk39:
		spmaplen smap39b,smap39e
smap39b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK7ADDR     ; 2, big yellow brick		
		bkindex BK6ADDR		; 3, 2 yellow bricks 
		bkindex BK24ADDR	; 4, yellow ladder left
		bkindex BK25ADDR	; 5, yellow ladder right
smap39e:
		mkline 3
		db 0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		mkbyte 4,5
		mkline 3
		mkbyte 1,1
		db 0

		mkbyte 1,1
		mkbyte 1,3
		mkline 8
		mkbyte 1,1
		mkbyte 4,5
		mkline 3
		mkbyte 1,1
		db 0

		mkdup 11
			mkbyte 1,1
			mkbyte 1,2
			mkline 8
			mkbyte 1,1
			mkbyte 4,5
			mkline 3
			mkbyte 1,1
			db 0
		;edup
		
		mkdup 4
			mkline 14
			db 0
			db 0
		;edup
		
		mscrend
		
; --- end of scrbk39
