.data
	xcommand: .asciiz "Player X turn! Please input your column: "
	ocommand: .asciiz "Player O turn! Please input your column: "
	welcome: .asciiz "      o__ __o        o__ __o        o          o    o          o    o__ __o__/_   o__ __o    ____o__ __o____       o__ __o__/_   o__ __o        o         o    o__ __o       \n     /v     v\\      /v     v\\      <|\\        <|>  <|\\        <|>  <|    v       /v     v\\    /   \\   /   \\       <|    v       /v     v\\      <|>       <|>  <|     v\\      \n    />       <\\    />       <\\     / \\\\o      / \\  / \\\\o      / \\  < >          />       <\\        \\o/            < >          />       <\\     / \\       / \\  / \\     <\\     \n  o/             o/           \\o   \\o/ v\\     \\o/  \\o/ v\\     \\o/   |         o/                    |              |         o/           \\o   \\o/       \\o/  \\o/     o/     \n <|             <|             |>   |   <\\     |    |   <\\     |    o__/_    <|                    < >             o__/_    <|             |>   |         |    |__  _<|      \n  \\\\             \\\\           //   / \\    \\o  / \\  / \\    \\o  / \\   |         \\\\                    |              |         \\\\           //   < >       < >   |       \\     \n    \\         /    \\         /     \\o/     v\\ \\o/  \\o/     v\\ \\o/  <o>          \\         /         o             <o>          \\         /      \\         /   <o>       \\o   \n     o       o      o       o       |       <\\ |    |       <\\ |    |            o       o         <|              |            o       o        o       o     |         v\\  \n     <\\__ __/>      <\\__ __/>      / \\        < \\  / \\        < \\  / \\  _\\o__/_  <\\__ __/>         / \\            / \\           <\\__ __/>        <\\__ __/>    / \\         <\\ \n"

	board: .asciiz "            -------------------------------------------------------------------------------------  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            -------------------------------------------------------------------------------------  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            -------------------------------------------------------------------------------------  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            -------------------------------------------------------------------------------------  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            -------------------------------------------------------------------------------------  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            -------------------------------------------------------------------------------------  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            |           |           |           |           |           |           |           |  \n            -------------------------------------------------------------------------------------  \n                  __        ___         ____       _  _        _____         __        ______      \n                 /_ |      |__ \\       |___ \\     | || |      | ____|       / /       |____  |     \n                  | |         ) |        __) |    | || |_     | |__        / /_           / /      \n                  | |        / /        |__ <     |__   _|    |___ \\      | '_ \\         / /       \n                  | |       / /_        ___) |       | |       ___) |     | (_) |       / /        \n                  |_|      |____|      |____/        |_|      |____/       \\___/       /_/         \n"
	
	cen_dist_hori: .word 12						# distance between two horizontal center at adjacent square

	bet_row_dis: .word 100						# distance between two row with array-bassed

	bet_board_row_dis: .word 600					# distance between two adjacent row in board
	
	warning: .asciiz "Your input column is invalid and is counted as a violation. Please input column again!\n\n\n"

	dist_first_cen_hori: .word 17

	dist_first_cen_vert: .word 301
	
	first_player_violation: .asciiz "X player's violation: "
	second_player_violation: .asciiz "O player's violation: "
	
	first_player_undo: .asciiz "X player's undo time left: "
	second_player_undo: .asciiz "O player's undo time left: "

	one_endl: .asciiz "\n"
	multiple_endl: .asciiz "\n\n\n\n\n\n"
	
	player1ask: .asciiz "   Player 1 PLAY FIRST, which piece do you want to play? 0 for [X] and other keyboards for [O]: "
	player2ask: .asciiz "   Player 2 PLAY FIRST, which piece do you want to play? 0 for [X] and other keyboards for [O]: "

	compound: .asciiz "XO"
	
	undo_ask: .asciiz "Do you want to undo? Type '1' for 'YES', type other keyboards for 'NO': "
	
	vectorX: .word -1, 1, -1, 1, -1,  1, 0,  0	#check win horizontally
	vectorY: .word -1, 1,  0, 0,  1, -1, 1, -1	#check win vertically
	
	lost_violation: .word 3
	
	yes: .word 1
	size: .word 42
	
	maxrow: .word 6
	
	playerXwin: .asciiz "Player X wins!"
	playerOwin: .asciiz "Player O wins!"
	draw: .asciiz "It's a draw"

