scrbk20:
		spmaplen smap20b,smap20e
smap20b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK8ADDR		; 1, blue ladder bottom left
		bkindex BK9ADDR		; 2, blue ladder bottom right		
		bkindex BK16ADDR	; 3, blue tube
smap20e:		
		mkdup 15
			mkline 3
			db 0
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
			mkline 2
			db 0
		;edup

		mkdup 2
			mkline 3
			db 0
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
			mkline 2
			db 0
		;edup
		
		mscrend
		
; --- end of scrbk20

scrbk21:
		spmaplen smap21b,smap21e
smap21b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK8ADDR		; 1, blue ladder bottom left
		bkindex BK9ADDR		; 2, blue ladder bottom right		
		bkindex BK16ADDR	; 3, blue tube
smap21e:
		mkdup 15
			mkline 3
			db 0
			mkbyte 1,2
			mkline 3
			db 0
			mkbyte 3,0
			mkline 3
			db 0
			mkbyte 0,3
			mkline 3
			db 0
		;edup

		mkdup 2
			mkline 3
			db 0
			mkbyte 1,2
			mkline 3
			db 0
			mkbyte 3,0
			mkline 3
			db 0
			mkbyte 0,3
			mkline 3
			db 0
		;edup
		
		mscrend
		
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
		mkdup 3
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

		mkline 3
		db 0

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
		mkline 3
		mkbyte 4,4

		mkbyte 4,0
		mkbyte 6,0
		mkbyte 2,3
		mkline 3
		mkbyte 4,4

		db 0
		
		mkdup 7
			db 0
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 3
			mkbyte 1,1
			mkbyte 1,0
			mkbyte 6,0
			mkbyte 2,3
			mkline 3
			mkbyte 1,1
			db 0
		;edup
		
		db 0
		db 0
		mkbyte 8,9
		db 0
		db 0
		mkbyte 5,0
		mkline 3
		db 0

		mkbyte 6,0
		mkbyte 8,9
		db 0
		mkbyte 0,5
		mkline 2
		db 0
		
		mkdup 4
			db 0
			db 0
			mkbyte 2,3
			db 0
			db 0
			mkbyte 6,0
			mkline 3
			db 0
			mkbyte 6,0
			mkbyte 2,3
			db 0
			mkbyte 0,6
			mkline 2
			db 0
		;edup
		
		mscrend
		
; --- end of scrbk22

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
		mkdup 7
			db 0
			db 0
			mkbyte 1,2
			db 0
			db 0
			mkbyte 6,0
			mkline 3
			db 0

			mkbyte 6,0
			mkbyte 1,2
			db 0
			mkbyte 0,6
			mkline 2
			db 0
		;edup

		mkbyte 7,7
		mkbyte 7,7
		mkbyte 1,2
		mkline 3
		mkbyte 7,7

		mkline 2
		db 0
		mkbyte 7,7
		mkbyte 7,7
		mkbyte 1,2
		mkbyte 7,7
		mkbyte 7,7
		mkbyte 7,0
		db 0

		mkdup 3
			mkline 2
			mkbyte 8,8
			mkbyte 1,2
			mkline 3
			mkbyte 8,8
			mkline 2
			db 0
			mkline 2
			mkbyte 8,8
			mkbyte 1,2
			mkline 2
			mkbyte 8,8
			mkbyte 8,0
			db 0
		;edup

		mkline 2
		mkbyte 8,8
		mkbyte 1,2
		mkline 3
		mkbyte 8,8

		mkline 2
		db 0
		mkline 2
		mkbyte 3,3
		mkbyte 9,9
		mkline 2
		mkbyte 3,3
		mkbyte 3,0
		db 0

		mkdup 2
			mkline 2
			mkbyte 8,8
			mkbyte 1,2
			mkline 3
			mkbyte 8,8
			mkline 2
			db 0
			mkline 2
			mkbyte 4,4
			mkbyte 10,10
			mkline 2
			mkbyte 4,4
			mkbyte 4,0
			db 0		
		;edup
				
		db 0
		dup 3
		mkbyte 5,0
		db 0
		edup

		mkline 8
		db 0

		mkdup 2
			db 0
			dup 3
				mkbyte 6,0
				db 0
			edup
			mkline 8	
			db 0
		;edup

		db SCREND
        db TRIGMAP
        dw s23trm
        db MSKOMAP
        dw s23mom
        db SCREND
		
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
		mkdup 5
			mkline 3
			db 0
			mkbyte 1,2
			mkline 3
			db 0
			mkbyte 4,0
			mkline 3
			db 0
			mkbyte 0,4
			mkline 3
			db 0
		;edup
		
		db 0
		mkbyte 0,6
		mkbyte 6,6
		mkbyte 1,2
		mkline 4
		mkbyte 6,6

		mkline 3
		db 0

		mkbyte 0,4
		mkline 3
		db 0
		
		db 0
		mkline 2
		mkbyte 6,6
		mkbyte 1,2		
		mkline 9
		mkbyte 6,6

		mkline 2
		db 0
		
		mkline 3
		mkbyte 6,6

		mkbyte 1,2
		mkline 9
		mkbyte 6,6

		mkline 2
		mkbyte 5,5
		
		mkdup 5
			mkline 3
			mkbyte 6,6
			mkbyte 1,2
			mkline 11
			mkbyte 6,6
		;edup
		
		mkline 2
		mkbyte 7,7
		mkbyte 7,0
		mkline 4
		db 0

		mkbyte 3,0
		mkline 3
		db 0

		mkline 4
		mkbyte 6,6
		
		mkline 2
		mkbyte 7,7
		mkline 5
		db 0

		mkbyte 4,0
		mkline 3
		db 0

		mkbyte 0,3
		mkline 3
		db 0
		
		mkdup 2
			mkline 7
			db 0
			mkbyte 4,0
			mkline 3
			db 0
			mkbyte 0,4
			mkline 3
			db 0
		;edup
		
		mscrend
		
