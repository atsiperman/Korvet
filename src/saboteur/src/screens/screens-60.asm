scrbk60:
		spmaplen smap60b,smap60e
smap60b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK5ADDR		; 2, solid blue 
		bkindex BK29ADDR    ; 3, solid red
		bkindex BK36ADDR    ; 4, red right top edge
		bkindex BK37ADDR    ; 5, red right bottom edge
		bkindex BK38ADDR	; 6, top black half
		bkindex BK39ADDR	; 7, bottom black half
		bkindex BK30ADDR	; 8, solid green
        bkindex BK65ADDR    ; 9, green-yellow L
        bkindex BK67ADDR    ; 10, green-yellow L
smap60e:
							; 1
		mkline 13
		mkbyte 3,3
		mkbyte 3,4
		mkbyte 1,1
							; 2
		mkline 13
		mkbyte 3,3					
		mkbyte 3,5
		mkbyte 1,1

							; 3		
		mkline 10
		mkbyte 6,6
		mkbyte 6,1
		mkline 4
		mkbyte 1,1

							; 4		
		mkline 10
		mkbyte 8,8
		mkbyte 9,1
		mkline 4
		mkbyte 1,1
		
							; 5		
		mkline 9
		mkbyte 8,8
        mkbyte 8,10
		mkline 5
		mkbyte 1,1		
							; 6
		mkline 9
		mkbyte 8,8
        mkbyte 8,9
		mkline 5			
		mkbyte 1,1		
							; 7
		mkline 9	
		mkbyte 8,8
		mkbyte 10,1
		mkline 5			
		mkbyte 1,1		
							; 8
		mkline 9
		mkbyte 7,7
		mkbyte 9,1
		mkline 5			
		mkbyte 1,1		
		
		mkdup 7
			mkline 9
			mkbyte 2,2		
			mkline 6
			mkbyte 1,1
		;edup
		
		mkdup 2
			mkline 14
			db 0
			db 0
		;edup

		db SCREND
        db STOMAP
        dw s60stom
        db OBJMAP        
        dw s60objm
        db MSKOMAP
        dw s60mom
        db TRIGMAP
        dw s60trm
        db TXTSMAP
        dw scr60txd
        db SCREND
		
scr60txd:
		mkbyte TXLINEH,15
			mktxtaddr 0, 1
			db CHBOTM
		mkbyte TXLINEH,6
			mktxtaddr 15, 1
			db CHBOTM

		mkbyte TXLINEH,15
			mktxtaddr 0, 2
			db CHFULL
		mkbyte TXLINEH,5
			mktxtaddr 15, 2
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 0, 3
			db CHFULL
		mkbyte TXLINEH,4
			mktxtaddr 15, 3
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 0, 4
			db CHTOP
		mkbyte TXLINEH,3
			mktxtaddr 15, 4
			db CHTOP

		db SCREND

; --- end of scrbk60

scrbk61:
		spmaplen smap61b,smap61e
smap61b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK5ADDR		; 2, solid blue 
		bkindex BK29ADDR    ; 3, solid red
		bkindex BK27ADDR    ; 4, red left top edge
		bkindex BK28ADDR    ; 5, red left bottom edge
		bkindex BK38ADDR	; 6, top black half
		bkindex BK39ADDR	; 7, bottom black half
		bkindex BK30ADDR	; 8, solid green
        bkindex BK66ADDR    ; 9, green-yellow L top 
        bkindex BK68ADDR    ; 10, green-yellow L bottom
smap61e:
		mkbyte 1,1			; 1
		mkbyte 4,3
		mkline 13
		mkbyte 3,3

		mkbyte 1,1			; 2
		mkbyte 5,3
		mkline 13
		mkbyte 3,3

		mkline 4			; 3
		mkbyte 1,1
		mkbyte 1,6
		mkline 10
		mkbyte 6,6

		mkline 4			; 4
		mkbyte 1,1
		mkbyte 1,9
		mkline 10
		mkbyte 8,8
		
		mkline 5			; 5
		mkbyte 1,1
        mkbyte 10,8
		mkline 9
		mkbyte 8,8

		mkline 5			; 6
		mkbyte 1,1
        mkbyte 9,8
		mkline 9
		mkbyte 8,8
		
		mkline 5			; 7
		mkbyte 1,1
		mkbyte 1,10
		mkline 9
		mkbyte 8,8

		mkline 5			; 8
		mkbyte 1,1
		mkbyte 1,9
		mkline 9
		mkbyte 7,7
		
		mkdup 7
			mkline 6
			mkbyte 1,1
			mkline 9
			mkbyte 2,2
		;edup
		
		mkdup 2
			mkline 14
			db 0
			db 0
		;edup

		db SCREND
        db STOMAP
        dw s61stom
        db OBJMAP
        dw s61objm
        db MSKOMAP
        dw s61mom
        db TRIGMAP
        dw s61trm
        db TXTSMAP
        dw scr61txd
		db SCREND
		
