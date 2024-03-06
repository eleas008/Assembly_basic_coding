.data
   array: .space 20000
   msg1: .asciiz " Enter the size: "
   msg2: .asciiz " Enter elements: "
   msg3: .asciiz "Array: "
   msg4: .asciiz "Even numbers are: "
   msg5: .asciiz " "
   msg6: .asciiz "\n"
.text
   main:
       li $v0,4
       la $a0,msg1
       syscall
       li $v0,5
       syscall
       move $t0,$v0
       li $v0,4
       la $a0,msg2
       syscall
       li $t1,0
       mul $t0,$t0,4
       loop:
          beq $t1,$t0,Print_array
          li $v0,5
          syscall
          move $t2,$v0
          sw $t2,array($t1)
          addi $t1,$t1,4
          j loop
        Print_array:
           li $v0,4
           la $a0,msg3
           syscall
           li $t1,0
           print_loop:
               beq $t1,$t0,find_even
               lw $t2,array($t1)
               li $v0,1
               move $a0,$t2
               syscall
               li $v0,4
               la $a0,msg5
               syscall
               addi $t1,$t1,4
               j  print_loop
         find_even:
               li $v0,4
               la $a0,msg6
               syscall
               li $v0,4
               la $a0,msg4
               syscall
               li $t1,0
               li $t3,2
               even_loop:
                  beq $t1,$t0,Exit
                  lw $t2,array($t1)
                  div $t2,$t3
                  mfhi $t4
                  beqz $t4,print
                  addi $t1,$t1,4
                  j  even_loop
                  print:
                      li $v0,1
                      move $a0,$t2
                      syscall
                      li $v0,4
                      la $a0,msg5
                      syscall
                      addi $t1,$t1,4
                      j  even_loop
             Exit:
               li $v0,10
               syscall
                      
               
       
       
   