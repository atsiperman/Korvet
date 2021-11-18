;
;	this file contains object definitions for all the screens
;

s3objm:
		db 3								; number of objects
		mkdog dirlt,dogspml1,0,20,4,1,22
		mkmasko desk,24,3
		mkmasko trash,19,14

s4objm:	
		db 9
		mkmasko fencert,11,11
		mkmasko fencert,12,10
		mkmasko fencert,13,9
		mkmasko fencert,14,8
		mkmasko fencert,15,7
		mkmasko fencert,16,6
		mkmasko fencert,17,5
		mkmasko fencertl,18,5
		mkgun dirlt,gunlt,0,17,1

s7objm:
		db 5
		mkgun dirlt,gunlt,0,16,6
		mkmasko fencert,21,11
		mkmasko fencert,22,10
		mkmasko fencert,23,9
		mkmasko fencertl,24,9

s8objm:
		db 2
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,4,7,4,20	
		mkdog dirlt,dogspml1,0,23,10,3,22		

s9objm:
		db 1
		mkgun dirlt,gunlt,0,9,1

s10objm:
		db 2
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,3,8,3,20	
		mkdog dirlt,dogspml1,0,23,11,3,22		

s28objm:
		db 1
		mkgun dirlt,gunlt,0,7,5

s32objm:
		db 1
		mkguard gdstay,dirrt,scrbuf,gdsprt,0,12,5,5,22

s35objm:
		db 1
		mkguard gdstay,dirrt,scrbuf,gdsprt,0,15,9,10,22

s36objm:
		db 1
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,9,9,8,22
		
s39objm:
		db 1
		mkguard gdstay,dirrt,scrbuf,gdsprt,0,6,7,6,22
		
s41objm:
		db 1
		mkgun dirlt,gunlt,0,16,5

s46objm:
		db 1
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,14,6,5,20

s48objm:
		db 2
		mkguard gdstay,dirrt,scrbuf,gdsprt,0,19,2,9,20
		mkdog dirlt,dogspml1,0,16,13,4,17

s49objm:
		db 1
		mkguard gdstay,dirrt,scrbuf,gdsprt,0,14,8,8,21
		
s51objm:
		db 1
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,20,10,16,21
		
s52objm:
		db 1		
		mkdog dirlt,dogspml1,0,7,13,5,19
		
s54objm:
		db 1
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,7,9,7,21

s60objm:
		db 1
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,7,9,7,21
		
s62objm:
		db 1		
		mkdog dirlt,dogspml1,0,3,8,3,15
