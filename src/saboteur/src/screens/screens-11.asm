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
		mkdup 4
			mkline 4
			db 0			
			mkbyte 4,5			
			mkline 10
			db 0
		;edup

		mkline 3
		db 0
		
		mkbyte 0,6
		mkbyte 4,5
		mkline 7
		mkbyte 6,6
		
		mkbyte 6,0
		db 0
		db 0

		mkdup 5
			mkline 3
			db 0
			
			mkbyte 0,1
			mkbyte 4,5
			mkline 7
			mkbyte 1,1
			
			mkbyte 1,0
			db 0
			db 0
		;edup
		
		mkline 4
		db 0
		
		mkbyte 2,3
		mkline 10
		db 0

		mkdup 6
			mkline 4
			db 0			
			mkbyte 4,5			
			mkline 10
			db 0
		;edup
		
		mscrend
		
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
		mkdup 4
			mkline 2
			db 0			
			mkbyte 4,5			
			mkline 6
			db 0			
			mkbyte 4,5			
			mkline 5
			db 0		
		;edup

		db 0
		mkbyte 6,6
		mkbyte 4,5
		mkline 2
		mkbyte 6,6
		db 0
		mkbyte 0,6
		mkline 2
		mkbyte 6,6

		mkbyte 4,5
		mkbyte 6,6
		mkbyte 6,0
		mkline 3
		db 0
		
		mkdup 5
			db 0
			mkbyte 1,1
			mkbyte 4,5
			mkline 2
			mkbyte 1,1			
			db 0
			mkbyte 0,1
			mkline 2
			mkbyte 1,1			
			mkbyte 4,5
			mkbyte 1,1
			mkbyte 1,0
			mkline 3
			db 0		
		;edup
		
		db 0
		mkbyte 1,1
		mkbyte 4,5
		mkline 2
		mkbyte 1,1
		mkline 4
		db 0
		mkbyte 2,3
		mkline 5
		db 0

		mkdup 6
			mkline 9
			db 0
			mkbyte 4,5
			mkline 5
			db 0
		;edup
		
		mscrend
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
		mkdup 7
			mkline 4
			db 0
			mkbyte 2,3
			mkline 5
			db 0
			mkbyte 2,3
			mkline 4
			db 0		
		;edup

		mkline 4
		db 0
	
		mkbyte 2,3
		mkline 3
		db 0
	
		mkline 2
		mkbyte 4,4
	
		mkbyte 2,3
		mkbyte 4,4
		mkbyte 4,0
		mkline 2
		db 0
	
		mkline 4
		db 0
	
		mkbyte 2,3
		mkline 3
		db 0
	
		mkline 2
		mkbyte 1,1
	
		mkbyte 2,3
		mkbyte 1,1
		mkbyte 1,4
		mkline 2
		mkbyte 4,4	

		mkdup 5
			mkline 4
			db 0	
			mkbyte 2,3
			mkline 3
			db 0	
			mkline 2
			mkbyte 1,1	
			mkbyte 2,3
			mkline 4
			mkbyte 1,1
		;edup

		mkdup 3
			mkline 4
			db 0	
			mkbyte 2,3		
			mkline 10
			db 0	
		;edup
		
		mscrend
		
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
		mkdup 4
			mkline 5
			db 0			
			mkbyte 2,3
			db 0
			mkbyte 6,0			
			mkline 3
			db 0						
			mkbyte 0,6
			mkline 3
			db 0
		;edup

		mkline 5
		db 0
	
		mkbyte 2,3
		db 0
		mkbyte 6,0
		mkline 3
		db 0			

		mkbyte 0,7
		mkline 3
		db 0			

		mkline 5
		db 0
	
		mkbyte 2,3
		db 0
		mkbyte 6,0
		mkline 7
		mkbyte 4,4

		mkline 5
		db 0
	
		mkbyte 2,3
		db 0
		mkbyte 6,0
		mkline 7
		mkbyte 1,1
		
		mkline 2
		db 0
	
		mkline 3
		mkbyte 4,4
		
		mkbyte 2,3
		mkbyte 4,0
		mkbyte 6,0
		mkline 7
		mkbyte 1,1

		mkline 2
		mkbyte 4,4
	
		mkline 3
		mkbyte 1,1
		
		mkbyte 2,3
		mkbyte 1,0
		mkbyte 6,0
		mkline 7
		mkbyte 1,1

		mkdup 2
			mkline 5
			mkbyte 1,1	
			mkbyte 2,3
			mkbyte 1,0
			mkbyte 6,0
			mkline 7
			mkbyte 1,1
		;edup

		mkline 5
		mkbyte 1,1
	
		mkbyte 2,3
		mkbyte 1,0
		mkbyte 6,0
		mkline 3
		db 0

		mkbyte 0,5
		mkline 3
		db 0
		
		mkdup 2
			mkline 5
			mkbyte 1,1	
			mkbyte 2,3
			mkbyte 1,0
			mkbyte 6,0
			mkline 3
			db 0
			mkbyte 0,6
			mkline 3
			db 0
		;edup

		mkdup 3
			mkline 7
			db 0
			mkbyte 6,0
			mkline 3
			db 0
			mkbyte 0,6
			mkline 3
			db 0			
		;edup
		
		mscrend
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
		mkdup 4
			db 0
			db 0
			mkbyte 2,3
			mkline 4
			db 0
			mkbyte 6,0
			db 0
			mkbyte 6,0
			mkbyte 2,3
			db 0
			mkbyte 0,6
			db 0
			db 0
		;edup
		
		db 0
		db 0
		mkbyte 2,3
		mkline 4
		db 0
		
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
		mkline 3
		mkbyte 4,4

		mkbyte 4,0
		mkbyte 6,0
		mkbyte 4,4
		mkbyte 4,4
		mkbyte 2,3
		mkbyte 4,4
		mkbyte 4,4
		mkbyte 4,0
		db 0

		mkdup 5
			mkline 2
			mkbyte 1,1
			mkbyte 2,3
			mkline 3
			mkbyte 1,1
			mkbyte 1,0
			mkbyte 6,0
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,3
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,0
			db 0
		;edup
		
		db 0
		mkbyte 0,1
		mkbyte 2,3
		mkline 3
		mkbyte 1,1

		mkbyte 1,0
		mkbyte 6,0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		
		mkline 4
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
		mkline 2
		db 0
		
		mkdup 4
			mkline 3
			db 0
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
			mkline 2
			db 0
		;edup

		mscrend
		
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
		mkdup 8
			mkline 4
			db 0
			mkbyte 2,3
			mkline 10
			db 0
		;edup
		
		db 0
		mkline 3
		mkbyte 4,4

		mkbyte 2,3
		mkline 10
		mkbyte 4,4

		mkdup 6
			db 0
			mkline 3
			mkbyte 1,1
			mkbyte 2,3
			mkline 10
			mkbyte 1,1
		;edup
		
		mkdup 2
			mkline 13
			db 0
			mkline 2
			db 0
		;edup

        db SCREND		
        db TRIGMAP
        dw s16trm
        db SCREND

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
		mkdup 7
			mkline 9
			db 0
			mkbyte 2,3
			mkline 5
			db 0
		;edup
		
		mkline 2
		db 0
		mkline 7
		mkbyte 4,4

		mkbyte 2,3
		mkline 5
		mkbyte 4,4

		mkbyte 4,4
		mkbyte 4,4
		mkline 7
		mkbyte 1,1

		mkbyte 2,3
		mkline 5
		mkbyte 1,1

		mkdup 5
			mkline 9
			mkbyte 1,1
			mkbyte 2,3
			mkline 5
			mkbyte 1,1
		;edup
		
		mkline 5
		mkbyte 1,1

		mkline 10
		db 0
		
		mkdup 2
			mkline 13
			db 0
			mkline 2
			db 0
		;edup
		
		mscrend

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
		mkdup 7
			mkline 4
			db 0
			mkbyte 2,3
			mkline 10
			db 0
		;edup

		mkline 3
		mkbyte 4,4

		db 0
		mkbyte 2,3
		mkline 10
		db 0
		
		mkline 3
		mkbyte 1,1

		mkbyte 4,4
		mkbyte 2,3
		mkline 4
		mkbyte 4,4

		mkbyte 4,0
		mkline 5
		db 0
		
		mkline 4
		mkbyte 1,1

		mkbyte 2,3
		mkline 4
		mkbyte 1,1

		mkbyte 1,4
		mkline 4
		mkbyte 4,4

		db 0
		
		mkdup 4
			mkline 4
			mkbyte 1,1
			mkbyte 2,3
			mkline 9
			mkbyte 1,1
			db 0
		;edup

		db 0
		mkline 3
		mkbyte 1,1

		mkbyte 2,3
		mkline 9
		mkbyte 1,1

		mkline 3
		db 0
		
		mkbyte 5,0
		mkline 3
		db 0

		mkbyte 5,0
		mkline 7
		mkbyte 1,1

		mkline 3
		db 0
		
		mkbyte 6,0
		mkline 3
		db 0

		mkbyte 6,0
		mkline 2
		db 0
		mkbyte 0,6
		mkline 3
		db 0

		mkbyte 6,0
		db 0

		mscrend
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
		mkdup 6
			mkline 7
			db 0
			mkbyte 5,0
			mkline 3
			db 0
			mkbyte 0,5
			mkline 3
			db 0
		;edup
		
		db 0
		mkbyte 0,4
		mkline 11
		mkbyte 4,4

		mkbyte 4,0
		db 0

		mkdup 6
			db 0
			mkbyte 0,1
			mkline 11
			mkbyte 1,1
			mkbyte 1,0
			db 0
		;edup
		
		mkline 3
		db 0

		mkbyte 6,7
		mkline 3
		db 0

		mkbyte 5,0
		mkline 3
		db 0

		mkbyte 0,5
		mkline 3
		db 0

		mkdup 3
			mkline 3
			db 0
			mkbyte 2,3
			mkline 3
			db 0
			mkbyte 5,0
			mkline 3
			db 0
			mkbyte 0,5
			mkline 3
			db 0
		;edup

		mscrend
		
; --- end of scrbk19
