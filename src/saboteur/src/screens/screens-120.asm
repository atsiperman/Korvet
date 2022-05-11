

scrbk120:
		spmaplen smap120b,smap120e
smap120b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK24ADDR    ; 4, yellow ladder left
		bkindex BK25ADDR    ; 5, yellow ladder right		
		bkindex BK32ADDR    ; 6, green vertical tube				
        bkindex BK48ADDR    ; 7, cyan horizontal tube
smap120e:
		
		mkdup 4
			mkline 5
			db 0
			mkbyte 4,5
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkline 5
			mkbyte 1,1
		;edup
		
		mkdup 3
			mkline 5
			mkbyte 1,1
			mkbyte 4,5
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkline 5
			mkbyte 1,1
		;edup
		
		mkline 5
		mkbyte 1,1
		mkbyte 4,5
		mkline 3
		mkbyte 1,1
		mkbyte 7,7
		mkbyte 7,7
		mkbyte 7,1
		mkline 3
		mkbyte 1,1

		mkdup 5
			mkline 5
			mkbyte 1,1
			mkbyte 4,5
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkline 5
			mkbyte 1,1
		;edup
		
		
		mkline 9
		mkbyte 3,3
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		mkbyte 3,3
		
		mkdup 3
			mkline 3
			mkbyte 1,1
			mkbyte 2,1
			mkline 3
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,2
			mkline 3
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
		;edup
		
		db SCREND
        db TXTSMAP
        dw s120txd
        db SCREND

s120txd:
		mkbyte TXLINEV,1
			mktxtaddr 6, 7
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 6, 8
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 14, 7
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 14, 8
			db CHFULL

		mkbyte TXLINEH,5
			mktxtaddr 18, 4
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 19, 0
			db CHBOTM
		mkbyte TXLINEV,8
			mktxtaddr 19, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 26, 7
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 26, 8
			db CHFULL

        db SCREND

; --- end of scrbk120


scrbk121:
		spmaplen smap121b,smap121e
smap121b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
        bkindex BK48ADDR    ; 4, cyan horizontal tube		
smap121e:
		mkbyte 1,1
		mkbyte 1,0
		mkline 13
		db 0

		mkbyte 1,1
		mkbyte 1,1
		mkline 13
		db 0
		
		mkline 4
		mkbyte 1,1
		mkbyte 1,2
		mkline 5
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0
		
		mkline 4			; line 4
		mkbyte 1,1
		mkbyte 1,2
		mkline 6
		mkbyte 1,1
		mkline 4
		db 0

		mkline 4			; line 5
		mkbyte 1,1
		mkbyte 1,2
		mkline 6
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0

		mkline 4			; line 6
		mkbyte 1,1
		mkbyte 1,2
		mkline 7
		mkbyte 1,1
		mkline 3
		db 0

		mkline 4			; line 7
		mkbyte 1,1
		mkbyte 1,2
		mkline 7
		mkbyte 1,1
		mkbyte 1,0
		mkline 2
		db 0

		mkline 4			; line 8
		mkbyte 1,1
		mkbyte 1,2
		mkline 8
		mkbyte 1,1
		mkline 2
		db 0

		mkline 4			; line 9
		mkbyte 1,1
		mkbyte 1,2
		mkline 8
		mkbyte 1,1
		mkbyte 1,0
		db 0

		mkdup 2
			mkline 4			; line 10,11
			mkbyte 1,1
			mkbyte 1,2
			mkline 9
			mkbyte 1,1
			db 0
		;edup

		mkline 3			; line 12
		mkbyte 1,1
		mkbyte 4,4
		mkbyte 4,4
		mkline 9
		mkbyte 1,1
		db 0

		mkline 4			; line 13
		mkbyte 1,1
		mkbyte 1,2
		mkline 9
		mkbyte 1,1
		db 0
		
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 9
		mkbyte 1,1
		db 0
		
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkline 9
		mkbyte 1,1
		db 0

		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 1,3
		mkline 3
		mkbyte 3,3
		mkline 6
		mkbyte 1,1
		db 0

		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 2,1
		mkline 7
		mkbyte 1,1
		db 0
		
		db SCREND
        db TXTSMAP
        dw s121txd
        db SCREND

s121txd:
		mkbyte TXLINEV,1
			mktxtaddr 1, 7
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 1, 8
			db CHFULL

		mkbyte TXLINEH,4
			mktxtaddr 6, 6
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 9, 1
			db CHBOTM
		mkbyte TXLINEV,6
			mktxtaddr 9, 2
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 9, 8
			db CHBOTM

		mkbyte TXLINEV,1
			mktxtaddr 12, 8
			db CHBOTM

        db SCREND

; --- end of scrbk121

scrbk122:
		spmaplen smap122b,smap122e
