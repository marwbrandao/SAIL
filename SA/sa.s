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
.LC3:
	.string	"\nSA start!\n\n"
.LC4:
	.string	"w"
.LC5:
	.string	"output.txt"
.LC6:
	.string	"%d;%d;%d\n"
.LC7:
	.string	"0,%d:"
.LC8:
	.string	"%d,"
.LC9:
	.string	"\n"
.LC10:
	.string	"Cluster %d with size %d: "
.LC11:
	.string	"%d "
.LC12:
	.string	"cluster_info.txt"
.LC13:
	.string	"prob: %f compact\n"
.LC14:
	.string	"prob: %f pop\n"
.LC16:
	.string	"%d,%d:"
.LC17:
	.string	" --> popula\303\247\303\243o: %d"
.LC18:
	.string	"prob: %f and random: %f\n"
.LC19:
	.string	"fronteiras internas: %d\n"
.LC20:
	.string	"SA end!\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC21:
	.string	"Tstart: %f, Tstop: %f, steps: %d\n"
	.section	.rodata.str1.1
.LC22:
	.string	"ratio: %f\n"
.LC23:
	.string	"exponent: %f\n"
.LC24:
	.string	"alpha: %f\n"
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
	xorl	%eax, %eax
	movq	%rdx, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %r14d
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%r8d, %ebx
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movl	%esi, 88(%rsp)
	leaq	.LC3(%rip), %rsi
	movsd	%xmm0, 24(%rsp)
	movsd	%xmm1, 8(%rsp)
	movq	%rdx, 80(%rsp)
	movl	%r8d, 56(%rsp)
	movl	%r9d, 92(%rsp)
	call	__printf_chk@PLT
	pxor	%xmm7, %xmm7
	xorl	%edi, %edi
	cvtsi2sdl	%r14d, %xmm7
	movsd	%xmm7, 16(%rsp)
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	leaq	.LC4(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	fopen@PLT
	movl	%r14d, %r9d
	movl	%ebx, %r8d
	movl	%r13d, %ecx
	movq	%rax, %rdi
	leaq	.LC6(%rip), %rdx
	movl	$1, %esi
	movq	%rax, %rbp
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	%ebx, %edx
	movl	%r13d, %esi
	movq	%r15, %rdi
	call	first_cluster@PLT
	movq	%rax, 48(%rsp)
	testl	%r13d, %r13d
	jle	.L16
	leaq	8(%rax), %rbx
	xorl	%eax, %eax
	leaq	.LC8(%rip), %r12
	movq	%rbx, 32(%rsp)
	movl	%eax, %r15d
	.p2align 4,,10
	.p2align 3
.L19:
	movl	$1, %esi
	movl	%r15d, %ecx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	leaq	.LC7(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	(%rbx), %esi
	testl	%esi, %esi
	jle	.L17
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L18:
	movq	-8(%rbx), %rax
	movq	%r12, %rdx
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	(%rax,%r14,8), %rax
	addq	$1, %r14
	movl	(%rax), %ecx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	cmpl	%r14d, (%rbx)
	jg	.L18
.L17:
	leaq	.LC9(%rip), %rdx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	addq	$16, %rbx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	leal	1(%r15), %eax
	cmpl	%eax, %r13d
	je	.L77
	movl	%eax, %r15d
	jmp	.L19
.L77:
	movq	32(%rsp), %rbx
	xorl	%r14d, %r14d
	movq	%rbp, 32(%rsp)
	leaq	.LC11(%rip), %r12
	movq	%rbx, %rbp
	movl	%r15d, %ebx
	.p2align 4,,10
	.p2align 3
.L22:
	movl	0(%rbp), %ecx
	movl	%r14d, %edx
	leaq	.LC10(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	0(%rbp), %ecx
	testl	%ecx, %ecx
	jle	.L20
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L21:
	movq	-8(%rbp), %rax
	movq	%r12, %rsi
	movl	$1, %edi
	movq	(%rax,%r15,8), %rax
	addq	$1, %r15
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	%r15d, 0(%rbp)
	jg	.L21
.L20:
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$16, %rbp
	call	__printf_chk@PLT
	leal	1(%r14), %eax
	cmpl	%r14d, %ebx
	je	.L78
	movl	%eax, %r14d
	jmp	.L22
.L78:
	movl	88(%rsp), %ebx
	movsd	8(%rsp), %xmm1
	leaq	.LC21(%rip), %rsi
	movl	$1, %edi
	movsd	24(%rsp), %xmm0
	movl	$2, %eax
	movq	32(%rsp), %rbp
	movl	%ebx, %edx
	call	__printf_chk@PLT
	movsd	8(%rsp), %xmm2
	movl	$1, %edi
	divsd	24(%rsp), %xmm2
	leaq	.LC22(%rip), %rsi
	movapd	%xmm2, %xmm0
	movl	$1, %eax
	movsd	%xmm2, 32(%rsp)
	call	__printf_chk@PLT
	movl	$1, %edi
	movl	$1, %eax
	movsd	.LC0(%rip), %xmm1
	leaq	.LC23(%rip), %rsi
	movsd	%xmm1, 96(%rsp)
	divsd	16(%rsp), %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm1, 8(%rsp)
	call	__printf_chk@PLT
	movsd	32(%rsp), %xmm2
	movsd	8(%rsp), %xmm1
	movapd	%xmm2, %xmm0
	call	pow@PLT
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC24(%rip), %rsi
	movsd	%xmm0, 72(%rsp)
	call	__printf_chk@PLT
	testl	%ebx, %ebx
	jle	.L45
.L44:
	movabsq	$9223372036854775807, %rax
	movl	$1, 8(%rsp)
	movl	$-2147483648, %r12d
	leaq	.LC8(%rip), %rbx
	movq	%rax, 104(%rsp)
	movl	%r13d, 16(%rsp)
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L25:
	leaq	.LC4(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	fopen@PLT
	movl	16(%rsp), %r15d
	movq	80(%rsp), %r13
	movq	48(%rsp), %r14
	movl	56(%rsp), %ecx
	movq	%r13, %rsi
	movl	%r15d, %edx
	movq	%r14, %rdi
	call	change_unit@PLT
	movl	56(%rsp), %r8d
	movq	%r13, %rdi
	movl	%r15d, %ecx
	movl	92(%rsp), %edx
	movq	%r14, %rsi
	call	energy_population@PLT
	movl	%r15d, %esi
	movq	%r14, %rdi
	movq	%rax, 40(%rsp)
	movq	%rax, %r13
	call	energy_compactness@PLT
	cmpl	%r12d, %eax
	movl	%eax, 60(%rsp)
	setg	%al
	testq	%r13, %r13
	jne	.L51
	movsd	96(%rsp), %xmm6
	movsd	%xmm6, 32(%rsp)
	testb	%al, %al
	je	.L51
.L32:
	call	rand@PLT
	movsd	32(%rsp), %xmm4
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	divsd	.LC15(%rip), %xmm0
	movsd	%xmm0, 64(%rsp)
	comisd	%xmm0, %xmm4
	ja	.L79
.L35:
	movsd	24(%rsp), %xmm3
	mulsd	72(%rsp), %xmm3
	addl	$1, 8(%rsp)
	movl	8(%rsp), %eax
	movsd	%xmm3, 24(%rsp)
	cmpl	%eax, 88(%rsp)
	jl	.L80
.L41:
	call	arc4random@PLT
	testl	%eax, %eax
	je	.L25
	movl	%eax, %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm7, %xmm7
	negl	%edx
	movl	%edx, %edx
	cvtsi2sdq	%rdx, %xmm0
	ucomisd	%xmm0, %xmm7
	jnb	.L81
.L28:
	movl	%eax, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm0
	ucomisd	%xmm0, %xmm2
	jb	.L25
	call	log2@PLT
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L51:
	movq	104(%rsp), %rdx
	cmpq	%rdx, 40(%rsp)
	jle	.L34
	testb	%al, %al
	je	.L34
	movsd	96(%rsp), %xmm0
	divsd	24(%rsp), %xmm0
	call	exp@PLT
	leaq	.LC13(%rip), %rdx
	movl	$1, %esi
	movq	%rbp, %rdi
	movl	$1, %eax
	movsd	%xmm0, 32(%rsp)
	call	__fprintf_chk@PLT
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L34:
	cmpl	%r12d, 60(%rsp)
	jge	.L49
	movq	104(%rsp), %rcx
	cmpq	%rcx, 40(%rsp)
	jge	.L49
	movsd	96(%rsp), %xmm0
	divsd	24(%rsp), %xmm0
	call	exp@PLT
	leaq	.LC14(%rip), %rdx
	movl	$1, %esi
	movq	%rbp, %rdi
	movl	$1, %eax
	movsd	%xmm0, 32(%rsp)
	call	__fprintf_chk@PLT
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L79:
	movl	16(%rsp), %edx
	testl	%edx, %edx
	jle	.L37
	movq	48(%rsp), %rax
	xorl	%r12d, %r12d
	leaq	8(%rax), %r15
	.p2align 4,,10
	.p2align 3
.L40:
	movl	8(%rsp), %ecx
	movl	%r12d, %r8d
	leaq	.LC16(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%rbp, %rdi
	call	__fprintf_chk@PLT
	movl	(%r15), %eax
	testl	%eax, %eax
	jle	.L50
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L39:
	movq	-8(%r15), %rax
	movq	%rbx, %rdx
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	(%rax,%r13,8), %rax
	addq	$1, %r13
	movl	(%rax), %ecx
	addl	8(%rax), %r14d
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	cmpl	%r13d, (%r15)
	jg	.L39
.L38:
	movl	%r14d, %ecx
	leaq	.LC17(%rip), %rdx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$1, %esi
	addl	$1, %r12d
	addq	$16, %r15
	call	__fprintf_chk@PLT
	movl	$1, %esi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	leaq	.LC9(%rip), %rdx
	call	__fprintf_chk@PLT
	cmpl	%r12d, 16(%rsp)
	jne	.L40
.L37:
	movsd	64(%rsp), %xmm1
	movsd	32(%rsp), %xmm0
	movl	$1, %esi
	movq	%rbp, %rdi
	leaq	.LC18(%rip), %rdx
	movl	$2, %eax
	call	__fprintf_chk@PLT
	movl	60(%rsp), %r12d
	movq	%rbp, %rdi
	xorl	%eax, %eax
	leaq	.LC19(%rip), %rdx
	movl	$1, %esi
	movl	%r12d, %ecx
	call	__fprintf_chk@PLT
	movl	56(%rsp), %edx
	movl	16(%rsp), %esi
	movq	48(%rsp), %rdi
	call	storeState@PLT
	movq	40(%rsp), %rax
	movq	%rax, 104(%rsp)
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L50:
	xorl	%r14d, %r14d
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L49:
	movq	$0x000000000, 32(%rsp)
	jmp	.L32
.L80:
	movl	16(%rsp), %r13d
	testl	%r13d, %r13d
	jle	.L42
.L45:
	xorl	%ebx, %ebx
	leaq	.LC9(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L43:
	movq	%r12, %rdx
	movl	$1, %esi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	addl	$1, %ebx
	cmpl	%ebx, %r13d
	jg	.L43
.L42:
	movq	%rbp, %rdi
	call	fclose@PLT
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %edi
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	leaq	.LC20(%rip), %rsi
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
	jmp	__printf_chk@PLT
.L16:
	.cfi_restore_state
	movl	88(%rsp), %ebx
	movsd	8(%rsp), %xmm1
	leaq	.LC21(%rip), %rsi
	movl	$1, %edi
	movsd	24(%rsp), %xmm0
	movl	$2, %eax
	movl	%ebx, %edx
	call	__printf_chk@PLT
	movsd	8(%rsp), %xmm2
	movl	$1, %edi
	divsd	24(%rsp), %xmm2
	leaq	.LC22(%rip), %rsi
	movapd	%xmm2, %xmm0
	movl	$1, %eax
	movsd	%xmm2, 32(%rsp)
	call	__printf_chk@PLT
	movl	$1, %edi
	movl	$1, %eax
	movsd	.LC0(%rip), %xmm1
	leaq	.LC23(%rip), %rsi
	movsd	%xmm1, 96(%rsp)
	divsd	16(%rsp), %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm1, 8(%rsp)
	call	__printf_chk@PLT
	movsd	32(%rsp), %xmm2
	movsd	8(%rsp), %xmm1
	movapd	%xmm2, %xmm0
	call	pow@PLT
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC24(%rip), %rsi
	movsd	%xmm0, 72(%rsp)
	call	__printf_chk@PLT
	testl	%ebx, %ebx
	jg	.L44
	jmp	.L42
.L81:
	movl	%eax, 32(%rsp)
	call	log2@PLT
	movl	32(%rsp), %eax
	jmp	.L28
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
	.align 8
.LC15:
	.long	4290772992
	.long	1105199103
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
