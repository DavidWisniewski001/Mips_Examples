.data
space: .asciiz "  "
newline:    .asciiz "\n"
tabstring:  .asciiz "\t"


strA: 		.asciiz "Please enter your choice to skip numbers (1-4)\n"




Numbers: 	.byte 100, -7, 11, 25, -66, 99, -1, 34, 12, 22, -2, -7, 100
		.byte 11, 4, 67, 2, -90, 22, 2, 56, 3, -89, 12, -10, 21, 10, -25, -6, 9, 111
		.byte 34, 12, 22, -2, -17, 100, 111, -4, 7, 14, -19, -2, 29, 36, 31, -79, 2
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
        
#http://students.cs.tamu.edu/tanzir/csce350/reference/syscalls.html

	li   $v0, 5		#Code to read the user input		
	syscall
	
	li $t1, 0
	add $t1, $v0, $zero	#Places the users number in register t1
	          
#	li $v0, 1           	#system code 1 for printing an integer	          
#	add $a0, $zero, $t1 	#copy register $t1 to $a0
#	syscall
           
##################################################################################################################	
	
#	la 	$a0, Numbers	# Base address

 #LOOP:		
#	lb	$a1, 1($a0)	#
#	add	$s0, $s0, $t1	#
	
#	li $v0, 1           	#system code 1 for printing an integer	          
#	add $a0, $zero, $a1 	#copy register $t1 to $a0
#	syscall
	
#	la   $a0, newline	#loads the adress of  newline
#	li   $v0, 4		#code for printing a string
#	syscall
###################################################################################################################

#walking throught the array
	
	la 	$a0, Numbers	# Base address
	la	$a1, 0($a0)	#Loads the data from adress a0 into a1
	la	$a2, 48($a0)	#Loads the end of the array
	
	li	$s1, 0		# where the sum is held
#	li $t1,	1
	
 LOOP:		
	lb $t2, 0($a1)		#Loads the current value of the current index
	add $s1, $t2, $s1	#Adds the item to the sum
		
		
#	li $v0, 1           	#system code 1 for printing an integer	          
#	add $a0, $zero, $t2 	#copy register $t1 to $a0
#	syscall
	
#	la   $a0, newline	#loads the adress of  newline
#	li   $v0, 4		#code for printing a string
#	syscall	
	
	
	
	add	$a1, $a1, $t1	# Increment base+displacemnet
	blt	$a1,$a2, LOOP 	# If the address at a1 is less than the adress in a2 then branch to loop

	li $v0, 1           	#system code 1 for printing an integer	          
	add $a0, $zero, $s1 	#copy register $t1 to $a0
	syscall
	
#	li $v0, 1           	#system code 1 for printing an integer	          
#	add $a0, $zero, $s0 	#copy register $t1 to $a0
#	syscall
	

						
#Exit system call
li $v0, 10 # Sets $v0 to "10" to select exit syscall
syscall # Exit


# Everything works no changes were made issue with loading in SPIM 
