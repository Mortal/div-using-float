	.file	"arraydiv.c"
	.text
	.p2align 4,,15
	.globl	intdiv
	.type	intdiv, @function
intdiv:
.LFB0:
	.cfi_startproc
	movq	%rdx, %r8
	cmpq	%rsi, %rdi
	je	.L5
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
	je	.L132
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	movq	%rsi, %r9
	andq	$-32, %rsp
	pushq	-8(%r10)
	leaq	4(%rdi), %r8
	pushq	%rbp
	subq	%r8, %r9
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	movq	%r8, %r11
	leaq	32(%rdi), %rax
	pushq	%r12
	shrq	$2, %r9
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	leaq	32(%rcx), %r12
	cmpq	%rax, %rcx
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	setnb	%r10b
	cmpq	%rdi, %r12
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	leaq	1(%r9), %rbx
	setbe	%al
	orl	%eax, %r10d
	leaq	32(%rdx), %rax
	cmpq	%rax, %rcx
	setnb	%al
	cmpq	%rdx, %r12
	setbe	%r12b
	orl	%r12d, %eax
	testb	%al, %r10b
	je	.L9
	cmpq	$10, %rbx
	jbe	.L9
	movq	%rdi, %rax
	shrq	$2, %rax
	negq	%rax
	andl	$7, %eax
	leaq	7(%rax), %r10
	cmpq	%r10, %r9
	jb	.L10
	testq	%rax, %rax
	je	.L105
	movl	(%rdi), %r8d
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	leaq	4(%rdx), %r12
	leaq	4(%rcx), %rbx
	vcvtsi2sdq	%r8, %xmm0, %xmm0
	movl	(%rdx), %r8d
	vcvtsi2sdq	%r8, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %r8
	movl	%r8d, (%rcx)
	cmpq	$1, %rax
	je	.L11
	movl	4(%rdi), %r8d
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	leaq	8(%rdi), %r11
	leaq	8(%rdx), %r12
	leaq	8(%rcx), %rbx
	vcvtsi2sdq	%r8, %xmm0, %xmm0
	movl	4(%rdx), %r8d
	vcvtsi2sdq	%r8, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %r8
	movl	%r8d, 4(%rcx)
	cmpq	$2, %rax
	je	.L11
	movl	8(%rdi), %r8d
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	leaq	12(%rdi), %r11
	leaq	12(%rdx), %r12
	leaq	12(%rcx), %rbx
	vcvtsi2sdq	%r8, %xmm0, %xmm0
	movl	8(%rdx), %r8d
	vcvtsi2sdq	%r8, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %r8
	movl	%r8d, 8(%rcx)
	cmpq	$3, %rax
	je	.L11
	movl	12(%rdi), %r8d
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	leaq	16(%rdi), %r11
	leaq	16(%rdx), %r12
	leaq	16(%rcx), %rbx
	vcvtsi2sdq	%r8, %xmm0, %xmm0
	movl	12(%rdx), %r8d
	vcvtsi2sdq	%r8, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %r8
	movl	%r8d, 12(%rcx)
	cmpq	$4, %rax
	je	.L11
	movl	16(%rdi), %r8d
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	leaq	20(%rdi), %r11
	leaq	20(%rdx), %r12
	leaq	20(%rcx), %rbx
	vcvtsi2sdq	%r8, %xmm0, %xmm0
	movl	16(%rdx), %r8d
	vcvtsi2sdq	%r8, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %r8
	movl	%r8d, 16(%rcx)
	cmpq	$5, %rax
	je	.L11
	movl	20(%rdi), %r8d
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	leaq	24(%rdi), %r11
	leaq	24(%rdx), %r12
	leaq	24(%rcx), %rbx
	vcvtsi2sdq	%r8, %xmm0, %xmm0
	movl	20(%rdx), %r8d
	vcvtsi2sdq	%r8, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %r8
	movl	%r8d, 20(%rcx)
	cmpq	$7, %rax
	jne	.L11
	movl	24(%rdi), %r8d
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	leaq	28(%rdi), %r11
	leaq	28(%rdx), %r12
	leaq	28(%rcx), %rbx
	vcvtsi2sdq	%r8, %xmm0, %xmm0
	movl	24(%rdx), %r8d
	vcvtsi2sdq	%r8, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %r8
	movl	%r8d, 24(%rcx)
.L11:
	subq	%rax, %r9
	salq	$2, %rax
	xorl	%r8d, %r8d
	vmovapd	.LC0(%rip), %ymm4
	addq	$1, %r9
	addq	%rax, %rdi
	addq	%rax, %rdx
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	%r9, %r10
	vmovapd	.LC1(%rip), %ymm3
	addq	%rax, %rcx
	xorl	%eax, %eax
	vmovapd	.LC2(%rip), %ymm5
	shrq	$3, %r10
	.p2align 4,,10
	.p2align 3
