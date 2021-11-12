

scrbk120:
		spmaplen smap120b,smap120e
smap120b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK24ADDR    ; 4, yellow ladder left
		bkindex BK25ADDR    ; 5, yellow ladder right		
		bkindex BK32ADDR    ; 6, green vertical tube				
smap120e:
		
		mkdup 4
			mkline 5
			db 0
			mkbyte 4,5
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkline 5
			mkbyte 1,1
		;edup
		
		mkdup 3
			mkline 5
			mkbyte 1,1
			mkbyte 4,5
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkline 5
			mkbyte 1,1
		;edup
		
		mkline 5
		mkbyte 1,1
		mkbyte 4,5
		mkline 3
		mkbyte 1,1
		mkbyte 2,2
		mkbyte 2,2
		mkbyte 2,1
		mkline 3
		mkbyte 1,1

		mkdup 5
			mkline 5
			mkbyte 1,1
			mkbyte 4,5
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkline 5
			mkbyte 1,1
		;edup
		
		
		mkline 9
		mkbyte 3,3
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		mkbyte 3,3
		
		mkdup 3
			mkline 3
			mkbyte 1,1
			mkbyte 2,1
			mkline 3
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,2
			mkline 3
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
		;edup
		
		mscrend
; --- end of scrbk120


scrbk121:
		spmaplen smap121b,smap121e
smap121b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
smap121e:
		mkbyte 1,1
		mkbyte 1,0
		mkline 13
		db 0

		mkbyte 1,1
		mkbyte 1,1
		mkline 13
		db 0
		
		mkline 4
		mkbyte 1,1
		mkbyte 1,2
		mkline 5
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0
		
		mkline 4			; line 4
		mkbyte 1,1
		mkbyte 1,2
		mkline 6
		mkbyte 1,1
		mkline 4
		db 0

		mkline 4			; line 5
		mkbyte 1,1
		mkbyte 1,2
		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0

		mkline 4			; line 6
		mkbyte 1,1
		mkbyte 1,2
		mkline 7
		mkbyte 1,1
		mkline 3
		db 0

		mkline 4			; line 7
		mkbyte 1,1
		mkbyte 1,2
		mkline 7
		mkbyte 1,1
		mkbyte 1,0
		mkline 2
		db 0

		mkline 4			; line 8
		mkbyte 1,1
		mkbyte 1,2
		mkline 8
		mkbyte 1,1
		mkline 2
		db 0

		mkline 4			; line 9
		mkbyte 1,1
		mkbyte 1,2
		mkline 8
		mkbyte 1,1
		mkbyte 1,0
		db 0

		mkdup 2
			mkline 4			; line 10,11
			mkbyte 1,1
			mkbyte 1,2
			mkline 9
			mkbyte 1,1
			db 0
		;edup

		mkline 3			; line 12
		mkbyte 1,1
		mkbyte 2,2
		mkbyte 2,2
		mkline 9
		mkbyte 1,1
		db 0

		mkline 4			; line 13
		mkbyte 1,1
		mkbyte 1,2
		mkline 9
		mkbyte 1,1
		db 0
		
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 9
		mkbyte 1,1
		db 0
		
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkline 9
		mkbyte 1,1
		db 0

		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 1,3
		mkline 3
		mkbyte 3,3
		mkline 6
		mkbyte 1,1
		db 0

		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 2,1
		mkline 7
		mkbyte 1,1
		db 0
		
		mscrend
; --- end of scrbk121

scrbk122:
		spmaplen smap122b,smap122e
smap122b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR		; 1, green squares
		bkindex BK6ADDR     ; 2, 2 yellow bricks 
		bkindex BK7ADDR     ; 3, big yellow brick 
		bkindex BK8ADDR     ; 4, blue ladder left bottom
		bkindex BK9ADDR     ; 5, blue ladder right bottom
