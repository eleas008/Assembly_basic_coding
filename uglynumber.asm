.data
msg1: .asciiz "Enter Integer: "
msg2: .asciiz "Ugly"
msg3: .asciiz "Not Ugly"

.text
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $a1, $v0       

    jal check_ugly      
    beq $v0, $zero, print_not_ugly
    j print_ugly

print_ugly:
    li $v0, 4
    la $a0, msg2
    syscall
    j exit

print_not_ugly:
    li $v0, 4
    la $a0, msg3
    syscall
    j exit

check_ugly:
    li $t1, 2           
ugly_loop:
    beq $a1, $zero, not_ugly     
    div $a1, $t1        
    mfhi $t2
    beq $t2, $zero, ugly     
    addi $t1, $t1, 1    
    li $t3, 5           
    bgt $t1, $t3, not_ugly     
    j ugly_loop         

ugly:
    li $v0, 1           
    jr $ra              

not_ugly:
    li $v0, 0           
    jr $ra              

exit:
    li $v0, 10          
    syscall
