.data
	input: .asciiz "Please input 5 distinct integers: \n"
	result: .asciiz "The reverse sequence is: \n"
	blank: .asciiz " "

.text
main:
	# Print command
	li $v0, 4
	la $a0, input
	syscall
	
	# Input 5 integers
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 5
	syscall
	
	move $s1, $v0
	li $v0, 5
	syscall
	
	move $s2, $v0
	li $v0, 5
	syscall
	
	move $s3, $v0
	li $v0, 5
	syscall
	
	move $s4, $v0
	
	# Reverse process
	# THE IDEA IS JUST SEUQUENCIALLY MOVE THE VALUE IN REVERSED ORDER
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $s4
	syscall
	
	li $v0, 4
	la $a0, blank
	syscall	
	
	li $v0, 1
	move $a0, $s3
	syscall
	
	li $v0, 4
	la $a0, blank
	syscall	
	
	li $v0, 1
	move $a0, $s2
	syscall
	
	li $v0, 4
	la $a0, blank
	syscall	
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, blank
	syscall	
		
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 10 #terminate session
	syscall