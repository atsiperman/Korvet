
		
scrbk1:
		spmaplen smap1b,smap1e
smap1b:			
		bkindex BK5ADDR		; 0, 	solid blue
		bkindex BK40ADDR	; 1,	underwater floor		
		bkindex BK43ADDR	; 2,	water layer
		bkindex BK69ADDR	; 3, water top
smap1e:										
		mkdup 12
			mkline 14
				db 0
			db 0

		mkline 14
			mkbyte 3,3
		mkbyte 3,3

		mkdup 3
			mkline 14
				mkbyte 2,2
			mkbyte 2,2

		mkline 14
			mkbyte 1,1
		mkbyte 1,1

        db SCREND
		db STOMAP
		dw s1stom
		db TXTSMAP
        dw scrn1txd
		db SCRINIP
		dw s1iprc
        db SCREND

scrn1txd:					; description of the text RAM used by this screen
		mkbyte TXLINEH,15
			mktxtaddr 0, 6
			db CHBOTM
		mkbyte TXLINEH,15
			mktxtaddr 15, 6
			db CHBOTM

		mkbyte TXLINEH,15
			mktxtaddr 0, 7
			db CHFULL
		mkbyte TXLINEH,15
			mktxtaddr 15, 7
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 0, 8
			db CHTOP
		mkbyte TXLINEH,15
			mktxtaddr 15, 8
			db CHTOP

		db SCREND

scrbk2:
		spmaplen smap2b,smap2e
smap2b:			
		bkindex BK5ADDR		; 0, 	solid blue
		bkindex BK2ADDR		; 1, 	wall
		bkindex BK40ADDR	; 2,	underwater floor
		bkindex BK42ADDR	; 3,	moorage, vertical part
		bkindex BK41ADDR	; 4,	moorage, horizontal part, ladder
		bkindex BK43ADDR	; 5,	water layer
		bkindex BK44ADDR	; 6,    invisible ladder
		bkindex BK45ADDR	; 7 ,   water layer, ladder
		bkindex BK69ADDR	; 8, 	water top
		bkindex BK70ADDR	; 9, 	water top, ladder
		bkindex B_41ADDR	; 10,	moorage, horizontal part, wall
smap2e:										
							; 1st line
		mkdup 7
			mkline 14
			db 0
			db 0
		;edup

		mkline 4
			db 0
		mkbyte 10,4
		mkbyte 4,10
		mkbyte 10,10
		mkbyte 4,4
		mkbyte 10,10
		mkbyte 10,4
		mkbyte 4,10
		mkbyte 10,10
		mkbyte 10,10
		mkbyte 10,1
		; mkline 9
		; 	mkbyte 4,4
		; mkbyte 4,1		
		mkbyte 1,1

		mkdup 4
			mkline 4
			db 0
			mkbyte 0,3
			mkbyte 6,0
			db 0
			mkbyte 3,6
			db 0
			mkbyte 0,3
			mkbyte 6,0
			mkbyte 0,1
			mkline 3
			mkbyte 1,1
		;edup

		mkline 4
			mkbyte 8,8
		mkbyte 8,9
		mkbyte 9,8
		mkbyte 8,8
		mkbyte 9,9
		mkbyte 8,8
		mkbyte 8,9
		mkbyte 9,8
		mkbyte 9,1
		mkline 3
			mkbyte 1,1

		mkdup 3
			mkline 4
			mkbyte 5,5
			mkbyte 5,7
			mkbyte 7,5
			mkbyte 5,5
			mkbyte 7,7
			mkbyte 5,5
			mkbyte 5,7
			mkbyte 7,5
			mkbyte 5,1
			mkline 3
			mkbyte 1,1
		;edup 

		mkline 11
		mkbyte 2,2
		mkbyte 2,1
		mkline 3
		mkbyte 1,1

		db SCREND           ; end of screen map

        db STOMAP
        dw s2stom
        db MSKOMAP
        dw s2mom
        db TXTSMAP
        dw scrn2txd
		db SCRINIP
		dw s2iprc
        db SCREND

scrn2txd:					; description of the text RAM used by this screen
		mkbyte TXLINEH,15
			mktxtaddr 0, 6
			db CHBOTM

		mkbyte TXLINEH,8
			mktxtaddr 15, 6
			db CHBOTM

		mkbyte TXLINEH,15
			mktxtaddr 0, 7
			db CHFULL

		mkbyte TXLINEH,8
			mktxtaddr 15, 7
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 0, 8
			db CHTOP

		mkbyte TXLINEH,8
			mktxtaddr 15, 8
			db CHTOP

		db SCREND