scr61txd:
		mkbyte TXLINEH,15
			mktxtaddr 9, 1
			db CHBOTM
		mkbyte TXLINEH,6
			mktxtaddr 24, 1
			db CHBOTM

		mkbyte TXLINEH,15
			mktxtaddr 10, 2
			db CHFULL
		mkbyte TXLINEH,5
			mktxtaddr 25, 2
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 11, 3
			db CHFULL
		mkbyte TXLINEH,4
			mktxtaddr 26, 3
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 12, 4
			db CHTOP
		mkbyte TXLINEH,3
			mktxtaddr 27, 4
			db CHTOP

		db SCREND

		
; --- end of scrbk61

scrbk62:
		spmaplen smap62b,smap62e
smap62b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right				
		bkindex BK4ADDR		; 4, blue bricks
		bkindex BK8ADDR		; 5, blue ladder left bottom
		bkindex BK9ADDR		; 6, blue ladder right bottom
		bkindex BK11ADDR	; 7, blue ladder top left
		bkindex BK12ADDR	; 8, blue ladder top right
smap62e:
		mkdup 11
			db 0
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 9
			mkbyte 1,1			
		;edup
		
		db 0				; 12
		db 0
		mkbyte 7,8
		mkline 7
		db 0
		mkline 5
		mkbyte 1,1
		
		db 0				; 13
		db 0
		mkbyte 5,6
		mkline 7
		db 0
		mkbyte 0,1
		mkline 4
		mkbyte 1,1

		db 0				; 14
		db 0
		mkbyte 5,6
		mkline 8
		db 0
		mkline 4
		mkbyte 1,1

		db 0				; 15
		mkbyte 0,4
		mkbyte 5,6
		mkbyte 4,0
		mkline 7
		db 0
		mkbyte 0,1
		mkline 3
		mkbyte 1,1
		
		mkdup 2
			db 0				; 16,17
			mkbyte 4,4
			mkbyte 5,6
			mkbyte 4,4
			mkline 11
			db 0
		;edup
		
		db SCREND
        db OBJMAP        
        dw s62objm
        db SCREND

		
; --- end of scrbk62


scrbk63:
		spmaplen smap63b,smap63e
smap63b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK8ADDR		; 2, blue ladder left bottom
		bkindex BK9ADDR		; 3, blue ladder right bottom
        bkindex BK51ADDR    ; 4, white block
smap63e:
		mkdup 2
			db 0
			mkbyte 1,1
			mkbyte 2,3
			mkbyte 1,1
			mkline 11
			db 0
		;edup
		
		db 0				; 3
		mkbyte 1,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1
		mkline 7
		db 0

		db 0				; 4
		mkbyte 1,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1
		mkbyte 1,0
		mkline 6
		db 0

		db 0				; 5
		mkbyte 1,1
		mkbyte 2,3
		mkline 6
		mkbyte 1,1
		mkline 6
		db 0

		db 0				; 6
		mkbyte 1,1
		mkbyte 2,3
		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		mkline 5
		db 0

		db 0				; 7
		mkbyte 1,1
		mkbyte 2,3
		mkline 7
		mkbyte 1,1
		mkline 5
		db 0

		db 0				; 8
		mkbyte 1,1
		mkbyte 2,3
		mkline 12
		mkbyte 1,1

		mkline 5			; 9
		db 0
		mkline 10
		mkbyte 1,1

		mkline 5			; 10
		db 0
		mkbyte 0,1
		mkline 9
		mkbyte 1,1

		mkline 6			; 11
		db 0
		mkline 9
		mkbyte 1,1

		mkline 6			; 12
		db 0
		mkbyte 0,1
		mkline 8
		mkbyte 1,1

		mkline 7			; 13
		db 0
		mkline 8
		mkbyte 1,1

		mkline 7			; 14
		db 0
		mkbyte 0,4
		mkline 7
		mkbyte 4,4

		mkline 8			; 15
		db 0
		mkline 7
		mkbyte 4,4
		
		mkdup 2
			mkline 14
			db 0
			db 0
		;edup

		db SCREND
        db TXTSMAP
        dw scr63txd
		db SCREND
		
scr63txd:
		mkbyte TXLINEH,15
			mktxtaddr 15, 7
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 29, 7
			db CHFULL

		db SCREND

; --- end of scrbk63


scrbk64:
		spmaplen smap64b,smap64e
smap64b:
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
smap64e:
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
        dw s64trm
        db MSKOMAP
        dw s64mom		
        db STOMAP
        dw s64stom
        db TXTSMAP
        dw scr64txd
        db FSTRDRP
        dw pfrrail
        db SCREND
		
