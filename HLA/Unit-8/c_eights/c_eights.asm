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

		include	'c_eights.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'c_eights.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'c_eights.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'c_eights.consts.inc'

		include	'c_eights.ro.inc'

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



L811_WhileLp__hla_:
		mov	dword ptr [L810_temp_sum__hla_+0], 0	;/* temp_sum */
		push	L825_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_input_a__hla_+0], eax	;/* input_a */
		pop	eax
		push	L847_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L807_input_b__hla_+0], eax	;/* input_b */
		pop	eax
		push	L869_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L808_input_c__hla_+0], eax	;/* input_c */
		pop	eax
		mov	eax, dword ptr [L810_temp_sum__hla_+0]	;/* temp_sum */
		mov	ebx, dword ptr [L809_total_sum__hla_+0]	;/* total_sum */
		add	eax, dword ptr [L806_input_a__hla_+0]	;/* input_a */
		add	eax, dword ptr [L807_input_b__hla_+0]	;/* input_b */
		add	eax, dword ptr [L808_input_c__hla_+0]	;/* input_c */
		mov	dword ptr [L810_temp_sum__hla_+0], eax	;/* temp_sum */
		add	ebx, eax
		mov	dword ptr [L809_total_sum__hla_+0], ebx	;/* total_sum */

L878_WhileLpTermination__hla_:
		cmp	dword ptr [L810_temp_sum__hla_+0], 8	;/* temp_sum */
		je	L879_sum_eight__hla_
		cmp	dword ptr [L806_input_a__hla_+0], 8	;/* input_a */
		je	L880_crazy_eight__hla_
		cmp	dword ptr [L807_input_b__hla_+0], 8	;/* input_b */
		je	L880_crazy_eight__hla_
		cmp	dword ptr [L808_input_c__hla_+0], 8	;/* input_c */
		je	L880_crazy_eight__hla_

L881_WhileLpBody__hla_:
		jmp	L882_WhileLpDone__hla_

L880_crazy_eight__hla_:
		push	L896_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L811_WhileLp__hla_

L879_sum_eight__hla_:
		push	L914_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L811_WhileLp__hla_

L882_WhileLpDone__hla_:
		call	STDOUT_NEWLN	; newln
		push	L932_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L941_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L809_total_sum__hla_+0]	; (type int32 total_sum)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		call	STDOUT_NEWLN	; newln
		push	L965_str__hla_
		call	STDOUT_PUTS	; puts
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


