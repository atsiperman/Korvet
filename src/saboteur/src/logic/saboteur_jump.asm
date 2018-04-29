;
;	this file contains logic for jumps
;

; ---- starts long jump
; 
sbstjmp:		
		sbscurst sbjump 
		;sbscursp 
		ret
		

; ---- starts short jump
; 		
sbstshjp:	
		;sbscurst sbshjmp
		ret

; ---- do jump
; 				
sbdojp:
		ret
		
		
; ---- do short jump
; 				
sbdoshjp:
		ret
		
		
; ---- checks if it is possible to jump
;
; result: 
;			A - 0 if no space to jump
;
canjump:
		sblcursr
		call scadrlt		; left top in DE		
		ret