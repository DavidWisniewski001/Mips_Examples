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
la $a0, Original	#Loads the adress of the Original array
la $a1, Second		#Loads the adress of the second array

lw $t1, 0($a0)		#Loads Original[0][0]		
lw $t2, 4($a0)		#Loads Original[0][1]
lw $t3, 8($a0)		#Loads Original[0][2]
lw $t4, 12($a0)		#Loads Original[0][3]

sw $t1, 0($a1)		#Stores Original[0][0] @Second[0][0] 
sw $t2, 16($a1)		#Stores Original[0][1] @Second[1][0]
sw $t3, 32($a1)		#Stores Original[0][2] @Second[2][0]
sw $t4, 48($a1)		#Stores Original[0][3] @Second[3][0]

lw $t1, 16($a0)		#Loads Original[1][0]
lw $t2, 20($a0)		#Loads Original[1][1]
lw $t3, 24($a0)		#Loads Original[1][2]
lw $t4, 28($a0)		#Loads Original[1][3]

sw $t1, 4($a1)		#Stores Original[1][0] @Second[0][1]
sw $t2, 20($a1)		#Stores Original[1][1] @Second[1][1]
sw $t3, 36($a1)		#Stores Original[1][2] @Second[2][1]
sw $t4, 52($a1)		#Stores Original[1][3] @Second[3][1]

lw $t1, 32($a0)		#Loads Original[2][0]
lw $t2, 36($a0)		#Loads Original[2][1]
lw $t3, 40($a0)		#Loads Original[2][2]
lw $t4, 44($a0)		#Loads Original[2][3]

sw $t1, 8($a1)		#Stores Original[2][0] @Second[0][2]
sw $t2, 24($a1)		#Stores Original[2][1] @Second[1][2]
sw $t3, 40($a1)		#Stores Original[2][2] @Second[2][2]
sw $t4, 56($a1)		#Stores Original[2][3] @Second[3][2]

lw $t1, 48($a0)		#Loads Original[3][0]
lw $t2, 52($a0)		#Loads Original[3][1]
lw $t3, 56($a0)		#Loads Original[3][2]
lw $t4, 60($a0)		#Loads Original[3][3]

sw $t1, 12($a1)		#Stores Original[3][0] @Second[0][3]
sw $t2, 28($a1)		#Stores Original[3][1] @Second[1][3]
sw $t3, 44($a1)		#Stores Original[3][2] @Second[2][3]
sw $t4, 60($a1)		#Stores Original[3][3] @Second[3][3]

# Second is now transposed

lw $t0, 0($a1)
li $t1, 0
Loop:
beq $t1,$a2, Exit

		