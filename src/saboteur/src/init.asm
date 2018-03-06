
; ----- initializes data
;
sabinit:
		call initbuf
		ret
		
; ----- makes initialization of screen buffer and vars
;
initbuf:
		ld hl,scrbuf	; address of screen buffer
		ld de,bufrows	; array of addresses of rows in buffer
		ld bc,COLNUM*8	; size of one row
		ld a,ROWNUM

initbuf1:
		
		ex de,hl
		savem_hl_de
		ex de,hl		
		
		dec a
		ret z
		
		add hl,bc
		jp initbuf1