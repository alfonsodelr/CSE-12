totalIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for  a0
	bnez a1, totalIncome_fileNotEmpty
	li a0, 0
	ret

totalIncome_fileNotEmpty:
	
	#####----Reg Preservation----####
	#t1, t2, a0, a2
	addi sp, sp, -32
	sd ra, 0(sp)
	sd t1, 8(sp)
	sd t2, 16(sp)
	sd a2, 24(sp)
	#####----Reg Preservation----####
	
	#init
	li t1, 0 #Total Sum
	li t2, 0 #index
	addi a2, a0, 0 #temp storage for file record pointer
	addi a2, a2, 4
	
	_Condition:
	lw t0, (a2)
	beq t2, a1, _End
	
	_Body:
	addi a0, t0, 0
	jal income_from_record
	add t1, t1, a0
	
	_Update:
	addi t2,t2,1
	addi a2,a2,8
	b _Condition
	
	_End:
	
	addi a0, t1, 0
	
	#####----Reg Preservation----####		
	ld ra, 0(sp)
	ld t1, 8(sp)
	ld t2, 16(sp)
	ld a2, 24(sp)
	addi sp, sp, 32
	#####----Reg Preservation----####

# End your  coding  here!
	
	ret
#######################end of nameOfMaxIncome_totalIncome###############################################
