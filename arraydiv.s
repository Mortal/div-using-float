	.file	"arraydiv.c"
	.text
	.p2align 4,,15
	.globl	intdiv
	.type	intdiv, @function
intdiv:
.LFB0:
	.cfi_startproc
	cmpq	%rsi, %rdi
	movq	%rdx, %r8
	je	.L1
	leaq	4(%rdi), %rax
	subq	%rax, %rsi
	shrq	$2, %rsi
	leaq	4(,%rsi,4), %r9
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rdi,%rsi), %eax
	xorl	%edx, %edx
	divl	(%r8,%rsi)
	movl	%eax, (%rcx,%rsi)
	addq	$4, %rsi
	cmpq	%r9, %rsi
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
	leaq	4(%rdi), %rax
	subq	%rax, %rsi
	shrq	$2, %rsi
	leaq	4(,%rsi,4), %r8
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L12:
	movl	(%rdi,%rsi), %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	(%rdx,%rsi), %eax
	cvtsi2sdq	%rax, %xmm1
	divsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movl	%eax, (%rcx,%rsi)
	addq	$4, %rsi
	cmpq	%rsi, %r8
	jne	.L12
.L6:
	rep ret
	.cfi_endproc
.LFE1:
	.size	floatdiv, .-floatdiv
	.ident	"GCC: (GNU) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
