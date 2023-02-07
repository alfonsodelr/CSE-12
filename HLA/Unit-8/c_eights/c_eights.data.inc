		label	L806_input_a__hla_ dword
		dd	00h
		label	L807_input_b__hla_ dword
		dd	00h
		label	L808_input_c__hla_ dword
		dd	00h
		label	L809_total_sum__hla_ dword
		dd	00h
		label	L810_temp_sum__hla_ dword
		dd	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
