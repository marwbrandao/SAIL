	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%d"
.LC3:
	.string	"%lf"
.LC4:
	.string	"SA(bp=%d)\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	movq	.LC0(%rip), %rax
	movl	$-1, 24(%rsp)
	movl	$-1, 28(%rsp)
	movq	%rax, 56(%rsp)
	movq	.LC1(%rip), %rax
	movl	$4, 32(%rsp)
	movq	%rax, 64(%rsp)
	movl	$20, 36(%rsp)
	call	startTimer@PLT
	leal	-3(%rbx), %edi
	cmpl	$5, %edi
	ja	.L2
	leaq	.L4(%rip), %rdx
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L4:
	.long	.L9-.L4
	.long	.L8-.L4
	.long	.L7-.L4
	.long	.L6-.L4
	.long	.L5-.L4
	.long	.L3-.L4
	.section	.text.startup
.L3:
	movq	56(%rbp), %rdi
	leaq	28(%rsp), %rdx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
.L5:
	movq	48(%rbp), %rdi
	leaq	64(%rsp), %rdx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
.L6:
	movq	40(%rbp), %rdi
	leaq	24(%rsp), %rdx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
.L7:
	movq	32(%rbp), %rdi
	leaq	56(%rsp), %rdx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
.L8:
	movq	24(%rbp), %rdi
	leaq	32(%rsp), %rdx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
.L9:
	movq	16(%rbp), %rdi
	leaq	36(%rsp), %rdx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
.L2:
	movq	8(%rbp), %rdi
	leaq	52(%rsp), %r8
	leaq	48(%rsp), %rcx
	movl	$1, %ebx
	leaq	44(%rsp), %rdx
	leaq	40(%rsp), %rsi
	movl	%ebx, %r12d
	call	graph@PLT
	movl	36(%rsp), %ecx
	movl	%ebx, %edx
	movl	$1, %edi
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rbp
	xorl	%eax, %eax
	sall	%cl, %edx
	call	__printf_chk@PLT
	movl	36(%rsp), %ecx
	movl	28(%rsp), %edi
	movsd	64(%rsp), %xmm0
	movl	52(%rsp), %r15d
	sall	%cl, %r12d
	movl	32(%rsp), %ecx
	movl	48(%rsp), %r14d
	movl	44(%rsp), %r13d
	sall	%cl, %ebx
	call	getTemperature@PLT
	movl	24(%rsp), %edi
	movsd	%xmm0, 8(%rsp)
	movsd	56(%rsp), %xmm0
	call	getTemperature@PLT
	movsd	8(%rsp), %xmm1
	movl	%r15d, %r9d
	movl	%ebx, %edi
	movl	%r14d, %r8d
	movl	%r13d, %ecx
	movq	%rbp, %rdx
	movl	%r12d, %esi
	call	runSA@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	72(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L13
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
.L13:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1889785610
	.long	1068960317
	.align 8
.LC1:
	.long	1202590843
	.long	1065646817
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
