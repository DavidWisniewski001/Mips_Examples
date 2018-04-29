#####################################################################################
# David Wisniewksi 
# Bubble Sort 
# The point of this project is to implement a bubble sort in MIPS Assembly Language
#####################################################################################
.data 
strA:		.asciiz "Original Array:\n"
strB:		.asciiz "Sorted Array:\n"
newline:	.asciiz "\n"
space:	 	.asciiz " "

comma_string: 	.asciiz " , "
tabstring:  	.asciiz "\t"

#This is the start of the original array.
Original:	.word 12 4 100 0 0 1 5 23 81 84 11 12 51 61 24 5 4 2 44 100
.text 

main:

		la $a1, Original	#Loads the adress of the Original array

		li $s3, 76		#Sets i to 76
		li $s2, 72		#Sets j to 72
		li $t6, 0		#Outer Loop counter
		li $t7, 0		#Inner Loop Counter
		
		
		add $s0, $a1, $t7
		add $s1, $a1, $t6

		#lw $a0, ($s0)
		#li $v0, 1           		#system code 4 for printing a string
		#syscall				#Print strA

OuterLoop:
	
		
InnerLoop:	lw $t0, ($s0) 		#Loads the value of the last element in the array
		lw $t1, ($s1)		#Loads the value of the second last element in the array
		slt $t2, $t0, $t1	
		bne $t0,$zero,Swap
		j Continue

Swap:		sw $s0, ($t1)
		sw $s1, ($t0)
		
Continue:			
		addi $t6, $t6, 4
		add $s0, $a1, $t6
		bne $t6, $s3, InnerLoop
		
		li $t6, 0
		addi $t7, $t7, 4
		add $s1, $a1, $t7
		bne $t7, $s2, OuterLoop
		

Display: 	li $t7, 0
		
		add $s0, $a1, $t7
		
		lw $a0, ($s0)
		li $v0, 1           		#system code 4 for printing a string
		syscall				#Print strA
		
		addi $t7, $t7, 4
		bne $t7, $s3, Display
			


	

		
#Original = 
# int array[20] = {12, 4, 100, 0, 0, 1, 5, 23, 81, 84, 11, 12, 51, 61, 24, 5,
# 4, 2, 44, 100}; 

#Exit system call
li $v0, 10 # Sets $v0 to "10" to select exit syscall
syscall # Exit

