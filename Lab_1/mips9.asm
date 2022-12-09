.data
	myArr: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	other: .space 40 # "new" Array
.text
main:	li $t0, 0
	li $t1, 40
	
loop1:	beq $t0, $t1, ex1
	#reverse in another other array
	lw $s0, myArr($t0)
	sub $t2, $t1, $t0
	addi $t2, $t2, -4
	sw $s0, other($t2)
	addi $t0, $t0, 4
	j loop1
	
ex1: li $t0, 0

loop2:	beq $t0, $t1, check
	#put the other back to myArr
	lw $s0, other($t0)
	sw $s0, myArr($t0)
	
	addi $t0, $t0, 4
	j loop2
	
check:
	li $t0, 0
	li $t1, 10
	la $s0, myArr
	j print
	
print:
	beq $t0, $t1, ex2
	lw $a0, 0($s0)
    	li $v0, 1
    	syscall
    	li $a0, ' '
	li $v0, 11
    	syscall
    	addi $s0, $s0, 4
    	addi $t0, $t0, 1
    	j print
	
ex2:	
	li $v0, 10 #terminate session
	syscall