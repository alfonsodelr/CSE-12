maxIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0: heap memory pointer to actual  location of the record stock name in the file buffer

	#if empty file, return 0 for both a0, a1
	bnez a1, maxIncome_fileNotEmpty
	li a0, 0
	ret

 maxIncome_fileNotEmpty:
	
	#####----Reg Preservation----####
	addi sp, sp, -48
	sd t0, 0(sp)
	sd t1, 8(sp)
	sd t2, 16(sp)
	sd t3, 24(sp)
	sd a2, 32(sp)
	sd ra, 40(sp)
	#####----Reg Preservation----####
	
	addi a2, a0, 0 #Storage of file record pointer (for section: find max value's index)
	addi a4, a0, 0 #Storage of file record pointer (for section: return address of name)

	####----Find max value's index----####

	#init
	addi a2, a2, 4 #starts the storage at the int indices
	li t1, 1 #index starts +1 since we set first index to max outside of loop
	li t2, 0 #holds max value (by reference using index) || by default max is set to 0th row's value
	li t3, 0 #holds max converted value
	
	#set up 
	lw t0, (a2) #gets pointer to first int value
	addi a0, t0, 0
	jal income_from_record
	addi t3, a0, 0 #max value is set to first value
	
	_Loop_Condition:
	beq t1, a1 _Loop_End
	
	_Loop_Body:
	
	addi a2,a2,8
	lw t0, (a2)
	
	addi a0, t0, 0
	jal income_from_record
	
	#if max < a0 : a0 is new max #else : max stays
	blt t3, a0, new_max
	b if_end
	
	new_max:
	addi a4, a2, -4
	addi t3, a0, 0 
	addi t2, t1, 0
	
	if_end:
	
	_Loop_Update:
	addi t1,t1,1
	b _Loop_Condition
	
	_Loop_End:
	
	###########----return address of name----###########

	addi a0, a4, 0
	
	#####----Reg Preservation----####
	ld t0, 0(sp)
	ld t1, 8(sp)
	ld t2, 16(sp)
	ld t3, 24(sp)
	ld a2, 32(sp)
	ld ra, 40(sp)
	addi sp, sp, 48
	#####----Reg Preservation----####
	
	#li a0, 0x10040010
	
# End your  coding  here!
	
	ret
#######################end of maxIncome###############################################
