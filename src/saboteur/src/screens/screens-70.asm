
scrbk70:
		spmaplen smap70b,smap70e
smap70b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK6ADDR     ; 2, 2 yellow bricks 
		bkindex BK7ADDR     ; 3, big yellow brick
		bkindex BK3ADDR     ; 4, green squares
		bkindex BK13ADDR    ; 5, green ladder bottom left
		bkindex BK14ADDR    ; 6, green ladder bottom right
		bkindex BK24ADDR    ; 7, yellow ladder left		
		bkindex BK25ADDR    ; 8, yellow ladder right
smap70e:
		mkline 6
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 7,8
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0
		
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 7,8
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		db 0
		
		mkdup 5
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 3,1
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,3
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 7,8
			mkline 3
			mkbyte 1,1
			mkbyte 3,1
			mkbyte 1,1
			db 0			
		; edup
		
		db 0
		db 0
		mkline 13
		db 0
		
		mkdup 8
			mkbyte 4,4
			mkline 13
			mkbyte 4,4
			db 0
		; edup

		mkline 7
		db 0
		mkbyte 5,6
		mkline 7
		db 0
		
		db SCREND
        db OBJMAP        
        dw s70objm
        db MSKOMAP
        dw s70mom
        db TXTSMAP
        dw scr70txd
        db TRIGMAP
        dw s70trm
        db SCREND
		
scr70txd:
		mkbyte TXLINEH,15
			mktxtaddr 0, 4
			db CHBOTM
		mkbyte TXLINEH,13
			mktxtaddr 15, 4
			db CHBOTM

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
		mkbyte TXLINEH,13
			mktxtaddr 15, 7
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 0, 8
			db CHTOP
		mkbyte TXLINEH,13
			mktxtaddr 15, 8
			db CHTOP

		mkbyte TXLINEH,2
			mktxtaddr 14, 8
			db CHFULL

        db SCREND

; --- end of scrbk70

scrbk71:
		spmaplen smap71b,smap71e
smap71b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK6ADDR     ; 2, 2 yellow bricks 
		bkindex BK7ADDR     ; 3, big yellow brick
		bkindex BK3ADDR     ; 4, green squares
smap71e:
		mkline 6
		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 1,0
		mkline 5
		db 0

		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkline 5
		mkbyte 1,1
		mkbyte 2,1
		mkline 4
		mkbyte 1,1
		
		mkbyte 0,1
		mkline 3
		mkbyte 1,1
		mkbyte 3,1
		mkline 5
		mkbyte 1,1
		mkbyte 3,1
		mkline 4
		mkbyte 1,1

		mkdup 4
			mkline 4
			mkbyte 1,1
			mkbyte 3,1
			mkline 5
			mkbyte 1,1
			mkbyte 3,1
			mkline 4
			mkbyte 1,1
		;edup
		
		mkline 4
		mkbyte 1,1
		mkbyte 3,1
		mkline 4
		mkbyte 1,1
		mkbyte 1,0
		mkline 5
		db 0
		
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 7
		db 0
		mkline 5
		mkbyte 4,4
		
		mkline 3
		db 0
		mkline 12
		mkbyte 4,4
		
		mkdup 6
			db 0
			mkbyte 4,4
			mkline 13
			mkbyte 4,4
		;edup 
		
		db 0
		db 0
		mkline 13
		db 0
		
		db SCREND
        db OBJMAP        
        dw s71objm
        db TXTSMAP
        dw scr71txd
        db SCREND

scr71txd:
		mkbyte TXLINEH,10
			mktxtaddr 20, 4
			db CHBOTM

		mkbyte TXLINEH,4
			mktxtaddr 2, 5
			db CHBOTM
		mkbyte TXLINEH,15
			mktxtaddr 6, 5
			db CHFULL
		mkbyte TXLINEH,9
			mktxtaddr 21, 5
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 6
			db CHFULL
		mkbyte TXLINEH,13
			mktxtaddr 17, 6
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 7
			db CHFULL
		mkbyte TXLINEH,13
			mktxtaddr 17, 7
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 8
			db CHTOP
		mkbyte TXLINEH,13
			mktxtaddr 17, 8
			db CHTOP

        db SCREND
; --- end of scrbk71

scrbk72:
		spmaplen smap72b,smap72e
smap72b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK8ADDR     ; 2, blue ladder left bottom
		bkindex BK9ADDR     ; 3, blue ladder right bottom
		bkindex BK6ADDR     ; 4, 2 yellow bricks 
		bkindex BK7ADDR     ; 5, big yellow brick
		bkindex BK24ADDR    ; 6, yellow ladder left
		bkindex BK25ADDR    ; 7, yellow ladder right
		bkindex BK11ADDR    ; 8, blue ladder left top
		bkindex BK12ADDR    ; 9, blue ladder right top		
smap72e:
		mkdup 3
			mkline 4
			db 0
			mkbyte 2,3
			mkline 10
			db 0
		;edup
		
		db 0
		mkbyte 1,1
		mkbyte 4, 1
		mkbyte 1,1
		mkbyte 6,7
		mkline 7
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 1,1
		mkbyte 1,1

		mkdup 5
			db 0
			mkbyte 1,1
			mkbyte 5,1
			mkbyte 1,1
			mkbyte 6,7
			mkline 7
			mkbyte 1,1
			mkbyte 5,1
			mkbyte 1,1
			mkbyte 1,1
		; edup

		db 0
		mkbyte 1,1
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 6,7
		mkline 3
		mkbyte 1,1
		mkline 7
		db 0
		
		mkline 4
		db 0
		mkbyte 8,9
		mkline 10
		db 0

		mkdup 6
			mkline 4
			db 0
			mkbyte 2,3
			mkline 10
			db 0
		;edup
		
		mscrend

