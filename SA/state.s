	.file	"state.c"
	.text
	.p2align 4
	.globl	population_bounds
	.type	population_bounds, @function
population_bounds:
.LFB40:
	.cfi_startproc
	endbr64
	movq	%rdx, %r10
	testl	%r9d, %r9d
	jle	.L4
	leal	-1(%r9), %eax
	leaq	8(%rdi,%rax,8), %r9
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movq	(%rdi), %rdx
	addq	$8, %rdi
	addl	8(%rdx), %eax
	cmpq	%rdi, %r9
	jne	.L3
	cltd
	idivl	%r8d
	imull	%eax, %esi
	movslq	%esi, %rdx
	sarl	$31, %esi
	imulq	$1374389535, %rdx, %rdx
	sarq	$37, %rdx
	subl	%esi, %edx
	movl	%eax, %esi
	subl	%edx, %esi
	addl	%edx, %eax
	movl	%esi, (%r10)
	movl	%eax, (%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%eax, %eax
	xorl	%esi, %esi
	movl	%esi, (%r10)
	movl	%eax, (%rcx)
	ret
	.cfi_endproc
.LFE40:
	.size	population_bounds, .-population_bounds
	.p2align 4
	.globl	compactness
	.type	compactness, @function
compactness:
.LFB41:
	.cfi_startproc
	endbr64
	movl	8(%rdi), %edx
	testl	%edx, %edx
	jle	.L15
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leal	-1(%rdx), %eax
	xorl	%r11d, %r11d
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	(%rdi), %r10
	leaq	8(%r10,%rax,8), %rsi
	movq	%r10, %rbp
	.p2align 4,,10
	.p2align 3
.L14:
	movq	0(%rbp), %rbx
	movl	12(%rbx), %eax
	testl	%eax, %eax
	jle	.L9
	subl	$1, %eax
	movq	16(%rbx), %r9
	xorl	%edi, %edi
	leaq	4(,%rax,4), %r8
	.p2align 4,,10
	.p2align 3
.L13:
	movl	(%r9,%rdi), %ecx
	movq	%r10, %rax
	.p2align 4,,10
	.p2align 3
.L12:
	movq	(%rax), %rdx
	cmpl	(%rdx), %ecx
	je	.L23
	addq	$8, %rax
	cmpq	%rsi, %rax
	jne	.L12
	addq	$4, %rdi
	cmpq	%r8, %rdi
	jne	.L13
.L9:
	addq	$8, %rbp
	cmpq	%rsi, %rbp
	jne	.L14
	movl	%r11d, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	.cfi_restore_state
	movq	24(%rbx), %rax
	addl	(%rax,%rdi), %r11d
	addq	$4, %rdi
	cmpq	%r8, %rdi
	jne	.L13
	jmp	.L9
.L15:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	xorl	%r11d, %r11d
	movl	%r11d, %eax
	ret
	.cfi_endproc
.LFE41:
	.size	compactness, .-compactness
	.p2align 4
	.globl	energy_population
	.type	energy_population, @function
energy_population:
.LFB42:
	.cfi_startproc
	endbr64
	movl	%edx, %r10d
	testl	%r8d, %r8d
	jle	.L32
	leal	-1(%r8), %eax
	movq	%rdi, %r9
	leaq	(%rdi,%rax,8), %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L26:
	movq	(%r9), %rdx
	addl	8(%rdx), %eax
	movq	%r9, %rdx
	addq	$8, %r9
	cmpq	%rdx, %rdi
	jne	.L26
	cltd
	idivl	%ecx
	movl	%r10d, %edx
	imull	%eax, %edx
	movl	%eax, %r9d
	movslq	%edx, %rdi
	sarl	$31, %edx
	imulq	$1374389535, %rdi, %rdi
	sarq	$37, %rdi
	subl	%edx, %edi
	subl	%edi, %r9d
	addl	%eax, %edi
	testl	%ecx, %ecx
	jle	.L33
.L37:
	leal	-1(%rcx), %eax
	xorl	%r8d, %r8d
	salq	$4, %rax
	leaq	16(%rsi,%rax), %r10
	.p2align 4,,10
	.p2align 3
.L28:
	movl	8(%rsi), %eax
	xorl	%edx, %edx
	testl	%eax, %eax
	jle	.L31
	movq	(%rsi), %rcx
	leal	-1(%rax), %edx
	leaq	8(%rcx), %rax
	leaq	(%rax,%rdx,8), %r11
	xorl	%edx, %edx
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L36:
	addq	$8, %rax
.L29:
	movq	(%rcx), %rcx
	addl	8(%rcx), %edx
	movq	%rax, %rcx
	cmpq	%rax, %r11
	jne	.L36
.L31:
	movl	%edx, %eax
	subl	%edi, %edx
	subl	%r9d, %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %eax
	subl	%ecx, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	cmpl	%edx, %eax
	cmovle	%eax, %edx
	addq	$16, %rsi
	addl	%edx, %r8d
	cmpq	%rsi, %r10
	jne	.L28
	movl	%r8d, %eax
	ret
.L32:
	xorl	%edi, %edi
	xorl	%r9d, %r9d
	testl	%ecx, %ecx
	jg	.L37
.L33:
	xorl	%r8d, %r8d
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE42:
	.size	energy_population, .-energy_population
	.p2align 4
	.globl	energy_compactness
	.type	energy_compactness, @function
energy_compactness:
.LFB43:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	testl	%esi, %esi
	jle	.L48
	leal	-1(%rsi), %eax
	xorl	%r12d, %r12d
	salq	$4, %rax
	leaq	16(%rdi,%rax), %rbp
	.p2align 4,,10
	.p2align 3
.L47:
	movl	8(%rdi), %eax
	testl	%eax, %eax
	jle	.L40
	movq	(%rdi), %r9
	subl	$1, %eax
	xorl	%r8d, %r8d
	leaq	8(%r9,%rax,8), %r10
	movq	%r9, %rcx
	.p2align 4,,10
	.p2align 3
.L46:
	movq	(%rcx), %rsi
	movl	12(%rsi), %eax
	testl	%eax, %eax
	jle	.L41
	subl	$1, %eax
	movq	16(%rsi), %r11
	leaq	4(,%rax,4), %rbx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L42:
	movl	(%r11,%rax), %r13d
	movq	%r9, %rdx
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L43:
	addq	$8, %rdx
	cmpq	%rdx, %r10
	je	.L44
.L45:
	movq	(%rdx), %r14
	cmpl	(%r14), %r13d
	jne	.L43
	movq	24(%rsi), %rdx
	addl	(%rdx,%rax), %r8d
.L44:
	addq	$4, %rax
	cmpq	%rbx, %rax
	jne	.L42
.L41:
	addq	$8, %rcx
	cmpq	%rcx, %r10
	jne	.L46
	addl	%r8d, %r12d
.L40:
	addq	$16, %rdi
	cmpq	%rbp, %rdi
	jne	.L47
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%r12d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	.cfi_restore_state
	xorl	%r12d, %r12d
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE43:
	.size	energy_compactness, .-energy_compactness
	.p2align 4
	.globl	energy
	.type	energy, @function
energy:
.LFB44:
	.cfi_startproc
	endbr64
	testl	%ecx, %ecx
	jle	.L59
	leal	-1(%rcx), %eax
	movq	%rsi, %rdi
	xorl	%r8d, %r8d
	salq	$4, %rax
	leaq	16(%rsi,%rax), %r9
	.p2align 4,,10
	.p2align 3
.L55:
	movl	8(%rdi), %eax
	movl	$80306, %edx
	testl	%eax, %eax
	jle	.L58
	movq	(%rdi), %rcx
	leal	-1(%rax), %edx
	leaq	8(%rcx), %rax
	leaq	(%rax,%rdx,8), %rsi
	xorl	%edx, %edx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L62:
	addq	$8, %rax
.L56:
	movq	(%rcx), %rcx
	addl	8(%rcx), %edx
	movq	%rax, %rcx
	cmpq	%rax, %rsi
	jne	.L62
	subl	$80306, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	xorl	%eax, %edx
	subl	%eax, %edx
.L58:
	addq	$16, %rdi
	addl	%edx, %r8d
	cmpq	%rdi, %r9
	jne	.L55
	movl	%r8d, %eax
	ret
.L59:
	xorl	%r8d, %r8d
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE44:
	.size	energy, .-energy
	.p2align 4
	.globl	energy2
	.type	energy2, @function
energy2:
.LFB45:
	.cfi_startproc
	endbr64
	movl	%edx, %r9d
	testl	%r8d, %r8d
	jle	.L71
	leal	-1(%r8), %eax
	leaq	(%rdi,%rax,8), %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L65:
	movq	(%rdi), %rdx
	addl	8(%rdx), %eax
	movq	%rdi, %rdx
	addq	$8, %rdi
	cmpq	%rdx, %r8
	jne	.L65
	cltd
	movl	%r9d, %edi
	idivl	%ecx
	imull	%eax, %edi
	movl	%eax, %r9d
	movslq	%edi, %rdx
	sarl	$31, %edi
	imulq	$1374389535, %rdx, %rdx
	sarq	$37, %rdx
	subl	%edi, %edx
	subl	%edx, %r9d
	addl	%edx, %eax
.L64:
	testl	%ecx, %ecx
	jle	.L74
	leal	-1(%rcx), %edx
	xorl	%ecx, %ecx
	salq	$4, %rdx
	leaq	16(%rsi,%rdx), %r10
.L67:
	movl	8(%rsi), %edx
	testl	%edx, %edx
	jle	.L70
	movq	(%rsi), %rdi
	leal	-1(%rdx), %r8d
	leaq	8(%rdi), %rdx
	leaq	(%rdx,%r8,8), %r8
	jmp	.L68
	.p2align 4,,10
	.p2align 3
.L77:
	addq	$8, %rdx
.L68:
	movq	(%rdi), %rdi
	addl	8(%rdi), %ecx
	movq	%rdx, %rdi
	cmpq	%rdx, %r8
	jne	.L77
.L70:
	cmpl	%r9d, %ecx
	jl	.L73
	cmpl	%eax, %ecx
	jg	.L73
	addq	$16, %rsi
	cmpq	%rsi, %r10
	jne	.L67
.L74:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L73:
	xorl	%eax, %eax
	ret
.L71:
	xorl	%eax, %eax
	xorl	%r9d, %r9d
	jmp	.L64
	.cfi_endproc
.LFE45:
	.size	energy2, .-energy2
	.p2align 4
	.globl	is_neighbor
	.type	is_neighbor, @function
is_neighbor:
.LFB46:
	.cfi_startproc
	endbr64
	movl	12(%rdi), %ecx
	testl	%ecx, %ecx
	jle	.L81
	movq	16(%rdi), %rax
	subl	$1, %ecx
	movl	(%rsi), %edx
	leaq	4(%rax,%rcx,4), %rcx
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L84:
	addq	$4, %rax
	cmpq	%rcx, %rax
	je	.L81
.L80:
	cmpl	%edx, (%rax)
	jne	.L84
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE46:
	.size	is_neighbor, .-is_neighbor
	.p2align 4
	.globl	first_cluster
	.type	first_cluster, @function
first_cluster:
.LFB47:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
	movl	%edx, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	xorl	%edi, %edi
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
	movl	%esi, %ebx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	%esi, 16(%rsp)
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movslq	%ebx, %rdi
	salq	$4, %rdi
	call	malloc@PLT
	movq	%rax, 24(%rsp)
	testl	%ebx, %ebx
	jle	.L86
	subl	$1, %ebx
	movslq	%r15d, %rbp
	movq	%rax, %r12
	addq	$1, %rbx
	salq	$3, %rbp
	salq	$4, %rbx
	addq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L87:
	movq	%rbp, %rdi
	addq	$16, %r12
	call	malloc@PLT
	movl	$0, -8(%r12)
	movq	%rax, -16(%r12)
	cmpq	%rbx, %r12
	jne	.L87
	movq	24(%rsp), %rax
	xorl	%ebp, %ebp
	leaq	8(%rax), %rbx
	.p2align 4,,10
	.p2align 3
.L92:
	call	rand@PLT
	cltd
	idivl	%r15d
	movslq	%edx, %rdx
	leaq	(%r14,%rdx,8), %r12
	movq	(%r12), %rax
	cmpb	$0, 32(%rax)
	je	.L112
	movl	$0, (%rbx)
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L112:
	movb	$1, 32(%rax)
	movq	-8(%rbx), %r13
	movl	$40, %edi
	movl	%ebp, 36(%rax)
	call	malloc@PLT
	movq	%rax, 0(%r13)
	movq	(%r12), %rax
	movq	%rax, 0(%r13)
	movq	(%r12), %rax
	movl	$1, (%rbx)
	cmpb	$0, 32(%rax)
	je	.L92
	addl	$1, %ebp
	addq	$16, %rbx
	cmpl	%ebp, 16(%rsp)
	jne	.L92
.L86:
	movl	16(%rsp), %eax
	movl	%eax, 4(%rsp)
	cmpl	%r15d, %eax
	jge	.L85
	.p2align 4,,10
	.p2align 3
.L93:
	call	rand@PLT
	cltd
	idivl	%r15d
	movslq	%edx, %rdx
	leaq	(%r14,%rdx,8), %rbx
	movq	(%rbx), %rax
	cmpb	$0, 32(%rax)
	jne	.L93
	movb	$1, 32(%rax)
	call	rand@PLT
	cltd
	idivl	16(%rsp)
	movslq	%edx, %rax
	movl	%edx, 20(%rsp)
	salq	$4, %rax
	addq	24(%rsp), %rax
	movl	8(%rax), %r13d
	movq	%rax, 8(%rsp)
	testl	%r13d, %r13d
	jle	.L105
	movq	(%rbx), %r10
	movq	(%rax), %rbp
	leal	-1(%r13), %r12d
	xorl	%esi, %esi
	movl	12(%r10), %r11d
	leal	-1(%r11), %r9d
	salq	$2, %r9
	.p2align 4,,10
	.p2align 3
.L103:
	movq	0(%rbp,%rsi,8), %rax
	movl	%esi, %r8d
	movl	%esi, %edi
	testl	%r11d, %r11d
	jle	.L97
	movl	(%rax), %edx
	movq	16(%r10), %rax
	leaq	4(%rax,%r9), %rcx
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L113:
	addq	$4, %rax
	cmpq	%rcx, %rax
	je	.L97
.L99:
	cmpl	%edx, (%rax)
	jne	.L113
	movslq	%r13d, %rax
	addl	$1, %r13d
	movq	%r10, 0(%rbp,%rax,8)
	movq	8(%rsp), %rax
	movl	%r13d, 8(%rax)
	movl	20(%rsp), %eax
	movl	%eax, 36(%r10)
.L96:
	cmpl	%edi, %r13d
	je	.L100
	addl	$1, 4(%rsp)
	movl	4(%rsp), %eax
	cmpl	%eax, %r15d
	jg	.L93
.L85:
	movq	24(%rsp), %rax
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
.L97:
	.cfi_restore_state
	leal	1(%r8), %edi
	leaq	1(%rsi), %rax
	cmpq	%r12, %rsi
	je	.L96
	movq	%rax, %rsi
	jmp	.L103
.L100:
	movq	(%rbx), %rax
	movb	$0, 32(%rax)
	cmpl	4(%rsp), %r15d
	jg	.L93
	jmp	.L85
.L105:
	xorl	%edi, %edi
	jmp	.L96
	.cfi_endproc
.LFE47:
	.size	first_cluster, .-first_cluster
	.p2align 4
	.globl	change_unit_x
	.type	change_unit_x, @function
change_unit_x:
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
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	call	rand@PLT
	cltd
	idivl	%r12d
	movslq	%edx, %rbp
	call	rand@PLT
	movq	%rbp, %r13
	salq	$4, %rbp
	addq	%rbx, %rbp
	cltd
	idivl	8(%rbp)
	movq	0(%rbp), %rdi
	movq	%rdi, 8(%rsp)
	movslq	%edx, %rax
	movl	%edx, 4(%rsp)
	salq	$3, %rax
	addq	%rax, %rdi
	movq	%rax, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movq	(%rdi), %r8
	testl	%r12d, %r12d
	jle	.L114
	movq	%rbx, %r11
	xorl	%ebx, %ebx
.L120:
	cmpl	%r13d, %ebx
	je	.L116
	movl	8(%r11), %r14d
	testl	%r14d, %r14d
	jle	.L116
	movl	12(%r8), %r9d
	movq	(%r11), %r15
	leal	-1(%r14), %eax
	leal	-1(%r9), %edi
	movq	%r15, %rsi
	leaq	8(%r15,%rax,8), %r10
	salq	$2, %rdi
	.p2align 4,,10
	.p2align 3
.L123:
	movq	(%rsi), %rax
	testl	%r9d, %r9d
	jle	.L117
	movl	(%rax), %edx
	movq	16(%r8), %rax
	leaq	4(%rdi,%rax), %rcx
	jmp	.L119
	.p2align 4,,10
	.p2align 3
.L128:
	addq	$4, %rax
	cmpq	%rax, %rcx
	je	.L117
.L119:
	cmpl	%edx, (%rax)
	jne	.L128
	movslq	%r14d, %rax
	addl	$1, %r14d
	movq	%r8, (%r15,%rax,8)
	movl	%r14d, 8(%r11)
	movl	8(%rbp), %eax
	movl	%ebx, 36(%r8)
	leal	-1(%rax), %ebx
	cmpl	%ebx, 4(%rsp)
	jge	.L122
	subl	$2, %eax
	subl	4(%rsp), %eax
	movq	16(%rsp), %rdi
	leaq	8(,%rax,8), %rdx
	movq	8(%rsp), %rax
	leaq	8(%rax,%rdi), %rsi
	movq	24(%rsp), %rdi
	call	memmove@PLT
.L122:
	movl	%ebx, 8(%rbp)
.L114:
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
.L117:
	.cfi_restore_state
	addq	$8, %rsi
	cmpq	%rsi, %r10
	jne	.L123
.L116:
	addl	$1, %ebx
	addq	$16, %r11
	cmpl	%ebx, %r12d
	jne	.L120
	addq	$40, %rsp
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
	.cfi_endproc
.LFE48:
	.size	change_unit_x, .-change_unit_x
	.p2align 4
	.globl	change_unit
	.type	change_unit, @function
change_unit:
.LFB49:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%ecx, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	call	rand@PLT
	cltd
	idivl	%r14d
	movslq	%edx, %rbx
	movq	%rbx, %r12
	salq	$4, %rbx
	addq	%r15, %rbx
	cmpl	$1, 8(%rbx)
	jne	.L130
	.p2align 4,,10
	.p2align 3
.L131:
	call	rand@PLT
	cltd
	idivl	%r14d
	movslq	%edx, %rbx
	movq	%rbx, %r12
	salq	$4, %rbx
	addq	16(%rsp), %rbx
	cmpl	$1, 8(%rbx)
	je	.L131
.L130:
	call	rand@PLT
	cltd
	idivl	8(%rbx)
	movslq	%edx, %rax
	movl	%edx, 36(%rsp)
	movq	(%rbx), %rdx
	leaq	0(,%rax,8), %rsi
	movq	(%rdx,%rax,8), %r15
	movq	%rsi, 40(%rsp)
	movslq	12(%r15), %rdi
	movl	%edi, 28(%rsp)
	movq	%rdi, %r14
	salq	$2, %rdi
	call	malloc@PLT
	movl	%r14d, %edi
	movq	%rax, %r13
	testl	%r14d, %r14d
	jle	.L132
	leal	-1(%r14), %eax
	movl	%eax, 32(%rsp)
	cmpl	$2, %eax
	jbe	.L146
	shrl	$2, %edi
	movdqa	.LC0(%rip), %xmm0
	movdqa	.LC1(%rip), %xmm2
	movq	%r13, %rax
	movl	%edi, %edx
	salq	$4, %rdx
	addq	%r13, %rdx
	.p2align 4,,10
	.p2align 3
.L134:
	movdqa	%xmm0, %xmm1
	addq	$16, %rax
	paddd	%xmm2, %xmm0
	movups	%xmm1, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L134
	movl	28(%rsp), %esi
	movl	%esi, %eax
	andl	$-4, %eax
	andl	$3, %esi
	je	.L135
.L133:
	movslq	%eax, %rdx
	movl	28(%rsp), %edi
	movl	%eax, 0(%r13,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edi, %edx
	jge	.L135
	movslq	%edx, %rcx
	addl	$2, %eax
	movl	%edx, 0(%r13,%rcx,4)
	cmpl	%edi, %eax
	jge	.L135
	movslq	%eax, %rdx
	movl	%eax, 0(%r13,%rdx,4)
.L135:
	movl	32(%rsp), %eax
	testl	%eax, %eax
	je	.L136
	movslq	%eax, %r14
	.p2align 4,,10
	.p2align 3
.L137:
	call	rand@PLT
	leal	1(%r14), %edi
	movl	0(%r13,%r14,4), %esi
	cltd
	idivl	%edi
	movslq	%edx, %rdx
	leaq	0(%r13,%rdx,4), %rax
	movl	(%rax), %edx
	movl	%edx, 0(%r13,%r14,4)
	subq	$1, %r14
	movl	%esi, (%rax)
	testl	%r14d, %r14d
	jg	.L137
	movl	28(%rsp), %eax
	testl	%eax, %eax
	jle	.L132
.L136:
	movl	32(%rsp), %edx
	movq	8(%rsp), %rsi
	movq	%r13, %rax
	leaq	4(%r13,%rdx,4), %r11
	leal	-1(%rbp), %edx
	leaq	8(%rsi,%rdx,8), %rdi
	.p2align 4,,10
	.p2align 3
.L138:
	testl	%ebp, %ebp
	jle	.L142
	movq	16(%r15), %rdx
	movslq	(%rax), %rcx
	movl	(%rdx,%rcx,4), %esi
	movq	8(%rsp), %rdx
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L156:
	addq	$8, %rdx
	cmpq	%rdx, %rdi
	je	.L142
.L140:
	movq	(%rdx), %rcx
	cmpl	%esi, (%rcx)
	jne	.L156
	movl	36(%rcx), %r14d
	cmpl	%r12d, %r14d
	jne	.L157
.L142:
	addq	$4, %rax
	cmpq	%rax, %r11
	jne	.L138
.L132:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rdi
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
	jmp	free@PLT
.L157:
	.cfi_restore_state
	movq	%r13, %rdi
	call	free@PLT
	movq	16(%rsp), %r13
	movslq	%r14d, %rax
	salq	$4, %rax
	addq	%rax, %r13
	movslq	8(%r13), %rcx
	movq	0(%r13), %rdx
	movq	%rcx, %rax
	movq	%r15, (%rdx,%rcx,8)
	addl	$1, %eax
	movl	%eax, 8(%r13)
	movl	8(%rbx), %eax
	movl	%r14d, 36(%r15)
	leal	-1(%rax), %ebp
	cmpl	%ebp, 36(%rsp)
	jge	.L144
	subl	$2, %eax
	subl	36(%rsp), %eax
	movq	(%rbx), %rdx
	leaq	8(,%rax,8), %r8
	movq	40(%rsp), %rax
	leaq	8(%rdx,%rax), %rsi
	leaq	(%rdx,%rax), %rdi
	movq	%r8, %rdx
	call	memmove@PLT
.L144:
	movl	%ebp, 8(%rbx)
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
.L146:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L133
	.cfi_endproc
.LFE49:
	.size	change_unit, .-change_unit
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Cluster %d with size %d: "
.LC3:
	.string	"%d "
.LC4:
	.string	"\n"
.LC5:
	.string	"--------------\n"
	.text
	.p2align 4
	.globl	transitionBound
	.type	transitionBound, @function
transitionBound:
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%edi, %edi
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%edx, %r13d
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
	movl	%ecx, %ebx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%rsi, 16(%rsp)
	movl	%ecx, 24(%rsp)
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movslq	%r13d, %rdi
	salq	$4, %rdi
	call	malloc@PLT
	testl	%r13d, %r13d
	jle	.L159
	movslq	%ebx, %rbp
	leal	-1(%r13), %ebx
	movq	%rax, %r14
	addq	$1, %rbx
	salq	$3, %rbp
	salq	$4, %rbx
	addq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L160:
	movq	%rbp, %rdi
	addq	$16, %r14
	call	malloc@PLT
	movl	$0, -8(%r14)
	movq	%rax, -16(%r14)
	cmpq	%rbx, %r14
	jne	.L160
	movl	24(%rsp), %edx
	movq	16(%rsp), %rdi
	movl	%r13d, %esi
	xorl	%ebp, %ebp
	leaq	.LC3(%rip), %rbx
	call	first_cluster
	movq	%rax, 8(%rsp)
	leaq	8(%rax), %r15
	.p2align 4,,10
	.p2align 3
.L164:
	movl	(%r15), %ecx
	movl	%ebp, %edx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	(%r15), %ecx
	testl	%ecx, %ecx
	jle	.L162
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L163:
	movq	-8(%r15), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	(%rax,%r14,8), %rax
	addq	$1, %r14
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	%r14d, (%r15)
	jg	.L163
.L162:
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	addl	$1, %ebp
	addq	$16, %r15
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%ebp, %r13d
	jne	.L164
.L174:
	movl	$4, 28(%rsp)
	leaq	.LC3(%rip), %rbx
.L169:
	movq	8(%rsp), %r15
	movq	16(%rsp), %rsi
	movl	%r13d, %edx
	movl	24(%rsp), %ecx
	movq	%r15, %rdi
	call	change_unit
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	.LC5(%rip), %rsi
	call	__printf_chk@PLT
	testl	%r13d, %r13d
	jle	.L165
	leaq	8(%r15), %r15
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L168:
	movl	(%r15), %ecx
	movl	%ebp, %edx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	(%r15), %edx
	testl	%edx, %edx
	jle	.L166
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L167:
	movq	-8(%r15), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	(%rax,%r14,8), %rax
	addq	$1, %r14
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	cmpl	%r14d, (%r15)
	jg	.L167
.L166:
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	addl	$1, %ebp
	addq	$16, %r15
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%ebp, %r13d
	jne	.L168
.L165:
	subl	$1, 28(%rsp)
	jne	.L169
	testl	%r13d, %r13d
	jle	.L170
	movq	8(%rsp), %rax
	xorl	%r15d, %r15d
	leaq	.LC3(%rip), %rbp
	leaq	8(%rax), %r14
	.p2align 4,,10
	.p2align 3
.L173:
	movl	(%r14), %r8d
	movl	%r15d, %ecx
	leaq	.LC2(%rip), %rdx
	movq	%r12, %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	(%r14), %eax
	testl	%eax, %eax
	jle	.L171
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L172:
	movq	-8(%r14), %rax
	movq	%rbp, %rdx
	movl	$1, %esi
	movq	%r12, %rdi
	movq	(%rax,%rbx,8), %rax
	addq	$1, %rbx
	movl	(%rax), %ecx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	cmpl	%ebx, (%r14)
	jg	.L172
.L171:
	leaq	.LC4(%rip), %rdx
	movq	%r12, %rdi
	xorl	%eax, %eax
	addl	$1, %r15d
	movl	$1, %esi
	addq	$16, %r14
	call	__fprintf_chk@PLT
	cmpl	%r15d, %r13d
	jne	.L173
.L170:
	movq	%r12, %rdi
	call	fclose@PLT
	movq	8(%rsp), %rax
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
.L159:
	.cfi_restore_state
	movl	24(%rsp), %edx
	movq	16(%rsp), %rdi
	movl	%r13d, %esi
	call	first_cluster
	movq	%rax, 8(%rsp)
	jmp	.L174
	.cfi_endproc
.LFE50:
	.size	transitionBound, .-transitionBound
	.p2align 4
	.globl	storeState
	.type	storeState, @function
storeState:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %r14
	movslq	%esi, %rdi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	salq	$4, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movslq	%edx, %rbx
	call	malloc@PLT
	movq	%rax, %r12
	testl	%ebp, %ebp
	jle	.L186
	leaq	8(%rax), %r13
	leal	-1(%rbp), %eax
	salq	$3, %rbx
	addq	$8, %r14
	salq	$4, %rax
	leaq	24(%r12,%rax), %rbp
	.p2align 4,,10
	.p2align 3
.L194:
	movq	%rbx, %rdi
	call	malloc@PLT
	movl	(%r14), %edi
	movl	$0, 0(%r13)
	movq	%rax, -8(%r13)
	testl	%edi, %edi
	jle	.L188
	movq	-8(%r14), %rcx
	leaq	15(%rax), %rsi
	leal	-1(%rdi), %edx
	subq	%rcx, %rsi
	cmpq	$30, %rsi
	jbe	.L189
	cmpl	$3, %edx
	jbe	.L189
	movl	%edi, %esi
	xorl	%edx, %edx
	shrl	%esi
	salq	$4, %rsi
	.p2align 4,,10
	.p2align 3
.L190:
	movdqu	(%rcx,%rdx), %xmm0
	movups	%xmm0, (%rax,%rdx)
	addq	$16, %rdx
	cmpq	%rsi, %rdx
	jne	.L190
	movl	%edi, %edx
	andl	$-2, %edx
	andl	$1, %edi
	je	.L188
	movq	(%rcx,%rdx,8), %rcx
	movq	%rcx, (%rax,%rdx,8)
.L188:
	addq	$16, %r13
	addq	$16, %r14
	cmpq	%rbp, %r13
	jne	.L194
.L186:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L189:
	.cfi_restore_state
	movl	%edx, %esi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L192:
	movq	(%rcx,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	movq	%rdx, %rdi
	addq	$1, %rdx
	cmpq	%rdi, %rsi
	jne	.L192
	jmp	.L188
	.cfi_endproc
.LFE51:
	.size	storeState, .-storeState
	.p2align 4
	.globl	transitionBound_old_random_clusters
	.type	transitionBound_old_random_clusters, @function
transitionBound_old_random_clusters:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%edx, %rdi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	salq	$4, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rsi, 8(%rsp)
	call	malloc@PLT
	movq	%rax, %r13
	testl	%r12d, %r12d
	jle	.L210
	leal	-1(%r12), %ebx
	movslq	%r14d, %rbp
	movq	%rax, %r15
	addq	$1, %rbx
	salq	$3, %rbp
	salq	$4, %rbx
	addq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L209:
	movq	%rbp, %rdi
	addq	$16, %r15
	call	malloc@PLT
	movl	$0, -8(%r15)
	movq	%rax, -16(%r15)
	cmpq	%rbx, %r15
	jne	.L209
.L210:
	testl	%r14d, %r14d
	jg	.L222
.L205:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rax
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
.L222:
	.cfi_restore_state
	call	rand@PLT
	movq	8(%rsp), %rsi
	cltd
	idivl	%r12d
	movq	(%rsi), %rdi
	movslq	%edx, %rdx
	salq	$4, %rdx
	leaq	0(%r13,%rdx), %rax
	movl	8(%rax), %edx
	movq	(%rax), %rcx
	movslq	%edx, %rsi
	addl	$1, %edx
	movq	%rdi, (%rcx,%rsi,8)
	movl	%edx, 8(%rax)
	cmpl	$1, %r14d
	je	.L205
	leal	-2(%r14), %ebp
	movl	$1, %ebx
	addq	$2, %rbp
.L215:
	call	rand@PLT
	cltd
	idivl	%r12d
	movq	8(%rsp), %rax
	movq	(%rax,%rbx,8), %rcx
	xorl	%eax, %eax
	movslq	%edx, %rdx
	salq	$4, %rdx
	leaq	0(%r13,%rdx), %rsi
	movq	(%rsi), %rdx
	jmp	.L214
	.p2align 4,,10
	.p2align 3
.L212:
	addq	$1, %rax
	cmpl	%eax, %ebx
	jle	.L221
.L214:
	cmpq	%rcx, (%rdx,%rax,8)
	jne	.L212
.L221:
	movslq	8(%rsi), %rdi
	addq	$1, %rbx
	movq	%rdi, %rax
	movq	%rcx, (%rdx,%rdi,8)
	addl	$1, %eax
	movl	%eax, 8(%rsi)
	cmpq	%rbx, %rbp
	je	.L205
	jmp	.L215
	.cfi_endproc
.LFE52:
	.size	transitionBound_old_random_clusters, .-transitionBound_old_random_clusters
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
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
