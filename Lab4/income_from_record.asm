income_from_record:
#function to return numerical income from a specific record
#e.g. for record "Microsoft,34\r\n", income to return is 34(for which name is Microsoft)

#arguments: a0 contains pointer to start of numerical income in record 

#function RETURNS income numerical value of the asci income in a0 (34 in our example)
	
#Start your coding from here!

	#####----Reg Preservation----####
	addi sp, sp, -64
	sd t0, 0(sp)
	sd t1, 8(sp)
	sd t2, 16(sp)
	sd t3, 24(sp)
	sd t4, 32(sp)
	sd t5, 40(sp)
	sd t6, 48(sp)
	sd a4, 56(sp)
	#####----Reg Preservation End----####
	
	#init
	li a5, 0 #Total Sum
	li t3, 0 #Count of number's length
	li t4, 0 #index for Loop 2
	li t5, 0 #holds len - 1 to get the exponents of each digit converted
	li t6, 0 #holds the product of each len amount of multiplications by 10 per iteration
	li a4, 13 #holds ascii '\r'
	li t0, 0 #holds pointer to number to be converted
	
	######################
	
	addi t0, a0, 0
	
	####----Counts length of number----####
	
	#condition
	Condition: 
	lbu t2, (t0)
	beq t2, a4, End_Loop
	
	Loop_Body:
	addi t3, t3, 1
	
	Update:
	addi t0, t0, 1
	b Condition
	
	End_Loop:
	
	####----End of length count----####
	
	li a4, 10 #constant 10
	li t2, 0 #singular char value from each whole number string
	li t5, 0 
	
	addi t0, a0, 0
	addi t5, t3, -1 
	
	
	Loop2_Condition:
	li t6, 1
	beq t4, t3, Loop2_End
	
	Loop2_Body:
	
	li t1, 0
	pow_condition:
	beq t1, t5, pow_end
	
	pow_body:
	mul t6, t6, a4
	
	pow_update:
	addi t1, t1, 1
	b pow_condition
	
	pow_end:
	
	lbu t2, (t0)
	addi t2, t2, -48
	mul t2, t2, t6
	add a5, a5, t2

	Loop2_Update:
	addi t4, t4, 1
	addi t0, t0, 1
	addi t5, t5, -1
	b Loop2_Condition
	
	Loop2_End:
	
	addi a0, a5, 0
	
	#####----Reg Preservation----####
	ld t0, 0(sp)
	ld t1, 8(sp)
	ld t2, 16(sp)
	ld t3, 24(sp)
	ld t4, 32(sp)
	ld t5, 40(sp)
	ld t6, 48(sp)
	ld a4, 56(sp)
	addi sp, sp, 64
	#####----Reg Preservation End----####
	
	
# End your  coding  here!
	ret
	
#######################end of income_from_record###############################################	
