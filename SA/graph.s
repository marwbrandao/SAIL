	.file	"graph.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"d%d_k%d_n%d_m%d.data"
.LC1:
	.string	"r"
.LC4:
	.string	"'%d':"
.LC5:
	.string	"'voters':"
.LC6:
	.string	"%d,"
.LC7:
	.string	"%d"
	.text
	.p2align 4
	.globl	graph
	.type	graph, @function
graph:
.LFB57:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%r8, %r9
	movq	%rcx, %r8
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	leaq	.LC0(%rip), %rsi
	subq	$312, %rsp
	.cfi_def_cfa_offset 368
	movq	%fs:40, %rax
	movq	%rax, 296(%rsp)
	xorl	%eax, %eax
	leaq	32(%rsp), %r12
	call	__isoc99_sscanf@PLT
	leaq	.LC1(%rip), %rsi
	movq	%rbp, %rdi
	call	fopen@PLT
	movslq	(%rbx), %rdi
	movq	%rax, 16(%rsp)
	salq	$3, %rdi
	call	malloc@PLT
	movq	%rax, 24(%rsp)
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L2:
	movq	16(%rsp), %rdx
	movl	$256, %esi
	movq	%r12, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	je	.L75
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, %rbx
	movq	%r12, %rax
.L3:
	movl	(%rax), %ecx
	addq	$4, %rax
	leal	-16843009(%rcx), %edx
	notl	%ecx
	andl	%ecx, %edx
	andl	$-2139062144, %edx
	je	.L3
	movl	%edx, %ecx
	shrl	$16, %ecx
	testl	$32896, %edx
	cmove	%ecx, %edx
	leaq	2(%rax), %rcx
	cmove	%rcx, %rax
	movl	%edx, %esi
	addb	%dl, %sil
	sbbq	$3, %rax
	subq	%r12, %rax
	je	.L30
	leaq	-1(%rax), %rdx
	cmpq	$14, %rdx
	jbe	.L31
	movdqa	32(%rsp), %xmm1
	pxor	%xmm0, %xmm0
	pxor	%xmm3, %xmm3
	movq	%rax, %rdx
	movdqa	%xmm3, %xmm4
	shrq	$4, %rdx
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm0
	movdqa	%xmm1, %xmm2
	punpcklbw	%xmm0, %xmm2
	punpckhbw	%xmm0, %xmm1
	pcmpgtw	%xmm2, %xmm4
	movdqa	%xmm2, %xmm5
	movdqa	%xmm2, %xmm0
	movdqa	%xmm1, %xmm2
	punpcklwd	%xmm4, %xmm5
	punpckhwd	%xmm4, %xmm0
	movdqa	%xmm3, %xmm4
	pcmpgtw	%xmm1, %xmm4
	paddd	%xmm5, %xmm0
	punpcklwd	%xmm4, %xmm2
	punpckhwd	%xmm4, %xmm1
	paddd	%xmm2, %xmm0
	paddd	%xmm1, %xmm0
	cmpq	$1, %rdx
	je	.L7
	movdqa	48(%rsp), %xmm1
	pxor	%xmm2, %xmm2
	movdqa	%xmm3, %xmm5
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm2
	movdqa	%xmm1, %xmm4
	punpcklbw	%xmm2, %xmm4
	punpckhbw	%xmm2, %xmm1
	pcmpgtw	%xmm4, %xmm5
	movdqa	%xmm4, %xmm2
	punpcklwd	%xmm5, %xmm2
	punpckhwd	%xmm5, %xmm4
	paddd	%xmm2, %xmm0
	movdqa	%xmm3, %xmm2
	pcmpgtw	%xmm1, %xmm2
	paddd	%xmm4, %xmm0
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm2, %xmm4
	punpckhwd	%xmm2, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm1, %xmm0
	cmpq	$2, %rdx
	je	.L7
	movdqa	64(%rsp), %xmm1
	pxor	%xmm2, %xmm2
	movdqa	%xmm3, %xmm5
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm2
	movdqa	%xmm1, %xmm4
	punpcklbw	%xmm2, %xmm4
	punpckhbw	%xmm2, %xmm1
	pcmpgtw	%xmm4, %xmm5
	movdqa	%xmm4, %xmm2
	punpcklwd	%xmm5, %xmm2
	punpckhwd	%xmm5, %xmm4
	paddd	%xmm2, %xmm0
	movdqa	%xmm3, %xmm2
	pcmpgtw	%xmm1, %xmm2
	paddd	%xmm4, %xmm0
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm2, %xmm4
	punpckhwd	%xmm2, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm1, %xmm0
	cmpq	$3, %rdx
	je	.L7
	movdqa	80(%rsp), %xmm1
	pxor	%xmm2, %xmm2
	movdqa	%xmm3, %xmm5
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm2
	movdqa	%xmm1, %xmm4
	punpcklbw	%xmm2, %xmm4
	punpckhbw	%xmm2, %xmm1
	pcmpgtw	%xmm4, %xmm5
	movdqa	%xmm4, %xmm2
	punpcklwd	%xmm5, %xmm2
	punpckhwd	%xmm5, %xmm4
	paddd	%xmm2, %xmm0
	movdqa	%xmm3, %xmm2
	pcmpgtw	%xmm1, %xmm2
	paddd	%xmm4, %xmm0
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm2, %xmm4
	punpckhwd	%xmm2, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm1, %xmm0
	cmpq	$4, %rdx
	je	.L7
	movdqa	96(%rsp), %xmm1
	pxor	%xmm2, %xmm2
	movdqa	%xmm3, %xmm5
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm2
	movdqa	%xmm1, %xmm4
	punpcklbw	%xmm2, %xmm4
	punpckhbw	%xmm2, %xmm1
	pcmpgtw	%xmm4, %xmm5
	movdqa	%xmm4, %xmm2
	punpcklwd	%xmm5, %xmm2
	punpckhwd	%xmm5, %xmm4
	paddd	%xmm2, %xmm0
	movdqa	%xmm3, %xmm2
	pcmpgtw	%xmm1, %xmm2
	paddd	%xmm4, %xmm0
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm2, %xmm4
	punpckhwd	%xmm2, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm1, %xmm0
	cmpq	$5, %rdx
	je	.L7
	movdqa	112(%rsp), %xmm1
	pxor	%xmm2, %xmm2
	movdqa	%xmm3, %xmm5
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm2
	movdqa	%xmm1, %xmm4
	punpcklbw	%xmm2, %xmm4
	punpckhbw	%xmm2, %xmm1
	pcmpgtw	%xmm4, %xmm5
	movdqa	%xmm4, %xmm2
	punpcklwd	%xmm5, %xmm2
	punpckhwd	%xmm5, %xmm4
	paddd	%xmm2, %xmm0
	movdqa	%xmm3, %xmm2
	pcmpgtw	%xmm1, %xmm2
	paddd	%xmm4, %xmm0
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm2, %xmm4
	punpckhwd	%xmm2, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm1, %xmm0
	cmpq	$6, %rdx
	je	.L7
	movdqa	128(%rsp), %xmm2
	pxor	%xmm1, %xmm1
	movdqa	%xmm3, %xmm5
	pcmpeqb	.LC2(%rip), %xmm2
	pand	.LC3(%rip), %xmm2
	pcmpgtb	%xmm2, %xmm1
	movdqa	%xmm2, %xmm4
	punpcklbw	%xmm1, %xmm4
	punpckhbw	%xmm1, %xmm2
	pcmpgtw	%xmm4, %xmm5
	pcmpgtw	%xmm2, %xmm3
	movdqa	%xmm4, %xmm1
	punpcklwd	%xmm5, %xmm1
	punpckhwd	%xmm5, %xmm4
	paddd	%xmm1, %xmm0
	movdqa	%xmm3, %xmm1
	movdqa	%xmm2, %xmm3
	paddd	%xmm4, %xmm0
	punpcklwd	%xmm1, %xmm3
	punpckhwd	%xmm1, %xmm2
	paddd	%xmm3, %xmm0
	paddd	%xmm2, %xmm0
	cmpq	$7, %rdx
	je	.L7
	movdqa	144(%rsp), %xmm1
	pxor	%xmm2, %xmm2
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm2
	movdqa	%xmm1, %xmm4
	punpcklbw	%xmm2, %xmm4
	punpckhbw	%xmm2, %xmm1
	pxor	%xmm2, %xmm2
	movdqa	%xmm2, %xmm5
	movdqa	%xmm4, %xmm3
	pcmpgtw	%xmm4, %xmm5
	punpcklwd	%xmm5, %xmm3
	punpckhwd	%xmm5, %xmm4
	paddd	%xmm3, %xmm0
	movdqa	%xmm2, %xmm3
	pcmpgtw	%xmm1, %xmm3
	paddd	%xmm4, %xmm0
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm3, %xmm4
	punpckhwd	%xmm3, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm1, %xmm0
	cmpq	$8, %rdx
	je	.L7
	movdqa	160(%rsp), %xmm1
	pxor	%xmm3, %xmm3
	movdqa	%xmm2, %xmm5
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm3
	movdqa	%xmm1, %xmm4
	punpcklbw	%xmm3, %xmm4
	punpckhbw	%xmm3, %xmm1
	pcmpgtw	%xmm4, %xmm5
	movdqa	%xmm4, %xmm3
	punpcklwd	%xmm5, %xmm3
	punpckhwd	%xmm5, %xmm4
	paddd	%xmm3, %xmm0
	movdqa	%xmm2, %xmm3
	pcmpgtw	%xmm1, %xmm3
	paddd	%xmm4, %xmm0
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm3, %xmm4
	punpckhwd	%xmm3, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm1, %xmm0
	cmpq	$9, %rdx
	je	.L7
	movdqa	176(%rsp), %xmm1
	pxor	%xmm3, %xmm3
	movdqa	%xmm2, %xmm5
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm3
	movdqa	%xmm1, %xmm4
	punpcklbw	%xmm3, %xmm4
	punpckhbw	%xmm3, %xmm1
	pcmpgtw	%xmm4, %xmm5
	movdqa	%xmm4, %xmm3
	punpcklwd	%xmm5, %xmm3
	punpckhwd	%xmm5, %xmm4
	paddd	%xmm3, %xmm0
	movdqa	%xmm2, %xmm3
	pcmpgtw	%xmm1, %xmm3
	paddd	%xmm4, %xmm0
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm3, %xmm4
	punpckhwd	%xmm3, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm1, %xmm0
	cmpq	$10, %rdx
	je	.L7
	movdqa	192(%rsp), %xmm1
	pxor	%xmm3, %xmm3
	movdqa	%xmm2, %xmm5
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm3
	movdqa	%xmm1, %xmm4
	punpcklbw	%xmm3, %xmm4
	punpckhbw	%xmm3, %xmm1
	pcmpgtw	%xmm4, %xmm5
	movdqa	%xmm4, %xmm3
	punpcklwd	%xmm5, %xmm3
	punpckhwd	%xmm5, %xmm4
	paddd	%xmm3, %xmm0
	movdqa	%xmm2, %xmm3
	pcmpgtw	%xmm1, %xmm3
	paddd	%xmm4, %xmm0
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm3, %xmm4
	punpckhwd	%xmm3, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm1, %xmm0
	cmpq	$11, %rdx
	je	.L7
	movdqa	208(%rsp), %xmm1
	pxor	%xmm3, %xmm3
	movdqa	%xmm2, %xmm5
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm3
	movdqa	%xmm1, %xmm4
	punpcklbw	%xmm3, %xmm4
	punpckhbw	%xmm3, %xmm1
	pcmpgtw	%xmm4, %xmm5
	movdqa	%xmm4, %xmm3
	punpcklwd	%xmm5, %xmm3
	punpckhwd	%xmm5, %xmm4
	paddd	%xmm3, %xmm0
	movdqa	%xmm2, %xmm3
	pcmpgtw	%xmm1, %xmm3
	paddd	%xmm4, %xmm0
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm3, %xmm4
	punpckhwd	%xmm3, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm1, %xmm0
	cmpq	$12, %rdx
	je	.L7
	movdqa	224(%rsp), %xmm1
	pxor	%xmm3, %xmm3
	movdqa	%xmm2, %xmm5
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm3
	movdqa	%xmm1, %xmm4
	punpcklbw	%xmm3, %xmm4
	punpckhbw	%xmm3, %xmm1
	pcmpgtw	%xmm4, %xmm5
	movdqa	%xmm4, %xmm3
	punpcklwd	%xmm5, %xmm3
	punpckhwd	%xmm5, %xmm4
	paddd	%xmm3, %xmm0
	movdqa	%xmm2, %xmm3
	pcmpgtw	%xmm1, %xmm3
	paddd	%xmm4, %xmm0
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm3, %xmm4
	punpckhwd	%xmm3, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm1, %xmm0
	cmpq	$13, %rdx
	je	.L7
	movdqa	240(%rsp), %xmm1
	pxor	%xmm3, %xmm3
	movdqa	%xmm2, %xmm5
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm3
	movdqa	%xmm1, %xmm4
	punpcklbw	%xmm3, %xmm4
	punpckhbw	%xmm3, %xmm1
	pcmpgtw	%xmm4, %xmm5
	movdqa	%xmm4, %xmm3
	punpcklwd	%xmm5, %xmm3
	punpckhwd	%xmm5, %xmm4
	paddd	%xmm3, %xmm0
	movdqa	%xmm2, %xmm3
	pcmpgtw	%xmm1, %xmm3
	paddd	%xmm4, %xmm0
	movdqa	%xmm1, %xmm4
	punpcklwd	%xmm3, %xmm4
	punpckhwd	%xmm3, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm1, %xmm0
	cmpq	$15, %rdx
	jne	.L7
	movdqa	256(%rsp), %xmm1
	pxor	%xmm3, %xmm3
	movdqa	%xmm2, %xmm5
	pcmpeqb	.LC2(%rip), %xmm1
	pand	.LC3(%rip), %xmm1
	pcmpgtb	%xmm1, %xmm3
	movdqa	%xmm1, %xmm4
	punpcklbw	%xmm3, %xmm4
	punpckhbw	%xmm3, %xmm1
	pcmpgtw	%xmm4, %xmm5
	pcmpgtw	%xmm1, %xmm2
	movdqa	%xmm4, %xmm3
	punpcklwd	%xmm5, %xmm3
	paddd	%xmm3, %xmm0
	movdqa	%xmm4, %xmm3
	punpckhwd	%xmm5, %xmm3
	paddd	%xmm3, %xmm0
	movdqa	%xmm1, %xmm3
	punpcklwd	%xmm2, %xmm3
	paddd	%xmm0, %xmm3
	movdqa	%xmm1, %xmm0
	punpckhwd	%xmm2, %xmm0
	paddd	%xmm3, %xmm0
	.p2align 4,,10
	.p2align 3
