scrbk23:
		spmaplen smap23b,smap23e
smap23b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK8ADDR		; 1, blue ladder bottom left
		bkindex BK9ADDR		; 2, blue ladder bottom right		
		bkindex BK18ADDR	; 3, water blue
		bkindex BK19ADDR	; 4, water green
		bkindex BK15ADDR	; 5, blue tube top
		bkindex BK16ADDR	; 6, blue tube 
		bkindex BK10ADDR	; 7, blue small bricks
		bkindex BK4ADDR		; 8, blue bricks
		bkindex BK20ADDR	; 9, water blue ladder
		bkindex BK21ADDR	; A, water green ladder
		
smap23e:
		dup 7
			db 0
			db 0
			mkbyte 1,2
			db 0
			db 0
			mkbyte 6,0
			dup 3
			db 0
			edup
			mkbyte 6,0
			mkbyte 1,2
			db 0
			mkbyte 0,6
			db 0
			db 0
		edup

		mkbyte 7,7
		mkbyte 7,7
		mkbyte 1,2
		dup 3
		mkbyte 7,7
		edup
		db 0
		db 0
		mkbyte 7,7
		mkbyte 7,7
		mkbyte 1,2
		mkbyte 7,7
		mkbyte 7,7
		mkbyte 7,0
		db 0

		dup 3
			mkbyte 8,8
			mkbyte 8,8
			mkbyte 1,2
			dup 3
			mkbyte 8,8
			edup
			db 0
			db 0
			mkbyte 8,8
			mkbyte 8,8
			mkbyte 1,2
			mkbyte 8,8
			mkbyte 8,8
			mkbyte 8,0
			db 0
		edup

		mkbyte 8,8
		mkbyte 8,8
		mkbyte 1,2
		dup 3
		mkbyte 8,8
		edup
		db 0
		db 0
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 9,9
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 3,0
		db 0

		dup 2
			mkbyte 8,8
			mkbyte 8,8
			mkbyte 1,2
			dup 3
			mkbyte 8,8
			edup
			db 0
			db 0
			
			mkbyte 4,4
			mkbyte 4,4
			mkbyte 10,10
			mkbyte 4,4
			mkbyte 4,4
			mkbyte 4,0
			db 0		
		edup
				
		db 0
		dup 3
		mkbyte 5,0
		db 0
		edup
		dup 8
		db 0
		edup
		
		dup 2
			db 0
			dup 3
			mkbyte 6,0
			db 0
			edup
			dup 8	
			db 0
			edup		
		edup
		
; --- end of scrbk23

scrbk24:
		spmaplen smap24b,smap24e
smap24b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK8ADDR		; 1, blue ladder bottom left
		bkindex BK9ADDR		; 2, blue ladder bottom right		
		bkindex BK15ADDR	; 3, blue tube top
		bkindex BK16ADDR	; 4, blue tube 
		bkindex BK10ADDR	; 5, blue small bricks
		bkindex BK4ADDR		; 6, blue bricks
		bkindex BK22ADDR	; 7, solid white
smap24e:
		dup 5
			dup 3
			db 0
			edup
			mkbyte 1,2
			dup 3
			db 0
			edup
			mkbyte 4,0
			dup 3
			db 0
			edup
			mkbyte 0,4
			dup 3
			db 0
			edup
		edup
		
		db 0
		mkbyte 0,6
		mkbyte 6,6
		mkbyte 1,2
		dup 4
		mkbyte 6,6
		edup
		dup 3
		db 0
		edup
		mkbyte 0,4
		dup 3
		db 0
		edup
		
		db 0
		mkbyte 6,6
		mkbyte 6,6
		mkbyte 1,2		
		dup 9
		mkbyte 6,6
		edup		
		db 0
		db 0
		
		dup 3
		mkbyte 6,6
		edup
		mkbyte 1,2
		dup 9
		mkbyte 6,6
		edup
		mkbyte 5,5
		mkbyte 5,5
		
		dup 5
			dup 3
			mkbyte 6,6
			edup
			mkbyte 1,2
			dup 11
			mkbyte 6,6
			edup
		edup
		
		mkbyte 7,7
		mkbyte 7,7
		mkbyte 7,0
		dup 4
		db 0
		edup
		mkbyte 3,0
		dup 3
		db 0
		edup		
		dup 4
		mkbyte 6,6
		edup
		
		mkbyte 7,7
		mkbyte 7,7
		dup 5
		db 0
		edup
		mkbyte 4,0
		dup 3
		db 0
		edup
		mkbyte 0,3
		dup 3
		db 0
		edup
		
		dup 2
			dup 7
			db 0
			edup
			mkbyte 4,0
			dup 3
			db 0
			edup
			mkbyte 0,4
			dup 3
			db 0
			edup
		edup
		
; --- end of scrbk24

