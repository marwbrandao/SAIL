	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%d"
.LC3:
	.string	"%lf"
.LC4:
	.string	"SA(sp=%d) and pop: %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movl	%edi, %ebx
	movq	%rsi, %r12
	lock addq	$1, __gcov0.main(%rip)
	movq	.LC0(%rip), %rax
	movq	%rax, -72(%rbp)
	movq	.LC1(%rip), %rax
	movl	$-1, -104(%rbp)
	movq	%rax, -64(%rbp)
	movl	$-1, -100(%rbp)
	movl	$1, -96(%rbp)
	movl	$1, -92(%rbp)
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
	lock addq	$1, 48+__gcov0.main(%rip)
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	movq	56(%r12), %rdi
	leaq	-100(%rbp), %rdx
	call	__isoc99_sscanf@PLT
.L5:
	movq	48(%r12), %rdi
	leaq	-64(%rbp), %rdx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
	lock addq	$1, 56+__gcov0.main(%rip)
.L10:
	movq	40(%r12), %rdi
	leaq	-104(%rbp), %rdx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
.L11:
	movq	32(%r12), %rdi
	leaq	-72(%rbp), %rdx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
.L12:
	movq	24(%r12), %rdi
	leaq	-96(%rbp), %rdx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
.L13:
	movq	16(%r12), %rdi
	leaq	-92(%rbp), %rdx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
.L14:
	movq	8(%r12), %rdi
	leaq	-80(%rbp), %rcx
	leaq	-84(%rbp), %rdx
	leaq	-88(%rbp), %rsi
	leaq	-76(%rbp), %r8
	call	graph@PLT
	movq	%rax, %r12
	lock addq	$1, 64+__gcov0.main(%rip)
	movl	-88(%rbp), %edi
	call	_pop_ideal@PLT
	movl	%eax, %r13d
	lock addq	$1, 72+__gcov0.main(%rip)
	movl	$1, %ebx
	movl	$1, %edi
	leaq	.LC4(%rip), %rsi
	movl	%ebx, %edx
	movl	-92(%rbp), %ecx
	sall	%cl, %edx
	movl	%eax, %ecx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 80+__gcov0.main(%rip)
	movl	-92(%rbp), %ecx
	movl	-76(%rbp), %r9d
	movl	-80(%rbp), %r8d
	movl	-100(%rbp), %edi
	movsd	-64(%rbp), %xmm0
	movl	-84(%rbp), %r15d
	movl	%ebx, %r14d
	movl	%r9d, -128(%rbp)
	sall	%cl, %r14d
	movl	-96(%rbp), %ecx
	movl	%r8d, -124(%rbp)
	sall	%cl, %ebx
	call	getTemperature@PLT
	movsd	%xmm0, -120(%rbp)
	lock addq	$1, 88+__gcov0.main(%rip)
	movl	-104(%rbp), %edi
	movsd	-72(%rbp), %xmm0
	call	getTemperature@PLT
	lock addq	$1, 96+__gcov0.main(%rip)
	movl	-128(%rbp), %r9d
	movl	-124(%rbp), %r8d
	movsd	-120(%rbp), %xmm1
	subq	$8, %rsp
	movl	%r15d, %ecx
	movq	%r12, %rdx
	movl	%r14d, %esi
	pushq	%r13
	movl	%ebx, %edi
	call	runSA@PLT
	lock addq	$1, 104+__gcov0.main(%rip)
	movq	%r12, %rdi
	call	free@PLT
	popq	%rax
	popq	%rdx
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L17
	leaq	-40(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L9:
	.cfi_restore_state
	lock addq	$1, 16+__gcov0.main(%rip)
	jmp	.L13
.L8:
	lock addq	$1, 24+__gcov0.main(%rip)
	jmp	.L12
.L7:
	lock addq	$1, 32+__gcov0.main(%rip)
	jmp	.L11
.L6:
	lock addq	$1, 40+__gcov0.main(%rip)
	jmp	.L10
.L2:
	lock addq	$1, 8+__gcov0.main(%rip)
	jmp	.L14
.L17:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	main, .-main
	.p2align 4
	.type	_sub_I_00100_0, @function
_sub_I_00100_0:
.LFB52:
	.cfi_startproc
	endbr64
	leaq	.LPBX0(%rip), %rdi
	jmp	__gcov_init@PLT
	.cfi_endproc
.LFE52:
	.size	_sub_I_00100_0, .-_sub_I_00100_0
	.section	.init_array.00100,"aw"
	.align 8
	.quad	_sub_I_00100_0
	.section	.text.exit,"ax",@progbits
	.p2align 4
	.type	_sub_D_00100_1, @function
_sub_D_00100_1:
.LFB53:
	.cfi_startproc
	endbr64
	jmp	__gcov_exit@PLT
	.cfi_endproc
.LFE53:
	.size	_sub_D_00100_1, .-_sub_D_00100_1
	.section	.fini_array.00100,"aw"
	.align 8
	.quad	_sub_D_00100_1
	.section	.data.rel.local,"aw"
	.align 8
	.type	.LPBX1, @object
	.size	.LPBX1, 8
.LPBX1:
	.quad	__gcov_.main
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"/home/mariana/tese/SA/main.gcda"
	.section	.data.rel,"aw"
	.align 32
	.type	.LPBX0, @object
	.size	.LPBX0, 120
.LPBX0:
	.long	1094267690
	.zero	4
	.quad	0
	.long	-901474971
	.zero	4
	.quad	.LC5
	.quad	__gcov_merge_add
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	1
	.zero	4
	.quad	.LPBX1
	.section	.data.rel.local
	.align 32
	.type	__gcov_.main, @object
	.size	__gcov_.main, 40
__gcov_.main:
	.quad	.LPBX0
	.long	108032747
	.long	1654492631
	.long	251162143
	.zero	4
	.long	14
	.zero	4
	.quad	__gcov0.main
	.local	__gcov0.main
	.comm	__gcov0.main,112,32
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
