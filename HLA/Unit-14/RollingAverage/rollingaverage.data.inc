		label	L806_input__hla_ dword
		dd	 0.00000000e+00
		label	L807_roll_av__hla_ dword
		dd	 0.00000000e+00
		label	L808_choice__hla_ byte
		db	00h
		label	L809_sum__hla_ dword
		dd	 0.00000000e+00
		label	L810_count__hla_ dword
		dd	 1.00000000e+00
		label	L811_prev_sum__hla_ dword
		dd	 0.00000000e+00
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
