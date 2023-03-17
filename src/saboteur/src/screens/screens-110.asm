
scrbk110:
		spmaplen smap110b,smap110e
smap110b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK6ADDR     ; 4, 2 yellow bricks 
		bkindex BK7ADDR     ; 5, big yellow brick
		bkindex BK11ADDR    ; 6, blue ladder top left
		bkindex BK12ADDR    ; 7, blue ladder top right
		bkindex BK32ADDR    ; 8, green vertical tube
		bkindex BK24ADDR    ; 9, yellow ladder left
		bkindex BK25ADDR    ; 10, yellow ladder right	
        bkindex BK48ADDR    ; 11, cyan horizontal tube		        			
smap110e:
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,8
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		
		mkdup 4
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
		;edup
		
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,11
		mkbyte 11,11
		mkbyte 11,11
        mkbyte 11,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		
		mkdup 2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
		;edup
		
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,0
		mkline 11
		db 0
		
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,4
		mkline 4
		mkbyte 1,1
		mkbyte 9,10
		mkline 3
		mkbyte 1,1
		db 0
		db 0

		mkdup 6
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,5
			mkline 4
			mkbyte 1,1
			mkbyte 9,10
			mkline 3
			mkbyte 1,1
			db 0
			db 0
		;edup
		
		mkline 9
		db 0
		mkbyte 6,7
		mkline 5
		db 0
		
        db SCREND
        db TXTSMAP
        dw s110txd
        db SCREND

s110txd:					; description of the text RAM used by this screen		
		mkbyte TXLINEV,1
			mktxtaddr 3, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 3, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 3, 4
			db CHTOP
		mkbyte TXLINEV,3
			mktxtaddr 3, 5
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 3, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 5, 0
			db CHBOTM

		mkbyte TXLINEV,1
			mktxtaddr 8, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 8, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 8, 4
			db CHTOP

		mkbyte TXLINEH,6
			mktxtaddr 11, 3
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 12, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 12, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 12, 4
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 16, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 16, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 16, 4
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

		mkbyte TXLINEV,1
			mktxtaddr 23, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 23, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 23, 4
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 27, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 27, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 27, 4
			db CHTOP

        db SCREND

; --- end of scrbk110


scrbk111:
		spmaplen smap111b,smap111e
smap111b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK32ADDR    ; 4, green vertical tube
        bkindex BK48ADDR    ; 5, cyan horizontal tube
smap111e:
		mkdup 3
			mkline 4
			mkbyte 1,1
			mkbyte 1,2
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkline 6
			mkbyte 1,1
		;edup

		mkline 4
		mkbyte 1,1
		mkbyte 1,4
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkline 6
		mkbyte 1,1

		mkline 4
		mkbyte 1,1
		mkbyte 1,4
		mkline 3
		mkbyte 1,1
		mkbyte 1,5
		mkbyte 5,5
		mkbyte 5,5
		mkline 4
		mkbyte 1,1

		mkdup 3
			mkline 4
			mkbyte 1,1
			mkbyte 1,4
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkline 6
			mkbyte 1,1		
		;edup

		mkbyte 1,1
		mkbyte 1,1
		mkline 4
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,3
		mkline 3
		mkbyte 3,3
		
		mkline 4
		mkbyte 1,1
		mkbyte 1,4
		mkline 3
		mkbyte 1,1
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,1
		
		mkdup 6
			mkline 4
			mkbyte 1,1
			mkbyte 1,2
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkline 3
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,1
		;edup
		
		db 0
		mkline 14
		db 0
		
        db SCREND
        db TXTSMAP
        dw s111txd
		db MSKOMAP
		dw s111mom
        db SCREND

