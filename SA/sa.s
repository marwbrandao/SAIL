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
.LC6:
	.string	"SA end!\n"
.LC8:
	.string	"w"
.LC9:
	.string	"cluster_info.txt"
.LC10:
	.string	"i = %d em %d--------------\n"
.LC11:
	.string	"with population %d "
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
	movl	%r9d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%ecx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	%esi, 4(%rsp)
	leaq	.LC2(%rip), %rsi
	movl	%r8d, 24(%rsp)
	movq	%rdx, 16(%rsp)
	call	__printf_chk@PLT
	movl	%r15d, %edx
	movl	%r12d, %esi
	movq	%r14, %rdi
	call	first_cluster@PLT
	movl	%r15d, %r8d
	movl	%r12d, %ecx
	movl	%r13d, %edx
	movq	%rax, %rsi
	movq	%r14, %rdi
	movq	%rax, %rbx
	movq	%rax, 8(%rsp)
	call	energy@PLT
	leaq	8(%rbx), %r15
	leaq	.LC5(%rip), %rbx
	movl	%eax, 28(%rsp)
	testl	%r12d, %r12d
	jle	.L21
	.p2align 4,,10
	.p2align 3
.L20:
	movl	(%r15), %ecx
	movl	%ebp, %edx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	xorl	%r13d, %r13d
	call	__printf_chk@PLT
	movl	(%r15), %edx
	testl	%edx, %edx
	jle	.L22
	.p2align 4,,10
	.p2align 3
.L19:
	movq	-8(%r15), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	(%rax,%r13,8), %rax
	addq	$1, %r13
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	%r13d, (%r15)
	jg	.L19
.L22:
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	addl	$1, %ebp
	addq	$16, %r15
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%ebp, %r12d
	jne	.L20
.L21:
	movl	4(%rsp), %ecx
	movl	$0, (%rsp)
	leaq	.LC5(%rip), %rbx
	testl	%ecx, %ecx
	jle	.L18
	.p2align 4,,10
	.p2align 3
.L17:
	call	arc4random@PLT
	movl	%eax, %ebp
	testl	%ebp, %ebp
	jne	.L54
.L24:
	leaq	.LC8(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	xorl	%ebp, %ebp
	call	fopen@PLT
	movq	8(%rsp), %r14
	movl	24(%rsp), %ecx
	movl	%r12d, %edx
	movq	16(%rsp), %rsi
	movq	%r14, %rdi
	leaq	8(%r14), %r15
	call	change_unit@PLT
	movl	4(%rsp), %ecx
	movl	(%rsp), %edx
	xorl	%eax, %eax
	leaq	.LC10(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	testl	%r12d, %r12d
	jle	.L35
	.p2align 4,,10
	.p2align 3
.L34:
	movl	(%r15), %ecx
	movl	%ebp, %edx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	(%r15), %eax
	testl	%eax, %eax
	jle	.L38
	movq	-8(%r15), %rax
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L33:
	movq	(%rax,%r13,8), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	-8(%r15), %rax
	movq	(%rax,%r13,8), %rdx
	addq	$1, %r13
	addl	8(%rdx), %r14d
	cmpl	%r13d, (%r15)
	jg	.L33
.L32:
	movl	%r14d, %edx
	leaq	.LC11(%rip), %rsi
	xorl	%eax, %eax
	addl	$1, %ebp
	movl	$1, %edi
	addq	$16, %r15
	call	__printf_chk@PLT
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	%ebp, %r12d
	jne	.L34
.L35:
	addl	$1, (%rsp)
	movl	(%rsp), %eax
	cmpl	%eax, 4(%rsp)
	jne	.L17
.L18:
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	28(%rsp), %eax
	addq	$40, %rsp
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
.L38:
	.cfi_restore_state
	xorl	%r14d, %r14d
	jmp	.L32
.L54:
	movl	%ebp, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	negl	%eax
	movl	%eax, %eax
	cvtsi2sdq	%rax, %xmm0
	ucomisd	%xmm0, %xmm1
	jnb	.L55
.L27:
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rbp, %xmm0
	ucomisd	%xmm0, %xmm2
	jb	.L24
	call	log2@PLT
	jmp	.L24
.L55:
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
