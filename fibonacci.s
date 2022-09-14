# This function computes de nth Fibonacci number
# Frame size: 48 bytes
#           - 16 bytes to back both ra and fp up
#           - 16 bytes to back s1 up
#           - 16 bytes to back a0 up
# Save registers: s1 to back the result of fibonacci(target-1) up
# Arguments: a0 <-> target
# Return value: a0 <-> fib
    .text
    .globl fibonacci
fibonacci:
        addi sp, sp, -48
        sw   ra, 48(sp)
        sw   fp, 44(sp)
        sw   s1, 32(sp)
        addi fp, sp, 48
        bne  a0, zero, L1
        addi a0, zero, 0
        lw   ra, 48(sp)
        lw   fp, 44(sp)
        lw   s1, 32(sp)
        addi sp, sp, 48
        jr   ra
L1:     addi t0, zero, 1
        beq  a0, t0, L2
        addi t0, zero, 2
        bne  a0, t0, L3
L2:     addi a0, zero, 1
        lw   ra, 48(sp)
        lw   fp, 44(sp)
        lw   s1, 32(sp)
        addi sp, sp, 48
        jr   ra
L3:     sw   a0, -32(fp)
        addi a0, a0, -1
        jal  fibonacci
        add  s1, zero, a0
        lw   a0, -32(fp)
        addi a0, a0, -2
        jal  fibonacci
        add  a0, s1, a0
        lw   ra, 48(sp)
        lw   fp, 44(sp)
        lw   s1, 32(sp)       
        addi sp, sp, 48
        jr   ra        

# This function computes de nth Fibonacci number
# Frame size: 32 bytes
#           - 16 bytes to back both ra and fp up
#           - 16 bytes to back local variables up
    .globl main
main:
        addi sp, sp, -32
        sw   ra, 32(sp)
        sw   fp, 28(sp)
        addi fp, sp, 32
        addi a0, zero, 10
        jal  fibonacci
        sw   a0, -16(fp)
        addi a0, zero, 0
        lw   ra, 32(sp)
        lw   fp, 28(sp)
        jr   ra