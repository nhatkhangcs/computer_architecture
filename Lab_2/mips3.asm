.data
     	text:  .asciiz "Enter the elements: "
	space: .word 10
.text
	li $t0, 0 	#t0 counter
	li $s3, 0 	#s3, size of array
	la $s0, space 	#s0: array
	move $s1, $s0 	#s1 pointer for array
	move $s2, $s0 	#different pointer for array
main:
	beq $t0,10, pre
    	li $v0, 4
    	la $a0, text
    	syscall
    
    	li $v0, 5
    	syscall
    	sw $v0, 0($s1)
    	addi $s1,$s1,4
    	addi $t0,$t0,1
    	j main
    	
    	# Algorithm: Use bubble sort from the first indexes, we increase up and count the number of iterations
pre: 				# setting elements
	subi $s1,$s1,4 		# make the $s1 point to the last elements
	li $t0,0
	li $t2,0
second_iter: 
	beq $s3,9, done 	# stopping condition: when there are enough number of iterations (can be understanded as 2nd iteration)
	subi $s1,$s1, 36 	# $s1 now points to the first elements
	addi $s3,$s3, 1 	# increase 1 ("keepTrack" variable)
	li $t0, 0 		# initialize
fisst_iter:
	beq $t0, 9, second_iter	# first iteration
	lw $t1,0($s1)		# first element
	lw $t2,4($s1)		# second element
	bgt $t2, $t1, swap	# compare and swap
jump_back:																																																								
	addi $s1,$s1,4		# shift up the array
	addi $t0,$t0,1		# increase iteration
	j fisst_iter	
swap:
	sw $t2, 0($s1)
	sw $t1, 4($s1)
	j jump_back 		# jump back
done:
	beq $t5, 10, exit	# print here
	lw $t4, 0($s0)
	addi $v0, $0, 1 
	add $a0, $t4, $0
	syscall
	li $a0,' '
	li $v0,11
	syscall
	
	addi $t5, $t5, 1
	addi $s0, $s0, 4
	j done
exit:		
	li $v0, 10 #terminate execution
    	syscall
