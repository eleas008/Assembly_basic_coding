.data
  msg1: .asciiz "Enter first number: "
  msg2: .asciiz "Enter Second Number: "
  msg3: .asciiz "Common Factors are: "
  msg4: .asciiz " "
  
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
       li $v0,5
       syscall
       move $t1,$v0
       li $v0,4
       la $a0,msg3
       syscall
       li $t2,1
       common_factor_loop:
              ble $t2,$t0,check_factor
              j Exit
       check_factor:
             div $t0,$t2
             mfhi $t3
             beq $t3,$zero,check_second
             j increament
       check_second:
             div $t1,$t2
             mfhi $t4
             bne $t3,$zero, increament
             bne $t4,$zero, increament
             j  print_factor
        print_factor:
             li $v0,1
             move $a0,$t2
             syscall
             li $v0,4
             la $a0,msg4
             syscall 
             addi $t2,$t2,1
             j  common_factor_loop 
       increament:
             addi $t2,$t2,1
             j common_factor_loop
       Exit:
          li $v0,10
          syscall
          
        
       
       