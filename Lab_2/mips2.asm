.data

     	text:  .asciiz "Enter a positive number: "
	again1:  .asciiz "It is negative input, try again \n"
	space: .asciiz " "
.text

li $t4, 0
li $t0, 0
li $t1, 1
li $t2, 2 # base
li $t3, 0

 main:
    	li $v0, 4
    	la $a0, text
    	syscall
    
    	li $v0, 5
    	syscall
    	move $s0, $v0
	
	blt $s0, 0, again
	
	jal fib
	
exit:
	
	li $v0, 10 #terminate execution
    	syscall
 	
    	# n in s0
    	# result store in $t0
fib:
	li $a0, 0
	la $v0, 1
	syscall
	
	li $v0, 4
	la $a0, space
    	syscall
	bne $s0, $t1, second
	li $a0, 0
	jr $ra
	
again:
    	li $v0, 4
	la $a0, again1
    	syscall
   
    	
    	j main
   	
second:
    	li $a0, 1
	li $v0, 1
    	syscall
    	
    	  li $v0, 4
	la $a0, space
    	syscall
    	addi $s1, $s0, 0
    	addi $s1, $s1, -2
	bne $s0, $t2, fib_loop
    	
    	
    	jr $ra
	
fib_loop:	
	beq $s1, $t4, exit
	add $t3, $t0, $t1
	move $a0, $t3
	move $t0, $t1
	move $t1, $t3
	
	li $v0, 1
    	syscall
    	
    	li $v0, 4
	la $a0, space
    	syscall
    	
    	addi $s1, $s1, -1
    	
    	j fib_loop
	
