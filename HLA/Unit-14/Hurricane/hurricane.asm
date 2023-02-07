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

		include	'hurricane.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'hurricane.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'hurricane.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'hurricane.consts.inc'

		include	'hurricane.ro.inc'

; Code begins here:
L807_hurrican__hla_:
		pop	dword ptr [L808_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	dword ptr [ebp+8]	;/* windspeed */
		push	dword ptr [L808_iReturnAddress__hla_+0]	;/* iReturnAddress */
		push	ax

L810__0A__hla_:
		finit
		fld	[L811_fpconst__hla_]
		fld	dword ptr [ebp+8]	;/* windspeed */
		fcomp
		fstsw	ax
		sahf
		setbe	al
		cmp	al, 0
		je	L812__0B__hla_
		mov	byte ptr [L809_end_val__hla_+0], 1	;/* end_val */
		jmp	L813_finished__hla_

L812__0B__hla_:
		finit
		fld	[L814_fpconst__hla_]
		fld	dword ptr [ebp+8]	;/* windspeed */
		fcomp
		fstsw	ax
		sahf
		setbe	al
		cmp	al, 0
		je	L815__0C__hla_
		mov	byte ptr [L809_end_val__hla_+0], 2	;/* end_val */
		jmp	L813_finished__hla_

L815__0C__hla_:
		finit
		fld	[L816_fpconst__hla_]
		fld	dword ptr [ebp+8]	;/* windspeed */
		fcomp
		fstsw	ax
		sahf
		setbe	al
		cmp	al, 0
		je	L817__0D__hla_
		mov	byte ptr [L809_end_val__hla_+0], 3	;/* end_val */
		jmp	L813_finished__hla_

L817__0D__hla_:
		finit
		fld	[L818_fpconst__hla_]
		fld	dword ptr [ebp+8]	;/* windspeed */
		fcomp
		fstsw	ax
		sahf
		setbe	al
		cmp	al, 0
		je	L819__0E__hla_
		mov	byte ptr [L809_end_val__hla_+0], 4	;/* end_val */
		jmp	L813_finished__hla_

L819__0E__hla_:
		finit
		fld	[L820_fpconst__hla_]
		fld	dword ptr [ebp+8]	;/* windspeed */
		fcomp
		fstsw	ax
		sahf
		setge	al
		cmp	al, 0
		je	L813_finished__hla_
		mov	byte ptr [L809_end_val__hla_+0], 5	;/* end_val */
		jmp	L813_finished__hla_

L813_finished__hla_:
		pop	ax
		mov	al, byte ptr [L809_end_val__hla_+0]	;/* end_val */
		ret
xL807_hurrican__hla___hla_:
;L807_hurrican__hla_ endp




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


		push	L834_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_input__hla_+0]	;/* input */
		pop	eax
		push	dword ptr [L806_input__hla_+0]	;/* input */
		call	L807_hurrican__hla_
		push	L856_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


