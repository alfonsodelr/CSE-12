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

		include	'square.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'square.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'square.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'square.consts.inc'

		include	'square.ro.inc'

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


		push	L820_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_input__hla_+0], eax	;/* input */
		pop	eax
		mov	eax, dword ptr [L806_input__hla_+0]	;/* input */
		mov	ebx, dword ptr [L806_input__hla_+0]	;/* input */
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L846_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L860_str__hla_
		call	STDOUT_PUTS	; puts
		add	ebx, 1
		push	ebx
		call	STDOUT_PUTI32	; puti32
		push	L874_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L888_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L902_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L929_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L943_str__hla_
		call	STDOUT_PUTS	; puts
		add	ebx, 1
		push	ebx
		call	STDOUT_PUTI32	; puti32
		push	L957_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L971_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L985_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	ebx, 1
		push	ebx
		call	STDOUT_PUTI32	; puti32
		push	L1012_str__hla_
		call	STDOUT_PUTS	; puts
		add	ebx, 1
		push	ebx
		call	STDOUT_PUTI32	; puti32
		push	L1026_str__hla_
		call	STDOUT_PUTS	; puts
		add	ebx, 1
		push	ebx
		call	STDOUT_PUTI32	; puti32
		push	L1040_str__hla_
		call	STDOUT_PUTS	; puts
		add	ebx, 1
		push	ebx
		call	STDOUT_PUTI32	; puti32
		push	L1054_str__hla_
		call	STDOUT_PUTS	; puts
		add	ebx, 1
		push	ebx
		call	STDOUT_PUTI32	; puti32
		push	L1068_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L1095_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L1109_str__hla_
		call	STDOUT_PUTS	; puts
		add	ebx, 1
		push	ebx
		call	STDOUT_PUTI32	; puti32
		push	L1123_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L1137_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L1151_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L1178_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L1192_str__hla_
		call	STDOUT_PUTS	; puts
		add	ebx, 1
		push	ebx
		call	STDOUT_PUTI32	; puti32
		push	L1206_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L1220_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L1234_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


