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

		include	'sum_up.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'sum_up.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'sum_up.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'sum_up.consts.inc'

		include	'sum_up.ro.inc'

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


		call	STDOUT_NEWLN	; newln
		push	L823_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_input__hla_+0], al	;/* input */
		pop	eax
		push	L845_str__hla_
		call	STDOUT_PUTS	; puts
		add	byte ptr [L806_input__hla_+0], 1	;/* input */

L846_ForLp__hla_:

L847_InitializeForLp__hla_:
		mov	al, byte ptr [L806_input__hla_+0]	;/* input */

L848_ForLpTerminationTest__hla_:
		cmp	byte ptr [L807_I__hla_+0], al	;/* I */
		jnl	L849_ForLpDone__hla_

L850_ForLpBody__hla_:

L851_ForLp2__hla_:

L852_InitializeForLp2__hla_:
		mov	bh, byte ptr [L807_I__hla_+0]	;/* I */
		mov	byte ptr [L808_J__hla_+0], 0	;/* J */

L853_ForLpTerminationTest2__hla_:
		cmp	byte ptr [L808_J__hla_+0], bh	;/* J */
		jnl	L854_ForLpDone2__hla_

L855_ForLpBody2__hla_:
		inc	byte ptr [L808_J__hla_+0]	;/* J */
		mov	bl, byte ptr [L809_sum__hla_+0]	;/* sum */
		add	bl, byte ptr [L808_J__hla_+0]	;/* J */
		mov	byte ptr [L809_sum__hla_+0], bl	;/* sum */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L808_J__hla_+0]	; J
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L869_str__hla_
		call	STDOUT_PUTS	; puts
		dec	byte ptr [L808_J__hla_+0]	;/* J */

L870_ForLpIncrement2__hla_:
		inc	byte ptr [L808_J__hla_+0]	;/* J */
		jmp	L853_ForLpTerminationTest2__hla_

L854_ForLpDone2__hla_:

L871_ForLpIncrement__hla_:
		inc	byte ptr [L807_I__hla_+0]	;/* I */
		jmp	L848_ForLpTerminationTest__hla_

L849_ForLpDone__hla_:
		call	STDOUT_NEWLN	; newln
		push	L885_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L809_sum__hla_+0]	; (type int8 sum)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
		call	STDOUT_NEWLN	; newln
		push	L913_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


