scrbk11:
		spmaplen smap11b,smap11e
smap11b:			
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK11ADDR	; 2, blue ladder top left
		bkindex BK12ADDR	; 3, blue ladder top right		
		bkindex BK8ADDR		; 4, blue ladder bottom left
		bkindex BK9ADDR		; 5, blue ladder bottom right		
		bkindex BK10ADDR	; 6, blue small bricks
smap11e:					
		dup 4
			dup 4
			db 0
			edup
			
			mkbyte 4,5
			
			dup 10
			db 0
			edup
		edup

		dup 3
		db 0
		edup
		mkbyte 0,6
		mkbyte 4,5
		dup 7
		mkbyte 6,6
		edup
		mkbyte 6,0
		db 0
		db 0

		dup 5
			dup 3
			db 0
			edup
			mkbyte 0,1
			mkbyte 4,5
			dup 7
			mkbyte 1,1
			edup
			mkbyte 1,0
			db 0
			db 0
		edup
		
		dup 4
		db 0
		edup
		mkbyte 2,3
		dup 10
		db 0
		edup

		dup 6
			dup 4
			db 0
			edup
			
			mkbyte 4,5
			
			dup 10
			db 0
			edup
		edup
		
; --- end of scrbk11

scrbk12:
		spmaplen smap12b,smap12e
smap12b:			
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK11ADDR	; 2, blue ladder top left
		bkindex BK12ADDR	; 3, blue ladder top right		
		bkindex BK8ADDR		; 4, blue ladder bottom left
		bkindex BK9ADDR		; 5, blue ladder bottom right		
		bkindex BK10ADDR	; 6, blue small bricks
smap12e:					
		dup 4
			dup 2
			db 0
			edup
			
			mkbyte 4,5
			
			dup 6
			db 0
			edup
			
			mkbyte 4,5
			
			dup 5
			db 0
			edup			
		edup

		db 0
		mkbyte 6,6
		mkbyte 4,5
		dup 2
		mkbyte 6,6
		edup
		db 0
		mkbyte 0,6
		dup 2
		mkbyte 6,6
		edup
		mkbyte 4,5
		mkbyte 6,6
		mkbyte 6,0
		dup 3
		db 0
		edup
		
		dup 5
			db 0
			mkbyte 1,1
			mkbyte 4,5
			dup 2
			mkbyte 1,1
			edup
			db 0
			mkbyte 0,1
			dup 2
			mkbyte 1,1
			edup
			mkbyte 4,5
			mkbyte 1,1
			mkbyte 1,0
			dup 3
			db 0
			edup			
		edup
		
		db 0
		mkbyte 1,1
		mkbyte 4,5
		dup 2
		mkbyte 1,1
		edup
		dup 4
		db 0
		edup
		mkbyte 2,3
		dup 5
		db 0
		edup

		dup 6
			dup 9
			db 0
			edup
			mkbyte 4,5
			dup 5
			db 0
			edup
		edup
; --- end of scrbk12


scrbk13:
		spmaplen smap13b,smap13e
smap13b:			
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK8ADDR		; 2, blue ladder bottom left
		bkindex BK9ADDR		; 3, blue ladder bottom right		
		bkindex BK10ADDR	; 4, blue small bricks
smap13e:
		dup 7
			dup 4
			db 0
			edup
			
			mkbyte 2,3
			
			dup 5
			db 0
			edup
			
			mkbyte 2,3
			
			dup 4
			db 0
			edup			
		edup

		dup 4
		db 0
		edup		
		mkbyte 2,3
		dup 3
		db 0
		edup		
		dup 2
		mkbyte 4,4
		edup		
		mkbyte 2,3
		mkbyte 4,4
		mkbyte 4,0
		dup 2
		db 0
		edup		

		dup 4
		db 0
		edup		
		mkbyte 2,3
		dup 3
		db 0
		edup		
		dup 2
		mkbyte 1,1
		edup		
		mkbyte 2,3
		mkbyte 1,1
		mkbyte 1,4
		dup 2
		mkbyte 4,4
		edup		

		dup 5
			dup 4
			db 0
			edup		
			mkbyte 2,3
			dup 3
			db 0
			edup		
			dup 2
			mkbyte 1,1
			edup		
			mkbyte 2,3
			dup 4
			mkbyte 1,1
			edup
		edup

		dup 3
			dup 4
			db 0
			edup		
			mkbyte 2,3		
			dup 10
			db 0
			edup		
		edup
		
; --- end of scrbk13

scrbk14:
		spmaplen smap14b,smap14e
smap14b:			
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK8ADDR		; 2, blue ladder bottom left
		bkindex BK9ADDR		; 3, blue ladder bottom right		
		bkindex BK10ADDR	; 4, blue small bricks
		bkindex BK15ADDR	; 5, blue tube top
		bkindex BK16ADDR	; 6, blue tube
		bkindex BK17ADDR	; 7, blue tube bottom
smap14e:
		dup 4
			dup 5
			db 0
			edup
			
			mkbyte 2,3
			db 0
			mkbyte 6,0
			
			dup 3
			db 0			
			edup
			
			mkbyte 0,6

			dup 3
			db 0			
			edup
		edup

		dup 5
		db 0
		edup		
		mkbyte 2,3
		db 0
		mkbyte 6,0
		dup 3
		db 0			
		edup	
		mkbyte 0,7
		dup 3
		db 0			
		edup

		dup 5
		db 0
		edup		
		mkbyte 2,3
		db 0
		mkbyte 6,0
		dup 7
		mkbyte 4,4
		edup	

		dup 5
		db 0
		edup		
		mkbyte 2,3
		db 0
		mkbyte 6,0
		dup 7
		mkbyte 1,1
		edup	
		
		dup 2
		db 0
		edup		
		dup 3
		mkbyte 4,4
		edup
		mkbyte 2,3
		mkbyte 4,0
		mkbyte 6,0
		dup 7
		mkbyte 1,1
		edup	

		dup 2
		mkbyte 4,4
		edup		
		dup 3
		mkbyte 1,1
		edup
		mkbyte 2,3
		mkbyte 1,0
		mkbyte 6,0
		dup 7
		mkbyte 1,1
		edup	

		dup 2
			dup 5
			mkbyte 1,1
			edup		
			mkbyte 2,3
			mkbyte 1,0
			mkbyte 6,0
			dup 7
			mkbyte 1,1
			edup	
		edup

		dup 5
		mkbyte 1,1
		edup		
		mkbyte 2,3
		mkbyte 1,0
		mkbyte 6,0
		dup 3
		db 0
		edup
		mkbyte 0,5
		dup 3
		db 0
		edup	
		
		dup 2
			dup 5
			mkbyte 1,1
			edup		
			mkbyte 2,3
			mkbyte 1,0
			mkbyte 6,0
			dup 3
			db 0
			edup
			mkbyte 0,6
			dup 3
			db 0
			edup	
		edup

		dup 3
			dup 7
			db 0
			edup
			mkbyte 6,0
			dup 3
			db 0
			edup
			mkbyte 0,6
			dup 3
			db 0
			edup				
		edup
		
; --- end of scrbk14