; --- end of scrbk2

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
		mkline 10
		db	0		
		
		mkline 5
		mkbyte 1,1
							; 2nd line
		mkline 10
		db 0
		
		mkbyte 0,3
		mkline 4
		mkbyte 2,2
	
		mkdup 5				; yellow door
			mkline 10
			db	0
				
			mkbyte 0,4
			
			mkline 4
			mkbyte 2,2
		;edup
							; ladder 							
		mkline 5
		mkbyte 1,1
				
		mkbyte 7,8
		mkline 9
		mkbyte 1,1
							; ladder 		
		mkline 5
		mkbyte 1,1
		
		mkbyte 5,6
		
		mkline 9
		mkbyte 1,1
							; ladder 
		mkline 4
		mkbyte 1,1
				
		mkbyte 1,9
		mkbyte 5,6
		
		mkline 9
		mkbyte 9,9
		
		mkdup 6
			mkline 4
			mkbyte 1,1
			mkbyte 1,10
			mkbyte 5,6
			mkline 9
			mkbyte 10,10
		;edup

		mkline 13
		mkbyte 1,1	
		mkbyte 1,1	
		mkbyte 1,1
		
		db SCREND

        db OBJMAP
        dw s3objm
        db MSKOMAP
        dw s3mom
        db TRIGMAP
        dw s3trm
        db SCREND

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

		mkline 2				; 1st line
		mkbyte 0,0
		
		mkbyte 0,6
		mkbyte 6,6
		mkbyte 4,5
		
		mkline 6
		mkbyte 0,0
		
		mkline 4
		mkbyte 6,6		
		
		mkline 2				; 2 1st line
		mkbyte 1,1
		
		mkbyte 2,6
		mkbyte 6,6
		mkbyte 4,5
		mkline 10
		mkbyte 6,6		

		mkdup 5				; next 5 lines
			mkline 2				
			mkbyte 1,1
			mkbyte 3,6
			mkbyte 6,6
			mkbyte 4,5
			mkline 10
			mkbyte 6,6
		;edup
		
		mkline 2				; ladder begins
		mkbyte 0,0
		
		mkbyte 0,6
		mkbyte 6,6
		mkbyte 4,5		
		mkline 10
		mkbyte 6,6		
							;
		mkline 5
		mkbyte 0,0
		
		mkbyte 0,6
		
		mkline 9
		mkbyte 6,6		
							; 
		mkline 9
		mkbyte 6,6
			
		mkline 6				
		mkbyte 0,0

		mkline 8
		mkbyte 6,6
			
		mkbyte 6,0
		
		mkline 6				
		mkbyte 0,0
		

		mkline 8
		mkbyte 6,6
				
		mkline 7				
		mkbyte 0,0		

		mkline 7
		mkbyte 6,6
			
		mkbyte 6,0
		
		mkline 7				
		mkbyte 0,0		
		
		mkline 7
		mkbyte 6,6
		
		mkline 8				
		mkbyte 0,0

		mkline 6
		mkbyte 6,6
			
		mkbyte 6,0
		
		mkline 8				
		mkbyte 0,0
		
		mkline 6
		mkbyte 6,6
			
		mkline 9				
		mkbyte 0,0		
		
		mkline 13
		db 0
		db 0
		db 0
		
		db SCREND

        db OBJMAP
        dw s4objm
        db MSKOMAP
        dw s4mom
        db SCREND

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
		mkline 3
		mkbyte 0,0
		
		mkline 11
		mkbyte 4,4	

		mkline 2
		mkbyte 3,3

		mkbyte 3,1
		mkline 12
		mkbyte 4,4	

		mkdup 7
			mkline 2
			mkbyte 3,3
			mkbyte 3,2
			mkline 12
			mkbyte 4,4		
		;edup

		mkline 7
		mkbyte 0,0
		
		mkbyte 0,4
		
		mkline 7
		mkbyte 4,4	
		
		mkline 8
		mkbyte 0,0
		
		mkline 7
		mkbyte 4,4
		
		mkline 8
		mkbyte 0,0
		
		mkbyte 0,4
		
		mkline 6
		mkbyte 4,4
		
		mkline 9
		mkbyte 0,0
		
		mkline 6
		mkbyte 4,4

		mkline 9
		mkbyte 0,0

		mkbyte 0,4
		
		mkline 5		
		mkbyte 4,4
		
		mkdup 3
			mkline 13
			db 0
			db 0
			db 0
		;edup
		
		db SCREND
        db TXTSMAP
        dw scr5txd
        db MSKOMAP
        dw s5mom
		db SCREND

