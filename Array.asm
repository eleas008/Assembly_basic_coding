.data
      array: .space 2000
      msg1: .asciiz "Enter Size: "
      msg2: .asciiz "Enter Elements: "
      msg3: .asciiz "Array: "
      msg4: .asciiz " "
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
          beq $t1,$t0,Exit
          
          lw $t3,array($t1)
          
          li $v0,1
          move $a0,$t3
          syscall
          
          li $v0,4
          la $a0,msg4
          syscall
          
          addi $t1,$t1,4
          
          j print_loop
          
       Exit:
          li $v0,10
          syscall
          
          
          
          
          
          
          
          
          
          
          
      