.text
	li $s0, 0
	li $s6, 0							# first player violation time
	li $s7, 0							# second player violation time
	li $s4, 3							# first player undo time
	li $s5, 3							# second player undo time
	li $s6, 0							# wanna undo?
	li $s3, 0							# all counter for draw case
			
									# random $a2
	li $a1, 2
	li $v0, 42
	syscall
	
	move $a2, $a0
	
	la $a0, multiple_endl
	li $v0, 4
	
	syscall
	
	#li $a2, 0							# boolean
	la $a0, welcome							# welcome message
	li $v0, 4		
	
	syscall
	
	la $a0, multiple_endl
	li $v0, 4
	
	syscall
	
	beq $a2, $zero, askPLayer1
	la $a0, player2ask
	li $v0, 4
	
	syscall
	li $v0, 12
	
	syscall
	
	sub $v0, $v0, '0'
	
	bne $v0, $zero, game_loop
	
	xor $a2, $a2, 1
	
	j game_loop

askPLayer1:
	la $a0, player1ask
	li $v0, 4
	
	syscall
	li $v0, 12
	
	syscall
	
	sub $v0, $v0, '0'
	
	beq $v0, $zero, game_loop
	
	xor $a2, $a2, 1
	
	j game_loop
	
load_board:
	la $a0, multiple_endl							# make multiple endline
	li $v0, 4
	
	syscall
	
	la $a0, board								# load board
	li $v0, 4
	
	syscall
	
	la $a0, one_endl
	li $v0, 4
	
	syscall

	
	jr $ra
	
game_loop:
	jal load_board
	
	la $a0, size
	lw $a0, 0($a0)
	
	beq $a0, $s3, draw_end
	
	la $a0, first_player_violation
	li $v0, 4
	
	syscall
	
	move $a0, $s6
	li $v0, 1
	
	syscall
	
	la $a0, one_endl
	li $v0, 4
	
	syscall
	
	la $a0, second_player_violation
	li $v0, 4
	
	syscall
	
	move $a0, $s7
	li $v0, 1
	
	syscall
	
	la $a0, one_endl
	li $v0, 4
	
	syscall
	
	la $a0, first_player_undo
	li $v0, 4
	
	syscall
	
	move $a0, $s4
	li $v0, 1
	
	syscall
	
	la $a0, one_endl
	li $v0, 4
	
	syscall
	
	la $a0, second_player_undo
	li $v0, 4
	
	syscall
	
	move $a0, $s5
	li $v0, 1
	
	syscall
	
	la $a0, one_endl
	li $v0, 4
	
	syscall
	
	bne $a2, $zero, printOturn
	
	la $a0, xcommand
	li $v0, 4
	syscall
	
	j turn
	
printOturn:
	la $a0, ocommand
	li $v0, 4
	syscall
turn:
	
	li $v0, 12
	
	syscall
	
	subi $s0, $v0, '0'
	
	li $s1, 1								# we always start with 1st row, so it's best to initialize it
	
	la $a0, one_endl
	li $v0, 4
	
	syscall
	
	
	#move $s0, $v0								# $s0 stores player input
	bgt $s0, 7, violated							# if x-input > 7 then invalid
	blt $s0, 1, violated							# if x-input < 1 then invalid
	
	j invalid
	
continue_game_loop:
	add $s3, $s3, 1
	la $a0, one_endl
	li $v0, 4
			
	syscall
	
	#li $s1, 1								# s1 = x
	#li $, 6								# s0 = y
	jal get_coordinate
	jal pushing
	
check_time:
	jal winning
	#xor $a2, $a2, 1
	beq $v1, 1, end_game
	xor $a2, $a2, 1
	
	beq $a2, $zero, check_undo_second_player
	beq $s4, $zero, game_loop
	j after_check
	
check_undo_second_player:
	beq $s5, $zero, game_loop
	
after_check:	
	jal load_board
	la $a0, undo_ask
	la $v0, 4
	
	syscall
	
	li $v0, 12
	syscall
	
	
	subi $t9, $v0, '0'
	
	j undo

invalid:
	jal get_coordinate
	la $t1, board
	
	add $t1, $t1, $s2
	lb $t1, 0($t1)
	bne $t1, ' ', violated
	
after_violation:
	j continue_game_loop		
	
get_coordinate:
	addi $sp, $sp, -24
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	sw $t4, 20($sp)

	# Real x coordinate
	la $t0, cen_dist_hori 
	lw $t1, 0($t0)
	addi $t5, $s0, -1							# x - 1
	
	mul $t1, $t1, $t5							# 12(x - 1)
	la $t0, dist_first_cen_hori
	lw $t2, 0($t0)
	add $t3, $t1, $t2							# real_x = 17 + 12(x - 1)
	
	# Real y coordinate
	la $t0, bet_board_row_dis
	lw $t1, 0($t0)
	addi $t5, $s1, -1							# y - 1
	
	mul $t1, $t1, $t5
	la $t0, dist_first_cen_vert
	lw $t2, 0($t0)
	add $t4, $t1, $t2							# real_y = 301 + 600(y - 1)
	
	add $s2, $t3, $t4							# real_coor = real_x + real_y
	
	#jal pushing
	 
	lw $ra, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	lw $t4, 20($sp) 
	
	addi $sp, $sp, 24

	jr $ra

