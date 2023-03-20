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
	.string	"max: %d\n"
.LC10:
	.string	"i = %d em %d--------------\n"
.LC11:
	.string	"\n MAX MAS MAX max: %d\n\n"
.LC12:
	.string	"with population %d "
.LC13:
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
	movl	%r8d, %r15d
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	%esi, 32(%rsp)
	leaq	.LC2(%rip), %rsi
	movl	%r8d, 36(%rsp)
	movl	%r9d, 40(%rsp)
	movq	%rdx, 24(%rsp)
	call	__printf_chk@PLT
	movq	%r14, %rdi
	movl	%r15d, %edx
	movl	%ebp, %esi
	call	first_cluster@PLT
	movl	%r12d, %edx
	movq	%r14, %rdi
	movl	%r15d, %r8d
	movl	%ebp, %ecx
	movq	%rax, %rsi
	movq	%rax, %rbx
	movq	%rax, 16(%rsp)
	call	energy@PLT
	leaq	8(%rbx), %r13
	xorl	%r12d, %r12d
	leaq	.LC5(%rip), %rbx
	movl	%eax, %r14d
	testl	%ebp, %ebp
	jle	.L21
	.p2align 4,,10
	.p2align 3
.L20:
	movl	0(%r13), %ecx
	movl	%r12d, %edx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	xorl	%r15d, %r15d
	call	__printf_chk@PLT
	movl	0(%r13), %edx
	testl	%edx, %edx
	jle	.L22
	.p2align 4,,10
	.p2align 3
.L19:
	movq	-8(%r13), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	(%rax,%r15,8), %rax
	addq	$1, %r15
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	%r15d, 0(%r13)
	jg	.L19
.L22:
	movl	$1, %edi
	xorl	%eax, %eax
	addl	$1, %r12d
	addq	$16, %r13
	leaq	.LC4(%rip), %rsi
	call	__printf_chk@PLT
	cmpl	%r12d, %ebp
	jne	.L20
.L21:
	movl	32(%rsp), %ecx
	movl	$0, 12(%rsp)
	leaq	.LC5(%rip), %rbx
	movl	%r14d, %r12d
	testl	%ecx, %ecx
	jg	.L17
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L24:
	leaq	.LC7(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	fopen@PLT
	movl	36(%rsp), %r13d
	movq	24(%rsp), %r15
	movl	%ebp, %edx
	movq	16(%rsp), %r14
	movl	%r13d, %ecx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	change_unit@PLT
	movl	%r12d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC9(%rip), %rsi
	call	__printf_chk@PLT
	movl	40(%rsp), %edx
	movl	%r13d, %r8d
	movl	%ebp, %ecx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	energy@PLT
	cmpl	%r12d, %eax
	jl	.L54
	addl	$1, 12(%rsp)
	movl	12(%rsp), %eax
	cmpl	%eax, 32(%rsp)
	je	.L55
.L17:
	call	arc4random@PLT
	testl	%eax, %eax
	je	.L24
	movl	%eax, %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	negl	%edx
	movl	%edx, %edx
	cvtsi2sdq	%rdx, %xmm0
	ucomisd	%xmm0, %xmm1
	jnb	.L56
.L27:
	movl	%eax, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm0
	ucomisd	%xmm0, %xmm2
	jb	.L24
	call	log2@PLT
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L54:
	movl	32(%rsp), %ecx
	movl	12(%rsp), %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC10(%rip), %rsi
	xorl	%r12d, %r12d
	call	__printf_chk@PLT
	movq	16(%rsp), %rax
	leaq	8(%rax), %r14
	testl	%ebp, %ebp
	jle	.L36
	.p2align 4,,10
	.p2align 3
.L35:
	movl	(%r14), %ecx
	movl	%r12d, %edx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	(%r14), %eax
	testl	%eax, %eax
	jle	.L39
	movq	-8(%r14), %rax
	xorl	%r13d, %r13d
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L34:
	movq	(%rax,%r13,8), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	-8(%r14), %rax
	movq	(%rax,%r13,8), %rdx
	addq	$1, %r13
	addl	8(%rdx), %r15d
	cmpl	%r13d, (%r14)
	jg	.L34
.L33:
	movl	%r15d, %edx
	leaq	.LC12(%rip), %rsi
	xorl	%eax, %eax
	addl	$1, %r12d
	movl	$1, %edi
	addq	$16, %r14
	call	__printf_chk@PLT
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	%r12d, %ebp
	jne	.L35
.L36:
	movl	36(%rsp), %r15d
	movq	16(%rsp), %r14
	movl	%ebp, %ecx
	movl	40(%rsp), %edx
	movq	24(%rsp), %rdi
	movl	%r15d, %r8d
	movq	%r14, %rsi
	call	energy@PLT
	leaq	.LC11(%rip), %rsi
	movl	$1, %edi
	movl	%eax, %edx
	movl	%eax, %r12d
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	%r15d, %edx
	movl	%ebp, %esi
	movq	%r14, %rdi
	call	storeState@PLT
	addl	$1, 12(%rsp)
	movl	12(%rsp), %eax
	cmpl	%eax, 32(%rsp)
	jne	.L17
.L55:
	movl	%r12d, %r14d
.L18:
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r14d, %eax
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
.L39:
	.cfi_restore_state
	xorl	%r15d, %r15d
	jmp	.L33
.L56:
	movl	%eax, 44(%rsp)
	call	log2@PLT
	movl	44(%rsp), %eax
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
