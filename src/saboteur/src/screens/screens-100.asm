
scrbk100:
		spmaplen smap100b,smap100e
smap100b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK11ADDR    ; 2, blue ladder top left
		bkindex BK12ADDR    ; 3, blue ladder top right
smap100e:
		mkline 8
		db 0
		mkline 7
		mkbyte 1,1
		
		mkdup 6
			db 0
			mkbyte 1,1
			mkline 13
			mkbyte 1,1
		;edup
		
		db 0
		mkline 8
		mkbyte 1,1
		mkline 6
		db 0
		
		db 0
		db 0
		mkline 13
		db 0
		
		mkdup 7
			db 0
			mkline 13
			mkbyte 1,1
			db 0
		;edup
		
		mkline 4
		db 0
		mkbyte 2,3
		mkline 10
		db 0
		
		db SCREND
        db OBJMAP
        dw s100om
        db STOMAP
        dw s100stom
        db MSKOMAP
        dw s100mom
        db SCREND

; --- end of scrbk100



scrbk101:
		spmaplen smap101b,smap101e
smap101b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK23ADDR    ; 2, red beam
		bkindex BK26ADDR    ; 3, cyan vertical tube
smap101e:
		mkdup 2
			db 0
			mkline 3
			mkbyte 1,1
			mkbyte 3,1
			mkbyte 1,1
			mkbyte 1,3
			mkbyte 1,1
			mkbyte 1,3
			mkbyte 1,1			
			mkbyte 3,1
			mkbyte 1,3			
			mkbyte 1,1
			mkbyte 1,3			
			mkbyte 1,1
		;edup
		
		db 0
		mkline 4
		mkbyte 2,2
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 1,1			
		mkbyte 3,1
		mkbyte 1,3			
		mkbyte 1,1
		mkbyte 1,3			
		mkbyte 1,1

		mkdup 6
			db 0
			mkline 3
			mkbyte 1,1
			mkbyte 3,1
			mkbyte 1,1
			mkbyte 1,3
			mkbyte 1,1
			mkbyte 1,3
			mkbyte 1,1			
			mkbyte 3,1
			mkbyte 1,3			
			mkbyte 1,1
			mkbyte 1,3			
			mkbyte 1,1
		;edup

		db 0			; line 10
		mkline 3
		mkbyte 1,1
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 1,0
		mkline 7
		db 0

		db 0			; line 11
		mkline 3
		mkbyte 1,1
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,3
		mkline 8
		db 0
		
		db 0			; line 12
		mkline 3
		mkbyte 1,1
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 8
		db 0

		db 0			; line 13
		mkline 3
		mkbyte 1,1
		mkbyte 3,1
		mkbyte 1,1
		mkline 9
		db 0

		db 0			; line 14
		mkline 3
		mkbyte 1,1
		mkbyte 3,1
		mkbyte 1,0
		mkline 4
		db 0
		mkline 5
		mkbyte 1,1

		db 0			; line 15
		mkline 3
		mkbyte 1,1
		mkbyte 3,1
		mkline 4
		db 0
		mkbyte 0,1
		mkline 5
		mkbyte 1,1
		
		mkline 9		; line 16
		db 0
		mkline 6
		mkbyte 1,1
		
		mkline 8		; line 17
		db 0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		
        db SCREND
        db STOMAP
        dw s101stom
        db TXTSMAP
        dw scrn101txd
        db SCREND

scrn101txd:					; description of the text RAM used by this screen		
		mkbyte TXLINEV,1
			mktxtaddr 8, 0
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 8, 1
			db CHTOP

		mkbyte TXLINEV,6
			mktxtaddr 8, 2
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 13, 0
			db CHBOTM
		mkbyte TXLINEV,5
			mktxtaddr 13, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 17, 0
			db CHBOTM
		mkbyte TXLINEV,4
			mktxtaddr 17, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 20, 0
			db CHBOTM
		mkbyte TXLINEV,4
			mktxtaddr 20, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 23, 0
			db CHBOTM
		mkbyte TXLINEV,4
			mktxtaddr 23, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 27, 0
			db CHBOTM
		mkbyte TXLINEV,4
			mktxtaddr 27, 1
			db CHFULL

        db SCREND
; --- end of scrbk101



scrbk102:
		spmaplen smap102b,smap102e
