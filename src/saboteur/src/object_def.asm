
; ---- saboteur state
;
sbstay	EQU 1				; staying 
sbmove	EQU 2				; moving 
sbkick	EQU 4				; kicking
sbjump	EQU 8				; jumping
sbfall	EQU 16				; falling down
sbladr	EQU 32				; moving on the ladder
sbdead	EQU 64				; dead

; ---- directions
;
dirrt	EQU 1				
dirlt	EQU 2
dirup	EQU 4
dirdn	EQU 8

; ---- background type
bwall   EQU 1
bladder EQU 2 


; ---- object types
;
osabotr	EQU 1				; saboteur
odog	EQU 2				; dog
oguard	EQU 3				; guard

; ---- displacements from the beginning of the control block
;
odtype	EQU 0		; 0, object type
odproc	EQU 1       ; 1, control procedure
odcurst EQU 3       ; 2, current state 
oddir	EQU 4       ; 3, direction
odprevp EQU 5       ; 4, previous position in screen memory
odcurp	EQU 7       ; 6, current position in screen memory, top left corner
odcursp	EQU 9       ; 8, address of the current sprite to be drawn
odcursi	EQU 11      ; 10, index of the current sprite to be drawn (if any)
odcursc	EQU 12      ; 11, index of the current column on the working screen, top-left corner
odcursr	EQU 13      ; 12, index of the current row on the working screen, top-left corner
odprvsp	EQU 14 		; 13, address of the previous sprite 
odminc	EQU 16		; 16, min column
odmaxc	EQU 17		; 17, max column
odcbend EQU 18		; end of the control block

objsize EQU	odcbend - odtype

; ----	makes control block for an object
;
		macro mkctrlb otype,oproc,curstat,direct,curpos,curspr,curspri,curscol,cursrow
		db otype
		dw oproc
		db curstat,direct
		dw curpos,curpos,curspr
		db curspri,curscol,cursrow
		dw curspr	; previous sprite address					
		endm

		macro mkdog direct,curspr,curspri,curscol,cursrow,mincol,maxcol
		mkctrlb odog,dogact,sbmove,direct,scrbuf,curspr,curspri,curscol,cursrow
		db mincol,maxcol
		endm
		
; ----  loads ldcurscb
; args: HL - address of the current column index
		macro ldcurscb
		ld c,(hl)
		dec hl
		endm

; ----  loads sprite ID into A
; args: HL - address of control block 
; 
		macro ldspid
		inc hl
		ld a,(hl)
		endm
		
; ----  loads current screen column into A
; args: HL - address of control block 
; 
		macro ldcursc
		ld bc,odcursc
		add hl,bc
		ld a,(hl)	
		endm

; ----  loads current screen row into A
; args: HL - address of control block 
; 
		macro ldcursr
		ld bc,odcursr
		add hl,bc
		ld a,(hl)	
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

; ----  loads previous position in screen memory into DE
; args: HL - address of control block 
; 				
		macro ldprevp
		ld bc,odprevp
		add hl,bc		
		load_de_hl
		endm

; ----  loads current position in screen memory into DE
; args: HL - address of control block 
; 				
		macro ldcurp
		ld bc,odcurp
		add hl,bc		
		load_de_hl
		endm

; ----  loads current sprite address into DE
; args: HL - address of control block 
; 				
		macro ldcurspr
		ld bc,odcursp
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
		
; ----  loads previous sprite address into DE
; args: HL - address of control block 
; 				
		macro ldprvsp
		ld bc,odprvsp
		add hl,bc		
		load_de_hl
		endm		
		
; ----  loads min column into A
; args: HL - address of control block 
; 				
		macro ldminc
		ld bc,odminc
		add hl,bc
		ld a,(hl)
		endm
		
; ----  loads max column into A
; args: HL - address of control block 
; 				
		macro ldmaxc
		ld bc,odmaxc
		add hl,bc
		ld a,(hl)
		endm
		
;	------------------------------------
;
;	macros for storing data
;
;	------------------------------------


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

; ----  set current state
; args: HL - address of control block 
; 		
		macro scurst	state
		ld bc,odcurst
		add hl,bc		
		ld (hl),state
		endm

; ----  set current direction
; args: HL - address of control block 
; 		
		macro scurdir	dir
		ld bc,oddir
		add hl,bc		
		ld (hl),dir
		endm

; ----  set current position
; args: HL - address of control block 
; 		DE - new position
		macro sprevp	
		ld bc,odprevp
		add hl,bc
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
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


; ----  set current screen column
; args: HL - address of control block 
; 		A - new screen column
		macro scursc
		ld bc,odcursc
		add hl,bc
		ld (hl),a
		endm

; ----  set current screen row
; args: HL - address of control block 
; 		A - new screen row
		macro scursr
		ld bc,odcursr
		add hl,bc
		ld (hl),a
		endm

; ----  set previous sprite address 
; args: HL - address of control block 
;		DE - sprite address 				
		macro sprvspr
		ld bc,odprvsp
		add hl,bc		
		savem_hl_de
		endm		

; ---- set new state of the object
; args: HL - address of control block
		macro setobj pos,spraddr,spridx
		ld de,pos
		scurp 
		ld de,spraddr
		savem_hl_de
		ld c,spridx
		ld (hl),c
		endm
				
; ---- calculate and save new sprite address from sprite table
; args: HL - address to save new value
;		A  - current sprite index
;
		macro snewspa sprtab
		
		push hl
		
		ld hl,sprtab + 1  ; sprite table
		ld b,0
		ld c,a
		add hl,bc
		add hl,bc			; 
		load_de_hl			; load sprite address
		
		pop hl				; save new sprite addr
		ld (hl),e
		inc hl
		ld (hl),d
		
		endm
		