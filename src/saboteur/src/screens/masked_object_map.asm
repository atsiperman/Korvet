
s2mom:
		db 4
		mkmasko plrchain,9,4
		mkmasko plrchain,14,4
		mkmasko plrchain,19,4
		mkmasko plrchain,24,4

s3mom:								     	; masked objects
		db 2								; number of objects
		mkmasko desk,24,3
		mkmasko trash,19,14

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

s70mom:
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

s92mom:
		db 12
        mkmasko bigplate,7,14
        mkmasko smlplate,7,13
        mkmasko bigplate,11,14
        mkmasko smlplate,11,13

		mkmasko fencert,18,11
        mkmasko fencert,19,10
        mkmasko fencert,20,9
        mkmasko fencert,21,8
        mkmasko fencert,22,7
        mkmasko fencert,23,6
        mkmasko fencert,24,5
		mkmasko fencertl,25,5

s95mom:
		db 2
        mkmasko desk,3,12
        mkmasko desk,21,11

s96mom:
		db 10
        mkmasko fenceltl, 4, 4
		mkmasko fencelt, 5, 4
		mkmasko fencelt, 6, 5
		mkmasko fencelt, 7, 6
		mkmasko fencelt, 8, 7
		mkmasko fencelt, 9, 8
		mkmasko fencelt, 10, 9
		mkmasko fencelt, 11, 10
		mkmasko fencelt, 12, 11
		mkmasko fencelt, 13, 12

s97mom:
		db 5
        mkmasko desk, 6, 3
        mkmasko desk, 9, 3
        mkmasko desk, 12, 3
        mkmasko desk, 15, 3
        mkmasko desk, 18, 3

s99mom:
		db 4
		mkmasko fenceltl, 6, 4
		mkmasko fencelt, 7, 4
		mkmasko fencelt, 8, 5
		mkmasko fencelt, 9, 6

s100mom:
		db 7
		mkmasko bigplate,18,6
		mkmasko smlplate,18,5		

		mkmasko bigplate,23,6
		mkmasko smlplate,23,5
		mkmasko smlplate,23,4

		mkmasko bigplate,12,15
		mkmasko smlplate,12,14

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

s104mom:
        db 4
        mkmasko desk, 6, 11
        mkmasko desk, 8, 11
        mkmasko desk, 11, 11
        mkmasko desk, 14, 11

s105mom:
        db 8
        mkmasko desk, 23, 5
        mkmasko fencert, 5, 11
        mkmasko fencert, 6, 10
        mkmasko fencert, 7, 9
        mkmasko fencert, 8, 8
        mkmasko fencert, 9, 7
        mkmasko fencert, 10, 6
        mkmasko fencertl, 11, 6

s106mom:
		db 2
        mkmasko desk,3,5
        mkmasko desk,21,5

s107mom:
		db 7
		mkmasko fenceltl, 14, 6
		mkmasko fencelt, 15, 6
		mkmasko fencelt, 16, 7
		mkmasko fencelt, 17, 8
		mkmasko fencelt, 18, 9
		mkmasko fencelt, 19, 10
		mkmasko fencelt, 20, 11

s109mom:
		db 9
		mkmasko fenceltl, 2, 5
		mkmasko fencelt, 3, 5
		mkmasko fencelt, 4, 6
		mkmasko fencelt, 5, 7
		mkmasko fencelt, 6, 8
		mkmasko fencelt, 7, 9
		mkmasko fencelt, 8, 10
		mkmasko fencelt, 9, 11
		mkmasko fencelt, 10, 12
