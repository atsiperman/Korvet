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

scrbk15:
		spmaplen smap15b,smap15e
smap15b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK8ADDR		; 2, blue ladder bottom left
		bkindex BK9ADDR		; 3, blue ladder bottom right		
		bkindex BK10ADDR	; 4, blue small bricks
		bkindex BK15ADDR	; 5, blue tube top
		bkindex BK16ADDR	; 6, blue tube
		bkindex BK17ADDR	; 7, blue tube bottom
		bkindex BK11ADDR	; 8, blue ladder top left
		bkindex BK12ADDR	; 9, blue ladder top right				
smap15e:
		dup 4
			db 0
			db 0
			mkbyte 2,3
			dup 4
			db 0
			edup
			mkbyte 6,0
			db 0
			mkbyte 6,0
			mkbyte 2,3
			db 0
			mkbyte 0,6
			db 0
			db 0
		edup
		
		db 0
		db 0
		mkbyte 2,3
		dup 4
		db 0
		edup
		mkbyte 6,0
		db 0
		mkbyte 7,0
		mkbyte 2,3
		db 0
		mkbyte 0,7
		db 0
		db 0

		mkbyte 4,4
		mkbyte 4,4
		mkbyte 2,3
		dup 3
		mkbyte 4,4
		edup
		mkbyte 4,0
		mkbyte 6,0
		mkbyte 4,4
		mkbyte 4,4
		mkbyte 2,3
		mkbyte 4,4
		mkbyte 4,4
		mkbyte 4,0
		db 0

		dup 5
			dup 2
			mkbyte 1,1
			edup
			mkbyte 2,3
			dup 3
			mkbyte 1,1
			edup
			mkbyte 1,0
			mkbyte 6,0
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,3
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,0
			db 0
		edup
		
		db 0
		mkbyte 0,1
		mkbyte 2,3
		dup 3
		mkbyte 1,1
		edup
		mkbyte 1,0
		mkbyte 6,0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		db 0

		db 0
		db 0
		db 0
		mkbyte 0,8
		mkbyte 9,0
		mkbyte 5,0
		db 0
		mkbyte 6,0
		db 0
		mkbyte 5,0
		mkbyte 8,9
		db 0
		mkbyte 0,5
		db 0
		db 0
		
		dup 4
			dup 3
			db 0
			edup
			mkbyte 0,2
			mkbyte 3,0
			mkbyte 6,0
			db 0
			mkbyte 6,0
			db 0 
			mkbyte 6,0
			mkbyte 2,3
			db 0
			mkbyte 0,6
			db 0
			db 0
		edup
		
		
; --- end of scrbk15


scrbk16:
		spmaplen smap16b,smap16e
smap16b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK8ADDR		; 2, blue ladder bottom left
		bkindex BK9ADDR		; 3, blue ladder bottom right		
		bkindex BK10ADDR	; 4, blue small bricks
smap16e:
		dup 8
			db 0
			db 0
			db 0
			db 0
			mkbyte 2,3
			dup 10
			db 0
			edup 
		edup
		
		db 0
		dup 3
		mkbyte 4,4
		edup
		mkbyte 2,3
		dup 10
		mkbyte 4,4
		edup 

		dup 6
			db 0
			dup 3
			mkbyte 1,1
			edup
			mkbyte 2,3
			dup 10
			mkbyte 1,1
			edup 
		edup
		
		dup 2
			dup 15
			db 0
			edup
		edup

; --- end of scrbk16

scrbk17:
		spmaplen smap17b,smap17e
smap17b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK8ADDR		; 2, blue ladder bottom left
		bkindex BK9ADDR		; 3, blue ladder bottom right		
		bkindex BK10ADDR	; 4, blue small bricks
smap17e:
		dup 7
			dup 9
			db 0
			edup
			mkbyte 2,3
			dup 5
			db 0
			edup 
		edup
		
		db 0
		db 0
		dup 7
		mkbyte 4,4
		edup
		mkbyte 2,3
		dup 5
		mkbyte 4,4
		edup 

		mkbyte 4,4
		mkbyte 4,4
		dup 7
		mkbyte 1,1
		edup
		mkbyte 2,3
		dup 5
		mkbyte 1,1
		edup

		dup 5
			dup 9
			mkbyte 1,1
			edup
			mkbyte 2,3
			dup 5
			mkbyte 1,1
			edup 
		edup
		
		dup 5
		mkbyte 1,1
		edup
		dup 11
		db 0
		edup
		
		dup 2
			dup 15
			db 0
			edup
		edup
		

; --- end of scrbk17

scrbk18:
		spmaplen smap18b,smap18e
smap18b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK8ADDR		; 2, blue ladder bottom left
		bkindex BK9ADDR		; 3, blue ladder bottom right		
		bkindex BK10ADDR	; 4, blue small bricks
		bkindex BK15ADDR	; 5, blue tube top
		bkindex BK16ADDR	; 6, blue tube
smap18e:
		dup 7
			dup 4
			db 0
			edup
			mkbyte 2,3
			dup 10
			db 0
			edup
		edup

		dup 3
		mkbyte 4,4
		edup
		db 0
		mkbyte 2,3
		dup 10
		db 0
		edup
		
		dup 3
		mkbyte 1,1
		edup
		mkbyte 4,4
		mkbyte 2,3
		dup 4
		mkbyte 4,4
		edup
		mkbyte 4,0
		dup 5
		db 0
		edup
		
		dup 4
		mkbyte 1,1
		edup
		mkbyte 2,3
		dup 4
		mkbyte 1,1
		edup
		mkbyte 1,4
		dup 5
		mkbyte 4,4
		edup
		
		dup 4
			dup 4
			mkbyte 1,1
			edup
			mkbyte 2,3
			dup 9
			mkbyte 1,1
			edup
			db 0
		edup

		db 0
		dup 3
		mkbyte 1,1
		edup
		mkbyte 2,3
		dup 9
		mkbyte 1,1
		edup
		db 0
		
		db 0
		db 0
		mkbyte 5,0
		dup 3
		db 0
		edup
		mkbyte 5,0
		dup 7
		mkbyte 1,1
		edup
		db 0
		
		db 0
		db 0
		mkbyte 6,0
		dup 3
		db 0
		edup
		mkbyte 6,0
		db 0
		db 0
		mkbyte 0,6
		dup 3
		db 0
		edup
		mkbyte 6,0
		db 0
		
