	.file	"ILP.c"
	.text
	.p2align 4
	.globl	create_code_index
	.type	create_code_index, @function
create_code_index:
.LFB40:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L1
	leal	-1(%rsi), %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movq	(%rdi,%rax,8), %rdx
	movl	%eax, 44(%rdx)
	movq	%rax, %rdx
	addq	$1, %rax
	cmpq	%rdx, %rcx
	jne	.L3
.L1:
	ret
	.cfi_endproc
.LFE40:
	.size	create_code_index, .-create_code_index
	.p2align 4
	.globl	find_id_by_code
	.type	find_id_by_code, @function
find_id_by_code:
.LFB41:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L9
	subl	$1, %esi
	xorl	%eax, %eax
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L11:
	leaq	1(%rax), %rcx
	cmpq	%rsi, %rax
	je	.L9
	movq	%rcx, %rax
.L8:
	movq	(%rdi,%rax,8), %rcx
	movl	%eax, %r8d
	cmpl	%edx, (%rcx)
	jne	.L11
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	movl	$-1, %r8d
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE41:
	.size	find_id_by_code, .-find_id_by_code
	.p2align 4
	.globl	create_neighbor_index
	.type	create_neighbor_index, @function
create_neighbor_index:
.LFB42:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L23
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leal	-1(%rsi), %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	8(%rdi,%r12,8), %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	.p2align 4,,10
	.p2align 3
.L18:
	movq	0(%r13), %r15
	movslq	12(%r15), %rdi
	movq	%rdi, %r14
	salq	$2, %rdi
	call	malloc@PLT
	movq	%rax, 48(%r15)
	testl	%r14d, %r14d
	jle	.L14
	movq	16(%r15), %r10
	leal	-1(%r14), %r9d
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L17:
	movl	(%r10,%r8,4), %edi
	xorl	%edx, %edx
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L27:
	leaq	1(%rdx), %rcx
	cmpq	%rdx, %r12
	je	.L26
	movq	%rcx, %rdx
.L16:
	movq	0(%rbp,%rdx,8), %rcx
	movl	%edx, %esi
	cmpl	(%rcx), %edi
	jne	.L27
	movl	%esi, (%rax,%r8,4)
	leaq	1(%r8), %rdx
	cmpq	%r8, %r9
	je	.L14
.L20:
	movq	%rdx, %r8
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L26:
	movl	$-1, %esi
	leaq	1(%r8), %rdx
	movl	%esi, (%rax,%r8,4)
	cmpq	%r8, %r9
	jne	.L20
.L14:
	addq	$8, %r13
	cmpq	%rbx, %r13
	jne	.L18
	addq	$8, %rsp
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
.L23:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE42:
	.size	create_neighbor_index, .-create_neighbor_index
	.p2align 4
	.globl	are_neighbors
	.type	are_neighbors, @function
are_neighbors:
.LFB43:
	.cfi_startproc
	endbr64
	movl	12(%rdi), %ecx
	testl	%ecx, %ecx
	jle	.L31
	movq	48(%rdi), %rax
	subl	$1, %ecx
	movl	44(%rsi), %edx
	leaq	4(%rax,%rcx,4), %rcx
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L34:
	addq	$4, %rax
	cmpq	%rcx, %rax
	je	.L31
.L30:
	cmpl	%edx, (%rax)
	jne	.L34
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L31:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE43:
	.size	are_neighbors, .-are_neighbors
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"b_%d_%d_%d"
.LC1:
	.string	"Variable %s not found.\n"
	.text
	.p2align 4
	.globl	get_b_var_index
	.type	get_b_var_index, @function
