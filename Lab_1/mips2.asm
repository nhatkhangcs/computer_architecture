.data
	 greeting: .asciiz "Input 2 integers: "

# Main body
.text
main:
	#PRINT COMMAND
 	li $v0, 4
 	la $a0, greeting #print greet commands
 	syscall

	# INPUT FIRST INTEGER
        li $v0, 5 
        syscall
        move $t0, $v0 #Store 1st int in $t0

	# INPUT SECOND INTEGER
        li $v0,5
        syscall
        move $t1, $v0 #Store 2nd int in $t1

        add $a0, $t1, $t0 
        li $v0, 1
        syscall
        li $v0, 10 # terminate session
        syscall
