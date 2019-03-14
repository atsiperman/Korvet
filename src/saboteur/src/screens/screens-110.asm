
scrbk110:
		spmaplen smap110b,smap110e
smap110b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK6ADDR     ; 4, 2 yellow bricks 
		bkindex BK7ADDR     ; 5, big yellow brick
		bkindex BK11ADDR    ; 6, blue ladder top left
		bkindex BK12ADDR    ; 7, blue ladder top right
		bkindex BK32ADDR    ; 8, green vertical tube
		bkindex BK24ADDR    ; 9, yellow ladder left
		bkindex BK25ADDR    ; 10, yellow ladder right				
smap110e:
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,8
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		
		mkdup 4
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
		;edup
		
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2
		mkline 3
		mkbyte 2,2
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		
		mkdup 2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
		;edup
		
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,0
		mkline 11
		db 0
		
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,4
		mkline 4
		mkbyte 1,1
		mkbyte 9,10
		mkline 3
		mkbyte 1,1
		db 0
		db 0

		mkdup 6
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,5
			mkline 4
			mkbyte 1,1
			mkbyte 9,10
			mkline 3
			mkbyte 1,1
			db 0
			db 0
		;edup
		
		mkline 9
		db 0
		mkbyte 6,7
		mkline 5
		db 0
		
		mscrend
; --- end of scrbk110


scrbk111:
		spmaplen smap111b,smap111e
smap111b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK32ADDR    ; 4, green vertical tube
smap111e:
		mkdup 3
			mkline 4
			mkbyte 1,1
			mkbyte 1,2
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkline 6
			mkbyte 1,1
		;edup

		mkline 4
		mkbyte 1,1
		mkbyte 1,4
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkline 6
		mkbyte 1,1

		mkline 4
		mkbyte 1,1
		mkbyte 1,4
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 2,2
		mkbyte 2,2
		mkline 4
		mkbyte 1,1

		mkdup 3
			mkline 4
			mkbyte 1,1
			mkbyte 1,4
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkline 6
			mkbyte 1,1		
		;edup

		mkbyte 1,1
		mkbyte 1,1
		mkline 4
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,3
		mkline 3
		mkbyte 3,3
		
		mkline 4
		mkbyte 1,1
		mkbyte 1,4
		mkline 3
		mkbyte 1,1
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,1
		
		mkdup 6
			mkline 4
			mkbyte 1,1
			mkbyte 1,2
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkline 3
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,1
		;edup
		
		db 0
		mkline 14
		db 0
		
		mscrend
; --- end of scrbk111


scrbk112:
		spmaplen smap112b,smap112e
smap112b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK11ADDR    ; 4, blue ladder top left
		bkindex BK12ADDR    ; 5, blue ladder top right
		bkindex BK24ADDR    ; 6, yellow ladder left
		bkindex BK25ADDR    ; 7, yellow ladder right		
		bkindex BK32ADDR    ; 8, green vertical tube		
smap112e:
		mkdup 8
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,2
			
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			
			mkbyte 1,1
			mkbyte 1,6
			mkbyte 7,1
			
			mkbyte 1,1
			mkbyte 1,1
		;edup

		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,6
		mkbyte 7,1		
		mkbyte 1,1
		mkbyte 1,1
		
		
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2	
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,6
		mkbyte 7,1
		mkbyte 1,1
		mkbyte 1,1

		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 3,6
		mkbyte 7,1
		mkbyte 1,1
		mkbyte 1,1
		
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,6
		mkbyte 7,1
		mkbyte 1,1
		mkbyte 1,1

		mkdup 2
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,2
			
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			
			mkbyte 1,1
			mkbyte 1,6
			mkbyte 7,1
			
			mkbyte 1,1
			mkbyte 1,1
		;edup

		mkline 6
		mkbyte 3,3
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,6
		mkbyte 7,1
		mkbyte 1,1
		mkbyte 1,1

		mkline 5
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 8,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,6
		mkbyte 7,1
		mkbyte 1,1
		mkbyte 1,1

		mkline 5
		mkbyte 1,1
		mkline 3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 2,1
		db 0
		mkbyte 0,4
		mkbyte 5,0
		db 0
		db 0
		
		mscrend
; --- end of scrbk112
