		; sprite map length
		macro spmaplen	bmap, emap
		db	(emap - bmap)
		endm
		
		macro mkbyte hi,lo
		db (hi << 4) | lo
		endm
		
scrbk1:
scrbk2:

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
		spmaplen smap4b,smap4e
smap4b:			
		bkindex BK2ADDR		; 0, 	wall
		bkindex BK1ADDR		; 1, 	yellow L
		bkindex BK6ADDR		; 2, 	2 yellow bricks 
		bkindex BK7ADDR		; 3, 	big yellow brick
		bkindex BK8ADDR		; 4,	blue ladder left bottom
		bkindex BK9ADDR		; 5,	blue ladder right bottom
		bkindex BK4ADDR		; 6, 	blue bricks
smap4e:				

		dup 2				; 1st line
		mkbyte 0,0
		edup
		mkbyte 0,6
		mkbyte 6,6
		mkbyte 4,5
		dup 6
		mkbyte 0,0
		edup
		dup 4
		mkbyte 6,6
		edup
		
		dup 2				; 2 1st line
		mkbyte 1,1
		edup
		mkbyte 2,6
		mkbyte 6,6
		mkbyte 4,5
		dup 10
		mkbyte 6,6
		edup

		dup 5				; next 5 lines
			dup 2				
			mkbyte 1,1
			edup
			mkbyte 3,6
			mkbyte 6,6
			mkbyte 4,5
			dup 10
			mkbyte 6,6
			edup
		edup
		
		dup 2				; ladder begins
		mkbyte 0,0
		edup
		mkbyte 0,6
		mkbyte 6,6
		mkbyte 4,5		
		dup 10
		mkbyte 6,6
		edup
							;
		dup 5
		mkbyte 0,0
		edup
		mkbyte 0,6
		dup 9
		mkbyte 6,6
		edup
							; 
		dup 9
		mkbyte 6,6
		edup		
		dup 6				
		mkbyte 0,0
		edup

		dup 8
		mkbyte 6,6
		edup		
		mkbyte 6,0
		dup 6				
		mkbyte 0,0
		edup

		dup 8
		mkbyte 6,6
		edup		
		dup 7				
		mkbyte 0,0
		edup

		dup 7
		mkbyte 6,6
		edup		
		mkbyte 6,0
		dup 7				
		mkbyte 0,0
		edup
		
		dup 7
		mkbyte 6,6
		edup		
		dup 8				
		mkbyte 0,0
		edup

		dup 6
		mkbyte 6,6
		edup		
		mkbyte 6,0
		dup 8				
		mkbyte 0,0
		edup
		
		dup 6
		mkbyte 6,6
		edup		
		dup 9				
		mkbyte 0,0
		edup

		dup 30
		db 0
		edup
		
; --- end of scrbk4


scrbk5:
		spmaplen smap5b,smap5e
smap5b:			
		bkindex BK2ADDR		; 0, 	wall
		bkindex BK6ADDR		; 1, 	2 yellow bricks 
		bkindex BK7ADDR		; 2, 	big yellow brick
		bkindex BK4ADDR		; 3, 	blue bricks
		bkindex BK3ADDR		; 4,	green bricks
smap5e:				
		mkbyte 3,3
		dup 3
		mkbyte 0,0
		edup
		dup 11
		mkbyte 4,4
		edup		

		dup 2
		mkbyte 3,3
		edup
		mkbyte 3,1
		dup 12
		mkbyte 4,4
		edup		

		dup 7
			dup 2
			mkbyte 3,3
			edup
			mkbyte 3,2
			dup 12
			mkbyte 4,4
			edup
		edup

		dup 7
		mkbyte 0,0
		edup
		mkbyte 0,4
		dup 7
		mkbyte 4,4
		edup
		
		dup 8
		mkbyte 0,0
		edup
		dup 7
		mkbyte 4,4
		edup
		
		dup 8
		mkbyte 0,0
		edup
		mkbyte 0,4
		dup 6
		mkbyte 4,4
		edup
		
		dup 9
		mkbyte 0,0
		edup
		dup 6
		mkbyte 4,4
		edup

		dup 9
		mkbyte 0,0
		edup
		mkbyte 0,4
		dup 5
		mkbyte 4,4
		edup

		dup 3
			dup 15
			db 0
			edup
		edup
; --- end of scrbk5

scrbk6:
		spmaplen smap6b,smap6e
