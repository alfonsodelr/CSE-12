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

		include	'q2_p2.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'q2_p2.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'q2_p2.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'q2_p2.consts.inc'

		include	'q2_p2.ro.inc'

; Code begins here:
L810_largest__hla_:
		mov	dword ptr [L812_iRegisterValue__hla_+0], ebx	;/* iRegisterValue */
		pop	dword ptr [L811_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+8], bl	;/* value4 */
		pop	word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+12], bl	;/* value3 */
		pop	word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+16], bl	;/* value2 */
		pop	word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+20], bl	;/* value1 */
		push	dword ptr [L811_iReturnAddress__hla_+0]	;/* iReturnAddress */
		push	dword ptr [L812_iRegisterValue__hla_+0]	;/* iRegisterValue */

L817_first_i__hla_:
		mov	ah, byte ptr [ebp+16]	;/* value2 */
		cmp	byte ptr [ebp+20], ah	;/* value1 */
		jg	L818_first_greater__hla_
		mov	byte ptr [L815_iGreatest_ab__hla_+0], ah	;/* iGreatest_ab */
		jmp	L819_second_i__hla_

L818_first_greater__hla_:
		mov	ah, byte ptr [ebp+20]	;/* value1 */
		mov	byte ptr [L815_iGreatest_ab__hla_+0], ah	;/* iGreatest_ab */
		jmp	L819_second_i__hla_

L819_second_i__hla_:
		mov	ah, byte ptr [ebp+8]	;/* value4 */
		cmp	byte ptr [ebp+12], ah	;/* value3 */
		jg	L820_second_greater__hla_
		mov	byte ptr [L816_iGreatest_cd__hla_+0], ah	;/* iGreatest_cd */
		jmp	L821_third_i__hla_

L820_second_greater__hla_:
		mov	ah, byte ptr [ebp+12]	;/* value3 */
		mov	byte ptr [L816_iGreatest_cd__hla_+0], ah	;/* iGreatest_cd */
		jmp	L821_third_i__hla_

L821_third_i__hla_:
		mov	ah, byte ptr [L816_iGreatest_cd__hla_+0]	;/* iGreatest_cd */
		cmp	byte ptr [L815_iGreatest_ab__hla_+0], ah	;/* iGreatest_ab */
		jg	L822_third_greater__hla_
		mov	byte ptr [L814_iGreatest__hla_+0], ah	;/* iGreatest */
		jmp	L823_finished__hla_

L822_third_greater__hla_:
		mov	ah, byte ptr [L815_iGreatest_ab__hla_+0]	;/* iGreatest_ab */
		mov	byte ptr [L814_iGreatest__hla_+0], ah	;/* iGreatest */
		jmp	L823_finished__hla_

L823_finished__hla_:
		mov	ah, byte ptr [L814_iGreatest__hla_+0]	;/* iGreatest */
		pop	ebx
		ret
xL810_largest__hla___hla_:
;L810_largest__hla_ endp




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


		push	L837_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_a__hla_+0], al	;/* a */
		pop	eax
		push	L859_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L807_b__hla_+0], al	;/* b */
		pop	eax
		push	L881_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L808_c__hla_+0], al	;/* c */
		pop	eax
		push	L903_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L809_d__hla_+0], al	;/* d */
		pop	eax
		mov	bx, 0
		mov	bl, byte ptr [L806_a__hla_+0]	;/* a */
		push	bx
		mov	bx, 0
		mov	bl, byte ptr [L807_b__hla_+0]	;/* b */
		push	bx
		mov	bx, 0
		mov	bl, byte ptr [L808_c__hla_+0]	;/* c */
		push	bx
		mov	bx, 0
		mov	bl, byte ptr [L809_d__hla_+0]	;/* d */
		push	bx
		call	L810_largest__hla_
		push	L925_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_a__hla_+0]	; (type int8 a)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L954_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L807_b__hla_+0]	; (type int8 b)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L983_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L808_c__hla_+0]	; (type int8 c)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L1012_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L809_d__hla_+0]	; (type int8 d)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L1041_str__hla_
		call	STDOUT_PUTS	; puts
		sub	esp, 4
		mov	byte ptr [ESP+0], ah
		call	STDOUT_PUTI8	; puti8
		push	L1055_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


