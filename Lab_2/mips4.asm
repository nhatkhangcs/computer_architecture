.data
        array: .word  23,3,4,5,6,7,9,0,2,-2
        confirm: .asciiz "Array initialized\n"
        output: .asciiz "Result = "
        

.text
main:
	li $t2, 1
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
sumr:
	addi	$sp, $sp, -8	# make room for 2 elements
	sw 	$ra, 4($sp)	
	sw	$a0, 0($sp)	
        bne	$a1, $t2, rec	# 
	lw	$t0, 0($a0)	
	move	$v0, $t0	
	addi 	$sp, $sp, 8	
        jr	$ra

rec:
	addi	$a1, $a1, -1
	addi	$a0, $a0, 4
	jal 	sumr
	lw	$ra, 4($sp)		
	lw	$a0, 0($sp)
	lw	$t5, 0($a0)

        addi	$sp, $sp, 8
	add 	$v0, $v0, $t5
	jr	$ra	
	
	# ----------------------- end recursive part ----------------------- #