smap122b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR		; 1, green squares
		bkindex BK6ADDR     ; 2, 2 yellow bricks 
		bkindex BK7ADDR     ; 3, big yellow brick 
		bkindex BK8ADDR     ; 4, blue ladder left bottom
		bkindex BK9ADDR     ; 5, blue ladder right bottom
smap122e:

		mkdup 2
			db 0
			mkline 14
			db 0
		;edup
		
		db 0			
		mkline 8
		mkbyte 1,1
		mkline 6
		db 0

		db 0				; line 4
		mkline 8
		mkbyte 1,1
		mkbyte 1,0
		mkline 5
		db 0

		db 0				; line 5
		mkline 9
		mkbyte 1,1
		mkline 5
		db 0

		db 0				; line 6
		mkline 9
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0

		db 0				; line 7
		mkline 10
		mkbyte 1,1
		mkline 4
		db 0

		db 0				; line 8
		db 0
		mkline 9
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0

		mkbyte 1,1				; line 9
		mkbyte 2,1
		mkline 10
		mkbyte 1,1
		mkline 3
		db 0

		mkdup 6
			mkbyte 1,1				
			mkbyte 3,1
			mkline 10
			mkbyte 1,1		
			mkbyte 1,0		
			db 0
			db 0
		;edup
		
		mkdup 2
			mkline 5
			db 0
			mkbyte 4,5
			mkline 9
			db 0
		;edup
		
		mscrend
; --- end of scrbk122


scrbk123:
		spmaplen smap123b,smap123e
smap123b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK3ADDR		; 1, green squares
		bkindex BK6ADDR     ; 2, 2 yellow bricks 
		bkindex BK7ADDR     ; 3, big yellow brick 
		bkindex BK63ADDR    ; 4, copter plate
        bkindex BK64ADDR    ; 5, copter roof
smap123e:

		db 0
		mkbyte 0,1
		mkline 11
		mkbyte 1,1
		db 0
		db 0
		
		mkbyte 0,5
		mkline 13
		mkbyte 5,5
		db 0

		db 0
		mkbyte 0,1
		mkline 11
		mkbyte 1,1
		db 0
		db 0

		mkdup 5
			db 0
			mkline 12
			mkbyte 1,1
			mkbyte 1,0
			db 0
		;edup

		db 0
		mkline 12
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1

		mkdup 6
			db 0
			mkline 12
			mkbyte 1,1
			mkbyte 1,3
			mkbyte 1,1
		;edup
		
		db 0
		mkline 3
		mkbyte 1,1
		mkline 5
		mkbyte 4,4
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0
		
		db 0
		mkline 14
		db 0
		
		db SCREND
        db BMSOMAP
        dw s123bmom
        db MSKOMAP
        dw s123mom
        db FSTRDRP
        dw s123rnd
        db TXTSMAP
        dw s123txd
        db SCREND

s123txd:
		mkbyte TXLINEH,15
			mktxtaddr 3, 0
			db CHBOTM
		mkbyte TXLINEH,8
			mktxtaddr 18, 0
			db CHBOTM

		mkbyte TXLINEH,2
			mktxtaddr 1, 1
			db CHTOP
		mkbyte TXLINEH,2
			mktxtaddr 26, 1
			db CHTOP

		mkbyte TXLINEH,15
			mktxtaddr 3, 1
			db CHFULL
		mkbyte TXLINEH,8
			mktxtaddr 18, 1
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 2
			db CHFULL
		mkbyte TXLINEH,10
			mktxtaddr 17, 2
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 3
			db CHFULL
		mkbyte TXLINEH,10
			mktxtaddr 17, 3
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 4
			db CHFULL
		mkbyte TXLINEH,10
			mktxtaddr 17, 4
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 5
			db CHFULL
		mkbyte TXLINEH,10
			mktxtaddr 17, 5
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 6
			db CHFULL
		mkbyte TXLINEH,10
			mktxtaddr 17, 6
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 7
			db CHFULL
		mkbyte TXLINEH,10
			mktxtaddr 17, 7
			db CHFULL

		mkbyte TXLINEH,15
			mktxtaddr 2, 8
			db CHTOP
		mkbyte TXLINEH,6
			mktxtaddr 17, 8
			db CHTOP

		mkbyte TXLINEH,2
			mktxtaddr 28, 4
			db CHBOTM

		mkbyte TXLINEV,3
			mktxtaddr 28, 5
			db CHFULL

		mkbyte TXLINEV,3
			mktxtaddr 29, 5
			db CHFULL

        db SCREND

; --- end of scrbk123


scrbk124:
		spmaplen smap124b,smap124e