s111txd:					; description of the text RAM used by this screen		
		mkbyte TXLINEV,1
			mktxtaddr 9, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 9, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 9, 4
			db CHTOP
		mkbyte TXLINEV,3
			mktxtaddr 9, 5
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 9, 8
			db CHTOP

		mkbyte TXLINEH,5
			mktxtaddr 17, 2
			db CHBOTM

		mkbyte TXLINEV,1
			mktxtaddr 17, 0
			db CHBOTM
		mkbyte TXLINEV,4
			mktxtaddr 17, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 17, 5
			db CHBOTM
		mkbyte TXLINEV,2
			mktxtaddr 17, 6
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 17, 8
			db CHTOP

		mkbyte TXLINEV,3
			mktxtaddr 24, 5
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 24, 8
			db CHTOP

        db SCREND

; --- end of scrbk111


scrbk112:
		spmaplen smap112b,smap112e
smap112b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK11ADDR    ; 4, blue ladder top left
		bkindex BK12ADDR    ; 5, blue ladder top right
		bkindex BK24ADDR    ; 6, yellow ladder left
		bkindex BK25ADDR    ; 7, yellow ladder right		
		bkindex BK32ADDR    ; 8, green vertical tube		
        bkindex BK23_1AD    ; 9, red beam as a roof
smap112e:
		mkdup 8
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,2
			
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			
			mkbyte 1,1
			mkbyte 1,6
			mkbyte 7,1
			
			mkbyte 1,1
			mkbyte 1,1
		;edup

		mkbyte 9,9
		mkbyte 9,9
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,6
		mkbyte 7,1		
		mkbyte 1,1
		mkbyte 1,1
		
		
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2	
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,6
		mkbyte 7,1
		mkbyte 1,1
		mkbyte 1,1

		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 3,6
		mkbyte 7,1
		mkbyte 1,1
		mkbyte 1,1
		
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 9,9
		mkbyte 9,9
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,6
		mkbyte 7,1
		mkbyte 1,1
		mkbyte 1,1

		mkdup 2
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,2
			
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			
			mkbyte 1,1
			mkbyte 1,6
			mkbyte 7,1
			
			mkbyte 1,1
			mkbyte 1,1
		;edup

		mkline 6
		mkbyte 3,3
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,6
		mkbyte 7,1
		mkbyte 1,1
		mkbyte 1,1

		mkline 5
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 8,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,6
		mkbyte 7,1
		mkbyte 1,1
		mkbyte 1,1

		mkline 5
		mkbyte 1,1
		mkline 3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 2,1
		db 0
		mkbyte 0,4
		mkbyte 5,0
		db 0
		db 0
		
		db SCREND
        db TXTSMAP
        dw s112txd
        db SCREND

s112txd:
		mkbyte TXLINEV,1
			mktxtaddr 2, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 2, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 2, 4
			db CHTOP
		mkbyte TXLINEV,2
			mktxtaddr 2, 5
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 2, 7
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 7, 0
			db CHBOTM
		mkbyte TXLINEV,5
			mktxtaddr 7, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 7, 6
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 7, 7
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 10, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 12, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 13, 0
			db CHBOTM
		mkbyte TXLINEV,7
			mktxtaddr 13, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 13, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 18, 0
			db CHBOTM
		mkbyte TXLINEV,4
			mktxtaddr 18, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 18, 5
			db CHTOP
		mkbyte TXLINEV,3
			mktxtaddr 18, 6
			db CHFULL

		db SCREND		


; --- end of scrbk112

scrbk113:
		spmaplen smap113b,smap113e
smap113b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK32ADDR    ; 4, green vertical tube	
        bkindex BK48ADDR    ; 5, cyan horizontal tube	
        bkindex BK23_1AD    ; 6, red beam as a roof		

smap113e:
		mkdup 4
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkline 3
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,1
		;edup
		
		mkdup 2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkline 3
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,2
			mkbyte 1,2
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,1
		;edup
		
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,5
		mkline 3
		mkbyte 5,5
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,1

		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,1

		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,1
		mkline 3
		mkbyte 3,3
		
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,1
		
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 4,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,1
		
		mkline 5
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,1
		
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 4,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 6,6
		mkbyte 6,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,1

		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 4,1
		mkline 3		
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,1

		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkline 4
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 3,3
		mkbyte 3,3
		
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkline 3
		mkbyte 1,1
		mkbyte 1,3
		mkline 8
		mkbyte 3,3
		
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkline 4
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,1
		
		db SCREND
        db TXTSMAP
        dw s113txd
        db TRIGMAP
        dw s113trm
		db SCRINIP
		dw s113iprc
        db SCREND

