income_from_record:
#function to return numerical income from a specific record
#e.g. for record "Microsoft,34\r\n", income to return is 34(for which name is Microsoft)

#arguments: a0 contains pointer to start of numerical income in record 

#function RETURNS income numerical value of the asci income in a0 (34 in our example)
	
# Start your coding from here!
.data
	num: .asciz "Kruger Industrial Smoothing,365\n"
	input: .asciz "\n\n====================================================\n\n"
.text

	li a7, 4
	li t3, 0
	la a0, input
	ecall

	la a0, num
	
	addi t0, a0, 0

	lbu t2, (t0)
	li a7, 11
	addi a0, t2, 0
	ecall
	
	addi t0, t0, 1 #increments
	
	lbu t2, (t0)
	li a7, 11
	addi a0, t2, 0
	ecall
	
	li a7, 4
	la a0, input
	ecall
	
	
# End your  coding  here!
	ret
	
#######################end of income_from_record###############################################	
