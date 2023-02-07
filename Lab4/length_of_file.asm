length_of_file:
#function to find length of data read from file
#arguments: a1=bufferAdress holding file data
#return file length in a0
	
#Start your coding here
	
	#init
	addi t0, a1, 0
	li t3, 0 #count
	lbu t2, (t0)
	
	#condition
	loop_condition:
	lbu t2, (t0)
	beq t2, zero, end_loop #jump to end when index value == 0
	
	#body
	loop_body: #prints each char until null
	addi t3, t3, 1
	
	update:
	addi t0, t0, 1 #increments
	b loop_condition
	
	end_loop:
	
	addi a0, t3, 0 #return value
	
#End your coding here
	ret
#######################end of length_of_file###############################################	
