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
	.string	"Cluster %d with size %d: "
.LC5:
	.string	"%d "
.LC6:
	.string	"\n"
.LC7:
	.string	"w"
.LC8:
	.string	"cluster_info.txt"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC11:
	.string	"accept probabilty: %f and random number: %f\n"
	.align 8
.LC12:
	.string	"max_pop: %d and  max_compact: %d\n"
	.section	.rodata.str1.1
.LC13:
	.string	"i = %d em %d--------------\n"
.LC14:
	.string	"SA end!\n"
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
	movl	%r8d, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%r9d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%ecx, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbx
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movl	%esi, 48(%rsp)
	leaq	.LC3(%rip), %rsi
	movl	%r8d, 52(%rsp)
	movl	%r9d, 72(%rsp)
	movq	%rdx, 64(%rsp)
	movsd	%xmm0, 16(%rsp)
	movsd	%xmm1, 8(%rsp)
	call	__printf_chk@PLT
	pxor	%xmm0, %xmm0
	movsd	8(%rsp), %xmm1
	xorl	%edi, %edi
	cvtsi2sdl	%r14d, %xmm0
	subsd	16(%rsp), %xmm1
	movl	%r15d, %r14d
	divsd	%xmm0, %xmm1
	movsd	%xmm1, 56(%rsp)
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	movl	%r15d, %edx
	movl	%ebp, %esi
	movq	%rbx, %rdi
	call	first_cluster@PLT
	movl	%r14d, %r8d
	movl	%ebp, %ecx
	movl	%r12d, %edx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	energy@PLT
	movl	%eax, 76(%rsp)
	testl	%ebp, %ebp
	jle	.L16
	leaq	8(%r15), %r14
	xorl	%r12d, %r12d
	leaq	.LC5(%rip), %rbx
	.p2align 4,,10
	.p2align 3
.L19:
	movl	(%r14), %ecx
	movl	%r12d, %edx
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	(%r14), %ecx
	testl	%ecx, %ecx
	jle	.L17
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L18:
	movq	-8(%r14), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	(%rax,%r13,8), %rax
	addq	$1, %r13
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	%r13d, (%r14)
	jg	.L18
.L17:
	movl	$1, %edi
	xorl	%eax, %eax
	addl	$1, %r12d
	addq	$16, %r14
	leaq	.LC6(%rip), %rsi
	call	__printf_chk@PLT
	cmpl	%r12d, %ebp
	jne	.L19
.L16:
	movl	48(%rsp), %edx
	testl	%edx, %edx
	jle	.L20
	movl	$0, 8(%rsp)
	movl	$2147483647, %r12d
	leaq	.LC5(%rip), %rbx
	movl	$-2147483648, 44(%rsp)
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L22:
	leaq	.LC7(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	fopen@PLT
	movq	64(%rsp), %r14
	movl	%ebp, %edx
	movq	%r15, %rdi
	movl	52(%rsp), %r13d
	movq	%r14, %rsi
	movl	%r13d, %ecx
	call	change_unit@PLT
	movl	72(%rsp), %edx
	movl	%ebp, %ecx
	movq	%r14, %rdi
	movl	%r13d, %r8d
	movq	%r15, %rsi
	call	energy_population@PLT
	movl	%ebp, %esi
	movq	%r15, %rdi
	movl	%eax, %r14d
	movl	%eax, 36(%rsp)
	call	energy_compactness@PLT
	movl	%eax, %ecx
	movl	%eax, 40(%rsp)
	movl	44(%rsp), %eax
	cmpl	%eax, %ecx
	setg	%al
	cmpl	%r12d, %r14d
	setl	%dl
	testb	%al, %al
	je	.L41
	movsd	.LC0(%rip), %xmm0
	testb	%dl, %dl
	je	.L41
.L29:
	movsd	%xmm0, 24(%rsp)
	call	rand@PLT
	movsd	24(%rsp), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	divsd	.LC10(%rip), %xmm1
	comisd	%xmm1, %xmm0
	ja	.L65
.L32:
	movsd	16(%rsp), %xmm2
	subsd	56(%rsp), %xmm2
	addl	$1, 8(%rsp)
	movl	8(%rsp), %eax
	movsd	%xmm2, 16(%rsp)
	cmpl	%eax, 48(%rsp)
	je	.L20
.L38:
	call	arc4random@PLT
	testl	%eax, %eax
	je	.L22
	movl	%eax, %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm4, %xmm4
	negl	%edx
	movl	%edx, %edx
	cvtsi2sdq	%rdx, %xmm0
	ucomisd	%xmm0, %xmm4
	jnb	.L66
.L25:
	movl	%eax, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm5, %xmm5
	cvtsi2sdq	%rax, %xmm0
	ucomisd	%xmm0, %xmm5
	jb	.L22
	call	log2@PLT
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L41:
	cmpl	%r12d, 36(%rsp)
	jle	.L31
	testb	%al, %al
	je	.L31
.L64:
	movsd	.LC9(%rip), %xmm0
	divsd	16(%rsp), %xmm0
	call	exp@PLT
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L31:
	movl	44(%rsp), %ecx
	cmpl	%ecx, 40(%rsp)
	jge	.L40
	testb	%dl, %dl
	jne	.L64
.L40:
	pxor	%xmm0, %xmm0
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L65:
	leaq	.LC11(%rip), %rsi
	movl	$1, %edi
	movl	$2, %eax
	call	__printf_chk@PLT
	movl	40(%rsp), %ecx
	movl	36(%rsp), %edx
	xorl	%eax, %eax
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	48(%rsp), %ecx
	movl	8(%rsp), %edx
	xorl	%eax, %eax
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	testl	%ebp, %ebp
	jle	.L34
	leaq	8(%r15), %r14
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L37:
	movl	(%r14), %ecx
	movl	%r12d, %edx
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	(%r14), %eax
	testl	%eax, %eax
	jle	.L35
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L36:
	movq	-8(%r14), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	(%rax,%r13,8), %rax
	addq	$1, %r13
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	%r13d, (%r14)
	jg	.L36
.L35:
	movl	$1, %edi
	xorl	%eax, %eax
	addl	$1, %r12d
	addq	$16, %r14
	leaq	.LC6(%rip), %rsi
	call	__printf_chk@PLT
	cmpl	%r12d, %ebp
	jne	.L37
.L34:
	movl	52(%rsp), %edx
	movl	%ebp, %esi
	movq	%r15, %rdi
	call	storeState@PLT
	movl	40(%rsp), %eax
	movl	36(%rsp), %r12d
	movl	%eax, 44(%rsp)
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L20:
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	76(%rsp), %eax
	addq	$88, %rsp
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
.L66:
	.cfi_restore_state
	movl	%eax, 24(%rsp)
	call	log2@PLT
	movl	24(%rsp), %eax
	jmp	.L25
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
.LC9:
	.long	0
	.long	-1074790400
	.align 8
.LC10:
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
