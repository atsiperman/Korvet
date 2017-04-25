
scrbk1:
        dup ROWNUM
			bkindex BK2ADDR
			dup COLNUM - 1
				bkindex BK1ADDR
			edup
        edup
		
scrbk2:
        dup ROWNUM
			bkindex BK2ADDR
			dup COLNUM - 1
				bkindex BK3ADDR
			edup
        edup

scrbk3:
		dup 20
		bkindex BK5ADDR
		edup
		dup 10
		bkindex BK2ADDR
		edup
		
		dup 21
		bkindex BK5ADDR
		edup
		bkindex BK6ADDR
		dup 8
		bkindex BK1ADDR
		edup

		dup 5
		dup 21
		bkindex BK5ADDR
		edup
		bkindex BK7ADDR
		dup 8
		bkindex BK1ADDR
		edup
		edup
		
		dup 10
		bkindex BK2ADDR
		edup		
		bkindex BK4ADDR
		bkindex BK4ADDR
		dup 18
		bkindex BK2ADDR
		edup
		
		dup 10
		bkindex BK2ADDR
		edup		
		bkindex BK4ADDR
		bkindex BK4ADDR
		dup 18
		bkindex BK2ADDR
		edup

		dup 9
		bkindex BK2ADDR
		edup		
		bkindex BK4ADDR
		bkindex BK4ADDR
		bkindex BK4ADDR
		dup 18
		bkindex BK4ADDR
		edup
		
		dup 6
		dup 9
		bkindex BK2ADDR
		edup		
		dup 21
		bkindex BK4ADDR
		edup
		edup

		dup 30
		bkindex BK2ADDR
		edup	

; --- end of scrbk3
	
scrbk4:
		dup 5
		bkindex BK2ADDR
		edup
		dup 3
		bkindex BK4ADDR
		edup
		dup 2
		bkindex BK4ADDR
		edup		
		dup 12
		bkindex BK2ADDR
		edup
		dup 8
		bkindex BK4ADDR
		edup

		dup 4
		bkindex BK1ADDR
		edup
		bkindex BK6ADDR
		dup 3
		bkindex BK4ADDR
		edup
		dup 2
		bkindex BK4ADDR
		edup
		dup 20
		bkindex BK4ADDR
		edup

		dup 5
		dup 4
		bkindex BK1ADDR
		edup
		bkindex BK7ADDR
		dup 3
		bkindex BK4ADDR
		edup
		dup 2
		bkindex BK4ADDR
		edup
		dup 20
		bkindex BK4ADDR
		edup
		edup

		dup 5
		bkindex BK2ADDR
		edup
		dup 3
		bkindex BK4ADDR
		edup
		dup 2
		bkindex BK4ADDR
		edup
		dup 20
		bkindex BK4ADDR
		edup

		dup 11
		bkindex BK2ADDR
		edup
		dup 19
		bkindex BK4ADDR
		edup

		dup 18
		bkindex BK4ADDR
		edup
		dup 12
		bkindex BK2ADDR
		edup


		dup 17
		bkindex BK4ADDR
		edup
		dup 13
		bkindex BK2ADDR
		edup


		dup 16
		bkindex BK4ADDR
		edup
		dup 14
		bkindex BK2ADDR
		edup


		dup 15
		bkindex BK4ADDR
		edup
		dup 15
		bkindex BK2ADDR
		edup
		
		
		dup 14
		bkindex BK4ADDR
		edup
		dup 16
		bkindex BK2ADDR
		edup


		dup 13
		bkindex BK4ADDR
		edup
		dup 17
		bkindex BK2ADDR
		edup


		dup 12
		bkindex BK4ADDR
		edup
		dup 18
		bkindex BK2ADDR
		edup

		dup 30
		bkindex BK2ADDR
		edup

; --- end of scrbk4