smap6b:			
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK3ADDR		; 2, green bricks
		bkindex BK13ADDR	; 3, green ladder bottom left
		bkindex BK14ADDR    ; 4, green ladder bottom right
		bkindex BK11ADDR	; 5, blue ladder top left
		bkindex BK12ADDR	; 6, blue ladder top right
		bkindex BK8ADDR		; 7, blue ladder bottom left
		bkindex BK9ADDR		; 8, blue ladder bottom right
smap6e:				

		dup 14
			dup 7
			mkbyte 2,2
			edup
			mkbyte 3,4
			dup 7
			mkbyte 2,2
			edup
		edup
		
		dup 4
		db 0
		edup	
		mkbyte 5,6			; ladder
		dup 5
		db 0
		edup
		dup 5
		mkbyte 2,2
		edup
		
		dup 4
		db 0
		edup
		mkbyte 7,8			; ladder
		dup 5
		db 0
		edup
		mkbyte 0,2
		dup 4
		mkbyte 2,2
		edup
		
		dup 4
		db 0			
		edup
		mkbyte 7,8			; ladder		
		dup 10
		db 0
		edup
				
; --- end of scrbk6

scrbk7:
		spmaplen smap7b,smap7e
smap7b:			
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR		; 1, green bricks
		bkindex BK13ADDR	; 2, green ladder bottom left
		bkindex BK14ADDR    ; 3, green ladder bottom right
		bkindex BK6ADDR     ; 4, 2 yellow bricks
		bkindex BK7ADDR     ; 5, big yellow brick
		bkindex BK11ADDR	; 6, blue ladder top left
		bkindex BK12ADDR	; 7, blue ladder top right		
smap7e:				
		dup 5
			dup 5
			db 0
			edup
			mkbyte 0,2
			mkbyte 3,0
			dup 8
			db 0
			edup
		edup
							; ladder with door
		dup 5
		db 0
		edup
							; ladder
		mkbyte 0,2
		mkbyte 3,0
		
		dup 8
		db 0
		edup
							;
		dup 5
		mkbyte 1,1
		edup
		mkbyte 1,2
		mkbyte 3,1
		
		dup 7
		mkbyte 1,1
		edup
		mkbyte 4,1		
							;
		dup 6		
			dup 5
			mkbyte 1,1
			edup
			mkbyte 1,2
			mkbyte 3,1
			
			dup 7
			mkbyte 1,1
			edup
			mkbyte 5,1		
		edup
		
								; stairs	
		dup 5
		mkbyte 1,1
		edup
		mkbyte 1,2
		mkbyte 3,1
		
		dup 5
		mkbyte 1,1
		edup
		dup 3
		db 0
		edup

								; stairs	
		dup 5
		mkbyte 1,1
		edup
		mkbyte 1,2
		mkbyte 3,1
		
		dup 4
		mkbyte 1,1
		edup
		mkbyte 1,0
		dup 3
		db 0
		edup		
								; stairs	
		dup 5
		mkbyte 1,1
		edup
		mkbyte 1,2
		mkbyte 3,1		
		dup 4
		mkbyte 1,1
		edup
		dup 4
		db 0
		edup
								; last line								
		dup 2
		db 0
		edup
		mkbyte 6,7 
		dup 6
		db 0
		edup
		mkbyte 6,7 
		dup 5
		db 0
		edup
				
; --- end of scrbk7

scrbk8:
		spmaplen smap8b,smap8e
smap8b:			
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR		; 1, green bricks
		bkindex BK13ADDR	; 2, green ladder bottom left
		bkindex BK14ADDR    ; 3, green ladder bottom right
		bkindex BK6ADDR     ; 4, 2 yellow bricks
		bkindex BK7ADDR     ; 5, big yellow brick
		bkindex BK11ADDR	; 6, blue ladder top left
		bkindex BK12ADDR	; 7, blue ladder top right		
		bkindex BK8ADDR		; 8, blue ladder bottom left
		bkindex BK9ADDR		; 9, blue ladder bottom right		
smap8e:				
		dup 6
			dup 2
			db 0
			edup
			mkbyte 0,2
			mkbyte 3,1
			dup 9
			mkbyte 1,1
			edup			
			mkbyte 1,0
			db 0
		edup
		
		mkbyte 1,4
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		dup 9
		mkbyte 1,1
		edup		
		mkbyte 1,0
		db 0

		dup 6
			mkbyte 1,5
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			dup 9
			mkbyte 1,1
			edup			
			mkbyte 1,0
			db 0
		edup

		dup 4
		db 0
		edup
		mkbyte 6,7
		dup 5
		db 0
		edup
		mkbyte 6,7		
		dup 4
		db 0
		edup

		dup 3
			dup 4
			db 0
			edup
			mkbyte 8,9
			dup 5
			db 0
			edup
			mkbyte 8,9
			dup 4
			db 0
			edup
		edup
		
