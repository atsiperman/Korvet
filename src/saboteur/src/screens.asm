		; sprite map length
		macro spmaplen	bmap, emap
		db	(emap - bmap)
		endm
		
		macro mkbyte hi,lo
		db (hi << 4) | lo
		endm
		
scrbk1:
        dup ROWNUM
			bkindex BK2ADDR
			dup COLNUM - 1
				bkindex BK1ADDR
			edup
        edup
		
scrbk2:
        dup ROWNUM
			bkindex BK2ADDR
			dup COLNUM - 1
				bkindex BK3ADDR
			edup
        edup

scrbk3:
		spmaplen smap3b,smap3e
smap3b:			
		bkindex BK5ADDR		; 0, 	solid blue
		bkindex BK2ADDR		; 1, 	wall
		bkindex BK1ADDR		; 2, 	yellow L
		bkindex BK6ADDR		; 3, 	2 yellow bricks 
		bkindex BK7ADDR		; 4, 	big yellow brick
		bkindex BK8ADDR		; 5,	blue ladder left bottom
		bkindex BK9ADDR		; 6,	blue ladder right bottom
		bkindex BK11ADDR	; 7,	blue ladder top left
		bkindex BK12ADDR	; 8,	blue ladder top right
		bkindex BK10ADDR	; 9,	blue small bricks
		bkindex BK4ADDR		; A, 	blue bricks
smap3e:				
							; 1st line
		dup 10
		db	0
		edup		
		dup 5
		mkbyte 1,1
		edup
							; 2nd line
		dup 10
		db 0
		endm
		mkbyte 0,3
		dup 4
		mkbyte 2,2
		edup
	
		dup 5				; yellow door
			dup 10
			db	0
			edup		
			mkbyte 0,4
			dup 4
			mkbyte 2,2
			edup
		edup
							; ladder 							
		dup 5
		mkbyte 1,1
		edup		
		mkbyte 7,8
		dup 9
		mkbyte 1,1
		edup
							; ladder 		
		dup 5
		mkbyte 1,1
		edup		
		mkbyte 5,6
		dup 9
		mkbyte 1,1
		edup
							; ladder 
		dup 4
		mkbyte 1,1
		edup		
		mkbyte 1,9
		mkbyte 5,6
		dup 9
		mkbyte 9,9
		edup
		
		dup 6
			dup 4
			mkbyte 1,1
			edup
			mkbyte 1,10
			mkbyte 5,6
			dup 9
			mkbyte 10,10
			edup
		edup

		dup 15
		mkbyte 1,1
		edup	

; --- end of scrbk3
	
scrbk4:
		dup 5
		bkindex BK2ADDR
		edup
		dup 3
		bkindex BK4ADDR
		edup
							; ladder
		bkindex BK8ADDR
		bkindex BK9ADDR
		
		dup 12
		bkindex BK2ADDR
		edup
		dup 8
		bkindex BK4ADDR
		edup

		dup 4
		bkindex BK1ADDR
		edup
		bkindex BK6ADDR
		dup 3
		bkindex BK4ADDR
		edup
							; ladder
		bkindex BK8ADDR
		bkindex BK9ADDR
		
		dup 20
		bkindex BK4ADDR
		edup

		dup 5
			dup 4
			bkindex BK1ADDR
			edup
			bkindex BK7ADDR
			dup 3
			bkindex BK4ADDR
			edup
							; ladder
			bkindex BK8ADDR
			bkindex BK9ADDR
			
			dup 20
			bkindex BK4ADDR
			edup
		edup

		dup 5
		bkindex BK2ADDR
		edup
		dup 3
		bkindex BK4ADDR
		edup
							; ladder
		bkindex BK8ADDR
		bkindex BK9ADDR
		dup 20
		bkindex BK4ADDR
		edup

		dup 11
		bkindex BK2ADDR
		edup
		dup 19
		bkindex BK4ADDR
		edup

		dup 18
		bkindex BK4ADDR
		edup
		dup 12
		bkindex BK2ADDR
		edup


		dup 17
		bkindex BK4ADDR
		edup
		dup 13
		bkindex BK2ADDR
		edup


		dup 16
		bkindex BK4ADDR
		edup
		dup 14
		bkindex BK2ADDR
		edup


		dup 15
		bkindex BK4ADDR
		edup
		dup 15
		bkindex BK2ADDR
		edup
		
		
		dup 14
		bkindex BK4ADDR
		edup
		dup 16
		bkindex BK2ADDR
		edup


		dup 13
		bkindex BK4ADDR
		edup
		dup 17
		bkindex BK2ADDR
		edup


		dup 12
		bkindex BK4ADDR
		edup
		dup 18
		bkindex BK2ADDR
		edup

		dup 30
		bkindex BK2ADDR
		edup

; --- end of scrbk4