smap124b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right		
smap124e:
		mkdup 2
			db 0
			mkline 14
			db 0			
		;edup
		
		mkdup 13
			mkline 10
			mkbyte 1,1
			mkbyte 2,3
			mkline 3
			mkbyte 1,1
			db 0
		;edup

		mkline 10
		mkbyte 1,1
		mkbyte 2,3
		mkline 3
		mkbyte 1,1
		db 0

		mkline 4
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		db 0
		mkbyte 2,3
		mkline 4
		db 0
		
		db SCREND
        db STOMAP
        dw s124stom
        db TXTSMAP
        dw s124txd
        db SCREND

s124txd:
		mkbyte TXLINEH,1
			mktxtaddr 6, 7
			db CHTOP
		mkbyte TXLINEH,1
			mktxtaddr 26, 7
			db CHTOP

		mkbyte TXLINEH,4
			mktxtaddr 4, 8
			db CHTOP
		mkbyte TXLINEH,4
			mktxtaddr 24, 8
			db CHTOP

		mkbyte TXLINEH,1
			mktxtaddr 5, 7
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 25, 7
			db CHFULL

        db SCREND

; --- end of scrbk124


scrbk125:
		spmaplen smap125b,smap125e
smap125b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right		
smap125e:
		mkdup 2
			db 0
			mkline 14
			db 0			
		;edup
		
		mkdup 13
			mkbyte 1,1
			mkline 14
			mkbyte 1,1
		;edup

		mkbyte 1,1
		mkline 14
		mkbyte 1,1

		db 0
		mkline 14
		db 0			
		
		db SCREND
        db STOMAP
        dw s125stom
        db TXTSMAP
        dw s125txd
        db SCREND

s125txd:
		mkbyte TXLINEH,1
			mktxtaddr 3, 7
			db CHTOP
		mkbyte TXLINEH,1
			mktxtaddr 9, 7
			db CHTOP
		mkbyte TXLINEH,1
			mktxtaddr 15, 7
			db CHTOP
		mkbyte TXLINEH,1
			mktxtaddr 20, 7
			db CHTOP
		mkbyte TXLINEH,1
			mktxtaddr 27, 7
			db CHTOP

		mkbyte TXLINEH,1
			mktxtaddr 2, 7
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 8, 7
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 14, 7
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 19, 7
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 26, 7
			db CHFULL

		mkbyte TXLINEH,4
			mktxtaddr 1, 8
			db CHTOP
		mkbyte TXLINEH,4
			mktxtaddr 7, 8
			db CHTOP
		mkbyte TXLINEH,4
			mktxtaddr 13, 8
			db CHTOP
		mkbyte TXLINEH,4
			mktxtaddr 18, 8
			db CHTOP
		mkbyte TXLINEH,4
			mktxtaddr 25, 8
			db CHTOP

        db SCREND

; --- end of scrbk125


scrbk126:
		spmaplen smap126b,smap126e
smap126b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right		
		bkindex BK8ADDR     ; 4, blue ladder left bottom
		bkindex BK9ADDR     ; 5, blue ladder right bottom		
smap126e:
		mkdup 2
			db 0
			mkline 14
			db 0
		;edup
		
		mkline 6			; line 3
		db 0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 5			; line 4
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 5			; line 5
		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 4			; line 6
		db 0
		mkbyte 0,1
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 4			; line 7
		db 0
		mkline 4
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 3			; line 8
		db 0
		mkbyte 0,1
		mkline 4
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 3			; line 9
		db 0
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 2			; line 10
		db 0
		mkbyte 0,1
		mkline 5
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1

		mkline 2			; line 11
		db 0
		mkline 6
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 3,1
		mkline 5
		mkbyte 1,1
		
		mkdup 5
			db 0
			mkbyte 0,1
			mkline 6
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 3,1
			mkline 5
			mkbyte 1,1
		;edup
		
		mkline 8
		db 0
		mkbyte 0,4
		mkbyte 5,0
		mkline 5
		db 0
		
		db SCREND
        db STOMAP
        dw s126stom
        db TXTSMAP
        dw s126txd
        db SCREND

s126txd:
		mkbyte TXLINEH,1
			mktxtaddr 4, 7
			db CHTOP
		mkbyte TXLINEH,1
			mktxtaddr 9, 7
			db CHTOP
		mkbyte TXLINEH,1
			mktxtaddr 11, 7
			db CHTOP
		mkbyte TXLINEH,1
			mktxtaddr 27, 7
			db CHTOP

		mkbyte TXLINEH,1
			mktxtaddr 3, 7
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 8, 7
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 26, 7
			db CHFULL

		mkbyte TXLINEH,4
			mktxtaddr 2, 8
			db CHTOP
		mkbyte TXLINEH,6
			mktxtaddr 7, 8
			db CHTOP
		mkbyte TXLINEH,4
			mktxtaddr 25, 8
			db CHTOP

        db SCREND

; --- end of scrbk126


