
scrbk30:
		spmaplen smap30b,smap30e
smap30b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
		bkindex BK4ADDR		; 4, blue bricks		
smap30e:
							; 1
		mkline 14
		db 0
		db 0
							; 2
		db 0
		mkline 10
		mkbyte 4,4
		mkbyte 4,0
		mkline 3
		db 0
							; 3
		db 0
		mkline 11
		mkbyte 4,4
		mkline 3
		db 0
							; 4
		db 0
		mkline 11
		mkbyte 4,4
		mkbyte 4,0
		db 0
		db 0
							; 5
		db 0
		mkline 12
		mkbyte 4,4
		db 0
		db 0
							; 6
		db 0
		mkline 12
		mkbyte 4,4
		mkbyte 4,0
		db 0
				
		db 0				; 7
		mkline 13
		mkbyte 4,4
		db 0

		db 0				; 
		mkline 13
		mkbyte 4,4
		db 0

		db 0				; 
		mkline 13
		mkbyte 4,4
		db 0

		db 0				; 
		mkline 13
		mkbyte 4,4
		db 0

		db 0				; 
		mkline 13
		mkbyte 4,4
		db 0

		db 0				; 
		mkline 13
		mkbyte 4,4
		db 0

		db 0				; 13
		mkline 13
		mkbyte 4,4
		db 0
		
		mkline 10
		db 0
		mkbyte 2,3
		mkline 4
		db 0
		
		mkline 10
		db 0
		mkbyte 2,3
		mkline 4
		db 0

		mkdup 2
			mkline 4
			db 0
			mkline 6
			mkbyte 1,1
			mkbyte 2,3
			mkline 3
			mkbyte 1,1
			db 0		
		;edup
		
		db SCREND
        db TRIGMAP
        dw s30trm
        db STOMAP
        dw s30stom
        db MSKOMAP
        dw s30mom
        db SCREND
		
; --- end of scrbk30


scrbk31:
		spmaplen smap31b,smap31e
smap31b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
		bkindex BK26ADDR    ; 4, cyan vertical tube
		bkindex BK23ADDR	; 5, red beam
smap31e:
		mkdup 4
			mkline 14
			db 0
			db 0
		;edup
		
		mkdup 7
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 4,1
			mkline 5
			mkbyte 1,1
			mkbyte 4,1
			mkbyte 2,3
			mkbyte 1,1
			mkbyte 1,1
			mkline 3
			db 0
		;edup
		
		mkline 6
		mkbyte 5,5
		db 0
		mkbyte 0,5
		mkbyte 5,5
		mkbyte 2,3
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 5,0
		db 0
		db 0
							; 13
		mkline 5
		mkbyte 1,1
		mkline 3
		db 0
		mkbyte 4,1
		mkbyte 2,3
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		db 0
							; 14
		mkline 4
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0
		mkbyte 4,1
		mkbyte 2,3
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		db 0
							; 15
		mkline 4
		mkbyte 1,1
		mkline 4
		db 0
		mkbyte 4,1
		mkbyte 2,3
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		db 0
		
							; 16
		mkline 3
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0
		mkbyte 4,1
		mkbyte 2,3
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		db 0		
							; 17
		mkline 3
		mkbyte 1,1
		mkline 5
		db 0
		mkbyte 4,1
		mkbyte 2,3
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		db 0
		
		db SCREND
        db TXTSMAP
        dw scr31txd
        db SCREND
		
scr31txd:
		mkbyte TXLINEV,1
			mktxtaddr 4, 2
			db CHBOTM
		
		mkbyte TXLINEV,3
			mktxtaddr 4, 3
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 16, 2
			db CHBOTM

		mkbyte TXLINEV,3
			mktxtaddr 16, 3
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 16, 6
			db CHBOTM

		mkbyte TXLINEV,2
			mktxtaddr 16, 7
			db CHFULL

		mscrend
		
; --- end of scrbk31

scrbk32:
		spmaplen smap32b,smap32e
smap32b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube
		bkindex BK23ADDR	; 3, red beam