s113txd:
		mkbyte TXLINEV,1
			mktxtaddr 4, 0
			db CHBOTM
		mkbyte TXLINEV,4
			mktxtaddr 4, 1
			db CHFULL
		mkbyte TXLINEV,2
			mktxtaddr 4, 5
			db CHBOTM
		mkbyte TXLINEV,2
			mktxtaddr 4, 7
			db CHFULL

		mkbyte TXLINEV,2
			mktxtaddr 6, 5
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 6, 7
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 12, 0
			db CHBOTM
		mkbyte TXLINEV,5
			mktxtaddr 12, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 12, 6
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 14, 7
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 14, 8
			db CHBOTM

		mkbyte TXLINEV,1
			mktxtaddr 15, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 15, 1
			db CHFULL

		mkbyte TXLINEH,6
			mktxtaddr 16, 3
			db CHBOTM

		mkbyte TXLINEV,1
			mktxtaddr 17, 2
			db CHBOTM
		mkbyte TXLINEV,5
			mktxtaddr 17, 3
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 17, 8
			db CHBOTM

		mkbyte TXLINEV,1
			mktxtaddr 19, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 19, 1
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 24, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 24, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 24, 4
			db CHTOP
		mkbyte TXLINEV,3
			mktxtaddr 24, 5
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 24, 8
			db CHBOTM

        db SCREND

; --- end of scrbk113


scrbk114:
		spmaplen smap114b,smap114e
smap114b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK24ADDR    ; 4, yellow ladder left
		bkindex BK25ADDR    ; 5, yellow ladder right	
        bkindex BK48ADDR    ; 6, cyan horizontal tube
smap114e:
		mkdup 5
			db 0
			mkbyte 1,1
			mkbyte 1,4
			mkbyte 5,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,2
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
		;edup

		db 0
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 5,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,6
		mkbyte 6,6
		mkbyte 6,6
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		
		mkdup 3
			db 0
			mkbyte 1,1
			mkbyte 1,4
			mkbyte 5,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 1,2
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
		;edup
		
		db 0
		mkline 3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		
		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
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
		
		db 0
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,3
		mkline 11
		mkbyte 3,3
		
		mkdup 2
			db 0
			mkline 3
			mkbyte 1,1
			mkbyte 2,1
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
		;edup

		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,2
		mkbyte 1,1		

		db 0
		mkline 4
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1		
		
		db 0
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1		
		
		db SCREND
		db SCRINIP
		dw s114iprc		
        db TXTSMAP
        dw s114txd
        db SCREND

s114txd:
		mkbyte TXLINEV,1
			mktxtaddr 8, 0
			db CHBOTM
		mkbyte TXLINEV,4
			mktxtaddr 8, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 8, 5
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 8, 6
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 8, 7
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 8, 8
			db CHBOTM

		mkbyte TXLINEV,1
			mktxtaddr 13, 0
			db CHBOTM
		mkbyte TXLINEV,5
			mktxtaddr 13, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 13, 6
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 13, 7
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 13, 8
			db CHTOP

		mkbyte TXLINEH,4
			mktxtaddr 14, 3
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 16, 0
			db CHBOTM
		mkbyte TXLINEV,2
			mktxtaddr 16, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 16, 3
			db CHTOP

		mkbyte TXLINEV,2
			mktxtaddr 17, 5
			db CHBOTM
		mkbyte TXLINEV,2
			mktxtaddr 17, 7
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 19, 0
			db CHBOTM
		mkbyte TXLINEV,4
			mktxtaddr 19, 1
			db CHFULL

		mkbyte TXLINEV,2
			mktxtaddr 20, 5
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 20, 7
			db CHTOP
		mkbyte TXLINEV,1
			mktxtaddr 20, 8
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 23, 8
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 27, 0
			db CHBOTM
		mkbyte TXLINEV,5
			mktxtaddr 27, 1
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 27, 6
			db CHBOTM
		mkbyte TXLINEV,2
			mktxtaddr 27, 7
			db CHFULL

        db SCREND            

