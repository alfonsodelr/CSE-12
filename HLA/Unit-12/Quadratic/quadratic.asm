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

		include	'quadratic.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'quadratic.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'quadratic.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'quadratic.consts.inc'

		include	'quadratic.ro.inc'

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


		push	L832_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_a__hla_+0]	;/* a */
		pop	eax
		push	L854_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L807_b__hla_+0]	;/* b */
		pop	eax
		push	L876_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L808_c__hla_+0]	;/* c */
		pop	eax
		finit
		fld	dword ptr [L807_b__hla_+0]	;/* b */
		fld	[L885_fpconst__hla_]
		fmulp
		fstp	dword ptr [L810__negative_B__hla_+0]	;/* _negative_B */
		finit
		fld	dword ptr [L807_b__hla_+0]	;/* b */
		fld	st0
		fmulp
		fstp	dword ptr [L809__Bsquared__hla_+0]	;/* _Bsquared */
		finit
		fld	[L886_fpconst__hla_]
		fld	dword ptr [L806_a__hla_+0]	;/* a */
		fmulp
		fld	dword ptr [L808_c__hla_+0]	;/* c */
		fmulp
		fstp	dword ptr [L811__4ac__hla_+0]	;/* _4ac */
		finit
		fld	dword ptr [L809__Bsquared__hla_+0]	;/* _Bsquared */
		fld	dword ptr [L811__4ac__hla_+0]	;/* _4ac */
		fsubp
		fsqrt
		fstp	dword ptr [L812__sqrt_disc__hla_+0]	;/* _sqrt_disc */
		finit
		fld	dword ptr [L810__negative_B__hla_+0]	;/* _negative_B */
		fld	dword ptr [L812__sqrt_disc__hla_+0]	;/* _sqrt_disc */
		faddp
		fstp	dword ptr [L814_add_numerator__hla_+0]	;/* add_numerator */
		finit
		fld	dword ptr [L810__negative_B__hla_+0]	;/* _negative_B */
		fld	dword ptr [L812__sqrt_disc__hla_+0]	;/* _sqrt_disc */
		fsubp
		fstp	dword ptr [L815_sub_numerator__hla_+0]	;/* sub_numerator */
		finit
		fld	[L887_fpconst__hla_]
		fld	dword ptr [L806_a__hla_+0]	;/* a */
		fmulp
		fstp	dword ptr [L816_denominator__hla_+0]	;/* denominator */
		finit
		fld	dword ptr [L814_add_numerator__hla_+0]	;/* add_numerator */
		fld	dword ptr [L816_denominator__hla_+0]	;/* denominator */
		fdivp
		fstp	dword ptr [L817_x1__hla_+0]	;/* x1 */
		finit
		fld	dword ptr [L815_sub_numerator__hla_+0]	;/* sub_numerator */
		fld	dword ptr [L816_denominator__hla_+0]	;/* denominator */
		fdivp
		fstp	dword ptr [L818_x2__hla_+0]	;/* x2 */
		push	L901_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L818_x2__hla_+0]	; x2
		push	dword 06h
		push	dword 03h
		call	STDOUT_PUTR32	; putr32
		push	L915_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L817_x1__hla_+0]	; x1
		push	dword 06h
		push	dword 03h
		call	STDOUT_PUTR32	; putr32
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