smap32e:
		mkdup 4
			mkline 14
			db 0
			db 0
		;edup
		
		mkdup 7
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			mkline 7
			mkbyte 1,1
			mkbyte 1,2
			mkline 4
			mkbyte 1,1
		;edup

		mkline 14
		mkbyte 3,3
		mkbyte 3,3
		
		mkdup 5
			mkline 14
			mkbyte 1,1
			mkbyte 1,1
		;edup
		
        db SCREND
        db OBJMAP
        dw s32objm
        db TXTSMAP
        dw scr32txd
        db SCREND
		
scr32txd:
		mkbyte TXLINEV,1
			mktxtaddr 5, 2
			db CHBOTM
		
		mkbyte TXLINEV,3
			mktxtaddr 5, 3
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 21, 2
			db CHBOTM
		
		mkbyte TXLINEV,3
			mktxtaddr 21, 3
			db CHFULL

		mscrend

; --- end of scrbk32

scrbk34:
		spmaplen smap34b,smap34e
smap34b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
		bkindex BK26ADDR    ; 4, cyan vertical tube
		bkindex BK23ADDR	; 5, red beam
smap34e:
		mkdup 4
			mkline 14
			db 0
			db 0
		;edup

		mkdup 7
			db 0
			db 0
			mkbyte 0,1
			mkbyte 2,3
			mkline 3
			mkbyte 1,1
			mkbyte 4,1
			mkline 4
			mkbyte 1,1
			mkbyte 1,4
			mkbyte 1,1
			mkbyte 1,1
		;edup
		
		mkline 3
		db 0
		mkbyte 2,3
		mkline 8
		db 0
		mkline 3
		mkbyte 5,5
		
		mkdup 5
			db 0
			db 0
			mkbyte 0,1
			mkbyte 2,3
			mkbyte 1,0
			mkline 10
			db 0
		;edup 
		
        db SCREND
        db TXTSMAP
        dw scr34txd
        db SCREND

		
scr34txd:
		mkbyte TXLINEV,1
			mktxtaddr 14, 2
			db CHBOTM
		
		mkbyte TXLINEV,3
			mktxtaddr 14, 3
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 25, 2
			db CHBOTM
		
		mkbyte TXLINEV,3
			mktxtaddr 25, 3
			db CHFULL

		mscrend

; --- end of scrbk34

scrbk35:
		spmaplen smap35b,smap35e
smap35b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
		bkindex BK26ADDR    ; 4, cyan vertical tube
smap35e:
		mkdup 2
			db 0
			db 0
			mkbyte 0,1
			mkbyte 2,3
			mkbyte 1,0
			mkline 9
			db 0
			mkbyte 0,1
		;edup
		
		mkdup 13
			db 0
			db 0
			mkbyte 0,1
			mkbyte 2,3
			mkline 3
			mkbyte 1,1
			mkbyte 4,1
			mkline 4
			mkbyte 1,1
			mkbyte 1,4
			mkbyte 1,1
			mkbyte 1,1
		;edup
		
		mkdup 2
			mkline 11
			db 0
			mkbyte 2,3
			mkline 3
			db 0
		;edup
		
        db SCREND
        db OBJMAP
        dw s35objm
        db TXTSMAP
        dw scr35txd
        db SCREND

		
scr35txd:
		mkbyte TXLINEV,1
			mktxtaddr 14, 1
			db CHBOTM
		
		mkbyte TXLINEV,6
			mktxtaddr 14, 2
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 25, 1
			db CHBOTM
		
		mkbyte TXLINEV,6
			mktxtaddr 25, 2
			db CHFULL

		mscrend

; --- end of scrbk35

scrbk36:
		spmaplen smap36b,smap36e
smap36b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK27ADDR    ; 2, red left top edge
		bkindex BK28ADDR    ; 3, red left bottom edge
		bkindex BK33ADDR   	; 4, solid blue 
		bkindex BK29ADDR    ; 5, solid red
		bkindex BK30ADDR    ; 6, solid green
		bkindex BK34ADDR	; 7, blue left edge
		bkindex BK46ADDR	; 8, top black half on blue
		bkindex BK47ADDR	; 9, bottom black half on blue
