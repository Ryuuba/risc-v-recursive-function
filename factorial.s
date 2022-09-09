# This function computes x!
# Frame size: 32 bytes
#           - 16 bytes to back both ra and fp up
#           - 16 bytes to back a0 up
# Arguments: a0 <-> x
# Return value: a0 <-> x!
# Register convention: Use as few register as possible
    .text
    .globl factorial
factorial:
        addi sp, sp, -32
        sw   ra, 32(sp)
        sw   fp, 28(sp)
        addi fp, sp, 32
        li   t0, 2
        bge  a0, t0, L1
        li   a0, 1
        lw   ra, 32(sp)
        lw   fp, 28(sp)
        addi sp, sp, 32
        jr   ra
L1:     sw   a0, -16(fp)
        addi a0, a0, -1
        jal  factorial
        mv   t0, a0
        lw   a0, -16(fp)
        mul  a0, a0, t0
        lw   ra, 32(sp)
        lw   fp, 28(sp)
        addi sp, sp, 32
        jr   ra

# This function computes x!
# Frame size: 32 bytes
#           - 16 bytes to back both ra and fp up
#           - 16 bytes to store local variables
# Register convention: Use as few register as possible
    .globl main
main:
        addi sp, sp, -32
        sw   ra, 32(sp)
        sw   fp, 28(sp)
        addi fp, sp, 32
        addi a0, zero, 10
        jal  factorial
        sw   a0, -16(fp)
        li   a0, 0
        lw   ra, 32(sp)
        lw   fp, 28(sp)
        addi sp, sp, 32
        jr   ra