.data
	#a) Synthetic array
	arr: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	confirm: .asciiz "Array from user loaded! \n"
	result: .asciiz "Value of element "
	text:  .asciiz "Enter a index: "
.text

main:
# LOAD THE ARRAY
	addi $t0, $0, 0 
	addi $t1, $0, 0 
	addi $t2, $0, 10 
	la $s0, arr
	li $v0, 4
	la $a0, confirm
	syscall
	
#GET THE INDEX FROM USER
	li $v0, 4
    	la $a0, text
    	syscall
    
    	li $v0, 5
    	syscall

# We start to shift the array to the left until we get desired element
    	move $t0, $v0
    	move $t5, $t0
    	sll $t0, $t0, 2 # Shidft 2 byte to the left and add to the array
    	add $s0, $s0, $t0
 
    	li $v0, 4 
	la $a0, result
	syscall
	
	move $a0, $t5
    	li $v0, 1 
    	syscall
    	
    	li $a0,':'
	li $v0,11
	syscall
	
	li $a0, ' '
	li $v0, 11
	syscall
	
	lw $a0, 0($s0)
    	li $v0, 1 
    	syscall
    	
	li $v0, 10 # terminate session
	syscall