scrbk5:
		dup 2
		bkindex BK4ADDR
		edup
		dup 6
		bkindex BK2ADDR
		edup
		dup 22
		bkindex BK3ADDR
		edup		

		dup 5
		bkindex BK4ADDR
		edup
		bkindex BK6ADDR
		dup 24
		bkindex BK3ADDR
		edup		

		dup 7
			dup 5
			bkindex BK4ADDR		
			edup
			bkindex BK7ADDR
			dup 24
			bkindex BK3ADDR
			edup
		edup

		dup 15
		bkindex BK2ADDR		
		edup
		dup 15
		bkindex BK3ADDR
		edup
		
		dup 16
		bkindex BK2ADDR		
		edup
		dup 14
		bkindex BK3ADDR
		edup
		
		dup 17
		bkindex BK2ADDR		
		edup
		dup 13
		bkindex BK3ADDR
		edup
		
		dup 18
		bkindex BK2ADDR		
		edup
		dup 12
		bkindex BK3ADDR
		edup

		dup 19
		bkindex BK2ADDR		
		edup
		dup 11
		bkindex BK3ADDR
		edup

		dup 3
			dup 30
			bkindex BK2ADDR
			edup
		edup
; --- end of scrbk5

scrbk6:
		dup 14
			dup 14
			bkindex BK3ADDR
			edup
								; ladder
			bkindex BK13ADDR
			bkindex BK14ADDR
			
			dup 14
			bkindex BK3ADDR
			edup
		edup
		
		dup 8
		bkindex BK2ADDR
		edup
								; ladder
		bkindex BK11ADDR
		bkindex BK12ADDR
		dup 10
		bkindex BK2ADDR
		edup
		dup 10
		bkindex BK3ADDR
		edup
		
		dup 8
		bkindex BK2ADDR
		edup
								; ladder
		bkindex BK8ADDR
		bkindex BK9ADDR
		dup 11
		bkindex BK2ADDR
		edup
		dup 9
		bkindex BK3ADDR
		edup
		
		dup 8
		bkindex BK2ADDR
		edup
								; ladder
		bkindex BK8ADDR
		bkindex BK9ADDR
		dup 20
		bkindex BK2ADDR
		edup
				
; --- end of scrbk6

scrbk7:
		dup 5
			dup 11
			bkindex BK2ADDR
			edup
								; ladder
			bkindex BK13ADDR
			bkindex BK14ADDR
			
			dup 17
			bkindex BK2ADDR
			edup
		edup
							; ladder with door
		dup 11
		bkindex BK2ADDR
		edup
							; ladder
		bkindex BK13ADDR
		bkindex BK14ADDR
		
		dup 17
		bkindex BK2ADDR
		edup
							;
		dup 11
		bkindex BK3ADDR
		edup
							; ladder
		bkindex BK13ADDR
		bkindex BK14ADDR
		
		dup 15
		bkindex BK3ADDR
		edup
		bkindex BK6ADDR
		bkindex BK3ADDR
		
							;
		dup 6		
			dup 11
			bkindex BK3ADDR
			edup
								; ladder
			bkindex BK13ADDR
			bkindex BK14ADDR
			
			dup 15
			bkindex BK3ADDR
			edup
			bkindex BK7ADDR
			bkindex BK3ADDR
		edup
		
		dup 11					; stairs	
		bkindex BK3ADDR
		edup
								; ladder
		bkindex BK13ADDR
		bkindex BK14ADDR
		
		dup 11
		bkindex BK3ADDR
		edup
		dup 6
		bkindex BK2ADDR
		edup

		dup 11					; stairs	
		bkindex BK3ADDR
		edup
								; ladder
		bkindex BK13ADDR
		bkindex BK14ADDR
		
		dup 10
		bkindex BK3ADDR
		edup
		dup 7
		bkindex BK2ADDR
		edup
		
		dup 11					; stairs	
		bkindex BK3ADDR
		edup
								; ladder
		bkindex BK13ADDR
		bkindex BK14ADDR
		
		dup 9
		bkindex BK3ADDR
		edup
		dup 8
		bkindex BK2ADDR
		edup
					
								; last line								
		dup 4
		bkindex BK2ADDR
		edup
		bkindex BK11ADDR
		bkindex BK12ADDR
		dup 12
		bkindex BK2ADDR
		edup
		bkindex BK11ADDR
		bkindex BK12ADDR
		dup 10
		bkindex BK2ADDR
		edup
				
; --- end of scrbk7

