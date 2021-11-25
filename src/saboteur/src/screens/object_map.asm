;
;	this file contains object definitions for all the screens
;

s2mom:
		db 4
		mkmasko plrchain,9,4
		mkmasko plrchain,14,4
		mkmasko plrchain,19,4
		mkmasko plrchain,24,4

s3objm:
		db 1								; number of objects
		mkdog dirlt,dogspml1,0,20,4,1,22

s3mom:								     	; masked objects
		db 2								; number of objects
		mkmasko desk,24,3
		mkmasko trash,19,14


s4objm:	
		db 1
		mkgun dirlt,gunlt,0,17,1

s4mom:	
		db 8
		mkmasko fencert,11,12
		mkmasko fencert,12,11
		mkmasko fencert,13,10
		mkmasko fencert,14,9
		mkmasko fencert,15,8
		mkmasko fencert,16,7
		mkmasko fencert,17,6
		mkmasko fencertl,18,6

s6mom:
		db 5
		mkmasko bigplate,3,13
		mkmasko smlplate,3,12
		mkmasko smlplate,3,11
		mkmasko bigplate,24,15
		mkmasko smlplate,24,14

s7objm:
		db 1
		mkgun dirlt,gunlt,0,16,6

s7mom:
		db 4
		mkmasko fencert,21,12
		mkmasko fencert,22,11
		mkmasko fencert,23,10
		mkmasko fencertl,24,10

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

s36mom:
		db 6
		mkmasko s36wfrml, 6, 8
		mkmasko	s36wfrm, 10, 8
		mkmasko	s36wfrm, 14, 8
		mkmasko	s36wfrm, 18, 8
		mkmasko	s36wfrm, 22, 8
		mkmasko	s36wfrm, 26, 8

s37mom:
		db 6
		mkmasko	s36wfrm, 3, 8
		mkmasko	s36wfrm, 7, 8
		mkmasko	s36wfrm, 11, 8
		mkmasko	s36wfrm, 15, 8
		mkmasko	s36wfrm, 19, 8
		mkmasko s36wfrmr, 23, 8

s38objm:
		db 1
		mkgun dirrt, gunrt, 0, 13, 5

s39objm:
		db 1
		mkguard gdstay,dirrt,scrbuf,gdsprt,0,6,7,6,22
		
s41objm:
		db 1
		mkgun dirlt,gunlt,0,16,5

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

s70smom:
		db 17
		mkmasko bigplate,1,15
		mkmasko smlplate,1,14
		mkmasko smlplate,1,13
		mkmasko smlplate,1,12

		mkmasko bigplate,4,15
		mkmasko smlplate,4,14
		mkmasko smlplate,4,13

		mkmasko bigplate,17,15
		mkmasko smlplate,17,14
		mkmasko smlplate,17,13

		mkmasko bigplate,22,15
		mkmasko smlplate,22,14
		mkmasko smlplate,22,13
		mkmasko smlplate,22,12

		mkmasko bigplate,25,15
		mkmasko smlplate,25,14
		mkmasko smlplate,25,13
s70smome:

s71objm:
		db 1
		mkdog dirlt,dogspml1,0,15,5,5,15

s84objm:
		db 1
		mkdog dirlt,dogspml1,0,23,13,6,23

s99mom:
		db 4
		mkmasko fenceltl, 6, 4
		mkmasko fencelt, 7, 4
		mkmasko fencelt, 8, 5
		mkmasko fencelt, 9, 6

s100om:
		db 1
		mkdog dirrt,dogspml1,0,2,5,3,14

s100mom:
		db 7
		mkmasko bigplate,18,6
		mkmasko smlplate,18,5		

		mkmasko bigplate,23,6
		mkmasko smlplate,23,5
		mkmasko smlplate,23,4

		mkmasko bigplate,12,15
		mkmasko smlplate,12,14

s102om:
		db 1
		mkguard gdstay,dirrt,scrbuf,gdsprt,0,21,3,2,25

s102mom:
		db 9
		mkmasko bigplate,7,8
		mkmasko smlplate,7,7
		mkmasko smlplate,7,6

		mkmasko bigplate,10,8
		mkmasko smlplate,10,7

		mkmasko bigplate,23,8
		mkmasko smlplate,23,7
		mkmasko smlplate,23,6

		mkmasko desk,18,5
