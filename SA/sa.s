	.file	"sa.c"
	.text
	.p2align 4
	.globl	getTemperature
	.type	getTemperature, @function
getTemperature:
.LFB47:
	.cfi_startproc
	endbr64
	movsd	.LC0(%rip), %xmm1
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	subsd	%xmm0, %xmm1
	divsd	%xmm1, %xmm0
	call	log2@PLT
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ebx, %xmm1
	subsd	.LC1(%rip), %xmm1
	popq	%rbx
	.cfi_def_cfa_offset 8
	divsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE47:
	.size	getTemperature, .-getTemperature
	.p2align 4
	.globl	getEll
	.type	getEll, @function
getEll:
.LFB48:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movsd	%xmm0, (%rsp)
	call	arc4random@PLT
	movl	%eax, %ebx
	movl	$1, %eax
	movl	%ebx, 0(%rbp)
	testl	%ebx, %ebx
	jne	.L14
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	.cfi_restore_state
	movl	%ebx, %eax
	pxor	%xmm0, %xmm0
	negl	%eax
	movl	%eax, %eax
	cvtsi2sdq	%rax, %xmm0
	call	log2@PLT
	movsd	%xmm0, 8(%rsp)
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rbx, %xmm0
	call	log2@PLT
	movsd	8(%rsp), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	divsd	(%rsp), %xmm0
	call	round@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	cvttsd2sil	%xmm0, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE48:
	.size	getEll, .-getEll
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"\nSA start!\n\n"
.LC3:
	.string	"Cluster %d with size %d: "
.LC4:
	.string	"\n"
.LC5:
	.string	"%d "
.LC7:
	.string	"w"
.LC8:
	.string	"cluster_info.txt"
.LC9:
	.string	"i = %d em %d --------------\n"
.LC10:
	.string	"with population %d "
.LC11:
	.string	"\n MAX MAS MAX max: %d\n\n"
.LC12:
	.string	"SA end!\n"
.LC13:
	.string	"i = %d em %d--------------\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC14:
	.string	"max_pop: %d and  max_compact: %d\n"
	.section	.rodata.str1.1
.LC15:
	.string	"max: %d\n"
	.text
	.p2align 4
	.globl	runSA
	.type	runSA, @function
runSA:
.LFB49:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$1, %edi
	movq	%rdx, %r15
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%ecx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%r9d, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	%esi, 32(%rsp)
	leaq	.LC2(%rip), %rsi
	movl	%r8d, 12(%rsp)
	movl	%r9d, 36(%rsp)
	movq	%rdx, 16(%rsp)
	call	__printf_chk@PLT
	movq	%r15, %rdi
	movl	%r14d, %edx
	movl	%r13d, %esi
	call	first_cluster@PLT
	movl	%ebp, %edx
	movq	%r15, %rdi
	movl	%r14d, %r8d
	movl	%r13d, %ecx
	movq	%rax, %rsi
	movq	%rax, %rbx
	movq	%rax, 24(%rsp)
	call	energy@PLT
	leaq	8(%rbx), %r15
	xorl	%ebp, %ebp
	leaq	.LC5(%rip), %rbx
	movl	%eax, 44(%rsp)
	testl	%r13d, %r13d
	jle	.L21
	.p2align 4,,10
	.p2align 3
.L20:
	movl	(%r15), %ecx
	movl	%ebp, %edx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	xorl	%r12d, %r12d
	call	__printf_chk@PLT
	movl	(%r15), %ecx
	testl	%ecx, %ecx
	jle	.L22
	.p2align 4,,10
	.p2align 3
.L19:
	movq	-8(%r15), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	(%rax,%r12,8), %rax
	addq	$1, %r12
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	%r12d, (%r15)
	jg	.L19
.L22:
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	addl	$1, %ebp
	addq	$16, %r15
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%ebp, %r13d
	jne	.L20
.L21:
	movl	32(%rsp), %esi
	movl	$0, 8(%rsp)
	leaq	.LC5(%rip), %rbx
	testl	%esi, %esi
	jle	.L18
	.p2align 4,,10
	.p2align 3
.L17:
	call	arc4random@PLT
	movl	%eax, %ebp
	testl	%ebp, %ebp
	jne	.L65
