.data
	arr: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	confirm: .asciiz "Array from user loaded! \n"
	odd: .asciiz "Sum of odd elements: "
	even: .asciiz "Sum of even elements: "
.text
main:
	la $s0,arr
	li $t4, 1
	move $s1, $s0 # copy address of $s1
	li $v0, 4
	la $a0, confirm
	syscall
	
	lw $t2, 0($s1)
	li $v0, 4
	la $a0, odd # Caculate odd first
 	syscall
 	
# Calculate the sum of odds
li $t2, 0

while_odd:	
	slti $t7, $t4, 10 # compare with 10, if equal then break
	beq $t7, $zero, ex1
	lw $t1, 4($s1)
	add $t2, $t2, $t1 # stores result in $t2
	addi $s1, $s1, 8 # The odds is 8 bytes seperated each
	addi $t4, $t4, 2 #increase index
	
	j while_odd # loop
	
# Exit when finished calculating the sum of odds
ex1:
	move $a0,$t2			
    	li $v0, 1 
    	syscall
	
  	li $a0, '\n'
	li $v0,11
	syscall
	
# Calculate the sum of evens
	li $t4, 0
	addi $t4, $0, 1
	lw $t0, 0($s0)
	li $v0, 4
	la $a0, even
 	syscall
	li $t1, 0
while_even:	
	slti $t7, $t4, 10 # compare with 10, if equal then break
	beq $t7, $zero, Exit
	lw  $t0, 0($s0)
	add $t1, $t0, $t1 # stores result in $t1
	addi $s0, $s0, 8 # The odds is 8 bytes seperated each	
	
	addi $t4, $t4, 2 #increase index by 2
	
	j while_even
	
# Exit when finished calculating the sum of evens
Exit:
    	move $a0,$t1			
    	li $v0, 1
    	syscall
    	
    	li $v0, 10 #terminate execution
    	syscall
