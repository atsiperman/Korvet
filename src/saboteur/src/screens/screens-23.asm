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


scrbk25:
		spmaplen smap25b,smap25e
smap25b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK10ADDR	; 1, blue small bricks
		bkindex BK4ADDR		; 2, blue bricks
		bkindex BK22ADDR	; 3, solid white
smap25e:
		dup 7
			dup 15
			db 0
			edup
		edup
		
		dup 15
		mkbyte 1,1
		edup
		
		dup 5
			dup 15
			mkbyte 2,2
			edup
		edup
		
		dup 2
			dup 15
			mkbyte 3,3
			edup
		edup

		dup 2
			dup 15
			db 0
			edup
		edup
		
; --- end of scrbk25

scrbk26:
		spmaplen smap26b,smap26e
smap26b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK22ADDR	; 2, solid white
smap26e:
		dup 5
			dup 15
			db 0
			edup
		edup
		
		dup 11
		mkbyte 1,1
		edup
		dup 4
		db 0
		edup
		
		dup 11
		mkbyte 1,1
		edup
		mkbyte 1,0
		dup 3
		db 0
		edup
		
		dup 5
			dup 15
				mkbyte 1,1
			edup
		edup
		
		dup 10
		db 0
		edup
		mkbyte 0,1
		dup 4
		mkbyte 1,1
		edup
		
		dup 11
		db 0
		edup
		dup 4
		mkbyte 2,2
		edup

		dup 11
		db 0
		edup
		mkbyte 0,2
		dup 3
		mkbyte 2,2
		edup
		
		dup 2
			dup 15
			db 0
			edup
		edup
		
; --- end of scrbk26

scrbk27:
		spmaplen smap27b,smap27e
smap27b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK4ADDR		; 2, blue bricks
		bkindex BK6ADDR		; 3, 2 yellow bricks 
		bkindex BK7ADDR		; 4, big yellow brick
smap27e:
		dup 5
			dup 15
			db 0
			edup
		edup
	
		dup 13
		mkbyte 1,1
		edup
		mkbyte 1,3
		mkbyte 2,2
		
		dup 6
			dup 13
			mkbyte 1,1
			edup
			mkbyte 1,4
			mkbyte 2,2
		edup
		
		dup 5
			dup 15
			db 0
			edup
		edup
; --- end of scrbk27

scrbk28:
		spmaplen smap28b,smap28e
smap28b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK23ADDR	; 2, red beam
smap28e:
		dup 5
			dup 15
			db 0
			edup
		edup

		dup 7
			dup 15
			mkbyte 1,1
			edup
		edup
	
		dup 10
		mkbyte 1,1
		edup
		mkbyte 1,0
		dup 4
		db 0
		edup
		
		dup 8
		mkbyte 2,2
		edup
		dup 7
		db 0
		edup
		
		dup 3
			dup 7
			mkbyte 1,1
			edup
			dup 8
			db 0
			edup
		edup
		
; --- end of scrbk28


scrbk29:
		spmaplen smap29b,smap29e
smap29b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK23ADDR	; 2, red beam
		bkindex BK24ADDR	; 3, yellow ladder left
		bkindex BK25ADDR	; 4, yellow ladder right
smap29e:
		dup 5
			dup 15
			db 0
			edup
		edup
		
		dup 5
		db 0
		edup
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 3,4
		dup 7
		mkbyte 1,1
		edup
		
		dup 4
		db 0
		edup
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 3,4
		dup 7
		mkbyte 1,1
		edup
		
		dup 4
		db 0
		edup
		dup 3
		mkbyte 1,1
		edup
		mkbyte 3,4
		dup 7
		mkbyte 1,1
		edup

		dup 5
			dup 3
			db 0
			edup
			mkbyte 0,1
			dup 3
			mkbyte 1,1
			edup
			mkbyte 3,4
			dup 7
			mkbyte 1,1
			edup
		edup
		
		
		dup 7
		db 0
		edup
		mkbyte 3,4
		db 0
		dup 6
		mkbyte 2,2
		edup

		dup 7
		db 0
		edup
		mkbyte 3,4
		db 0
		db 0
		dup 5
		mkbyte 1,1
		edup
		
		dup 4
		db 0
		edup
		dup 3
		mkbyte 1,1
		edup
		mkbyte 3,4
		dup 7
		mkbyte 1,1
		edup
		
		dup 3
		db 0
		edup
		dup 4
		mkbyte 1,1
		edup
		mkbyte 3,4
		dup 7
		mkbyte 1,1
		edup
		
; --- end of scrbk29
