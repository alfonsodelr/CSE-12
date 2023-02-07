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

		include	'rollingaverage.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'rollingaverage.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'rollingaverage.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'rollingaverage.consts.inc'

		include	'rollingaverage.ro.inc'

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


		push	L825_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_input__hla_+0]	;/* input */
		pop	eax
		push	dword ptr [L806_input__hla_+0]	;/* input */
		pop	dword ptr [L807_roll_av__hla_+0]	;/* roll_av */
		jmp	L834_WhileLpPrompt__hla_

L835_WhileLp__hla_:
		push	L849_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_input__hla_+0]	;/* input */
		pop	eax
		finit
		fld	dword ptr [L810_count__hla_+0]	;/* count */
		fld	dword ptr [L807_roll_av__hla_+0]	;/* roll_av */
		fmulp
		fstp	dword ptr [L811_prev_sum__hla_+0]	;/* prev_sum */
		finit
		fld	dword ptr [L806_input__hla_+0]	;/* input */
		fld	dword ptr [L811_prev_sum__hla_+0]	;/* prev_sum */
		faddp
		fstp	dword ptr [L809_sum__hla_+0]	;/* sum */
		finit
		fld	dword ptr [L810_count__hla_+0]	;/* count */
		fld	[L858_fpconst__hla_]
		faddp
		fstp	dword ptr [L810_count__hla_+0]	;/* count */
		finit
		fld	dword ptr [L809_sum__hla_+0]	;/* sum */
		fld	dword ptr [L810_count__hla_+0]	;/* count */
		fdivp
		fstp	dword ptr [L807_roll_av__hla_+0]	;/* roll_av */

L834_WhileLpPrompt__hla_:
		push	L872_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_roll_av__hla_+0]	; roll_av
		push	dword 06h
		push	dword 03h
		call	STDOUT_PUTR32	; putr32
		call	STDOUT_NEWLN	; newln
		push	L886_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_FLUSHINPUT	; flushInput
		call	STDIN_GETC	; getc
		mov	byte ptr [L808_choice__hla_+0], al	;/* choice */
		cmp	byte ptr [L808_choice__hla_+0], 121	;/* choice */
		je	L835_WhileLp__hla_
		push	L900_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_roll_av__hla_+0]	; roll_av
		push	dword 06h
		push	dword 03h
		call	STDOUT_PUTR32	; putr32
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


