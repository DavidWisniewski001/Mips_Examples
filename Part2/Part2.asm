.data
space: .asciiz "  "
newline:    .asciiz "\n"
tabstring:  .asciiz "\t"


strA: 		.asciiz "Please enter your choice to skip numbers (1-4)\n"
input:		.byte 	#Reserves money for user insert
n:		.word 0
sum:		.word 0


Numbers: 	.byte 100, -7, 11, 25, -66, 99, -1, 34, 12, 22, -2, -7, 100,
11, 4, 67, 2, -90, 22, 2, 56, 3, -89, 12, -10, 21, 10, -25, -6, 9, 111,
34, 12, 22, -2, -17, 100, 111, -4, 7, 14, -19, -2, 29, 36, 31, -79, 2
.globl main
.text



main: 
##############################################################################################################

#Print out the string $ prompt the user
 	#Print the string out
	la   $a0, strA		#loads the adress of strA
	li   $v0,4		#code for printing a string
	syscall
	
	la   $a0, newline	#loads the adress of  newline
	li   $v0, 4		#code for printing a string
	syscall

         
	# Prompt user for input
	li   $v0,4		#code for printing a string
	la   $a0, input		#loads the adress of  newline
	syscall
	

#http://students.cs.tamu.edu/tanzir/csce350/reference/syscalls.html

	li   $v0, 5		#Code to read the user input		
	syscall
	
	move $t1, $v0		#Places the users number in register t1
	          
	li $v0, 1           #system code 1 for printing an integer	          
	add $a0, $zero, $t1 #copy register $t1 to $a0
	syscall
           
#code to read the skip count
##################################################################################################################


















#Exit system call
li $v0, 10 # Sets $v0 to "10" to select exit syscall
syscall # Exit