smap102b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK11ADDR    ; 2, blue ladder top left
		bkindex BK12ADDR    ; 3, blue ladder top right
		bkindex BK8ADDR     ; 4, blue ladder left bottom
		bkindex BK9ADDR     ; 5, blue ladder right bottom				
		bkindex BK26ADDR    ; 6, cyan vertical tube		
		bkindex BK24ADDR    ; 7, yellow ladder left
		bkindex BK25ADDR    ; 8, yellow ladder right		
smap102e:
		mkdup 9
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 6,1
			mkline 4
			mkbyte 1,1
			mkbyte 6,1
			mkbyte 1,6
			mkline 3
			mkbyte 1,1
			mkbyte 6,1
			mkbyte 1,1
			mkbyte 1,1
		;edup
		
		db 0
		mkbyte 0,2
		mkbyte 3,0
		mkline 12
		db 0
				
		mkdup 3
			db 0
			mkbyte 0,4
			mkbyte 5,0
			mkline 12
			db 0
		;edup
		
		mkdup 4
			mkbyte 1,1
			mkbyte 1,7
			mkbyte 8,1
			mkline 12
			mkbyte 1,1
		;edup

		
		db SCREND
        db OBJMAP
        dw s102om
        db MSKOMAP
        dw s102mom
        db TXTSMAP
        dw scrn102txd
        db SCREND

scrn102txd:					; description of the text RAM used by this screen		
		mkbyte TXLINEV,1
			mktxtaddr 4, 0
			db CHBOTM

		mkbyte TXLINEV,4
			mktxtaddr 4, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 14, 0
			db CHBOTM

		mkbyte TXLINEV,4
			mktxtaddr 14, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 17, 0
			db CHBOTM

		mkbyte TXLINEV,4
			mktxtaddr 17, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 24, 0
			db CHBOTM

		mkbyte TXLINEV,2
			mktxtaddr 24, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 24, 3
			db CHTOP

        db SCREND

; --- end of scrbk102


scrbk103:
		spmaplen smap103b,smap103e
smap103b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK24ADDR    ; 3, yellow ladder left
		bkindex BK25ADDR    ; 4, yellow ladder right		
smap103e:
		mkdup 8
			mkline 6
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,3
			mkbyte 4,1
			mkbyte 1,0
			db 0
		;edup
		
		mkline 9
		mkbyte 1,1
		mkline 6
		db 0
		
		mkdup 4
			db 0
			db 0
			mkline 13
			db 0
		;edup

		mkdup 4
			mkline 13
			mkbyte 1,1
			mkbyte 1,0
			db 0
		;edup
		
		db SCREND
        db STOMAP
        dw s103stom
        db TXTSMAP
        dw scrn103txd
        db SCREND

		
scrn103txd:					; description of the text RAM used by this screen		
		mkbyte TXLINEV,1
			mktxtaddr 18, 0
			db CHBOTM

		mkbyte TXLINEV,3
			mktxtaddr 18, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 18, 4
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 13, 0
			db CHBOTM

		mkbyte TXLINEV,2
			mktxtaddr 13, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 13, 3
			db CHTOP

		mscrend

; --- end of scrbk103


scrbk104:
		spmaplen smap104b,smap104e
smap104b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
smap104e:
		db 0
		mkline 14
		db 0
		
		mkdup 14
			db 0
			mkline 14
			mkbyte 1,1
		;edup
		
		mkdup 2
			db 0
			db 0
			mkline 13
			db 0		
		;edup
		
        db SCREND
        db STOMAP
        dw s104stom
        db TXTSMAP
        dw scrn104txd
        db MSKOMAP
        dw s104mom
        db SCREND

scrn104txd:					; description of the text RAM used by this screen		
		mkbyte TXLINEH,2
			mktxtaddr 2, 6
			db CHBOTM
		mkbyte TXLINEH,2
			mktxtaddr 18, 6
			db CHBOTM

		mkbyte TXLINEH,4
			mktxtaddr 1, 7
			db CHBOTM
		mkbyte TXLINEH,4
			mktxtaddr 17, 7
			db CHBOTM

		mkbyte TXLINEH,1
			mktxtaddr 2, 7
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 18, 7
			db CHFULL

        db SCREND

; --- end of scrbk104


scrbk105:
		spmaplen smap105b,smap105e