scrbk8:
		dup 6
			dup 5
			bkindex BK2ADDR
			edup
			bkindex BK13ADDR
			bkindex BK14ADDR
			dup 20
			bkindex BK3ADDR
			edup			
			dup 3
			bkindex BK2ADDR
			edup						
		edup
		
		bkindex BK3ADDR
		bkindex BK6ADDR
		dup 3
		bkindex BK3ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 20
		bkindex BK3ADDR
		edup			
		dup 3
		bkindex BK2ADDR
		edup						

		dup 6
			bkindex BK3ADDR
			bkindex BK7ADDR
			dup 3
			bkindex BK3ADDR
			edup
			bkindex BK13ADDR
			bkindex BK14ADDR
			dup 20
			bkindex BK3ADDR
			edup			
			dup 3
			bkindex BK2ADDR
			edup						
		edup

		dup 8
		bkindex BK2ADDR
		edup
		bkindex BK11ADDR
		bkindex BK12ADDR
		dup 10
		bkindex BK2ADDR
		edup
		bkindex BK11ADDR
		bkindex BK12ADDR
		dup 8
		bkindex BK2ADDR
		edup

		dup 3
			dup 8
			bkindex BK2ADDR
			edup
			bkindex BK8ADDR
			bkindex BK9ADDR
			dup 10
			bkindex BK2ADDR
			edup
			bkindex BK8ADDR
			bkindex BK9ADDR
			dup 8
			bkindex BK2ADDR
			edup
		edup
		
; --- end of scrbk8

scrbk9:
		dup 2
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 16
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 8
		bkindex BK2ADDR
		edup
								; 2nd line
		dup 2
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 8
		bkindex BK3ADDR
		edup		
		dup 8
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 8
		bkindex BK2ADDR
		edup

								; 3rd line
		dup 2
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 9
		bkindex BK3ADDR
		edup		
		dup 7
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 8
		bkindex BK2ADDR
		edup

								; 4th line
		dup 2
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 10
		bkindex BK3ADDR
		edup		
		dup 6
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 8
		bkindex BK2ADDR
		edup

								; 5th line
		dup 2
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 11
		bkindex BK3ADDR
		edup		
		dup 5
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 8
		bkindex BK2ADDR
		edup
								; 6th line
		dup 2
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 12
		bkindex BK3ADDR
		edup		
		dup 4
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 8
		bkindex BK2ADDR
		edup
								; 7th line
		dup 2
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 13
		bkindex BK3ADDR
		edup		
		dup 3
		bkindex BK2ADDR
		edup
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 4
		bkindex BK2ADDR
		edup
		bkindex BK2ADDR		; door	
		dup 3
		bkindex BK2ADDR
		edup			
	
		dup 6
			dup 2
			bkindex BK2ADDR
			edup
			bkindex BK13ADDR
			bkindex BK14ADDR
			dup 16
			bkindex BK3ADDR
			edup		
			bkindex BK13ADDR
			bkindex BK14ADDR
			dup 8
			bkindex BK3ADDR
			edup					
		edup

		dup 8
		bkindex BK2ADDR
		edup
		dup 12
		bkindex BK3ADDR
		edup		
		bkindex BK13ADDR
		bkindex BK14ADDR
		dup 8
		bkindex BK3ADDR
		edup

		dup 10
		bkindex BK2ADDR
		edup
		bkindex BK11ADDR
		bkindex BK12ADDR
		bkindex BK2ADDR
		bkindex BK2ADDR
		bkindex BK2ADDR			; pipe top
		dup 8
		bkindex BK2ADDR
		edup
		bkindex BK2ADDR			; pipe top
		dup 6
		bkindex BK2ADDR
		edup
					
		dup 2
			dup 10
			bkindex BK2ADDR
			edup
			bkindex BK8ADDR
			bkindex BK9ADDR
			bkindex BK2ADDR
			bkindex BK2ADDR
			bkindex BK2ADDR			; pipe
			dup 8
			bkindex BK2ADDR
			edup
			bkindex BK2ADDR			; pipe
			dup 6
			bkindex BK2ADDR
			edup
		edup
		
; --- end of scrbk9

scrbk10:
		dup 6
			dup 30
			bkindex BK2ADDR
			edup
		edup

		bkindex BK2ADDR				
		bkindex BK2ADDR
		bkindex BK2ADDR				; door
		dup 27
		bkindex BK2ADDR
		edup
				
		dup 7
			dup 27
			bkindex BK3ADDR
			edup
			dup 3
			bkindex BK2ADDR
			edup			
		edup

		dup 4
		bkindex BK2ADDR
		edup
		bkindex BK11ADDR
		bkindex BK12ADDR
		dup 14
		bkindex BK2ADDR
		edup
		bkindex BK11ADDR
		bkindex BK12ADDR
		dup 8
		bkindex BK2ADDR
		edup		
		
		dup 2
			dup 4
			bkindex BK2ADDR
			edup
			bkindex BK8ADDR
			bkindex BK9ADDR
			dup 14
			bkindex BK2ADDR
			edup
			bkindex BK8ADDR
			bkindex BK9ADDR
			dup 8
			bkindex BK2ADDR
			edup		
		edup
		
; --- end of scrbk10
