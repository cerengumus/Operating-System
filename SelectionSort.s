.text
.globl  main
main:
         la  $s2,size
         lw  $s2, 0($s2)
        jal Selection_Sort
        jal print
        j exit
Selection_Sort:       
    la  $t6, arr            
    lw  $t0, size              
    addi $t9, $t0, -1           
    li  $t2, 0                   
    li  $t3, 1                

loopfirst:
    la  $t6, arr            
    bge $t2, $t9, exit2       

    loopsecond:
        bge $t3, $t0, exitSecLoop   
                                     
        mul $t1, $t2, 4         
        add $t1, $t1, $t6       
        add $a0, $0, $t1
        lw $t1, ($t1)           

        mul $t5, $t3, 4
        add $t5, $t5, $t6 
        addi $t7,$0,1    
        addi $t7,$t7,1
        add $a1, $0, $t5
        lw $t5, ($t5)           
        
        bgt $t1, $t5, twoNumSwap

    twoNumSwap_return:
        addi $t3, $t3, 1
        j loopsecond
                                   
    exitSecLoop:          
        addi $t2, $t2, 1        
        addi $t3, $t2, 1
        lw  $s3, 0($a1)
        j loopfirst
                                
    twoNumSwap:
        lw  $s0, 0($a0) 
        addi $t7,$t7,1
        li $t7,1 
        li $t4,4       
        lw  $s1, 0($a1)
        sw  $s0, 0($a1)
        sw  $s1, 0($a0)
        j twoNumSwap_return

exit2:
    li $v0, 4
    la $a0, size
    syscall
    la $a0, selectionSortRes
    syscall
    jr $ra
                  

print:
    loop1:
        la  $t6, arr
        lw  $t0, size
        li  $t2, 0
   loop2:
        bge $t2, $t0, exit1
        li  $v0, 1
        lw  $a0, 0($t6)
        syscall
        li  $v0, 4
        la  $a0, comma
        syscall
        addi     $t7,$t7,1
        addi     $s3,$s3,1
        addi    $t6, $t6, 4
        addi    $t2, $t2, 1
        j  loop2
    exit1:
        li  $v0, 4
        la  $a0,size
        syscall
        jr  $ra
        
exit:
    li  $v0, 10              
    syscall  
.data
    arr: .word 0, 1, 2, 3, 4, 15, 6, 71, 8, 9, 10, 11, 12, 2, 14, 15, 16, 17, 18, 123 
    size: .word   20          
                    
    selectionSortRes:.asciiz "SELECTION SORT RESULTS :\n"
    comma: .asciiz "," 
