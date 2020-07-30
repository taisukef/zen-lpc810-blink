	.text
	.syntax unified
	.eabi_attribute	67, "2.09"
	.cpu	cortex-m0
	.eabi_attribute	6, 12
	.eabi_attribute	7, 77
	.eabi_attribute	8, 0
	.eabi_attribute	9, 1
	.eabi_attribute	34, 0
	.eabi_attribute	17, 1
	.eabi_attribute	20, 1
	.eabi_attribute	21, 0
	.eabi_attribute	23, 3
	.eabi_attribute	24, 1
	.eabi_attribute	25, 1
	.eabi_attribute	38, 1
	.eabi_attribute	14, 0
	.file	"boot"
	.globl	reset
	.p2align	2
	.type	reset,%function
	.code	16
	.thumb_func
reset:
	.fnstart
	ldr	r0, .LCPI0_0
	movs	r1, #217
	str	r1, [r0]
	ldr	r0, .LCPI0_1
	ldr	r1, [r0]
	movs	r2, #3
	ands	r2, r1
	str	r2, [r0]
	movs	r0, #64
	mvns	r0, r0
	ldr	r1, .LCPI0_2
	str	r0, [r1]
	ldr	r0, .LCPI0_3
	movs	r1, #12
	str	r1, [r0]
	ldr	r0, .LCPI0_4
	ldr	r1, .LCPI0_6
	ldr	r2, .LCPI0_5
.LBB0_1:
	mov	r3, r0
	cmp	r3, #0
	mov	r4, r0
	beq	.LBB0_4
.LBB0_2:
	movs	r4, #4
	str	r4, [r2]
	subs	r3, r3, #1
	cmp	r3, #0
	mov	r4, r0
	bne	.LBB0_2
	b	.LBB0_4
.LBB0_3:
	movs	r3, #4
	str	r3, [r1]
	subs	r4, r4, #1
.LBB0_4:
	cmp	r4, #0
	bne	.LBB0_3
	b	.LBB0_1
	.p2align	2
.LCPI0_0:
	.long	1074036864
.LCPI0_1:
	.long	1074003984
.LCPI0_2:
	.long	1073791424
.LCPI0_3:
	.long	2684362752
.LCPI0_4:
	.long	400000
.LCPI0_5:
	.long	2684363264
.LCPI0_6:
	.long	2684363392
.Lfunc_end0:
	.size	reset, .Lfunc_end0-reset
	.cantunwind
	.fnend

	.type	RESET_VECTOR,%object
	.section	.vector_table.reset_vector,"a",%progbits
	.globl	RESET_VECTOR
	.p2align	2
RESET_VECTOR:
	.long	reset
	.size	RESET_VECTOR, 4

	.type	DUMMY,%object
	.section	.dummy,"a",%progbits
	.globl	DUMMY
	.p2align	2
DUMMY:
	.zero	20
	.size	DUMMY, 20

	.type	VALID_CODE,%object
	.section	.valid_code,"aM",%progbits,4
	.globl	VALID_CODE
	.p2align	2
VALID_CODE:
	.long	4026530783
	.size	VALID_CODE, 4

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2
