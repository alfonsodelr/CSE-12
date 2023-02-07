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

		include	'q2_p1.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'q2_p1.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'q2_p1.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'q2_p1.consts.inc'

		include	'q2_p1.ro.inc'

; Code begins here:
L810_allEqual__hla_:
		mov	dword ptr [L812_iRegisterValue__hla_+0], eax	;/* iRegisterValue */
		pop	dword ptr [L811_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	ax, word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+8], al	;/* value4 */
		pop	word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	ax, word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+12], al	;/* value3 */
		pop	word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	ax, word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+16], al	;/* value2 */
		pop	word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	ax, word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+20], al	;/* value1 */
		push	dword ptr [L811_iReturnAddress__hla_+0]	;/* iReturnAddress */
		push	dword ptr [L812_iRegisterValue__hla_+0]	;/* iRegisterValue */
		mov	bl, byte ptr [ebp+20]	;/* value1 */
		cmp	byte ptr [ebp+16], bl	;/* value2 */
		jne	L814_not_equal__hla_
		mov	bl, byte ptr [ebp+12]	;/* value3 */
		cmp	byte ptr [ebp+8], bl	;/* value4 */
		jne	L814_not_equal__hla_
		mov	bl, byte ptr [ebp+20]	;/* value1 */
		cmp	byte ptr [ebp+12], bl	;/* value3 */
		jne	L814_not_equal__hla_
		jmp	L815_equal__hla_

L814_not_equal__hla_:
		mov	bx, 0
		jmp	L816_finished__hla_

L815_equal__hla_:
		mov	bx, 1
		jmp	L816_finished__hla_

L816_finished__hla_:
		pop	eax
		ret
xL810_allEqual__hla___hla_:
;L810_allEqual__hla_ endp




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


		push	L830_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_iValue1__hla_+0], al	;/* iValue1 */
		pop	eax
		push	L852_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L807_iValue2__hla_+0], al	;/* iValue2 */
		pop	eax
		push	L874_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L808_iValue3__hla_+0], al	;/* iValue3 */
		pop	eax
		push	L896_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L809_iValue4__hla_+0], al	;/* iValue4 */
		pop	eax
		mov	ax, 0
		mov	al, byte ptr [L806_iValue1__hla_+0]	;/* iValue1 */
		push	ax
		mov	ax, 0
		mov	al, byte ptr [L807_iValue2__hla_+0]	;/* iValue2 */
		push	ax
		mov	ax, 0
		mov	al, byte ptr [L808_iValue3__hla_+0]	;/* iValue3 */
		push	ax
		mov	ax, 0
		mov	al, byte ptr [L809_iValue4__hla_+0]	;/* iValue4 */
		push	ax
		call	L810_allEqual__hla_
		cmp	bx, 0
		je	L905_zero__hla_
		jmp	L906_one__hla_

L905_zero__hla_:
		push	L920_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L921__finished__hla_

L906_one__hla_:
		push	L935_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L921__finished__hla_

L921__finished__hla_:
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