scr5txd:
		mkbyte TXLINEH,15 ;22
			mktxtaddr 8, 0
			db CHBOTM
		mkbyte TXLINEH,7
			mktxtaddr 23, 0
			db CHBOTM

        mkbyte TXLINEH,15 ;24
            mktxtaddr 6, 1
            db CHFULL
        mkbyte TXLINEH,9 ;24
            mktxtaddr 21, 1
            db CHFULL

        mkbyte TXLINEH,15 ;24
            mktxtaddr 6, 2
            db CHFULL
        mkbyte TXLINEH,9 ;24
            mktxtaddr 21, 2
            db CHFULL

        mkbyte TXLINEH,15 ;24
            mktxtaddr 6, 3
            db CHFULL
        mkbyte TXLINEH,9 ;24
            mktxtaddr 21, 3
            db CHFULL

        mkbyte TXLINEH,15 ;24
            mktxtaddr 6, 4
            db CHFULL
        mkbyte TXLINEH,9 ;24
            mktxtaddr 21, 4
            db CHFULL

        mkbyte TXLINEH,1
            mktxtaddr 15, 5
            db CHTOP
        mkbyte TXLINEH,14 
            mktxtaddr 16, 5
            db CHFULL

        mkbyte TXLINEH,1
            mktxtaddr 17, 6
            db CHTOP
        mkbyte TXLINEH,12
            mktxtaddr 18, 6
            db CHFULL

        mkbyte TXLINEH,11
            mktxtaddr 19, 7
            db CHTOP

        mscrend	

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

		mkdup 14
			mkline 7
			mkbyte 2,2
			mkbyte 3,4
			mkline 7
			mkbyte 2,2			
		;edup
		
		mkline 4
		db 0
		mkbyte 5,6			; ladder		
		mkline 5
		db 0		
		mkline 5
		mkbyte 2,2
		
		mkline 4
		db 0		
		mkbyte 7,8			; ladder
		mkline 5
		db 0		
		mkbyte 0,2
		mkline 4
		mkbyte 2,2		
		
		mkline 4
		db 0					
		mkbyte 7,8			; ladder		
		mkline 10
		db 0

		db SCREND
        db MSKOMAP
        dw s6mom
        db TXTSMAP
        dw scr6txd
		db SCREND

scr6txd:
		mkbyte TXLINEH,15
			mktxtaddr 0, 0
			db CHBOTM
		mkbyte TXLINEH,15
			mktxtaddr 15, 0
			db CHBOTM

        mkbyte TXLINEH,15
            mktxtaddr 0, 1
            db CHFULL
        mkbyte TXLINEH,15
            mktxtaddr 15, 1
            db CHFULL

        mkbyte TXLINEH,15 
            mktxtaddr 0, 2
            db CHFULL
        mkbyte TXLINEH,15
            mktxtaddr 15, 2
            db CHFULL

        mkbyte TXLINEH,15 
            mktxtaddr 0, 3
            db CHFULL
        mkbyte TXLINEH,15
            mktxtaddr 15, 3
            db CHFULL

        mkbyte TXLINEH,15 
            mktxtaddr 0, 4
            db CHFULL
        mkbyte TXLINEH,15 
            mktxtaddr 15, 4
            db CHFULL

        mkbyte TXLINEH,15 
            mktxtaddr 0, 5
            db CHFULL
        mkbyte TXLINEH,15 
            mktxtaddr 15, 5
            db CHFULL

        mkbyte TXLINEH,15 
            mktxtaddr 0, 6
            db CHFULL
        mkbyte TXLINEH,15 
            mktxtaddr 15, 6
            db CHFULL

        mkbyte TXLINEH,15 
            mktxtaddr 0, 7
            db CHTOP
        mkbyte TXLINEH,5
            mktxtaddr 15, 7
            db CHTOP

        mkbyte TXLINEH,10
            mktxtaddr 20, 7
            db CHFULL
        mkbyte TXLINEH,9
            mktxtaddr 21, 8
            db CHTOP

        mscrend	

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
        bkindex BK62ADDR    ; 8, horizontal white door
