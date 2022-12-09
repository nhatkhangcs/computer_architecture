.data
     text:  .asciiz "Enter a number: "
     res: .asciiz "The result after adding 1 is: "
.text

 main:
#OUTPUT STRING
    li $v0, 4
    la $a0, text
    syscall
    
#READ STRING
    li $v0, 5
    syscall
    add $s0, $0, $v0
    
#OUTPUT STRING
    li $v0, 4
    la $a0, res
    syscall
    
# ADD 1 AND PRINT IT OUT
    addi $a0, $s0, 1
    li $v0, 1 
    syscall
    
    li $v0, 10 #terminate execution
    syscall
