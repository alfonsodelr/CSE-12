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

		include	'b.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'b.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'b.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'b.consts.inc'

		include	'b.ro.inc'

; Code begins here:
L810_noneZero__hla_:
		mov	word ptr [L812_BXRegister__hla_+0], bx	;/* BXRegister */
		pop	dword ptr [L811_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	word ptr [L813_temp__hla_+0]	;/* temp */
		pop	word ptr [ebp+8]	;/* value3 */
		pop	word ptr [ebp+12]	;/* value2 */
		pop	word ptr [ebp+16]	;/* value1 */
		push	dword ptr [L811_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	word ptr [L812_BXRegister__hla_+0]	;/* BXRegister */
		mov	bx, 0
		cmp	word ptr [ebp+16], bx	;/* value1 */
		jne	L815_notZero_01__hla_
		mov	byte ptr [L814_answer__hla_+0], 0	;/* answer */
		jmp	L816_finished__hla_

L815_notZero_01__hla_:
		cmp	word ptr [ebp+12], bx	;/* value2 */
		jne	L817_notZero_02__hla_
		mov	byte ptr [L814_answer__hla_+0], 0	;/* answer */
		jmp	L816_finished__hla_

L817_notZero_02__hla_:
		cmp	word ptr [ebp+8], bx	;/* value3 */
		jne	L818_notZero_03__hla_
		mov	byte ptr [L814_answer__hla_+0], 0	;/* answer */
		jmp	L816_finished__hla_

L818_notZero_03__hla_:

L816_finished__hla_:
		mov	eax, 0
		mov	al, byte ptr [L814_answer__hla_+0]	;/* answer */
		pop	bx
		ret
xL810_noneZero__hla___hla_:
;L810_noneZero__hla_ endp




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


		push	L832_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_iValue1__hla_+0], ax	;/* iValue1 */
		pop	eax
		push	L854_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L807_iValue2__hla_+0], ax	;/* iValue2 */
		pop	eax
		push	L876_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L808_iValue3__hla_+0], ax	;/* iValue3 */
		pop	eax
		push	word ptr [L806_iValue1__hla_+0]	;/* iValue1 */
		push	word ptr [L807_iValue2__hla_+0]	;/* iValue2 */
		push	word ptr [L808_iValue3__hla_+0]	;/* iValue3 */
		mov	ax, 0
		push	ax
		call	L810_noneZero__hla_
		mov	dword ptr [L809_iAnswer__hla_+0], eax	;/* iAnswer */
		push	L898_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L809_iAnswer__hla_+0]	; (type int32 iAnswer)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