smap105b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK24ADDR    ; 2, yellow ladder left
		bkindex BK25ADDR    ; 3, yellow ladder right		
		bkindex BK6ADDR     ; 4, 2 yellow bricks 
		bkindex BK7ADDR     ; 5, big yellow brick		
		bkindex BK11ADDR    ; 6, blue ladder top left
		bkindex BK12ADDR    ; 7, blue ladder top right		
smap105e:
		mkline 9
		db 0
		mkbyte 6,7
		mkline 5
		db 0
		
		mkline 6
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,3
		mkline 5
		mkbyte 1,1
		
		mkdup 7
			mkline 6
			mkbyte 1,1
			mkbyte 1,5
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,3
			mkline 5
			mkbyte 1,1		
		;edup
		
		mkline 5		; line 10
		mkbyte 1,1
		mkbyte 1,0
		mkline 9
		db 0

		mkline 5
		mkbyte 1,1
		mkline 10
		db 0

		mkline 4		; line 12
		mkbyte 1,1
		mkbyte 1,0
		mkline 10
		db 0

		mkline 4		; line 13
		mkbyte 1,1
		mkline 11
		db 0

		mkline 3		; line 14
		mkbyte 1,1
		mkbyte 1,0
		mkline 11
		db 0
		
		mkline 3		; line 15
		mkbyte 1,1
		mkline 12
		db 0
		
		mkdup 2
			db 0
			db 0
			mkline 13
			db 0
		;edup

        db SCREND		
        db MSKOMAP
        dw s105mom
        db SCREND

; --- end of scrbk105


scrbk106:
		spmaplen smap106b,smap106e
smap106b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK6ADDR     ; 2, 2 yellow bricks 
		bkindex BK7ADDR     ; 3, big yellow brick
		bkindex BK49ADDR    ; 4, big vertical cyan tube
        bkindex BK50ADDR    ; 5, big horizontal cyan tube
smap106e:
		mkline 3
		db 0
		mkline 10
		mkbyte 1,1
		db 0
		db 0
		
		mkbyte 1,2
		mkline 12
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1

		mkdup 7
			mkbyte 1,3
			mkline 12
			mkbyte 1,1
			mkbyte 1,3
			mkbyte 1,1
		;edup
		
		mkline 5
		db 0
		mkbyte 5,5
		mkbyte 5,5
		mkbyte 5,0
		mkline 7
		db 0
		
		mkdup 7
			mkline 4
			db 0
			mkbyte 0,4
			mkline 3
			mkbyte 4,4
			mkline 7
			db 0
		;edup
				
        db SCREND
        db OBJMAP
        dw s106om
        db MSKOMAP
        dw s106mom
        db TXTSMAP
        dw scrn106txd
        db SCREND

scrn106txd:					; description of the text RAM used by this screen		
		mkbyte TXLINEH,1
			mktxtaddr 9, 5
			db CHBOTM
		mkbyte TXLINEH,5
			mktxtaddr 10, 5
			db CHFULL
		mkbyte TXLINEH,1
			mktxtaddr 15, 5
			db CHBOTM

		mkbyte TXLINEH,7
			mktxtaddr 9, 6
			db CHFULL
		mkbyte TXLINEH,7
			mktxtaddr 9, 7
			db CHFULL
		mkbyte TXLINEH,7
			mktxtaddr 9, 8
			db CHFULL

        db SCREND

; --- end of scrbk106


scrbk107:
		spmaplen smap107b,smap107e
smap107b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK6ADDR     ; 4, 2 yellow bricks 
		bkindex BK7ADDR     ; 5, big yellow brick
		bkindex BK11ADDR    ; 6, blue ladder top left
		bkindex BK12ADDR    ; 7, blue ladder top right
		bkindex BK8ADDR     ; 8, blue ladder left bottom
		bkindex BK9ADDR     ; 9, blue ladder right bottom						
smap107e:
		mkline 7
		db 0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		db 0
		
		mkline 3
		mkbyte 1,1
		mkbyte 4,1
		mkbyte 1,1
		mkbyte 1,4
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		db 0
		
		mkdup 6
			mkline 3
			mkbyte 1,1
			mkbyte 5,1
			mkbyte 1,1
			mkbyte 1,5
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			db 0			
		;edup
		
		mkline 3
		mkbyte 1,1
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 1,5
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 3,3
		db 0			
		
		mkline 7
		db 0
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		db 0

		mkline 8
		db 0
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		db 0

		mkline 8
		db 0
		mkbyte 0,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		db 0

		mkline 9
		db 0
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		db 0

		mkline 9
		db 0
		mkbyte 0,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		db 0

		mkline 10
		db 0
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		db 0
		
		mkline 12
		db 0
		mkbyte 6,7
		db 0
		db 0

		mkline 12
		db 0
		mkbyte 8,9
		db 0
		db 0
		
		db SCREND
        db MSKOMAP
        dw s107mom
        db TXTSMAP
        dw s107txd
        db SCREND

