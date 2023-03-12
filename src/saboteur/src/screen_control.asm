
; ---- switches screen
; args:	
;		DE - displacement from the beginning of the screen map to the next screen pointer
; result: 
;		A - 0 if screen not changed

swchscrn:		
		ld hl,(curscr)	; load block of the current screen		
		add hl,de		; pointer to next screen address
		load_de_hl
		ld a,e
		or d			
		ret z			; do nothing if address is zero
		
		ex de,hl
		ld (curscr),hl	; save address of the next screen block
		ld a,1
		
		ret	

; ---- switch to screen on right
;
goscrnrt:
		ld de,rigtscrd
		jp swchscrn 
				
goscrnlt:
		ld de,leftscrd
		jp swchscrn 
		
goscrnup:
		ld de,upscrd
		jp swchscrn 

goscrndn:		
		ld de,downscrd
		jp swchscrn 
