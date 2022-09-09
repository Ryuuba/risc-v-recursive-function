	.file	"reverse_str.cc"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.align	2
	.globl	_Z4swapPcS_
	.type	_Z4swapPcS_, @function
_Z4swapPcS_:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	sw	a0,-12(s0)
	sw	a1,-16(s0)
	lw	a5,-12(s0)
	lbu	a5,0(a5)
	sb	a5,-5(s0)
	lw	a5,-16(s0)
	lbu	a4,0(a5)
	lw	a5,-12(s0)
	sb	a4,0(a5)
	lw	a5,-16(s0)
	lbu	a4,-5(s0)
	sb	a4,0(a5)
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	_Z4swapPcS_, .-_Z4swapPcS_
	.local	_ZZ11reverse_strPciE1i
	.comm	_ZZ11reverse_strPciE1i,4,4
	.align	2
	.globl	_Z11reverse_strPci
	.type	_Z11reverse_strPci, @function
_Z11reverse_strPci:
.LFB1:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	sw	a0,-12(s0)
	sw	a1,-16(s0)
	lw	a5,-16(s0)
	lw	a4,-12(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	beq	a5,zero,.L5
	lw	a5,-16(s0)
	addi	a5,a5,1
	mv	a1,a5
	lw	a0,-12(s0)
	call	_Z11reverse_strPci
	lui	a5,%hi(_ZZ11reverse_strPciE1i)
	lw	a5,%lo(_ZZ11reverse_strPciE1i)(a5)
	lw	a4,-16(s0)
	blt	a4,a5,.L2
	lui	a5,%hi(_ZZ11reverse_strPciE1i)
	lw	a5,%lo(_ZZ11reverse_strPciE1i)(a5)
	addi	a3,a5,1
	lui	a4,%hi(_ZZ11reverse_strPciE1i)
	sw	a3,%lo(_ZZ11reverse_strPciE1i)(a4)
	mv	a4,a5
	lw	a5,-12(s0)
	add	a3,a5,a4
	lw	a5,-16(s0)
	lw	a4,-12(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	call	_Z4swapPcS_
	j	.L2
.L5:
	nop
.L2:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	_Z11reverse_strPci, .-_Z11reverse_strPci
	.section	.rodata
	.align	2
.LC0:
	.string	"Anita lava la tina"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	addi	sp,sp,-28
	.cfi_def_cfa_offset 28
	sw	ra,24(sp)
	sw	s0,20(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,28
	.cfi_def_cfa 8, 0
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	lw	a1,0(a5)
	lw	a2,4(a5)
	lw	a3,8(a5)
	lw	a4,12(a5)
	sw	a1,-28(s0)
	sw	a2,-24(s0)
	sw	a3,-20(s0)
	sw	a4,-16(s0)
	lhu	a4,16(a5)
	sh	a4,-12(s0)
	lbu	a5,18(a5)
	sb	a5,-10(s0)
	addi	a5,s0,-28
	li	a1,0
	mv	a0,a5
	call	_Z11reverse_strPci
	li	a5,0
	mv	a0,a5
	lw	ra,24(sp)
	.cfi_restore 1
	lw	s0,20(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 28
	addi	sp,sp,28
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 10.1.0"
