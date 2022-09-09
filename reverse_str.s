# static variable i, this variable can be only accessed by all reverse_str
# functions    
    .data
i:  .word 0
# This function swaps the value of two characters
# Leaf function
# Arguments: a0 <-> *x, a1 <-> *y
# Register convention: t0 <-> temp
    .text
    .globl swap
swap:
        lbu  t0, 0(a0)
        lbu  t1, 0(a1)
        sb   t1, 0(a0)
        sb   t0, 0(a1)
        jr   ra

# Recursive function inverting the elements of an c-style string
# Frame size: 32 bytes 
#           - 16 bytes to back both ra and fp up
#           - 16 bytes to back both a0 and a1 up
# Arguments: a0 <-> str*, a1 <-> k
# 
    .globl reverse_str
reverse_str:
        addi sp, sp, -16
        sw   ra, 16(sp)
        sw   fp, 12(sp)
        addi fp, sp, 16
        add  t0, a0, a1
        lbu  t0, t0(0)
        bne  t0, zero, L1
        lw   ra, 16(sp)
        lw   fp, 12(sp)
        addi sp, sp, 16
        jr   ra
L1:     sw   a1, -16(fp)
        sw   a0, -20(fp)
        lw   t0, -16(fp)
        addi a1, t0, 1
        lw   a0, -20(fp)
        jal  reverse_str
        lw   a1, -16(fp)
        lw   a0, -20(fp)
        lw   t0, 0(gp)
        bgt  t0, a1, L2
        sw   a1, -16(fp)
        sw   a0, -20(fp)
        lw   t0, -20(fp)
        lw   t1, -16(fp)
        add  a1, t0, t1


L2:     lw   ra, 16(sp)
        lw   fp, 12(sp)
        addi sp, sp, 16