insertX:									# expanding X character here
	# store values in pointer for preservation purpose
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	
	#jal get_coordinate
	
	li $t0, 'X'
	la $a0, bet_row_dis
	lw $t1, 0($a0)
	add $t2, $s2, $t1
	sub $t3, $s2, $t1
	
	#=========== this is for drawing X character ===========
	sb $t0, board+0($s2)
	sb $t0, board+-2($t2)
	sb $t0, board+2($t2)
	sb $t0, board+-2($t3)
	sb $t0, board+2($t3)

	add $t2, $t2, $t1
	sub $t3, $t3, $t1
	
	sb $t0, board+-4($t2)
	sb $t0, board+4($t2)
	sb $t0, board+-4($t3)
	sb $t0, board+4($t3)
	#=========== end drawing X character ===========

	# get all our values back from the stack
	lw $ra, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	addi $sp, $sp, 20
	
	
	jr $ra

insertO:									# expanding O character here
	# store values in pointer for preservation purpose
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	
	#jal get_coordinate
	
	li $t0, 'O'
	la $a0, bet_row_dis
	lw $t1, 0($a0)
	add $t2, $s2, $t1
	sub $t3, $s2, $t1
	
	#=========== this is for drawing O character ===========
	sb $t0, board+0($s2)
	sb $t0, board+4($s2)
	sb $t0, board+-4($s2)
	
	sb $t0, board+-3($t2)
	sb $t0, board+3($t2)
	sb $t0, board+-3($t3)
	sb $t0, board+3($t3)

	add $t2, $t2, $t1
	sub $t3, $t3, $t1
	
	sb $t0, board+0($t2)
	sb $t0, board+-2($t2)
	sb $t0, board+2($t2)
	sb $t0, board+0($t3)
	sb $t0, board+-2($t3)
	sb $t0, board+2($t3)
	#=========== end drawing O character ===========

	lw $ra, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	addi $sp, $sp, 20
	
	jr $ra
	
pushing:
	la $a0, bet_board_row_dis
	lw $t4, 0($a0)
	add $t5, $s2, $t4						# forward to the next destination, with $s2 is the index
	la $a0, board
	addu $t6, $a0, $t5						# we want to check if the destination already contains any character
	lb $t6, 0($t6)
	bne $t6, ' ', insert						# if it does contains char then we will insert
	la $a0, maxrow
	lw $a0, 0($a0)
	beq $s1, $a0, insert
	add $s2, $s2, $t4						# otherwise just move to the the next adjacent row
	addi $s1, $s1, 1
	j pushing
	
insert:
	beq $a2, $zero, here						# if $a2 == 0 then it's first player's turn
									# change value a2 to 0 back
	jal insertO
	j check_time

here:
	jal insertX							# it;s second player's turn
	j check_time

winning:								# now we need consider horizontally, vertically and diagonally (HARD)
									# a2 = row_index(1-6) , a3 = column index (1-7) .  
	addi $sp, $sp, -16
	sw $ra, 0($sp)

	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
									# save inserted coordinate
	move $t3, $s1 							# t3 is const x 
	move $t2, $s0 							# t2 is const y
	
	li $t0, -4 							# t0 is index row col
	
	winning_vect: 							# algo: check for both direction with 2 vectors

		addi $t0, $t0, 4
		beq $t0, 32, end_winning_vect 				
		
		la $a0, yes
		lw $t9, 0($a0)					
		# subi $t9, $t9, '0'					# counter for continuous char

		lw $t4, vectorY($t0) 
		lw $t5, vectorX($t0)

		move $s1, $t3
		move $s0, $t2
		addi $t1, $0, 0
		
	first_direction: 					
		addi $t1, $t1, 1					# increase 1 
		beq $t1, 4, done_first_direction 			# we have 3 dimension : diag, hori, verti
		lw $t4, vectorY($t0) 
		lw $t5, vectorX($t0)
			
		add $s0, $s0, $t4					# y
		add $s1, $s1, $t5					# x
			
		jal get_coordinate					# interact with $s1 and $s0
			
		lb $t7, board+0($s2) 					# get the character
		lb $t8, compound+0($a2) 				# get the current player character

		bne $t7, $t8, done_first_direction 			# if we detect a character that is different from the one we are considering, so we quit the loop with that direction
			
									# same chacter ---> increase 1
		addi $t9, $t9, 1
		j first_direction
			
	done_first_direction:
		
									# opposite direction
		addi $t0, $t0, 4 					# move up (pointer + 1)
		
		lw $t4, vectorY($t0)
		lw $t5, vectorX($t0)
		
		move $s1, $t3
		move $s0, $t2
		li $t1, 0
		
	second_direction:
		addi $t1, $t1, 1
		beq $t1, 4, done_second_direction 		
		lw $t4, vectorY($t0) 
		lw $t5, vectorX($t0)
			
		add $s0, $s0, $t4					# y
		add $s1, $s1, $t5					# x
			
		jal get_coordinate

		lb $t7, board+0($s2) 					# get the character
		lb $t8, compound+0($a2) 				# get the current player character
			
		bne $t7, $t8, done_second_direction 			# if we detect a character that is different from the one we are considering, so we quit the loop with that direction
			
		addi $t9, $t9, 1					# both are same char so we increase counter
		j second_direction
		
	done_second_direction:
		
		blt $t9, 4, winning_vect 				# if number of continuous character is < 4 then continue looping, until there doesnt's exist a connect 4
		
		li $v1, 1						# if connected 4 then return 1	
		j return_endcheck
		
	end_winning_vect:

	li $v1, 0							# not win --> return 0

