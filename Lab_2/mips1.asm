.data
	sample: .asciiz "Ho Chi Minh City - University of Technology"
	li $t0, 43
.text
main:
	la $s0, sample
	move $t1, $t0
	li $s1, 42
	li $t2, -1
	
	call:
		beq $s1, $t2, exit
		
		add $t1, $s0, $s1 
		lb $a0, 0($t1)
		li $v0, 11
		
		syscall
		
		addi $s1, $s1, -1
		j call
	
	exit:

	li $v0, 10
	syscall