.L41:
	vmovdqa	(%rdi,%rax), %ymm0
	addq	$1, %r8
	vmovdqu	(%rdx,%rax), %xmm6
	vinsertf128	$0x1, 16(%rdx,%rax), %ymm6, %ymm6
	vcvtdq2pd	%xmm0, %ymm1
	vcmpltpd	%ymm2, %ymm1, %ymm7
	vextractf128	$0x1, %ymm0, %xmm0
	vcvtdq2pd	%xmm0, %ymm0
	vandpd	%ymm4, %ymm7, %ymm7
	vaddpd	%ymm7, %ymm1, %ymm1
	vcvtdq2pd	%xmm6, %ymm7
	vextractf128	$0x1, %ymm6, %xmm6
	vcmpltpd	%ymm2, %ymm7, %ymm8
	vcvtdq2pd	%xmm6, %ymm6
	vandpd	%ymm4, %ymm8, %ymm8
	vaddpd	%ymm8, %ymm7, %ymm7
	vdivpd	%ymm7, %ymm1, %ymm1
	vcmpltpd	%ymm2, %ymm0, %ymm7
	vandpd	%ymm4, %ymm7, %ymm7
	vaddpd	%ymm7, %ymm0, %ymm0
	vcmpltpd	%ymm2, %ymm6, %ymm7
	vandpd	%ymm4, %ymm7, %ymm7
	vaddpd	%ymm7, %ymm6, %ymm6
	vdivpd	%ymm6, %ymm0, %ymm0
	vcmplepd	%ymm1, %ymm3, %ymm6
	vandpd	%ymm3, %ymm6, %ymm7
	vsubpd	%ymm7, %ymm1, %ymm1
	vandpd	%ymm5, %ymm6, %ymm6
	vcmplepd	%ymm0, %ymm3, %ymm7
	vcvttpd2dqy	%ymm1, %xmm1
	vandpd	%ymm3, %ymm7, %ymm8
	vsubpd	%ymm8, %ymm0, %ymm0
	vandpd	%ymm5, %ymm7, %ymm7
	vcvttpd2dqy	%ymm0, %xmm0
	vinsertf128	$0x1, %xmm0, %ymm1, %ymm0
	vshufps	$136, %ymm7, %ymm6, %ymm1
	vperm2f128	$3, %ymm1, %ymm1, %ymm6
	vshufps	$68, %ymm6, %ymm1, %ymm7
	vshufps	$238, %ymm6, %ymm1, %ymm6
	vinsertf128	$1, %xmm6, %ymm7, %ymm6
	vxorps	%ymm6, %ymm0, %ymm0
	vmovups	%xmm0, (%rcx,%rax)
	vextractf128	$0x1, %ymm0, 16(%rcx,%rax)
	addq	$32, %rax
	cmpq	%r8, %r10
	ja	.L41
	movq	%r9, %rax
	andq	$-8, %rax
	leaq	0(,%rax,4), %rcx
	leaq	(%r11,%rcx), %rdi
	leaq	(%r12,%rcx), %rdx
	addq	%rbx, %rcx
	cmpq	%rax, %r9
	je	.L129
	leaq	4(%rdi), %r8
	vzeroupper
.L10:
	movl	(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, (%rcx)
	cmpq	%r8, %rsi
	je	.L130
	movl	4(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	4(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, 4(%rcx)
	leaq	8(%rdi), %rax
	cmpq	%rax, %rsi
	je	.L130
	movl	8(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	8(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, 8(%rcx)
	leaq	12(%rdi), %rax
	cmpq	%rax, %rsi
	je	.L130
	movl	12(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	12(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, 12(%rcx)
	leaq	16(%rdi), %rax
	cmpq	%rax, %rsi
	je	.L130
	movl	16(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	16(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, 16(%rcx)
	leaq	20(%rdi), %rax
	cmpq	%rax, %rsi
	je	.L130
	movl	20(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	20(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, 20(%rcx)
	leaq	24(%rdi), %rax
	cmpq	%rax, %rsi
	je	.L130
	movl	24(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	24(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, 24(%rcx)
	leaq	28(%rdi), %rax
	cmpq	%rax, %rsi
	je	.L130
	movl	28(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	28(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, 28(%rcx)
	leaq	32(%rdi), %rax
	cmpq	%rax, %rsi
	je	.L130
	movl	32(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	32(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, 32(%rcx)
	leaq	36(%rdi), %rax
	cmpq	%rax, %rsi
	je	.L130
	movl	36(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	36(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, 36(%rcx)
	leaq	40(%rdi), %rax
	cmpq	%rax, %rsi
	je	.L130
	movl	40(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	40(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, 40(%rcx)
	leaq	44(%rdi), %rax
	cmpq	%rax, %rsi
	je	.L130
	movl	44(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	44(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, 44(%rcx)
	leaq	48(%rdi), %rax
	cmpq	%rax, %rsi
	je	.L130
	movl	48(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	48(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, 48(%rcx)
	leaq	52(%rdi), %rax
	cmpq	%rax, %rsi
	je	.L130
	movl	52(%rdi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	52(%rdx), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, 52(%rcx)
.L130:
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	salq	$2, %rbx
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L103:
	movl	(%rdi,%rsi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	(%rdx,%rsi), %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvttsd2siq	%xmm0, %rax
	movl	%eax, (%rcx,%rsi)
	addq	$4, %rsi
	cmpq	%rbx, %rsi
	jne	.L103
	popq	%rbx
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L132:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L129:
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	vzeroupper
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L105:
	movq	%rcx, %rbx
	movq	%rdx, %r12
	movq	%rdi, %r11
	jmp	.L11
	.cfi_endproc
.LFE1:
	.size	floatdiv, .-floatdiv
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.long	0
	.long	1106247680
	.long	0
	.long	1106247680
	.long	0
	.long	1106247680
	.long	0
	.long	1106247680
	.align 32
.LC1:
	.long	0
	.long	1105199104
	.long	0
	.long	1105199104
	.long	0
	.long	1105199104
	.long	0
	.long	1105199104
	.align 32
.LC2:
	.long	2147483648
	.long	-2147483648
	.long	2147483648
	.long	-2147483648
	.long	2147483648
	.long	-2147483648
	.long	2147483648
	.long	-2147483648
	.ident	"GCC: (GNU) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
