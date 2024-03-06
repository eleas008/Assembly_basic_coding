.data
    msg1: .asciiz "Enter an Integer: "
    msg2: .asciiz "Factorial: "
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