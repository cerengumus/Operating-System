# The number is read through the keyboard 
.text
.globl main

main:# Display message to user for a number
li $v0, 4
la $a0, prompt1
syscall

# read keyboard into $v0 (number y is lower bound)
li $v0, 5 
syscall

# move the number from $v0 to $t0
move $t1, $v0 # $t1 = i


# read keyboard into $v0 (number x is upper bound)
li $v0, 5 
syscall

# move the number from $v0 to $t0
move $t0, $v0 # $t0 = n

# read keyboard into $v0 (divided number)
li $v0, 5 
syscall

# move the number from $v0 to $t0
move $t2, $v0 # $t2 = z

li $t4,0

blt $t0,$t1,Exit1
blt $t0,$t2,Exit1

loop: addi $t1,$t1,1
      beq  $t1,$t0,Exit
      div  $t1,$t2
      mfhi $t3
      beq  $t3,$t4,PrintNumber
      j loop
PrintNumber : 
      li   $v0,1
      move $a0,$t1
      syscall 
      
      li   $v0,4
      la $a0,comma
      syscall
      
      j loop
      
Exit1 :
       li   $v0,4
       la $a0,msg
       syscall

Exit  :



.data
prompt1:
 .asciiz "Enter a number "
comma:
 .asciiz ","
msg:
 .asciiz "first number should be smaller than second number,the third number should be smaller than first and second numbers "
