.data
   array: .space 20000
   msg1:.asciiz "Enter the size of array: "
   msg2:.asciiz"Enter elements: "
   msg3:.asciiz"Array: "
   msg4:.asciiz"\n"
   msg5:.asciiz" "
   msg6: .asciiz "Minimum: "
.text
   main:
        li $v0,4
        la $a0,msg1
        syscall
        li $v0,5
        syscall
        move $t1,$v0
        li $v0,4
        la $a0,msg2
        syscall
        li $t0,0
        mul $t1,$t1,4
        array_loop:
              beq $t0,$t1,print_array
              li $v0,5
              syscall
              move $t2,$v0
              sw $t2,array($t0)
              addi $t0,$t0,4
              j array_loop
        print_array:
              li $v0,4
              la $a0,msg3
              syscall
              li $t0,0
        output_loop:
               beq $t0,$t1,find_maximum
               lw $t2,array($t0)
               li $v0,1
               move $a0,$t2
               syscall
               li $v0,4
               la $a0,msg5
               syscall
               addi $t0,$t0,4
               j output_loop
         find_maximum:
              li $v0,4
              la $a0,msg4
              syscall
              li $v0,4
              la $a0,msg6
              syscall
              li $t0,0
              li $a1,2147483647
         maximum_loop:
              beq $t0,$t1,output
              lw $t2,array($t0)
              move $a2,$t2
              jal ismaximum
              beq $v1,$zero,jump
              move $t3,$v1    
          jump:
             addi $t0,$t0,4
             j  maximum_loop
         ismaximum:
             bgt $a2,$a1,return
             move $a1,$a2
             move $v1,$a1
             jr $ra
         return:
             li $v1,0
             jr $ra
         output:
             li $v0,1
             move $a0,$t3
             syscall 
         Exit:
             li $v0,10
             syscall
               
               
                
        
   
      