scr64txd:
		mkbyte TXLINEH,15
			mktxtaddr 7, 6
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 22, 6
			db CHFULL

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

; --- end of scrbk64

scrbk65:
		spmaplen smap65b,smap65e
smap65b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK4ADDR		; 1, blue bricks
		bkindex BK8ADDR		; 2, blue ladder left bottom
		bkindex BK9ADDR		; 3, blue ladder right bottom
        bkindex BK51ADDR    ; 4, white block
smap65e:
		mkline 12
		db 0
		mkbyte 0,2
		mkbyte 3,0
		db 0
		
		mkline 4			; 2
		db 0
		mkbyte 0,1
		mkline 7
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0

		mkline 4			; 3
		db 0
		mkline 8
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0
		
		mkline 3			; 4
		db 0
		mkbyte 0,1
		mkline 8
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0

		mkline 3			; 5
		db 0
		mkline 9
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0

		mkline 2			; 6
		db 0
		mkbyte 0,1
		mkline 9
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0
		
		mkline 2			; 7
		db 0
		mkline 10
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		db 0
		
		mkline 12			; 8
		mkbyte 1,1
		mkline 3
		db 0

		mkline 11			; 9
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0

		mkline 11			; 10
		mkbyte 1,1
		mkline 4
		db 0
		
		mkline 10			; 11
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0

		mkline 10			; 12
		mkbyte 1,1
		mkline 5
		db 0

		mkline 9			; 13
		mkbyte 1,1
		mkbyte 1,0
		mkline 5
		db 0

		mkline 9			; 14
		mkbyte 4,4
		mkline 6
		db 0

		mkline 8			; 15
		mkbyte 4,4
		mkbyte 4,0
		mkline 6
		db 0
		
		mkdup 2
			mkline 14
			db 0
			db 0
		;edup
		
		db SCREND
        db TRIGMAP
        dw s65trm
        db TXTSMAP        
        dw scr65txd
		db SCREND
		
scr65txd:
		mkbyte TXLINEH,15
			mktxtaddr 0, 7
			db CHFULL
		mkbyte TXLINEH,3
			mktxtaddr 15, 7
			db CHFULL

		db SCREND
		
; --- end of scrbk65



scrbk66:
		spmaplen smap66b,smap66e
smap66b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR     ; 1, green squares
		bkindex BK31ADDR    ; 2, black and white dots
smap66e:

		db 0
		db 0
		mkline 13
		db 0

		mkdup 15
			mkbyte 1,1
			mkline 13
			mkbyte 1,1
			mkbyte 2,1
		;edup
		
		db 0
		db 0
		mkline 13
		db 0
		
		db SCREND
        db OBJMAP
        dw s66objm
        db TRIGMAP
        dw s66trm
        db STOMAP
        dw s66stom
        db TXTSMAP
        dw scr66txd
        db SCREND
		
scr66txd:
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

		mkbyte TXLINEH,11
			mktxtaddr 0, 4
			db CHFULL
		mkbyte TXLINEH,15
			mktxtaddr 15, 4
			db CHFULL

		mkbyte TXLINEH,8
			mktxtaddr 0, 5
			db CHFULL
		mkbyte TXLINEH,3
			mktxtaddr 8, 5
			db CHTOP
		mkbyte TXLINEH,2
			mktxtaddr 12, 5
			db CHBOTM
		mkbyte TXLINEH,2
			mktxtaddr 15, 5
			db CHTOP
		mkbyte TXLINEH,13
			mktxtaddr 17, 5
			db CHFULL

		mkbyte TXLINEH,8
			mktxtaddr 0, 6
			db CHFULL
		mkbyte TXLINEH,2
			mktxtaddr 12, 6
			db CHFULL
		mkbyte TXLINEH,13
			mktxtaddr 17, 6
			db CHFULL

		mkbyte TXLINEH,2
			mktxtaddr 0, 7
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 5, 7
			db CHFULL
		mkbyte TXLINEH,2
			mktxtaddr 9, 7
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 15, 7
			db CHFULL
		mkbyte TXLINEH,4
			mktxtaddr 19, 7
			db CHFULL
		mkbyte TXLINEH,4
			mktxtaddr 26, 7
			db CHFULL

		mkbyte TXLINEH,2
			mktxtaddr 0, 8
			db CHTOP
		mkbyte TXLINEH,1
			mktxtaddr 5, 8
			db CHTOP
		mkbyte TXLINEH,2
			mktxtaddr 9, 8
			db CHTOP
		mkbyte TXLINEH,1
			mktxtaddr 15, 8
			db CHTOP
		mkbyte TXLINEH,4
			mktxtaddr 19, 8
			db CHTOP
		mkbyte TXLINEH,4
			mktxtaddr 26, 8
			db CHTOP

        db SCREND        

; --- end of scrbk66

