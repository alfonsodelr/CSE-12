
		align	4
		label	L823_len__hla_ word
		dd	023h
		dd	023h
		label	L823_str__hla_ byte
		db	"Gimme a decimal value to use as n: "
		db	0


		align	4
		label	L845_len__hla_ word
		dd	01bh
		dd	01bh
		label	L845_str__hla_ byte
		db	"Here's the looping values: "
		db	0


		align	4
		label	L869_len__hla_ word
		dd	01h
		dd	01h
		label	L869_str__hla_ byte
		db	" "
		db	0

		db	0
		db	0

		align	4
		label	L885_len__hla_ word
		dd	024h
		dd	024h
		label	L885_str__hla_ byte
		db	"Here's the sum of all those digits: "
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L913_len__hla_ word
		dd	010h
		dd	010h
		label	L913_str__hla_ byte
		db	"Program Finished"
		db	0

		db	0
		db	0
		db	0
