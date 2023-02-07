		label	L806_input__hla_ byte
		db	00h
		label	L807_I__hla_ byte
		db	00h
		label	L808_J__hla_ byte
		db	00h
		label	L809_inner__hla_ byte
		db	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