smap122e:

		mkdup 2
			db 0
			mkline 14
			db 0
		;edup
		
		db 0			
		mkline 8
		mkbyte 1,1
		mkline 6
		db 0

		db 0				; line 4
		mkline 8
		mkbyte 1,1
		mkbyte 1,0
		mkline 5
		db 0

		db 0				; line 5
		mkline 9
		mkbyte 1,1
		mkline 5
		db 0

		db 0				; line 6
		mkline 9
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0

		db 0				; line 7
		mkline 10
		mkbyte 1,1
		mkline 4
		db 0

		db 0				; line 8
		db 0
		mkline 9
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0

		mkbyte 1,1				; line 9
		mkbyte 2,1
		mkline 10
		mkbyte 1,1
		mkline 3
		db 0

		mkdup 6
			mkbyte 1,1				
			mkbyte 3,1
			mkline 10
			mkbyte 1,1		
			mkbyte 1,0		
			db 0
			db 0
		;edup
		
		mkdup 2
			mkline 5
			db 0
			mkbyte 4,5
			mkline 9
			db 0
		;edup
		
		mscrend
; --- end of scrbk122


scrbk123:
		spmaplen smap123b,smap123e
smap123b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR		; 1, green squares
		bkindex BK6ADDR     ; 2, 2 yellow bricks 
		bkindex BK7ADDR     ; 3, big yellow brick 
		bkindex BK23ADDR    ; 4, red beam		
smap123e:

		db 0
		mkbyte 0,1
		mkline 11
		mkbyte 1,1
		db 0
		db 0
		
		mkbyte 0,4
		mkline 13
		mkbyte 4,4
		db 0

		db 0
		mkbyte 0,1
		mkline 11
		mkbyte 1,1
		db 0
		db 0

		mkdup 5
			db 0
			mkline 12
			mkbyte 1,1
			mkbyte 1,0
			db 0
		;edup

		db 0
		mkline 12
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1

		mkdup 6
			db 0
			mkline 12
			mkbyte 1,1
			mkbyte 1,3
			mkbyte 1,1
		;edup
		
		db 0
		mkline 3
		mkbyte 1,1
		mkline 5
		mkbyte 4,4
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0
		
		db 0
		mkline 14
		db 0
		
		mscrend
; --- end of scrbk123


scrbk124:
		spmaplen smap124b,smap124e
smap124b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right		
smap124e:
		mkdup 2
			db 0
			mkline 14
			db 0			
		;edup
		
		mkdup 13
			mkline 10
			mkbyte 1,1
			mkbyte 2,3
			mkline 3
			mkbyte 1,1
			db 0
		;edup

		mkline 10
		mkbyte 1,1
		mkbyte 2,3
		mkline 3
		mkbyte 1,1
		db 0

		mkline 4
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		db 0
		mkbyte 2,3
		mkline 4
		db 0
		
		mscrend
; --- end of scrbk124


scrbk125:
		spmaplen smap125b,smap125e
smap125b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right		
smap125e:
		mkdup 2
			db 0
			mkline 14
			db 0			
		;edup
		
		mkdup 13
			mkbyte 1,1
			mkline 14
			mkbyte 1,1
		;edup

		mkbyte 1,1
		mkline 14
		mkbyte 1,1

		db 0
		mkline 14
		db 0			
		
		mscrend
; --- end of scrbk125


scrbk126:
		spmaplen smap126b,smap126e
smap126b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right		
		bkindex BK8ADDR     ; 4, blue ladder left bottom
		bkindex BK9ADDR     ; 5, blue ladder right bottom		
smap126e:
		mkdup 2
			db 0
			mkline 14
			db 0
		;edup
		
		mkline 6			; line 3
		db 0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 5			; line 4
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 5			; line 5
		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 4			; line 6
		db 0
		mkbyte 0,1
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 4			; line 7
		db 0
		mkline 4
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 3			; line 8
		db 0
		mkbyte 0,1
		mkline 4
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 3			; line 9
		db 0
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 2			; line 10
		db 0
		mkbyte 0,1
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 2			; line 11
		db 0
		mkline 6
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1
		
		mkdup 5
			db 0
			mkbyte 0,1
			mkline 6
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 5
			mkbyte 1,1
		;edup
		
		mkline 8
		db 0
		mkbyte 0,4
		mkbyte 5,0
		mkline 5
		db 0
		
		mscrend
; --- end of scrbk126


