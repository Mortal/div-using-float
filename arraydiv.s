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
	je	.L68
	leaq	4(%rdi), %r9
	leaq	16(%rdi), %rax
	movq	%rsi, %r11
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	16(%rcx), %rbx
	subq	%r9, %r11
	shrq	$2, %r11
	cmpq	%rax, %rcx
	setnb	%r8b
	cmpq	%rdi, %rbx
	leaq	1(%r11), %r10
	setbe	%al
	orl	%eax, %r8d
	leaq	16(%rdx), %rax
	cmpq	%rax, %rcx
	setnb	%al
	cmpq	%rdx, %rbx
	setbe	%bl
	orl	%ebx, %eax
	testb	%al, %r8b
	je	.L8
	cmpq	$6, %r10
	jbe	.L8
	movq	%rdi, %rax
	shrq	$2, %rax
	negq	%rax
	andl	$3, %eax
	je	.L55
	movl	(%rdi), %r8d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cmpq	$1, %rax
	leaq	4(%rdx), %r10
	leaq	4(%rcx), %rbp
	cvtsi2sdq	%r8, %xmm0
	movl	(%rdx), %r8d
	cvtsi2sdq	%r8, %xmm1
	divsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %r8
	movl	%r8d, (%rcx)
	je	.L9
	movl	4(%rdi), %r8d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cmpq	$3, %rax
	leaq	8(%rdi), %r9
	leaq	8(%rdx), %r10
	leaq	8(%rcx), %rbp
	cvtsi2sdq	%r8, %xmm0
	movl	4(%rdx), %r8d
	cvtsi2sdq	%r8, %xmm1
	divsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %r8
	movl	%r8d, 4(%rcx)
	jne	.L9
	movl	8(%rdi), %r8d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	leaq	12(%rdi), %r9
	leaq	12(%rdx), %r10
	leaq	12(%rcx), %rbp
	cvtsi2sdq	%r8, %xmm0
	movl	8(%rdx), %r8d
	cvtsi2sdq	%r8, %xmm1
	divsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %r8
	movl	%r8d, 8(%rcx)
.L9:
	subq	%rax, %r11
	pxor	%xmm3, %xmm3
	addq	$1, %r11
	salq	$2, %rax
	xorl	%r8d, %r8d
	movq	%r11, %rbx
	movapd	.LC0(%rip), %xmm5
	addq	%rax, %rdi
	addq	%rax, %rdx
	addq	%rax, %rcx
	movapd	.LC1(%rip), %xmm4
	shrq	$2, %rbx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L23:
	movdqa	(%rdi,%rax), %xmm0
	addq	$1, %r8
	cvtdq2pd	%xmm0, %xmm1
	movapd	%xmm1, %xmm6
	movdqu	(%rdx,%rax), %xmm2
	pshufd	$238, %xmm0, %xmm0
	cmpltpd	%xmm3, %xmm6
	cvtdq2pd	%xmm0, %xmm0
	andpd	%xmm5, %xmm6
	addpd	%xmm6, %xmm1
	cvtdq2pd	%xmm2, %xmm6
	movapd	%xmm6, %xmm7
	pshufd	$238, %xmm2, %xmm2
	cmpltpd	%xmm3, %xmm7
	cvtdq2pd	%xmm2, %xmm2
	andpd	%xmm5, %xmm7
	addpd	%xmm7, %xmm6
	divpd	%xmm6, %xmm1
	movapd	%xmm0, %xmm6
	cmpltpd	%xmm3, %xmm6
	andpd	%xmm5, %xmm6
	addpd	%xmm6, %xmm0
	movapd	%xmm2, %xmm6
	cmpltpd	%xmm3, %xmm6
	andpd	%xmm5, %xmm6
	addpd	%xmm6, %xmm2
	divpd	%xmm2, %xmm0
	movapd	%xmm4, %xmm2
	cmplepd	%xmm1, %xmm2
	movapd	%xmm2, %xmm6
	pslld	$31, %xmm2
	andpd	%xmm4, %xmm6
	subpd	%xmm6, %xmm1
	movapd	%xmm4, %xmm6
	cmplepd	%xmm0, %xmm6
	cvttpd2dq	%xmm1, %xmm1
	movapd	%xmm6, %xmm7
	pslld	$31, %xmm6
	shufps	$136, %xmm6, %xmm2
	andpd	%xmm4, %xmm7
	subpd	%xmm7, %xmm0
	cvttpd2dq	%xmm0, %xmm0
	punpcklqdq	%xmm0, %xmm1
	pxor	%xmm1, %xmm2
	movups	%xmm2, (%rcx,%rax)
	addq	$16, %rax
	cmpq	%r8, %rbx
	ja	.L23
	movq	%r11, %rdx
	andq	$-4, %rdx
	leaq	0(,%rdx,4), %rax
	addq	%rax, %r9
	addq	%rax, %r10
	addq	%rbp, %rax
	cmpq	%rdx, %r11
	je	.L6
	movl	(%r9), %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm0
	movl	(%r10), %edx
	cvtsi2sdq	%rdx, %xmm1
	divsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rdx
	movl	%edx, (%rax)
	leaq	4(%r9), %rdx
	cmpq	%rdx, %rsi
	je	.L6
	movl	4(%r9), %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm0
	movl	4(%r10), %edx
	cvtsi2sdq	%rdx, %xmm1
	divsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rdx
	movl	%edx, 4(%rax)
	leaq	8(%r9), %rdx
	cmpq	%rdx, %rsi
	je	.L6
	movl	8(%r9), %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm0
	movl	8(%r10), %edx
	cvtsi2sdq	%rdx, %xmm1
	divsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rdx
	movl	%edx, 8(%rax)
	leaq	12(%r9), %rdx
	cmpq	%rdx, %rsi
	je	.L6
	movl	12(%r9), %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm0
	movl	12(%r10), %edx
	cvtsi2sdq	%rdx, %xmm1
	divsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rdx
	movl	%edx, 12(%rax)
	leaq	16(%r9), %rdx
	cmpq	%rdx, %rsi
	je	.L6
	movl	16(%r9), %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm0
	movl	16(%r10), %edx
	cvtsi2sdq	%rdx, %xmm1
	divsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rdx
	movl	%edx, 16(%rax)
	leaq	20(%r9), %rdx
	cmpq	%rdx, %rsi
	je	.L6
	movl	20(%r9), %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm0
	movl	20(%r10), %edx
	cvtsi2sdq	%rdx, %xmm1
	divsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rdx
	movl	%edx, 20(%rax)
.L6:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L55:
	.cfi_restore_state
	movq	%rcx, %rbp
	movq	%rdx, %r10
	movq	%rdi, %r9
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L8:
	salq	$2, %r10
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L53:
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
	cmpq	%r10, %rsi
	jne	.L53
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L68:
	.cfi_restore 3
	.cfi_restore 6
	rep ret
	.cfi_endproc
.LFE1:
	.size	floatdiv, .-floatdiv
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1106247680
	.long	0
	.long	1106247680
	.align 16
.LC1:
	.long	0
	.long	1105199104
	.long	0
	.long	1105199104
	.ident	"GCC: (GNU) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