smap36e:
							; 1
		mkline 11
		mkbyte 1,1
		mkbyte 1,7
		mkline 3
		mkbyte 4,4		
							; 2		
		mkline 11
		mkbyte 1,1
		mkbyte 7,4
		mkline 3
		mkbyte 4,4
							; 3		
		mkline 3
		mkbyte 1,1
		mkbyte 1,7
		mkline 11
		mkbyte 4,4
							; 4		
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 12
		mkbyte 5,5
							; 5
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,3
		mkline 12
		mkbyte 5,5
							; 6
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,7
		mkline 12
		mkbyte 4,4		
							; 7
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 7,4
		mkline 12
		mkbyte 4,4		
							; 8
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,4		
		mkline 12
		mkbyte 8,8
							; 9
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,4
		mkline 12
		mkbyte 6,6
							; 10
		mkdup 2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 4,4
			mkline 12
    		mkbyte 6,6
		;edup
							; 11
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,4
		mkline 12
		mkbyte 6,6
		;edup		

		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,4		
		mkline 12
		mkbyte 9,9

		mkdup 2
			mkbyte 1,1
			mkbyte 1,1
			mkline 13
			mkbyte 4,4
		;edup
		
		db 0
		mkbyte 2,5
		mkline 13
		mkbyte 5,5

		db 0
		mkbyte 3,5
		mkline 13
		mkbyte 5,5
		
        db SCREND
        db OBJMAP
        dw s36objm
        db MSKOMAP
        dw s36mom
        db TXTSMAP
        dw scr36txd
        db SCREND
		
scr36txd:
		mkbyte TXLINEH,15
			mktxtaddr 6, 4
			db CHBOTM
		mkbyte TXLINEH,9
			mktxtaddr 21, 4
			db CHBOTM

		mkbyte TXLINEH,15
			mktxtaddr 6, 5
			db CHFULL
		mkbyte TXLINEH,9
			mktxtaddr 21, 5
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 6, 6
			db CHTOP
		mkbyte TXLINEH,9
			mktxtaddr 21, 6
			db CHTOP

		mscrend

; --- end of scrbk36


scrbk37:
		spmaplen smap37b,smap37e
smap37b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK46ADDR	; 2, top black half on blue
		bkindex BK47ADDR	; 3, bottom black half on blue
		bkindex BK33ADDR   	; 4, solid blue 
		bkindex BK29ADDR    ; 5, solid red
		bkindex BK30ADDR    ; 6, solid green
		bkindex BK35ADDR	; 7, blue right edge
		bkindex BK36ADDR    ; 8, red right top edge
		bkindex BK37ADDR    ; 9, red right bottom edge
smap37e:
							; 1
		mkbyte 4,4
		mkbyte 4,4
		mkbyte 4,7
		mkline 12
		mkbyte 1,1		
							; 2		
		mkline 3
		mkbyte 4,4
		mkbyte 7,1
		mkline 11
		mkbyte 1,1
							; 3		
		mkline 11
		mkbyte 4,4
		mkbyte 7,1
		mkline 3
		mkbyte 1,1		
							; 4
		mkline 12
		mkbyte 5,5
		mkbyte 8,1
		mkbyte 1,1
		mkbyte 1,1
							; 5		
		mkline 12
		mkbyte 5,5
		mkbyte 9,1
		mkbyte 1,1
		mkbyte 1,1		
							; 6		
		mkline 12
		mkbyte 4,4
		mkbyte 7,1
		mkbyte 1,1
		mkbyte 1,1		
							; 7		
		mkline 12
		mkbyte 4,4
		mkbyte 4,7
		mkbyte 1,1
		mkbyte 1,1		
							; 8
		mkline 12
		mkbyte 2,2
		mkbyte 4,4		
		mkbyte 1,1
		mkbyte 1,1
							; 9
		mkline 12
		mkbyte 6,6
		mkbyte 4,4
		mkbyte 1,1
		mkbyte 1,1
							; 10
		mkdup 2			
			mkline 12
			mkbyte 6,6
			mkbyte 4,4
			mkbyte 1,1
			mkbyte 1,1
		;edup
							; 11		
		mkline 12
		mkbyte 6,6
		mkbyte 4,4
		mkbyte 1,1
		mkbyte 1,1

		mkline 12
		mkbyte 3,3
		mkbyte 4,4		
		mkbyte 1,1
		mkbyte 1,1
		
		mkdup 2
			mkline 13
			mkbyte 4,4		
			mkbyte 1,1
			mkbyte 1,1
		;edup
				
		mkline 13
		mkbyte 5,5
		mkbyte 5,8
		db 0
		
		mkline 13
		mkbyte 5,5
		mkbyte 5,9
		db 0
		
        db SCREND
        db MSKOMAP
        dw s37mom
        db TXTSMAP
        dw scr37txd
        db FSTRDRP
        dw s37rndr
        db SCREND

