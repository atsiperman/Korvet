
; ---- saboteur state
;
sbstay	EQU 1				; staying 
sbmove	EQU 2				; moving 
sbkick	EQU 3				; kicking
sbjump	EQU 4				; jumping
sbfall	EQU 5				; falling down

; ---- directions
;
dirrt	EQU 1				
dirlt	EQU 2
dirup	EQU 4
dirdn	EQU 8

; ---- object types
;
osabotr	EQU 1				; saboteur
odog	EQU 2				; dog
oguard	EQU 3				; guard


; ---- displacements from the beginning of the control block
;
odtype	EQU 0		; 0, object type
oddraw	EQU 1       ; 1, draw sprite if not 0
odcurst EQU 2       ; 2, previous state 
oddir	EQU 3       ; 3, direction
odprevp EQU 4       ; 4, previous position
odcurp	EQU 6       ; 6, current position, top left corner
odcursp	EQU 8       ; 8, address of the current sprite to be drawn
odcursi	EQU 10      ; 10, index of the current sprite to be drawn (if any)

; ----	makes control block for an object
;
		macro mkctrlb otype,fdraw,curstat,direct,prevpos,curpos,curspr,curspri
		db otype,fdraw,curstat,direct
		dw prevpos,curpos,curspr
		db curspri
		endm

; ----  loads current state into A
; args: HL - address of control block 
; 
		macro ldstate
		ld bc,odcurst
		add hl,bc
		ld a,(hl)		
		endm

; ----  loads current direction into A
; args: HL - address of control block 
; 				
		macro lddir
		ld bc,oddir
		add hl,bc
		ld a,(hl)		
		endm

; ----  loads current position into de
; args: HL - address of control block 
; 				
		macro ldcurp
		ld bc,odcurp
		add hl,bc		
		load_de_hl
		endm

; ----  loads current sprite index into A
; args: HL - address of control block 
; 				
		macro ldcurspi
		ld bc,odcursi
		add hl,bc
		ld a,(hl)
		endm
		
; ----  saves current sprite address
; args: HL - address of control block 
; 		DE - sprite address
		macro scurspr	
		ld bc,odcursp
		add hl,bc		
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
		endm

; ----  set draw flag 
; args: HL - address of control block 
; 		
		macro sdrawf	drawf
		inc hl
		ld (hl),drawf
		endm

; ----  set currrent state
; args: HL - address of control block 
; 		
		macro scurst	state
		ld bc,odcurst
		add hl,bc		
		ld (hl),state
		endm

; ----  set current position
; args: HL - address of control block 
; 		DE - new position
		macro scurp	
		ld bc,odcurp
		add hl,bc
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
		endm

; ----  set current sprite index
; args: HL - address of control block 
; 		A - new index
		macro scurspi	
		ld bc,odcursi
		add hl,bc
		ld (hl),a
		endm