; --- end of scrbk18

scrbk19:
		spmaplen smap19b,smap19e
smap19b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK8ADDR		; 2, blue ladder bottom left
		bkindex BK9ADDR		; 3, blue ladder bottom right		
		bkindex BK10ADDR	; 4, blue small bricks
		bkindex BK16ADDR	; 5, blue tube
		bkindex BK11ADDR	; 6, blue ladder top left
		bkindex BK12ADDR	; 7, blue ladder top right						
smap19e:
		dup 6
			dup 7
			db 0			
			edup
			mkbyte 5,0
			dup 3
			db 0
			edup
			mkbyte 0,5
			dup 3
			db 0
			edup
		edup
		
		db 0
		mkbyte 0,4
		dup 11
		mkbyte 4,4
		edup
		mkbyte 4,0
		db 0

		dup 6
			db 0
			mkbyte 0,1
			dup 11
			mkbyte 1,1
			edup
			mkbyte 1,0
			db 0
		edup
		
		dup 3
		db 0
		edup
		mkbyte 6,7
		dup 3
		db 0
		edup
		mkbyte 5,0
		dup 3
		db 0
		edup
		mkbyte 0,5
		dup 3
		db 0
		edup

		dup 3
			dup 3
			db 0
			edup
			mkbyte 2,3
			dup 3
			db 0
			edup
			mkbyte 5,0
			dup 3
			db 0
			edup
			mkbyte 0,5
			dup 3
			db 0
			edup
		edup
		
; --- end of scrbk19

scrbk20:
		spmaplen smap20b,smap20e
smap20b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK8ADDR		; 1, blue ladder bottom left
		bkindex BK9ADDR		; 2, blue ladder bottom right		
		bkindex BK16ADDR	; 3, blue tube
smap20e:
		dup 17
			dup 3
			db 0
			edup
			mkbyte 0,1
			mkbyte 2,0
			mkbyte 3,0
			db 0
			mkbyte 3,0
			db 0
			mkbyte 3,0
			mkbyte 1,2
			db 0
			mkbyte 0,3
			db 0
			db 0
		edup

; --- end of scrbk20

scrbk21:
		spmaplen smap21b,smap21e
smap21b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK8ADDR		; 1, blue ladder bottom left
		bkindex BK9ADDR		; 2, blue ladder bottom right		
		bkindex BK16ADDR	; 3, blue tube
smap21e:
		dup 17
			dup 3
			db 0
			edup
			mkbyte 1,2
			dup 3
			db 0
			edup
			mkbyte 3,0
			dup 3
			db 0
			edup
			mkbyte 0,3
			dup 3
			db 0
			edup
		edup

; --- end of scrbk21

scrbk22:
		spmaplen smap22b,smap22e
smap22b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK8ADDR		; 2, blue ladder bottom left
		bkindex BK9ADDR		; 3, blue ladder bottom right		
		bkindex BK10ADDR	; 4, blue small bricks
		bkindex BK15ADDR	; 5, blue tube top
		bkindex BK16ADDR	; 6, blue tube
		bkindex BK17ADDR	; 7, blue tube bottom
		bkindex BK11ADDR	; 8, blue ladder top left
		bkindex BK12ADDR	; 9, blue ladder top right						
smap22e:
		dup 3
			dup 3
			db 0
			edup
			mkbyte 0,2
			mkbyte 3,0
			mkbyte 6,0
			db 0
			mkbyte 6,0
			db 0
			mkbyte 6,0
			mkbyte 2,3
			db 0
			mkbyte 0,6
			db 0
			db 0
		edup

		dup 3
		db 0
		edup
		mkbyte 0,2
		mkbyte 3,0
		mkbyte 7,0
		db 0
		mkbyte 7,0
		db 0
		mkbyte 6,0
		mkbyte 2,3
		db 0
		mkbyte 0,7
		db 0
		db 0

		db 0
		mkbyte 4,4
		mkbyte 4,4
		mkbyte 4,2
		mkbyte 3,4
		dup 3
		mkbyte 4,4
		edup
		mkbyte 4,0
		mkbyte 6,0
		mkbyte 2,3
		dup 3
		mkbyte 4,4
		edup
		db 0
		
		dup 7
			db 0
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			dup 3
			mkbyte 1,1
			edup
			mkbyte 1,0
			mkbyte 6,0
			mkbyte 2,3
			dup 3
			mkbyte 1,1
			edup
			db 0
		edup
		
		db 0
		db 0
		mkbyte 8,9
		db 0
		db 0
		mkbyte 5,0
		dup 3
		db 0
		edup
		mkbyte 6,0
		mkbyte 8,9
		db 0
		mkbyte 0,5
		db 0
		db 0
		
		dup 4
			db 0
			db 0
			mkbyte 2,3
			db 0
			db 0
			mkbyte 6,0
			dup 3
			db 0
			edup
			mkbyte 6,0
			mkbyte 2,3
			db 0
			mkbyte 0,6
			db 0
			db 0
		edup
		
		
; --- end of scrbk22