	.file	"arraydiv.c"
	.text
	.p2align 4,,15
	.globl	intdiv
	.type	intdiv, @function
intdiv:
.LFB0:
	.cfi_startproc
	movq	%rdx, %rcx
	cmpq	%rsi, %rdi
	je	.L5
	movl	$42, %r8d
	.p2align 4,,10
	.p2align 3
.L3:
	addq	$4, %rdi
	movl	-4(%rdi), %eax
	xorl	%edx, %edx
	addq	$4, %rcx
	divl	%r8d
	movl	%eax, -4(%rcx)
	notl	%eax
	movl	%eax, %r8d
	cmpq	%rdi, %rsi
	jne	.L3
.L5:
	ret
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
	je	.L15
	movl	$42, %eax
	.p2align 4,,10
	.p2align 3
.L13:
	addq	$4, %rdi
	movl	-4(%rdi), %ecx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	addq	$4, %rdx
	vcvtsi2sdq	%rcx, %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, -4(%rdx)
	notl	%eax
	cmpq	%rdi, %rsi
	jne	.L13
.L15:
	ret
	.cfi_endproc
.LFE1:
	.size	floatdiv, .-floatdiv
	.ident	"GCC: (GNU) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