smap7e:				
		mkdup 5
			mkline 5
			db 0
			mkbyte 0,2
			mkbyte 3,0
			mkline 8
			db 0			
		;edup
							; ladder with door
		mkline 5
		db 0
							; ladder
		mkbyte 0,8
		mkbyte 8,0		
		mkline 8
		db 0
							;
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1		
		mkline 7
		mkbyte 1,1
		mkbyte 4,1		
							;
		mkdup 6		
			mkline 5
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 7
			mkbyte 1,1
			mkbyte 5,1		
		;edup
		
								; stairs	
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1
		mkline 3
		db 0

								; stairs	
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 4
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0	
								; stairs	
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1		
		mkline 4
		mkbyte 1,1
		mkline 4
		db 0
								; last line								
		mkline 2
		db 0
		mkbyte 6,7 
		mkline 6
		db 0
		mkbyte 6,7 
		mkline 5
		db 0
		
		db SCREND
        db OBJMAP
        dw s7objm
        db MSKOMAP
        dw s7mom
        db TXTSMAP
        dw scr7txd
        db SCREND
				
scr7txd:
		mkbyte TXLINEH,2
			mktxtaddr 11, 0
			db CHBOTM

		mkbyte TXLINEV,3
			mktxtaddr 11, 1
			db CHFULL

		mkbyte TXLINEV,3
			mktxtaddr 12, 1
			db CHFULL

		mkbyte TXLINEH,11
			mktxtaddr 0, 3
			db CHBOTM
		mkbyte TXLINEH,15
			mktxtaddr 13, 3
			db CHBOTM

		mkbyte TXLINEV,1
			mktxtaddr 29, 3
			db CHBOTM
            
		mkbyte TXLINEV,3
			mktxtaddr 29, 4
			db CHFULL
            
		mkbyte TXLINEH,15
			mktxtaddr 0, 4
			db CHFULL
		mkbyte TXLINEH,13
			mktxtaddr 15, 4
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 0, 5
			db CHFULL
		mkbyte TXLINEH,13
			mktxtaddr 15, 5
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 0, 6
			db CHFULL
		mkbyte TXLINEH,13
			mktxtaddr 15, 6
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 0, 7
			db CHFULL
		mkbyte TXLINEH,8
			mktxtaddr 15, 7
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 23, 7
			db CHTOP

		mkbyte TXLINEH,15
			mktxtaddr 0, 8
			db CHTOP
		mkbyte TXLINEH,7
			mktxtaddr 15, 8
			db CHTOP

        db SCREND

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
		mkdup 6
			mkline 2
			db 0
			mkbyte 0,2
			mkbyte 3,1
			mkline 9
			mkbyte 1,1
			mkbyte 1,0
			db 0
		;edup
		
		mkbyte 1,4
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 9
		mkbyte 1,1
		
		mkbyte 1,0
		db 0

		mkdup 6
			mkbyte 1,5
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 9
			mkbyte 1,1
			mkbyte 1,0
			db 0
		;edup

		mkline 4
		db 0
		mkbyte 6,7
		mkline 5
		db 0
		mkbyte 6,7		
		mkline 4
		db 0
		

		mkdup 3
			mkline 4
			db 0
			mkbyte 8,9
			mkline 5
			db 0
			mkbyte 8,9
			mkline 4
			db 0			
		;edup
		
		db SCREND
        db OBJMAP
        dw s8objm
        db TXTSMAP
        dw scr8txd
        db SCREND
		
