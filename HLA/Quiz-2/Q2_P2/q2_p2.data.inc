		label	L806_a__hla_ byte
		db	00h
		label	L807_b__hla_ byte
		db	00h
		label	L808_c__hla_ byte
		db	00h
		label	L809_d__hla_ byte
		db	00h
		label	L811_iReturnAddress__hla_ dword
		rb	4
		label	L812_iRegisterValue__hla_ dword
		rb	4
		label	L813_iTemporary__hla_ word
		rb	2
		label	L814_iGreatest__hla_ byte
		rb	1
		label	L815_iGreatest_ab__hla_ byte
		rb	1
		label	L816_iGreatest_cd__hla_ byte
		rb	1
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
