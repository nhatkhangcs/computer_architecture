.data
	arr: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	confirm: .asciiz "Array from user loaded! \n"
	result: .asciiz "Sum of elements of given array: "
.text

main:
	addi $t0, $0, 0 
	addi $t1, $0, 0 
	li $v0, 4
	la $a0, confirm # Print confirmation
	syscall
	la $t3, arr # Load address array
	
# While loop to traverse through array
while:
	slti $t4, $t0, 10 # compare with 10, if equal then we stop
	beq $t4, $0, exit 
	
	lw $t4, 0($t3) #load the array[0] into $t4 to sum it up
	add $t1, $t1, $t4 # $t1 is the place to store the sum
	add $t0, $t0, 1 # increase index by 1
	add $t3, $t3, 4 # next address increase by 4
	j while
	
# Print out the result
exit:
	addi $v0, $0, 4
	la $a0, result
	syscall
	li $v0, 1 
	move $a0, $t1
	syscall
	li $v0, 10 #terminate session
	syscall