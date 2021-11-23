
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
		
		mscrend
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
		
		mkline 8		; line 16
		db 0
		mkbyte 0,1
		mkline 6
		mkbyte 1,1
		
		mscrend
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
		
		mscrend
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
			mkbyte 1,2
			mkbyte 1,1
			mkbyte 1,3
			mkbyte 4,1
			mkbyte 1,0
			db 0
		;edup
		
		mkline 6
		mkbyte 1,1
		mkbyte 1,2
		mkbyte 1,1
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
		
		mscrend
		
scrn103txd:					; description of the text RAM used by this screen		
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
		
		mscrend
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
		
		mscrend
; --- end of scrbk105


scrbk106:
		spmaplen smap106b,smap106e
smap106b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK6ADDR     ; 2, 2 yellow bricks 
		bkindex BK7ADDR     ; 3, big yellow brick
		bkindex BK5ADDR     ; 4, solid blue 		
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
		mkbyte 4,4
		mkbyte 4,4
		mkbyte 4,0
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
				
		mscrend
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
		
		mscrend
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
		
		mscrend
; --- end of scrbk108


scrbk109:
		spmaplen smap109b,smap109e
smap109b:
		bkindex BK2ADDR		; 0, wall
		bkindex BK1ADDR		; 1, yellow L
		bkindex BK26ADDR    ; 2, cyan vertical tube		
		bkindex BK23ADDR    ; 3, red beam
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
		mkbyte 1,2
		mkbyte 2,2
		mkbyte 2,2
		mkbyte 2,1
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
		
		mscrend
; --- end of scrbk109
