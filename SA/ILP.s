	.file	"ILP.c"
	.text
	.p2align 4
	.globl	create_code_index
	.type	create_code_index, @function
create_code_index:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
1:	call	*mcount@GOTPCREL(%rip)
	lock addq	$1, __gcov0.create_code_index(%rip)
	testl	%esi, %esi
	jle	.L1
	leal	-1(%rsi), %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movq	(%rdi,%rax,8), %rdx
	movl	%eax, 44(%rdx)
	lock addq	$1, 8+__gcov0.create_code_index(%rip)
	movq	%rax, %rdx
	addq	$1, %rax
	cmpq	%rcx, %rdx
	jne	.L3
.L1:
	popq	%rbp
	.cfi_def_cfa 7, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
1:	call	*mcount@GOTPCREL(%rip)
	lock addq	$1, __gcov0.find_id_by_code(%rip)
	testl	%esi, %esi
	jle	.L7
	subl	$1, %esi
	xorl	%eax, %eax
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L8:
	lock addq	$1, 16+__gcov0.find_id_by_code(%rip)
	leaq	1(%rax), %rcx
	cmpq	%rsi, %rax
	je	.L7
	movq	%rcx, %rax
.L10:
	movq	(%rdi,%rax,8), %rcx
	movl	%eax, %r8d
	cmpl	%edx, (%rcx)
	jne	.L8
	lock addq	$1, 8+__gcov0.find_id_by_code(%rip)
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	movl	$-1, %r8d
	popq	%rbp
	.cfi_def_cfa 7, 8
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
	subq	$24, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, %r12
	lock addq	$1, __gcov0.create_neighbor_index(%rip)
	testl	%esi, %esi
	jle	.L12
	leal	-1(%rsi), %r13d
	movq	%rdi, %r15
	leaq	8(%rdi,%r13,8), %rax
	movq	%rax, -56(%rbp)
	.p2align 4,,10
	.p2align 3
.L19:
	movq	(%r15), %r14
	movslq	12(%r14), %rdi
	movq	%rdi, %rbx
	salq	$2, %rdi
	call	malloc@PLT
	movq	%rax, 48(%r14)
	lock addq	$1, 8+__gcov0.create_neighbor_index(%rip)
	testl	%ebx, %ebx
	jle	.L14
	leal	-1(%rbx), %edx
	xorl	%r8d, %r8d
	leaq	4(,%rdx,4), %r9
	.p2align 4,,10
	.p2align 3
.L18:
	movq	16(%r14), %rdx
	movl	(%rdx,%r8), %edi
	lock addq	$1, 16+__gcov0.create_neighbor_index(%rip)
	xorl	%edx, %edx
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L15:
	lock addq	$1, 32+__gcov0.create_neighbor_index(%rip)
	leaq	1(%rdx), %rcx
	cmpq	%rdx, %r13
	je	.L23
	movq	%rcx, %rdx
.L17:
	movq	(%r12,%rdx,8), %rcx
	movl	%edx, %esi
	cmpl	(%rcx), %edi
	jne	.L15
	lock addq	$1, 24+__gcov0.create_neighbor_index(%rip)
.L16:
	movl	%esi, (%rax,%r8)
	addq	$4, %r8
	cmpq	%r8, %r9
	jne	.L18
.L14:
	addq	$8, %r15
	cmpq	%r15, -56(%rbp)
	jne	.L19
.L12:
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	.cfi_restore_state
	movl	$-1, %esi
	jmp	.L16
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
1:	call	*mcount@GOTPCREL(%rip)
	lock addq	$1, __gcov0.are_neighbors(%rip)
	movl	12(%rdi), %eax
	testl	%eax, %eax
	jle	.L25
	xorl	%eax, %eax
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L26:
	lock addq	$1, 16+__gcov0.are_neighbors(%rip)
	addq	$1, %rax
	cmpl	%eax, 12(%rdi)
	jle	.L25