return_endcheck:
		
	move $s1, $t3
	move $s0, $t2
	
	lw $ra, 0($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	addi $sp, $sp, 16
	jr $ra		
		
end_game:
	jal load_board
	
	bne $a2, $zero, playerOwins
	j playerXwins	

violated:
	beq $a2, $zero, first_player
	addi $s7, $s7, 1
	la $a0, lost_violation
	lw, $a0, 0($a0)
	beq $s7, $a0, wins_by_violation
	#xor $a2, $a2, 1
	li $v0, 55
	la $a0, warning
	li $a1, 2
	
	syscall

	j game_loop

first_player:
	addi $s6, $s6, 1
	la $a0, lost_violation
	lw $a0, 0($a0)
	beq $s6, $a0, wins_by_violation
	#xor $a2, $a2, 1
	li $v0, 55
	la $a0, warning
	li $a1, 2
	
	syscall
	j game_loop

undo:
	la $a0, yes
	lw $a0, 0($a0)
	bne $t9, $a0, game_loop
	xor $a2, $a2, 1
	add $s3, $s3, -1						#decrease number of character 1
	bne $a2, $a0, clear_character_X
	j clear_character_O
	
clear_character_X:
	jal get_coordinate
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	
	#jal get_coordinate
	
	li $t0, ' '
	la $a0, bet_row_dis
	lw $t1, 0($a0)
	add $t2, $s2, $t1
	sub $t3, $s2, $t1
	
	#=========== this is for cleaning character ===========
	sb $t0, board+0($s2)
	sb $t0, board+-2($t2)
	sb $t0, board+2($t2)
	sb $t0, board+-2($t3)
	sb $t0, board+2($t3)

	add $t2, $t2, $t1
	sub $t3, $t3, $t1
	
	sb $t0, board+-4($t2)
	sb $t0, board+4($t2)
	sb $t0, board+-4($t3)
	sb $t0, board+4($t3)
	#=========== end cleaning character ===========

	# get all our values back from the stack
	lw $ra, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	addi $sp, $sp, 20
	
	addi $s4, $s4, -1
	#xor $a2, $a2, 1
	
	j game_loop

clear_character_O:						# expanding O character here
	# store values in pointer for preservation purpose
	jal get_coordinate
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	
	#jal get_coordinate
	
	li $t0, ' '
	la $a0, bet_row_dis
	lw $t1, 0($a0)
	add $t2, $s2, $t1
	sub $t3, $s2, $t1
	
	#=========== this is for drawing O character ===========
	sb $t0, board+0($s2)
	sb $t0, board+4($s2)
	sb $t0, board+-4($s2)
	
	sb $t0, board+-3($t2)
	sb $t0, board+3($t2)
	sb $t0, board+-3($t3)
	sb $t0, board+3($t3)

	add $t2, $t2, $t1
	sub $t3, $t3, $t1
	
	sb $t0, board+0($t2)
	sb $t0, board+-2($t2)
	sb $t0, board+2($t2)
	sb $t0, board+0($t3)
	sb $t0, board+-2($t3)
	sb $t0, board+2($t3)
	#=========== end drawing O character ===========

	lw $ra, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	addi $sp, $sp, 20
	
	addi $s5, $s5, -1
	#xor $a2, $a2, 1
	
	j game_loop

draw_end:
	la $a0, draw
	li $v0, 4
	
	syscall
	
	la $v0, 10
	
	syscall
	
playerXwins:
	la $a0, playerXwin
	li $v0, 4
	syscall
	la $v0, 10
	
	syscall

playerOwins:
	la $a0, playerOwin
	li $v0, 4
	syscall
	la $v0, 10
	
	syscall
	
wins_by_violation:
	xor $a2, $a2, 1
	j end_game
