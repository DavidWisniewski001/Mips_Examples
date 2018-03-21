.data 
strA:		.asciiz "Original Array:\n"
strB:		.asciiz "Second Array:\n"
newline:	.asciiz "\n"
space:	 	.asciiz " "

#This is the start of the original array.
Original:	.word 200, 270, 250, 100
		.word 205, 230, 105, 235
		.word 190, 95, 90, 205
		.word 80, 205, 110, 215

# The next statement allocates room for the other array
# The array takes up 4*16 = 64 bytes
#
Second:		.space	64


.align 2
.globl main
.text
main:	
la $a1, Original	#Loads the adress of the Original array
la $a2, Second		#Loads the adress of the second array

li $s1, 4		#The size of the x by x matrix
li $s0, 4		#Constant to multiply by a word is 4 bytes
li $k0, 3		#Where I want both counters to stop when i and j == 3
mul $k1, $s0, $s1	# 4*4 =16

li $t1, 0		#Sets i to zero 
li $t2, 0		#Sets j to zero

Loop001:
beq $t1, $k0, EXIT	#If i == 3 EXIT
li $t2, 0		#Sets j to zero

Loop002:
beq $t2, $k0, Loop001	#If j== 3 Loop001

mul $t3, $t1, $k1	#(i*16)   
mul $t4, $t2, $k1	#(j*16)
mul $t5, $t1, $s0	#i*4
mul $t6, $t2, $s0	#j*4

add $t3, $t3, $t6	#(i*16)+j*4 The calculated offset
add $t4, $t4, $t5	#(j*16)+i*4 The calculated offset

add $t3, $a1, $t3	#Base plus offset for [i][j]
add $t4, $a1, $t4	#Base plus offset for [j][i]

lw $v0, ($t3)		#Get Original[i][j]
lw $v1, ($t4)		#Get Original[j][i]
lw $t5, ($t3)		#Get Second[i][j]
lw $t6, ($t4)		#Get Second[j][i]

add $t5, $v1, $zero	#Moves the data from v1 to t5
add $t6, $v0, $zero	#Moves the data from v0 to t6

		

addi $t2, $t2, 1	# Increments J+1

j Loop002		#Jumps to Label Loop002

addi $t1, $t1, 1	# Increments I+1

j Loop001		#Jumps to Label Loop001

EXIT:
li $t1, 0		#Sets i to zero 
li $t2, 0		#Sets j to zero

Loop003:
beq $t1, $k0, END	#If i == 3 END
li $t2, 0		#Sets j to zero


Loop004:
beq $t2, $k0, Loop003	#If j== 3 EXIT
mul $t3, $t1, $k1	#(i*16)
mul $t5, $t2, $s0	#j*4
add $t3, $t3, $t5	#(i*16)+j*4 The calculated offset
add $t3, $a1, $t3	# Base plus offset for [i][j]
lw $t5, ($t3)		#Get Second[i][j]
add $a0, $t5, $zero	#Puts the value of Second[i][j] in $a0
li $v0, 1	       	#$system call code for print integer
syscall			#Print the integer
# print space, 32 is ASCII code for space
li $a0, 32
li $v0, 11  # syscall number for printing character
syscall

addi $t2, $t2, 1	# Increments J+1

j Loop003		#Jumps to Label Loop003

addi $t1, $t1, 1	# Increments I+1

j Loop004		#Jumps to Label Loop004

END:
syscall 