; --- end of scrbk114


scrbk115:
		spmaplen smap115b,smap115e
smap115b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK24ADDR    ; 4, yellow ladder left
		bkindex BK25ADDR    ; 5, yellow ladder right		
		bkindex BK32ADDR    ; 6, green vertical tube		
        bkindex BK23_1AD    ; 7, red beam as a roof	
smap115e:
		db 0
		mkline 14
		db 0
		
		mkline 5
		db 0
		mkline 10
		mkbyte 1,1
		
		mkline 4
		db 0
		mkbyte 0,1
		mkline 10
		mkbyte 1,1
		
		mkline 4
		db 0
		mkline 11
		mkbyte 1,1
		
		mkline 3
		db 0
		mkbyte 0,1
		mkline 11
		mkbyte 1,1
		
		mkdup 2
			db 0
			db 0
			mkbyte 0,4
			mkbyte 5,1
			mkline 11
			mkbyte 1,1
		;edup

		db 0		
		db 0
		mkbyte 1,4
		mkbyte 5,1
		mkline 11
		mkbyte 1,1

		db 0		
		mkbyte 0,1
		mkbyte 1,4
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 3,1
		mkline 3
		mkbyte 1,1
		mkbyte 7,7
		mkbyte 7,7
		mkbyte 3,3
		mkbyte 3,3

		db 0
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 5
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2
		mkbyte 1,1
		
		db 0
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 5
		mkbyte 1,1
		mkbyte 6,1
		mkbyte 1,2
		mkbyte 1,1

		db 0
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 4
		mkbyte 1,1
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,2
		mkbyte 1,1

		db 0
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 2
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 6,1
		mkbyte 1,2
		mkbyte 1,1
		
		db 0
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 6,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		
		db 0
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 6,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		
		db 0
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1

		db 0
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 5,3
		mkline 5
		mkbyte 3,3
		mkbyte 1,2
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1		
		
		db SCREND
        db TXTSMAP
        dw s115txd
        db SCREND

s115txd:
		mkbyte TXLINEV,3
			mktxtaddr 13, 5
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 13, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 16, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 19, 8
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 20, 7
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 22, 7
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 24, 5
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 24, 6
			db CHBOTM

		mkbyte TXLINEV,4
			mktxtaddr 27, 5
			db CHFULL

        db SCREND

; --- end of scrbk115

scrbk116:
		spmaplen smap116b,smap116e
smap116b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK24ADDR    ; 4, yellow ladder left
		bkindex BK25ADDR    ; 5, yellow ladder right		
		bkindex BK32ADDR    ; 6, green vertical tube				
smap116e:
		db 0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 5,1
		mkline 5
		mkbyte 1,1
		
		mkdup 7
			mkline 8
			mkbyte 1,1
			mkbyte 1,4
			mkbyte 5,1
			mkline 5
			mkbyte 1,1		
		;edup
		
		mkline 10
		mkbyte 3,3
		mkline 5
		mkbyte 1,1
		
		mkdup 2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkline 4
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkline 5
			mkbyte 1,1
		;edup
		
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkline 5
		mkbyte 1,1
		
		mkdup 3
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,6
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkline 5
			mkbyte 1,1
		;edup
		
		mkbyte 1,1
		mkbyte 1,3
		mkline 3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 2,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkline 5
		mkbyte 1,1
		
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,6
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2		
		mkbyte 1,1
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1		
		
		db SCREND
        db TXTSMAP
        dw s116txd
		db SCRINIP
		dw s116iprc
        db SCREND

