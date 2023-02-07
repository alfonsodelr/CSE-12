		label	L806_a__hla_ word
		dw 	00h
		label	L807_b__hla_ word
		dw 	00h
		label	L808_c__hla_ word
		dw 	00h
		label	L810_iReturnAddress__hla_ dword
		rb	4
		label	L811_EDXRegister__hla_ dword
		dd	00h
		label	L812_ECXRegister__hla_ dword
		dd	00h
		label	L813_EBXRegister__hla_ dword
		dd	00h
		label	L814_EAXRegister__hla_ dword
		dd	00h
		label	L815_iTemporary__hla_ byte
		db	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