.L7:
	movdqa	%xmm0, %xmm1
	movq	%rax, %rcx
	psrldq	$8, %xmm1
	andq	$-16, %rcx
	paddd	%xmm1, %xmm0
	movl	%ecx, %edx
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %ebp
	cmpq	%rcx, %rax
	je	.L5
.L6:
	movslq	%edx, %rcx
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L9
	addl	$1, %ebp
.L9:
	leal	1(%rdx), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L10
	addl	$1, %ebp
.L10:
	leal	2(%rdx), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L11
	addl	$1, %ebp
.L11:
	leal	3(%rdx), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L12
	addl	$1, %ebp
.L12:
	leal	4(%rdx), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L13
	addl	$1, %ebp
.L13:
	leal	5(%rdx), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L14
	addl	$1, %ebp
.L14:
	leal	6(%rdx), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L15
	addl	$1, %ebp
.L15:
	leal	7(%rdx), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L16
	addl	$1, %ebp
.L16:
	leal	8(%rdx), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L17
	addl	$1, %ebp
.L17:
	leal	9(%rdx), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L18
	addl	$1, %ebp
.L18:
	leal	10(%rdx), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L19
	addl	$1, %ebp
.L19:
	leal	11(%rdx), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L20
	addl	$1, %ebp
.L20:
	leal	12(%rdx), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L21
	addl	$1, %ebp