s107txd:
		mkbyte TXLINEV,1
			mktxtaddr 19, 0
			db CHBOTM
		mkbyte TXLINEV,6
			mktxtaddr 19, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 19, 7
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 23, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 23, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 23, 4
			db CHTOP
		mkbyte TXLINEV,3
			mktxtaddr 23, 5
			db CHFULL

        db SCREND

; --- end of scrbk107


scrbk108:
		spmaplen smap108b,smap108e
smap108b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
smap108e:
		mkdup 9
			mkbyte 1,2
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 2,1
			mkline 7
			mkbyte 1,1
			db 0
		;edup
		
		mkbyte 1,2
		mkbyte 1,3
		mkline 3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,1
		db 0
		
		mkdup 4
			mkbyte 1,2			
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1			
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1			
			db 0			
		;edup

		mkbyte 1,2			
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1			
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1			
		db 0			

		mkbyte 1,2			
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1			
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1			
		db 0			
		
		mkline 7
		db 0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		db 0
		
		db SCREND
        db TXTSMAP
        dw s108txd
        db SCREND

s108txd:
		mkbyte TXLINEV,1
			mktxtaddr 1, 0
			db CHBOTM
		mkbyte TXLINEV,7
			mktxtaddr 1, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 1, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 5, 5
			db CHBOTM
		mkbyte TXLINEV,2
			mktxtaddr 5, 6
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 5, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 9, 0
			db CHBOTM
		mkbyte TXLINEV,4
			mktxtaddr 9, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 9, 5
			db CHBOTM
		mkbyte TXLINEV,2
			mktxtaddr 9, 6
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 9, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 12, 0
			db CHBOTM
		mkbyte TXLINEV,8
			mktxtaddr 12, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 12, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 19, 5
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 19, 6
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 19, 7
			db CHTOP
		mkbyte TXLINEV,1
			mktxtaddr 19, 8
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 23, 5
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 23, 6
			db CHFULL

        db SCREND

; --- end of scrbk108


scrbk109:
		spmaplen smap109b,smap109e
smap109b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
        bkindex BK48ADDR    ; 4, cyan horizontal tube		
smap109e:
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

		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 4,4
		mkbyte 4,4
		mkbyte 4,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 2,1	
		mkbyte 1,1
		
		mkdup 4
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
		
		db 0				; line 9
		mkbyte 0,1
		mkbyte 1,1
		mkbyte 2,1
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkline 5
		mkbyte 3,3
		mkbyte 1,1
		
		db 0				; line 10
		db 0
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

		db 0				; line 11
		db 0
		mkbyte 0,1
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

		mkline 3			; line 12
		db 0
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

		mkline 3			; line 13
		db 0
		mkbyte 0,1
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1

		mkline 4			; line 14
		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1

		mkline 4			; line 15
		db 0
		mkbyte 0,1
		mkline 2
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1

		mkline 5			; line 16
		db 0
		mkline 2
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		
		db 0
		mkline 14
		db 0

        db SCREND
        db MSKOMAP
        dw s109mom
        db TXTSMAP
        dw s109txd
        db SCREND

s109txd:					; description of the text RAM used by this screen		
		mkbyte TXLINEV,1
			mktxtaddr 6, 0
			db CHBOTM
		mkbyte TXLINEV,5
			mktxtaddr 6, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 6, 6
			db CHTOP

		mkbyte TXLINEH,6
			mktxtaddr 11, 2
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 14, 0
			db CHBOTM
		mkbyte TXLINEV,7
			mktxtaddr 14, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 14, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 19, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 19, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 19, 4
			db CHTOP
		mkbyte TXLINEV,3
			mktxtaddr 19, 5
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 19, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 26, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 26, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 26, 4
			db CHTOP
		mkbyte TXLINEV,3
			mktxtaddr 26, 5
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 26, 8
			db CHTOP

        db SCREND

; --- end of scrbk109