; --- end of scrbk24


scrbk25:
		spmaplen smap25b,smap25e
smap25b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
        bkindex BK51ADDR    ; 2, white block
        bkindex BK52ADDR    ; 3, cyan block
        bkindex BK5ADDR     ; 4, solid blue 
        bkindex BK53ADDR    ; 5, wagon left bottom edge
        bkindex BK54ADDR    ; 6, wagon right bottom edge
        bkindex BK55ADDR    ; 7, wagon window
        bkindex BK56ADDR    ; 8, wagon right top edge
        bkindex BK57ADDR    ; 9, wagon left top edge
        bkindex BK58ADDR    ; 10, wagon top
        bkindex BK59ADDR    ; 11, wagon right
        bkindex BK60ADDR    ; 12, wagon left
        bkindex BK61ADDR    ; 13, yellow block
smap25e:
		mkdup 7
			mkline 14
			db 0
			db 0
		;edup

        mkline 14
        mkbyte 1,1
        mkbyte 1,1


                    ; ----------
        mkbyte 1,1
        mkbyte 1,1
        mkbyte 1,1
        mkbyte 1,9

        mkline 7
        mkbyte 10,10

        mkbyte 8,1
        mkbyte 1,1
        mkbyte 1,1
        mkbyte 1,1

                    ; ----------
        mkdup 2
            mkbyte 1,1
            mkbyte 1,1
            mkbyte 1,1
            mkbyte 1,12

            mkbyte 4,7
            mkbyte 7,4
            
            mkbyte 4,13
            mkbyte 13,13
            mkbyte 13,4

            mkbyte 4,7
            mkbyte 7,4        

            mkbyte 11,1
            mkbyte 1,1
            mkbyte 1,1
            mkbyte 1,1

                    ; ----------
        mkbyte 1,1
        mkbyte 1,1
        mkbyte 1,1
        mkbyte 1,12

        mkline 7
        mkbyte 4,4

        mkbyte 11,1
        mkbyte 1,1
        mkbyte 1,1
        mkbyte 1,1
                    ; ----------

        mkbyte 1,1
        mkbyte 1,1
        mkbyte 1,1
        mkbyte 1,3

        mkline 7
        mkbyte 3,3

        mkbyte 3,1
        mkbyte 1,1
        mkbyte 1,1
        mkbyte 1,1
                    ; ----------
        mkbyte 2,2
        mkbyte 2,2
        mkbyte 2,2
        mkbyte 2,3

        mkline 7
        mkbyte 3,3

        mkbyte 3,2
        mkbyte 2,2
        mkbyte 2,2
        mkbyte 2,2
                    ; ----------
        mkbyte 2,2
        mkbyte 2,2
        mkbyte 2,2
        mkbyte 2,5

        mkline 7
        mkbyte 4,4

        mkbyte 6,2
        mkbyte 2,2
        mkbyte 2,2
        mkbyte 2,2
                    ; ----------

		mkdup 2
			mkline 14
			db 0
			db 0
		;edup
		
		db SCREND
        db TRIGMAP
        dw s25trm
        db MSKOMAP
        dw s64mom		
        db STOMAP
        dw s25stom
        db TXTSMAP
        dw scr64txd
        db FSTRDRP
        dw pfrrail
        db SCREND

