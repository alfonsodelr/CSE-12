		label	L806_iValue1__hla_ byte
		db	00h
		label	L807_iValue2__hla_ byte
		db	00h
		label	L808_iValue3__hla_ byte
		db	00h
		label	L809_iValue4__hla_ byte
		db	00h
		label	L811_iReturnAddress__hla_ dword
		rb	4
		label	L812_iRegisterValue__hla_ dword
		rb	4
		label	L813_iTemporary__hla_ word
		rb	2
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