get_b_var_index:
.LFB44:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	%esi, %r9d
	movl	$1, %esi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%r8, %r12
	movl	%edi, %r8d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rcx, %rbp
	leaq	.LC0(%rip), %rcx
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %r13
	subq	$8, %rsp
	.cfi_def_cfa_offset 104
	pushq	%rdx
	.cfi_def_cfa_offset 112
	movq	%r13, %rdi
	movl	$32, %edx
	call	__sprintf_chk@PLT
	leaq	28(%rsp), %rcx
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	CPXgetcolindex@PLT
	movl	28(%rsp), %eax
	popq	%rdx
	.cfi_def_cfa_offset 104
	popq	%rcx
	.cfi_def_cfa_offset 96
	testl	%eax, %eax
	js	.L39
	movq	56(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L40
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L39:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%r13, %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L40:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE44:
	.size	get_b_var_index, .-get_b_var_index
	.section	.rodata.str1.1
.LC2:
	.string	"x_%d_%d"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Failed to get index of variable %s.\n"
	.text
	.p2align 4
	.globl	get_var_index
	.type	get_var_index, @function
get_var_index:
.LFB45:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	%edi, %r8d
	movl	%esi, %r9d
	movl	$1, %esi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rcx, %r12
	leaq	.LC2(%rip), %rcx
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdx, %rbp
	movl	$128, %edx
	subq	$160, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %r13
	movq	%r13, %rdi
	call	__sprintf_chk@PLT
	leaq	12(%rsp), %rcx
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	CPXgetcolindex@PLT
	testl	%eax, %eax
	jne	.L45
	movq	152(%rsp), %rsi
	xorq	%fs:40, %rsi
	movl	12(%rsp), %eax
	jne	.L46
	addq	$160, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L45:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%r13, %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L46:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE45:
	.size	get_var_index, .-get_var_index
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Failed to get column index for %s.\n"
	.align 8
.LC6:
	.string	"Failed to add upper population constraint for cluster %d.\n"
	.align 8
.LC8:
	.string	"Failed to add lower population constraint for cluster %d.\n"
	.text
	.p2align 4
	.globl	add_population_constraints
	.type	add_population_constraints, @function
add_population_constraints:
.LFB46:
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movl	%esi, 32(%rsp)
	movl	%edx, 36(%rsp)
	movl	%r9d, 56(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	testl	%edx, %edx
	jle	.L47
	movslq	%esi, %rax
	movq	%rdi, %r15
	movq	%rcx, %rbp
	movq	%r8, %rbx
	leaq	0(,%rax,4), %rdi
	salq	$3, %rax
	xorl	%r14d, %r14d
	movq	%rax, 48(%rsp)
	leal	-1(%rsi), %eax
	movq	%rdi, 40(%rsp)
	movl	%eax, 60(%rsp)
	.p2align 4,,10
	.p2align 3
.L54:
	movq	40(%rsp), %rdi
	call	malloc@PLT
	movq	48(%rsp), %rdi
	movq	%rax, (%rsp)
	call	malloc@PLT
	movl	32(%rsp), %esi
	movq	%rax, 8(%rsp)
	testl	%esi, %esi
	jle	.L49
	movl	60(%rsp), %eax
	xorl	%r13d, %r13d
	leaq	96(%rsp), %r12
	movq	%rax, 24(%rsp)
	leaq	88(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	%r15, %rax
	movl	%r14d, %r15d
	movq	%r13, %r14
	movq	%rax, %r13
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L56:
	movq	%rax, %r14
.L51:
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	movl	%r15d, %r9d
	leaq	.LC2(%rip), %r8
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 224
	movl	$32, %ecx
	movl	$1, %edx
	movq	%r12, %rdi
	movl	$32, %esi
	call	__snprintf_chk@PLT
	movq	32(%rsp), %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	CPXgetcolindex@PLT
	popq	%rdx
	.cfi_def_cfa_offset 216
	popq	%rcx
	.cfi_def_cfa_offset 208
	testl	%eax, %eax
	jne	.L60
	movl	88(%rsp), %eax
	movq	(%rsp), %rdx
	pxor	%xmm0, %xmm0
	movl	%eax, (%rdx,%r14,4)
	movq	0(%r13,%r14,8), %rax
	cvtsi2sdl	8(%rax), %xmm0
	movq	8(%rsp), %rax
	movsd	%xmm0, (%rax,%r14,8)
	leaq	1(%r14), %rax
	cmpq	%r14, 24(%rsp)
	jne	.L56
	movl	%r15d, %r14d
	movq	%r13, %r15
.L49:
	pxor	%xmm0, %xmm0
	movb	$76, 74(%rsp)
	xorl	%edx, %edx
	movl	$1, %ecx
	cvtsi2sdl	56(%rsp), %xmm0
	movsd	.LC5(%rip), %xmm1
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movl	$0, 76(%rsp)
	mulsd	%xmm0, %xmm1
	movsd	%xmm0, 16(%rsp)
	movsd	%xmm1, 80(%rsp)
	pushq	$0
	.cfi_def_cfa_offset 216
	pushq	$0
	.cfi_def_cfa_offset 224
	pushq	24(%rsp)
	.cfi_def_cfa_offset 232
	pushq	24(%rsp)
	.cfi_def_cfa_offset 240
	leaq	108(%rsp), %r12
	pushq	%r12
	.cfi_def_cfa_offset 248
	leaq	114(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 256
	movl	80(%rsp), %r8d
	leaq	128(%rsp), %r9
	call	CPXaddrows@PLT
	addq	$48, %rsp
	.cfi_def_cfa_offset 208
	movsd	16(%rsp), %xmm0
	testl	%eax, %eax
	jne	.L61
	mulsd	.LC7(%rip), %xmm0
	xorl	%edx, %edx
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movb	$71, 75(%rsp)
	movl	$1, %ecx
	movsd	%xmm0, 88(%rsp)
	pushq	$0
	.cfi_def_cfa_offset 216
	pushq	$0
	.cfi_def_cfa_offset 224
	pushq	24(%rsp)
	.cfi_def_cfa_offset 232
	pushq	24(%rsp)
	.cfi_def_cfa_offset 240
	pushq	%r12
	.cfi_def_cfa_offset 248
	leaq	115(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 256
	movl	80(%rsp), %r8d
	leaq	136(%rsp), %r9
	call	CPXaddrows@PLT
	addq	$48, %rsp
	.cfi_def_cfa_offset 208
	testl	%eax, %eax
	jne	.L62
	movq	(%rsp), %rdi
	addl	$1, %r14d
	call	free@PLT
	movq	8(%rsp), %rdi
	call	free@PLT
	cmpl	%r14d, 36(%rsp)
	jne	.L54
.L47:
	movq	136(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L63
	addq	$152, %rsp
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
.L60:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%r12, %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L61:
	movl	%r14d, %ecx
	leaq	.LC6(%rip), %rdx
.L59:
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L63:
	call	__stack_chk_fail@PLT
	.p2align 4,,10
	.p2align 3
.L62:
	movl	%r14d, %ecx
	leaq	.LC8(%rip), %rdx
	jmp	.L59
	.cfi_endproc
.LFE46:
	.size	add_population_constraints, .-add_population_constraints
	.section	.rodata.str1.1
.LC11:
	.string	"B"
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"Failed to create decision variable x_%d_%d.\n"
	.align 8
.LC13:
	.string	"Total decision variables created: %d\n"
	.align 8
.LC14:
	.string	"Failed to add constraint for unit %d.\n"
	.text
	.p2align 4
	.globl	create_decision_variables
	.type	create_decision_variables, @function
create_decision_variables:
.LFB47:
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
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	movl	%edx, 36(%rsp)
	xorl	%edx, %edx
	movq	%rdi, 72(%rsp)
	movl	%esi, 64(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	jle	.L66
	leaq	88(%rsp), %rax
	movq	%r8, 24(%rsp)
	xorl	%ebx, %ebx
	leaq	112(%rsp), %rbp
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L65:
	movl	36(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L69
	leaq	104(%rsp), %rax
	xorl	%r12d, %r12d
	leaq	80(%rsp), %r14
	movq	%rax, 8(%rsp)
	leal	1(%rdx), %eax
	leaq	96(%rsp), %r15
	movl	%eax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L68:
	subq	$8, %rsp
	.cfi_def_cfa_offset 232
	movl	%ebx, %r9d
	leaq	.LC2(%rip), %r8
	xorl	%eax, %eax
	pushq	%r12
	.cfi_def_cfa_offset 240
	movl	$32, %ecx
	movl	$1, %edx
	movq	%rbp, %rdi
	movl	$32, %esi
	call	__snprintf_chk@PLT
	movq	%rbp, 120(%rsp)
	movq	%r14, %r8
	movq	%r15, %rcx
	movq	.LC10(%rip), %rax
	movl	$1, %edx
	movq	%r13, %rdi
	movq	$0x000000000, 96(%rsp)
	movq	$0x000000000, 112(%rsp)
	movq	%rax, 104(%rsp)
	leaq	.LC11(%rip), %rax
	pushq	24(%rsp)
	.cfi_def_cfa_offset 248
	pushq	%rax
	.cfi_def_cfa_offset 256
	movq	72(%rsp), %r9
	movq	56(%rsp), %rsi
	call	CPXnewcols@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 224
	testl	%eax, %eax
	jne	.L87
	movl	16(%rsp), %eax
	leal	(%rax,%r12), %edx
	addl	$1, %r12d
	cmpl	%r12d, 36(%rsp)
	jne	.L68
.L69:
	addl	$1, %ebx
	cmpl	%ebx, 64(%rsp)
	jne	.L65
	movq	24(%rsp), %r12
.L66:
	movl	$1, %edi
	leaq	.LC13(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	36(%rsp), %edi
	testl	%edi, %edi
	jle	.L64
	movslq	64(%rsp), %rax
	movl	$0, 40(%rsp)
	leaq	96(%rsp), %r14
	leaq	0(,%rax,4), %rbx
	movq	%rax, %rdx
	salq	$3, %rax
	movq	%rax, 56(%rsp)
	leal	-1(%rdx), %eax
	movl	%eax, 68(%rsp)
	movq	%rbx, 48(%rsp)
	movq	72(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L75:
	movq	48(%rsp), %rdi
	call	malloc@PLT
	movq	56(%rsp), %rdi
	movq	%rax, 8(%rsp)
	call	malloc@PLT
	movl	64(%rsp), %esi
	movq	%rax, 16(%rsp)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	testl	%esi, %esi
	jle	.L71
	movl	68(%rsp), %eax
	xorl	%ebp, %ebp
	leaq	112(%rsp), %r15
	movq	%rax, 24(%rsp)
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L79:
	movq	%rax, %rbp
.L73:
	movq	(%rbx), %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 232
	movl	%ebp, %r9d
	movl	$32, %ecx
	leaq	.LC2(%rip), %r8
	movl	$1, %edx
	movl	$32, %esi
	movq	%r15, %rdi
	movl	44(%rax), %eax
	pushq	%rax
	.cfi_def_cfa_offset 240
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movq	%r14, %rcx
	movq	%r15, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	CPXgetcolindex@PLT
	popq	%rdx
	.cfi_def_cfa_offset 232
	popq	%rcx
	.cfi_def_cfa_offset 224
	testl	%eax, %eax
	jne	.L88
	movl	96(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	%eax, (%rcx,%rbp,4)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	movq	16(%rsp), %rax
	movsd	%xmm0, (%rax,%rbp,8)
	leaq	1(%rbp), %rax
	cmpq	%rbp, 24(%rsp)
	jne	.L79
.L71:
	movl	$0, 88(%rsp)
	movq	%r14, %r9
	xorl	%edx, %edx
	movq	%r12, %rsi
	movb	$69, 80(%rsp)
	movl	$1, %ecx
	movq	%r13, %rdi
	movsd	%xmm0, 96(%rsp)
	pushq	$0
	.cfi_def_cfa_offset 232
	pushq	$0
	.cfi_def_cfa_offset 240
	pushq	32(%rsp)
	.cfi_def_cfa_offset 248
	pushq	32(%rsp)
	.cfi_def_cfa_offset 256
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 264
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 272
	movl	112(%rsp), %r8d
	call	CPXaddrows@PLT
	addq	$48, %rsp
	.cfi_def_cfa_offset 224
	testl	%eax, %eax
	jne	.L89
	movq	8(%rsp), %rdi
	addq	$8, %rbx
	call	free@PLT
	movq	16(%rsp), %rdi
	call	free@PLT
	addl	$1, 40(%rsp)
	movl	40(%rsp), %eax
	cmpl	%eax, 36(%rsp)
	jne	.L75
.L64:
	movq	152(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L90
	addq	$168, %rsp
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
.L88:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%r15, %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L87:
	movq	stderr(%rip), %rdi
	movl	%r12d, %r8d
	movl	%ebx, %ecx
	xorl	%eax, %eax
	leaq	.LC12(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L89:
	movslq	40(%rsp), %r15
	movq	72(%rsp), %rax
	leaq	.LC14(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movq	(%rax,%r15,8), %rax
	movl	44(%rax), %ecx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L90:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE47:
	.size	create_decision_variables, .-create_decision_variables
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"Failed to create decision variable %s.\n"
	.text
	.p2align 4
	.globl	create_b_vars
	.type	create_b_vars, @function
create_b_vars:
.LFB48:
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
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movq	%rdi, 48(%rsp)
	movl	%esi, 60(%rsp)
	movl	%edx, 56(%rsp)
	movq	%rcx, 32(%rsp)
	movq	%r8, 40(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	jle	.L91
.L92:
	movl	56(%rsp), %eax
	testl	%eax, %eax
	jle	.L96
	movq	48(%rsp), %rax
	movl	$0, 12(%rsp)
	leaq	96(%rsp), %r12
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L98:
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movl	12(%rax), %edx
	testl	%edx, %edx
	jle	.L97
	leaq	88(%rsp), %rsi
	leaq	80(%rsp), %rbx
	xorl	%r15d, %r15d
	movq	%rsi, 24(%rsp)
	movq	%rbx, %rdi
	leaq	72(%rsp), %r14
	movq	%r15, %rbx
	leaq	64(%rsp), %r13
	movq	%rdi, %r15
	.p2align 4,,10
	.p2align 3
.L95:
	movq	48(%rax), %rax
	movl	%ebp, %r9d
	movl	$64, %ecx
	movq	%r12, %rdi
	leaq	.LC0(%rip), %r8
	movl	$1, %edx
	movl	$64, %esi
	movl	(%rax,%rbx,4), %eax
	pushq	%rax
	.cfi_def_cfa_offset 248
	movl	20(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 256
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movq	%r12, 104(%rsp)
	movq	%r14, %r9
	movq	%r13, %r8
	movsd	.LC10(%rip), %xmm0
	leaq	.LC11(%rip), %rax
	movq	$0x000000000, 80(%rsp)
	movq	%r15, %rcx
	movq	$0x000000000, 96(%rsp)
	movl	$1, %edx
	movsd	%xmm0, 88(%rsp)
	pushq	40(%rsp)
	.cfi_def_cfa_offset 264
	pushq	%rax
	.cfi_def_cfa_offset 272
	movq	72(%rsp), %rsi
	movq	64(%rsp), %rdi
	call	CPXnewcols@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 240
	testl	%eax, %eax
	jne	.L108
	movq	16(%rsp), %rax
	addq	$1, %rbx
	movq	(%rax), %rax
	cmpl	%ebx, 12(%rax)
	jg	.L95
.L97:
	addl	$1, 12(%rsp)
	movl	12(%rsp), %eax
	addq	$8, 16(%rsp)
	cmpl	%eax, 56(%rsp)
	jne	.L98
.L96:
	addl	$1, %ebp
	cmpl	%ebp, 60(%rsp)
	jne	.L92
.L91:
	movq	168(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L109
	addq	$184, %rsp
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
.L108:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%r12, %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC15(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L109:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE48:
	.size	create_b_vars, .-create_b_vars
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"Failed to change objective function.\n"
	.text
	.p2align 4
	.globl	add_objective_function
	.type	add_objective_function, @function
add_objective_function:
.LFB49:
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
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movq	%rdi, 32(%rsp)
	leaq	64(%rsp), %r13
	movl	%esi, 40(%rsp)
	movl	%edx, 44(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	leaq	56(%rsp), %rax
	movl	$0, 20(%rsp)
	movq	%rax, 24(%rsp)
	testl	%edx, %edx
	jle	.L112
.L111:
	movl	40(%rsp), %eax
	testl	%eax, %eax
	jle	.L116
	movq	32(%rsp), %rax
	movl	$0, 16(%rsp)
	leaq	52(%rsp), %rbx
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L118:
	movq	8(%rsp), %rax
	xorl	%r14d, %r14d
	movq	(%rax), %rax
	movl	12(%rax), %edx
	testl	%edx, %edx
	jle	.L117
	.p2align 4,,10
	.p2align 3
.L115:
	movq	24(%rax), %rdx
	movq	48(%rax), %rax
	movl	$64, %ecx
	movq	%r13, %rdi
	leaq	.LC0(%rip), %r8
	movl	$64, %esi
	movl	(%rax,%r14,4), %eax
	movl	(%rdx,%r14,4), %r15d
	movl	$1, %edx
	pushq	%rax
	.cfi_def_cfa_offset 216
	movl	24(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 224
	movl	36(%rsp), %r9d
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movq	%rbx, %rcx
	movq	%r12, %rsi
	movq	%r13, %rdx
	movq	%rbp, %rdi
	call	CPXgetcolindex@PLT
	popq	%rcx
	.cfi_def_cfa_offset 216
	popq	%rsi
	.cfi_def_cfa_offset 208
	testl	%eax, %eax
	jne	.L131
	pxor	%xmm0, %xmm0
	movq	24(%rsp), %r8
	movq	%rbx, %rcx
	movq	%r12, %rsi
	cvtsi2sdl	%r15d, %xmm0
	movl	$1, %edx
	movq	%rbp, %rdi
	movsd	%xmm0, 56(%rsp)
	call	CPXchgobj@PLT
	testl	%eax, %eax
	jne	.L132
	movq	8(%rsp), %rax
	addq	$1, %r14
	movq	(%rax), %rax
	cmpl	%r14d, 12(%rax)
	jg	.L115
.L117:
	addl	$1, 16(%rsp)
	movl	16(%rsp), %eax
	addq	$8, 8(%rsp)
	cmpl	%eax, 40(%rsp)
	jne	.L118
.L116:
	addl	$1, 20(%rsp)
	movl	20(%rsp), %eax
	cmpl	%eax, 44(%rsp)
	jne	.L111
.L112:
	movl	$-1, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	CPXchgobjsen@PLT
	movq	136(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L133
	addq	$152, %rsp
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
.L132:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	leaq	.LC16(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L131:
	movq	stderr(%rip), %rdi
	movq	%r13, %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L133:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE49:
	.size	add_objective_function, .-add_objective_function
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Failed to add force assignment constraint for node %d.\n"
	.text
	.p2align 4
	.globl	add_force_assignment_constraint
	.type	add_force_assignment_constraint, @function
add_force_assignment_constraint:
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%ecx, %rax
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
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movl	%edx, 56(%rsp)
	movl	%eax, 36(%rsp)
	movq	%fs:40, %rdi
	movq	%rdi, 120(%rsp)
	xorl	%edi, %edi
	testl	%eax, %eax
	jle	.L134
	leaq	0(,%rax,4), %rdi
	salq	$3, %rax
	movq	%rsi, %rbx
	xorl	%r13d, %r13d
	movq	%rax, 48(%rsp)
	leal	-1(%rdx), %eax
	leaq	72(%rsp), %r14
	movq	%rdi, 40(%rsp)
	movl	%eax, 60(%rsp)
	.p2align 4,,10
	.p2align 3
.L140:
	movq	40(%rsp), %rdi
	call	malloc@PLT
	movq	48(%rsp), %rdi
	movq	%rax, 8(%rsp)
	call	malloc@PLT
	movl	56(%rsp), %esi
	movq	%rax, 16(%rsp)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	testl	%esi, %esi
	jle	.L136
	movl	60(%rsp), %eax
	xorl	%r12d, %r12d
	leaq	80(%rsp), %r15
	movq	%rax, 24(%rsp)
	movq	%r12, %rax
	movl	%r13d, %r12d
	movq	%rax, %r13
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L142:
	movq	%rax, %r13
.L138:
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	movl	%r12d, %r9d
	leaq	.LC2(%rip), %r8
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 208
	movl	$32, %ecx
	movl	$1, %edx
	movq	%r15, %rdi
	movl	$32, %esi
	call	__snprintf_chk@PLT
	movq	%r14, %rcx
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	CPXgetcolindex@PLT
	popq	%rdx
	.cfi_def_cfa_offset 200
	popq	%rcx
	.cfi_def_cfa_offset 192
	testl	%eax, %eax
	jne	.L147
	movl	72(%rsp), %eax
	movq	8(%rsp), %rdx
	movl	%eax, (%rdx,%r13,4)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	movq	16(%rsp), %rax
	movsd	%xmm0, (%rax,%r13,8)
	leaq	1(%r13), %rax
	cmpq	%r13, 24(%rsp)
	jne	.L142
	movl	%r12d, %r13d
.L136:
	movb	$69, 67(%rsp)
	movq	%r14, %r9
	movl	$1, %ecx
	xorl	%edx, %edx
	movl	$0, 68(%rsp)
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movsd	%xmm0, 72(%rsp)
	pushq	$0
	.cfi_def_cfa_offset 200
	pushq	$0
	.cfi_def_cfa_offset 208
	pushq	32(%rsp)
	.cfi_def_cfa_offset 216
	pushq	32(%rsp)
	.cfi_def_cfa_offset 224
	leaq	100(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 232
	leaq	107(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 240
	movl	84(%rsp), %r8d
	call	CPXaddrows@PLT
	addq	$48, %rsp
	.cfi_def_cfa_offset 192
	testl	%eax, %eax
	jne	.L148
	movq	8(%rsp), %rdi
	addl	$1, %r13d
	call	free@PLT
	movq	16(%rsp), %rdi
	call	free@PLT
	cmpl	%r13d, 36(%rsp)
	jne	.L140
.L134:
	movq	120(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L149
	addq	$136, %rsp
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
.L147:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%r15, %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L148:
	movq	stderr(%rip), %rdi
	movl	%r13d, %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC17(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L149:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE50:
	.size	add_force_assignment_constraint, .-add_force_assignment_constraint
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"Failed to add basic constraint for unit %d.\n"
	.text
	.p2align 4
	.globl	add_basic_constraints
	.type	add_basic_constraints, @function
add_basic_constraints:
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movl	%edx, 40(%rsp)
	movl	%ecx, 20(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	testl	%edx, %edx
	jle	.L150
	movslq	%ecx, %rax
	movq	%rdi, %rbx
	leaq	56(%rsp), %r14
	movq	%rsi, %r13
	leaq	0(,%rax,4), %rdi
	salq	$3, %rax
	movl	$0, 16(%rsp)
	movq	%rax, 32(%rsp)
	leal	-1(%rcx), %eax
	movq	%rdi, 24(%rsp)
	movl	%eax, 44(%rsp)
	.p2align 4,,10
	.p2align 3
.L156:
	movq	24(%rsp), %rdi
	call	malloc@PLT
	movq	32(%rsp), %rdi
	movq	%rax, %r12
	call	malloc@PLT
	movl	20(%rsp), %esi
	movq	%rax, (%rsp)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	testl	%esi, %esi
	jle	.L152
	movl	44(%rsp), %eax
	xorl	%ebp, %ebp
	leaq	64(%rsp), %r15
	movq	%rax, 8(%rsp)
	jmp	.L154
	.p2align 4,,10
	.p2align 3
.L158:
	movq	%rax, %rbp
.L154:
	subq	$8, %rsp
	.cfi_def_cfa_offset 184
	movl	%ebp, %r9d
	movl	$32, %ecx
	movq	%r15, %rdi
	movl	24(%rsp), %eax
	movl	$1, %edx
	movl	$32, %esi
	leaq	.LC2(%rip), %r8
	pushq	%rax
	.cfi_def_cfa_offset 192
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movq	%r14, %rcx
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	CPXgetcolindex@PLT
	popq	%rdx
	.cfi_def_cfa_offset 184
	popq	%rcx
	.cfi_def_cfa_offset 176
	testl	%eax, %eax
	jne	.L163
	movl	56(%rsp), %eax
	movl	%eax, (%r12,%rbp,4)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	movq	(%rsp), %rax
	movsd	%xmm0, (%rax,%rbp,8)
	leaq	1(%rbp), %rax
	cmpq	%rbp, 8(%rsp)
	jne	.L158
.L152:
	movb	$71, 51(%rsp)
	movq	%r14, %r9
	movl	$1, %ecx
	xorl	%edx, %edx
	movl	$0, 52(%rsp)
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movsd	%xmm0, 56(%rsp)
	pushq	$0
	.cfi_def_cfa_offset 184
	pushq	$0
	.cfi_def_cfa_offset 192
	pushq	16(%rsp)
	.cfi_def_cfa_offset 200
	pushq	%r12
	.cfi_def_cfa_offset 208
	leaq	84(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 216
	leaq	91(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 224
	movl	68(%rsp), %r8d
	call	CPXaddrows@PLT
	addq	$48, %rsp
	.cfi_def_cfa_offset 176
	testl	%eax, %eax
	jne	.L164
	movq	%r12, %rdi
	call	free@PLT
	movq	(%rsp), %rdi
	call	free@PLT
	addl	$1, 16(%rsp)
	movl	16(%rsp), %eax
	cmpl	%eax, 40(%rsp)
	jne	.L156
.L150:
	movq	104(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L165
	addq	$120, %rsp
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
.L163:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%r15, %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L164:
	movq	stderr(%rip), %rdi
	movl	16(%rsp), %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC18(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L165:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	add_basic_constraints, .-add_basic_constraints
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"Failed to add cluster constraint for cluster %d.\n"
	.text
	.p2align 4
	.globl	add_at_least_one_unit_per_cluster_constraints
	.type	add_at_least_one_unit_per_cluster_constraints, @function
add_at_least_one_unit_per_cluster_constraints:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%ecx, %eax
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movl	%edx, 36(%rsp)
	movl	%ecx, 56(%rsp)
	movq	%fs:40, %rcx
	movq	%rcx, 120(%rsp)
	xorl	%ecx, %ecx
	testl	%eax, %eax
	jle	.L166
	movslq	%edx, %rax
	movq	%rdi, %rbp
	movl	%edx, %edi
	movq	%rsi, %rbx
	leaq	0(,%rax,4), %rdx
	salq	$3, %rax
	xorl	%r13d, %r13d
	movq	%rax, 48(%rsp)
	leal	-1(%rdi), %eax
	leaq	72(%rsp), %r14
	movq	%rdx, 40(%rsp)
	movl	%eax, 60(%rsp)
	.p2align 4,,10
	.p2align 3
.L172:
	movq	40(%rsp), %rdi
	call	malloc@PLT
	movq	48(%rsp), %rdi
	movq	%rax, 8(%rsp)
	call	malloc@PLT
	movl	36(%rsp), %esi
	movq	%rax, 16(%rsp)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	testl	%esi, %esi
	jle	.L168
	movl	60(%rsp), %eax
	xorl	%r12d, %r12d
	leaq	80(%rsp), %r15
	movq	%rax, 24(%rsp)
	movq	%r12, %rax
	movl	%r13d, %r12d
	movq	%rax, %r13
	jmp	.L170
	.p2align 4,,10
	.p2align 3
.L174:
	movq	%rax, %r13
.L170:
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	movl	%r12d, %r9d
	leaq	.LC2(%rip), %r8
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 208
	movl	$32, %ecx
	movl	$1, %edx
	movq	%r15, %rdi
	movl	$32, %esi
	call	__snprintf_chk@PLT
	movq	%r14, %rcx
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	CPXgetcolindex@PLT
	popq	%rdx
	.cfi_def_cfa_offset 200
	popq	%rcx
	.cfi_def_cfa_offset 192
	testl	%eax, %eax
	jne	.L179
	movl	72(%rsp), %eax
	movq	8(%rsp), %rdx
	movl	%eax, (%rdx,%r13,4)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	movq	16(%rsp), %rax
	movsd	%xmm0, (%rax,%r13,8)
	leaq	1(%r13), %rax
	cmpq	%r13, 24(%rsp)
	jne	.L174
	movl	%r12d, %r13d
.L168:
	movb	$71, 67(%rsp)
	movq	%r14, %r9
	movl	$1, %ecx
	xorl	%edx, %edx
	movl	$0, 68(%rsp)
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movsd	%xmm0, 72(%rsp)
	pushq	$0
	.cfi_def_cfa_offset 200
	pushq	$0
	.cfi_def_cfa_offset 208
	pushq	32(%rsp)
	.cfi_def_cfa_offset 216
	pushq	32(%rsp)
	.cfi_def_cfa_offset 224
	leaq	100(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 232
	leaq	107(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 240
	movl	84(%rsp), %r8d
	call	CPXaddrows@PLT
	addq	$48, %rsp
	.cfi_def_cfa_offset 192
	testl	%eax, %eax
	jne	.L180
	movq	8(%rsp), %rdi
	addl	$1, %r13d
	call	free@PLT
	movq	16(%rsp), %rdi
	call	free@PLT
	cmpl	%r13d, 56(%rsp)
	jne	.L172
.L166:
	movq	120(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L181
	addq	$136, %rsp
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
.L179:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%r15, %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L180:
	movq	stderr(%rip), %rdi
	movl	%r13d, %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC19(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L181:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE52:
	.size	add_at_least_one_unit_per_cluster_constraints, .-add_at_least_one_unit_per_cluster_constraints
	.section	.rodata.str1.1
.LC21:
	.string	"G"
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"Failed to create contiguity constraint for cluster %d and unit %d.\n"
	.text
	.p2align 4
	.globl	create_contiguity_constraints
	.type	create_contiguity_constraints, @function
create_contiguity_constraints:
.LFB53:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	movq	%rdi, 48(%rsp)
	movl	%esi, 60(%rsp)
	movl	%edx, 56(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 216(%rsp)
	xorl	%eax, %eax
	movl	$0, 68(%rsp)
	movq	$0x000000000, 72(%rsp)
	movl	$0, 40(%rsp)
	testl	%esi, %esi
	jle	.L182
.L183:
	movl	56(%rsp), %eax
	testl	%eax, %eax
	jle	.L192
	leaq	64(%rsp), %rax
	movq	48(%rsp), %rbx
	xorl	%r15d, %r15d
	leaq	80(%rsp), %r12
	movq	%rax, 24(%rsp)
	.p2align 4,,10
	.p2align 3
.L190:
	movq	(%rbx), %rax
	movl	12(%rax), %ebp
	leal	1(%rbp), %eax
	movslq	%eax, %rdx
	movl	%eax, 44(%rsp)
	leaq	0(,%rdx,4), %rdi
	movq	%rdx, 16(%rsp)
	call	malloc@PLT
	movq	16(%rsp), %rdx
	movq	%rax, 8(%rsp)
	leaq	0(,%rdx,8), %rdi
	call	malloc@PLT
	movl	40(%rsp), %r8d
	movq	%r12, %rdi
	movl	%r15d, %r9d
	movq	%rax, 16(%rsp)
	leaq	.LC2(%rip), %rcx
	movl	$128, %edx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__sprintf_chk@PLT
	movq	24(%rsp), %rcx
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	CPXgetcolindex@PLT
	testl	%eax, %eax
	jne	.L201
	movl	64(%rsp), %eax
	movq	8(%rsp), %rsi
	movsd	.LC20(%rip), %xmm1
	movl	%eax, (%rsi)
	movq	16(%rsp), %rax
	movsd	%xmm1, (%rax)
	testl	%ebp, %ebp
	jle	.L186
	leal	-1(%rbp), %eax
	xorl	%ebp, %ebp
	leaq	4(,%rax,4), %rax
	movq	%rax, 32(%rsp)
	movq	%rbx, %rax
	movq	%rbp, %rbx
	movq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L188:
	movq	0(%rbp), %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 296
	movl	%r15d, %r9d
	movl	$32, %edx
	leaq	.LC0(%rip), %rcx
	movl	$1, %esi
	movq	%r12, %rdi
	movq	48(%rax), %rax
	movl	(%rax,%rbx), %eax
	pushq	%rax
	.cfi_def_cfa_offset 304
	movl	56(%rsp), %r8d
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movq	40(%rsp), %rcx
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	CPXgetcolindex@PLT
	movl	80(%rsp), %eax
	popq	%rdx
	.cfi_def_cfa_offset 296
	popq	%rcx
	.cfi_def_cfa_offset 288
	testl	%eax, %eax
	js	.L202
	movq	8(%rsp), %rcx
	movsd	.LC10(%rip), %xmm0
	movl	%eax, 4(%rcx,%rbx)
	movq	16(%rsp), %rax
	movsd	%xmm0, 8(%rax,%rbx,2)
	addq	$4, %rbx
	cmpq	%rbx, 32(%rsp)
	jne	.L188
	movq	%rbp, %rbx
.L186:
	pushq	$0
	.cfi_def_cfa_offset 296
	movl	$1, %ecx
	xorl	%edx, %edx
	movq	%r13, %rsi
	pushq	$0
	.cfi_def_cfa_offset 304
	movq	%r14, %rdi
	pushq	32(%rsp)
	.cfi_def_cfa_offset 312
	pushq	32(%rsp)
	.cfi_def_cfa_offset 320
	leaq	100(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 328
	leaq	.LC21(%rip), %rax
	pushq	%rax
	.cfi_def_cfa_offset 336
	movl	92(%rsp), %r8d
	leaq	120(%rsp), %r9
	call	CPXaddrows@PLT
	addq	$48, %rsp
	.cfi_def_cfa_offset 288
	testl	%eax, %eax
	jne	.L203
	movq	8(%rsp), %rdi
	addl	$1, %r15d
	addq	$8, %rbx
	call	free@PLT
	movq	16(%rsp), %rdi
	call	free@PLT
	cmpl	%r15d, 56(%rsp)
	jne	.L190
.L192:
	addl	$1, 40(%rsp)
	movl	40(%rsp), %eax
	cmpl	%eax, 60(%rsp)
	jne	.L183
.L182:
	movq	216(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L204
	addq	$232, %rsp
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
.L202:
	.cfi_restore_state
	movq	%r12, %rcx
	leaq	.LC1(%rip), %rdx
.L200:
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L201:
	movq	%r12, %rcx
	leaq	.LC3(%rip), %rdx
	jmp	.L200
.L203:
	movq	stderr(%rip), %rdi
	movl	40(%rsp), %ecx
	movl	%r15d, %r8d
	xorl	%eax, %eax
	leaq	.LC22(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L204:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE53:
	.size	create_contiguity_constraints, .-create_contiguity_constraints
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"Could not open CPLEX environment.\n"
	.section	.rodata.str1.1
.LC24:
	.string	"districting"
.LC25:
	.string	"Could not create LP problem.\n"
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"Failed to optimize the ILP problem.\n"
	.section	.rodata.str1.1
.LC27:
	.string	"model.lp"
.LC28:
	.string	"here\n"
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"Failed to write problem to file.\n"
	.section	.rodata.str1.1
.LC30:
	.string	"Solution status: %d\n"
.LC31:
	.string	"%s\n"
	.section	.rodata.str1.8
	.align 8
.LC32:
	.string	"Failed to get objective value.\n"
	.section	.rodata.str1.1
.LC33:
	.string	"Objective value: %.2f\n"
	.section	.rodata.str1.8
	.align 8
.LC34:
	.string	"Failed to get optimal solution.\n"
	.align 8
.LC35:
	.string	"Failed to get variable name for column %d.\n"
	.section	.rodata.str1.1
.LC36:
	.string	"%s: %.2f\n"
.LC37:
	.string	"Failed to free the problem.\n"
	.section	.rodata.str1.8
	.align 8
.LC38:
	.string	"Failed to close CPLEX environment.\n"
	.text
	.p2align 4
	.globl	runILP
	.type	runILP, @function
runILP:
.LFB54:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%edx, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$1112, %rsp
	.cfi_def_cfa_offset 1168
	movl	%esi, 20(%rsp)
	leaq	32(%rsp), %r13
	movl	%r8d, 24(%rsp)
	movq	%r13, %rdi
	movq	%fs:40, %rax
	movq	%rax, 1096(%rsp)
	xorl	%eax, %eax
	movq	$0, 40(%rsp)
	movq	$0, 48(%rsp)
	call	CPXopenCPLEX@PLT
	movq	%rax, 40(%rsp)
	testq	%rax, %rax
	je	.L239
	movq	%rax, %rdi
	leaq	.LC24(%rip), %rdx
	movq	%r13, %rsi
	call	CPXcreateprob@PLT
	movq	%rax, 8(%rsp)
	movq	%rax, 48(%rsp)
	testq	%rax, %rax
	je	.L207
	leal	-1(%rbp), %r13d
	xorl	%eax, %eax
	testl	%ebp, %ebp
	jle	.L209
	.p2align 4,,10
	.p2align 3
.L210:
	movq	(%r14,%rax,8), %rdx
	movl	%eax, 44(%rdx)
	movq	%rax, %rdx
	addq	$1, %rax
	cmpq	%rdx, %r13
	jne	.L210
	movl	%ebp, 28(%rsp)
	movq	%r14, %r15
	leaq	8(%r14,%r13,8), %rbx
	.p2align 4,,10
	.p2align 3
.L215:
	movq	(%r15), %rbp
	movslq	12(%rbp), %rdi
	movq	%rdi, %r12
	salq	$2, %rdi
	call	malloc@PLT
	movq	%rax, 48(%rbp)
	testl	%r12d, %r12d
	jle	.L211
	movq	16(%rbp), %r9
	leal	-1(%r12), %r10d
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L214:
	movl	(%r9,%rcx,4), %edi
	xorl	%edx, %edx
	jmp	.L213
	.p2align 4,,10
	.p2align 3
.L241:
	leaq	1(%rdx), %rsi
	cmpq	%r13, %rdx
	je	.L240
	movq	%rsi, %rdx
.L213:
	movq	(%r14,%rdx,8), %r8
	movl	%edx, %esi
	cmpl	(%r8), %edi
	jne	.L241
	movl	%esi, (%rax,%rcx,4)
	leaq	1(%rcx), %rdx
	cmpq	%rcx, %r10
	je	.L211
.L228:
	movq	%rdx, %rcx
	jmp	.L214
	.p2align 4,,10
	.p2align 3
.L240:
	movl	$-1, %esi
	leaq	1(%rcx), %rdx
	movl	%esi, (%rax,%rcx,4)
	cmpq	%rcx, %r10
	jne	.L228
.L211:
	addq	$8, %r15
	cmpq	%rbx, %r15
	jne	.L215
	movl	28(%rsp), %ebp
.L209:
	movl	20(%rsp), %ebx
	movq	8(%rsp), %r8
	movl	%ebp, %edx
	movq	%r14, %rdi
	movq	40(%rsp), %rcx
	movl	%ebx, %esi
	call	create_decision_variables
	movq	48(%rsp), %r8
	movl	%ebp, %edx
	movl	%ebx, %esi
	movq	40(%rsp), %rcx
	movq	%r14, %rdi
	call	create_b_vars
	movq	48(%rsp), %rsi
	movl	%ebx, %ecx
	movl	%ebp, %edx
	movq	40(%rsp), %rdi
	call	add_basic_constraints
	movq	48(%rsp), %rsi
	movl	%ebx, %ecx
	movl	%ebp, %edx
	movq	40(%rsp), %rdi
	call	add_at_least_one_unit_per_cluster_constraints
	movl	24(%rsp), %r9d
	movl	%ebx, %edx
	movl	%ebp, %esi
	movq	48(%rsp), %r8
	movq	40(%rsp), %rcx
	movq	%r14, %rdi
	call	add_population_constraints
	movq	48(%rsp), %r8
	movl	%ebp, %edx
	movl	%ebx, %esi
	movq	40(%rsp), %rcx
	movq	%r14, %rdi
	call	create_contiguity_constraints
	movq	48(%rsp), %r8
	movl	%ebx, %edx
	movl	%ebp, %esi
	movq	40(%rsp), %rcx
	movq	%r14, %rdi
	call	add_objective_function
	movq	48(%rsp), %rsi
	movq	40(%rsp), %rdi
	call	CPXmipopt@PLT
	movl	%eax, 32(%rsp)
	testl	%eax, %eax
	jne	.L242
	movq	48(%rsp), %rsi
	movq	40(%rsp), %rdi
	xorl	%ecx, %ecx
	leaq	.LC27(%rip), %rdx
	call	CPXwriteprob@PLT
	movl	$1, %edi
	leaq	.LC28(%rip), %rsi
	movl	%eax, 32(%rsp)
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	32(%rsp), %edi
	testl	%edi, %edi
	jne	.L243
	movq	48(%rsp), %rsi
	movq	40(%rsp), %rdi
	leaq	64(%rsp), %r12
	call	CPXgetstat@PLT
	leaq	.LC30(%rip), %rsi
	movl	$1, %edi
	movl	%eax, %edx
	movl	%eax, %ebp
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	48(%rsp), %rsi
	movq	40(%rsp), %rdi
	leaq	56(%rsp), %rdx
	call	CPXgetobjval@PLT
	movq	40(%rsp), %rdi
	movq	%r12, %rdx
	movl	%ebp, %esi
	movl	%eax, 32(%rsp)
	call	CPXgetstatstring@PLT
	movq	%r12, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC31(%rip), %rsi
	call	__printf_chk@PLT
	movl	32(%rsp), %esi
	testl	%esi, %esi
	jne	.L244
	movsd	56(%rsp), %xmm0
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC33(%rip), %rsi
	call	__printf_chk@PLT
	movq	48(%rsp), %rsi
	movq	40(%rsp), %rdi
	call	CPXgetnumcols@PLT
	movslq	%eax, %rdi
	movq	%rdi, %rbp
	salq	$3, %rdi
	call	malloc@PLT
	leal	-1(%rbp), %r13d
	movq	48(%rsp), %rsi
	xorl	%ecx, %ecx
	movq	40(%rsp), %rdi
	movl	%r13d, %r8d
	movq	%rax, %rdx
	movq	%rax, %r12
	call	CPXgetx@PLT
	movl	%eax, 32(%rsp)
	testl	%eax, %eax
	jne	.L219
	movl	%r13d, %eax
	xorl	%ebx, %ebx
	leaq	36(%rsp), %r14
	movq	%rax, 8(%rsp)
	leaq	.LC36(%rip), %r15
	testl	%ebp, %ebp
	jg	.L223
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L229:
	movq	%rax, %rbx
.L223:
	movl	$8, %edi
	call	malloc@PLT
	movl	$32, %edi
	movq	%rax, %rbp
	call	malloc@PLT
	pushq	%rbx
	.cfi_def_cfa_offset 1176
	movq	%rbp, %rdx
	movq	%r14, %r9
	pushq	%rbx
	.cfi_def_cfa_offset 1184
	movq	64(%rsp), %rsi
	movq	%rax, %rcx
	movl	$32, %r8d
	movq	56(%rsp), %rdi
	movq	%rax, %r13
	call	CPXgetcolname@PLT
	movl	%eax, 48(%rsp)
	popq	%rdx
	.cfi_def_cfa_offset 1176
	popq	%rcx
	.cfi_def_cfa_offset 1168
	testl	%eax, %eax
	jne	.L245
	movsd	(%r12,%rbx,8), %xmm0
	movq	0(%rbp), %rdx
	movq	%r15, %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r13, %rdi
	call	free@PLT
	leaq	1(%rbx), %rax
	cmpq	8(%rsp), %rbx
	jne	.L229
.L221:
	movq	%r12, %rdi
	call	free@PLT
	movq	40(%rsp), %rdi
	leaq	48(%rsp), %rsi
	call	CPXfreeprob@PLT
	movl	%eax, 32(%rsp)
	testl	%eax, %eax
	jne	.L246
	leaq	40(%rsp), %rdi
	call	CPXcloseCPLEX@PLT
	movl	%eax, 32(%rsp)
	testl	%eax, %eax
	jne	.L247
	movq	1096(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L248
	addq	$1112, %rsp
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
.L245:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movl	%ebx, %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC35(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L219:
	leaq	.LC34(%rip), %rdx
.L238:
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L244:
	leaq	.LC32(%rip), %rdx
	jmp	.L238
.L243:
	leaq	.LC29(%rip), %rdx
	jmp	.L238
.L242:
	leaq	.LC26(%rip), %rdx
	jmp	.L238
.L207:
	leaq	.LC25(%rip), %rdx
	jmp	.L238
.L239:
	leaq	.LC23(%rip), %rdx
	jmp	.L238
.L248:
	call	__stack_chk_fail@PLT
.L247:
	leaq	.LC38(%rip), %rdx
	jmp	.L238
.L246:
	leaq	.LC37(%rip), %rdx
	jmp	.L238
	.cfi_endproc
.LFE54:
	.size	runILP, .-runILP
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	1717986918
	.long	1072850534
	.align 8
.LC7:
	.long	858993459
	.long	1072378675
	.align 8
.LC10:
	.long	0
	.long	1072693248
	.align 8
.LC20:
	.long	0
	.long	-1074790400
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
