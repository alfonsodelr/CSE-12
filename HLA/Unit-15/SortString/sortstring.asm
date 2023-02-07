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

		include	'sortstring.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'sortstring.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'sortstring.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'sortstring.consts.inc'

		include	'sortstring.ro.inc'

; Code begins here:
L809_swapper__hla_:
		mov	dword ptr [L814_EAXRegister__hla_+0], eax	;/* EAXRegister */
		mov	dword ptr [L813_EBXRegister__hla_+0], ebx	;/* EBXRegister */
		mov	dword ptr [L812_ECXRegister__hla_+0], ecx	;/* ECXRegister */
		mov	dword ptr [L811_EDXRegister__hla_+0], edx	;/* EDXRegister */
		pop	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	edx
		push	dword ptr [edx+0]	;/* [edx] */
		pop	dword ptr [ebp+8]	;/* z */
		pop	ecx
		push	dword ptr [ecx+0]	;/* [ecx] */
		pop	dword ptr [ebp+12]	;/* y */
		pop	ebx
		push	dword ptr [ebx+0]	;/* [ebx] */
		pop	dword ptr [ebp+16]	;/* x */
		push	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		push	dword ptr [L811_EDXRegister__hla_+0]	;/* EDXRegister */
		push	dword ptr [L812_ECXRegister__hla_+0]	;/* ECXRegister */
		push	dword ptr [L813_EBXRegister__hla_+0]	;/* EBXRegister */
		push	dword ptr [L814_EAXRegister__hla_+0]	;/* EAXRegister */
		mov	eax, dword ptr [ebp+16]	;/* x */
		mov	[ebx+0], eax	;/* [ebx] */
		mov	eax, dword ptr [ebp+12]	;/* y */
		mov	[ecx+0], eax	;/* [ecx] */
		mov	eax, dword ptr [ebp+8]	;/* z */
		mov	[edx+0], eax	;/* [edx] */

L816_A0__hla_:
		mov	eax, 0
		mov	al, [ecx+0]	;/* [ecx] */
		cmp	[ebx+0], al	;/* [ebx] */
		jg	L817_A1__hla_
		mov	eax, [ebx+0]	;/* [ebx] */
		mov	byte ptr [L815_iTemporary__hla_+0], al	;/* iTemporary */
		mov	eax, [ecx+0]	;/* [ecx] */
		mov	[ebx+0], al	;/* [ebx] */
		mov	al, byte ptr [L815_iTemporary__hla_+0]	;/* iTemporary */
		mov	[ecx+0], al	;/* [ecx] */

L817_A1__hla_:
		mov	eax, 0
		mov	al, [edx+0]	;/* [edx] */
		cmp	[ecx+0], al	;/* [ecx] */
		jg	L818_A2__hla_
		mov	eax, [ecx+0]	;/* [ecx] */
		mov	byte ptr [L815_iTemporary__hla_+0], al	;/* iTemporary */
		mov	eax, [edx+0]	;/* [edx] */
		mov	[ecx+0], al	;/* [ecx] */
		mov	al, byte ptr [L815_iTemporary__hla_+0]	;/* iTemporary */
		mov	[edx+0], al	;/* [edx] */

L818_A2__hla_:
		mov	eax, 0
		mov	al, [ecx+0]	;/* [ecx] */
		cmp	[ebx+0], al	;/* [ebx] */
		jg	L819_finished__hla_
		mov	eax, [ebx+0]	;/* [ebx] */
		mov	byte ptr [L815_iTemporary__hla_+0], al	;/* iTemporary */
		mov	eax, [ecx+0]	;/* [ecx] */
		mov	[ebx+0], al	;/* [ebx] */
		mov	al, byte ptr [L815_iTemporary__hla_+0]	;/* iTemporary */
		mov	[ecx+0], al	;/* [ecx] */

L819_finished__hla_:
		pop	eax
		pop	ebx
		pop	ecx
		pop	edx
		ret
xL809_swapper__hla___hla_:
;L809_swapper__hla_ endp




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


		push	L833_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_a__hla_+0], ax	;/* a */
		pop	eax
		push	L855_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L807_b__hla_+0], ax	;/* b */
		pop	eax
		push	L877_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L808_c__hla_+0], ax	;/* c */
		pop	eax
		lea	eax, word ptr [L806_a__hla_+0]	;/* a */
		push	eax
		lea	eax, word ptr [L807_b__hla_+0]	;/* b */
		push	eax
		lea	eax, word ptr [L808_c__hla_+0]	;/* c */
		push	eax
		call	L809_swapper__hla_
		push	L899_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L806_a__hla_+0]	; a
		call	STDOUT_PUTI16	; puti16
		push	L913_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L807_b__hla_+0]	; b
		call	STDOUT_PUTI16	; puti16
		push	L927_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L808_c__hla_+0]	; c
		call	STDOUT_PUTI16	; puti16
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


