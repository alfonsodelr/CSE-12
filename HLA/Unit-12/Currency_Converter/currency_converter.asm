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

		include	'currency_converter.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'currency_converter.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'currency_converter.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'currency_converter.consts.inc'

		include	'currency_converter.ro.inc'

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
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_input__hla_+0]	;/* input */
		pop	eax
		finit
		fld	dword ptr [L806_input__hla_+0]	;/* input */
		fld	dword ptr [L808_pounds__hla_+0]	;/* pounds */
		fmulp
		fstp	dword ptr [L807_output__hla_+0]	;/* output */
		push	L845_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_output__hla_+0]	; output
		push	dword 04h
		push	dword 02h
		call	STDOUT_PUTR32	; putr32
		push	L859_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		finit
		fld	dword ptr [L806_input__hla_+0]	;/* input */
		fld	dword ptr [L809_pesos__hla_+0]	;/* pesos */
		fmulp
		fstp	dword ptr [L807_output__hla_+0]	;/* output */
		push	L877_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_output__hla_+0]	; output
		push	dword 08h
		push	dword 02h
		call	STDOUT_PUTR32	; putr32
		push	L891_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		call	STDOUT_NEWLN	; newln
		push	L909_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_input__hla_+0]	;/* input */
		pop	eax
		finit
		fld	dword ptr [L806_input__hla_+0]	;/* input */
		fld	dword ptr [L808_pounds__hla_+0]	;/* pounds */
		fmulp
		fstp	dword ptr [L807_output__hla_+0]	;/* output */
		push	L931_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_output__hla_+0]	; output
		push	dword 05h
		push	dword 02h
		call	STDOUT_PUTR32	; putr32
		push	L945_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		finit
		fld	dword ptr [L806_input__hla_+0]	;/* input */
		fld	dword ptr [L809_pesos__hla_+0]	;/* pesos */
		fmulp
		fstp	dword ptr [L807_output__hla_+0]	;/* output */
		push	L963_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_output__hla_+0]	; output
		push	dword 09h
		push	dword 02h
		call	STDOUT_PUTR32	; putr32
		push	L977_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


