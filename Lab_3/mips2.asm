.data
       requirement: .asciiz "Please input the following value to calculate the integral\n-------------\n"
       u: "Please input value of lower bound u: "
       v: "Please input value of upper bound v: "
       a: "Please input value of a: "
       b: "Please input value of b: "
       c: "Please input value of c: "
       output: .asciiz "Result: "
       range: .asciiz "Input the divide range: "
       zero_float: .float 0.0
.text
main:
       li $v0, 4
       la $a0, requirement
       syscall      
	
input:
        li $v0, 4
        la $a0, u		
	syscall
	
	li $v0, 6	
	syscall
	
	mov.s $f1, $f0		# $f1 store upper
	
	li $v0, 4
        la $a0, v
	syscall
	
	li $v0, 6		
	syscall
	mov.s $f2, $f0		# $f2 store lower
	
	li $v0, 4
	la $a0, a
	syscall
	
	li $v0, 6	
	syscall
	mov.s $f3, $f0		# $f3 store a
	
	li $v0, 4
	la $a0, b	
	syscall
	
	li $v0, 6		
	syscall
	mov.s $f4, $f0		# $f4 store b
	
	li $v0, 4
	la $a0, c
	syscall
	addi $v0, $0, 6		
	syscall
	mov.s $f5, $f0		# $f5 store c
	
	li $v0, 4
	la $a0, range
	syscall
	li $v0, 6		
	syscall
	mov.s $f10, $f0		# $f7 store range
	
process:
	sub.s $f0,$f2,$f1	
	div.s $f6,$f0,$f10	# this is the length of rectangle
	addi $t0,$t0,1
	mtc1 $t0,$f13
	cvt.s.w $f13,$f13
	
	j area
exit:	
	
	la $a0, output
	li $v0, 4
	
	syscall

	mov.s $f12,$f9
	
	li $v0,2
	syscall
	
	
	li $v0,10
	syscall
area:
	c.eq.s	$f11,$f10
	bc1t exit
	add.s $f11,$f11,$f13	# precision
	
	mul.s $f7,$f1,$f1	# x^2
	
	mul.s $f7,$f7,$f3	# ax^2
	
	mul.s $f8,$f1,$f4	# bx
	
	add.s $f7,$f7,$f8	# ax^2 + bx
	add.s $f7,$f7,$f5	# ax^2 + bx + c
	
	mul.s $f8,$f6,$f7	# area
	
	add.s $f9,$f9,$f8	# add to the sum
	
	add.s $f1,$f1,$f6	# increase range of x
	
	j area