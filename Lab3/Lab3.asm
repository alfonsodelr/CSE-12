.macro exit #macro to exit program
	li a7, 10
	ecall
	.end_macro	

.macro print_str(%string1) #macro to print any string
	li a7,4 
	la a0, %string1
	ecall
	.end_macro
	
	
.macro read_n(%x)#macro to input integer n into register x
	li a7, 5
	ecall 		
	#a0 now contains user input
	addi %x, a0, 0
	.end_macro
	

.macro 	file_open_for_write_append(%str)
	la a0, %str
	li a1, 1
	li a7, 1024
	ecall
.end_macro
	
.macro  initialise_buffer_counter
	#buffer begins at location 0x10040000
	#location 0x10040000 to keep track of which address we store each character byte to 
	#actual buffer to store the characters begins at 0x10040008
	
	#initialize mem[0x10040000] to 0x10040008
	addi sp, sp, -16
	sd t0, 0(sp)
	sd t1, 8(sp)
	
	li t0, 0x10040000
	li t1, 0x10040008
	sd t1, 0(t0)
	
	ld t0, 0(sp)
	ld t1, 8(sp)
	addi sp, sp, 16
	.end_macro
	

.macro write_to_buffer(%char)
	
	
	addi sp, sp, -16
	sd t0, 0(sp)
	sd t4, 8(sp)
	
	
	li t0, 0x10040000
	ld t4, 0(t0)#t4 is starting address
	#t4 now points to location where we store the current %char byte
	
	#store character to file buffer
	li t0, %char
	sb t0, 0(t4)
	
	#update address location for next character to be stored in file buffer
	li t0, 0x10040000
	addi t4, t4, 1
	sd t4, 0(t0)
	
	ld t0, 0(sp)
	ld t4, 8(sp)
	addi sp, sp, 16
	.end_macro

.macro fileRead(%file_descriptor_register, %file_buffer_address)
#macro reads upto first 10,000 characters from file
	addi a0, %file_descriptor_register, 0
	li a1, %file_buffer_address
	li a2, 10000
	li a7, 63
	ecall
.end_macro 

.macro fileWrite(%file_descriptor_register, %file_buffer_address,%file_buffer_address_pointer)
#macro writes contents of file buffer to file
	addi a0, %file_descriptor_register, 0
	li a1, %file_buffer_address
	li a7, 64
	
	#a2 needs to contains number of bytes sent to file
	li a2, %file_buffer_address_pointer
	ld a2, 0(a2)
	sub a2, a2, a1
	
	ecall
.end_macro 

.macro print_file_contents(%ptr_register)
	li a7, 4
	addi a0, %ptr_register, 0
	ecall
	#entire file content is essentially stored as a string
.end_macro
	


.macro close_file(%file_descriptor_register)
	li a7, 57
	addi a0, %file_descriptor_register, 0
	ecall
.end_macro

.data
	prompt1: .asciz  "Enter n (must be greater than 0):"
	error_msg: .asciz "Invalid Entry!"
	outputMsg: .asciz  " display pattern saved to lab3_output.txt "
	newline: .asciz  "\n"  #this prints a newline
	star: .asciz "*"
	blackspace: .asciz " " 
	filename: .asciz "lab3_output.txt"


.text

	file_open_for_write_append(filename)
	#a0 now contaimns the file descriptor (i.e. ID no.)
	#save to t6 register
	addi t6, a0, 0
	
	initialise_buffer_counter
	
	#for utilsing macro write_to_buffer, here are tips:
	#0x2a is the ASCI code input for star(*)
	#0x20  is the ASCI code input for  blankspace
	#0x0a  is the ASCI code input for  newline (/n)
	
	
	#START WRITING YOUR CODE FROM THIS LINE ONWARDS
	#DO NOT use the registers a0, a1, a7, t6, sp anywhere in your code.
	
	#................ your code here..........................................................#
	
	li t1, 1 #index i
	li t2, 0 #index j
	li t3, 0 #holds 0
	
	top:
	
	print_str(prompt1)
	
	li t3, 0
	
	read_n(t0)
	
	ble t0, t3, invalid_input
	
	addi t0, t0, 1
	
	Loop_Condition:
	blt t1, t0, Loop_Body
	b End_Loop
	
	Loop_Body:
	
	#######################--Inner Loop Begin--############################
	
	li t3, 0
	
	beq t1, t3, Special_Case
	addi t3, t3, 1
	beq t1, t3, Special_Case
	
	
	addi t3, t1, 1
	
	beq t3, t0, Special_Case
	
	Normal_Case:
	
	write_to_buffer(0x2a) #writes "*"
	print_str(star)
	addi t2, t2, 2
	
	Inner_Loop_Condition_B:
	blt t2, t1, Inner_Loop_Body_B
	b Normal_Case_End

	Inner_Loop_Body_B:
	write_to_buffer(0x20) #writes " "
	print_str(blackspace)
	addi t2, t2, 1
	
	b Inner_Loop_Condition_B
	
	Normal_Case_End:
	write_to_buffer(0x2a) #writes "*"
	print_str(star)
	b Inner_Loop_End
	
	Special_Case:
	
	Inner_Loop_Condition_A:
	blt t2, t1, Inner_Loop_Body_A
	b Inner_Loop_End

	Inner_Loop_Body_A:
	write_to_buffer(0x2a) #writes "*"
	print_str(star)
	addi t2, t2, 1
	
	b Inner_Loop_Condition_A
	
	b Inner_Loop_End
	
	Inner_Loop_End:
	
	b end_program
	
	invalid_input: 
	
	print_str(error_msg)
	print_str(newline)
	
	b top
	
	end_program:
	
	#######################--Inner Loop End--##############################
	
	li t2, 0 #reset t2
	
	write_to_buffer(0x0a) #writes "\n"
	print_str(newline)

	addi t1, t1, 1 #iterates our "i"
	
	b Loop_Condition
	
	End_Loop:
	
	#................ your code above here....................................................#
	
	#END YOUR CODE ABOVE THIS COMMENT
	#Don't cvhange anything below this comment!
	
	#write null character to end of file
	write_to_buffer(0x00)
	
	#write file buffer to file
	fileWrite(t6, 0x10040008,0x10040000)
	addi t5, a0, 0
	
	print_str(newline)
	print_str(outputMsg)
	
	exit
	
	#write_to_buffer(0x20) #writes " "
	#write_to_buffer(0x2a) #writes "*"
	#write_to_buffer(0x0a) #writes "\n"
	

