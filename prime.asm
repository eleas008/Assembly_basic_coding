.data
   array: .space 20000
   msg1: .asciiz "Enter the size of array: "
   msg2: .asciiz "Enter Elements: "
   msg3: .asciiz "Array: "
   msg4: .asciiz " "
   msg5: .asciiz "\n"
   msg6: .asciiz "Prime Numbers: "
   msg7: .asciiz "Number of prime numbers: "
.text
   main:
        li $v0,4
        la $a0,msg1
        syscall
        li $v0,5
        syscall
        move $t1,$v0
        mul $t1,$t1,4
        li $v0,4
        la $a0,msg2
        syscall
        li $t0,0
        loop:
             beq $t0,$t1,output
             li $v0,5
             syscall
             move $t2,$v0
             sw $t2,array($t0)
             addi $t0,$t0,4
             j loop
        output:
             li $v0,4
             la $a0,msg3
             syscall
             li $t0,0
        print_loop:
             beq $t0,$t1,prime
             lw $t3,array($t0)
             li $v0,1
             move $a0,$t3
             syscall
             li $v0,4
             la $a0,msg4
             syscall
             addi $t0,$t0,4
             j print_loop
        prime:
             li $v0,4
             la $a0,msg5
             syscall
             li $v0,4
             la $a0,msg6
             syscall
             li $t0,0
             li $t8,0
        prime_loop:
             beq $t0,$t1,Exit
             lw $t4,array($t0)
             move $a1,$t4
             jal isprime
             beq $v0,$zero,jump
             li $v0,1
             move $a0,$a1
             syscall
             li $v0,4
             la $a0,msg4
             syscall
             addi $t8,$t8,1
        jump:
            addi $t0,$t0,4
            j prime_loop
        isprime:
             li $t5,2
             move $t6,$a1
             sqrt_loop:
                        blt $t6,$t5,not_prime
                        beq $t6,$t5,prime_num
                        div $t6,$t5
                        mfhi $t7
                        beqz $t7,not_prime
                        addi $t5,$t5,1
                        j sqrt_loop
              not_prime:
                  li $v0,0
                  jr $ra
              prime_num:
                  move $v0,$a1
                  jr $ra
        Exit:
             li $v0,4
             la $a0,msg5
             syscall
             li $v0,4
             la $a0,msg7
             syscall
             li $v0,1
             move $a0,$t8
             syscall
             li $v0,10
             syscall