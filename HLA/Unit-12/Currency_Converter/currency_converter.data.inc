		label	L806_input__hla_ dword
		dd	 0.00000000e+00
		label	L807_output__hla_ dword
		dd	 0.00000000e+00
		label	L808_pounds__hla_ dword
		dd	 7.40300000e-01
		label	L809_pesos__hla_ dword
		dd	 2.05646997e+03
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