.L24:
	leaq	.LC7(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	fopen@PLT
	movq	24(%rsp), %r15
	movl	12(%rsp), %ecx
	movl	%r13d, %edx
	movq	16(%rsp), %rsi
	movq	%r15, %rdi
	call	change_unit@PLT
	movl	32(%rsp), %ecx
	movl	8(%rsp), %edx
	xorl	%eax, %eax
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	testl	%r13d, %r13d
	jle	.L31
	leaq	8(%r15), %rbp
	xorl	%r12d, %r12d
	movq	%rbp, %r15
	.p2align 4,,10
	.p2align 3
.L33:
	movl	(%r15), %ecx
	movl	%r12d, %edx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	xorl	%r14d, %r14d
	call	__printf_chk@PLT
	movl	(%r15), %edx
	testl	%edx, %edx
	jle	.L35
	.p2align 4,,10
	.p2align 3
.L32:
	movq	-8(%r15), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	(%rax,%r14,8), %rax
	addq	$1, %r14
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	%r14d, (%r15)
	jg	.L32
.L35:
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$16, %r15
	call	__printf_chk@PLT
	leal	1(%r12), %eax
	cmpl	%eax, %r13d
	je	.L66
	movl	%eax, %r12d
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L66:
	movq	24(%rsp), %r15
	movl	12(%rsp), %r8d
	movl	%r13d, %ecx
	movl	36(%rsp), %edx
	movq	16(%rsp), %rdi
	movq	%r15, %rsi
	call	energy_population@PLT
	movl	%r13d, %esi
	movq	%r15, %rdi
	movl	%eax, 40(%rsp)
	call	energy_compactness@PLT
	movl	40(%rsp), %edx
	movl	$1, %edi
	leaq	.LC14(%rip), %rsi
	movl	%eax, %ecx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	44(%rsp), %r14d
	leaq	.LC15(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movl	%r14d, %edx
	call	__printf_chk@PLT
	movl	12(%rsp), %r8d
	movl	%r13d, %ecx
	movq	%r15, %rsi
	movl	36(%rsp), %edx
	movq	16(%rsp), %rdi
	call	energy@PLT
	cmpl	%r14d, %eax
	jl	.L67
.L41:
	addl	$1, 8(%rsp)
	movl	8(%rsp), %eax
	cmpl	%eax, 32(%rsp)
	jne	.L17
.L18:
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	44(%rsp), %eax
	addq	$56, %rsp
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
.L65:
	.cfi_restore_state
	movl	%ebp, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	negl	%eax
	movl	%eax, %eax
	cvtsi2sdq	%rax, %xmm0
	ucomisd	%xmm0, %xmm1
	jnb	.L68
.L27:
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rbp, %xmm0
	ucomisd	%xmm0, %xmm2
	jb	.L24
	call	log2@PLT
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L67:
	movl	32(%rsp), %ecx
	movl	8(%rsp), %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC13(%rip), %rsi
	xorl	%r15d, %r15d
	call	__printf_chk@PLT
	movl	%r13d, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L38:
	movl	0(%rbp), %ecx
	movl	%r15d, %edx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	0(%rbp), %eax
	testl	%eax, %eax
	jle	.L47
	movq	-8(%rbp), %rax
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L37:
	movq	(%rax,%r14,8), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	-8(%rbp), %rax
	movq	(%rax,%r14,8), %rdx
	addq	$1, %r14
	addl	8(%rdx), %r13d
	cmpl	%r14d, 0(%rbp)
	jg	.L37
.L36:
	movl	%r13d, %edx
	leaq	.LC10(%rip), %rsi
	xorl	%eax, %eax
	addq	$16, %rbp
	movl	$1, %edi
	call	__printf_chk@PLT
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leal	1(%r15), %eax
	cmpl	%r12d, %r15d
	je	.L69
	movl	%eax, %r15d
	jmp	.L38
.L47:
	xorl	%r13d, %r13d
	jmp	.L36
.L69:
	movl	40(%rsp), %r13d
.L39:
	movl	12(%rsp), %r14d
	movq	24(%rsp), %r15
	movl	%r13d, %ecx
	movl	36(%rsp), %edx
	movq	16(%rsp), %rdi
	movl	%r14d, %r8d
	movq	%r15, %rsi
	call	energy@PLT
	leaq	.LC11(%rip), %rsi
	movl	$1, %edi
	movl	%eax, 44(%rsp)
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	%r14d, %edx
	movl	%r13d, %esi
	movq	%r15, %rdi
	call	storeState@PLT
	jmp	.L41
.L31:
	movq	24(%rsp), %r15
	movq	16(%rsp), %rbp
	movl	%r13d, %ecx
	movl	12(%rsp), %r8d
	movl	36(%rsp), %edx
	movq	%r15, %rsi
	movq	%rbp, %rdi
	call	energy_population@PLT
	movl	%r13d, %esi
	movq	%r15, %rdi
	movl	%eax, %r12d
	call	energy_compactness@PLT
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC14(%rip), %rsi
	movl	%eax, %ecx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	44(%rsp), %r14d
	leaq	.LC15(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movl	%r14d, %edx
	call	__printf_chk@PLT
	movl	12(%rsp), %r8d
	movl	%r13d, %ecx
	movq	%r15, %rsi
	movl	36(%rsp), %edx
	movq	%rbp, %rdi
	call	energy@PLT
	cmpl	%r14d, %eax
	jge	.L41
	movl	32(%rsp), %ecx
	movl	8(%rsp), %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC13(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L39
.L68:
	call	log2@PLT
	jmp	.L27
	.cfi_endproc
.LFE49:
	.size	runSA, .-runSA
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC1:
	.long	0
	.long	1071644672
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
