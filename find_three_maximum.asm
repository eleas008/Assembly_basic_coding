.data
      array: .space 20000
      msg1: .asciiz "Enter Size: "
      msg2: .asciiz "Enter Elements: "
      msg3: .asciiz "Array: "
      msg4: .asciiz " "
      msg5: .asciiz "First Maximum: "
      msg6: .asciiz "Second Maximum: "
      msg7: .asciiz "\n"
      msg8: .asciiz "Third Maximum: "
.text
      main:
          li $v0,4
          la $a0,msg1
          syscall
          
          li $v0,5
          syscall
          move $t0,$v0
          
          mul $t0,$t0,4
          
          li $v0,4
          la $a0,msg2
          syscall
          
          li $t1,0
          
      loop:
          beq $t1,$t0,output
          
          li $v0,5
          syscall
          move $t2,$v0
          
          sw $t2,array($t1)
          
          addi $t1,$t1,4
          
          j loop
      output:
          li $v0,4
          la $a0,msg3
          syscall
          li $t1,0
      print_loop:
          beq $t1,$t0,find_maximums
          
          lw $t3,array($t1)
          
          li $v0,1
          move $a0,$t3
          syscall
          
          li $v0,4
          la $a0,msg4
          syscall
          
          addi $t1,$t1,4
          
          j print_loop
      find_maximums:
          li $t1,0
          li $t2,-1
          li $t4,-1
          li $t5,-1
          maximum_loop:
                  beq $t1,$t0,Exit
                  lw $t3,array($t1)
                  bgt $t3,$t2,update_max1
                  bgt $t3,$t4,update_max2
                  bgt $t3,$t5,update_max3
                  addi $t1,$t1,4
                  j  maximum_loop
         update_max1:
                  move $t5,$t4
                  move $t4,$t2
                  move $t2,$t3
                  addi $t1,$t1,4
                  j maximum_loop
         update_max2:
                  move $t5,$t4
                  move $t4,$t3
                  addi $t1,$t1,4
                  j  maximum_loop 
          update_max3:
                  move $t5,$t3
                  addi $t1,$t1,4
                  j  maximum_loop       
      Exit:
          li $v0,4
          la $a0,msg7
          syscall  
          li $v0,4
          la $a0,msg5
          syscall
          li $v0,1
          move $a0,$t2
          syscall
          li $v0,4
          la $a0,msg7
          syscall
          li $v0,4
          la $a0,msg6
          syscall
          li $v0,1
          move $a0,$t4
          syscall
           li $v0,4
          la $a0,msg7
          syscall
          li $v0,4
          la $a0,msg8
          syscall
          li $v0,1
          move $a0,$t5
          syscall
          li $v0,10
          syscall
