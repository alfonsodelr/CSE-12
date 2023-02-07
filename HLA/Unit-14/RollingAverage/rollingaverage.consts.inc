
		align	4
		label	L825_len__hla_ word
		dd	012h
		dd	012h
		label	L825_str__hla_ byte
		db	"enter data point: "
		db	0

		db	0
		label	L858_fpconst__hla_ tword
		dt	 1.00000000000000000e+0000

		align	4
		label	L872_len__hla_ word
		dd	012h
		dd	012h
		label	L872_str__hla_ byte
		db	"rolling average = "
		db	0

		db	0

		align	4
		label	L886_len__hla_ word
		dd	0bh
		dd	0bh
		label	L886_str__hla_ byte
		db	"more data? "
		db	0


		align	4
		label	L900_len__hla_ word
		dd	018h
		dd	018h
		label	L900_str__hla_ byte
		db	"final rolling average = "
		db	0

		db	0
		db	0
		db	0
