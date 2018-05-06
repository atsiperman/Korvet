;
;	this file contains object definitions for all the screens
;

s3objm:
		db 1								; number of objects
		mkdog dirlt,dogspml1,0,20,4,1,22

s8objm:
		db 2
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,4,7,4,20	
		mkdog dirlt,dogspml1,0,23,10,3,22		

s10objm:
		db 2
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,3,8,3,20	
		mkdog dirlt,dogspml1,0,23,11,3,22		

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
