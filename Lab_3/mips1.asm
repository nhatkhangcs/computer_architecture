.data
       Choice: .asciiz "Pick the shape: \n[1]Circle\n[2]Triangle\n[3]Rectangle\n[4]Square\nInput Your choice: "
       Invalid: .asciiz "Invalid choice! Please choose again\n"
       output: .asciiz "Result: "
       h: .asciiz "Input the h: "
       l: .asciiz "Input the l: "
       b: .asciiz "Input the b: "
       r: .asciiz "Input the r: "
       pi: .float 3.1415926
       half: .float 0.5
       asking: .asciiz "\n\nContinue calculating?? \n[1] - YES \n [Else] - NO\n Your choice is:"
.text

main:
       li $v0, 4
       la $a0, Choice # LET THE USER CHOOSE THE FIGURE
       syscall      
       
       li $v0, 5
       syscall
       move $t0, $v0	# SAVE CHOICE
       
       beq $t0, 1, circle
       beq $t0, 2, triangle
       beq $t0, 3, rectangle
       beq $t0, 4, square
       
       j invalid # NOT 1 2 3 4
       
invalid:
       li $v0, 4
       la $a0, Invalid
       syscall
       j main
       
circle:
        li $v0, 4
	la $a0, r			
	syscall
	
	addi $v0, $0, 6
		
	syscall
	mul.s $f12, $f0, $f0		
	l.s $f4, pi				
	mul.s $f12, $f12, $f4		
	addi $v0, $0, 4		
	la $a0, output	
	syscall
	addi $v0, $0, 2		
	syscall
	j exit
	
triangle:
li $v0, 4
        la $a0, h		
	syscall
	addi $v0, $0, 6		
	syscall
	
	mov.s $f12, $f0			
	
	addi $v0, $0, 4			
	la $a0, b		
	syscall
	addi $v0, $0, 6
	syscall
	
	mul.s $f12, $f12, $f0	
	
	l.s $f4, half
	mul.s $f12, $f12, $f4	
	addi $v0, $0, 4			
	la $a0, output		
	syscall
	addi $v0, $0, 2		
	syscall
	j exit
	
rectangle:
        li $v0, 4
        la $a0, h		
	syscall
	addi $v0, $0, 7			
	syscall
	
	mov.d $f12, $f0			
	
	addi $v0, $0, 4			
	la $a0, b		
	syscall
	addi $v0, $0, 7	
	syscall
	
	mul.d $f12, $f12, $f0		
	
	addi $v0, $0, 4			
	la $a0, output		
	syscall
	addi $v0, $0, 3			
	syscall
	j exit
	
square:
        li $v0, 4
        la $a0, l		
	syscall
	addi $v0, $0, 7			
	syscall
	
	mov.d $f12, $f0			
	
	mul.d $f12, $f12, $f12
	
	addi $v0, $0, 4			
	la $a0, output		
	syscall
	addi $v0, $0, 3			
	syscall
	j exit
	
exit:
        li $v0, 4
        la $a0, asking
        syscall
        li $v0, 5
        syscall
        beq $v0, 1, main
        li $v0, 10
	syscall
