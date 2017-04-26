
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
		dup 20
		bkindex BK5ADDR
		edup
		dup 10
		bkindex BK2ADDR
		edup
		
		dup 21
		bkindex BK5ADDR
		edup
		bkindex BK6ADDR
		dup 8
		bkindex BK1ADDR
		edup
	
		dup 5				; yellow door
			dup 21
			bkindex BK5ADDR
			edup
			bkindex BK7ADDR
			dup 8
			bkindex BK1ADDR
			edup
		edup
							; ladder 
		dup 10
		bkindex BK2ADDR
		edup		
		bkindex BK11ADDR
		bkindex BK12ADDR
		dup 18
		bkindex BK2ADDR
		edup
							; ladder 		
		dup 10
		bkindex BK2ADDR
		edup		
		bkindex BK8ADDR
		bkindex BK9ADDR
		dup 18
		bkindex BK2ADDR
		edup
							; ladder 
		dup 9
		bkindex BK2ADDR
		edup		
		bkindex BK10ADDR
		bkindex BK8ADDR
		bkindex BK9ADDR
		dup 18
		bkindex BK10ADDR
		edup
		
		dup 6
			dup 9
			bkindex BK2ADDR
			edup		
			bkindex BK4ADDR
			bkindex BK8ADDR
			bkindex BK9ADDR			
			dup 18
			bkindex BK4ADDR
			edup
		edup

		dup 30
		bkindex BK2ADDR
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
		bkindex BK2ADDR
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
		end
		
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
			dup 27
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
		dup 7
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
			dup 7
			bkindex BK2ADDR
			edup		
		edup
		
; --- end of scrbk10