scrbk67:
		spmaplen smap67b,smap67e
smap67b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR     ; 1, green squares
		bkindex BK13ADDR    ; 2, green ladder bottom left
		bkindex BK14ADDR    ; 3, green ladder bottom right
smap67e:
		db 0
		db 0
		mkline 13
		db 0
		
		mkdup 15
			mkbyte 1,1
			mkbyte 1,1
			mkline 13
			mkbyte 1,1
		;edup
		
		db 0
		mkbyte 2,3
		mkline 8
		db 0
		mkbyte 2,3
		mkline 4
		db 0
		
		db SCREND
        db OBJMAP
        dw s67objm
        db STOMAP
        dw s67stom
        db MSKOMAP
        dw s67mom
        db TXTSMAP
        dw scr67txd
        db SCREND
		
scr67txd:
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

		mkbyte TXLINEH,8
			mktxtaddr 0, 5
			db CHFULL
		mkbyte TXLINEH,3
			mktxtaddr 8, 5
			db CHTOP
		mkbyte TXLINEH,1
			mktxtaddr 11, 5
			db CHFULL
		mkbyte TXLINEH,4
			mktxtaddr 12, 5
			db CHTOP
		mkbyte TXLINEH,14
			mktxtaddr 16, 5
			db CHFULL

		mkbyte TXLINEH,8
			mktxtaddr 0, 6
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 11, 6
			db CHFULL
		mkbyte TXLINEH,14
			mktxtaddr 16, 6
			db CHFULL

		mkbyte TXLINEH,5
			mktxtaddr 0, 7
			db CHFULL
		mkbyte TXLINEH,2
			mktxtaddr 13, 7
			db CHFULL
		mkbyte TXLINEH,12
			mktxtaddr 18, 7
			db CHFULL

		mkbyte TXLINEH,5
			mktxtaddr 0, 8
			db CHTOP
		mkbyte TXLINEH,2
			mktxtaddr 13, 8
			db CHTOP
		mkbyte TXLINEH,12
			mktxtaddr 18, 8
			db CHTOP
		mkbyte TXLINEH,2
			mktxtaddr 2, 8
			db CHFULL
		mkbyte TXLINEH,2
			mktxtaddr 20, 8
			db CHFULL

        db SCREND
		        
; --- end of scrbk67

scrbk68:
		spmaplen smap68b,smap68e
smap68b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR     ; 1, green squares
		bkindex BK13ADDR    ; 2, green ladder bottom left
		bkindex BK14ADDR    ; 3, green ladder bottom right
		bkindex BK31ADDR    ; 4, black and white dots
smap68e:
		mkline 4
		db 0
		mkbyte 0,2
		mkbyte 3,0
		mkbyte 2,3
		mkbyte 0,2
		mkbyte 3,0
		mkline 6
		db 0
		
		mkdup 3
			db 0
			mkbyte 0,1
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkbyte 2,3
			mkbyte 1,2
			mkbyte 3,1
			mkline 6
			mkbyte 1,1
		;edup

		mkdup 12
			mkbyte 1,4
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkbyte 2,3
			mkbyte 1,2
			mkbyte 3,1
			mkline 6
			mkbyte 1,1
		;edup

		db 0
		db 0
		mkbyte 0,2
		mkbyte 3,0
		mkline 11
		db 0
		
		db SCREND
        db OBJMAP
        dw s68objm
        db MSKOMAP
        dw s68mom
        db TXTSMAP
        dw scr68txd
        db SCREND
		
s68mom:	
		db 11
   		mkmasko bigplate,2,15
		mkmasko smlplate,2,14
        mkmasko smlplate,2,13

   		mkmasko bigplate,19,15
		mkmasko smlplate,19,14
        mkmasko smlplate,19,13

   		mkmasko bigplate,22,15
		mkmasko smlplate,22,14

   		mkmasko bigplate,24,15
		mkmasko smlplate,24,14
        mkmasko smlplate,24,13

scr68txd:
		mkbyte TXLINEH,2
			mktxtaddr 9, 0
			db CHBOTM
		mkbyte TXLINEH,2
			mktxtaddr 12, 0
			db CHBOTM
		mkbyte TXLINEH,2
			mktxtaddr 15, 0
			db CHBOTM

		mkbyte TXLINEH,15
			mktxtaddr 3, 1
			db CHFULL
		mkbyte TXLINEH,12
			mktxtaddr 18, 1
			db CHFULL

		mkbyte TXLINEH,3
			mktxtaddr 0, 2
			db CHBOTM
		mkbyte TXLINEH,15
			mktxtaddr 3, 2
			db CHFULL
		mkbyte TXLINEH,12
			mktxtaddr 18, 2
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

		mkbyte TXLINEH,2
			mktxtaddr 5, 8
			db CHFULL

        db SCREND
		
; --- end of scrbk68