; --- end of scrbk72

scrbk73:
		spmaplen smap73b,smap73e
smap73b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK8ADDR     ; 2, blue ladder left bottom
		bkindex BK9ADDR     ; 3, blue ladder right bottom
		bkindex BK11ADDR    ; 4, blue ladder left top
		bkindex BK12ADDR    ; 5, blue ladder right top		
smap73e:
		mkdup 11
			db 0
			mkbyte 1,1
			mkline 13
			mkbyte 1,1
		;edup
		
		db 0
		db 0
		mkline 13
		mkbyte 1,1

		db 0
		db 0
		mkbyte 0,1
		mkline 12
		mkbyte 1,1
		
		mkline 3
		db 0
		mkline 12
		mkbyte 1,1
		
		mkline 4
		db 0
		mkbyte 4,5
		db 0
		db 0
		mkbyte 0,1
		mkline 7
		mkbyte 1,1

		mkline 4
		db 0
		mkbyte 2,3
		mkline 5
		db 0
		mkbyte 0,1
		mkline 4
		mkbyte 1,1

		mkline 4
		db 0
		mkbyte 2,3
		mkline 10
		db 0

		db SCREND
        db STOMAP
        dw s73stom
        db SCREND

; --- end of scrbk73

scrbk74:
		spmaplen smap74b,smap74e
smap74b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L		
smap74e:
		mkdup 15
			mkbyte 1,1
			mkbyte 1,1
			mkline 13
			mkbyte 1,1
		;edup
		
		mkline 3
		mkbyte 1,1
		mkline 3
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		db 0
		mkline 3
		mkbyte 1,1
		
		mkline 6
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 6
		db 0
		
		db SCREND
        db STOMAP
        dw s74stom
        db SCREND
		
; --- end of scrbk74

scrbk75:
		spmaplen smap75b,smap75e
smap75b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right
		bkindex BK11ADDR    ; 4, blue ladder left top
		bkindex BK12ADDR    ; 5, blue ladder right top		
		bkindex BK31ADDR    ; 6, black and white dots		
smap75e:
		mkdup 4		
			mkline 8
			mkbyte 1,1
			mkbyte 2,3
			mkline 4
			mkbyte 1,1
			mkbyte 1,0
			db 0
		;edup
		
		mkdup 12
			mkline 8
			mkbyte 1,1
			mkbyte 2,3
			mkline 4
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 6,1
		;edup
		
		mkline 8
		db 0
		mkbyte 4,5		
		mkline 6
		db 0

		db SCREND
        db STOMAP
        dw s75stom
        db TXTSMAP
        dw scr75txd
        db SCREND

scr75txd:						; description of the text RAM used by this screen
		mkbyte TXLINEV,1
			mktxtaddr 28, 2
			db CHBOTM
		
		mkbyte TXLINEV,5
			mktxtaddr 28, 3
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 28, 8
			db CHTOP

		db SCREND

; --- end of scrbk75


scrbk77:
		spmaplen smap77b,smap77e
smap77b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right
		bkindex BK13ADDR    ; 4, green ladder bottom left
		bkindex BK14ADDR    ; 5, green ladder bottom right
		bkindex BK31ADDR    ; 6, black and white dots		
smap77e:
		db 0
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 9
		mkbyte 1,1
		
		mkdup 3
			db 0
			mkbyte 0,1
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 9
			mkbyte 1,1
		;edup
		
		mkdup 12
			mkbyte 1,6
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 9
			mkbyte 1,1			
		;edup

		mkline 4
		db 0
		mkbyte 0,4
		mkbyte 5,0
		mkbyte 4,5
		mkbyte 0,4
		mkbyte 5,0
		mkline 6
		db 0
		
		db SCREND
        db OBJMAP
        dw s77objm
        db MSKOMAP
        dw s77mom		
        db STOMAP        
        dw s77stom
        db TXTSMAP
        dw scr77txd
        db SCREND
		
scr77txd:
		mkbyte TXLINEH,2
			mktxtaddr 9, 8
			db CHBOTM
		mkbyte TXLINEH,2
			mktxtaddr 12, 8
			db CHBOTM
		mkbyte TXLINEH,2
			mktxtaddr 15, 8
			db CHBOTM

		mkbyte TXLINEV,1
			mktxtaddr 1, 2
			db CHBOTM
		mkbyte TXLINEV,5
			mktxtaddr 1, 3
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 1, 8
			db CHTOP

		db SCREND		
		
; --- end of scrbk77


scrbk78:
		spmaplen smap78b,smap78e
smap78b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
smap78e:
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
		db 0
		mkline 13
		db 0
		
		db SCREND
        db OBJMAP
        dw s78objm
        db MSKOMAP
        dw s78mom
        db STOMAP        
        dw s78stom
        db SCREND
		
		
; --- end of scrbk78

scrbk79:
		spmaplen smap79b,smap79e
smap79b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
smap79e:
		mkbyte 1,1			
		mkline 13
		mkbyte 1,1
		db 0
		
		mkdup 15
			mkbyte 1,1			
			mkline 13
			mkbyte 1,1
			db 0
		;edup
		
		db 0
		db 0
		mkline 13
		db 0
		
		db SCREND
        db OBJMAP
        dw s79objm
        db MSKOMAP
        dw s79mom
        db STOMAP        
        dw s79stom
        db TRIGMAP
        dw s79trm
        db SCREND
		
; --- end of scrbk79
