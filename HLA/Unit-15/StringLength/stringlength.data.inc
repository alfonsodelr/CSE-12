		label	L807_dReturnAddress__hla_ dword
		rb	4
		label	L808_wDIRegister__hla_ word
		dw 	00h
		label	L809_wDXRegister__hla_ word
		dw 	00h
		label	L810_dEAXRegister__hla_ dword
		dd	00h
		label	L811_dEBXRegister__hla_ dword
		dd	00h
		label	L812_dECXRegister__hla_ dword
		dd	00h
		label	L813_sData__hla_ dword
		rb	4
		label	L817_dReturnAddress__hla_ dword
		rb	4
		label	L818_wDXRegister__hla_ word
		dw 	00h
		label	L819_dEBXRegister__hla_ dword
		dd	00h
		label	L822_input__hla_ dword
		dd	 0.00000000e+00
		label	L823_stringData__hla_ byte
		rb	11
		label	L824_stringDataLen__hla_ word
		dw 	0ah
		label	L825_main_count__hla_ byte
		db	00h
		label	L827_iReturnAddress__hla_ dword
		rb	4
		label	L828_EBXRegister__hla_ dword
		dd	00h
		label	L829_DXRegister__hla_ word
		dw 	00h
		label	L830_count__hla_ byte
		db	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
