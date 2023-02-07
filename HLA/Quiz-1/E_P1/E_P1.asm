; Assembly code emitted by HLA compiler
; Version 1.76 build 9932 (prototype)
; HLA compiler written by Randall Hyde
; FASM compatible output

		format	MS COFF


offset32	equ	 
ptr	equ	 

macro global [symbol]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol
   isextrn = 1
 end if
}

macro global2 [symbol,type]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol:type
   isextrn = 1
 end if
}


ExceptionPtr__hla_	equ	fs:0

		include	'e_p1.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'e_p1.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'e_p1.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'e_p1.consts.inc'

		include	'e_p1.ro.inc'

; Code begins here:



;/* HWexcept__hla_ gets called when Windows raises the exception. */

HWexcept__hla_ :
		jmp	HardwareException__hla_
;HWexcept__hla_  endp

DfltExHndlr__hla_:
		jmp	DefaultExceptionHandler__hla_
;DfltExHndlr__hla_ endp



_HLAMain       :


;/* Set up the Structured Exception Handler record */
;/* for this program. */

		call	BuildExcepts__hla_
		pushd	0		;/* No Dynamic Link. */
		mov	ebp, esp	;/* Pointer to Main's locals */
		push	ebp		;/* Main's display. */


		push	L823_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_input__hla_+0], al	;/* input */
		pop	eax

L832_ForLp__hla_:

L833_InitializeForLp__hla_:
		mov	al, byte ptr [L806_input__hla_+0]	;/* input */

L834_ForLpTerminationTest__hla_:
		cmp	byte ptr [L807_I__hla_+0], al	;/* I */
		jnl	L835_ForLpDone__hla_

L836_ForLpBody__hla_:
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_input__hla_+0]	; (type int8 input)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		add	byte ptr [L809_inner__hla_+0], 1	;/* inner */

L852_ForLp2__hla_:

L853_InitializeForLp2__hla_:
		mov	bh, byte ptr [L806_input__hla_+0]	;/* input */
		mov	byte ptr [L808_J__hla_+0], 0	;/* J */

L854_ForLpTerminationTest2__hla_:
		cmp	byte ptr [L808_J__hla_+0], bh	;/* J */
		jnl	L855_ForLpDone2__hla_

L856_ForLpBody2__hla_:
		push	dword 00h
		push	eax
		mov	al, byte ptr [L809_inner__hla_+0]	; (type int8 inner)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8

L872_ForLpIncrement2__hla_:
		inc	byte ptr [L808_J__hla_+0]	;/* J */
		jmp	L854_ForLpTerminationTest2__hla_

L855_ForLpDone2__hla_:
		call	STDOUT_NEWLN	; newln

L873_ForLpIncrement__hla_:
		inc	byte ptr [L807_I__hla_+0]	;/* I */
		jmp	L834_ForLpTerminationTest__hla_

L835_ForLpDone__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


