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

		include	'e_p2.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'e_p2.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'e_p2.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'e_p2.consts.inc'

		include	'e_p2.ro.inc'

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
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_input__hla_+0], eax	;/* input */
		pop	eax
		push	dword ptr [L806_input__hla_+0]	;/* input */
		pop	dword ptr [L808_biggest__hla_+0]	;/* biggest */
		inc	dword ptr [L809_total_num__hla_+0]	;/* total_num */
		push	L845_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_input__hla_+0], eax	;/* input */
		pop	eax
		push	dword ptr [L806_input__hla_+0]	;/* input */
		pop	dword ptr [L807_smallest__hla_+0]	;/* smallest */
		mov	eax, dword ptr [L808_biggest__hla_+0]	;/* biggest */
		cmp	dword ptr [L807_smallest__hla_+0], eax	;/* smallest */
		jnl	L854_FirstEnd__hla_
		inc	dword ptr [L809_total_num__hla_+0]	;/* total_num */

L855_WhileLp__hla_:
		push	L869_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_input__hla_+0], eax	;/* input */
		pop	eax

L878_WhileLpTermination__hla_:
		mov	eax, dword ptr [L806_input__hla_+0]	;/* input */
		cmp	eax, dword ptr [L808_biggest__hla_+0]	;/* biggest */
		jng	L879_GreaterEnd__hla_
		mov	dword ptr [L808_biggest__hla_+0], eax	;/* biggest */
		inc	dword ptr [L809_total_num__hla_+0]	;/* total_num */
		push	L893_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_input__hla_+0], eax	;/* input */
		pop	eax
		mov	eax, dword ptr [L806_input__hla_+0]	;/* input */
		cmp	eax, dword ptr [L807_smallest__hla_+0]	;/* smallest */
		jnl	L902_LessEnd__hla_
		mov	dword ptr [L807_smallest__hla_+0], eax	;/* smallest */
		inc	dword ptr [L809_total_num__hla_+0]	;/* total_num */
		jmp	L855_WhileLp__hla_

L879_GreaterEnd__hla_:
		push	L916_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_input__hla_+0]	; (type int32 input)
		call	STDOUT_PUTI32	; puti32
		push	L927_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L808_biggest__hla_+0]	; (type int32 biggest)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		push	L947_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L809_total_num__hla_+0]	; (type int32 total_num)
		call	STDOUT_PUTI32	; puti32
		push	L958_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L959_WhileLpDone__hla_

L902_LessEnd__hla_:
		push	L973_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_input__hla_+0]	; (type int32 input)
		call	STDOUT_PUTI32	; puti32
		push	L984_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_smallest__hla_+0]	; (type int32 smallest)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		push	L1004_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L809_total_num__hla_+0]	; (type int32 total_num)
		call	STDOUT_PUTI32	; puti32
		push	L1015_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L959_WhileLpDone__hla_

L854_FirstEnd__hla_:
		push	L1029_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_smallest__hla_+0]	; (type int32 smallest)
		call	STDOUT_PUTI32	; puti32
		push	L1040_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L808_biggest__hla_+0]	; (type int32 biggest)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		push	L1060_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L809_total_num__hla_+0]	; (type int32 total_num)
		call	STDOUT_PUTI32	; puti32
		push	L1071_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L959_WhileLpDone__hla_

L959_WhileLpDone__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


