;
;	this file contains object definitions for all the screens
;

objmst: ; start of objects map

s3objm:
		db 1								; number of objects
		mkdog dirlt,dogspml1,0,20,4,1,22

s4objm:	
		db 1
		mkgun dirlt,17,1

s7objm:
		db 1
		mkgun dirlt,16,6

s8objm:
		db 2
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,4,7,4,20	
		mkdog dirlt,dogspml1,0,23,10,3,22		

s9objm:
		db 1
		mkgun dirlt,9,1

s10objm:
		db 2
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,3,8,3,20	
		mkdog dirlt,dogspml1,0,23,11,3,22		

s28objm:
		db 1
		mkgun dirlt,7,5

s32objm:
		db 1
		mkguard gdstay,dirrt,scrbuf,gdsprt,0,12,5,5,22

s35objm:
		db 1
		mkguard gdstay,dirrt,scrbuf,gdsprt,0,15,9,10,22

s36objm:
		db 1
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,9,9,8,22

s38objm:
		db 1
		mkgun dirrt,13,5

s39objm:
		db 1
		mkguard gdstay,dirrt,scrbuf,gdsprt,0,6,7,6,22
		
s41objm:
		db 1
		mkgun dirlt,16,5

s46objm:
		db 1
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,12,6,5,20

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

s58objm:
		db 1
		mkgun dirdn, 9, 1

s60objm:
		db 1
		mkguard gdstay,dirlt,scrbuf,gdsprt,0,7,9,7,21
		
s62objm:
		db 1		
		mkdog dirlt,dogspml1,0,3,8,3,15

s70objm:
		db 2
		mkguard gdstay,dirrt,scrbuf,gdsprt,0,12,1,3,24
		mkdog dirlt,dogspml1,0,24,4,0,24

s71objm:
		db 1
		mkdog dirlt,dogspml1,0,15,5,5,15

s84objm:
		db 1
		mkdog dirlt,dogspml1,0,23,13,6,23

s87objm:
		db 1
        mkgun dirdn, 18, 1

s92objm:
        db 1
        mkdog dirrt,dogspml1,0,1,12,1,15

s96objm:
        db 2
        mkdog dirrt,dogspml1,0,13,13,13,25
        mkgun dirrt,13,1

s100om:
		db 1
		mkdog dirrt,dogspml1,0,2,5,3,14

s102om:
		db 1
		mkguard gdstay,dirrt,scrbuf,gdsprt,0,21,3,2,25

s106om:
        db 1
        mkgun dirrt,17,0

objmend: ; end of objects map