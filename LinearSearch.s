

.text

main:
	la $s0, linear_array			
	la  $s2,size
        lw  $s2, 0($s2)
	addi $t2,$0,0 			
	addi $t3,$0,1						

	li $v0, 4			
	la $a0, NumberWanted
	syscall
	 la  $s3,size
         lw  $s2, 0($s3)
        li $v0, 5			
	syscall
	move $t0, $v0			
	j loop


loop:
	beq $t2, $s2, exit2		
	lw $t4, 0($s0)			
	beq $t0, $t4, label 		
next_element:
	addi $t7,$0,1    
        addi $t7,$t7,1
	addi $s0, $s0, 4		
	addi $t2, $t2, 1		
	j loop
label:
	li $v0, 4			
	la $a0, NumberWantedItIsFound
	syscall
	
	li $v0, 1			
	move $a0, $t2
	syscall
	addi $t7,$0,1    
        addi $t8,$t7,1
	li $v0, 4    
        la $a0,index
        syscall
	addi $t9,$0,1			
	j next_element
exit2:
	beq $t9, $t3, exit		

	li $v0, 4			
	la $a0, NumberWantedItIsNotFound
	syscall
	j exit
exit:
	li $v0, 10
	syscall	
	
.data	
NumberWanted: .asciiz "Please,Enter the number you want to call : "   
comma: .asciiz " , "   
NumberWantedItIsFound: .asciiz "\nNumber Wanted, it is label " 
index: .asciiz ". index \n"
NumberWantedItIsNotFound: .asciiz "\nERROR :: The number searched was not find in the any index"
size: .word 20
linear_array: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19