scr8txd:
		mkbyte TXLINEH,1
			mktxtaddr 0, 3
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 0, 4
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 5, 0
			db CHBOTM
		mkbyte TXLINEH,10
			mktxtaddr 20, 0
			db CHBOTM

		mkbyte TXLINEH,15
			mktxtaddr 5, 1
			db CHFULL
		mkbyte TXLINEH,10
			mktxtaddr 20, 1
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 5, 2
			db CHFULL
		mkbyte TXLINEH,10
			mktxtaddr 20, 2
			db CHFULL

		mkbyte TXLINEH,3
			mktxtaddr 2, 3
			db CHFULL
		mkbyte TXLINEH,15
			mktxtaddr 5, 3
			db CHFULL
		mkbyte TXLINEH,10
			mktxtaddr 20, 3
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 4
			db CHFULL
		mkbyte TXLINEH,13
			mktxtaddr 17, 4
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 5
			db CHFULL
		mkbyte TXLINEH,13
			mktxtaddr 17, 5
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 6
			db CHFULL
		mkbyte TXLINEH,13
			mktxtaddr 17, 6
			db CHFULL

        db SCREND

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
		mkline 8
		db 0
		mkbyte 2,3
		mkline 4
		db 0		
								; 2nd line
		db 0
		mkbyte 2,3
		mkline 4
		mkbyte 1,1
		mkline 4
		db 0
		mkbyte 2,3
		mkline 4
		db 0		

								; 3rd line
		db 0
		mkbyte 2,3
		mkline 4
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0
		mkbyte 2,3
		mkline 4
		db 0		

								; 4th line
		db 0
		mkbyte 2,3
		mkline 5
		mkbyte 1,1
		mkline 3
		db 0
		mkbyte 2,3
		mkline 4
		db 0		

								; 5th line
		db 0
		mkbyte 2,3
		mkline 5
		mkbyte 1,1
		mkbyte 1,0
		mkline 2
		db 0
		mkbyte 2,3
		mkline 4
		db 0		
								; 6th line
		db 0
		mkbyte 2,3
		mkline 6
		mkbyte 1,1
		mkline 2
		db 0
		mkbyte 2,3
		mkline 4
		db 0		
								; 7th line
		db 0
		mkbyte 2,3
		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		db 0
		mkbyte 2,3
		mkline 2
		db 0		
		mkbyte 10,0				; door	
		db 0
	
		mkdup 6
			db 0
			mkbyte 2,3
			mkline 8
			mkbyte 1,1
			mkbyte 2,3
			mkline 4
			mkbyte 1,1
		;edup

		mkline 4
		db 0		
		mkline 6
		mkbyte 1,1		
		mkbyte 2,3
		mkline 4
		mkbyte 1,1
		
		mkline 5
		db 0		
		mkbyte 6,7
		db 0
		mkbyte 11,0				; pipe top
		mkline 3
		db 0		
		mkbyte 0,11				; pipe top
		mkline 3
		db 0
					
		mkdup 2
			mkline 5
			db 0
			mkbyte 8,9
			db 0
			mkbyte 12,0 		; pipe
			mkline 3
			db 0
			mkbyte 0,12 		; pipe
			mkline 3
			db 0
		;edup
		
		db SCREND
        db OBJMAP
        dw s9objm
        db TXTSMAP
        dw scr9txd
        db TRIGMAP
        dw s9trm
        db MSKOMAP
        dw s9mom
        db SCRINIP
        dw s9rndr
        db SCREND
		
scr9txd:
		mkbyte TXLINEH,2
			mktxtaddr 2, 0
			db CHBOTM
		mkbyte TXLINEH,2
			mktxtaddr 20, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 20, 1
			db CHFULL
		mkbyte TXLINEV,3
			mktxtaddr 21, 1
			db CHFULL

		mkbyte TXLINEH,10
			mktxtaddr 2, 1
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 12, 1
			db CHBOTM

		mkbyte TXLINEH,12
			mktxtaddr 2, 2
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 14, 2
			db CHBOTM

		mkbyte TXLINEH,15
			mktxtaddr 2, 3
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 16, 3
			db CHBOTM
		mkbyte TXLINEH,1
			mktxtaddr 26, 3
			db CHBOTM

		mkbyte TXLINEH,15
			mktxtaddr 2, 4
			db CHFULL
		mkbyte TXLINEH,13
			mktxtaddr 17, 4
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 5
			db CHFULL
		mkbyte TXLINEH,13
			mktxtaddr 17, 5
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 6
			db CHFULL
		mkbyte TXLINEH,13
			mktxtaddr 17, 6
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 8, 7
			db CHTOP
		mkbyte TXLINEH,7
			mktxtaddr 23, 7
			db CHTOP

        db SCREND

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
		bkindex BKDOORTL    ; 6, door
smap10e:		
		mkdup 6
			mkline 13
			db 0
			db 0
			db 0	
		;edup
		
		db 0
		mkbyte 6,0			; door
		mkline 13
		db 0
				
		mkdup 7
			mkline 13
			mkbyte 1,1
			mkbyte 1,0
			db 0
		;edup

		mkline 2
		db 0
		mkbyte 2,3
		mkline 7
		db 0
		mkbyte 2,3
		mkline 4
		db 0
		
		mkdup 2
			mkline 2
			db 0
			mkbyte 4,5 
			mkline 7
			db 0
			mkbyte 4,5
			mkline 4
			db 0	
		;edup
		
		db SCREND
        db OBJMAP
        dw s10objm
        db TXTSMAP
        dw scr10txd
        db SCREND

scr10txd:
		mkbyte TXLINEH,3
			mktxtaddr 2, 3
			db CHBOTM

		mkbyte TXLINEH,15
			mktxtaddr 0, 4
			db CHFULL
		mkbyte TXLINEH,15
			mktxtaddr 15, 4
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 0, 5
			db CHFULL
		mkbyte TXLINEH,15
			mktxtaddr 15, 5
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 0, 6
			db CHFULL
		mkbyte TXLINEH,15
			mktxtaddr 15, 6
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 0, 7
			db CHTOP
		mkbyte TXLINEH,15
			mktxtaddr 15, 7
			db CHTOP

        db SCREND
		
; --- end of scrbk10


