.data
	arr: .asciiz "Input 10 elements: "
	list: .space 40
	strB: .asciiz "\nThe result: "
.text

main:
	la $s0, list
	li $s2, 0
	li $s3, 10
	
	# PRINT COMMAND
    	li $v0, 4
    	la $a0, arr
    	syscall
	move $s1, $s0
	
read_user:
	li $v0, 5
	syscall
	
	sw $t0, 0($s1) #store into the first element of the list
	add $t1, $t1, $v0 #Sum into $t1 ()SIMULTANEOUSLY)
	addi $s2, $s2, 1
	addi $s1, $s1, 4
	
	beq $s2, $s3, end_read
	j read
	
end_read_user:
	li $v0, 4
    	la $a0, strB
    	syscall
    	
	move $a0, $t1 	
    	li $v0, 1 
    	syscall

    	li $v0, 10 #terminate execution
    	syscall