s116txd:
		mkbyte TXLINEV,3
			mktxtaddr 4, 5
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 4, 8
			db CHBOTM

		mkbyte TXLINEV,1
			mktxtaddr 9, 6
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 9, 7
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 9, 8
			db CHBOTM

		mkbyte TXLINEV,4
			mktxtaddr 12, 6
			db CHBOTM
		mkbyte TXLINEV,2
			mktxtaddr 12, 7
			db CHFULL

		mkbyte TXLINEV,4
			mktxtaddr 15, 5
			db CHFULL

		mkbyte TXLINEV,4
			mktxtaddr 19, 5
			db CHFULL

        db SCREND

; --- end of scrbk116



scrbk117:
		spmaplen smap117b,smap117e
smap117b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK24ADDR    ; 4, yellow ladder left
		bkindex BK25ADDR    ; 5, yellow ladder right		
		bkindex BK32ADDR    ; 6, green vertical tube				
smap117e:
		mkline 6
		mkbyte 1,1
		mkbyte 1,6
		mkline 3
		mkbyte 1,1
		mkline 4
		db 0
		mkbyte 1,1
		
		mkline 5
		mkbyte 1,1
		mkline 5
		mkbyte 3,3
		mkbyte 3,0
		db 0
		db 0
		mkbyte 0,1
		mkbyte 1,1
		
		mkline 6
		mkbyte 1,1
		mkbyte 1,6
		mkline 4
		mkbyte 1,1		
		db 0
		db 0
		mkbyte 1,1
		mkbyte 1,1

		mkdup 2
			mkline 6
			mkbyte 1,1
			mkbyte 1,6
			mkline 4
			mkbyte 1,1		
			mkbyte 1,4
			mkbyte 5,1
			mkbyte 1,1
			mkbyte 1,1
		;edup

		mkdup 5
			mkline 6
			mkbyte 1,1
			mkbyte 1,2
			mkline 4
			mkbyte 1,1		
			mkbyte 1,4
			mkbyte 5,1
			mkbyte 1,1
			mkbyte 1,1
		;edup

		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 4
		mkbyte 1,1		
		mkbyte 1,4
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 1,1
		
		mkline 3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 6,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 3,4
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 1,1
		
		mkline 3
		mkbyte 1,1
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 1,1

		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 5,1
		mkbyte 1,1
		mkbyte 1,1
			
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 6,1
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 1,4
		mkbyte 5,3
		mkbyte 3,3
		mkbyte 3,3
		
		mkdup 2
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 6,1
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 1,4
			mkbyte 5,1
			mkbyte 1,1
			mkbyte 1,1
		;edup
		
		db SCREND
        db TXTSMAP
        dw s117txd
        db SCREND

s117txd:
		mkbyte TXLINEV,2
			mktxtaddr 2, 7
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 7, 6
			db CHTOP
		mkbyte TXLINEV,2
			mktxtaddr 7, 7
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 8, 6
			db CHTOP
		mkbyte TXLINEV,1
			mktxtaddr 8, 7
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 8, 8
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 13, 0
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 13, 1
			db CHBOTM
		mkbyte TXLINEV,5
			mktxtaddr 13, 2
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 13, 7
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 13, 8
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 18, 6
			db CHBOTM
		mkbyte TXLINEV,2
			mktxtaddr 18, 7
			db CHFULL

        db SCREND

; --- end of scrbk117



scrbk118:
		spmaplen smap118b,smap118e
smap118b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK24ADDR    ; 4, yellow ladder left
		bkindex BK25ADDR    ; 5, yellow ladder right		
		bkindex BK32ADDR    ; 6, green vertical tube				
smap118e:

		mkdup 8
			mkline 10
			mkbyte 1,1
			mkbyte 4,5
			mkline 4
			mkbyte 1,1
		;edup
		
		mkline 4
		mkbyte 1,1
		mkline 9
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,1
		
		mkdup 5
			mkline 4
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,1
			mkbyte 6,1
			mkbyte 1,2
			mkline 6
			mkbyte 1,1
		;edup
		
		mkline 5
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,2
		mkline 6
		mkbyte 1,1

		mkdup 2
			mkline 4
			mkbyte 1,1
			mkbyte 1,2
			mkline 3
			mkbyte 1,1
			mkbyte 1,2
			mkline 6
			mkbyte 1,1
		;edup
				
		db SCREND
        db TXTSMAP
        dw s118txd
        db SCREND

