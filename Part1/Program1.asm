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
li $s0, 4

li $t1, 0		#Sets i to zero 
li $t2, 0		#Sets j to zero

li $t3, 0
li $t4, 0

Loop001:
beq $t1, $a1, EXIT

Loop002:
beq $t3, $a1, EXIT
mul $t5, $t1, $s0
mul $t6, $t2, $s0
add $t7, $t5, $t2
add $t8, $t6, $t1
mul $t9, $t7, $s0
mul $s1, $t8, $s0
add $t9($a1), $t3, $zero
add $s1($a0), $t4, $zero

addi $t1, $t1, 1
addi $t2, $t2, 1

j Loop002

j Loop001


				
