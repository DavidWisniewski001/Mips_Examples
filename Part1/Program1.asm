.data 
strA:		.asciiz "Original Array:\n"
strB:		.asciiz "Second Array:\n"
newline:	.asciiz "\n"
space:	 	.asciiz " "
#This is just some whitespace for the output
comma_string: 	.asciiz " , "
tabstring:  	.asciiz "\t"

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
#This is the set up for the calculations for the array
#If you want to make the array bigger you can change the value in $s1

###################################################################################	
la $a1, Original	#Loads the adress of the Original array
la $a2, Second		#Loads the adress of the second array

li $s1, 4		#The size of the x by x matrix
li $s0, 4		#Constant to multiply by a word is 4 bytes
mul $k1, $s0, $s1	# 4*4 =16

#Test Output
#add $a0, $k1, $zero	#Transfers data from one register to another
#li $v0, 1	       	#$system call code for print integer
#syscall		#Print the integer


###################################################################################
li $t1, 0 	        # This is the start index for i

Loop001:
	li $t2, 0           # This is the start index for j

Loop002:
# Print the values for 'i' and 'j' ($t0 and $t1)
#First print 'i' ($t0)
#	li $v0, 1          		 # system code 1 for printing an integer	          
#    	add $a0, $zero, $t1		 # copy register $t1 to $a0
     					    		
#	syscall

#Print Newline
# 	la $a0, newline     		#load address of whitespace into $a0
#  	li $v0, 4           		#system code 4 for printing a string
#	syscall

#Now print 'j' ($t1)
#	li $v0, 1           		# system code 1 for printing an integer	          
#     	add $a0, $zero, $t1 		# copy register $t1 to $a0
#	syscall


	mul $t3, $t1, $k1		#(i*16)
	mul $t6, $t2, $s0		#j*4
	   
	mul $t4, $t2, $k1		#(j*16)
	mul $t5, $t1, $s0		#i*4
	

	add $t3, $t3, $t6		#(i*16)+j*4 The calculated offset
	add $t4, $t4, $t5		#(j*16)+i*4 The calculated offset

	add $t3, $a1, $t3		#Base plus offset for [i][j]
	add $t4, $a1, $t4		#Base plus offset for [j][i]

	lw $t5, ($t3)			#Get Original[i][j]
	lw $t6, ($t4)			#Get Second[j][i]
	
	li $v0, 1           		# system code 1 for printing an integer	          
     	add $a0, $zero, $t5 		# copy register $t5 to $a0
     	syscall 
     	
 	la $a0, space 			# load address of comma_stringinto $a0
  	li $v0, 4            		# system code 4 for printing a string
	syscall

	add $t6, $zero, $t5		#Moves the data from t5 to t6
	sw $t6, ($t4)			#Stores the data in the second array
	
	
#This is the inner loop branch part
	addi $t2, $t2, 1    		# j <- j + 1 (increment count)

     	slti  $t5, $t2, 4 		# 'set less than (immediate) instr. 
				    	# if( $t2 < 4 )
				   	#   $t5 <- 1
				    	# else
				    	#   $t5 <- 0     	

#branch if $t5 != 0 (which means $t1 < 4 because of the slti)
	bne $t5, $zero, Loop002


 	la $a0, newline     		#load address of whitespace into $a0
  	li $v0, 4           		#system code 4 for printing a string
	syscall

#This is the outer loop branch part

	addi $t1, $t1, 1   		# i <- i+1 (increment count)

     	slti  $t5, $t1, 4 		# 'set less than (immediate) instr. 
				   	# if( $t0 < 10 )
				   	#   $t5 <- 1
				    	# else
				    	#   $t5 <- 0     	

#branch if $t5 != 0 (which means $t0 < 4 because of the slti)
	bne $t5, $zero, Loop001

##########################################################################################
li $t1, 0 	        		# This is the start index for i

Loop003:
	li $t2, 0           		# This is the start index for j

Loop004:
# Print the values for 'i' and 'j' ($t0 and $t1)
#First print 'i' ($t0)
	li $v0, 1          		 # system code 1 for printing an integer	          
     	add $a0, $zero, $t1		 # copy register $t1 to $a0
     					    		
	syscall

	mul $t3, $t1, $k1		#(i*16)   
	mul $t6, $t2, $s0		#j*4

	add $t3, $t3, $t6		#(i*16)+j*4 The calculated offset
	add $t3, $a1, $t3		#Base plus offset for [i][j]

	lw $t6, ($t4)			#Get Second[j][i]

#Now print 'j' ($t1)
	li $v0, 1           		# system code 1 for printing an integer	          
     	add $a0, $zero, $t6 		# copy register $t1 to $a0
     	syscall 
			
#Now print the space "  "
 	la $a0, space 			# load address of comma_stringinto $a0
  	li $v0, 4            		# system code 4 for printing a string
	syscall

	
#This is the inner loop branch part
	addi $t2, $t2, 1    		# j <- j + 1 (increment count)

     	slti  $t5, $t2, 4 		# 'set less than (immediate) instr. 
				    	# if( $t2 < 4 )
				   	#   $t5 <- 1
				    	# else
				    	#   $t5 <- 0     	

#branch if $t5 != 0 (which means $t1 < 4 because of the slti)
	bne $t5, $zero, Loop004

#Now print newline "\n"
 	la $a0, newline     		#load address of whitespace into $a0
  	li $v0, 4           		#system code 4 for printing a string
	syscall

#This is the outer loop branch part

	addi $t1, $t1, 1   		# i <- i+1 (increment count)

     	slti  $t5, $t1, 4 		# 'set less than (immediate) instr. 
				   	# if( $t0 < 10 )
				   	#   $t5 <- 1
				    	# else
				    	#   $t5 <- 0     	

#branch if $t5 != 0 (which means $t0 < 4 because of the slti)
	bne $t5, $zero, Loop003


#Exit system call
li $v0, 10 # Sets $v0 to "10" to select exit syscall
syscall # Exit
