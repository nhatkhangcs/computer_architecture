.data
	addressPath: .asciiz "E:\\SOFT\\General_Subjects\\computer architecture\\lab\\Lab_3\\input.txt"   # filename for read
	buffer_read: .space 1024
.text
	# OPEN THE FILE
	li $v0, 13 			# system call for open file
	la $a0, addressPath 		# input file name
	li $a1, 0 			# Open for reading (flags are 0: read, 1: write)
	li $a2, 0 			# mode is ignored
	syscall				# open a file (file descriptor returned in $v0)
	move $s6, $v0 			# save the file descriptor
	
	# READ FROM FILE
	li $v0, 14			# system call for read
	move $a0, $s6 			# file descriptor
	la $a1, buffer_read 		# address of buffer read
	li $a2, 1024 			# hardcoded buffer length
	syscall 			# read file
	
	# DECLARE A STRING
	li $v0, 9 			# system call code for dynamic allocation
	li $a0, 1024 			# $a0 contains number of bytes to allocate, let's say its 1024 bytes
	syscall
	
	move $s0, $v0			# s0 hold the address

	li $t3, 0 #first counter
	li $t4, 0 #second counter
	li $t0, 1024  # base on the length of string
	
	Loop:
	lb $t1, buffer_read($t3)   	# Load char in buffer to t1
	sb $t1, 0($s0)			# Copy data in buffer to dynamic allocate memory
	
	li $v0, 11			# character to print
	move $a0, $t1
	syscall
	
	addi $t3, $t3, 1		# Increase index in buffer
	addi $s0, $s0, 1		# Increase index in dynamic memory
	bne $t3, $t0, Loop
	j exit

exit:
	li $v0, 10			#terminate
	syscall