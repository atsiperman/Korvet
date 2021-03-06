	; background sprite index
	macro bkindex bkspaddr
		DB (bkspaddr - BKSPRTAB)/2
	endm

	
BKSPRTAB:
BK1ADDR:	DW BK1DATA
BK2ADDR:	DW BK2DATA
BK3ADDR:	DW BK3DATA
BK4ADDR:	DW BK4DATA
BK5ADDR:	DW BK5DATA
BK6ADDR:	DW BK6DATA
BK7ADDR:	DW BK7DATA
BK8ADDR:	DW BK8DATA
BK9ADDR:	DW BK9DATA
BK10ADDR:	DW BK10DATA
BK11ADDR:	DW BK11DATA
BK12ADDR:	DW BK12DATA
BK13ADDR:	DW BK13DATA
BK14ADDR:	DW BK14DATA
BK15ADDR:	DW BK15DATA
BK16ADDR:	DW BK16DATA
BK17ADDR:	DW BK17DATA
BK18ADDR:	DW BK18DATA
BK19ADDR:	DW BK19DATA
BK20ADDR:	DW BK20DATA
BK21ADDR:	DW BK21DATA
BK22ADDR:	DW BK22DATA
BK23ADDR:	DW BK23DATA
BK24ADDR:	DW BK24DATA
BK25ADDR:	DW BK25DATA
BK26ADDR:	DW BK26DATA
BK27ADDR:	DW BK27DATA
BK28ADDR:	DW BK28DATA
BK29ADDR:	DW BK29DATA
BK30ADDR:	DW BK30DATA
BK31ADDR:	DW BK31DATA
BK32ADDR:	DW BK32DATA


BK1DATA: 	bksh CYELLOW		; yellow L
			DB 1, 125, 93, 93, 69, 125, 1, 255
			
BK2DATA: 	bksh2 CBLUE,bwall	; blue dots
			DB 32, 4, 32, 0, 8, 0, 32, 0
			
BK3DATA: 	bksh CGREEN			; green squares
			DB 128, 190, 128, 255, 128, 190, 128, 255 
			
BK4DATA:	bksh CBLUE			; blue bricks
			DB 0,127,127,127,0,247,247,247

BK5DATA:	bksh CBLUE			; solid blue 
			DB 255,255,255,255,255,255,255,255
			
BK6DATA:	bksh CYELLOW		; 2 yellow bricks 
			DB 0,0,126,126,0,126,126,126
			
BK7DATA:	bksh CYELLOW		; big yellow brick
			DB 0,126,126,126,126,126,126,126

BK8DATA:	bksh2 CBLUE,bladder							; blue ladder left bottom
			DB 16,115,115,112,16,243,243,240			

BK9DATA:	bksh2 CBLUE,bladder							; blue ladder right bottom
			DB 8,207,207,15,8,207,207,15 

BK10DATA:	bksh CBLUE									; blue small bricks
			DB 0,247,0,127,0,247,247,247
	
BK11DATA:	bksh2 CBLUE,bladder							; blue ladder top left
			DB 144,115,3,112,144,115,3,112

BK12DATA:	bksh2 CBLUE,bladder							; blue ladder top right
			DB 9,206,192,14,9,206,192,14
			
BK13DATA:	bksh2 CGREEN,bladder						; green ladder bottom left
			DB 144,179,147,240,144,179,147,240

BK14DATA:	bksh2 CGREEN,bladder						; green ladder bottom right
			DB 8,206,200,15,8,206,200,15 

BK15DATA:	bksh2 CBLUE,bwall							; blue tube top 
			DB 126,0,44,44,44,44,44,44 
BK16DATA:	bksh2 CBLUE,bwall							; blue tube 
			DB 44,44,44,44,44,44,44,44 
BK17DATA:	bksh2 CBLUE,bwall							; blue tube bottom
			DB 44,44,44,44,44,44,0,126

BK18DATA:	bksh CBLUE									; water blue
			DB 255,255,255,255,255,255,255,255

BK19DATA:	bksh CBLUE									; water green
			DB 255,255,255,255,255,255,255,255

BK20DATA:	bksh2 CBLUE,bladder							; water blue
			DB 255,255,255,255,255,255,255,255

BK21DATA:	bksh2 CBLUE,bladder							; water green
			DB 255,255,255,255,255,255,255,255
			
BK22DATA:	bksh CBLUE									; solid white
			DB 255,255,255,255,255,255,255,255
			
BK23DATA:	bksh2 CRED,bwall							; red beam
			DB 255,255,255,255,0,0,255,0
			
BK24DATA:	bksh2 CYELLOW,bladder						; yellow ladder left
			DB 16,115,83,80,80,115,19,240			
			
BK25DATA:	bksh2 CYELLOW,bladder						; yellow ladder right
			DB 9,205,205,13,13,205,201,15

BK26DATA:	bksh CRED									; cyan vertical tube
			DB 102,70,70,102,98,102,102,102
			
BK27DATA:	bksh3 CYELLOW,CRED,bwall					; red left top edge
			DB 15, 31, 63, 127, 255, 255, 255, 255

BK28DATA:	bksh3 CYELLOW,CRED,bwall					; red left bottom edge
			DB 255, 255, 255, 255, 127, 63, 31, 15			

BK29DATA:	bksh2 CRED, bwall							; solid red 
			DB 255,255,255,255,255,255,255,255

BK30DATA:	bksh CGREEN									; solid green
			DB 255,255,255,255,255,255,255,255

BK31DATA:	bksh2 CRED,bwall							; black and white dots
			DB 50,46,123,38,50,46,123,38 
			
BK32DATA:	bksh CGREEN									; green vertical `tube
			DB 76,78,68,70,76,76,76,76