s118txd:
		mkbyte TXLINEV,2
			mktxtaddr 9, 5
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 9, 7
			db CHTOP
		mkbyte TXLINEV,1
			mktxtaddr 9, 8
			db CHFULL

		mkbyte TXLINEV,2
			mktxtaddr 14, 5
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 14, 7
			db CHTOP

		mkbyte TXLINEV,4
			mktxtaddr 17, 5
			db CHFULL

        db SCREND

; --- end of scrbk118


scrbk119:
		spmaplen smap119b,smap119e
smap119b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
		bkindex BK24ADDR    ; 4, yellow ladder left
		bkindex BK25ADDR    ; 5, yellow ladder right		
		bkindex BK32ADDR    ; 6, green vertical tube				
smap119e:
		mkline 4
		mkbyte 1,1
		mkbyte 6,1
		mkline 5
		mkbyte 1,1
		mkline 5
		db 0
		
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,3
		mkline 4
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 1,0
		mkline 4
		db 0
		
		mkline 4
		mkbyte 1,1
		mkbyte 6,1
		mkbyte 1,1
		mkbyte 2,1
		mkline 4
		mkbyte 1,1
		mkline 4
		db 0
		
		mkline 4
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 2,1
		mkline 4
		mkbyte 1,1
		mkbyte 1,0
		mkline 3
		db 0

		mkdup 5
			mkline 4
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 2,1
			mkline 4
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
		;edup

		mkline 4
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 3,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		
		mkbyte 1,3
		mkline 4
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		
		
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 3,1
		mkbyte 2,1
		mkbyte 1,2
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1

		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,6
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2		
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,3
		mkbyte 3,3
		mkbyte 3,3
		
		mkdup 2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,6
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,1
			mkbyte 2,1
			mkbyte 1,2		
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,2
			mkbyte 1,1		
		;edup
		
		mkbyte 1,1
		mkbyte 1,3
		mkline 3
		mkbyte 3,3
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,1
		mkbyte 2,1
		mkbyte 1,2		
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1		
				
		db SCREND
		db SCRINIP
		dw s119iprc
        db TXTSMAP
        dw s119txd
        db SCREND

s119txd:
		mkbyte TXLINEV,2
			mktxtaddr 3, 6
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 3, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 5, 7
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 5, 8
			db CHTOP

		mkbyte TXLINEV,2
			mktxtaddr 8, 0
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 8, 2
			db CHFULL
		mkbyte TXLINEV,3
			mktxtaddr 8, 5
			db CHTOP
		mkbyte TXLINEV,2
			mktxtaddr 8, 6
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 8, 8
			db CHTOP

		mkbyte TXLINEV,1
			mktxtaddr 12, 1
			db CHBOTM
		mkbyte TXLINEV,4
			mktxtaddr 12, 2
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 12, 6
			db CHBOTM
		mkbyte TXLINEV,2
			mktxtaddr 12, 7
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 16, 5
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 16, 6
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 19, 5
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 19, 6
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 23, 2
			db CHBOTM
		mkbyte TXLINEV,3
			mktxtaddr 23, 3
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 23, 6
			db CHBOTM
		mkbyte TXLINEV,2
			mktxtaddr 23, 7
			db CHFULL

		mkbyte TXLINEV,1
			mktxtaddr 27, 2
			db CHBOTM
		mkbyte TXLINEV,4
			mktxtaddr 27, 3
			db CHFULL
		mkbyte TXLINEV,1
			mktxtaddr 27, 7
			db CHBOTM
		mkbyte TXLINEV,1
			mktxtaddr 27, 8
			db CHFULL

        db SCREND

; --- end of scrbk119
