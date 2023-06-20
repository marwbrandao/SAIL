	.file	"graph.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"d%d_k%d_n%d_m%d.data"
.LC1:
	.string	"r"
.LC2:
	.string	"'%d':"
.LC3:
	.string	"'voters':"
.LC4:
	.string	"%d,"
.LC5:
	.string	"%d"
	.text
	.p2align 4
	.globl	graph
	.type	graph, @function
graph:
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
	subq	$328, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rdi, %r12
	movq	%rcx, %rbx
	movq	%r8, %r9
	lock addq	$1, __gcov0.graph(%rip)
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	leaq	.LC0(%rip), %rsi
	call	__isoc99_sscanf@PLT
	leaq	.LC1(%rip), %rsi
	movq	%r12, %rdi
	call	fopen@PLT
	movq	%rax, -352(%rbp)
	lock addq	$1, 8+__gcov0.graph(%rip)
	movslq	(%rbx), %rdi
	salq	$3, %rdi
	call	malloc@PLT
	leaq	-320(%rbp), %r12
	movq	%rax, -360(%rbp)
	movq	%rax, -328(%rbp)
	.p2align 4,,10
	.p2align 3
.L2:
	movq	-352(%rbp), %rdx
	movl	$256, %esi
	movq	%r12, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	je	.L17
	movl	$56, %edi
	call	malloc@PLT
	movq	%rax, %rbx
	lock addq	$1, 16+__gcov0.graph(%rip)
	xorl	%esi, %esi
	xorl	%r15d, %r15d
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L7:
	cmpb	$58, (%r12,%rsi)
	jne	.L4
	lock addq	$1, 24+__gcov0.graph(%rip)
	addl	$1, %r15d
.L4:
	lock addq	$1, 32+__gcov0.graph(%rip)
	addq	$1, %rsi
.L3:
	movq	%r12, %rdx
