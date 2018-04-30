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

		la $a1, Original		#Loads the adress of the Original array
		li $s3, 80			#Sets i to 80
		li $s2, 76			#Sets j to 76
		li $t6, 0			#Inner Loop counter
		li $t7, 0			#Outer Loop Counter
		
		
		add $s0, $a1, $t7		#Calculates the offset for the array
		add $s1, $a1, $t6

OuterLoop:
	
		
InnerLoop:	lw $t0, ($s0) 			#Loads the value of an element in the array
		lw $t1, ($s1)			#Loads the value of another element in the array
		blt $t0, $t1, Swap		#Compares the two values if $t0 < $t0 put a 1 in register $t2 then branches to swap
		j Continue			#Jumps over Swap

Swap:		sw $t1, ($s0)			#Stores the values in different registers
		sw $t0, ($s1)
		
Continue:			
		addi $t6, $t6, 4		#Increments the loop Counter
		add $s1, $a1, $t6		#Adds the offset to the adress
		bne $t6, $s3, InnerLoop		#If the inner Loop is not equal to $s3 branch to InnerrLoop
		
		li $t6, 0			#Resets the register value
		addi $t7, $t7, 4		#Increments the outer Loop counter
		add $s0, $a1, $t7		#Adds the offset to the address
		bne $t7, $s3, OuterLoop 	#Branches to the OuterLoop if $t7 is not equal to $s2 
		li $t7, 0
		add $s0, $a1, $zero
		
########################################################################################################

Display:		
		add $s0, $a1, $t7		#Adds the offset to the adress
		
		lw $a0, ($s0)
		li $v0, 1           		#system code 4 for printing a string
		syscall				#Print strA
		
		la $a0, space 			# load address of space
	  	li $v0, 4            		# system code 4 for printing a string
		syscall				# Prints a space

		addi $t7, $t7, 4		#increments the loop counter
		bne $t7, $s3, Display		#Branches back to display if $t7 ins not equal to $s3

#Exit system call
li $v0, 10 # Sets $v0 to "10" to select exit syscall
syscall # Exit

