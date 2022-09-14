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
        # char temp = *x;
        lb   t0, 0(a0)
        # *x = *y;
        lb   t1, 0(a1)
        sb   t1, 0(a0)
        # *y = temp;
        sb   t0, 0(a1)
        jr   ra

# Recursive function inverting the elements of an c-style string
# Frame size: 32 bytes 
#           - 16 bytes to back both ra and fp up
#           - 16 bytes to back both a0 and a1 up
# Arguments: a0 <-> str*, a1 <-> k
# Register convention: use as few temporal registers as possible
    .globl reverse_str
reverse_str:
        # frame creation
        addi sp, sp, -32
        sw   ra, 32(sp)
        sw   fp, 28(sp)
        addi fp, sp, 32
        # If (*(str + pos) == '\0')
        add  t0, a0, a1
        lbu  t0, 0(t0)
        bne  t0, zero, L1
        # return;
        lw   ra, 32(sp)
        lw   fp, 28(sp)
        addi sp, sp, 32
        jr   ra
        # reverse_str(str, pos + 1);
L1:     sw   a1, -16(fp)
        sw   a0, -20(fp)
        lw   t0, -16(fp)
        addi a1, t0, 1
        lw   a0, -20(fp)
        jal  reverse_str
        lw   a1, -16(fp)
        lw   a0, -20(fp)
        # If (i <= pos)
        lw   t0, 0(gp)
        bgt  t0, a1, L2
        # swap(&str[i++], &str[pos]);
        sw   a1, -16(fp)
        sw   a0, -20(fp)
        lw   t0, -20(fp)
        lw   t1, -16(fp)
        add  a1, t0, t1
        lw   t0, 0(gp)
        lw   t1, -20(fp)
        add  a0, t1, t0
        lw   t0, 0(gp)
        addi t0, t0, 1
        sw   t0, 0(gp)
        jal  swap
        lw   a1, -16(fp)
        lw   a0, -20(fp)
        # return;
L2:     lw   ra, 32(sp)
        lw   fp, 28(sp)
        addi sp, sp, 32
        jr   ra

# Main function
# Frame size: 48 bytes
#           - 16 bytes to back both ra and fp up
#           - 32 bytes to store local variables
# Register convention: Use as few temporal register as possible
    .globl main
main:
        # Frame creation
        addi sp, sp, -48
        sw   ra, 48(sp)
        sw   fp, 44(sp)
        addi fp, sp, 48
        # char a[] = "Anita lava la tina";
        addi t0, fp, -31
        addi t1, zero, 0x41
        sb   t1, 0(t0)
        addi t1, zero, 0x6E
        sb   t1, 1(t0)
        addi t1, zero, 0x69
        sb   t1, 2(t0)
        addi t1, zero, 0x74
        sb   t1, 3(t0)
        addi t1, zero, 0x61
        sb   t1, 4(t0)
        addi t1, zero, 0x20
        sb   t1, 5(t0)
        addi t1, zero, 0x6C
        sb   t1, 6(t0)
        addi t1, zero, 0x61
        sb   t1, 7(t0)
        addi t1, zero, 0x76
        sb   t1, 8(t0)
        addi t1, zero, 0x61
        sb   t1, 9(t0)
        addi t1, zero, 0x20
        sb   t1, 10(t0)
        addi t1, zero, 0x6C
        sb   t1, 11(t0)
        addi t1, zero, 0x61
        sb   t1, 12(t0)
        addi t1, zero, 0x20
        sb   t1, 13(t0)
        addi t1, zero, 0x74
        sb   t1, 14(t0)
        addi t1, zero, 0x69
        sb   t1, 15(t0)
        addi t1, zero, 0x6E
        sb   t1, 16(t0)
        addi t1, zero, 0x61
        sb   t1, 17(t0)
        addi t1, zero, 0x00
        sb   t1, 18(t0)
        # unsigned initial_position = 0;
        addi t0, zero, 0
        sw   t0, -36(fp)
        # reverse_str(a, initial_position);
        lw   a1, -36(fp)
        addi a0, fp, -31
        jal  reverse_str
        # return 0;
        addi a0, zero, 0
        lw   ra, 48(sp)
        lw   fp, 44(sp)
        addi sp, sp, 48
        jr   ra