.L5:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L5
	movl	%eax, %ecx
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	cmove	%rcx, %rdx
	movl	%eax, %edi
	addb	%al, %dil
	sbbq	$3, %rdx
	subq	%r12, %rdx
	cmpq	%rsi, %rdx
	ja	.L7
	movq	%rbx, %rdx
	leaq	.LC2(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
	leaq	.LC3(%rip), %rsi
	movq	%r12, %rdi
	subl	$2, %r15d
	call	strstr@PLT
	leaq	8(%rbx), %rdx
	leaq	.LC4(%rip), %rsi
	leaq	9(%rax), %rdi
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
	movl	$44, %esi
	movq	%r12, %rdi
	call	strchr@PLT
	movl	%r15d, 12(%rbx)
	movslq	%r15d, %rdi
	salq	$2, %rdi
	leaq	2(%rax), %r14
	movq	%rdi, -336(%rbp)
	call	malloc@PLT
	movq	-336(%rbp), %rdi
	movq	%rax, 16(%rbx)
	movq	%rax, -344(%rbp)
	call	malloc@PLT
	movb	$0, 32(%rbx)
	movq	%rax, 24(%rbx)
	testl	%r15d, %r15d
	jle	.L8
	movq	-344(%rbp), %rdx
	xorl	%r15d, %r15d
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L9:
	lock addq	$1, 48+__gcov0.graph(%rip)
	movl	$44, %esi
	movq	%r14, %rdi
	addq	$1, %r15
	call	strchr@PLT
	movl	$32, %esi
	leaq	1(%rax), %rdi
	call	strchr@PLT
	leaq	1(%rax), %r14
	cmpl	%r15d, 12(%rbx)
	jle	.L8
.L10:
	movq	16(%rbx), %rdx
.L11:
	leaq	0(,%r15,4), %r13
	movq	%r14, %rdi
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	addq	%r13, %rdx
	call	__isoc99_sscanf@PLT
	movq	%r14, %rdi
	movl	$58, %esi
	call	strchr@PLT
	movq	24(%rbx), %rdx
	leaq	.LC5(%rip), %rsi
	leaq	1(%rax), %r14
	xorl	%eax, %eax
	addq	%r13, %rdx
	movq	%r14, %rdi
	call	__isoc99_sscanf@PLT
	movl	12(%rbx), %eax
	subl	$1, %eax
	cmpl	%r15d, %eax
	jne	.L9
	lock addq	$1, 40+__gcov0.graph(%rip)
	addq	$1, %r15
	cmpl	%r15d, 12(%rbx)
	jg	.L10
.L8:
	movq	-328(%rbp), %rax
	movq	%rbx, (%rax)
	addq	$8, %rax
	movq	%rax, -328(%rbp)
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L17:
	lock addq	$1, 56+__gcov0.graph(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L18
	movq	-360(%rbp), %rax
	addq	$328, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L18:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	graph, .-graph
	.p2align 4
	.globl	free_units
	.type	free_units, @function
free_units:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, %r13
	lock addq	$1, __gcov0.free_units(%rip)
	movq	%rdi, %rbx
	leaq	80(%rdi), %r12
	.p2align 4,,10
	.p2align 3
.L20:
	movq	(%rbx), %rax
	movq	16(%rax), %rdi
	call	free@PLT
	movq	(%rbx), %rax
	movq	24(%rax), %rdi
	call	free@PLT
	movq	(%rbx), %rdi
	call	free@PLT
	lock addq	$1, 8+__gcov0.free_units(%rip)
	addq	$8, %rbx
	cmpq	%r12, %rbx
	jne	.L20
	addq	$8, %rsp
	movq	%r13, %rdi
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	jmp	free@PLT
	.cfi_endproc
.LFE52:
	.size	free_units, .-free_units
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_sub_I_00100_0, @function
_sub_I_00100_0:
.LFB53:
	.cfi_startproc
	endbr64
	leaq	.LPBX0(%rip), %rdi
	jmp	__gcov_init@PLT
	.cfi_endproc
.LFE53:
	.size	_sub_I_00100_0, .-_sub_I_00100_0
	.section	.init_array.00100,"aw"
	.align 8
	.quad	_sub_I_00100_0
	.section	.text.exit,"ax",@progbits
	.p2align 4
	.type	_sub_D_00100_1, @function
_sub_D_00100_1:
.LFB54:
	.cfi_startproc
	endbr64
	jmp	__gcov_exit@PLT
	.cfi_endproc
.LFE54:
	.size	_sub_D_00100_1, .-_sub_D_00100_1
	.section	.fini_array.00100,"aw"
	.align 8
	.quad	_sub_D_00100_1
	.section	.data.rel.local,"aw"
	.align 16
	.type	.LPBX1, @object
	.size	.LPBX1, 16
.LPBX1:
	.quad	__gcov_.free_units
	.quad	__gcov_.graph
	.align 32
	.type	__gcov_.graph, @object
	.size	__gcov_.graph, 40
__gcov_.graph:
	.quad	.LPBX0
	.long	838227871
	.long	1982802344
	.long	1897928477
	.zero	4
	.long	8
	.zero	4
	.quad	__gcov0.graph
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"/home/mariana/tese/SA/graph.gcda"
	.section	.data.rel,"aw"
	.align 32
	.type	.LPBX0, @object
	.size	.LPBX0, 120
.LPBX0:
	.long	1094267690
	.zero	4
	.quad	0
	.long	-623896417
	.zero	4
	.quad	.LC6
	.quad	__gcov_merge_add
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	2
	.zero	4
	.quad	.LPBX1
	.section	.data.rel.local
	.align 32
	.type	__gcov_.free_units, @object
	.size	__gcov_.free_units, 40
__gcov_.free_units:
	.quad	.LPBX0
	.long	210411925
	.long	-1068817311
	.long	-1192601709
	.zero	4
	.long	2
	.zero	4
	.quad	__gcov0.free_units
	.local	__gcov0.graph
	.comm	__gcov0.graph,64,32
	.local	__gcov0.free_units
	.comm	__gcov0.free_units,16,16
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
