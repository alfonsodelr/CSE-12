		label	L806_input__hla_ dword
		dd	00h
		label	L807_smallest__hla_ dword
		dd	00h
		label	L808_biggest__hla_ dword
		dd	00h
		label	L809_total_num__hla_ dword
		dd	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
