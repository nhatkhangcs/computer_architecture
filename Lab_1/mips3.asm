.data
	 greeting: .asciiz "Input 4 integers a, b, c, d: \n"
	 f: .asciiz "f = "
	 g: .asciiz "\ng = "
# Main body
.text
main:
 	# Print command
 	li $v0, 4
 	la $a0, greeting
 	syscall
	
	# Load 4 integers in:
        li $v0, 5 
        syscall
        move $t0,$v0

        li $v0, 5
        syscall
        move $t1,$v0
        
        li $v0, 5
        syscall
        move $t2,$v0
        
        li $v0, 5
        syscall
        move $t3,$v0

	# a) Calculate f = (a + b) - (c - d - 2)
	li $v0, 4
	la $a0, f
 	syscall

        add $s0, $t1, $t0 # Now $s0 stores a + b
       	sub $s1, $t2, $t3 # Now $s1 stores c - d
       	addi $s1, $s1, -2 # Now $s1 stores c - d - 2
       	sub $a0, $s0, $s1 # Now $a0 stores (a + b) - (c - d - 2)
        li $v0, 1
        syscall
        
        # b) Calculate g = (a + b) * 3 - (c + d) * 2
        li $v0, 4
	la $a0, g
 	syscall
        add $s1, $t2, $t3 # Now $s1 stores c + d
       	sll $s1,$s1,1 # Multiply with 2 (shift 1 bit left) --> $s1 stores (c + d) * 2
       	
       	sll $s3,$s0,1 # We previously stores $s0 in a + b, now we use it again to * 2
       	add $s0, $s3, $s0 # Now $s0 stores (a + b) * 3
       	
       	#Subtract and store result in $a0
       	sub $a0, $s0,$s1
       	li $v0, 1
       	syscall
       	
        li $v0, 10 #terminate session
        syscall