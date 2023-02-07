		label	L806_a__hla_ dword
		dd	 0.00000000e+00
		label	L807_b__hla_ dword
		dd	 0.00000000e+00
		label	L808_c__hla_ dword
		dd	 0.00000000e+00
		label	L809__Bsquared__hla_ dword
		dd	 0.00000000e+00
		label	L810__negative_B__hla_ dword
		dd	 0.00000000e+00
		label	L811__4ac__hla_ dword
		dd	 0.00000000e+00
		label	L812__sqrt_disc__hla_ dword
		dd	 0.00000000e+00
		label	L813_discriminant__hla_ dword
		dd	 0.00000000e+00
		label	L814_add_numerator__hla_ dword
		dd	 0.00000000e+00
		label	L815_sub_numerator__hla_ dword
		dd	 0.00000000e+00
		label	L816_denominator__hla_ dword
		dd	 0.00000000e+00
		label	L817_x1__hla_ dword
		dd	 0.00000000e+00
		label	L818_x2__hla_ dword
		dd	 0.00000000e+00
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