; --- end of scrbk8

scrbk9:
		spmaplen smap9b,smap9e
smap9b:			
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR		; 1, green bricks
		bkindex BK13ADDR	; 2, green ladder bottom left
		bkindex BK14ADDR    ; 3, green ladder bottom right
		bkindex BK6ADDR     ; 4, 2 yellow bricks
		bkindex BK7ADDR     ; 5, big yellow brick
		bkindex BK11ADDR	; 6, blue ladder top left
		bkindex BK12ADDR	; 7, blue ladder top right		
		bkindex BK8ADDR		; 8, blue ladder bottom left
		bkindex BK9ADDR		; 9, blue ladder bottom right		
		bkindex BK3ADDR		; 10, door
		bkindex BK2ADDR		; 11, pipe top
		bkindex BK2ADDR		; 12, pipe
smap9e:		
		db 0
		mkbyte 2,3
		dup 8
		db 0
		edup
		mkbyte 2,3
		dup 4
		db 0
		edup
								; 2nd line
		db 0
		mkbyte 2,3
		dup 4
		mkbyte 1,1
		edup		
		dup 4
		db 0
		edup
		mkbyte 2,3
		dup 4
		db 0
		edup

								; 3rd line
		db 0
		mkbyte 2,3
		dup 4
		mkbyte 1,1
		edup
		mkbyte 1,0
		dup 3
		db 0
		edup
		mkbyte 2,3
		dup 4
		db 0
		edup

								; 4th line
		db 0
		mkbyte 2,3
		dup 5
		mkbyte 1,1
		edup		
		dup 3
		db 0
		edup
		mkbyte 2,3
		dup 4
		db 0
		edup

								; 5th line
		db 0
		mkbyte 2,3
		dup 5
		mkbyte 1,1
		edup		
		mkbyte 1,0
		dup 2
		db 0
		edup
		mkbyte 2,3
		dup 4
		db 0
		edup
								; 6th line
		db 0
		mkbyte 2,3
		dup 6
		mkbyte 1,1
		edup		
		dup 2
		db 0
		edup
		mkbyte 2,3
		dup 4
		db 0
		edup
								; 7th line
		db 0
		mkbyte 2,3
		dup 6
		mkbyte 1,1
		edup		
		mkbyte 1,0
		db 0
		mkbyte 2,3
		dup 2
		db 0
		edup
		mkbyte 10,0				; door	
		db 0
	
		dup 6
			db 0
			mkbyte 2,3
			dup 8
			mkbyte 1,1
			edup		
			mkbyte 2,3
			dup 4
			mkbyte 1,1
			edup					
		edup

		dup 4
		db 0
		edup
		dup 6
		mkbyte 1,1
		edup		
		mkbyte 2,3
		dup 4
		mkbyte 1,1
		edup

		dup 5
		db 0
		edup
		mkbyte 6,7
		db 0
		mkbyte 11,0				; pipe top
		dup 3
		db 0
		edup
		mkbyte 0,11				; pipe top
		dup 3
		db 0
		edup
					
		dup 2
			dup 5
			db 0
			edup
			mkbyte 8,9
			db 0
			mkbyte 12,0 		; pipe
			dup 3
			db 0
			edup
			mkbyte 0,12 		; pipe
			dup 3
			db 0
			edup
		edup
		
; --- end of scrbk9

scrbk10:
		spmaplen smap10b,smap10e
smap10b:			
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR		; 1, green bricks
		bkindex BK11ADDR	; 2, blue ladder top left
		bkindex BK12ADDR	; 3, blue ladder top right		
		bkindex BK8ADDR		; 4, blue ladder bottom left
		bkindex BK9ADDR		; 5, blue ladder bottom right		
		bkindex BK3ADDR		; 6, door
smap10e:		
		dup 6
			dup 15
			db 0
			edup
		edup
		
		db 0
		mkbyte 6,0			; door
		dup 13
		db 0
		edup
				
		dup 7
			dup 13
			mkbyte 1,1
			edup
			mkbyte 1,0
			db 0
		edup

		dup 2
		db 0
		edup
		mkbyte 2,3
		dup 7
		db 0
		edup
		mkbyte 2,3
		dup 4
		db 0
		edup		
		
		dup 2
			dup 2
			db 0
			edup
			mkbyte 4,5 
			dup 7
			db 0
			edup
			mkbyte 4,5
			dup 4
			db 0
			edup		
		edup
		
; --- end of scrbk10