.L28:
	movq	48(%rdi), %rdx
	movl	44(%rsi), %ecx
	cmpl	%ecx, (%rdx,%rax,4)
	jne	.L26
	lock addq	$1, 8+__gcov0.are_neighbors(%rip)
	movl	$1, %eax
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L25:
	.cfi_restore_state
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	subq	$80, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
1:	call	*mcount@GOTPCREL(%rip)
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	movl	%esi, %r9d
	movq	%rcx, %r12
	movq	%r8, %r13
	lock addq	$1, __gcov0.get_b_var_index(%rip)
	leaq	.LC0(%rip), %rcx
	movl	$1, %esi
	pushq	%rdx
	leaq	-80(%rbp), %r14
	movl	%edi, %r8d
	movl	$32, %edx
	movq	%r14, %rdi
	call	__sprintf_chk@PLT
	leaq	-84(%rbp), %rcx
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	CPXgetcolindex@PLT
	movl	-84(%rbp), %eax
	popq	%rdx
	popq	%rcx
	testl	%eax, %eax
	js	.L33
	lock addq	$1, 16+__gcov0.get_b_var_index(%rip)
	movq	-40(%rbp), %rsi
	xorq	%fs:40, %rsi
	jne	.L34
	leaq	-24(%rbp), %rsp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L33:
	.cfi_restore_state
	lock addq	$1, 8+__gcov0.get_b_var_index(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC1(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r14, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 24+__gcov0.get_b_var_index(%rip)
	movl	$1, %edi
	call	exit@PLT
.L34:
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	subq	$168, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
1:	call	*mcount@GOTPCREL(%rip)
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	movl	%edi, %r8d
	movl	%esi, %r9d
	movq	%rdx, %r12
	movq	%rcx, %r13
	lock addq	$1, __gcov0.get_var_index(%rip)
	movl	$128, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rcx
	leaq	-176(%rbp), %r14
	movq	%r14, %rdi
	call	__sprintf_chk@PLT
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	leaq	-180(%rbp), %rcx
	call	CPXgetcolindex@PLT
	testl	%eax, %eax
	jne	.L38
	lock addq	$1, 16+__gcov0.get_var_index(%rip)
	movl	-180(%rbp), %eax
	movq	-40(%rbp), %rdx
	xorq	%fs:40, %rdx
	jne	.L39
	addq	$168, %rsp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L38:
	.cfi_restore_state
	lock addq	$1, 8+__gcov0.get_var_index(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC3(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r14, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 24+__gcov0.get_var_index(%rip)
	movl	$1, %edi
	call	exit@PLT
.L39:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE45:
	.size	get_var_index, .-get_var_index
	.p2align 4
	.globl	init_adjMatrix
	.type	init_adjMatrix, @function
init_adjMatrix:
.LFB46:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
1:	call	*mcount@GOTPCREL(%rip)
	lock addq	$1, __gcov0.init_adjMatrix(%rip)
	movslq	%esi, %r8
	testl	%esi, %esi
	jle	.L40
	leal	-1(%rsi), %r11d
	salq	$2, %r8
	movq	%rdx, %r9
	xorl	%r10d, %r10d
	leaq	4(%rdx,%r11,4), %rcx
	notq	%r11
	salq	$2, %r11
	.p2align 4,,10
	.p2align 3
.L44:
	leaq	(%r11,%rcx), %rax
	.p2align 4,,10
	.p2align 3
.L43:
	movl	$0, (%rax)
	lock addq	$1, 8+__gcov0.init_adjMatrix(%rip)
	addq	$4, %rax
	cmpq	%rax, %rcx
	jne	.L43
	lock addq	$1, 16+__gcov0.init_adjMatrix(%rip)
	leal	1(%r10), %eax
	addq	%r8, %rcx
	cmpl	%eax, %esi
	je	.L53
	movl	%eax, %r10d
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L40:
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L53:
	.cfi_restore_state
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L45:
	movq	(%rdi), %rax
	xorl	%ecx, %ecx
	movslq	%r11d, %rsi
	leaq	(%rdx,%rsi,4), %rsi
	cmpl	$0, 12(%rax)
	jle	.L48
	.p2align 4,,10
	.p2align 3
.L46:
	movq	48(%rax), %rax
	movslq	(%rax,%rcx,4), %rax
	movl	$1, (%r9,%rax,4)
	imulq	%r8, %rax
	movl	$1, (%rsi,%rax)
	lock addq	$1, 24+__gcov0.init_adjMatrix(%rip)
	movq	(%rdi), %rax
	addq	$1, %rcx
	cmpl	%ecx, 12(%rax)
	jg	.L46
.L48:
	lock addq	$1, 32+__gcov0.init_adjMatrix(%rip)
	leal	1(%r11), %eax
	addq	$8, %rdi
	addq	%r8, %r9
	cmpl	%r10d, %r11d
	je	.L40
	movl	%eax, %r11d
	jmp	.L45
	.cfi_endproc
.LFE46:
	.size	init_adjMatrix, .-init_adjMatrix
	.p2align 4
	.globl	floydWarshall
	.type	floydWarshall, @function
floydWarshall:
.LFB47:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
1:	call	*mcount@GOTPCREL(%rip)
	movslq	%edi, %rbx
	movq	%rdx, %r12
	movq	%rbx, %r8
	lock addq	$1, __gcov0.floydWarshall(%rip)
	testl	%ebx, %ebx
	jle	.L54
	salq	$2, %rbx
	movq	%rdx, %rcx
	leal	-1(%r8), %edi
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L61:
	xorl	%eax, %eax
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L74:
	lock addq	$1, 16+__gcov0.floydWarshall(%rip)
	movl	$1, (%rcx,%rax,4)
.L58:
	leaq	1(%rax), %rdx
	cmpq	%rax, %rdi
	je	.L72
.L69:
	movq	%rdx, %rax
.L60:
	cmpl	%eax, %r10d
	je	.L73
	movl	(%rsi,%rax,4), %edx
	testl	%edx, %edx
	jne	.L74
	lock addq	$1, 24+__gcov0.floydWarshall(%rip)
	movl	$2147483647, (%rcx,%rax,4)
	leaq	1(%rax), %rdx
	cmpq	%rax, %rdi
	jne	.L69
.L72:
	lock addq	$1, 32+__gcov0.floydWarshall(%rip)
	leal	1(%r10), %eax
	addq	%rbx, %rcx
	addq	%rbx, %rsi
	cmpl	%eax, %r8d
	je	.L75
	movl	%eax, %r10d
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L73:
	lock addq	$1, 8+__gcov0.floydWarshall(%rip)
	movl	$0, (%rcx,%rax,4)
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L67:
	lock addq	$1, 80+__gcov0.floydWarshall(%rip)
	subq	$4, %r11
	addq	%rbx, %r8
	cmpq	%r11, %r13
	jne	.L62
.L54:
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L75:
	.cfi_restore_state
	movl	%r10d, %esi
	movq	%r12, %r8
	xorl	%r11d, %r11d
	movq	%rsi, %r13
	notq	%r13
	salq	$2, %r13
	.p2align 4,,10
	.p2align 3
.L62:
	movq	%r12, %rcx
	xorl	%r9d, %r9d
	subq	%r11, %rcx
	.p2align 4,,10
	.p2align 3
.L68:
	leaq	(%rcx,%r11), %rdi
	xorl	%eax, %eax
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L63:
	movl	(%r8,%rax,4), %r14d
	cmpl	$2147483647, %r14d
	je	.L76
	lock addq	$1, 48+__gcov0.floydWarshall(%rip)
	addl	%r14d, %edx
	cmpl	%edx, (%rdi,%rax,4)
	jle	.L64
	lock addq	$1, 64+__gcov0.floydWarshall(%rip)
	movl	%edx, (%rdi,%rax,4)
.L64:
	leaq	1(%rax), %rdx
	cmpq	%rax, %rsi
	je	.L77
.L71:
	movq	%rdx, %rax
.L66:
	movl	(%rcx), %edx
	cmpl	$2147483647, %edx
	jne	.L63
	lock addq	$1, 40+__gcov0.floydWarshall(%rip)
	leaq	1(%rax), %rdx
	cmpq	%rax, %rsi
	jne	.L71
.L77:
	lock addq	$1, 72+__gcov0.floydWarshall(%rip)
	leal	1(%r9), %eax
	addq	%rbx, %rcx
	cmpl	%r9d, %r10d
	je	.L67
	movl	%eax, %r9d
	jmp	.L68
	.p2align 4,,10
	.p2align 3
.L76:
	lock addq	$1, 56+__gcov0.floydWarshall(%rip)
	jmp	.L64
	.cfi_endproc
.LFE47:
	.size	floydWarshall, .-floydWarshall
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
.LFB48:
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
	subq	$168, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movl	%esi, -152(%rbp)
	movq	%rdi, %r15
	movq	%rcx, %r13
	movq	%r8, %r14
	movl	%edx, -172(%rbp)
	movl	%r9d, -176(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	lock addq	$1, __gcov0.add_population_constraints(%rip)
	testl	%edx, %edx
	jle	.L79
	movl	$0, -148(%rbp)
	movslq	%esi, %rax
	leaq	0(,%rax,4), %rdi
	salq	$3, %rax
	movq	%rax, -192(%rbp)
	leal	-1(%rsi), %eax
	movq	%rdi, -184(%rbp)
	movl	%eax, -196(%rbp)
	.p2align 4,,10
	.p2align 3
.L85:
	movq	-184(%rbp), %rdi
	call	malloc@PLT
	movq	-192(%rbp), %rdi
	movq	%rax, -136(%rbp)
	call	malloc@PLT
	movl	-152(%rbp), %esi
	movq	%rax, -144(%rbp)
	testl	%esi, %esi
	jle	.L80
	movl	-196(%rbp), %eax
	xorl	%ebx, %ebx
	leaq	-96(%rbp), %r12
	movq	%rax, -168(%rbp)
	leaq	-104(%rbp), %rax
	movq	%rax, -160(%rbp)
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L87:
	movq	%rax, %rbx
.L82:
	subq	$8, %rsp
	movl	-148(%rbp), %r9d
	movq	%r12, %rdi
	xorl	%eax, %eax
	pushq	%rbx
	movl	$32, %ecx
	movl	$1, %edx
	movl	$32, %esi
	leaq	.LC2(%rip), %r8
	call	__snprintf_chk@PLT
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	movq	-160(%rbp), %rcx
	call	CPXgetcolindex@PLT
	popq	%rdx
	popq	%rcx
	testl	%eax, %eax
	jne	.L89
	movl	-104(%rbp), %eax
	movq	-136(%rbp), %rdx
	pxor	%xmm0, %xmm0
	movl	%eax, (%rdx,%rbx,4)
	movq	(%r15,%rbx,8), %rax
	cvtsi2sdl	8(%rax), %xmm0
	movq	-144(%rbp), %rax
	movsd	%xmm0, (%rax,%rbx,8)
	lock addq	$1, 24+__gcov0.add_population_constraints(%rip)
	leaq	1(%rbx), %rax
	cmpq	%rbx, -168(%rbp)
	jne	.L87
.L80:
	lock addq	$1, 32+__gcov0.add_population_constraints(%rip)
	pxor	%xmm0, %xmm0
	movl	$1, %ecx
	xorl	%edx, %edx
	movsd	.LC5(%rip), %xmm1
	movl	-152(%rbp), %r8d
	cvtsi2sdl	-176(%rbp), %xmm0
	pushq	$0
	movq	%r14, %rsi
	movq	%r13, %rdi
	leaq	-118(%rbp), %rax
	leaq	-116(%rbp), %rbx
	pushq	$0
	pushq	-144(%rbp)
	leaq	-112(%rbp), %r9
	pushq	-136(%rbp)
	mulsd	%xmm0, %xmm1
	pushq	%rbx
	pushq	%rax
	movb	$76, -118(%rbp)
	movl	$0, -116(%rbp)
	movsd	%xmm0, -160(%rbp)
	movsd	%xmm1, -112(%rbp)
	call	CPXaddrows@PLT
	lock addq	$1, 40+__gcov0.add_population_constraints(%rip)
	movsd	-160(%rbp), %xmm0
	addq	$48, %rsp
	testl	%eax, %eax
	jne	.L90
	mulsd	.LC7(%rip), %xmm0
	leaq	-117(%rbp), %rax
	pushq	$0
	xorl	%edx, %edx
	pushq	$0
	movl	-152(%rbp), %r8d
	leaq	-104(%rbp), %r9
	movq	%r14, %rsi
	pushq	-144(%rbp)
	movl	$1, %ecx
	movq	%r13, %rdi
	pushq	-136(%rbp)
	pushq	%rbx
	pushq	%rax
	movb	$71, -117(%rbp)
	movsd	%xmm0, -104(%rbp)
	call	CPXaddrows@PLT
	lock addq	$1, 64+__gcov0.add_population_constraints(%rip)
	addq	$48, %rsp
	testl	%eax, %eax
	jne	.L91
	movq	-136(%rbp), %rdi
	call	free@PLT
	movq	-144(%rbp), %rdi
	call	free@PLT
	addl	$1, -148(%rbp)
	movl	-148(%rbp), %eax
	cmpl	%eax, -172(%rbp)
	jne	.L85
.L79:
	lock addq	$1, 88+__gcov0.add_population_constraints(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L92
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L89:
	.cfi_restore_state
	lock addq	$1, 8+__gcov0.add_population_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r12, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 16+__gcov0.add_population_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L90:
	lock addq	$1, 48+__gcov0.add_population_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC6(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movl	-148(%rbp), %ecx
	call	__fprintf_chk@PLT
	lock addq	$1, 56+__gcov0.add_population_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L92:
	call	__stack_chk_fail@PLT
	.p2align 4,,10
	.p2align 3
.L91:
	lock addq	$1, 72+__gcov0.add_population_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC8(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movl	-148(%rbp), %ecx
	call	__fprintf_chk@PLT
	lock addq	$1, 80+__gcov0.add_population_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE48:
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
.LFB49:
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
	subq	$168, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, -208(%rbp)
	movq	%rcx, %r12
	movq	%r8, %r13
	movl	%esi, -168(%rbp)
	movl	%edx, -164(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	lock addq	$1, __gcov0.create_decision_variables(%rip)
	xorl	%r15d, %r15d
	movl	%eax, -200(%rbp)
	testl	%esi, %esi
	jle	.L95
	leaq	-120(%rbp), %rdx
	movq	%rcx, -152(%rbp)
	leaq	-96(%rbp), %rbx
	movq	%rdx, -176(%rbp)
	movq	%r8, -160(%rbp)
	.p2align 4,,10
	.p2align 3
.L94:
	movl	-164(%rbp), %r8d
	testl	%r8d, %r8d
	jle	.L98
	leaq	-104(%rbp), %rdi
	addl	$1, %eax
	leaq	-128(%rbp), %r14
	xorl	%r13d, %r13d
	movq	%rdi, -136(%rbp)
	leaq	-112(%rbp), %r12
	movl	%eax, -144(%rbp)
	.p2align 4,,10
	.p2align 3
.L97:
	subq	$8, %rsp
	movl	%r15d, %r9d
	leaq	.LC2(%rip), %r8
	xorl	%eax, %eax
	pushq	%r13
	movl	$32, %ecx
	movl	$1, %edx
	movq	%rbx, %rdi
	movl	$32, %esi
	call	__snprintf_chk@PLT
	movq	.LC10(%rip), %rax
	movq	%r14, %r8
	pushq	-136(%rbp)
	movq	-176(%rbp), %r9
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%rbx, -104(%rbp)
	movq	%rax, -120(%rbp)
	leaq	.LC11(%rip), %rax
	movq	-160(%rbp), %rsi
	pushq	%rax
	movq	-152(%rbp), %rdi
	movq	$0x000000000, -128(%rbp)
	movq	$0x000000000, -112(%rbp)
	call	CPXnewcols@PLT
	addq	$32, %rsp
	testl	%eax, %eax
	jne	.L115
	movl	-144(%rbp), %eax
	addl	%r13d, %eax
	addl	$1, %r13d
	lock addq	$1, 24+__gcov0.create_decision_variables(%rip)
	cmpl	%r13d, -164(%rbp)
	jne	.L97
.L98:
	lock addq	$1, 32+__gcov0.create_decision_variables(%rip)
	addl	$1, %r15d
	cmpl	%r15d, -168(%rbp)
	jne	.L94
	movl	%eax, -200(%rbp)
	movq	-152(%rbp), %r12
	movq	-160(%rbp), %r13
.L95:
	lock addq	$1, 40+__gcov0.create_decision_variables(%rip)
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	-200(%rbp), %edx
	call	__printf_chk@PLT
	lock addq	$1, 48+__gcov0.create_decision_variables(%rip)
	movl	-164(%rbp), %edi
	testl	%edi, %edi
	jle	.L99
	movslq	-168(%rbp), %rax
	movq	%r12, -152(%rbp)
	leaq	-112(%rbp), %r15
	movl	$0, -176(%rbp)
	movq	-208(%rbp), %r14
	movq	%rax, %rbx
	leaq	0(,%rax,4), %rcx
	salq	$3, %rax
	movq	%rax, -192(%rbp)
	leal	-1(%rbx), %eax
	movq	%rcx, -184(%rbp)
	movl	%eax, -196(%rbp)
	.p2align 4,,10
	.p2align 3
.L104:
	movq	-184(%rbp), %rdi
	call	malloc@PLT
	movq	-192(%rbp), %rdi
	movq	%rax, -136(%rbp)
	call	malloc@PLT
	movl	-168(%rbp), %esi
	movq	%rax, -144(%rbp)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	testl	%esi, %esi
	jle	.L100
	movl	-196(%rbp), %eax
	xorl	%r12d, %r12d
	leaq	-96(%rbp), %rbx
	movq	%rax, -160(%rbp)
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L108:
	movq	%rax, %r12
.L102:
	movq	(%r14), %rax
	subq	$8, %rsp
	movl	%r12d, %r9d
	movl	$32, %ecx
	leaq	.LC2(%rip), %r8
	movl	$1, %edx
	movl	$32, %esi
	movq	%rbx, %rdi
	movl	44(%rax), %eax
	pushq	%rax
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movq	%r15, %rcx
	movq	%rbx, %rdx
	movq	%r13, %rsi
	movq	-152(%rbp), %rdi
	call	CPXgetcolindex@PLT
	popq	%rdx
	popq	%rcx
	testl	%eax, %eax
	jne	.L116
	movl	-112(%rbp), %eax
	movq	-136(%rbp), %rdx
	movl	%eax, (%rdx,%r12,4)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	movq	-144(%rbp), %rax
	movsd	%xmm0, (%rax,%r12,8)
	lock addq	$1, 72+__gcov0.create_decision_variables(%rip)
	leaq	1(%r12), %rax
	cmpq	%r12, -160(%rbp)
	jne	.L108
.L100:
	lock addq	$1, 80+__gcov0.create_decision_variables(%rip)
	movl	$1, %ecx
	xorl	%edx, %edx
	movl	-168(%rbp), %r8d
	movq	-152(%rbp), %rdi
	leaq	-120(%rbp), %rax
	pushq	$0
	movq	%r15, %r9
	movq	%r13, %rsi
	pushq	$0
	pushq	-144(%rbp)
	pushq	-136(%rbp)
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	movl	$0, -120(%rbp)
	movb	$69, -128(%rbp)
	movsd	%xmm0, -112(%rbp)
	call	CPXaddrows@PLT
	lock addq	$1, 88+__gcov0.create_decision_variables(%rip)
	addq	$48, %rsp
	testl	%eax, %eax
	jne	.L117
	movq	-136(%rbp), %rdi
	addq	$8, %r14
	call	free@PLT
	movq	-144(%rbp), %rdi
	call	free@PLT
	addl	$1, -176(%rbp)
	movl	-176(%rbp), %eax
	cmpl	%eax, -164(%rbp)
	jne	.L104
.L99:
	lock addq	$1, 112+__gcov0.create_decision_variables(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L118
	movl	-200(%rbp), %eax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L116:
	.cfi_restore_state
	lock addq	$1, 56+__gcov0.create_decision_variables(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%rbx, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 64+__gcov0.create_decision_variables(%rip)
	movl	$1, %edi
	call	exit@PLT
.L115:
	lock addq	$1, 8+__gcov0.create_decision_variables(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC12(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movl	%r13d, %r8d
	movl	%r15d, %ecx
	call	__fprintf_chk@PLT
	lock addq	$1, 16+__gcov0.create_decision_variables(%rip)
	movl	$1, %edi
	call	exit@PLT
.L117:
	lock addq	$1, 96+__gcov0.create_decision_variables(%rip)
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	leaq	.LC14(%rip), %rdx
	movslq	-176(%rbp), %rax
	movq	-208(%rbp), %rbx
	movq	(%rbx,%rax,8), %rax
	movl	44(%rax), %ecx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	lock addq	$1, 104+__gcov0.create_decision_variables(%rip)
	movl	$1, %edi
	call	exit@PLT
.L118:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE49:
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
.LFB50:
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
	subq	$168, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movl	%esi, -204(%rbp)
	movl	%edx, -168(%rbp)
	movq	%rcx, -192(%rbp)
	movq	%r8, -200(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	lock addq	$1, __gcov0.create_b_vars(%rip)
	xorl	%ebx, %ebx
	testl	%esi, %esi
	jle	.L121
.L120:
	movl	-168(%rbp), %eax
	testl	%eax, %eax
	jle	.L124
	leaq	-144(%rbp), %rax
	leaq	-128(%rbp), %r12
	movl	$0, -164(%rbp)
	movq	%rax, -176(%rbp)
	leaq	-136(%rbp), %rax
	leaq	-152(%rbp), %r15
	movq	%rax, -184(%rbp)
	leaq	-160(%rbp), %r14
	.p2align 4,,10
	.p2align 3
.L125:
	xorl	%r13d, %r13d
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L128:
	movl	%eax, %r13d
.L123:
	movl	-164(%rbp), %eax
	pushq	%r13
	movl	%ebx, %r9d
	movl	$64, %ecx
	leaq	.LC0(%rip), %r8
	movl	$1, %edx
	movl	$64, %esi
	movq	%r12, %rdi
	pushq	%rax
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	leaq	.LC11(%rip), %rax
	movq	%r15, %r9
	pushq	-184(%rbp)
	movq	-176(%rbp), %rcx
	pushq	%rax
	movq	%r14, %r8
	movl	$1, %edx
	movsd	.LC10(%rip), %xmm0
	movq	-200(%rbp), %rsi
	movq	$0x000000000, -160(%rbp)
	movq	-192(%rbp), %rdi
	movq	%r12, -136(%rbp)
	movq	$0x000000000, -144(%rbp)
	movsd	%xmm0, -152(%rbp)
	call	CPXnewcols@PLT
	addq	$32, %rsp
	testl	%eax, %eax
	jne	.L133
	leal	1(%r13), %eax
	lock addq	$1, 24+__gcov0.create_b_vars(%rip)
	cmpl	%eax, -168(%rbp)
	jne	.L128
	lock addq	$1, 32+__gcov0.create_b_vars(%rip)
	movl	-164(%rbp), %edx
	leal	1(%rdx), %eax
	cmpl	%r13d, %edx
	je	.L124
	movl	%eax, -164(%rbp)
	jmp	.L125
.L124:
	lock addq	$1, 40+__gcov0.create_b_vars(%rip)
	addl	$1, %ebx
	cmpl	%ebx, -204(%rbp)
	jne	.L120
.L121:
	lock addq	$1, 48+__gcov0.create_b_vars(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L134
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L133:
	.cfi_restore_state
	lock addq	$1, 8+__gcov0.create_b_vars(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC15(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r12, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 16+__gcov0.create_b_vars(%rip)
	movl	$1, %edi
	call	exit@PLT
.L134:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE50:
	.size	create_b_vars, .-create_b_vars
	.section	.rodata.str1.1
.LC16:
	.string	"c_%d_%d_%d"
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Failed to create variable %s.\n"
	.text
	.p2align 4
	.globl	create_c_variables
	.type	create_c_variables, @function
create_c_variables:
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
	subq	$216, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, -240(%rbp)
	movl	%esi, -184(%rbp)
	movl	%edx, -244(%rbp)
	movq	%rcx, -224(%rbp)
	movq	%r8, -232(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	lock addq	$1, __gcov0.create_c_variables(%rip)
	xorl	%r12d, %r12d
	leaq	-128(%rbp), %rbx
	testl	%edx, %edx
	jle	.L137
.L136:
	movl	-184(%rbp), %eax
	testl	%eax, %eax
	jle	.L140
	movq	-240(%rbp), %rax
	movl	$0, -180(%rbp)
	movq	%rax, -192(%rbp)
	leaq	-152(%rbp), %rax
	movq	%rax, -216(%rbp)
	.p2align 4,,10
	.p2align 3
.L142:
	movq	-192(%rbp), %rax
	movq	(%rax), %rax
	movl	12(%rax), %edx
	testl	%edx, %edx
	jle	.L141
	leaq	-136(%rbp), %rsi
	leaq	-161(%rbp), %rdi
	xorl	%r15d, %r15d
	movq	%rsi, -208(%rbp)
	leaq	-160(%rbp), %r14
	leaq	-144(%rbp), %r13
	movq	%rdi, -200(%rbp)
	.p2align 4,,10
	.p2align 3
.L139:
	movq	48(%rax), %rax
	movl	%r12d, %r9d
	movl	$64, %ecx
	movq	%rbx, %rdi
	leaq	.LC16(%rip), %r8
	movl	$1, %edx
	movl	$64, %esi
	movl	(%rax,%r15,4), %eax
	pushq	%rax
	movl	-180(%rbp), %eax
	pushq	%rax
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	pushq	-208(%rbp)
	movq	%r14, %r8
	movsd	.LC10(%rip), %xmm0
	pushq	-200(%rbp)
	movq	%r13, %rcx
	movl	$1, %edx
	movq	-216(%rbp), %r9
	movq	$0x000000000, -160(%rbp)
	movq	-232(%rbp), %rsi
	movq	-224(%rbp), %rdi
	movq	$0x000000000, -144(%rbp)
	movb	$66, -161(%rbp)
	movq	%rbx, -136(%rbp)
	movsd	%xmm0, -152(%rbp)
	call	CPXnewcols@PLT
	addq	$32, %rsp
	testl	%eax, %eax
	jne	.L150
	lock addq	$1, 24+__gcov0.create_c_variables(%rip)
	movq	-192(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %r15
	cmpl	%r15d, 12(%rax)
	jg	.L139
.L141:
	lock addq	$1, 32+__gcov0.create_c_variables(%rip)
	addl	$1, -180(%rbp)
	movl	-180(%rbp), %eax
	addq	$8, -192(%rbp)
	cmpl	%eax, -184(%rbp)
	jne	.L142
.L140:
	lock addq	$1, 40+__gcov0.create_c_variables(%rip)
	addl	$1, %r12d
	cmpl	%r12d, -244(%rbp)
	jne	.L136
.L137:
	lock addq	$1, 48+__gcov0.create_c_variables(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L151
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L150:
	.cfi_restore_state
	lock addq	$1, 8+__gcov0.create_c_variables(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC17(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%rbx, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 16+__gcov0.create_c_variables(%rip)
	movl	$1, %edi
	call	exit@PLT
.L151:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	create_c_variables, .-create_c_variables
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"Failed to get variable index.\n"
	.section	.rodata.str1.1
.LC20:
	.string	"Failed to add constraint.\n"
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"Failed to add constraint for units %d and %d.\n"
	.text
	.p2align 4
	.globl	add_c_constraints
	.type	add_c_constraints, @function
add_c_constraints:
.LFB52:
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
	subq	$392, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, -432(%rbp)
	movq	%rcx, %r15
	movl	%esi, -420(%rbp)
	movl	%edx, -380(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	lock addq	$1, __gcov0.add_c_constraints(%rip)
	movl	$0, -316(%rbp)
	testl	%edx, %edx
	jle	.L153
	movl	$0, -384(%rbp)
	movslq	%edx, %rax
	leaq	0(,%rax,4), %rbx
	salq	$3, %rax
	movq	%rax, -416(%rbp)
	movq	%rbx, -408(%rbp)
	movq	%r8, %rbx
.L154:
	movl	-420(%rbp), %eax
	testl	%eax, %eax
	jle	.L167
	movq	-432(%rbp), %rax
	movq	%r15, %r13
	movl	$0, -356(%rbp)
	movq	%rax, -400(%rbp)
.L169:
	movq	-400(%rbp), %rax
	movq	(%rax), %rax
	movl	12(%rax), %edx
	testl	%edx, %edx
	jle	.L168
	movq	$0, -392(%rbp)
	jmp	.L166
	.p2align 4,,10
	.p2align 3
.L155:
	lock addq	$1, 192+__gcov0.add_c_constraints(%rip)
	movq	-400(%rbp), %rax
	addq	$1, -392(%rbp)
	movq	-392(%rbp), %rdi
	movq	(%rax), %rax
	cmpl	%edi, 12(%rax)
	jle	.L168
.L166:
	movq	48(%rax), %rax
	movq	-392(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -360(%rbp)
	cmpl	-356(%rbp), %eax
	je	.L155
	movl	-356(%rbp), %eax
	subq	$8, %rsp
	movl	-384(%rbp), %r12d
	leaq	-256(%rbp), %r14
	movq	%r14, %rdi
	movl	$32, %ecx
	movl	$1, %edx
	movl	$32, %esi
	pushq	%rax
	movl	%r12d, %r9d
	xorl	%eax, %eax
	leaq	.LC2(%rip), %r8
	leaq	-224(%rbp), %r15
	call	__snprintf_chk@PLT
	movl	-360(%rbp), %edi
	movl	%r12d, %r9d
	xorl	%eax, %eax
	movl	$32, %ecx
	movl	$1, %edx
	leaq	.LC2(%rip), %r8
	movl	$32, %esi
	movl	%edi, (%rsp)
	movq	%r15, %rdi
	movl	%r12d, -384(%rbp)
	leaq	-192(%rbp), %r12
	call	__snprintf_chk@PLT
	movl	-360(%rbp), %edi
	movl	-356(%rbp), %eax
	leaq	.LC16(%rip), %r8
	movl	$64, %ecx
	movl	$1, %edx
	movl	$64, %esi
	movl	-384(%rbp), %r9d
	pushq	%rdi
	movq	%r12, %rdi
	pushq	%rax
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	addq	$32, %rsp
	movq	%r14, %rdx
	movq	%rbx, %rsi
	leaq	-344(%rbp), %rcx
	movq	%r13, %rdi
	call	CPXgetcolindex@PLT
	lock addq	$1, 8+__gcov0.add_c_constraints(%rip)
	testl	%eax, %eax
	jne	.L178
	leaq	-340(%rbp), %rcx
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	CPXgetcolindex@PLT
	lock addq	$1, 24+__gcov0.add_c_constraints(%rip)
	testl	%eax, %eax
	jne	.L179
	leaq	-336(%rbp), %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	CPXgetcolindex@PLT
	testl	%eax, %eax
	jne	.L180
	lock addq	$1, 48+__gcov0.add_c_constraints(%rip)
	movapd	.LC19(%rip), %xmm0
	movl	$2, %r8d
	xorl	%edx, %edx
	movl	$1, %ecx
	movl	-336(%rbp), %eax
	leaq	-288(%rbp), %r10
	leaq	-300(%rbp), %r14
	pushq	$0
	movq	%rbx, %rsi
	leaq	-316(%rbp), %r15
	leaq	-257(%rbp), %r12
	pushq	$0
	movq	%r13, %rdi
	pushq	%r10
	leaq	-312(%rbp), %r9
	pushq	%r14
	pushq	%r15
	pushq	%r12
	movl	%eax, -300(%rbp)
	movl	-344(%rbp), %eax
	movq	$0x000000000, -312(%rbp)
	movb	$76, -257(%rbp)
	movl	%eax, -296(%rbp)
	movq	%r10, -376(%rbp)
	movq	%r9, -368(%rbp)
	movaps	%xmm0, -288(%rbp)
	call	CPXaddrows@PLT
	lock addq	$1, 64+__gcov0.add_c_constraints(%rip)
	movq	-368(%rbp), %r9
	movq	-376(%rbp), %r10
	addq	$48, %rsp
	testl	%eax, %eax
	jne	.L181
	pushq	$0
	movl	-340(%rbp), %eax
	movl	$2, %r8d
	xorl	%edx, %edx
	pushq	$0
	movl	$1, %ecx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	pushq	%r10
	pushq	%r14
	pushq	%r15
	pushq	%r12
	movl	%eax, -296(%rbp)
	movq	%r10, -376(%rbp)
	movq	%r9, -368(%rbp)
	call	CPXaddrows@PLT
	lock addq	$1, 88+__gcov0.add_c_constraints(%rip)
	movq	-368(%rbp), %r9
	movq	-376(%rbp), %r10
	addq	$48, %rsp
	testl	%eax, %eax
	jne	.L182
	movq	.LC21(%rip), %rax
	pushq	$0
	movl	$1, %ecx
	xorl	%edx, %edx
	pushq	$0
	movapd	.LC22(%rip), %xmm1
	movq	%rbx, %rsi
	movq	%r13, %rdi
	movq	%rax, -312(%rbp)
	movl	-344(%rbp), %eax
	movl	$3, %r8d
	pushq	%r10
	movl	%eax, -300(%rbp)
	movl	-340(%rbp), %eax
	pushq	%r14
	movl	%eax, -296(%rbp)
	movl	-336(%rbp), %eax
	pushq	%r15
	pushq	%r12
	movl	%eax, -292(%rbp)
	movq	.LC10(%rip), %rax
	movb	$71, -257(%rbp)
	movq	%rax, -272(%rbp)
	movaps	%xmm1, -288(%rbp)
	call	CPXaddrows@PLT
	lock addq	$1, 112+__gcov0.add_c_constraints(%rip)
	addq	$48, %rsp
	testl	%eax, %eax
	jne	.L183
	movq	-408(%rbp), %rdi
	xorl	%r14d, %r14d
	leaq	-128(%rbp), %r12
	leaq	-328(%rbp), %r15
	call	malloc@PLT
	movq	-416(%rbp), %rdi
	movq	%rax, -368(%rbp)
	call	malloc@PLT
	leaq	.LC16(%rip), %r8
	movq	%rax, -376(%rbp)
	.p2align 4,,10
	.p2align 3
.L164:
	movl	%r14d, %r9d
	movl	$64, %ecx
	movl	$1, %edx
	movq	%r12, %rdi
	movl	-360(%rbp), %eax
	movl	$64, %esi
	pushq	%rax
	movl	-356(%rbp), %eax
	pushq	%rax
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movq	%r15, %rcx
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movq	%r13, %rdi
	call	CPXgetcolindex@PLT
	popq	%rcx
	leaq	.LC16(%rip), %r8
	popq	%rsi
	testl	%eax, %eax
	jne	.L184
	movl	-328(%rbp), %eax
	movq	-368(%rbp), %rdx
	movq	.LC10(%rip), %rsi
	movl	%eax, (%rdx,%r14,4)
	movq	-376(%rbp), %rax
	movq	%rsi, (%rax,%r14,8)
	lock addq	$1, 152+__gcov0.add_c_constraints(%rip)
	addq	$1, %r14
	cmpl	%r14d, -380(%rbp)
	jg	.L164
	lock addq	$1, 160+__gcov0.add_c_constraints(%rip)
	movq	.LC10(%rip), %rax
	movl	$1, %ecx
	xorl	%edx, %edx
	movl	-380(%rbp), %r8d
	movq	%rax, -328(%rbp)
	movq	%r15, %r9
	movq	%rbx, %rsi
	movq	%r13, %rdi
	leaq	-332(%rbp), %rax
	pushq	$0
	pushq	$0
	pushq	-376(%rbp)
	pushq	-368(%rbp)
	pushq	%rax
	leaq	-345(%rbp), %rax
	pushq	%rax
	movl	$0, -332(%rbp)
	movb	$76, -345(%rbp)
	call	CPXaddrows@PLT
	lock addq	$1, 168+__gcov0.add_c_constraints(%rip)
	addq	$48, %rsp
	testl	%eax, %eax
	je	.L155
	lock addq	$1, 176+__gcov0.add_c_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC23(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movl	-360(%rbp), %r8d
	movl	-356(%rbp), %ecx
	call	__fprintf_chk@PLT
	lock addq	$1, 184+__gcov0.add_c_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
	.p2align 4,,10
	.p2align 3
.L168:
	lock addq	$1, 200+__gcov0.add_c_constraints(%rip)
	addl	$1, -356(%rbp)
	movl	-356(%rbp), %eax
	addq	$8, -400(%rbp)
	cmpl	%eax, -420(%rbp)
	jne	.L169
	movq	%r13, %r15
.L167:
	lock addq	$1, 208+__gcov0.add_c_constraints(%rip)
	addl	$1, -384(%rbp)
	movl	-384(%rbp), %eax
	cmpl	%eax, -380(%rbp)
	jne	.L154
.L153:
	lock addq	$1, 216+__gcov0.add_c_constraints(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L185
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L184:
	.cfi_restore_state
	lock addq	$1, 136+__gcov0.add_c_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r12, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 144+__gcov0.add_c_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L180:
	lock addq	$1, 40+__gcov0.add_c_constraints(%rip)
.L157:
	movq	stderr(%rip), %rdi
	leaq	.LC18(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	lock addq	$1, 56+__gcov0.add_c_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L178:
	lock addq	$1, 16+__gcov0.add_c_constraints(%rip)
	jmp	.L157
.L183:
	lock addq	$1, 120+__gcov0.add_c_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC20(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 128+__gcov0.add_c_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L182:
	lock addq	$1, 96+__gcov0.add_c_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC20(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 104+__gcov0.add_c_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L181:
	lock addq	$1, 72+__gcov0.add_c_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC20(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 80+__gcov0.add_c_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L179:
	lock addq	$1, 32+__gcov0.add_c_constraints(%rip)
	jmp	.L157
.L185:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE52:
	.size	add_c_constraints, .-add_c_constraints
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"Failed to change objective function.\n"
	.text
	.p2align 4
	.globl	add_objective_function
	.type	add_objective_function, @function
add_objective_function:
.LFB53:
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
	subq	$152, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, -184(%rbp)
	movq	%rcx, %r13
	movq	%r8, %r14
	movl	%esi, -172(%rbp)
	movl	%edx, -176(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	lock addq	$1, __gcov0.add_objective_function(%rip)
	movl	$0, -168(%rbp)
	leaq	-128(%rbp), %r15
	testl	%edx, %edx
	jle	.L188
	movq	%rcx, -152(%rbp)
.L187:
	movl	-172(%rbp), %eax
	testl	%eax, %eax
	jle	.L193
	movq	-184(%rbp), %r12
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L195:
	movq	(%r12), %rax
	xorl	%r13d, %r13d
	movl	12(%rax), %edx
	testl	%edx, %edx
	jg	.L192
	jmp	.L194
	.p2align 4,,10
	.p2align 3
.L189:
	lock addq	$1, 56+__gcov0.add_objective_function(%rip)
	movq	(%r12), %rax
	addq	$1, %r13
	cmpl	%r13d, 12(%rax)
	jle	.L194
.L192:
	movq	48(%rax), %rdx
	movl	(%rdx,%r13,4), %edx
	cmpl	%ebx, %edx
	jle	.L189
	movq	24(%rax), %rax
	movl	-168(%rbp), %r9d
	movl	$64, %ecx
	movq	%r15, %rdi
	leaq	.LC16(%rip), %r8
	movl	$64, %esi
	movl	(%rax,%r13,4), %r11d
	pushq	%rdx
	xorl	%eax, %eax
	movl	$1, %edx
	pushq	%rbx
	movl	%r11d, -164(%rbp)
	call	__snprintf_chk@PLT
	movq	-152(%rbp), %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	leaq	-140(%rbp), %rcx
	movq	%rcx, -160(%rbp)
	call	CPXgetcolindex@PLT
	popq	%rcx
	movl	-164(%rbp), %r11d
	testl	%eax, %eax
	movq	-160(%rbp), %rcx
	popq	%rsi
	jne	.L206
	lock addq	$1, 16+__gcov0.add_objective_function(%rip)
	pxor	%xmm0, %xmm0
	movl	$1, %edx
	movq	-152(%rbp), %rdi
	cvtsi2sdl	%r11d, %xmm0
	leaq	-136(%rbp), %r8
	movq	%r14, %rsi
	movsd	%xmm0, -136(%rbp)
	call	CPXchgobj@PLT
	testl	%eax, %eax
	jne	.L207
	lock addq	$1, 48+__gcov0.add_objective_function(%rip)
	jmp	.L189
	.p2align 4,,10
	.p2align 3
.L194:
	lock addq	$1, 64+__gcov0.add_objective_function(%rip)
	addl	$1, %ebx
	addq	$8, %r12
	cmpl	%ebx, -172(%rbp)
	jne	.L195
.L193:
	lock addq	$1, 72+__gcov0.add_objective_function(%rip)
	addl	$1, -168(%rbp)
	movl	-168(%rbp), %eax
	cmpl	%eax, -176(%rbp)
	jne	.L187
	movq	-152(%rbp), %r13
.L188:
	lock addq	$1, 80+__gcov0.add_objective_function(%rip)
	movl	$-1, %edx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	CPXchgobjsen@PLT
	lock addq	$1, 88+__gcov0.add_objective_function(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L208
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L207:
	.cfi_restore_state
	lock addq	$1, 32+__gcov0.add_objective_function(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC24(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 40+__gcov0.add_objective_function(%rip)
	movl	$1, %edi
	call	exit@PLT
.L206:
	lock addq	$1, 8+__gcov0.add_objective_function(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r15, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 24+__gcov0.add_objective_function(%rip)
	movl	$1, %edi
	call	exit@PLT
.L208:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE53:
	.size	add_objective_function, .-add_objective_function
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"Failed to add force assignment constraint for node %d.\n"
	.text
	.p2align 4
	.globl	add_force_assignment_constraint
	.type	add_force_assignment_constraint, @function
add_force_assignment_constraint:
.LFB54:
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
	subq	$136, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movslq	%ecx, %rax
	movq	%rdi, -136(%rbp)
	movq	%rsi, %r13
	movl	%edx, -152(%rbp)
	movl	%eax, -148(%rbp)
	movq	%fs:40, %rbx
	movq	%rbx, -56(%rbp)
	xorl	%ebx, %ebx
	lock addq	$1, __gcov0.add_force_assignment_constraint(%rip)
	testl	%eax, %eax
	jle	.L210
	leaq	0(,%rax,4), %rbx
	salq	$3, %rax
	xorl	%r14d, %r14d
	movq	%rax, -168(%rbp)
	leal	-1(%rdx), %eax
	movl	%eax, -172(%rbp)
	movq	%rbx, -160(%rbp)
	leaq	-104(%rbp), %rbx
	.p2align 4,,10
	.p2align 3
.L215:
	movq	-160(%rbp), %rdi
	call	malloc@PLT
	movq	-168(%rbp), %rdi
	movq	%rax, -120(%rbp)
	call	malloc@PLT
	movl	-152(%rbp), %esi
	movq	%rax, -128(%rbp)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	testl	%esi, %esi
	jle	.L211
	movl	-172(%rbp), %eax
	xorl	%r12d, %r12d
	leaq	-96(%rbp), %r15
	movq	%rax, -144(%rbp)
	jmp	.L213
	.p2align 4,,10
	.p2align 3
.L217:
	movq	%rax, %r12
.L213:
	subq	$8, %rsp
	movl	%r14d, %r9d
	leaq	.LC2(%rip), %r8
	xorl	%eax, %eax
	pushq	%r12
	movl	$32, %ecx
	movl	$1, %edx
	movq	%r15, %rdi
	movl	$32, %esi
	call	__snprintf_chk@PLT
	movq	%rbx, %rcx
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	-136(%rbp), %rdi
	call	CPXgetcolindex@PLT
	popq	%rdx
	popq	%rcx
	testl	%eax, %eax
	jne	.L221
	movl	-104(%rbp), %eax
	movq	-120(%rbp), %rdx
	movl	%eax, (%rdx,%r12,4)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	movq	-128(%rbp), %rax
	movsd	%xmm0, (%rax,%r12,8)
	lock addq	$1, 24+__gcov0.add_force_assignment_constraint(%rip)
	leaq	1(%r12), %rax
	cmpq	%r12, -144(%rbp)
	jne	.L217
.L211:
	lock addq	$1, 32+__gcov0.add_force_assignment_constraint(%rip)
	movl	$1, %ecx
	xorl	%edx, %edx
	movl	-148(%rbp), %r8d
	movq	-136(%rbp), %rdi
	leaq	-108(%rbp), %rax
	pushq	$0
	movq	%rbx, %r9
	movq	%r13, %rsi
	pushq	$0
	pushq	-128(%rbp)
	pushq	-120(%rbp)
	pushq	%rax
	leaq	-109(%rbp), %rax
	pushq	%rax
	movb	$69, -109(%rbp)
	movl	$0, -108(%rbp)
	movsd	%xmm0, -104(%rbp)
	call	CPXaddrows@PLT
	lock addq	$1, 40+__gcov0.add_force_assignment_constraint(%rip)
	addq	$48, %rsp
	testl	%eax, %eax
	jne	.L222
	movq	-120(%rbp), %rdi
	addl	$1, %r14d
	call	free@PLT
	movq	-128(%rbp), %rdi
	call	free@PLT
	cmpl	%r14d, -148(%rbp)
	jne	.L215
.L210:
	lock addq	$1, 64+__gcov0.add_force_assignment_constraint(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L223
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L221:
	.cfi_restore_state
	lock addq	$1, 8+__gcov0.add_force_assignment_constraint(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r15, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 16+__gcov0.add_force_assignment_constraint(%rip)
	movl	$1, %edi
	call	exit@PLT
.L222:
	lock addq	$1, 48+__gcov0.add_force_assignment_constraint(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC25(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movl	%r14d, %ecx
	call	__fprintf_chk@PLT
	lock addq	$1, 56+__gcov0.add_force_assignment_constraint(%rip)
	movl	$1, %edi
	call	exit@PLT
.L223:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE54:
	.size	add_force_assignment_constraint, .-add_force_assignment_constraint
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"Failed to add basic constraint for unit %d.\n"
	.text
	.p2align 4
	.globl	add_basic_constraints
	.type	add_basic_constraints, @function
add_basic_constraints:
.LFB55:
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
	subq	$136, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movl	%edx, -164(%rbp)
	movq	%rdi, %r12
	movq	%rsi, %rbx
	movl	%ecx, %edi
	movl	%ecx, -120(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	lock addq	$1, __gcov0.add_basic_constraints(%rip)
	testl	%edx, %edx
	jle	.L225
	movslq	%ecx, %rax
	movl	$0, -116(%rbp)
	leaq	-104(%rbp), %r14
	leaq	0(,%rax,4), %rcx
	salq	$3, %rax
	movq	%rax, -160(%rbp)
	leal	-1(%rdi), %eax
	movq	%rcx, -152(%rbp)
	movl	%eax, -168(%rbp)
	.p2align 4,,10
	.p2align 3
.L230:
	movq	-152(%rbp), %rdi
	call	malloc@PLT
	movq	-160(%rbp), %rdi
	movq	%rax, -128(%rbp)
	call	malloc@PLT
	movl	-120(%rbp), %esi
	movq	%rax, -136(%rbp)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	testl	%esi, %esi
	jle	.L226
	movl	-168(%rbp), %eax
	xorl	%r13d, %r13d
	leaq	-96(%rbp), %r15
	movq	%rax, -144(%rbp)
	jmp	.L228
	.p2align 4,,10
	.p2align 3
.L232:
	movq	%rax, %r13
.L228:
	movl	-116(%rbp), %eax
	subq	$8, %rsp
	movl	%r13d, %r9d
	movl	$32, %ecx
	leaq	.LC2(%rip), %r8
	movl	$1, %edx
	movl	$32, %esi
	movq	%r15, %rdi
	pushq	%rax
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movq	%r14, %rcx
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	CPXgetcolindex@PLT
	popq	%rdx
	popq	%rcx
	testl	%eax, %eax
	jne	.L236
	movl	-104(%rbp), %eax
	movq	-128(%rbp), %rdx
	movl	%eax, (%rdx,%r13,4)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	movq	-136(%rbp), %rax
	movsd	%xmm0, (%rax,%r13,8)
	lock addq	$1, 24+__gcov0.add_basic_constraints(%rip)
	leaq	1(%r13), %rax
	cmpq	%r13, -144(%rbp)
	jne	.L232
.L226:
	lock addq	$1, 32+__gcov0.add_basic_constraints(%rip)
	movl	$1, %ecx
	xorl	%edx, %edx
	movl	-120(%rbp), %r8d
	leaq	-108(%rbp), %rax
	pushq	$0
	movq	%r14, %r9
	movq	%rbx, %rsi
	pushq	$0
	movq	%r12, %rdi
	pushq	-136(%rbp)
	pushq	-128(%rbp)
	pushq	%rax
	leaq	-109(%rbp), %rax
	pushq	%rax
	movb	$71, -109(%rbp)
	movl	$0, -108(%rbp)
	movsd	%xmm0, -104(%rbp)
	call	CPXaddrows@PLT
	lock addq	$1, 40+__gcov0.add_basic_constraints(%rip)
	addq	$48, %rsp
	testl	%eax, %eax
	jne	.L237
	movq	-128(%rbp), %rdi
	call	free@PLT
	movq	-136(%rbp), %rdi
	call	free@PLT
	addl	$1, -116(%rbp)
	movl	-116(%rbp), %eax
	cmpl	%eax, -164(%rbp)
	jne	.L230
.L225:
	lock addq	$1, 64+__gcov0.add_basic_constraints(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L238
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L236:
	.cfi_restore_state
	lock addq	$1, 8+__gcov0.add_basic_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r15, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 16+__gcov0.add_basic_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L237:
	lock addq	$1, 48+__gcov0.add_basic_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC26(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movl	-116(%rbp), %ecx
	call	__fprintf_chk@PLT
	lock addq	$1, 56+__gcov0.add_basic_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L238:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE55:
	.size	add_basic_constraints, .-add_basic_constraints
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"Failed to add cluster constraint for cluster %d.\n"
	.text
	.p2align 4
	.globl	add_at_least_one_unit_per_cluster_constraints
	.type	add_at_least_one_unit_per_cluster_constraints, @function
add_at_least_one_unit_per_cluster_constraints:
.LFB56:
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
	subq	$136, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, -136(%rbp)
	movq	%rsi, %r13
	movl	%edx, -148(%rbp)
	movl	%ecx, -152(%rbp)
	movq	%fs:40, %rbx
	movq	%rbx, -56(%rbp)
	xorl	%ebx, %ebx
	lock addq	$1, __gcov0.add_at_least_one_unit_per_cluster_constraints(%rip)
	testl	%ecx, %ecx
	jle	.L240
	movslq	%edx, %rax
	xorl	%r14d, %r14d
	leaq	0(,%rax,4), %rbx
	salq	$3, %rax
	movq	%rax, -168(%rbp)
	leal	-1(%rdx), %eax
	movl	%eax, -172(%rbp)
	movq	%rbx, -160(%rbp)
	leaq	-104(%rbp), %rbx
	.p2align 4,,10
	.p2align 3
.L245:
	movq	-160(%rbp), %rdi
	call	malloc@PLT
	movq	-168(%rbp), %rdi
	movq	%rax, -120(%rbp)
	call	malloc@PLT
	movl	-148(%rbp), %esi
	movq	%rax, -128(%rbp)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	testl	%esi, %esi
	jle	.L241
	movl	-172(%rbp), %eax
	xorl	%r12d, %r12d
	leaq	-96(%rbp), %r15
	movq	%rax, -144(%rbp)
	jmp	.L243
	.p2align 4,,10
	.p2align 3
.L247:
	movq	%rax, %r12
.L243:
	subq	$8, %rsp
	movl	%r14d, %r9d
	leaq	.LC2(%rip), %r8
	xorl	%eax, %eax
	pushq	%r12
	movl	$32, %ecx
	movl	$1, %edx
	movq	%r15, %rdi
	movl	$32, %esi
	call	__snprintf_chk@PLT
	movq	%rbx, %rcx
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	-136(%rbp), %rdi
	call	CPXgetcolindex@PLT
	popq	%rdx
	popq	%rcx
	testl	%eax, %eax
	jne	.L251
	movl	-104(%rbp), %eax
	movq	-120(%rbp), %rdx
	movl	%eax, (%rdx,%r12,4)
	movq	.LC10(%rip), %rax
	movq	%rax, %xmm0
	movq	-128(%rbp), %rax
	movsd	%xmm0, (%rax,%r12,8)
	lock addq	$1, 24+__gcov0.add_at_least_one_unit_per_cluster_constraints(%rip)
	leaq	1(%r12), %rax
	cmpq	%r12, -144(%rbp)
	jne	.L247
.L241:
	lock addq	$1, 32+__gcov0.add_at_least_one_unit_per_cluster_constraints(%rip)
	movl	$1, %ecx
	xorl	%edx, %edx
	movl	-148(%rbp), %r8d
	movq	-136(%rbp), %rdi
	leaq	-108(%rbp), %rax
	pushq	$0
	movq	%rbx, %r9
	movq	%r13, %rsi
	pushq	$0
	pushq	-128(%rbp)
	pushq	-120(%rbp)
	pushq	%rax
	leaq	-109(%rbp), %rax
	pushq	%rax
	movb	$71, -109(%rbp)
	movl	$0, -108(%rbp)
	movsd	%xmm0, -104(%rbp)
	call	CPXaddrows@PLT
	lock addq	$1, 40+__gcov0.add_at_least_one_unit_per_cluster_constraints(%rip)
	addq	$48, %rsp
	testl	%eax, %eax
	jne	.L252
	movq	-120(%rbp), %rdi
	addl	$1, %r14d
	call	free@PLT
	movq	-128(%rbp), %rdi
	call	free@PLT
	cmpl	%r14d, -152(%rbp)
	jne	.L245
.L240:
	lock addq	$1, 64+__gcov0.add_at_least_one_unit_per_cluster_constraints(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L253
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L251:
	.cfi_restore_state
	lock addq	$1, 8+__gcov0.add_at_least_one_unit_per_cluster_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r15, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 16+__gcov0.add_at_least_one_unit_per_cluster_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L252:
	lock addq	$1, 48+__gcov0.add_at_least_one_unit_per_cluster_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC27(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movl	%r14d, %ecx
	call	__fprintf_chk@PLT
	lock addq	$1, 56+__gcov0.add_at_least_one_unit_per_cluster_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L253:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE56:
	.size	add_at_least_one_unit_per_cluster_constraints, .-add_at_least_one_unit_per_cluster_constraints
	.p2align 4
	.globl	create_contiguity_constraints
	.type	create_contiguity_constraints, @function
create_contiguity_constraints:
.LFB57:
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
	subq	$280, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movl	%esi, -312(%rbp)
	movq	%rcx, %r15
	movq	%r8, %rbx
	movl	%edx, -308(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	lock addq	$1, __gcov0.create_contiguity_constraints(%rip)
	movl	$0, -252(%rbp)
	testl	%esi, %esi
	jle	.L256
	movl	$0, -280(%rbp)
.L255:
	movl	-308(%rbp), %eax
	testl	%eax, %eax
	jle	.L267
	movl	$0, -276(%rbp)
	.p2align 4,,10
	.p2align 3
.L268:
	xorl	%r12d, %r12d
	jmp	.L266
	.p2align 4,,10
	.p2align 3
.L257:
	movl	-276(%rbp), %eax
	subq	$8, %rsp
	movl	-280(%rbp), %r14d
	leaq	-192(%rbp), %r13
	leaq	.LC2(%rip), %r8
	movl	$32, %ecx
	movl	$1, %edx
	movq	%r13, %rdi
	pushq	%rax
	movl	%r14d, %r9d
	movl	$32, %esi
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movl	%r14d, %r9d
	movl	$32, %ecx
	xorl	%eax, %eax
	leaq	-160(%rbp), %r10
	leaq	.LC2(%rip), %r8
	movl	$1, %edx
	movl	$32, %esi
	movq	%r10, %rdi
	movl	%r12d, (%rsp)
	movq	%r10, -288(%rbp)
	movl	%r14d, -280(%rbp)
	leaq	-128(%rbp), %r14
	call	__snprintf_chk@PLT
	movl	-276(%rbp), %eax
	pushq	%r12
	movq	%r14, %rdi
	movl	$64, %ecx
	movl	$1, %edx
	movl	$64, %esi
	movl	-280(%rbp), %r9d
	pushq	%rax
	leaq	.LC0(%rip), %r8
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	addq	$32, %rsp
	movq	%r13, %rdx
	movq	%rbx, %rsi
	leaq	-264(%rbp), %rcx
	movq	%r15, %rdi
	call	CPXgetcolindex@PLT
	movq	-288(%rbp), %r10
	testl	%eax, %eax
	jne	.L274
	lock addq	$1, 24+__gcov0.create_contiguity_constraints(%rip)
	leaq	-260(%rbp), %rcx
	movq	%r10, %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	CPXgetcolindex@PLT
	testl	%eax, %eax
	jne	.L275
	lock addq	$1, 40+__gcov0.create_contiguity_constraints(%rip)
	leaq	-256(%rbp), %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	CPXgetcolindex@PLT
	testl	%eax, %eax
	jne	.L276
	lock addq	$1, 56+__gcov0.create_contiguity_constraints(%rip)
	movapd	.LC19(%rip), %xmm0
	xorl	%edx, %edx
	movl	$2, %r8d
	movl	$1, %ecx
	movl	-256(%rbp), %eax
	leaq	-224(%rbp), %r14
	pushq	$0
	movq	%rbx, %rsi
	movq	%r15, %rdi
	leaq	-236(%rbp), %r13
	pushq	$0
	leaq	-248(%rbp), %r9
	movl	%eax, -236(%rbp)
	movl	-264(%rbp), %eax
	pushq	%r14
	movl	%eax, -232(%rbp)
	leaq	-252(%rbp), %rax
	pushq	%r13
	movq	%rax, -288(%rbp)
	pushq	%rax
	leaq	-193(%rbp), %rax
	pushq	%rax
	movq	%r9, -304(%rbp)
	movq	$0x000000000, -248(%rbp)
	movb	$76, -193(%rbp)
	movq	%rax, -296(%rbp)
	movaps	%xmm0, -224(%rbp)
	call	CPXaddrows@PLT
	addq	$48, %rsp
	movq	-304(%rbp), %r9
	testl	%eax, %eax
	jne	.L277
	lock addq	$1, 80+__gcov0.create_contiguity_constraints(%rip)
	xorl	%edx, %edx
	movl	$2, %r8d
	movl	$1, %ecx
	movl	-260(%rbp), %eax
	pushq	$0
	movq	%rbx, %rsi
	movq	%r15, %rdi
	pushq	$0
	pushq	%r14
	pushq	%r13
	pushq	-288(%rbp)
	pushq	-296(%rbp)
	movq	%r9, -304(%rbp)
	movl	%eax, -232(%rbp)
	call	CPXaddrows@PLT
	addq	$48, %rsp
	movq	-304(%rbp), %r9
	testl	%eax, %eax
	jne	.L278
	lock addq	$1, 104+__gcov0.create_contiguity_constraints(%rip)
	movq	.LC21(%rip), %rax
	movl	$3, %r8d
	xorl	%edx, %edx
	movapd	.LC22(%rip), %xmm1
	movl	$1, %ecx
	movq	%rax, -248(%rbp)
	movl	-264(%rbp), %eax
	movq	%rbx, %rsi
	movq	%r15, %rdi
	pushq	$0
	movl	%eax, -236(%rbp)
	movl	-260(%rbp), %eax
	pushq	$0
	movl	%eax, -232(%rbp)
	movl	-256(%rbp), %eax
	pushq	%r14
	pushq	%r13
	pushq	-288(%rbp)
	pushq	-296(%rbp)
	movl	%eax, -228(%rbp)
	movq	.LC10(%rip), %rax
	movb	$71, -193(%rbp)
	movaps	%xmm1, -224(%rbp)
	movq	%rax, -208(%rbp)
	call	CPXaddrows@PLT
	addq	$48, %rsp
	testl	%eax, %eax
	jne	.L279
	lock addq	$1, 136+__gcov0.create_contiguity_constraints(%rip)
	leal	1(%r12), %eax
	cmpl	%eax, -308(%rbp)
	je	.L280
.L271:
	movl	%eax, %r12d
.L266:
	cmpl	%r12d, -276(%rbp)
	jne	.L257
	lock addq	$1, 8+__gcov0.create_contiguity_constraints(%rip)
	leal	1(%r12), %eax
	cmpl	%eax, -308(%rbp)
	jne	.L271
.L280:
	lock addq	$1, 144+__gcov0.create_contiguity_constraints(%rip)
	movl	-276(%rbp), %esi
	leal	1(%rsi), %eax
	cmpl	%r12d, %esi
	je	.L267
	movl	%eax, -276(%rbp)
	jmp	.L268
.L267:
	lock addq	$1, 152+__gcov0.create_contiguity_constraints(%rip)
	addl	$1, -280(%rbp)
	movl	-280(%rbp), %eax
	cmpl	%eax, -312(%rbp)
	jne	.L255
.L256:
	lock addq	$1, 160+__gcov0.create_contiguity_constraints(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L281
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L279:
	.cfi_restore_state
	lock addq	$1, 120+__gcov0.create_contiguity_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC20(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 128+__gcov0.create_contiguity_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L274:
	lock addq	$1, 16+__gcov0.create_contiguity_constraints(%rip)
.L260:
	movq	stderr(%rip), %rdi
	leaq	.LC18(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	lock addq	$1, 64+__gcov0.create_contiguity_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L275:
	lock addq	$1, 32+__gcov0.create_contiguity_constraints(%rip)
	jmp	.L260
.L276:
	lock addq	$1, 48+__gcov0.create_contiguity_constraints(%rip)
	jmp	.L260
.L277:
	lock addq	$1, 72+__gcov0.create_contiguity_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC20(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 88+__gcov0.create_contiguity_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L278:
	lock addq	$1, 96+__gcov0.create_contiguity_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC20(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 112+__gcov0.create_contiguity_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L281:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE57:
	.size	create_contiguity_constraints, .-create_contiguity_constraints
	.section	.rodata.str1.1
.LC28:
	.string	"Adjacency Matrix:\n"
.LC29:
	.string	"%d "
.LC30:
	.string	"\n"
	.text
	.p2align 4
	.globl	print_adjMatrix
	.type	print_adjMatrix, @function
print_adjMatrix:
.LFB58:
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
	subq	$24, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movslq	%edi, %r12
	movq	%rsi, %rbx
	movq	%r12, %r14
	lock addq	$1, __gcov0.print_adjMatrix(%rip)
	leaq	.LC28(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 8+__gcov0.print_adjMatrix(%rip)
	testl	%r12d, %r12d
	jle	.L283
	leal	-1(%r12), %r15d
	leaq	0(,%r12,4), %rax
	xorl	%r13d, %r13d
	leaq	4(%rbx,%r15,4), %rbx
	notq	%r15
	movq	%rax, -56(%rbp)
	leaq	.LC29(%rip), %r12
	leaq	0(,%r15,4), %rax
	movq	%rax, -64(%rbp)
	.p2align 4,,10
	.p2align 3
.L284:
	movq	-64(%rbp), %rax
	leaq	(%rax,%rbx), %r15
	.p2align 4,,10
	.p2align 3
.L285:
	movl	(%r15), %edx
	movq	%r12, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 16+__gcov0.print_adjMatrix(%rip)
	addq	$4, %r15
	cmpq	%r15, %rbx
	jne	.L285
	lock addq	$1, 24+__gcov0.print_adjMatrix(%rip)
	leaq	.LC30(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 32+__gcov0.print_adjMatrix(%rip)
	addq	-56(%rbp), %rbx
	addl	$1, %r13d
	cmpl	%r13d, %r14d
	jne	.L284
.L283:
	lock addq	$1, 40+__gcov0.print_adjMatrix(%rip)
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE58:
	.size	print_adjMatrix, .-print_adjMatrix
	.section	.rodata.str1.1
.LC31:
	.string	"Distance Matrix:\n"
	.text
	.p2align 4
	.globl	print_distMatrix
	.type	print_distMatrix, @function
print_distMatrix:
.LFB59:
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
	subq	$24, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movslq	%edi, %r12
	movq	%rsi, %rbx
	movq	%r12, %r14
	lock addq	$1, __gcov0.print_distMatrix(%rip)
	leaq	.LC31(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 8+__gcov0.print_distMatrix(%rip)
	testl	%r12d, %r12d
	jle	.L288
	leal	-1(%r12), %r15d
	leaq	0(,%r12,4), %rax
	xorl	%r13d, %r13d
	leaq	4(%rbx,%r15,4), %rbx
	notq	%r15
	movq	%rax, -56(%rbp)
	leaq	.LC29(%rip), %r12
	leaq	0(,%r15,4), %rax
	movq	%rax, -64(%rbp)
	.p2align 4,,10
	.p2align 3
.L289:
	movq	-64(%rbp), %rax
	leaq	(%rax,%rbx), %r15
	.p2align 4,,10
	.p2align 3
.L290:
	movl	(%r15), %edx
	movq	%r12, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 16+__gcov0.print_distMatrix(%rip)
	addq	$4, %r15
	cmpq	%r15, %rbx
	jne	.L290
	lock addq	$1, 24+__gcov0.print_distMatrix(%rip)
	leaq	.LC30(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 32+__gcov0.print_distMatrix(%rip)
	addq	-56(%rbp), %rbx
	addl	$1, %r13d
	cmpl	%r13d, %r14d
	jne	.L289
.L288:
	lock addq	$1, 40+__gcov0.print_distMatrix(%rip)
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE59:
	.size	print_distMatrix, .-print_distMatrix
	.p2align 4
	.globl	add_contiguity_constraints2
	.type	add_contiguity_constraints2, @function
add_contiguity_constraints2:
.LFB60:
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
	subq	$280, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movl	%esi, -308(%rbp)
	movl	%edx, -292(%rbp)
	movq	%rcx, -320(%rbp)
	movq	%r8, -240(%rbp)
	movq	%r9, -248(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	lock addq	$1, __gcov0.add_contiguity_constraints2(%rip)
	movl	$0, -148(%rbp)
	movslq	%edx, %rax
	leaq	0(,%rax,4), %rbx
	movq	%rbx, -304(%rbp)
	testl	%esi, %esi
	jle	.L293
	leaq	15(%rbx), %rdx
	leaq	15(,%rax,8), %rax
	movq	%rdi, %r10
	movl	$0, -252(%rbp)
	movq	%rdx, %rsi
	shrq	$4, %rax
	andq	$-4096, %rdx
	andq	$-16, %rsi
	movq	%rdx, -192(%rbp)
	movq	%rsi, -272(%rbp)
	movq	%rax, -280(%rbp)
.L294:
	movl	-292(%rbp), %eax
	testl	%eax, %eax
	jle	.L327
	movq	-320(%rbp), %rax
	movq	%r10, -168(%rbp)
	xorl	%r11d, %r11d
	movq	%r10, %r15
	movl	%r11d, %r12d
	movq	%rax, -288(%rbp)
	movl	-292(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -296(%rbp)
.L325:
	xorl	%r14d, %r14d
	movq	%r15, %r10
	movl	-296(%rbp), %r13d
	movl	%r14d, %r11d
	movl	%r14d, %r15d
	cmpl	%r12d, %r14d
	je	.L359
	.p2align 4,,10
	.p2align 3
.L295:
	lock addq	$1, 8+__gcov0.add_contiguity_constraints2(%rip)
	movq	-168(%rbp), %rax
	movq	(%r10,%r14,8), %rsi
	movq	(%rax), %rdx
	xorl	%eax, %eax
	movl	12(%rdx), %ebx
	testl	%ebx, %ebx
	jg	.L297
	jmp	.L306
	.p2align 4,,10
	.p2align 3
.L305:
	lock addq	$1, 32+__gcov0.add_contiguity_constraints2(%rip)
	addq	$1, %rax
	cmpl	%eax, 12(%rdx)
	jle	.L306
.L297:
	movq	48(%rdx), %rcx
	movl	44(%rsi), %edi
	cmpl	%edi, (%rcx,%rax,4)
	jne	.L305
	lock addq	$1, 24+__gcov0.add_contiguity_constraints2(%rip)
.L296:
	leaq	1(%r14), %rax
	cmpq	%r13, %r14
	je	.L360
.L331:
	movq	%rax, %r14
	movl	%r14d, %r11d
	movl	%r14d, %r15d
	cmpl	%r12d, %r14d
	jne	.L295
.L359:
	lock addq	$1, 16+__gcov0.add_contiguity_constraints2(%rip)
	leaq	1(%r14), %rax
	cmpq	%r13, %r14
	jne	.L331
.L360:
	movq	%r10, %r15
	lock addq	$1, 192+__gcov0.add_contiguity_constraints2(%rip)
	movq	-304(%rbp), %rsi
	addq	$8, -168(%rbp)
	addq	%rsi, -288(%rbp)
	addl	$1, %r12d
	cmpl	%r12d, -292(%rbp)
	jne	.L325
.L327:
	lock addq	$1, 200+__gcov0.add_contiguity_constraints2(%rip)
	addl	$1, -252(%rbp)
	movl	-252(%rbp), %eax
	cmpl	%eax, -308(%rbp)
	jne	.L294
.L293:
	lock addq	$1, 208+__gcov0.add_contiguity_constraints2(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L361
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L306:
	.cfi_restore_state
	lock addq	$1, 40+__gcov0.add_contiguity_constraints2(%rip)
	movq	%rsp, %rax
	subq	-192(%rbp), %rax
	movq	%rsp, -184(%rbp)
	cmpq	%rax, %rsp
	je	.L299
.L362:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rax, %rsp
	jne	.L362
.L299:
	movq	-272(%rbp), %rax
	andl	$4095, %eax
	subq	%rax, %rsp
	testq	%rax, %rax
	je	.L300
	orq	$0, -8(%rsp,%rax)
.L300:
	movq	-280(%rbp), %rax
	movq	%rsp, %rsi
	movq	%rsp, -232(%rbp)
	salq	$4, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	subq	%rdx, %rsi
	movq	%rsi, %rdx
	cmpq	%rdx, %rsp
	je	.L302
.L363:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rdx, %rsp
	jne	.L363
.L302:
	andl	$4095, %eax
	subq	%rax, %rsp
	testq	%rax, %rax
	je	.L303
	orq	$0, -8(%rsp,%rax)
.L303:
	movq	%r10, %rax
	xorl	%ebx, %ebx
	movq	%r14, %r10
	movl	%r11d, -256(%rbp)
	movq	%rsp, -264(%rbp)
	movq	-288(%rbp), %r11
	movq	%rax, %r14
	movl	$0, -176(%rbp)
	jmp	.L304
	.p2align 4,,10
	.p2align 3
.L307:
	lock addq	$1, 104+__gcov0.add_contiguity_constraints2(%rip)
	leaq	1(%rbx), %rax
	cmpq	%r13, %rbx
	je	.L364
	movq	%rax, %rbx
.L304:
	movl	%ebx, %r8d
	cmpl	%ebx, %r12d
	je	.L307
	cmpl	%ebx, %r15d
	je	.L307
	lock addq	$1, 48+__gcov0.add_contiguity_constraints2(%rip)
	movq	(%r14,%rbx,8), %rdx
	movq	(%r14,%r10,8), %rsi
	movl	12(%rdx), %r9d
	testl	%r9d, %r9d
	jle	.L307
	xorl	%eax, %eax
	jmp	.L310
	.p2align 4,,10
	.p2align 3
.L308:
	lock addq	$1, 64+__gcov0.add_contiguity_constraints2(%rip)
	addq	$1, %rax
	cmpl	%eax, 12(%rdx)
	jle	.L307
.L310:
	movq	48(%rdx), %rcx
	movl	44(%rsi), %edi
	cmpl	%edi, (%rcx,%rax,4)
	jne	.L308
	lock addq	$1, 56+__gcov0.add_contiguity_constraints2(%rip)
	lock addq	$1, 72+__gcov0.add_contiguity_constraints2(%rip)
	movl	(%r11,%r10,4), %eax
	cmpl	%eax, (%r11,%rbx,4)
	jge	.L307
	subq	$8, %rsp
	leaq	-96(%rbp), %rdi
	movl	$32, %ecx
	xorl	%eax, %eax
	movq	%r11, -224(%rbp)
	movl	$1, %edx
	movl	$32, %esi
	movl	-252(%rbp), %r9d
	movq	%r10, -216(%rbp)
	pushq	%r8
	leaq	.LC2(%rip), %r8
	movq	%rdi, -208(%rbp)
	call	__snprintf_chk@PLT
	movq	-208(%rbp), %rdi
	movslq	-176(%rbp), %r8
	movq	-232(%rbp), %rax
	movq	-248(%rbp), %rsi
	movq	%rdi, %rdx
	movq	-240(%rbp), %rdi
	movq	%r8, -200(%rbp)
	leaq	(%rax,%r8,4), %rcx
	call	CPXgetcolindex@PLT
	popq	%rdi
	popq	%r8
	testl	%eax, %eax
	movq	-200(%rbp), %r8
	movq	-216(%rbp), %r10
	movq	-224(%rbp), %r11
	jne	.L365
	addl	$1, -176(%rbp)
	movq	-264(%rbp), %rax
	movq	.LC10(%rip), %rsi
	movq	%rsi, (%rax,%r8,8)
	lock addq	$1, 96+__gcov0.add_contiguity_constraints2(%rip)
	jmp	.L307
	.p2align 4,,10
	.p2align 3
.L364:
	movl	-176(%rbp), %esi
	movq	%r14, %rax
	movl	-256(%rbp), %r11d
	movq	%r10, %r14
	movq	%rax, %r10
	testl	%esi, %esi
	jne	.L366
.L312:
	movq	-184(%rbp), %rsp
	jmp	.L296
.L366:
	movq	%rax, -216(%rbp)
	movl	%r11d, -208(%rbp)
	lock addq	$1, 112+__gcov0.add_contiguity_constraints2(%rip)
	leaq	.LC2(%rip), %r8
	movl	$32, %ecx
	xorl	%eax, %eax
	movl	$1, %edx
	movl	$32, %esi
	movl	-252(%rbp), %r9d
	movq	%rsp, -200(%rbp)
	subq	$8, %rsp
	leaq	-128(%rbp), %rbx
	leaq	-96(%rbp), %r15
	pushq	%r12
	movq	%rbx, %rdi
	call	__snprintf_chk@PLT
	movq	%r15, %rdi
	movl	$32, %ecx
	xorl	%eax, %eax
	movl	-208(%rbp), %r11d
	movl	$1, %edx
	movl	$32, %esi
	movl	-252(%rbp), %r9d
	leaq	.LC2(%rip), %r8
	movl	%r11d, (%rsp)
	call	__snprintf_chk@PLT
	movq	-248(%rbp), %rsi
	movq	-240(%rbp), %rdi
	movq	%rbx, %rdx
	leaq	-156(%rbp), %rcx
	call	CPXgetcolindex@PLT
	lock addq	$1, 120+__gcov0.add_contiguity_constraints2(%rip)
	popq	%rdx
	movq	-216(%rbp), %r10
	popq	%rcx
	testl	%eax, %eax
	jne	.L367
	movq	-248(%rbp), %rsi
	movq	-240(%rbp), %rdi
	movq	%r15, %rdx
	leaq	-152(%rbp), %rcx
	movq	%r10, -208(%rbp)
	call	CPXgetcolindex@PLT
	lock addq	$1, 136+__gcov0.add_contiguity_constraints2(%rip)
	movq	-208(%rbp), %r10
	testl	%eax, %eax
	jne	.L368
	movl	-176(%rbp), %eax
	movq	%rsp, %rsi
	leal	2(%rax), %r8d
	movslq	%r8d, %rdx
	leaq	15(,%rdx,4), %rax
	movq	%rax, %rcx
	andq	$-4096, %rax
	subq	%rax, %rsi
	andq	$-16, %rcx
	movq	%rsi, %rax
	cmpq	%rax, %rsp
	je	.L317
.L369:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rax, %rsp
	jne	.L369
.L317:
	andl	$4095, %ecx
	subq	%rcx, %rsp
	testq	%rcx, %rcx
	je	.L318
	orq	$0, -8(%rsp,%rcx)
.L318:
	leaq	15(,%rdx,8), %rdx
	movq	%rsp, %rsi
	leaq	3(%rsp), %rcx
	movq	%rdx, %rax
	andq	$-4096, %rdx
	movq	%rcx, %rdi
	andq	$-4, %rcx
	subq	%rdx, %rsi
	shrq	$2, %rdi
	andq	$-16, %rax
	movq	%rsi, %rdx
	cmpq	%rdx, %rsp
	je	.L320
.L370:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rdx, %rsp
	jne	.L370
.L320:
	andl	$4095, %eax
	subq	%rax, %rsp
	testq	%rax, %rax
	je	.L321
	orq	$0, -8(%rsp,%rax)
.L321:
	leaq	7(%rsp), %rsi
	movl	-156(%rbp), %edx
	movapd	.LC22(%rip), %xmm1
	movq	%rsi, %rax
	movq	-232(%rbp), %r9
	andq	$-8, %rsi
	movq	-264(%rbp), %r11
	shrq	$3, %rax
	movl	%edx, 0(,%rdi,4)
	movl	-152(%rbp), %edx
	movups	%xmm1, 0(,%rax,8)
	movl	-176(%rbp), %eax
	movl	%edx, 4(,%rdi,4)
	leal	-1(%rax), %edi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L322:
	movl	(%r9,%rax,4), %edx
	movsd	(%r11,%rax,8), %xmm0
	movl	%edx, 8(%rcx,%rax,4)
	movsd	%xmm0, 16(%rsi,%rax,8)
	lock addq	$1, 160+__gcov0.add_contiguity_constraints2(%rip)
	movq	%rax, %rdx
	addq	$1, %rax
	cmpq	%rdi, %rdx
	jne	.L322
	movq	.LC21(%rip), %rax
	movq	%r10, -176(%rbp)
	xorl	%edx, %edx
	leaq	-144(%rbp), %r9
	movb	$71, -129(%rbp)
	movq	-240(%rbp), %rdi
	movq	%rax, -144(%rbp)
	leaq	-148(%rbp), %rax
	pushq	$0
	pushq	$0
	pushq	%rsi
	movq	-248(%rbp), %rsi
	pushq	%rcx
	movl	$1, %ecx
	pushq	%rax
	leaq	-129(%rbp), %rax
	pushq	%rax
	call	CPXaddrows@PLT
	lock addq	$1, 168+__gcov0.add_contiguity_constraints2(%rip)
	movq	-176(%rbp), %r10
	addq	$48, %rsp
	testl	%eax, %eax
	jne	.L371
	movq	-200(%rbp), %rsp
	jmp	.L312
.L365:
	lock addq	$1, 80+__gcov0.add_contiguity_constraints2(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC18(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 88+__gcov0.add_contiguity_constraints2(%rip)
	movl	$1, %edi
	call	exit@PLT
.L367:
	lock addq	$1, 128+__gcov0.add_contiguity_constraints2(%rip)
.L314:
	movq	stderr(%rip), %rdi
	leaq	.LC18(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	lock addq	$1, 152+__gcov0.add_contiguity_constraints2(%rip)
	movl	$1, %edi
	call	exit@PLT
.L368:
	lock addq	$1, 144+__gcov0.add_contiguity_constraints2(%rip)
	jmp	.L314
.L371:
	lock addq	$1, 176+__gcov0.add_contiguity_constraints2(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC20(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 184+__gcov0.add_contiguity_constraints2(%rip)
	movl	$1, %edi
	call	exit@PLT
.L361:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE60:
	.size	add_contiguity_constraints2, .-add_contiguity_constraints2
	.section	.rodata.str1.8
	.align 8
.LC32:
	.string	"Failed to parse variable name: %s\n"
	.text
	.p2align 4
	.globl	parse_var_name
	.type	parse_var_name, @function
parse_var_name:
.LFB61:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	subq	$8, %rsp
	.cfi_offset 12, -24
1:	call	*mcount@GOTPCREL(%rip)
	xorl	%eax, %eax
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	leaq	.LC2(%rip), %rsi
	movq	%rdi, %r12
	call	__isoc99_sscanf@PLT
	cmpl	$2, %eax
	jne	.L374
	lock addq	$1, 8+__gcov0.parse_var_name(%rip)
	addq	$8, %rsp
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L374:
	.cfi_restore_state
	lock addq	$1, __gcov0.parse_var_name(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC32(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r12, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 16+__gcov0.parse_var_name(%rip)
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE61:
	.size	parse_var_name, .-parse_var_name
	.p2align 4
	.globl	create_initial_clusters
	.type	create_initial_clusters, @function
create_initial_clusters:
.LFB62:
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
	subq	$24, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, -56(%rbp)
	movslq	%esi, %rdi
	movl	%edx, %r15d
	movq	%rdi, %r13
	lock addq	$1, __gcov0.create_initial_clusters(%rip)
	salq	$4, %rdi
	call	malloc@PLT
	movq	%rax, %r12
	testl	%r13d, %r13d
	jle	.L376
	subl	$1, %r13d
	movslq	%r15d, %r14
	movq	%rax, %rbx
	addq	$1, %r13
	salq	$3, %r14
	salq	$4, %r13
	addq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L377:
	movq	%r14, %rdi
	call	malloc@PLT
	movl	$0, 8(%rbx)
	movq	%rax, (%rbx)
	lock addq	$1, 8+__gcov0.create_initial_clusters(%rip)
	addq	$16, %rbx
	cmpq	%rbx, %r13
	jne	.L377
.L376:
	testl	%r15d, %r15d
	jle	.L375
	movq	-56(%rbp), %rbx
	leal	-1(%r15), %eax
	leaq	8(%rbx,%rax,8), %r8
	.p2align 4,,10
	.p2align 3
.L379:
	movq	(%rbx), %rcx
	movslq	36(%rcx), %rax
	salq	$4, %rax
	addq	%r12, %rax
	movslq	8(%rax), %rdi
	movq	(%rax), %rsi
	movq	%rdi, %rdx
	movq	%rcx, (%rsi,%rdi,8)
	addl	$1, %edx
	movl	%edx, 8(%rax)
	lock addq	$1, 16+__gcov0.create_initial_clusters(%rip)
	addq	$8, %rbx
	cmpq	%r8, %rbx
	jne	.L379
.L375:
	addq	$24, %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE62:
	.size	create_initial_clusters, .-create_initial_clusters
	.section	.rodata.str1.8
	.align 8
.LC33:
	.string	"Failed to get index for variable %s.\n"
	.align 8
.LC34:
	.string	"Failed to add fixed cluster constraint for unit %d.\n"
	.text
	.p2align 4
	.globl	add_fixed_cluster_constraints
	.type	add_fixed_cluster_constraints, @function
add_fixed_cluster_constraints:
.LFB63:
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
	subq	$120, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movl	%r9d, -152(%rbp)
	movq	%rdi, %r14
	movq	%rsi, %r13
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	lock addq	$1, __gcov0.add_fixed_cluster_constraints(%rip)
	movl	$0, -148(%rbp)
	leaq	8(%rcx), %r15
	testl	%r9d, %r9d
	jle	.L393
	.p2align 4,,10
	.p2align 3
.L392:
	movl	(%r15), %edx
	testl	%edx, %edx
	jle	.L384
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L385:
	movq	-8(%r15), %rcx
	movq	(%rcx,%rax,8), %rcx
	addl	8(%rcx), %edx
	lock addq	$1, 8+__gcov0.add_fixed_cluster_constraints(%rip)
	movl	(%r15), %ecx
	addq	$1, %rax
	cmpl	%eax, %ecx
	jg	.L385
	cmpl	%edx, 16(%rbp)
	jge	.L403
.L387:
	addl	$1, -148(%rbp)
	movl	-148(%rbp), %eax
	lock addq	$1, 72+__gcov0.add_fixed_cluster_constraints(%rip)
	addq	$16, %r15
	cmpl	%eax, -152(%rbp)
	jne	.L392
.L393:
	lock addq	$1, 80+__gcov0.add_fixed_cluster_constraints(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L404
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L403:
	.cfi_restore_state
	testl	%ecx, %ecx
	jle	.L391
	leaq	-132(%rbp), %rax
	xorl	%ebx, %ebx
	leaq	-96(%rbp), %r12
	movq	%rax, -160(%rbp)
	.p2align 4,,10
	.p2align 3
.L388:
	movq	-8(%r15), %rax
	movl	-148(%rbp), %r8d
	movl	$32, %edx
	movq	%r12, %rdi
	leaq	.LC2(%rip), %rcx
	movl	$1, %esi
	movq	(%rax,%rbx,8), %rax
	movl	44(%rax), %r9d
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	movq	-160(%rbp), %rcx
	call	CPXgetcolindex@PLT
	testl	%eax, %eax
	jne	.L405
	lock addq	$1, 24+__gcov0.add_fixed_cluster_constraints(%rip)
	movsd	.LC10(%rip), %xmm0
	movl	$1, %r8d
	xorl	%edx, %edx
	movl	$1, %ecx
	movl	-132(%rbp), %eax
	movl	%eax, -124(%rbp)
	leaq	-112(%rbp), %rax
	leaq	-120(%rbp), %r9
	movq	%r13, %rsi
	pushq	$0
	movq	%r14, %rdi
	pushq	$0
	pushq	%rax
	leaq	-124(%rbp), %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	leaq	-97(%rbp), %rax
	pushq	%rax
	movb	$69, -97(%rbp)
	movl	$0, -128(%rbp)
	movsd	%xmm0, -120(%rbp)
	movsd	%xmm0, -112(%rbp)
	call	CPXaddrows@PLT
	addq	$48, %rsp
	testl	%eax, %eax
	jne	.L406
	lock addq	$1, 56+__gcov0.add_fixed_cluster_constraints(%rip)
	addq	$1, %rbx
	cmpl	%ebx, (%r15)
	jg	.L388
.L391:
	lock addq	$1, 64+__gcov0.add_fixed_cluster_constraints(%rip)
	jmp	.L387
	.p2align 4,,10
	.p2align 3
.L384:
	movl	16(%rbp), %eax
	testl	%eax, %eax
	js	.L387
	lock addq	$1, 64+__gcov0.add_fixed_cluster_constraints(%rip)
	jmp	.L387
.L405:
	lock addq	$1, 16+__gcov0.add_fixed_cluster_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC33(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r12, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 32+__gcov0.add_fixed_cluster_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L406:
	lock addq	$1, 40+__gcov0.add_fixed_cluster_constraints(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC34(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movl	%ebx, %ecx
	call	__fprintf_chk@PLT
	lock addq	$1, 48+__gcov0.add_fixed_cluster_constraints(%rip)
	movl	$1, %edi
	call	exit@PLT
.L404:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE63:
	.size	add_fixed_cluster_constraints, .-add_fixed_cluster_constraints
	.section	.rodata.str1.8
	.align 8
.LC35:
	.string	"Could not open CPLEX environment.\n"
	.section	.rodata.str1.1
.LC36:
	.string	"districting"
.LC37:
	.string	"Could not create LP problem.\n"
	.section	.rodata.str1.8
	.align 8
.LC39:
	.string	"Failed to set time limit parameter.\n"
	.align 8
.LC40:
	.string	"Failed to optimize the ILP problem.\n"
	.section	.rodata.str1.1
.LC41:
	.string	"model.lp"
	.section	.rodata.str1.8
	.align 8
.LC42:
	.string	"Failed to write problem to file.\n"
	.section	.rodata.str1.1
.LC43:
	.string	"Solution status: %d\n"
.LC44:
	.string	"%s\n"
	.section	.rodata.str1.8
	.align 8
.LC45:
	.string	"Failed to get objective value.\n"
	.section	.rodata.str1.1
.LC46:
	.string	"Objective value: %.2f\n"
	.section	.rodata.str1.8
	.align 8
.LC47:
	.string	"Failed to get optimal solution.\n"
	.section	.rodata.str1.1
.LC48:
	.string	"..Cluster 0 with size %d: "
.LC49:
	.string	"Time taken: %f seconds\n"
	.section	.rodata.str1.8
	.align 8
.LC51:
	.string	"Cluster %d is empty or invalid.\n"
	.align 8
.LC52:
	.string	"Failed to get variable name for column %d.\n"
	.section	.rodata.str1.1
.LC53:
	.string	"Failed to free the problem.\n"
	.section	.rodata.str1.8
	.align 8
.LC54:
	.string	"Failed to close CPLEX environment.\n"
	.text
	.p2align 4
	.globl	runILP
	.type	runILP, @function
runILP:
.LFB64:
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
	subq	$1192, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movl	%r8d, -1160(%rbp)
	movq	%rdi, %r12
	movl	%esi, %ebx
	movl	%edx, %r13d
	movq	%r9, -1176(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	lock addq	$1, __gcov0.runILP(%rip)
	leaq	-1140(%rbp), %r14
	movq	$0, -1128(%rbp)
	movq	$0, -1120(%rbp)
	movq	%r14, %rdi
	call	CPXopenCPLEX@PLT
	movq	%rax, %rdi
	lock addq	$1, 8+__gcov0.runILP(%rip)
	movq	%rax, -1128(%rbp)
	testq	%rax, %rax
	je	.L469
	leaq	.LC36(%rip), %rdx
	movq	%r14, %rsi
	call	CPXcreateprob@PLT
	movq	%rax, -1120(%rbp)
	testq	%rax, %rax
	je	.L470
	lock addq	$1, 40+__gcov0.runILP(%rip)
	movq	-1128(%rbp), %rdi
	leaq	-1112(%rbp), %rsi
	call	CPXgettime@PLT
	lock addq	$1, 56+__gcov0.runILP(%rip)
	movslq	%r13d, %rax
	movq	%rsp, %rsi
	imulq	%rax, %rax
	leaq	15(,%rax,4), %rax
	movq	%rax, %rcx
	movq	%rax, %rdx
	andq	$-4096, %rcx
	andq	$-16, %rdx
	subq	%rcx, %rsi
	movq	%rsi, %rcx
	cmpq	%rcx, %rsp
	je	.L411
.L471:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rcx, %rsp
	jne	.L471
.L411:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L472
.L412:
	movq	%rax, %rdx
	movq	%rsp, %rsi
	andq	$-4096, %rax
	movq	%rsp, %r14
	subq	%rax, %rsi
	andq	$-16, %rdx
	movq	%rsi, %rax
	cmpq	%rax, %rsp
	je	.L414
.L473:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rax, %rsp
	jne	.L473
.L414:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L474
.L415:
	movsd	.LC38(%rip), %xmm0
	movq	-1128(%rbp), %rdi
	movl	$1039, %esi
	movq	%rsp, %r15
	call	CPXsetdblparam@PLT
	movl	%eax, -1140(%rbp)
	testl	%eax, %eax
	jne	.L416
	leal	-1(%r13), %ecx
	xorl	%eax, %eax
	testl	%r13d, %r13d
	jle	.L421
	.p2align 4,,10
	.p2align 3
.L420:
	movq	(%r12,%rax,8), %rdx
	movl	%eax, 44(%rdx)
	lock addq	$1, 80+__gcov0.runILP(%rip)
	movq	%rax, %rdx
	addq	$1, %rax
	cmpq	%rdx, %rcx
	jne	.L420
.L421:
	lock addq	$1, 88+__gcov0.runILP(%rip)
	movl	%r13d, %esi
	movq	%r12, %rdi
	call	create_neighbor_index
	lock addq	$1, 96+__gcov0.runILP(%rip)
	movq	-1120(%rbp), %r8
	movq	-1128(%rbp), %rcx
	movl	%r13d, %edx
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	create_decision_variables
	movl	%eax, -1168(%rbp)
	lock addq	$1, 104+__gcov0.runILP(%rip)
	movq	-1120(%rbp), %r8
	movq	-1128(%rbp), %rcx
	movl	%ebx, %edx
	movl	%r13d, %esi
	movq	%r12, %rdi
	call	create_c_variables
	lock addq	$1, 112+__gcov0.runILP(%rip)
	movq	%r14, %rdx
	movl	%r13d, %esi
	movq	%r12, %rdi
	call	init_adjMatrix
	lock addq	$1, 120+__gcov0.runILP(%rip)
	movq	%r15, %rdx
	movq	%r14, %rsi
	movl	%r13d, %edi
	call	floydWarshall
	lock addq	$1, 128+__gcov0.runILP(%rip)
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	movl	%ebx, %ecx
	movl	%r13d, %edx
	call	add_basic_constraints
	lock addq	$1, 136+__gcov0.runILP(%rip)
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	movl	%ebx, %ecx
	movl	%r13d, %edx
	call	add_at_least_one_unit_per_cluster_constraints
	lock addq	$1, 144+__gcov0.runILP(%rip)
	movl	-1160(%rbp), %r9d
	movq	-1120(%rbp), %r8
	movq	-1128(%rbp), %rcx
	movl	%ebx, %edx
	movl	%r13d, %esi
	movq	%r12, %rdi
	call	add_population_constraints
	lock addq	$1, 152+__gcov0.runILP(%rip)
	movq	-1120(%rbp), %r9
	movq	-1128(%rbp), %r8
	movq	%r15, %rcx
	movl	%r13d, %edx
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	add_contiguity_constraints2
	lock addq	$1, 160+__gcov0.runILP(%rip)
	movq	-1120(%rbp), %r8
	movq	-1128(%rbp), %rcx
	movl	%ebx, %edx
	movl	%r13d, %esi
	movq	%r12, %rdi
	call	add_c_constraints
	lock addq	$1, 168+__gcov0.runILP(%rip)
	movq	-1120(%rbp), %r8
	movq	-1128(%rbp), %rcx
	movl	%ebx, %edx
	movl	%r13d, %esi
	movq	%r12, %rdi
	call	add_objective_function
	lock addq	$1, 176+__gcov0.runILP(%rip)
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	call	CPXmipopt@PLT
	lock addq	$1, 184+__gcov0.runILP(%rip)
	movl	%eax, -1140(%rbp)
	testl	%eax, %eax
	jne	.L475
.L419:
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	xorl	%ecx, %ecx
	leaq	.LC41(%rip), %rdx
	call	CPXwriteprob@PLT
	lock addq	$1, 208+__gcov0.runILP(%rip)
	movl	%eax, -1140(%rbp)
	testl	%eax, %eax
	jne	.L476
.L422:
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	call	CPXgetstat@PLT
	movl	%eax, %r15d
	lock addq	$1, 232+__gcov0.runILP(%rip)
	leaq	.LC43(%rip), %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 240+__gcov0.runILP(%rip)
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	leaq	-1096(%rbp), %rdx
	call	CPXgetobjval@PLT
	lock addq	$1, 248+__gcov0.runILP(%rip)
	movq	-1128(%rbp), %rdi
	leaq	-1088(%rbp), %r14
	movl	%r15d, %esi
	movl	%eax, -1140(%rbp)
	movq	%r14, %rdx
	call	CPXgetstatstring@PLT
	lock addq	$1, 256+__gcov0.runILP(%rip)
	leaq	.LC44(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movq	%r14, %rdx
	call	__printf_chk@PLT
	lock addq	$1, 264+__gcov0.runILP(%rip)
	movl	-1140(%rbp), %r8d
	testl	%r8d, %r8d
	jne	.L477
.L423:
	movsd	-1096(%rbp), %xmm0
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC46(%rip), %rsi
	call	__printf_chk@PLT
	lock addq	$1, 288+__gcov0.runILP(%rip)
	cmpl	$103, %r15d
	je	.L424
	cmpl	$108, %r15d
	je	.L424
	lock addq	$1, 296+__gcov0.runILP(%rip)
	movslq	-1168(%rbp), %rdi
	movq	%rdi, %r14
	salq	$3, %rdi
	call	malloc@PLT
	leal	-1(%r14), %edi
	movq	-1120(%rbp), %rsi
	xorl	%ecx, %ecx
	movl	%edi, -1192(%rbp)
	movl	%edi, %r8d
	movq	%rax, %rdx
	movq	-1128(%rbp), %rdi
	movq	%rax, -1184(%rbp)
	call	CPXgetx@PLT
	lock addq	$1, 304+__gcov0.runILP(%rip)
	movl	%eax, -1140(%rbp)
	testl	%eax, %eax
	jne	.L478
.L425:
	movslq	%ebx, %r14
	movl	$4, %esi
	movq	%r14, %rdi
	call	calloc@PLT
	movq	%r14, %rdi
	movl	$1, %esi
	movq	%rax, -1160(%rbp)
	call	calloc@PLT
	movl	-1168(%rbp), %edi
	movq	-1160(%rbp), %r11
	movq	%rax, %r15
	testl	%edi, %edi
	jle	.L479
	movl	-1192(%rbp), %eax
	movq	%r12, -1160(%rbp)
	xorl	%r14d, %r14d
	movl	%r13d, -1228(%rbp)
	movq	%rax, -1224(%rbp)
	leaq	-1104(%rbp), %rax
	movq	%rax, -1192(%rbp)
	leaq	-1136(%rbp), %rax
	movq	%rax, -1208(%rbp)
	leaq	-1132(%rbp), %rax
	movq	%rax, -1216(%rbp)
	movl	%ebx, -1196(%rbp)
	movq	%r11, %rbx
.L441:
	movl	$8, %edi
	movl	%r14d, -1200(%rbp)
	call	malloc@PLT
	movl	$32, %edi
	movq	%rax, %r13
	call	malloc@PLT
	pushq	%r14
	movl	$32, %r8d
	movq	%r13, %rdx
	pushq	%r14
	movq	-1208(%rbp), %r9
	movq	%rax, %rcx
	movq	%rax, %r12
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	call	CPXgetcolname@PLT
	lock addq	$1, 328+__gcov0.runILP(%rip)
	leaq	.LC2(%rip), %rsi
	movq	0(%r13), %r8
	movq	-1192(%rbp), %rcx
	movq	-1216(%rbp), %rdx
	movq	%r8, %rdi
	movl	%eax, -1140(%rbp)
	xorl	%eax, %eax
	movq	%r8, -1168(%rbp)
	call	__isoc99_sscanf@PLT
	popq	%rcx
	movq	-1168(%rbp), %r8
	cmpl	$2, %eax
	popq	%rsi
	jne	.L480
	lock addq	$1, 8+__gcov0.parse_var_name(%rip)
	movslq	-1104(%rbp), %rax
	movq	-1160(%rbp), %rsi
	movq	%rax, %rcx
	movq	(%rsi,%rax,8), %rax
	movq	-1184(%rbp), %rsi
	movsd	(%rsi,%r14,8), %xmm0
	comisd	.LC50(%rip), %xmm0
	jb	.L464
	movl	-1132(%rbp), %edx
	movl	%edx, 36(%rax)
	lock addq	$1, 336+__gcov0.runILP(%rip)
	movb	$1, 32(%rax)
	lock addq	$1, 344+__gcov0.runILP(%rip)
	movslq	-1132(%rbp), %rdx
	addl	$1, (%rbx,%rdx,4)
	movl	%edx, 36(%rax)
	movl	%ecx, 44(%rax)
	movb	$1, (%r15,%rdx)
.L432:
	movq	-1160(%rbp), %rsi
	xorl	%ecx, %ecx
	movq	%rax, (%rsi,%r14,8)
	movl	-1196(%rbp), %eax
	leal	-1(%rax), %edx
	testl	%eax, %eax
	jg	.L437
	jmp	.L438
	.p2align 4,,10
	.p2align 3
.L443:
	movq	%rax, %rcx
.L437:
	cmpb	$0, (%r15,%rcx)
	je	.L436
	lock addq	$1, 352+__gcov0.runILP(%rip)
	movl	(%rbx,%rcx,4), %eax
	testl	%eax, %eax
	je	.L481
.L436:
	lock addq	$1, 376+__gcov0.runILP(%rip)
	leaq	1(%rcx), %rax
	cmpq	%rdx, %rcx
	jne	.L443
.L438:
	lock addq	$1, 384+__gcov0.runILP(%rip)
	movl	-1140(%rbp), %edx
	testl	%edx, %edx
	jne	.L482
.L465:
	movq	%r13, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	leaq	1(%r14), %rax
	cmpq	-1224(%rbp), %r14
	je	.L468
	movq	%rax, %r14
	jmp	.L441
.L472:
	orq	$0, -8(%rsp,%rdx)
	jmp	.L412
	.p2align 4,,10
	.p2align 3
.L481:
	lock addq	$1, 360+__gcov0.runILP(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC51(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 368+__gcov0.runILP(%rip)
.L424:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L483
	movq	-1176(%rbp), %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L464:
	.cfi_restore_state
	movb	$0, 32(%rax)
	jmp	.L432
	.p2align 4,,10
	.p2align 3
.L475:
	lock addq	$1, 192+__gcov0.runILP(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC40(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 200+__gcov0.runILP(%rip)
	jmp	.L419
	.p2align 4,,10
	.p2align 3
.L477:
	lock addq	$1, 272+__gcov0.runILP(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC45(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 280+__gcov0.runILP(%rip)
	jmp	.L423
	.p2align 4,,10
	.p2align 3
.L476:
	lock addq	$1, 216+__gcov0.runILP(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC42(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 224+__gcov0.runILP(%rip)
	jmp	.L422
	.p2align 4,,10
	.p2align 3
.L482:
	lock addq	$1, 392+__gcov0.runILP(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC52(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movl	-1200(%rbp), %ecx
	call	__fprintf_chk@PLT
	lock addq	$1, 400+__gcov0.runILP(%rip)
	jmp	.L465
	.p2align 4,,10
	.p2align 3
.L478:
	lock addq	$1, 312+__gcov0.runILP(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC47(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 320+__gcov0.runILP(%rip)
	jmp	.L425
.L474:
	orq	$0, -8(%rsp,%rdx)
	jmp	.L415
.L468:
	movq	-1160(%rbp), %r12
	movl	-1196(%rbp), %ebx
	movl	-1228(%rbp), %r13d
.L440:
	lock addq	$1, 408+__gcov0.runILP(%rip)
	movq	-1184(%rbp), %rdi
	call	free@PLT
	movl	%r13d, %edx
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	create_initial_clusters
	movq	%rax, -1176(%rbp)
	lock addq	$1, 416+__gcov0.runILP(%rip)
	leaq	.LC48(%rip), %rsi
	movl	$1, %edi
	movl	24(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 424+__gcov0.runILP(%rip)
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	call	CPXmipopt@PLT
	lock addq	$1, 432+__gcov0.runILP(%rip)
	movq	-1192(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	movl	%eax, -1140(%rbp)
	call	CPXgettime@PLT
	lock addq	$1, 440+__gcov0.runILP(%rip)
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC49(%rip), %rsi
	movsd	-1104(%rbp), %xmm0
	subsd	-1112(%rbp), %xmm0
	call	__printf_chk@PLT
	lock addq	$1, 448+__gcov0.runILP(%rip)
	movq	-1128(%rbp), %rdi
	leaq	-1120(%rbp), %rsi
	call	CPXfreeprob@PLT
	movl	%eax, -1140(%rbp)
	testl	%eax, %eax
	jne	.L484
	lock addq	$1, 464+__gcov0.runILP(%rip)
	leaq	-1128(%rbp), %rdi
	call	CPXcloseCPLEX@PLT
	lock addq	$1, 480+__gcov0.runILP(%rip)
	movl	%eax, -1140(%rbp)
	testl	%eax, %eax
	je	.L424
	lock addq	$1, 488+__gcov0.runILP(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC54(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 496+__gcov0.runILP(%rip)
	movl	$1, %edi
	call	exit@PLT
	.p2align 4,,10
	.p2align 3
.L479:
	leaq	-1104(%rbp), %rax
	movq	%rax, -1192(%rbp)
	jmp	.L440
.L469:
	lock addq	$1, 16+__gcov0.runILP(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC35(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 24+__gcov0.runILP(%rip)
	movl	$1, %edi
	call	exit@PLT
.L483:
	call	__stack_chk_fail@PLT
.L470:
	lock addq	$1, 32+__gcov0.runILP(%rip)
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	leaq	.LC37(%rip), %rdx
	call	__fprintf_chk@PLT
	lock addq	$1, 48+__gcov0.runILP(%rip)
	movl	$1, %edi
	call	exit@PLT
.L480:
	lock addq	$1, __gcov0.parse_var_name(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC32(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r8, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 16+__gcov0.parse_var_name(%rip)
	movl	$1, %edi
	call	exit@PLT
.L416:
	lock addq	$1, 64+__gcov0.runILP(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC39(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 72+__gcov0.runILP(%rip)
	movl	$1, %edi
	call	exit@PLT
.L484:
	lock addq	$1, 456+__gcov0.runILP(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC53(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 472+__gcov0.runILP(%rip)
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE64:
	.size	runILP, .-runILP
	.p2align 4
	.globl	runILP_only
	.type	runILP_only, @function
runILP_only:
.LFB65:
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
	subq	$1128, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movl	%r8d, -1160(%rbp)
	movq	%rdi, %r15
	movl	%esi, %r13d
	movl	%edx, %r12d
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	lock addq	$1, __gcov0.runILP_only(%rip)
	leaq	-1140(%rbp), %r14
	movq	$0, -1128(%rbp)
	movq	$0, -1120(%rbp)
	movq	%r14, %rdi
	call	CPXopenCPLEX@PLT
	movq	%rax, %rdi
	lock addq	$1, 8+__gcov0.runILP_only(%rip)
	movq	%rax, -1128(%rbp)
	testq	%rax, %rax
	je	.L528
	leaq	.LC36(%rip), %rdx
	movq	%r14, %rsi
	call	CPXcreateprob@PLT
	movq	%rax, -1120(%rbp)
	testq	%rax, %rax
	je	.L529
	lock addq	$1, 40+__gcov0.runILP_only(%rip)
	movq	-1128(%rbp), %rdi
	leaq	-1112(%rbp), %rsi
	call	CPXgettime@PLT
	lock addq	$1, 56+__gcov0.runILP_only(%rip)
	movslq	%r12d, %rax
	movq	%rsp, %rbx
	imulq	%rax, %rax
	leaq	15(,%rax,4), %rax
	movq	%rax, %rcx
	movq	%rax, %rdx
	andq	$-4096, %rcx
	andq	$-16, %rdx
	subq	%rcx, %rbx
	movq	%rbx, %rcx
	cmpq	%rcx, %rsp
	je	.L489
.L530:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rcx, %rsp
	jne	.L530
.L489:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L531
.L490:
	movq	%rax, %rdx
	movq	%rsp, %rbx
	andq	$-4096, %rax
	movq	%rsp, %r14
	subq	%rax, %rbx
	andq	$-16, %rdx
	movq	%rbx, %rax
	cmpq	%rax, %rsp
	je	.L492
.L532:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rax, %rsp
	jne	.L532
.L492:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L533
.L493:
	movsd	.LC55(%rip), %xmm0
	movq	-1128(%rbp), %rdi
	movl	$1039, %esi
	movq	%rsp, -1168(%rbp)
	call	CPXsetdblparam@PLT
	movl	%eax, -1140(%rbp)
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L494
	leal	-1(%r12), %ecx
	xorl	%eax, %eax
	testl	%r12d, %r12d
	jle	.L496
	.p2align 4,,10
	.p2align 3
.L497:
	movq	(%r15,%rax,8), %rdx
	movl	%eax, 44(%rdx)
	lock addq	$1, 80+__gcov0.runILP_only(%rip)
	movq	%rax, %rdx
	addq	$1, %rax
	cmpq	%rdx, %rcx
	jne	.L497
.L496:
	lock addq	$1, 88+__gcov0.runILP_only(%rip)
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	create_neighbor_index
	lock addq	$1, 96+__gcov0.runILP_only(%rip)
	movq	-1120(%rbp), %r8
	movq	-1128(%rbp), %rcx
	movl	%r12d, %edx
	movl	%r13d, %esi
	movq	%r15, %rdi
	call	create_decision_variables
	movl	%eax, -1156(%rbp)
	lock addq	$1, 104+__gcov0.runILP_only(%rip)
	movq	-1120(%rbp), %r8
	movq	-1128(%rbp), %rcx
	movl	%r13d, %edx
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	create_c_variables
	lock addq	$1, 112+__gcov0.runILP_only(%rip)
	movq	%r14, %rdx
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	init_adjMatrix
	lock addq	$1, 120+__gcov0.runILP_only(%rip)
	movq	-1168(%rbp), %rdx
	movq	%r14, %rsi
	movl	%r12d, %edi
	call	floydWarshall
	lock addq	$1, 128+__gcov0.runILP_only(%rip)
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	movl	%r13d, %ecx
	movl	%r12d, %edx
	call	add_basic_constraints
	lock addq	$1, 136+__gcov0.runILP_only(%rip)
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	movl	%r13d, %ecx
	movl	%r12d, %edx
	call	add_at_least_one_unit_per_cluster_constraints
	lock addq	$1, 144+__gcov0.runILP_only(%rip)
	movl	-1160(%rbp), %r9d
	movq	-1120(%rbp), %r8
	movq	-1128(%rbp), %rcx
	movl	%r13d, %edx
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	add_population_constraints
	lock addq	$1, 152+__gcov0.runILP_only(%rip)
	movq	-1120(%rbp), %r9
	movq	-1128(%rbp), %r8
	movq	-1168(%rbp), %rcx
	movl	%r12d, %edx
	movl	%r13d, %esi
	movq	%r15, %rdi
	call	add_contiguity_constraints2
	lock addq	$1, 160+__gcov0.runILP_only(%rip)
	movq	-1120(%rbp), %r8
	movq	-1128(%rbp), %rcx
	movl	%r13d, %edx
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	add_c_constraints
	lock addq	$1, 168+__gcov0.runILP_only(%rip)
	movq	-1120(%rbp), %r8
	movq	-1128(%rbp), %rcx
	movl	%r13d, %edx
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	add_objective_function
	lock addq	$1, 176+__gcov0.runILP_only(%rip)
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	call	CPXmipopt@PLT
	lock addq	$1, 184+__gcov0.runILP_only(%rip)
	movl	%eax, -1140(%rbp)
	testl	%eax, %eax
	jne	.L534
.L498:
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	xorl	%ecx, %ecx
	leaq	.LC41(%rip), %rdx
	call	CPXwriteprob@PLT
	lock addq	$1, 208+__gcov0.runILP_only(%rip)
	movl	%eax, -1140(%rbp)
	testl	%eax, %eax
	jne	.L535
.L499:
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	call	CPXgetstat@PLT
	movl	%eax, %r12d
	lock addq	$1, 232+__gcov0.runILP_only(%rip)
	leaq	.LC43(%rip), %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 240+__gcov0.runILP_only(%rip)
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	leaq	-1096(%rbp), %rdx
	call	CPXgetobjval@PLT
	lock addq	$1, 248+__gcov0.runILP_only(%rip)
	movq	-1128(%rbp), %rdi
	leaq	-1088(%rbp), %r13
	movl	%r12d, %esi
	movl	%eax, -1140(%rbp)
	movq	%r13, %rdx
	call	CPXgetstatstring@PLT
	lock addq	$1, 256+__gcov0.runILP_only(%rip)
	leaq	.LC44(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movq	%r13, %rdx
	call	__printf_chk@PLT
	lock addq	$1, 264+__gcov0.runILP_only(%rip)
	movl	-1140(%rbp), %edi
	testl	%edi, %edi
	jne	.L536
.L500:
	movsd	-1096(%rbp), %xmm0
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC46(%rip), %rsi
	call	__printf_chk@PLT
	lock addq	$1, 288+__gcov0.runILP_only(%rip)
	movslq	-1156(%rbp), %rdi
	movq	%rdi, %r14
	salq	$3, %rdi
	call	malloc@PLT
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	xorl	%ecx, %ecx
	leal	-1(%r14), %r8d
	movq	%rax, %rdx
	movq	%rax, -1168(%rbp)
	call	CPXgetx@PLT
	movl	%eax, -1140(%rbp)
	testl	%eax, %eax
	jne	.L537
.L501:
	lock addq	$1, 312+__gcov0.runILP_only(%rip)
	movl	-1156(%rbp), %esi
	leaq	-1104(%rbp), %r13
	testl	%esi, %esi
	jle	.L502
	leaq	-1136(%rbp), %r15
	leaq	-1104(%rbp), %r13
	leaq	-1132(%rbp), %r14
	.p2align 4,,10
	.p2align 3
.L504:
	lock addq	$1, 328+__gcov0.runILP_only(%rip)
	movl	$8, %edi
	call	malloc@PLT
	movl	$32, %edi
	movq	%rax, %r12
	call	malloc@PLT
	pushq	%rbx
	movq	-1120(%rbp), %rsi
	movq	%r15, %r9
	pushq	%rbx
	movq	-1128(%rbp), %rdi
	movq	%rax, %rcx
	movq	%r12, %rdx
	movl	$32, %r8d
	call	CPXgetcolname@PLT
	lock addq	$1, 320+__gcov0.runILP_only(%rip)
	leaq	.LC2(%rip), %rsi
	movq	(%r12), %r12
	movq	%r12, %rdi
	movl	%eax, -1140(%rbp)
	movq	%r13, %rcx
	movq	%r14, %rdx
	xorl	%eax, %eax
	call	__isoc99_sscanf@PLT
	popq	%rdx
	popq	%rcx
	cmpl	$2, %eax
	jne	.L538
	lock addq	$1, 8+__gcov0.parse_var_name(%rip)
	addl	$1, %ebx
	cmpl	%ebx, -1156(%rbp)
	jne	.L504
.L502:
	lock addq	$1, 336+__gcov0.runILP_only(%rip)
	movq	-1168(%rbp), %rdi
	call	free@PLT
	movq	-1120(%rbp), %rsi
	movq	-1128(%rbp), %rdi
	call	CPXmipopt@PLT
	lock addq	$1, 344+__gcov0.runILP_only(%rip)
	movq	-1128(%rbp), %rdi
	movq	%r13, %rsi
	movl	%eax, -1140(%rbp)
	call	CPXgettime@PLT
	lock addq	$1, 352+__gcov0.runILP_only(%rip)
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC49(%rip), %rsi
	movsd	-1104(%rbp), %xmm0
	subsd	-1112(%rbp), %xmm0
	call	__printf_chk@PLT
	lock addq	$1, 360+__gcov0.runILP_only(%rip)
	movq	-1128(%rbp), %rdi
	leaq	-1120(%rbp), %rsi
	call	CPXfreeprob@PLT
	movl	%eax, -1140(%rbp)
	testl	%eax, %eax
	jne	.L539
	lock addq	$1, 376+__gcov0.runILP_only(%rip)
	leaq	-1128(%rbp), %rdi
	call	CPXcloseCPLEX@PLT
	movl	%eax, -1140(%rbp)
	testl	%eax, %eax
	jne	.L540
	lock addq	$1, 400+__gcov0.runILP_only(%rip)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L541
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L531:
	.cfi_restore_state
	orq	$0, -8(%rsp,%rdx)
	jmp	.L490
	.p2align 4,,10
	.p2align 3
.L537:
	lock addq	$1, 296+__gcov0.runILP_only(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC47(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 304+__gcov0.runILP_only(%rip)
	jmp	.L501
	.p2align 4,,10
	.p2align 3
.L536:
	lock addq	$1, 272+__gcov0.runILP_only(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC45(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 280+__gcov0.runILP_only(%rip)
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L535:
	lock addq	$1, 216+__gcov0.runILP_only(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC42(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 224+__gcov0.runILP_only(%rip)
	jmp	.L499
	.p2align 4,,10
	.p2align 3
.L534:
	lock addq	$1, 192+__gcov0.runILP_only(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC40(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 200+__gcov0.runILP_only(%rip)
	jmp	.L498
.L533:
	orq	$0, -8(%rsp,%rdx)
	jmp	.L493
.L538:
	lock addq	$1, __gcov0.parse_var_name(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC32(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r12, %rcx
	call	__fprintf_chk@PLT
	lock addq	$1, 16+__gcov0.parse_var_name(%rip)
	movl	$1, %edi
	call	exit@PLT
.L528:
	lock addq	$1, 16+__gcov0.runILP_only(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC35(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 24+__gcov0.runILP_only(%rip)
	movl	$1, %edi
	call	exit@PLT
.L541:
	call	__stack_chk_fail@PLT
.L529:
	lock addq	$1, 32+__gcov0.runILP_only(%rip)
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	leaq	.LC37(%rip), %rdx
	call	__fprintf_chk@PLT
	lock addq	$1, 48+__gcov0.runILP_only(%rip)
	movl	$1, %edi
	call	exit@PLT
.L494:
	lock addq	$1, 64+__gcov0.runILP_only(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC39(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 72+__gcov0.runILP_only(%rip)
	movl	$1, %edi
	call	exit@PLT
.L540:
	lock addq	$1, 392+__gcov0.runILP_only(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC54(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 408+__gcov0.runILP_only(%rip)
	movl	$1, %edi
	call	exit@PLT
.L539:
	lock addq	$1, 368+__gcov0.runILP_only(%rip)
	movq	stderr(%rip), %rdi
	leaq	.LC53(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 384+__gcov0.runILP_only(%rip)
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE65:
	.size	runILP_only, .-runILP_only
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_sub_I_00100_0, @function
_sub_I_00100_0:
.LFB66:
	.cfi_startproc
	endbr64
	leaq	.LPBX0(%rip), %rdi
	jmp	__gcov_init@PLT
	.cfi_endproc
.LFE66:
	.size	_sub_I_00100_0, .-_sub_I_00100_0
	.section	.init_array.00100,"aw"
	.align 8
	.quad	_sub_I_00100_0
	.section	.text.exit,"ax",@progbits
	.p2align 4
	.type	_sub_D_00100_1, @function
_sub_D_00100_1:
.LFB67:
	.cfi_startproc
	endbr64
	jmp	__gcov_exit@PLT
	.cfi_endproc
.LFE67:
	.size	_sub_D_00100_1, .-_sub_D_00100_1
	.section	.fini_array.00100,"aw"
	.align 8
	.quad	_sub_D_00100_1
	.section	.data.rel.local,"aw"
	.align 32
	.type	.LPBX1, @object
	.size	.LPBX1, 208
.LPBX1:
	.quad	__gcov_.runILP_only
	.quad	__gcov_.runILP
	.quad	__gcov_.add_fixed_cluster_constraints
	.quad	__gcov_.create_initial_clusters
	.quad	__gcov_.parse_var_name
	.quad	__gcov_.add_contiguity_constraints2
	.quad	__gcov_.print_distMatrix
	.quad	__gcov_.print_adjMatrix
	.quad	__gcov_.create_contiguity_constraints
	.quad	__gcov_.add_at_least_one_unit_per_cluster_constraints
	.quad	__gcov_.add_basic_constraints
	.quad	__gcov_.add_force_assignment_constraint
	.quad	__gcov_.add_objective_function
	.quad	__gcov_.add_c_constraints
	.quad	__gcov_.create_c_variables
	.quad	__gcov_.create_b_vars
	.quad	__gcov_.create_decision_variables
	.quad	__gcov_.add_population_constraints
	.quad	__gcov_.floydWarshall
	.quad	__gcov_.init_adjMatrix
	.quad	__gcov_.get_var_index
	.quad	__gcov_.get_b_var_index
	.quad	__gcov_.are_neighbors
	.quad	__gcov_.create_neighbor_index
	.quad	__gcov_.find_id_by_code
	.quad	__gcov_.create_code_index
	.align 32
	.type	__gcov_.create_code_index, @object
	.size	__gcov_.create_code_index, 40
__gcov_.create_code_index:
	.quad	.LPBX0
	.long	1833555338
	.long	627117212
	.long	-1192601709
	.zero	4
	.long	2
	.zero	4
	.quad	__gcov0.create_code_index
	.align 32
	.type	__gcov_.find_id_by_code, @object
	.size	__gcov_.find_id_by_code, 40
__gcov_.find_id_by_code:
	.quad	.LPBX0
	.long	1623051550
	.long	43178866
	.long	-982540380
	.zero	4
	.long	3
	.zero	4
	.quad	__gcov0.find_id_by_code
	.align 32
	.type	__gcov_.create_neighbor_index, @object
	.size	__gcov_.create_neighbor_index, 40
__gcov_.create_neighbor_index:
	.quad	.LPBX0
	.long	485385082
	.long	950052102
	.long	-1997508318
	.zero	4
	.long	5
	.zero	4
	.quad	__gcov0.create_neighbor_index
	.align 32
	.type	__gcov_.are_neighbors, @object
	.size	__gcov_.are_neighbors, 40
__gcov_.are_neighbors:
	.quad	.LPBX0
	.long	1159127765
	.long	-218408810
	.long	-1562846356
	.zero	4
	.long	3
	.zero	4
	.quad	__gcov0.are_neighbors
	.align 32
	.type	__gcov_.get_b_var_index, @object
	.size	__gcov_.get_b_var_index, 40
__gcov_.get_b_var_index:
	.quad	.LPBX0
	.long	593200618
	.long	-1587748581
	.long	1895090979
	.zero	4
	.long	4
	.zero	4
	.quad	__gcov0.get_b_var_index
	.align 32
	.type	__gcov_.get_var_index, @object
	.size	__gcov_.get_var_index, 40
__gcov_.get_var_index:
	.quad	.LPBX0
	.long	1004180371
	.long	863790991
	.long	1895090979
	.zero	4
	.long	4
	.zero	4
	.quad	__gcov0.get_var_index
	.align 32
	.type	__gcov_.init_adjMatrix, @object
	.size	__gcov_.init_adjMatrix, 40
__gcov_.init_adjMatrix:
	.quad	.LPBX0
	.long	2117963859
	.long	-1355274074
	.long	-2018149294
	.zero	4
	.long	5
	.zero	4
	.quad	__gcov0.init_adjMatrix
	.align 32
	.type	__gcov_.floydWarshall, @object
	.size	__gcov_.floydWarshall, 40
__gcov_.floydWarshall:
	.quad	.LPBX0
	.long	1619445596
	.long	489224833
	.long	1766618349
	.zero	4
	.long	11
	.zero	4
	.quad	__gcov0.floydWarshall
	.align 32
	.type	__gcov_.add_population_constraints, @object
	.size	__gcov_.add_population_constraints, 40
__gcov_.add_population_constraints:
	.quad	.LPBX0
	.long	702817591
	.long	604027099
	.long	-96893021
	.zero	4
	.long	12
	.zero	4
	.quad	__gcov0.add_population_constraints
	.align 32
	.type	__gcov_.create_decision_variables, @object
	.size	__gcov_.create_decision_variables, 40
__gcov_.create_decision_variables:
	.quad	.LPBX0
	.long	2142087775
	.long	-200855771
	.long	-481103779
	.zero	4
	.long	15
	.zero	4
	.quad	__gcov0.create_decision_variables
	.align 32
	.type	__gcov_.create_b_vars, @object
	.size	__gcov_.create_b_vars, 40
__gcov_.create_b_vars:
	.quad	.LPBX0
	.long	117917681
	.long	626044314
	.long	18160359
	.zero	4
	.long	7
	.zero	4
	.quad	__gcov0.create_b_vars
	.align 32
	.type	__gcov_.create_c_variables, @object
	.size	__gcov_.create_c_variables, 40
__gcov_.create_c_variables:
	.quad	.LPBX0
	.long	2065153371
	.long	-1270403700
	.long	18160359
	.zero	4
	.long	7
	.zero	4
	.quad	__gcov0.create_c_variables
	.align 32
	.type	__gcov_.add_c_constraints, @object
	.size	__gcov_.add_c_constraints, 40
__gcov_.add_c_constraints:
	.quad	.LPBX0
	.long	1602021458
	.long	535783645
	.long	454137352
	.zero	4
	.long	28
	.zero	4
	.quad	__gcov0.add_c_constraints
	.align 32
	.type	__gcov_.add_objective_function, @object
	.size	__gcov_.add_objective_function, 40
__gcov_.add_objective_function:
	.quad	.LPBX0
	.long	1626351793
	.long	-415340593
	.long	-1688317092
	.zero	4
	.long	12
	.zero	4
	.quad	__gcov0.add_objective_function
	.align 32
	.type	__gcov_.add_force_assignment_constraint, @object
	.size	__gcov_.add_force_assignment_constraint, 40
__gcov_.add_force_assignment_constraint:
	.quad	.LPBX0
	.long	1701116253
	.long	-1108639975
	.long	-963089625
	.zero	4
	.long	9
	.zero	4
	.quad	__gcov0.add_force_assignment_constraint
	.align 32
	.type	__gcov_.add_basic_constraints, @object
	.size	__gcov_.add_basic_constraints, 40
__gcov_.add_basic_constraints:
	.quad	.LPBX0
	.long	1969971809
	.long	-1548298620
	.long	-963089625
	.zero	4
	.long	9
	.zero	4
	.quad	__gcov0.add_basic_constraints
	.align 32
	.type	__gcov_.add_at_least_one_unit_per_cluster_constraints, @object
	.size	__gcov_.add_at_least_one_unit_per_cluster_constraints, 40
__gcov_.add_at_least_one_unit_per_cluster_constraints:
	.quad	.LPBX0
	.long	5109884
	.long	-1409843064
	.long	-963089625
	.zero	4
	.long	9
	.zero	4
	.quad	__gcov0.add_at_least_one_unit_per_cluster_constraints
	.align 32
	.type	__gcov_.create_contiguity_constraints, @object
	.size	__gcov_.create_contiguity_constraints, 40
__gcov_.create_contiguity_constraints:
	.quad	.LPBX0
	.long	684503925
	.long	-1777863621
	.long	-459810207
	.zero	4
	.long	21
	.zero	4
	.quad	__gcov0.create_contiguity_constraints
	.align 32
	.type	__gcov_.print_adjMatrix, @object
	.size	__gcov_.print_adjMatrix, 40
__gcov_.print_adjMatrix:
	.quad	.LPBX0
	.long	447796258
	.long	1316014195
	.long	-463403999
	.zero	4
	.long	6
	.zero	4
	.quad	__gcov0.print_adjMatrix
	.align 32
	.type	__gcov_.print_distMatrix, @object
	.size	__gcov_.print_distMatrix, 40
__gcov_.print_distMatrix:
	.quad	.LPBX0
	.long	1019270111
	.long	-678261619
	.long	-463403999
	.zero	4
	.long	6
	.zero	4
	.quad	__gcov0.print_distMatrix
	.align 32
	.type	__gcov_.add_contiguity_constraints2, @object
	.size	__gcov_.add_contiguity_constraints2, 40
__gcov_.add_contiguity_constraints2:
	.quad	.LPBX0
	.long	1995737415
	.long	696125141
	.long	1111602792
	.zero	4
	.long	27
	.zero	4
	.quad	__gcov0.add_contiguity_constraints2
	.align 32
	.type	__gcov_.parse_var_name, @object
	.size	__gcov_.parse_var_name, 40
__gcov_.parse_var_name:
	.quad	.LPBX0
	.long	1484996106
	.long	-1199554367
	.long	-1687120130
	.zero	4
	.long	3
	.zero	4
	.quad	__gcov0.parse_var_name
	.align 32
	.type	__gcov_.create_initial_clusters, @object
	.size	__gcov_.create_initial_clusters, 40
__gcov_.create_initial_clusters:
	.quad	.LPBX0
	.long	1957558579
	.long	738040112
	.long	-2065149567
	.zero	4
	.long	3
	.zero	4
	.quad	__gcov0.create_initial_clusters
	.align 32
	.type	__gcov_.add_fixed_cluster_constraints, @object
	.size	__gcov_.add_fixed_cluster_constraints, 40
__gcov_.add_fixed_cluster_constraints:
	.quad	.LPBX0
	.long	68369494
	.long	-1303607121
	.long	-556843850
	.zero	4
	.long	11
	.zero	4
	.quad	__gcov0.add_fixed_cluster_constraints
	.align 32
	.type	__gcov_.runILP, @object
	.size	__gcov_.runILP, 40
__gcov_.runILP:
	.quad	.LPBX0
	.long	1910087633
	.long	-1836370620
	.long	-1260344159
	.zero	4
	.long	63
	.zero	4
	.quad	__gcov0.runILP
	.section	.rodata.str1.8
	.align 8
.LC56:
	.string	"/mnt/c/Users/maria/OneDrive/Ambiente de Trabalho/SA_COPY/SA_copy/SA/ILP.gcda"
	.section	.data.rel,"aw"
	.align 32
	.type	.LPBX0, @object
	.size	.LPBX0, 120
.LPBX0:
	.long	1094267690
	.zero	4
	.quad	0
	.long	215549301
	.zero	4
	.quad	.LC56
	.quad	__gcov_merge_add
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	26
	.zero	4
	.quad	.LPBX1
	.section	.data.rel.local
	.align 32
	.type	__gcov_.runILP_only, @object
	.size	__gcov_.runILP_only, 40
__gcov_.runILP_only:
	.quad	.LPBX0
	.long	1073487663
	.long	1950132977
	.long	-770606791
	.zero	4
	.long	52
	.zero	4
	.quad	__gcov0.runILP_only
	.local	__gcov0.create_code_index
	.comm	__gcov0.create_code_index,16,16
	.local	__gcov0.find_id_by_code
	.comm	__gcov0.find_id_by_code,24,16
	.local	__gcov0.create_neighbor_index
	.comm	__gcov0.create_neighbor_index,40,32
	.local	__gcov0.are_neighbors
	.comm	__gcov0.are_neighbors,24,16
	.local	__gcov0.get_b_var_index
	.comm	__gcov0.get_b_var_index,32,32
	.local	__gcov0.get_var_index
	.comm	__gcov0.get_var_index,32,32
	.local	__gcov0.init_adjMatrix
	.comm	__gcov0.init_adjMatrix,40,32
	.local	__gcov0.floydWarshall
	.comm	__gcov0.floydWarshall,88,32
	.local	__gcov0.add_population_constraints
	.comm	__gcov0.add_population_constraints,96,32
	.local	__gcov0.create_decision_variables
	.comm	__gcov0.create_decision_variables,120,32
	.local	__gcov0.create_b_vars
	.comm	__gcov0.create_b_vars,56,32
	.local	__gcov0.create_c_variables
	.comm	__gcov0.create_c_variables,56,32
	.local	__gcov0.add_c_constraints
	.comm	__gcov0.add_c_constraints,224,32
	.local	__gcov0.add_objective_function
	.comm	__gcov0.add_objective_function,96,32
	.local	__gcov0.add_force_assignment_constraint
	.comm	__gcov0.add_force_assignment_constraint,72,32
	.local	__gcov0.add_basic_constraints
	.comm	__gcov0.add_basic_constraints,72,32
	.local	__gcov0.add_at_least_one_unit_per_cluster_constraints
	.comm	__gcov0.add_at_least_one_unit_per_cluster_constraints,72,32
	.local	__gcov0.create_contiguity_constraints
	.comm	__gcov0.create_contiguity_constraints,168,32
	.local	__gcov0.print_adjMatrix
	.comm	__gcov0.print_adjMatrix,48,32
	.local	__gcov0.print_distMatrix
	.comm	__gcov0.print_distMatrix,48,32
	.local	__gcov0.add_contiguity_constraints2
	.comm	__gcov0.add_contiguity_constraints2,216,32
	.local	__gcov0.parse_var_name
	.comm	__gcov0.parse_var_name,24,16
	.local	__gcov0.create_initial_clusters
	.comm	__gcov0.create_initial_clusters,24,16
	.local	__gcov0.add_fixed_cluster_constraints
	.comm	__gcov0.add_fixed_cluster_constraints,88,32
	.local	__gcov0.runILP
	.comm	__gcov0.runILP,504,32
	.local	__gcov0.runILP_only
	.comm	__gcov0.runILP_only,416,32
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC19:
	.long	0
	.long	1072693248
	.long	0
	.long	-1074790400
	.section	.rodata.cst8
	.align 8
.LC21:
	.long	0
	.long	-1074790400
	.section	.rodata.cst16
	.align 16
.LC22:
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.section	.rodata.cst8
	.align 8
.LC38:
	.long	0
	.long	1080950784
	.align 8
.LC50:
	.long	0
	.long	1071644672
	.align 8
.LC55:
	.long	0
	.long	1087476736
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
