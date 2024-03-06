.data
    msg1: .asciiz "Enter an integer: "
    msg2: .asciiz "Factorial: "
    msg3: .asciiz "Number of trailing zeros: "
    msg4: .asciiz "\n"
.text
    main:
       li $v0,4
       la $a0,msg1
       syscall
       
       li $v0,5
       syscall
       move $a1,$v0
       
       li $v0,4
       la $a0,msg2
       syscall
       
       jal factorial
       
       li $v0,1
       move $a0,$v1
       syscall
       
       move $a2,$v1
       
       li $v0,4
       la $a0,msg4
       syscall
       
       li $v0,4
       la $a0,msg3
       syscall

       jal trailing_zeros
       
       move $a0,$v0
       li $v0,1
       syscall
       
       li $v0,10
       syscall
       
    factorial:
       addi $sp,$sp,-8
       sw $a1,0($sp)
       sw $ra,4($sp)
       li $v1,1
       beqz $a1,return
       beq $a1,$v1,return
       addi $a1,$a1,-1
       jal factorial
       lw $a1,0($sp)
       mul $v1,$v1,$a1
    return:
       lw $ra,4($sp)
       lw $a1,0($sp)
       addi $sp,$sp,8
       jr $ra
    trailing_zeros:
       li $v0,0
    loop:
       beqz $a2,end_loop
       div $a2,$a2,10
       mfhi $t0
       bnez $t0,end_loop
       addi $v0,$v0,1
       j loop
    end_loop:
       jr $ra
       
       
    
     
     
        
    
    
    
