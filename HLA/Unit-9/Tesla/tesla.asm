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

		include	'tesla.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'tesla.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'tesla.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'tesla.consts.inc'

		include	'tesla.ro.inc'

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
		push	eax
		call	STDIN_GETW	; getw
		mov	bx, ax
		pop	eax
		mov	cl, bl
		mov	ch, bh
		mov	bh, ch
		and	bh, 2

L829_sunroof_conditions__hla_:
		cmp	bh, 0
		je	L830_sunroof_satisfied_00__hla_
		cmp	bh, 2
		je	L831_sunroof_satisfied_01__hla_

L830_sunroof_satisfied_00__hla_:
		push	L845_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L846_sunroof_end__hla_

L831_sunroof_satisfied_01__hla_:
		push	L860_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L846_sunroof_end__hla_

L846_sunroof_end__hla_:
		call	STDOUT_NEWLN	; newln
		mov	bh, ch
		and	bh, 1

L861_roofrack_conditions__hla_:
		cmp	bh, 0
		je	L862_roofrack_satisfied_00__hla_
		cmp	bh, 1
		je	L863_roofrack_satisfied_01__hla_

L862_roofrack_satisfied_00__hla_:
		push	L877_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L878_roofrack_end__hla_

L863_roofrack_satisfied_01__hla_:
		push	L892_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L878_roofrack_end__hla_

L878_roofrack_end__hla_:
		call	STDOUT_NEWLN	; newln
		mov	bl, cl
		and	bl, 192

L893_tire_conditions__hla_:
		cmp	bl, 0
		je	L894_tire_satisfied_00__hla_
		cmp	bl, 64
		je	L895_tire_satisfied_01__hla_
		cmp	bl, 128
		je	L896_tire_satisfied_10__hla_
		cmp	bl, 192
		je	L897_tire_satisfied_11__hla_

L894_tire_satisfied_00__hla_:
		push	L911_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L912_tire_finished__hla_

L895_tire_satisfied_01__hla_:
		push	L926_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L912_tire_finished__hla_

L896_tire_satisfied_10__hla_:
		push	L940_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L912_tire_finished__hla_

L897_tire_satisfied_11__hla_:
		push	L954_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L912_tire_finished__hla_

L912_tire_finished__hla_:
		push	L968_str__hla_
		call	STDOUT_PUTS	; puts
		mov	bl, cl
		and	bl, 48

L969_color_conditions__hla_:
		cmp	bl, 0
		je	L970_color_satisfied_00__hla_
		cmp	bl, 16
		je	L971_color_satisfied_01__hla_
		cmp	bl, 32
		je	L972_color_satisfied_10__hla_
		cmp	bl, 48
		je	L973_color_satisfied_11__hla_

L970_color_satisfied_00__hla_:
		push	L987_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L988_color_end__hla_

L971_color_satisfied_01__hla_:
		push	L1002_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L988_color_end__hla_

L972_color_satisfied_10__hla_:
		push	L1016_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L988_color_end__hla_

L973_color_satisfied_11__hla_:
		push	L1030_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L988_color_end__hla_

L988_color_end__hla_:
		push	L1044_str__hla_
		call	STDOUT_PUTS	; puts
		mov	bl, cl
		and	bl, 12

L1045_battery_conditions__hla_:
		cmp	bl, 0
		je	L1046_battery_satisfied_00__hla_
		cmp	bl, 4
		je	L1047_battery_satisfied_01__hla_
		cmp	bl, 8
		je	L1048_battery_satisfied_10__hla_
		cmp	bl, 12
		je	L1049_battery_satisfied_11__hla_

L1046_battery_satisfied_00__hla_:
		push	L1063_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1064_battery_end__hla_

L1047_battery_satisfied_01__hla_:
		push	L1078_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1064_battery_end__hla_

L1048_battery_satisfied_10__hla_:
		push	L1092_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1064_battery_end__hla_

L1049_battery_satisfied_11__hla_:
		push	L1106_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1064_battery_end__hla_

L1064_battery_end__hla_:
		push	L1120_str__hla_
		call	STDOUT_PUTS	; puts
		mov	bl, cl
		and	bl, 3

L1121_model_conditions__hla_:
		cmp	bl, 0
		je	L1122_model_satisfied_00__hla_
		cmp	bl, 1
		je	L1123_model_satisfied_01__hla_
		cmp	bl, 2
		je	L1124_model_satisfied_10__hla_
		cmp	bl, 3
		je	L1125_model_satisfied_11__hla_

L1122_model_satisfied_00__hla_:
		push	L1139_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1140_model_finished__hla_

L1123_model_satisfied_01__hla_:
		push	L1154_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1140_model_finished__hla_

L1124_model_satisfied_10__hla_:
		push	L1168_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1140_model_finished__hla_

L1125_model_satisfied_11__hla_:
		push	L1182_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1140_model_finished__hla_

L1140_model_finished__hla_:
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