scr37txd:
		mkbyte TXLINEH,15
			mktxtaddr 0, 4
			db CHBOTM
		mkbyte TXLINEH,9
			mktxtaddr 15, 4
			db CHBOTM

		mkbyte TXLINEH,15
			mktxtaddr 0, 5
			db CHFULL
		mkbyte TXLINEH,9
			mktxtaddr 15, 5
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 0, 6
			db CHTOP
		mkbyte TXLINEH,9
			mktxtaddr 15, 6
			db CHTOP

		mscrend
		
; --- end of scrbk37



scrbk38:
		spmaplen smap38b,smap38e
smap38b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR	; 2, yellow ladder left
		bkindex BK25ADDR	; 3, yellow ladder right
		bkindex BK26ADDR    ; 4, cyan vertical tube
		bkindex BK23ADDR	; 5, red beam
smap38e:
						; 1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0
		mkbyte 0,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 3
		mkbyte 1,1
		db 0
		db 0

						; 2
		mkbyte 1,1
		mkbyte 1,1
		mkline 5
		db 0
		mkbyte 0,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 3
		mkbyte 1,1
		mkbyte 1,0
		mkline 5
		db 0
		mkbyte 0,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1
		
						; 4
		mkbyte 1,1
		mkline 6
		db 0
		mkbyte 0,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 5
		mkbyte 1,0
		mkline 6
		db 0
		mkbyte 0,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 6
		mkline 5		
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 7
		mkline 5
		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 8
		mkline 4
		db 0
		mkbyte 0,1
		mkline 3
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 9
		mkline 4
		db 0
		mkline 4
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 10
		mkline 3
		db 0
		mkbyte 0,1
		mkline 4
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 11
		mkline 3
		db 0
		mkline 5
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 12
		mkline 2
		db 0
		mkbyte 0,1
		mkline 5
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1

						; 13
		mkline 2
		db 0
		mkline 6
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1
		
		mkbyte 0,5		; 14
		mkline 9
		mkbyte 5,5
		mkbyte 5,2
		mkbyte 3,5
		mkbyte 5,5
		mkbyte 5,0
		db 0
		
		mkdup 3
			db 0			; 15
			mkline 7
			mkbyte 1,1
			mkbyte 4,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1	
			mkbyte 1,1
			db 0
			db 0
		;edup
		
        db SCREND
        db OBJMAP
        dw s38objm
        db TXTSMAP
        dw scr38txd
        db SCREND
		
scr38txd:
		mkbyte TXLINEV,1
			mktxtaddr 16, 0
			db CHBOTM
		
		mkbyte TXLINEV,6
			mktxtaddr 16, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 16, 7
			db CHBOTM

		mkbyte TXLINEV,1
			mktxtaddr 16, 8
			db CHFULL

		mscrend

; --- end of scrbk38


scrbk39:
		spmaplen smap39b,smap39e
smap39b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK7ADDR     ; 2, big yellow brick		
		bkindex BK6ADDR		; 3, 2 yellow bricks 
		bkindex BK24ADDR	; 4, yellow ladder left
		bkindex BK25ADDR	; 5, yellow ladder right
smap39e:
		mkline 3
		db 0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		mkbyte 4,5
		mkline 3
		mkbyte 1,1
		db 0

		mkbyte 1,1
		mkbyte 1,3
		mkline 8
		mkbyte 1,1
		mkbyte 4,5
		mkline 3
		mkbyte 1,1
		db 0

		mkdup 11
			mkbyte 1,1
			mkbyte 1,2
			mkline 8
			mkbyte 1,1
			mkbyte 4,5
			mkline 3
			mkbyte 1,1
			db 0
		;edup
		
		mkdup 4
			mkline 14
			db 0
			db 0
		;edup
		
        db SCREND
        db OBJMAP
        dw s39objm
        db SCREND
		
; --- end of scrbk39

