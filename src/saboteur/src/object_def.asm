
objdead	EQU 1				; dead

; ---- saboteur state
;
;sbdead	EQU 1				; dead
sbmove	EQU 2				; moving 
sbkick	EQU 3				; kicking
sbstay	EQU 4				; staying 
sbfall	EQU 5				; falling down
sbladr	EQU 6				; moving on the ladder
sbjump	EQU 7				; jumping
sbsquat EQU 8				; squatting
sbshjmp EQU 9				; short jump
sbstmov EQU 10				; start moving
sbpunch EQU 11              ; punch
sbescap EQU 12              ; escaping

; ---- dog state
;
;dogdead	EQU 1			; dead
dogmove	EQU 2				; moving 
dogtrn  EQU 3				; turning
dogstay	EQU 4				; staying 

; ---- guard state
;
;gddead	EQU 1				; dead
;gdmove	EQU 2				; moving 
;gdkick	EQU 3				; kicking
;gdstay	EQU 4				; staying 

; ---- directions
;
dirrt	EQU 1				
dirlt	EQU 2
dirup	EQU 4
dirdn	EQU 8

; ---- background type
bwall   EQU 1
bladder EQU 2 
broof   EQU 4       ; roof, works as bwall but doesn't prevent from moving left/right 
                    ; when it is in the middle of saboteur's figure

bkroof EQU bwall + broof    ; background is a kind of roof

; ---- background tile attributes
bgtile  EQU 0       ; background tile
fgtile	EQU 128		; tile must be drawn above moving sprites
stotile EQU 64		; static object tile

; ---- object types
;
osabotr	EQU 1		; saboteur
odog	EQU 2		; dog
oguard	EQU 3		; guard
ogun	EQU 4		; gun

; ---- displacements from the beginning of the control block
;
odtype	EQU 0		; 0, object type
odproc	EQU 1       ; 1, control procedure
odcurst EQU 3       ; 3, current state 
oddir	EQU 4       ; 4, direction
odprevp EQU 5       ; 5, previous position in screen memory
odcurp	EQU 7       ; 7, current position in screen memory, top left corner
odcursp	EQU 9       ; 9, address of the current sprite to be drawn
odcursi	EQU 11      ; 11, index of the current sprite to be drawn (if any)
odcursc	EQU 12      ; 12, index of the current column on the working screen, top-left corner
odcursr	EQU 13      ; 13, index of the current row on the working screen, top-left corner
odprvsp	EQU 14 		; 14, address of the previous sprite 

; ---- not used by saboteur, for other objects only
odminc	EQU 16		; 16, min column
odmaxc	EQU 17		; 17, max column
odcbend EQU 18		; end of the control block

objsize EQU	odcbend - odtype
stobjsz EQU 6					; size of the static object
mobjsz  EQU	4					; size of the masked object

SPRHLEN EQU 3       ; sprite head length

; ----	makes control block for an object
;
		macro mkctrlb otype,oproc,curstat,direct,curpos,curspr,curspri,curscol,cursrow
		db otype
		dw oproc
		db curstat
		db direct
		dw curpos
		dw curpos
		dw curspr
		db curspri
		db curscol
		db cursrow
		dw curspr	; previous sprite address
		endm

		macro mkgdrt curscol,cursrow,mincol,maxcol
		mkctrlb oguard,guardprc,sbstay,dirrt,0,sabsprt,0,curscol,cursrow
		db mincol,maxcol
		endm 

		macro mkgdlt curscol,cursrow,mincol,maxcol
		mkctrlb oguard,guardprc,sbstay,dirlt,0,sabsplt,0,curscol,cursrow
		db mincol,maxcol
		endm 

		; macro mkguard curstat,direct,curpos,curspr,curspri,curscol,cursrow,mincol,maxcol
		; mkctrlb oguard,guardprc,curstat,direct,curpos,curspr,curspri,curscol,cursrow
		; db mincol,maxcol
		; endm 
		
		macro mkdog direct,curspr,curspri,curscol,cursrow,mincol,maxcol
		mkctrlb odog,dogact,dogmove,direct,scrbuf,curspr,curspri,curscol,cursrow
		db mincol,maxcol
		endm		
		
		macro mkgun direct,curscol,cursrow
		mkctrlb ogun,gunact,0,direct,scrbuf,gundn,0,curscol,cursrow
		db 0,0
		endm

		macro mkmasko address,colnum,rownum
		dw scrbuf + (colnum * COLWIDB) + (rownum * ROWWIDB)		; address in screen buffer
		dw address												; image address
		endm

        macro mkscradr colnum, rownum
        dw SCRADDR + colnum + (rownum) * 64 * 8		; address in video RAM
        endm

        macro mkstobj address,colnum,rownum
        db colnum
        db rownum
        dw address							    	; pointer to image data
        mkscradr colnum, rownum             		; start address in video RAM
        endm


; ---- trigger type
;
trgmanl	EQU 1		; manual trigger
trgauto	EQU 2		; auto trigger
trxonly EQU 128     ; trigger on X position only

; ---- object type in trigger
;
trempty EQU 0       ; nothing
trobrck EQU 1       ; brick
troshrk EQU 2       ; shuriken
troknif EQU 3       ; knife
troston EQU 4       ; stone
tropipe EQU 5       ; pipe
trogrnd EQU 6       ; granade
trodskn EQU 7       ; desk normal
trodskp EQU 8       ; desk pressed
trobomb EQU 9       ; bomb

; ---- trigger state
;
trdisab EQU 0		; trigger disabled, picture must not be shown, trigger procedure must not be called
tractiv EQU 1		; trigger is active

; ---- door state
;
dooropn EQU 1       ; door open
doorcls EQU 2       ; door closed

trdotyp EQU 4       ; displacement to object type
trdodat EQU 8       ; displacement to trigger's data
trsize  EQU 10 		; trigger size

		macro skip_trigger regpair
			dup trsize 
				inc	 regpair
			edup
		endm

		macro mktrig colnum, rownum, trtype, objtype, procaddr
        mktrig2 tractiv, colnum, rownum, trtype, objtype, procaddr
        endm

        macro mktrig2 trstate, colnum, rownum, trtype, objtype, procaddr
        mktrig3 trstate, colnum, rownum, trtype, objtype, procaddr, 0
        endm

        macro mktrig3 trstate, colnum, rownum, trtype, objtype, procaddr, data
		db trstate				
		db colnum
		db trtype               ; trigger type - manual/auto
		db rownum
        dw objtype              ; object type (brick, desk, etc.) / trigger activation procedure
		dw procaddr
        dw data                 ; custom data
		endm

; ---- displacement of the attributes for the thrown object
;
odflimg EQU 1       ; image address
odfcoln EQU 3       ; colnum
odfrown EQU 4       ; rownum

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
        inc hl
        inc hl
        inc hl
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
		; macro setobj pos,spraddr,spridx
		; ld de,pos
		; scurp 
		; ld de,spraddr
		; savem_hl_de
		; ld c,spridx
		; ld (hl),c
		; endm
				
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
		
; ---- calculate and save new sprite address from sprite table
; args: HL - address of object control block
;		A  - current sprite index
;		
		macro snewspa2 sprtab
		
		ld bc,odcursp
		add hl,bc
		snewspa sprtab
		
		endm
		
		
; --- checks whether sprite is a kind of floor
; args:		A - sprite type
; result:	A - 0 if not a floor type (something to walk on)
;
        macro isfloor
	  		and bwall + bladder + broof
        endm
		
		
