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

		include	'q3_p3.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'q3_p3.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'q3_p3.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'q3_p3.consts.inc'

		include	'q3_p3.ro.inc'

; Code begins here:
L809_makeSmallest__hla_:
		mov	word ptr [L814_AXRegister__hla_+0], ax	;/* AXRegister */
		mov	dword ptr [L813_EBXRegister__hla_+0], ebx	;/* EBXRegister */
		mov	dword ptr [L812_ECXRegister__hla_+0], ecx	;/* ECXRegister */
		mov	dword ptr [L811_EDXRegister__hla_+0], edx	;/* EDXRegister */
		pop	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	edx
		push	dword ptr [edx+0]	;/* [edx] */
		pop	dword ptr [ebp+8]	;/* k */
		pop	ecx
		push	dword ptr [ecx+0]	;/* [ecx] */
		pop	dword ptr [ebp+12]	;/* j */
		pop	ebx
		push	dword ptr [ebx+0]	;/* [ebx] */
		pop	dword ptr [ebp+16]	;/* i */
		push	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	dword ptr [L811_EDXRegister__hla_+0]	;/* EDXRegister */
		push	dword ptr [L812_ECXRegister__hla_+0]	;/* ECXRegister */
		push	dword ptr [L813_EBXRegister__hla_+0]	;/* EBXRegister */
		push	word ptr [L814_AXRegister__hla_+0]	;/* AXRegister */
		mov	eax, dword ptr [ebp+16]	;/* i */
		mov	[ebx+0], eax	;/* [ebx] */
		mov	eax, dword ptr [ebp+12]	;/* j */
		mov	[ecx+0], eax	;/* [ecx] */
		mov	eax, dword ptr [ebp+8]	;/* k */
		mov	[edx+0], eax	;/* [edx] */
		push	word ptr [ebx+0]	;/* [ebx] */
		pop	word ptr [L815_smallest__hla_+0]	;/* smallest */
		mov	ax, word ptr [L815_smallest__hla_+0]	;/* smallest */
		cmp	[ecx+0], ax	;/* [ecx] */
		jge	L816_newSmallest_01__hla_
		push	word ptr [ecx+0]	;/* [ecx] */
		pop	word ptr [L815_smallest__hla_+0]	;/* smallest */

L816_newSmallest_01__hla_:
		mov	ax, word ptr [L815_smallest__hla_+0]	;/* smallest */
		cmp	[edx+0], ax	;/* [edx] */
		jge	L817_newSmallest_02__hla_
		push	word ptr [edx+0]	;/* [edx] */
		pop	word ptr [L815_smallest__hla_+0]	;/* smallest */

L817_newSmallest_02__hla_:
		push	word ptr [L815_smallest__hla_+0]	;/* smallest */
		pop	word ptr [ebx+0]	;/* [ebx] */
		push	word ptr [L815_smallest__hla_+0]	;/* smallest */
		pop	word ptr [ecx+0]	;/* [ecx] */
		push	word ptr [L815_smallest__hla_+0]	;/* smallest */
		pop	word ptr [edx+0]	;/* [edx] */
		pop	ax
		pop	ebx
		pop	ecx
		pop	edx
		ret
xL809_makeSmallest__hla___hla_:
;L809_makeSmallest__hla_ endp




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


		push	L831_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_iValue1__hla_+0], ax	;/* iValue1 */
		pop	eax
		push	L853_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L807_iValue2__hla_+0], ax	;/* iValue2 */
		pop	eax
		push	L875_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L808_iValue3__hla_+0], ax	;/* iValue3 */
		pop	eax
		lea	eax, word ptr [L806_iValue1__hla_+0]	;/* iValue1 */
		push	eax
		lea	eax, word ptr [L807_iValue2__hla_+0]	;/* iValue2 */
		push	eax
		lea	eax, word ptr [L808_iValue3__hla_+0]	;/* iValue3 */
		push	eax
		call	L809_makeSmallest__hla_
		push	L897_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L911_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L806_iValue1__hla_+0]	; (type int16 iValue1)
		call	STDOUT_PUTI16	; puti16
		push	L940_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L807_iValue2__hla_+0]	; (type int16 iValue2)
		call	STDOUT_PUTI16	; puti16
		push	L969_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L808_iValue3__hla_+0]	; (type int16 iValue3)
		call	STDOUT_PUTI16	; puti16
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


