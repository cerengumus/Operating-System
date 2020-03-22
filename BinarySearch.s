
.text
.globl main
main:
		la	$a0, arr		
		la	$s0, SearchedNumb		
		lw	$a1, 0($s0)		
		li      $a3, 14
		li      $s4,0
		jal	BinarySearch		
		addi	$a2, $s1, 0
		jal	exit1		
		li	$v0, 10
		syscall	
		
BinarySearch:
		addi	$t1, $0, 0		
		la      $s0,size
  		lw       $s0, 0($s0)	
loop:		
		addi	$t9, $t1, 1				
		bgt	$t9, $s0, finish	
		beq	$t9, $s0, finish	
		addi	$t2, $0, 0
		add	$t2, $t2,$t2
		sub	$t3, $s0, $t1		
		div	$t3, $t3, 2		
		add	$t0, $t1, $t3		
		la      $s1,size
  		lw      $s1, 0($s1)
		add	$t2, $t2,$t2
		mul	$t4, $t0, 4				
		add 	$t8, $a0, $t4		
		lw	$t8, 0($t8)		
		bgt	$a1, $t8, else	
		mul	$t5, $t5, 0
		beq	$a1, $t8, else
		add	$t2, $t2,$t2	
		add	$s0, $0, $t0	
		j 	loop
else:
		add	$t1, $0, $t0	
		mul	$t5, $t5, 0		
		j	loop
finish:	
		mul	$t4, $t1, 4		
		add 	$t8, $a0, $t4		
		lw	$t8, 0($t8)
		addi	$t2, $0,0		
		bne	$a1, $t8, label	
		addi	$s1, $0, 1 		
		j	exit
label:	
		mul	$t4, $s0, 4		
		add 	$t8, $a0, $t4		
		lw	$t8, 0($t8)
		addi	$t2, $0,0		
		bne	$a1, $t8, notEnd	
		addi	$s1, $0, 1 		
		j	exit
notEnd:		
		addi	$s1, $0, 0
		addi	$t2, $0,0		
exit:	
		jr	$ra
exit1:	
		li	$v0, 1
		add	$a0, $a1, 0
		addi	$t5, $0,0	
		addi	$t5, $t5,1
		addi	$t2, $0,0	
		syscall	
		bne	$a2, 0, found		
notFound:		
		li	$v0, 4
		la	$a0, itIsNotFound
		syscall	
		j	exit1End
found:
		li	$v0, 4
		la	$a0, itIsFound	
		syscall	
exit1End:
		jr	$ra
		
.data
arr:	.word 1, 2, 3, 11, 14, 15, 16, 17, 18, 19, 20, 21, 25, 26
itIsNotFound:	.ascii		"\nERROR :: The number searched was not find in the any index"
SearchedNumb:	.word		16
itIsFound:	.ascii		" \nNumber Wanted, it is found"
size: .word 14