; --- end of scrbk25

scrbk26:
		spmaplen smap26b,smap26e
smap26b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK22ADDR	; 2, solid white
smap26e:
		mkdup 5
			mkline 13
			db 0
			mkline 2
			db 0
		;edup
		
		mkline 11
		mkbyte 1,1

		mkline 4
		db 0
		
		mkline 11
		mkbyte 1,1

		mkbyte 1,0
		mkline 3
		db 0
		
		mkdup 5
			mkline 13
			mkbyte 1,1
			mkline 2
			mkbyte 1,1
		;edup
		
		mkline 10
		db 0

		mkbyte 0,1
		mkline 4
		mkbyte 1,1
		
		mkline 11
		db 0

		mkline 4
		mkbyte 2,2

		mkline 11
		db 0

		mkbyte 0,2
		mkline 3
		mkbyte 2,2
		
		mkdup 2
			mkline 13
			db 0
			mkline 2
			db 0
		;edup
		
		mscrend
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
		mkdup 5
			mkline 13
			db 0
			mkline 2
			db 0
		;edup
	
		mkline 13
		mkbyte 1,1

		mkbyte 1,3
		mkbyte 2,2
		
		mkdup 6
			mkline 13
			mkbyte 1,1
			mkbyte 1,4
			mkbyte 2,2
		;edup
		
		mkdup 5
			mkline 13
			db 0
			mkline 2
			db 0
		;edup
		
		mscrend
; --- end of scrbk27

scrbk28:
		spmaplen smap28b,smap28e
smap28b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK23ADDR	; 2, red beam
smap28e:
		mkdup 5
			mkline 13
			db 0
			mkline 2
			db 0
		;edup

		mkdup 7
			mkline 13
			mkbyte 1,1
			mkline 2
			mkbyte 1,1
		;edup
	
		mkline 10
		mkbyte 1,1

		mkbyte 1,0
		mkline 4
		db 0
		
		mkline 8
		mkbyte 2,2

		mkline 7
		db 0
		
		mkdup 3
			mkline 7
			mkbyte 1,1
			mkline 8
			db 0
		;edup

		db SCREND
        db OBJMAP
        dw s28objm
        db SCREND
        
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
		mkdup 5
			mkline 13
			db 0
			mkline 2
			db 0
		;edup
		
		mkline 5
		db 0

		mkline 2
		mkbyte 1,1
		mkbyte 3,4
		mkline 7
		mkbyte 1,1
		
		mkline 4
		db 0

		mkbyte 0,1
		mkline 2
		mkbyte 1,1
		mkbyte 3,4
		mkline 7
		mkbyte 1,1
		
		mkline 4
		db 0

		mkline 3
		mkbyte 1,1

		mkbyte 3,4
		mkline 7
		mkbyte 1,1

		mkdup 5
			mkline 3
			db 0
			mkbyte 0,1
			mkline 3
			mkbyte 1,1
			mkbyte 3,4
			mkline 7
			mkbyte 1,1
		;edup
				
		mkline 7
		db 0

		mkbyte 3,4
		db 0
		mkline 6
		mkbyte 2,2

		mkline 7
		db 0

		mkbyte 3,4
		mkline 2
		db 0
		mkline 5
		mkbyte 1,1
		
		mkline 4
		db 0

		mkline 3
		mkbyte 1,1

		mkbyte 3,4
		mkline 7
		mkbyte 1,1		
		
		mkline 3
		db 0

		mkline 4
		mkbyte 1,1
		
		mkbyte 3,4
		mkline 7
		mkbyte 1,1
		
		mscrend
		
; --- end of scrbk29
