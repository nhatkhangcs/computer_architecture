.data
        array: .word  3, 6, 7, 20, -2, 4, 5, -8, 10, 1
        confirm: .asciiz "Array initialized\n"
        output: .asciiz "Result = "
        
.text
main:
	li $t2, 2
	la $a0, confirm
	li $v0, 4
	syscall
				 
	la	$a0, array		
	li	$a1, 10	

	jal	sumr		
	sw	$v0, 4($sp)	# we get the result in $v0

	li	$v0, 4
	la	$a0, output
	syscall

	li	$v0, 1
	lw	$a0, 4($sp)
	syscall

	lw	$ra, 0($sp)	
	add	$sp,$sp, 8	
	
        
        li $v0, 10
	syscall
	
	# ----------------------- recursive part ----------------------- #
	# Algorithm: max(arr) = max(arr[0], max(arr[1] -> arr[n - 1])) = ...
sumr:
	addi	$sp, $sp, -8		# make room for 2 elements
	sw 	$ra, 4($sp)	
	sw	$a0, 0($sp)	
        bne	$a1, $t2, rec	
        
	lw	$t0, 0($a0)	
	lw	$t4, 0($a0)
	lw 	$t5, 4($a0)
	
	addi	$a0, $a0, -4
        addi	$sp, $sp, 8
        sgt	$t6, $t4, $t5		# two elements is enough
        beq	$t6, $zero, swap

back:
	move	$v0, $t4
        jr	$ra

rec:
	addi	$a1, $a1, -1
	addi	$a0, $a0, 4
	jal 	sumr
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	lw	$t4, 0($a0)
	lw 	$t5, 4($a0)
	
        addi	$sp, $sp, 8
        sgt	$t6, $t4, $t5
        beq	$t6, $zero, swap
	j	back
	
swap:
	sw 	$t4, 4($a0)
	sw 	$t5, 0($a0)
	lw	$t4, 0($a0)
	lw 	$t5, 4($a0)
	j	back
	
	# ----------------------- end recursive part ----------------------- #