.L21:
	leal	13(%rdx), %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rcx)
	jne	.L22
	addl	$1, %ebp
.L22:
	addl	$14, %edx
	movslq	%edx, %rdx
	cmpq	%rdx, %rax
	jbe	.L5
	cmpb	$58, 32(%rsp,%rdx)
	jne	.L5
	addl	$1, %ebp
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rbx, %rdx
	leaq	.LC4(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
	leaq	.LC5(%rip), %rsi
	movq	%r12, %rdi
	subl	$2, %ebp
	call	strstr@PLT
	leaq	8(%rbx), %rdx
	leaq	.LC6(%rip), %rsi
	leaq	9(%rax), %rdi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
	movl	$44, %esi
	movq	%r12, %rdi
	call	strchr@PLT
	movslq	%ebp, %rdi
	movl	%ebp, 12(%rbx)
	leaq	0(,%rdi,4), %r15
	leaq	2(%rax), %r14
	movq	%r15, %rdi
	call	malloc@PLT
	movq	%r15, %rdi
	movq	%rax, 16(%rbx)
	movq	%rax, 8(%rsp)
	call	malloc@PLT
	movb	$0, 32(%rbx)
	movq	%rax, 24(%rbx)
	testl	%ebp, %ebp
	jle	.L25
	movq	8(%rsp), %rdx
	xorl	%r15d, %r15d
	leaq	.LC4(%rip), %rbp
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L76:
	movq	16(%rbx), %rdx
.L27:
	leaq	0(,%r15,4), %r13
	movq	%r14, %rdi
	movq	%rbp, %rsi
	xorl	%eax, %eax
	addq	%r13, %rdx
	call	__isoc99_sscanf@PLT
	movq	%r14, %rdi
	movl	$58, %esi
	call	strchr@PLT
	movq	24(%rbx), %rdx
	leaq	.LC7(%rip), %rsi
	leaq	1(%rax), %r14
	xorl	%eax, %eax
	addq	%r13, %rdx
	movq	%r14, %rdi
	call	__isoc99_sscanf@PLT
	movl	12(%rbx), %r13d
	leal	-1(%r13), %eax
	cmpl	%r15d, %eax
	je	.L26
	movq	%r14, %rdi
	movl	$44, %esi
	call	strchr@PLT
	movl	$32, %esi
	leaq	1(%rax), %rdi
	call	strchr@PLT
	leaq	1(%rax), %r14
.L26:
	addq	$1, %r15
	cmpl	%r15d, %r13d
	jg	.L76
.L25:
	movq	(%rsp), %rax
	movq	%rbx, (%rax)
	addq	$8, %rax
	movq	%rax, (%rsp)
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L75:
	movq	296(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L77
	movq	24(%rsp), %rax
	addq	$312, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	.cfi_restore_state
	xorl	%ebp, %ebp
	jmp	.L5
.L31:
	xorl	%edx, %edx
	xorl	%ebp, %ebp
	jmp	.L6
.L77:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE57:
	.size	graph, .-graph
	.p2align 4
	.globl	free_units
	.type	free_units, @function
free_units:
.LFB58:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	80(%rdi), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L79:
	movq	(%rbx), %rax
	addq	$8, %rbx
	movq	16(%rax), %rdi
	call	free@PLT
	movq	-8(%rbx), %rax
	movq	24(%rax), %rdi
	call	free@PLT
	movq	-8(%rbx), %rdi
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L79
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%r12, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE58:
	.size	free_units, .-free_units
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.byte	58
	.byte	58
	.byte	58
	.byte	58
	.byte	58
	.byte	58
	.byte	58
	.byte	58
	.byte	58
	.byte	58
	.byte	58
	.byte	58
	.byte	58
	.byte	58
	.byte	58
	.byte	58
	.align 16
.LC3:
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
