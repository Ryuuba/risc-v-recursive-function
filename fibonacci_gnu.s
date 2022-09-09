	.file	"fibonacci.cc"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.align	2
	.globl	_Z9fibonaccij
	.type	_Z9fibonaccij, @function
_Z9fibonaccij:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	sw	a0,-16(s0)
	lw	a5,-16(s0)
	bne	a5,zero,.L2
	li	a5,0
	j	.L3
.L2:
	lw	a4,-16(s0)
	li	a5,1
	beq	a4,a5,.L4
	lw	a4,-16(s0)
	li	a5,2
	bne	a4,a5,.L5
.L4:
	li	a5,1
	j	.L3
.L5:
	lw	a5,-16(s0)
	addi	a5,a5,-1
	mv	a0,a5
	call	_Z9fibonaccij
	mv	s1,a0
	lw	a5,-16(s0)
	addi	a5,a5,-2
	mv	a0,a5
	call	_Z9fibonaccij
	mv	a5,a0
	add	a5,s1,a5
.L3:
	mv	a0,a5
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	_Z9fibonaccij, .-_Z9fibonaccij
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,12
	.cfi_def_cfa 8, 0
	li	a0,0
	call	_Z9fibonaccij
	mv	a5,a0
	sw	a5,-12(s0)
	li	a5,0
	mv	a0,a5
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 12
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 10.1.0"
