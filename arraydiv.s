	.file	"arraydiv.c"
	.text
	.p2align 4,,15
	.globl	intdiv
	.type	intdiv, @function
intdiv:
.LFB0:
	.cfi_startproc
	cmpq	%rsi, %rdi
	movq	%rdx, %rcx
	je	.L1
	movl	$42, %r8d
	.p2align 4,,10
	.p2align 3
.L3:
	addq	$4, %rdi
	movl	-4(%rdi), %eax
	xorl	%edx, %edx
	addq	$4, %rcx
	divl	%r8d
	cmpq	%rdi, %rsi
	movl	%eax, -4(%rcx)
	notl	%eax
	movl	%eax, %r8d
	jne	.L3
.L1:
	rep ret
	.cfi_endproc
.LFE0:
	.size	intdiv, .-intdiv
	.p2align 4,,15
	.globl	floatdiv
	.type	floatdiv, @function
floatdiv:
.LFB1:
	.cfi_startproc
	cmpq	%rsi, %rdi
	je	.L6
	movl	$42, %eax
	.p2align 4,,10
	.p2align 3
.L12:
	addq	$4, %rdi
	movl	-4(%rdi), %ecx
	addq	$4, %rdx
	pxor	%xmm1, %xmm1
	cmpq	%rdi, %rsi
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rcx, %xmm1
	cvtsi2sdq	%rax, %xmm0
	divsd	%xmm0, %xmm1
	cvttsd2siq	%xmm1, %rax
	movl	%eax, -4(%rdx)
	notl	%eax
	jne	.L12
.L6:
	rep ret
	.cfi_endproc
.LFE1:
	.size	floatdiv, .-floatdiv
	.ident	"GCC: (GNU) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
