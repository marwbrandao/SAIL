	.file	"state.c"
	.text
	.p2align 4
	.globl	_pop_ideal
	.type	_pop_ideal, @function
_pop_ideal:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
1:	call	*mcount@GOTPCREL(%rip)
	subl	$1, %edi
	cmpl	$17, %edi
	ja	.L2
	lock addq	$1, __gcov0._pop_ideal(%rip)
	leaq	CSWTCH.8(%rip), %rax
	movl	(%rax,%rdi,4), %eax
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	.cfi_restore_state
	lock addq	$1, 8+__gcov0._pop_ideal(%rip)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE40:
	.size	_pop_ideal, .-_pop_ideal
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"populacao total: %d\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"populacao ideal deste dist: %d\n"
	.align 8
.LC4:
	.string	"populacao ideal do tiago: %d com margens de %d e %d\n"
	.text
	.p2align 4
	.globl	popul_test1
	.type	popul_test1, @function
popul_test1:
.LFB41:
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
	movl	%edx, %ebx
	movl	%ecx, %r13d
	lock addq	$1, __gcov0.popul_test1(%rip)
	testl	%esi, %esi
	jle	.L7
	leal	-1(%rsi), %eax
	xorl	%r12d, %r12d
	leaq	8(%rdi,%rax,8), %rdx
	.p2align 4,,10
	.p2align 3
.L6:
	movq	(%rdi), %rax
	addl	8(%rax), %r12d
	lock addq	$1, 8+__gcov0.popul_test1(%rip)
	addq	$8, %rdi
	cmpq	%rdx, %rdi
	jne	.L6
.L5:
	movl	%r12d, %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 16+__gcov0.popul_test1(%rip)
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	movl	%r12d, %eax
	cltd
	idivl	%ebx
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 24+__gcov0.popul_test1(%rip)
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	xorl	%eax, %eax
	movsd	.LC2(%rip), %xmm1
	leaq	.LC4(%rip), %rsi
	cvtsi2sdl	%r13d, %xmm0
	movl	%r13d, %edx
	mulsd	%xmm0, %xmm1
	mulsd	.LC3(%rip), %xmm0
	cvttsd2sil	%xmm1, %r8d
	cvttsd2sil	%xmm0, %ecx
	call	__printf_chk@PLT
	lock addq	$1, 32+__gcov0.popul_test1(%rip)
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L5
	.cfi_endproc
.LFE41:
	.size	popul_test1, .-popul_test1
	.p2align 4
	.globl	population_bounds
	.type	population_bounds, @function
population_bounds:
.LFB42:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
1:	call	*mcount@GOTPCREL(%rip)
	movl	16(%rbp), %edi
	lock addq	$1, __gcov0.population_bounds(%rip)
	popq	%rbp
	.cfi_def_cfa 7, 8
	imull	%edi, %esi
	movslq	%esi, %rax
	sarl	$31, %esi
	imulq	$1374389535, %rax, %rax
	sarq	$37, %rax
	subl	%esi, %eax
	movl	%edi, %esi
	subl	%eax, %esi
	addl	%edi, %eax
	movl	%esi, (%rdx)
	movl	%eax, (%rcx)
	ret
	.cfi_endproc
.LFE42:
	.size	population_bounds, .-population_bounds
	.p2align 4
	.globl	compactness_s
	.type	compactness_s, @function
compactness_s:
.LFB43:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, %r12
	lock addq	$1, __gcov0.compactness_s(%rip)
	movl	8(%rdi), %r9d
	testl	%r9d, %r9d
	jle	.L18
	xorl	%ebx, %ebx
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L17:
	movq	(%r12), %r8
	movq	(%r8,%rbx,8), %rsi
	lock addq	$1, 8+__gcov0.compactness_s(%rip)
	movl	12(%rsi), %eax
	testl	%eax, %eax
	jle	.L12
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L16:
	leaq	0(,%r10,4), %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L15:
	movq	(%r8,%rax,8), %rdx
	movq	16(%rsi), %rcx
	movl	(%rdx), %edx
	cmpl	%edx, (%rcx,%rdi)
	je	.L22
	lock addq	$1, 24+__gcov0.compactness_s(%rip)
	addq	$1, %rax
	cmpl	%eax, %r9d
	jg	.L15
.L14:
	lock addq	$1, 32+__gcov0.compactness_s(%rip)
	addq	$1, %r10
	cmpl	%r10d, 12(%rsi)
	jg	.L16
.L12:
	movl	8(%r12), %r9d
	addq	$1, %rbx
	cmpl	%ebx, %r9d
	jg	.L17
	popq	%rbx
	movl	%r11d, %eax
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L22:
	.cfi_restore_state
	lock addq	$1, 16+__gcov0.compactness_s(%rip)
	movq	24(%rsi), %rax
	addl	(%rax,%rdi), %r11d
	jmp	.L14
.L18:
	xorl	%r11d, %r11d
	popq	%rbx
	popq	%r12
	movl	%r11d, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE43:
	.size	compactness_s, .-compactness_s
	.p2align 4
	.globl	compactness
	.type	compactness, @function
compactness:
.LFB44:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, %r12
	lock addq	$1, __gcov0.compactness(%rip)
	movl	8(%rdi), %r9d
	testl	%r9d, %r9d
	jle	.L31
	xorl	%ebx, %ebx
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L30:
	movq	(%r12), %r8
	movq	(%r8,%rbx,8), %rsi
	lock addq	$1, 8+__gcov0.compactness(%rip)
	movl	12(%rsi), %eax
	testl	%eax, %eax
	jle	.L25
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L29:
	leaq	0(,%r10,4), %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L28:
	movq	(%r8,%rax,8), %rdx
	movq	16(%rsi), %rcx
	movl	(%rdx), %edx
	cmpl	%edx, (%rcx,%rdi)
	je	.L35
	lock addq	$1, 24+__gcov0.compactness(%rip)
	addq	$1, %rax
	cmpl	%eax, %r9d
	jg	.L28
.L27:
	lock addq	$1, 40+__gcov0.compactness(%rip)
	addq	$1, %r10
	cmpl	%r10d, 12(%rsi)
	jg	.L29
.L25:
	movl	8(%r12), %r9d
	addq	$1, %rbx
	cmpl	%ebx, %r9d
	jg	.L30
	popq	%rbx
	movl	%r11d, %eax
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L35:
	.cfi_restore_state
	lock addq	$1, 16+__gcov0.compactness(%rip)
	cmpl	(%rsi), %edx
	jle	.L27
	lock addq	$1, 32+__gcov0.compactness(%rip)
	movq	24(%rsi), %rax
	addl	(%rax,%rdi), %r11d
	jmp	.L27
.L31:
	xorl	%r11d, %r11d
	popq	%rbx
	popq	%r12
	movl	%r11d, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE44:
	.size	compactness, .-compactness
	.p2align 4
	.globl	energy_population
	.type	energy_population, @function
energy_population:
.LFB45:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
1:	call	*mcount@GOTPCREL(%rip)
	lock addq	$1, __gcov0.energy_population(%rip)
	imull	%r9d, %edx
	movl	%r9d, %r10d
	movslq	%edx, %r8
	sarl	$31, %edx
	imulq	$1374389535, %r8, %r8
	sarq	$37, %r8
	movl	%r8d, %eax
	subl	%edx, %eax
	subl	%eax, %r10d
	leal	(%r9,%rax), %r8d
	testl	%ecx, %ecx
	jle	.L43
	leal	-1(%rcx), %eax
	leaq	8(%rsi), %rdi
	xorl	%r9d, %r9d
	salq	$4, %rax
	leaq	24(%rsi,%rax), %rsi
	.p2align 4,,10
	.p2align 3
.L38:
	movl	(%rdi), %ecx
	xorl	%eax, %eax
	xorl	%edx, %edx
	testl	%ecx, %ecx
	jle	.L42
	.p2align 4,,10
	.p2align 3
.L39:
	movq	-8(%rdi), %rcx
	movq	(%rcx,%rax,8), %rcx
	addl	8(%rcx), %edx
	lock addq	$1, 8+__gcov0.energy_population(%rip)
	addq	$1, %rax
	cmpl	%eax, (%rdi)
	jg	.L39
.L42:
	cmpl	%edx, %r10d
	jge	.L40
	lock addq	$1, 16+__gcov0.energy_population(%rip)
	cmpl	%edx, %r8d
	jg	.L47
.L40:
	movl	%edx, %eax
	subl	%r8d, %edx
	subl	%r10d, %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %eax
	subl	%ecx, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	cmpl	%edx, %eax
	cmovg	%edx, %eax
	addl	%eax, %eax
	cltq
	addq	%rax, %r9
	lock addq	$1, 32+__gcov0.energy_population(%rip)
.L41:
	addq	$16, %rdi
	cmpq	%rdi, %rsi
	jne	.L38
	movq	%r9, %rax
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	.cfi_restore_state
	lock addq	$1, 24+__gcov0.energy_population(%rip)
	jmp	.L41
.L43:
	xorl	%r9d, %r9d
	popq	%rbp
	.cfi_def_cfa 7, 8
	movq	%r9, %rax
	ret
	.cfi_endproc
.LFE45:
	.size	energy_population, .-energy_population
	.p2align 4
	.globl	energy_compactness
	.type	energy_compactness, @function
energy_compactness:
.LFB46:
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
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
1:	call	*mcount@GOTPCREL(%rip)
	lock addq	$1, __gcov0.energy_compactness(%rip)
	testl	%esi, %esi
	jle	.L51
	leal	-1(%rsi), %eax
	movq	%rdi, %rbx
	xorl	%r12d, %r12d
	salq	$4, %rax
	leaq	16(%rdi,%rax), %r13
	.p2align 4,,10
	.p2align 3
.L50:
	movq	%rbx, %rdi
	call	compactness
	addl	%eax, %r12d
	lock addq	$1, 8+__gcov0.energy_compactness(%rip)
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jne	.L50
	popq	%rbx
	movl	%r12d, %eax
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L51:
	.cfi_restore_state
	xorl	%r12d, %r12d
	popq	%rbx
	movl	%r12d, %eax
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE46:
	.size	energy_compactness, .-energy_compactness
	.p2align 4
	.globl	is_neighbor
	.type	is_neighbor, @function
is_neighbor:
.LFB47:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
1:	call	*mcount@GOTPCREL(%rip)
	lock addq	$1, __gcov0.is_neighbor(%rip)
	movl	12(%rdi), %eax
	testl	%eax, %eax
	jle	.L54
	xorl	%eax, %eax
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L55:
	lock addq	$1, 16+__gcov0.is_neighbor(%rip)
	addq	$1, %rax
	cmpl	%eax, 12(%rdi)
	jle	.L54
.L57:
	movq	16(%rdi), %rdx
	movl	(%rsi), %ecx
	cmpl	%ecx, (%rdx,%rax,4)
	jne	.L55
	lock addq	$1, 8+__gcov0.is_neighbor(%rip)
	movl	$1, %eax
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L54:
	.cfi_restore_state
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE47:
	.size	is_neighbor, .-is_neighbor
	.p2align 4
	.globl	first_cluster
	.type	first_cluster, @function
first_cluster:
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
	subq	$40, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, %r12
	movl	%esi, %r15d
	movl	%edx, %ebx
	movl	%esi, -64(%rbp)
	lock addq	$1, __gcov0.first_cluster(%rip)
	xorl	%edi, %edi
	xorl	%eax, %eax
	call	time@PLT
	movl	%eax, %edi
	lock addq	$1, 8+__gcov0.first_cluster(%rip)
	call	srand@PLT
	movslq	%r15d, %rdi
	salq	$4, %rdi
	call	malloc@PLT
	movl	%r15d, %edi
	movq	%rax, -72(%rbp)
	testl	%r15d, %r15d
	jle	.L60
	leal	-1(%rdi), %r13d
	movslq	%ebx, %r14
	movq	%rax, %r15
	addq	$1, %r13
	salq	$3, %r14
	salq	$4, %r13
	addq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L61:
	movq	%r14, %rdi
	call	malloc@PLT
	movl	$0, 8(%r15)
	movq	%rax, (%r15)
	lock addq	$1, 16+__gcov0.first_cluster(%rip)
	addq	$16, %r15
	cmpq	%r13, %r15
	jne	.L61
	lock addq	$1, 24+__gcov0.first_cluster(%rip)
	movq	-72(%rbp), %rax
	leaq	8(%rax), %r13
	movl	$0, -56(%rbp)
	.p2align 4,,10
	.p2align 3
.L66:
	call	rand@PLT
	cltd
	idivl	%ebx
	movslq	%edx, %rdx
	leaq	(%r12,%rdx,8), %r14
	movq	(%r14), %rax
	cmpb	$0, 32(%rax)
	je	.L97
	movl	$0, 0(%r13)
	lock addq	$1, 40+__gcov0.first_cluster(%rip)
	movq	(%r14), %rax
	cmpb	$0, 32(%rax)
	je	.L66
.L64:
	lock addq	$1, 48+__gcov0.first_cluster(%rip)
	movl	0(%r13), %edi
	testl	%edi, %edi
	je	.L66
	lock addq	$1, 56+__gcov0.first_cluster(%rip)
	addl	$1, -56(%rbp)
	movl	-56(%rbp), %eax
	addq	$16, %r13
	cmpl	%eax, -64(%rbp)
	jne	.L66
.L80:
	lock addq	$1, 64+__gcov0.first_cluster(%rip)
	movl	-64(%rbp), %eax
	movl	%eax, -60(%rbp)
	cmpl	%ebx, %eax
	jge	.L79
	.p2align 4,,10
	.p2align 3
.L69:
	call	rand@PLT
	lock addq	$1, 72+__gcov0.first_cluster(%rip)
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L98:
	call	rand@PLT
	lock addq	$1, 80+__gcov0.first_cluster(%rip)
.L96:
	cltd
	idivl	%ebx
	movslq	%edx, %rax
	leaq	(%r12,%rax,8), %r13
	movq	0(%r13), %rax
	cmpb	$0, 32(%rax)
	jne	.L98
	lock addq	$1, 88+__gcov0.first_cluster(%rip)
	movb	$1, 32(%rax)
	call	rand@PLT
	lock addq	$1, 96+__gcov0.first_cluster(%rip)
	cltd
	idivl	-64(%rbp)
	movslq	%edx, %r10
	salq	$4, %r10
	addq	-72(%rbp), %r10
	movl	8(%r10), %r9d
	testl	%r9d, %r9d
	jle	.L82
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L74:
	movq	0(%r13), %rcx
	movq	(%r10), %r11
	movl	%r8d, %r15d
	movl	%r8d, %r14d
	xorl	%eax, %eax
	movl	12(%rcx), %esi
	movq	(%r11,%r8,8), %rdi
	testl	%esi, %esi
	jle	.L76
	movq	%r8, -56(%rbp)
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L75:
	lock addq	$1, 112+__gcov0.first_cluster(%rip)
	addq	$1, %rax
	cmpl	%eax, 12(%rcx)
	jle	.L99
.L73:
	movq	16(%rcx), %rsi
	movl	(%rdi), %r8d
	cmpl	%r8d, (%rsi,%rax,4)
	jne	.L75
	lock addq	$1, 104+__gcov0.first_cluster(%rip)
	lock addq	$1, 120+__gcov0.first_cluster(%rip)
	movslq	%r9d, %rax
	addl	$1, %r9d
	movq	%rcx, (%r11,%rax,8)
	movq	0(%r13), %rax
	movl	%r9d, 8(%r10)
	movl	%edx, 36(%rax)
.L72:
	cmpl	%r9d, %r14d
	je	.L77
.L100:
	addl	$1, -60(%rbp)
	movl	-60(%rbp), %eax
	cmpl	%eax, %ebx
	jg	.L69
.L79:
	lock addq	$1, 144+__gcov0.first_cluster(%rip)
	movq	-72(%rbp), %rax
	addq	$40, %rsp
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
.L99:
	.cfi_restore_state
	movq	-56(%rbp), %r8
.L76:
	lock addq	$1, 128+__gcov0.first_cluster(%rip)
	movl	8(%r10), %r9d
	addq	$1, %r8
	leal	1(%r15), %r14d
	cmpl	%r8d, %r9d
	jg	.L74
	cmpl	%r9d, %r14d
	jne	.L100
.L77:
	lock addq	$1, 136+__gcov0.first_cluster(%rip)
	movq	0(%r13), %rax
	movb	$0, 32(%rax)
	cmpl	-60(%rbp), %ebx
	jg	.L69
	jmp	.L79
	.p2align 4,,10
	.p2align 3
.L97:
	movl	-56(%rbp), %edi
	movq	-8(%r13), %r15
	movb	$1, 32(%rax)
	movl	%edi, 36(%rax)
	movl	$56, %edi
	call	malloc@PLT
	movq	%rax, (%r15)
	movq	(%r14), %rax
	movq	%rax, (%r15)
	movl	$1, 0(%r13)
	lock addq	$1, 32+__gcov0.first_cluster(%rip)
	movq	(%r14), %rax
	cmpb	$0, 32(%rax)
	jne	.L64
	jmp	.L66
.L82:
	xorl	%r14d, %r14d
	jmp	.L72
.L60:
	lock addq	$1, 24+__gcov0.first_cluster(%rip)
	jmp	.L80
	.cfi_endproc
.LFE48:
	.size	first_cluster, .-first_cluster
	.p2align 4
	.globl	reset_visited
	.type	reset_visited, @function
reset_visited:
.LFB49:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
1:	call	*mcount@GOTPCREL(%rip)
	lock addq	$1, __gcov0.reset_visited(%rip)
	movl	8(%rdi), %eax
	testl	%eax, %eax
	jle	.L101
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L103:
	movq	(%rdi), %rdx
	movq	(%rdx,%rax,8), %rdx
	movl	$0, 40(%rdx)
	lock addq	$1, 8+__gcov0.reset_visited(%rip)
	addq	$1, %rax
	cmpl	%eax, 8(%rdi)
	jg	.L103
.L101:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE49:
	.size	reset_visited, .-reset_visited
	.p2align 4
	.globl	has_neighbor_in_cluster
	.type	has_neighbor_in_cluster, @function
has_neighbor_in_cluster:
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
1:	call	*mcount@GOTPCREL(%rip)
	lock addq	$1, __gcov0.has_neighbor_in_cluster(%rip)
	xorl	%r9d, %r9d
	movl	12(%rdi), %ecx
	testl	%ecx, %ecx
	jle	.L107
.L106:
	movl	8(%rsi), %edx
	leaq	0(,%r9,4), %r8
	xorl	%eax, %eax
	testl	%edx, %edx
	jg	.L109
	jmp	.L111
	.p2align 4,,10
	.p2align 3
.L117:
	lock addq	$1, 8+__gcov0.has_neighbor_in_cluster(%rip)
	addq	$1, %rax
	cmpl	%eax, 8(%rsi)
	jle	.L111
.L109:
	movq	(%rsi), %rdx
	movq	16(%rdi), %rcx
	movq	(%rdx,%rax,8), %rdx
	movl	(%rdx), %edx
	cmpl	%edx, (%rcx,%r8)
	jne	.L117
	movl	$1, %eax
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L111:
	.cfi_restore_state
	lock addq	$1, 16+__gcov0.has_neighbor_in_cluster(%rip)
	addq	$1, %r9
	cmpl	%r9d, 12(%rdi)
	jg	.L106
.L107:
	lock addq	$1, 24+__gcov0.has_neighbor_in_cluster(%rip)
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE50:
	.size	has_neighbor_in_cluster, .-has_neighbor_in_cluster
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Checking if neighbors of unit %d are contiguous\n"
	.section	.rodata.str1.1
.LC6:
	.string	"Found neighbor1: %d\n"
.LC7:
	.string	"Found neighbor2: %d\n"
	.text
	.p2align 4
	.globl	are_neighbors_contiguous00
	.type	are_neighbors_contiguous00, @function
are_neighbors_contiguous00:
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
	subq	$24, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, %r15
	movq	%rsi, %rbx
	lock addq	$1, __gcov0.are_neighbors_contiguous00(%rip)
	leaq	.LC5(%rip), %rsi
	xorl	%eax, %eax
	movl	(%rdi), %edx
	movl	$1, %edi
	call	__printf_chk@PLT
	lock addq	$1, 8+__gcov0.are_neighbors_contiguous00(%rip)
	xorl	%r13d, %r13d
	movl	12(%r15), %r8d
	testl	%r8d, %r8d
	jle	.L120
.L119:
	movl	8(%rbx), %edx
	leaq	0(,%r13,4), %rcx
	xorl	%eax, %eax
	testl	%edx, %edx
	jg	.L124
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L121:
	lock addq	$1, 24+__gcov0.are_neighbors_contiguous00(%rip)
	addq	$1, %rax
	cmpl	%eax, 8(%rbx)
	jle	.L125
.L124:
	movq	(%rbx), %rdx
	movq	(%rdx,%rax,8), %r14
	movq	16(%r15), %rdx
	movl	(%rdx,%rcx), %edi
	cmpl	%edi, (%r14)
	jne	.L121
	lock addq	$1, 16+__gcov0.are_neighbors_contiguous00(%rip)
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	(%r14), %edx
	call	__printf_chk@PLT
	lock addq	$1, 40+__gcov0.are_neighbors_contiguous00(%rip)
	leal	1(%r13), %r10d
	cmpl	%r10d, 12(%r15)
	jle	.L122
	movslq	%r10d, %rcx
	movl	%r10d, %r8d
	salq	$2, %rcx
.L123:
	movl	8(%rbx), %esi
	xorl	%eax, %eax
	testl	%esi, %esi
	jg	.L129
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L126:
	lock addq	$1, 56+__gcov0.are_neighbors_contiguous00(%rip)
	addq	$1, %rax
	cmpl	%eax, 8(%rbx)
	jle	.L130
.L129:
	movq	(%rbx), %rdx
	movq	(%rdx,%rax,8), %r12
	movq	16(%r15), %rdx
	movl	(%rdx,%rcx), %esi
	cmpl	%esi, (%r12)
	jne	.L126
	movq	%rcx, -64(%rbp)
	movl	%r10d, -56(%rbp)
	movl	%r8d, -52(%rbp)
	lock addq	$1, 48+__gcov0.are_neighbors_contiguous00(%rip)
	lock addq	$1, 72+__gcov0.are_neighbors_contiguous00(%rip)
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC7(%rip), %rsi
	movl	(%r12), %edx
	call	__printf_chk@PLT
	movl	12(%r14), %edi
	xorl	%eax, %eax
	movl	-52(%rbp), %r8d
	movl	-56(%rbp), %r10d
	movq	-64(%rbp), %rcx
	testl	%edi, %edi
	jg	.L127
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L131:
	lock addq	$1, 88+__gcov0.are_neighbors_contiguous00(%rip)
	addq	$1, %rax
	cmpl	%eax, 12(%r14)
	jle	.L128
.L127:
	movq	16(%r14), %rdx
	movl	(%r12), %edi
	cmpl	%edi, (%rdx,%rax,4)
	jne	.L131
	lock addq	$1, 80+__gcov0.are_neighbors_contiguous00(%rip)
	movl	$1, %eax
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
.L130:
	.cfi_restore_state
	lock addq	$1, 64+__gcov0.are_neighbors_contiguous00(%rip)
.L128:
	addl	$1, %r8d
	addq	$4, %rcx
	cmpl	%r8d, 12(%r15)
	jg	.L123
.L122:
	lock addq	$1, 96+__gcov0.are_neighbors_contiguous00(%rip)
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L125:
	lock addq	$1, 32+__gcov0.are_neighbors_contiguous00(%rip)
	leal	1(%r13), %r10d
.L135:
	addq	$1, %r13
	cmpl	%r10d, 12(%r15)
	jg	.L119
.L120:
	lock addq	$1, 104+__gcov0.are_neighbors_contiguous00(%rip)
	xorl	%eax, %eax
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
.LFE51:
	.size	are_neighbors_contiguous00, .-are_neighbors_contiguous00
	.p2align 4
	.globl	dfs_check_neighbors
	.type	dfs_check_neighbors, @function
dfs_check_neighbors:
.LFB52:
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
	movq	%rsi, %rbx
	movq	%rdx, %r14
	lock addq	$1, __gcov0.dfs_check_neighbors(%rip)
	xorl	%r13d, %r13d
	movq	(%rsi), %rdx
	movslq	%edi, %rax
	movq	(%rdx,%rax,8), %r12
	movl	$1, (%r14,%rax,4)
	movl	12(%r12), %ecx
	testl	%ecx, %ecx
	jle	.L148
.L147:
	movl	8(%rbx), %eax
	leaq	0(,%r13,4), %rsi
	xorl	%edi, %edi
	testl	%eax, %eax
	jg	.L152
	jmp	.L153
	.p2align 4,,10
	.p2align 3
.L149:
	lock addq	$1, 16+__gcov0.dfs_check_neighbors(%rip)
	addq	$1, %rdi
	cmpl	%edi, 8(%rbx)
	jle	.L153
.L152:
	movq	(%rbx), %rax
	movq	(%rax,%rdi,8), %rcx
	movq	16(%r12), %rax
	movl	(%rax,%rsi), %eax
	cmpl	%eax, (%rcx)
	jne	.L149
	lock addq	$1, 8+__gcov0.dfs_check_neighbors(%rip)
	lock addq	$1, 24+__gcov0.dfs_check_neighbors(%rip)
	movl	(%r14,%rdi,4), %edx
	testl	%edx, %edx
	je	.L160
.L151:
	addq	$1, %r13
	cmpl	%r13d, 12(%r12)
	jg	.L147
.L148:
	lock addq	$1, 48+__gcov0.dfs_check_neighbors(%rip)
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L153:
	.cfi_restore_state
	lock addq	$1, 32+__gcov0.dfs_check_neighbors(%rip)
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L160:
	lock addq	$1, 40+__gcov0.dfs_check_neighbors(%rip)
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	dfs_check_neighbors
	jmp	.L151
	.cfi_endproc
.LFE52:
	.size	dfs_check_neighbors, .-dfs_check_neighbors
	.p2align 4
	.globl	are_neighbors_contiguousd
	.type	are_neighbors_contiguousd, @function
are_neighbors_contiguousd:
.LFB53:
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
	movq	%rsi, %rbx
	lock addq	$1, __gcov0.are_neighbors_contiguousd(%rip)
	movl	$4, %esi
	movslq	%edx, %rdi
	call	calloc@PLT
	movl	8(%rbx), %esi
	movq	%rax, %r12
	testl	%esi, %esi
	jle	.L162
	xorl	%edx, %edx
	jmp	.L165
	.p2align 4,,10
	.p2align 3
.L163:
	lock addq	$1, 16+__gcov0.are_neighbors_contiguousd(%rip)
	addq	$1, %rdx
	cmpl	%edx, 8(%rbx)
	jle	.L162
.L165:
	movq	(%rbx), %rcx
	movl	0(%r13), %eax
	movl	%edx, %edi
	movq	(%rcx,%rdx,8), %rcx
	cmpl	%eax, (%rcx)
	jne	.L163
	lock addq	$1, 8+__gcov0.are_neighbors_contiguousd(%rip)
	jmp	.L164
	.p2align 4,,10
	.p2align 3
.L162:
	movl	$-1, %edi
.L164:
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	dfs_check_neighbors
	lock addq	$1, 24+__gcov0.are_neighbors_contiguousd(%rip)
	movl	8(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.L171
	xorl	%edx, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L170:
	movl	(%r12,%rdx,4), %ecx
	testl	%ecx, %ecx
	je	.L167
	lock addq	$1, 32+__gcov0.are_neighbors_contiguousd(%rip)
	addl	$1, %eax
.L167:
	lock addq	$1, 40+__gcov0.are_neighbors_contiguousd(%rip)
	movl	8(%rbx), %ecx
	addq	$1, %rdx
	cmpl	%edx, %ecx
	jg	.L170
.L166:
	cmpl	%eax, %ecx
	sete	%al
	addq	$8, %rsp
	popq	%rbx
	movzbl	%al, %eax
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L171:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L166
	.cfi_endproc
.LFE53:
	.size	are_neighbors_contiguousd, .-are_neighbors_contiguousd
	.p2align 4
	.globl	are_neighbors_contiguousss
	.type	are_neighbors_contiguousss, @function
are_neighbors_contiguousss:
.LFB54:
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
	movq	%rdi, %r12
	movq	%rsi, %rbx
	lock addq	$1, __gcov0.are_neighbors_contiguousss(%rip)
	movl	$4, %esi
	xorl	%r13d, %r13d
	movslq	%edx, %rdi
	call	calloc@PLT
	movl	12(%r12), %ecx
	movq	%rax, %r14
	testl	%ecx, %ecx
	jle	.L175
	.p2align 4,,10
	.p2align 3
.L174:
	movl	8(%rbx), %eax
	leaq	0(,%r13,4), %rsi
	xorl	%edi, %edi
	testl	%eax, %eax
	jg	.L179
	jmp	.L180
	.p2align 4,,10
	.p2align 3
.L176:
	lock addq	$1, 16+__gcov0.are_neighbors_contiguousss(%rip)
	addq	$1, %rdi
	cmpl	%edi, 8(%rbx)
	jle	.L180
.L179:
	movq	(%rbx), %rdx
	movq	(%rdx,%rdi,8), %rcx
	movq	16(%r12), %rdx
	movl	(%rdx,%rsi), %eax
	cmpl	%eax, (%rcx)
	jne	.L176
	lock addq	$1, 8+__gcov0.are_neighbors_contiguousss(%rip)
	lock addq	$1, 24+__gcov0.are_neighbors_contiguousss(%rip)
	movl	(%r14,%rdi,4), %edx
	testl	%edx, %edx
	je	.L192
.L178:
	addq	$1, %r13
	cmpl	%r13d, 12(%r12)
	jg	.L174
.L175:
	lock addq	$1, 48+__gcov0.are_neighbors_contiguousss(%rip)
	movl	8(%rbx), %edx
	testl	%edx, %edx
	jle	.L187
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L185:
	movq	(%rbx), %rdx
	movl	(%r12), %esi
	movq	(%rdx,%rax,8), %rdx
	cmpl	%esi, (%rdx)
	je	.L193
	lock addq	$1, 56+__gcov0.are_neighbors_contiguousss(%rip)
	movl	8(%rbx), %edx
	addq	$1, %rax
	addl	$1, %ecx
	cmpl	%eax, %edx
	jg	.L185
.L182:
	subl	$1, %edx
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	cmpl	%ecx, %edx
	popq	%r13
	popq	%r14
	sete	%al
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L180:
	.cfi_restore_state
	lock addq	$1, 32+__gcov0.are_neighbors_contiguousss(%rip)
	jmp	.L178
	.p2align 4,,10
	.p2align 3
.L193:
	lock addq	$1, 64+__gcov0.are_neighbors_contiguousss(%rip)
	movl	8(%rbx), %edx
	addq	$1, %rax
	cmpl	%eax, %edx
	jg	.L185
	jmp	.L182
	.p2align 4,,10
	.p2align 3
.L192:
	lock addq	$1, 40+__gcov0.are_neighbors_contiguousss(%rip)
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	dfs_check_neighbors
	jmp	.L178
.L187:
	xorl	%ecx, %ecx
	jmp	.L182
	.cfi_endproc
.LFE54:
	.size	are_neighbors_contiguousss, .-are_neighbors_contiguousss
	.p2align 4
	.globl	dfs_contiguity_check
	.type	dfs_contiguity_check, @function
dfs_contiguity_check:
.LFB55:
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
	movq	%rsi, %rbx
	movq	%rdx, %r14
	lock addq	$1, __gcov0.dfs_contiguity_check(%rip)
	xorl	%r13d, %r13d
	movq	(%rsi), %rdx
	movslq	%edi, %rax
	movq	(%rdx,%rax,8), %r12
	movl	$1, (%r14,%rax,4)
	movl	12(%r12), %ecx
	testl	%ecx, %ecx
	jle	.L196
.L195:
	movl	8(%rbx), %eax
	leaq	0(,%r13,4), %rsi
	xorl	%edi, %edi
	testl	%eax, %eax
	jg	.L200
	jmp	.L201
	.p2align 4,,10
	.p2align 3
.L197:
	lock addq	$1, 16+__gcov0.dfs_contiguity_check(%rip)
	addq	$1, %rdi
	cmpl	%edi, 8(%rbx)
	jle	.L201
.L200:
	movq	(%rbx), %rax
	movq	(%rax,%rdi,8), %rcx
	movq	16(%r12), %rax
	movl	(%rax,%rsi), %eax
	cmpl	%eax, (%rcx)
	jne	.L197
	lock addq	$1, 8+__gcov0.dfs_contiguity_check(%rip)
	lock addq	$1, 24+__gcov0.dfs_contiguity_check(%rip)
	movl	(%r14,%rdi,4), %edx
	testl	%edx, %edx
	je	.L208
.L199:
	addq	$1, %r13
	cmpl	%r13d, 12(%r12)
	jg	.L195
.L196:
	lock addq	$1, 48+__gcov0.dfs_contiguity_check(%rip)
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L201:
	.cfi_restore_state
	lock addq	$1, 32+__gcov0.dfs_contiguity_check(%rip)
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L208:
	lock addq	$1, 40+__gcov0.dfs_contiguity_check(%rip)
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	dfs_contiguity_check
	jmp	.L199
	.cfi_endproc
.LFE55:
	.size	dfs_contiguity_check, .-dfs_contiguity_check
	.p2align 4
	.globl	are_neighbors_contiguous
	.type	are_neighbors_contiguous, @function
are_neighbors_contiguous:
.LFB56:
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
	movq	%rdi, %r13
	movq	%rsi, %rbx
	lock addq	$1, __gcov0.are_neighbors_contiguous(%rip)
	movslq	8(%rsi), %rdi
	movl	$4, %esi
	movq	%rdi, %r14
	call	calloc@PLT
	leal	-1(%r14), %esi
	xorl	%edx, %edx
	movq	%rax, %r12
	testl	%r14d, %r14d
	jg	.L213
	jmp	.L214
	.p2align 4,,10
	.p2align 3
.L212:
	lock addq	$1, 16+__gcov0.are_neighbors_contiguous(%rip)
	leaq	1(%rdx), %rax
	cmpq	%rdx, %rsi
	je	.L214
	movq	%rax, %rdx
.L213:
	movq	(%rbx), %rcx
	movl	0(%r13), %edi
	leal	1(%rdx), %eax
	movq	(%rcx,%rdx,8), %rcx
	cmpl	%edi, (%rcx)
	jne	.L212
	lock addq	$1, 8+__gcov0.are_neighbors_contiguous(%rip)
	cltd
	idivl	%r14d
	movl	%edx, %edi
	jmp	.L211
	.p2align 4,,10
	.p2align 3
.L214:
	xorl	%edi, %edi
.L211:
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	dfs_contiguity_check
	lock addq	$1, 24+__gcov0.are_neighbors_contiguous(%rip)
	movl	8(%rbx), %edx
	testl	%edx, %edx
	jle	.L220
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L218:
	movl	(%r12,%rax,4), %edx
	testl	%edx, %edx
	je	.L216
	lock addq	$1, 32+__gcov0.are_neighbors_contiguous(%rip)
	addl	$1, %ecx
.L216:
	lock addq	$1, 40+__gcov0.are_neighbors_contiguous(%rip)
	movl	8(%rbx), %edx
	addq	$1, %rax
	cmpl	%eax, %edx
	jg	.L218
.L215:
	subl	$1, %edx
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	cmpl	%ecx, %edx
	popq	%r13
	popq	%r14
	sete	%al
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L220:
	.cfi_restore_state
	xorl	%ecx, %ecx
	jmp	.L215
	.cfi_endproc
.LFE56:
	.size	are_neighbors_contiguous, .-are_neighbors_contiguous
	.p2align 4
	.globl	dfs_contiguity_exclude
	.type	dfs_contiguity_exclude, @function
dfs_contiguity_exclude:
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
	subq	$8, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movl	%esi, %r14d
	movq	%rdx, %r12
	movq	%rcx, %r15
	lock addq	$1, __gcov0.dfs_contiguity_exclude(%rip)
	movslq	%edi, %rdi
	movl	$1, (%rcx,%rdi,4)
	movl	8(%rdx), %ecx
	testl	%ecx, %ecx
	jle	.L222
	leaq	0(,%rdi,8), %r13
	xorl	%ebx, %ebx
.L229:
	movl	%ebx, %r9d
	cmpl	%ebx, %r14d
	je	.L232
	lock addq	$1, 8+__gcov0.dfs_contiguity_exclude(%rip)
	movl	(%r15,%rbx,4), %edx
	testl	%edx, %edx
	je	.L233
.L225:
	addq	$1, %rbx
	cmpl	%ebx, 8(%r12)
	jg	.L229
.L222:
	addq	$8, %rsp
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
.L232:
	.cfi_restore_state
	lock addq	$1, 16+__gcov0.dfs_contiguity_exclude(%rip)
	jmp	.L225
	.p2align 4,,10
	.p2align 3
.L233:
	lock addq	$1, 24+__gcov0.dfs_contiguity_exclude(%rip)
	movq	(%r12), %rax
	movq	(%rax,%r13), %rdi
	movq	(%rax,%rbx,8), %rdx
	movl	12(%rdi), %eax
	testl	%eax, %eax
	jle	.L225
	xorl	%eax, %eax
	jmp	.L228
	.p2align 4,,10
	.p2align 3
.L227:
	lock addq	$1, 40+__gcov0.dfs_contiguity_exclude(%rip)
	addq	$1, %rax
	cmpl	%eax, 12(%rdi)
	jle	.L225
.L228:
	movq	16(%rdi), %r8
	movl	(%rdx), %ecx
	cmpl	%ecx, (%r8,%rax,4)
	jne	.L227
	lock addq	$1, 32+__gcov0.dfs_contiguity_exclude(%rip)
	lock addq	$1, 48+__gcov0.dfs_contiguity_exclude(%rip)
	movq	%r15, %rcx
	movq	%r12, %rdx
	movl	%r14d, %esi
	movl	%r9d, %edi
	call	dfs_contiguity_exclude
	lock addq	$1, 56+__gcov0.dfs_contiguity_exclude(%rip)
	jmp	.L225
	.cfi_endproc
.LFE57:
	.size	dfs_contiguity_exclude, .-dfs_contiguity_exclude
	.p2align 4
	.globl	are_remaining_units_contiguous
	.type	are_remaining_units_contiguous, @function
are_remaining_units_contiguous:
.LFB58:
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
	movq	%rdi, %rbx
	movl	%esi, %r12d
	lock addq	$1, __gcov0.are_remaining_units_contiguous(%rip)
	xorl	%eax, %eax
	movslq	8(%rdi), %rdi
	leal	-2(%rdi), %edx
	cmpl	$536870909, %edx
	jbe	.L243
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L243:
	.cfi_restore_state
	lock addq	$1, 8+__gcov0.are_remaining_units_contiguous(%rip)
	movl	$4, %esi
	call	calloc@PLT
	xorl	%edi, %edi
	testl	%r12d, %r12d
	movq	%rbx, %rdx
	sete	%dil
	movq	%rax, %rcx
	movl	%r12d, %esi
	movq	%rax, %r13
	call	dfs_contiguity_exclude
	lock addq	$1, 16+__gcov0.are_remaining_units_contiguous(%rip)
	movl	8(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.L241
	xorl	%edx, %edx
	xorl	%eax, %eax
	jmp	.L239
	.p2align 4,,10
	.p2align 3
.L237:
	lock addq	$1, 24+__gcov0.are_remaining_units_contiguous(%rip)
	movl	0(%r13,%rdx,4), %ecx
	testl	%ecx, %ecx
	je	.L238
	lock addq	$1, 40+__gcov0.are_remaining_units_contiguous(%rip)
	addl	$1, %eax
.L238:
	movl	8(%rbx), %ecx
	addq	$1, %rdx
	cmpl	%edx, %ecx
	jle	.L236
.L239:
	cmpl	%edx, %r12d
	jne	.L237
	lock addq	$1, 32+__gcov0.are_remaining_units_contiguous(%rip)
	movl	8(%rbx), %ecx
	addq	$1, %rdx
	cmpl	%edx, %ecx
	jg	.L239
.L236:
	subl	$1, %ecx
	cmpl	%eax, %ecx
	sete	%al
	addq	$8, %rsp
	popq	%rbx
	movzbl	%al, %eax
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L241:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L236
	.cfi_endproc
.LFE58:
	.size	are_remaining_units_contiguous, .-are_remaining_units_contiguous
	.p2align 4
	.globl	contains
	.type	contains, @function
contains:
.LFB59:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
1:	call	*mcount@GOTPCREL(%rip)
	lock addq	$1, __gcov0.contains(%rip)
	testl	%esi, %esi
	jle	.L245
	leal	-1(%rsi), %eax
	leaq	4(%rdi,%rax,4), %rax
	jmp	.L248
	.p2align 4,,10
	.p2align 3
.L246:
	lock addq	$1, 16+__gcov0.contains(%rip)
	addq	$4, %rdi
	cmpq	%rax, %rdi
	je	.L245
.L248:
	cmpl	%edx, (%rdi)
	jne	.L246
	lock addq	$1, 8+__gcov0.contains(%rip)
	movl	$1, %eax
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L245:
	.cfi_restore_state
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE59:
	.size	contains, .-contains
	.p2align 4
	.globl	change_unit
	.type	change_unit, @function
change_unit:
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
	subq	$56, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rsi, %r13
	movl	%ecx, %r14d
	movq	%rdi, -72(%rbp)
	movl	%edx, -80(%rbp)
	lock addq	$1, __gcov0.change_unit(%rip)
	testl	%edx, %edx
	jle	.L251
	leal	-1(%rdx), %edx
	leaq	8(%rdi), %rax
	xorl	%ebx, %ebx
	salq	$4, %rdx
	leaq	24(%rdi,%rdx), %rdx
	.p2align 4,,10
	.p2align 3
.L252:
	addl	(%rax), %ebx
	movl	%ebx, %r15d
	lock addq	$1, 8+__gcov0.change_unit(%rip)
	addq	$16, %rax
	cmpq	%rax, %rdx
	jne	.L252
	call	rand@PLT
	lock addq	$1, 16+__gcov0.change_unit(%rip)
	cltd
	idivl	%ebx
	movq	-72(%rbp), %rax
	subl	8(%rax), %edx
	testl	%edx, %edx
	jle	.L338
	movl	-80(%rbp), %ecx
	addq	$16, %rax
	xorl	%r12d, %r12d
	jmp	.L254
	.p2align 4,,10
	.p2align 3
.L256:
	subl	8(%rax), %edx
	movq	%rax, %rbx
	addq	$16, %rax
	testl	%edx, %edx
	jle	.L295
.L254:
	lock addq	$1, 32+__gcov0.change_unit(%rip)
	addl	$1, %r12d
	cmpl	%r12d, %ecx
	jne	.L256
	movq	-72(%rbp), %rbx
	xorl	%r12d, %r12d
.L255:
	movl	8(%rbx), %ecx
	cmpl	$1, %ecx
	jne	.L257
	movq	-72(%rbp), %r12
	movl	-80(%rbp), %ebx
	.p2align 4,,10
	.p2align 3
.L258:
	call	rand@PLT
	lock addq	$1, 40+__gcov0.change_unit(%rip)
	cltd
	idivl	%ebx
	movslq	%edx, %rax
	salq	$4, %rax
	addq	%r12, %rax
	movl	8(%rax), %ecx
	cmpl	$1, %ecx
	je	.L258
	movq	%rax, %rbx
	movl	%edx, %r12d
.L257:
	lock addq	$1, 48+__gcov0.change_unit(%rip)
	movl	%r15d, %eax
	movslq	%ecx, %rdi
	movl	%ecx, -56(%rbp)
	cltd
	salq	$2, %rdi
	idivl	-80(%rbp)
	movl	%eax, -84(%rbp)
	call	malloc@PLT
	movl	-56(%rbp), %ecx
	movq	%rax, -64(%rbp)
	testl	%ecx, %ecx
	jle	.L297
	movl	$-1, %r9d
	leal	-1(%r14), %eax
	subl	$1, %ecx
	xorl	%r11d, %r11d
	movl	%r9d, -96(%rbp)
	movsd	.LC8(%rip), %xmm1
	leaq	8(%r13,%rax,8), %r8
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L269:
	movq	(%rbx), %rax
	movq	(%rax,%r11,8), %rdi
	lock addq	$1, 56+__gcov0.change_unit(%rip)
	xorl	%r10d, %r10d
	movl	12(%rdi), %r9d
	testl	%r9d, %r9d
	jle	.L261
	movl	%r11d, %r9d
	.p2align 4,,10
	.p2align 3
.L260:
	leaq	0(,%r10,4), %r15
	movq	%r13, %rax
	testl	%r14d, %r14d
	jle	.L266
	movq	%rcx, -56(%rbp)
	jmp	.L265
	.p2align 4,,10
	.p2align 3
.L262:
	lock addq	$1, 72+__gcov0.change_unit(%rip)
	addq	$8, %rax
	cmpq	%rax, %r8
	je	.L339
.L265:
	movq	16(%rdi), %rcx
	movq	(%rax), %rdx
	movl	(%rcx,%r15), %ecx
	cmpl	%ecx, (%rdx)
	jne	.L262
	movq	-56(%rbp), %rcx
	lock addq	$1, 64+__gcov0.change_unit(%rip)
	lock addq	$1, 88+__gcov0.change_unit(%rip)
	cmpl	%r12d, 36(%rdx)
	jne	.L340
.L264:
	addq	$1, %r10
	cmpl	%r10d, 12(%rdi)
	jg	.L260
.L261:
	leaq	1(%r11), %rax
	cmpq	%r11, %rcx
	je	.L341
.L300:
	movq	%rax, %r11
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L339:
	movq	-56(%rbp), %rcx
.L266:
	lock addq	$1, 80+__gcov0.change_unit(%rip)
	jmp	.L264
.L340:
	lock addq	$1, 96+__gcov0.change_unit(%rip)
	pxor	%xmm0, %xmm0
	movslq	%esi, %rdx
	leal	1(%rsi), %eax
	movq	-64(%rbp), %rsi
	movl	%r9d, (%rsi,%rdx,4)
	movl	12(%rbx), %edx
	subl	8(%rdi), %edx
	subl	-84(%rbp), %edx
	movl	%edx, %esi
	sarl	$31, %esi
	xorl	%esi, %edx
	subl	%esi, %edx
	movl	%eax, %esi
	cvtsi2sdl	%edx, %xmm0
	comisd	%xmm0, %xmm1
	jbe	.L261
	lock addq	$1, 104+__gcov0.change_unit(%rip)
	movl	%r9d, -96(%rbp)
	movapd	%xmm0, %xmm1
	leaq	1(%r11), %rax
	cmpq	%r11, %rcx
	jne	.L300
.L341:
	movl	-96(%rbp), %r9d
	movl	%esi, -56(%rbp)
	cmpl	$-1, %r9d
	je	.L337
	movslq	%r9d, %rax
	movq	%rax, %rsi
	movq	%rax, -64(%rbp)
	movq	(%rbx), %rax
	movq	(%rax,%rsi,8), %r15
.L276:
	movl	%r9d, -84(%rbp)
	lock addq	$1, 144+__gcov0.change_unit(%rip)
	movslq	-80(%rbp), %rdi
	salq	$2, %rdi
	movq	%rdi, -80(%rbp)
	call	malloc@PLT
	movq	-80(%rbp), %rdi
	movq	%rax, -56(%rbp)
	call	malloc@PLT
	movl	-84(%rbp), %r9d
	movq	%rax, %r8
	movl	12(%r15), %eax
	testl	%eax, %eax
	jle	.L277
	leal	-1(%r14), %eax
	xorl	%r11d, %r11d
	xorl	%r10d, %r10d
	leaq	8(%r13,%rax,8), %rdi
	movq	-56(%rbp), %rax
	leaq	4(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L285:
	movq	16(%r15), %rax
	movl	(%rax,%r11,4), %esi
	lock addq	$1, 152+__gcov0.change_unit(%rip)
	testl	%r14d, %r14d
	jle	.L278
	movq	%r13, %rax
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L279:
	lock addq	$1, 168+__gcov0.change_unit(%rip)
	addq	$8, %rax
	cmpq	%rax, %rdi
	je	.L278
.L284:
	movq	(%rax), %rcx
	cmpl	%esi, (%rcx)
	jne	.L279
	lock addq	$1, 160+__gcov0.change_unit(%rip)
	movslq	36(%rcx), %rcx
	cmpl	%r12d, %ecx
	jne	.L342
.L278:
	addq	$1, %r11
	cmpl	%r11d, 12(%r15)
	jg	.L285
	movslq	%r10d, %rdi
	movl	%r9d, -84(%rbp)
	salq	$3, %rdi
	movl	%r10d, -80(%rbp)
	movq	%r8, -96(%rbp)
	call	malloc@PLT
	movl	-80(%rbp), %r10d
	movl	-84(%rbp), %r9d
	movq	%rax, %r12
	testl	%r10d, %r10d
	je	.L277
	movq	-96(%rbp), %r8
	leal	-1(%r10), %r13d
	movsd	.LC10(%rip), %xmm2
	pxor	%xmm1, %xmm1
	movq	%r8, %rax
	leaq	4(%r8,%r13,4), %rcx
	.p2align 4,,10
	.p2align 3
.L286:
	pxor	%xmm0, %xmm0
	movapd	%xmm2, %xmm3
	cvtsi2sdl	(%rax), %xmm0
	divsd	%xmm0, %xmm3
	addsd	%xmm3, %xmm1
	lock addq	$1, 208+__gcov0.change_unit(%rip)
	addq	$4, %rax
	cmpq	%rax, %rcx
	jne	.L286
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L287:
	pxor	%xmm0, %xmm0
	movapd	%xmm2, %xmm4
	cvtsi2sdl	(%r8,%rax,4), %xmm0
	divsd	%xmm0, %xmm4
	movapd	%xmm4, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%r12,%rax,8)
	lock addq	$1, 216+__gcov0.change_unit(%rip)
	movq	%rax, %rdx
	addq	$1, %rax
	cmpq	%rdx, %r13
	jne	.L287
	movl	%r9d, -80(%rbp)
	call	rand@PLT
	lock addq	$1, 224+__gcov0.change_unit(%rip)
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	movl	-80(%rbp), %r9d
	cvtsi2sdl	%eax, %xmm1
	xorl	%eax, %eax
	divsd	.LC11(%rip), %xmm1
	jmp	.L292
	.p2align 4,,10
	.p2align 3
.L329:
	lock addq	$1, 240+__gcov0.change_unit(%rip)
	leaq	1(%rax), %rdx
	cmpq	%rax, %r13
	je	.L291
	movq	%rdx, %rax
.L292:
	addsd	(%r12,%rax,8), %xmm0
	comisd	%xmm1, %xmm0
	jb	.L329
	lock addq	$1, 232+__gcov0.change_unit(%rip)
	movq	-56(%rbp), %rsi
	leaq	(%rsi,%rax,4), %rax
	movq	%rax, -56(%rbp)
.L291:
	movq	-56(%rbp), %rax
	movslq	(%rax), %rax
	movq	%rax, %rsi
	salq	$4, %rax
	addq	-72(%rbp), %rax
	movslq	8(%rax), %r8
	movq	(%rax), %rdi
	movq	%r8, %rcx
	movq	%r15, (%rdi,%r8,8)
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
	movl	8(%rbx), %eax
	movl	%esi, 36(%r15)
	subl	$1, %eax
	cmpl	%r9d, %eax
	jle	.L293
	movq	-64(%rbp), %rax
	leaq	8(,%rax,8), %rdx
	.p2align 4,,10
	.p2align 3
.L294:
	movq	(%rbx), %rax
	addl	$1, %r9d
	movq	(%rax,%rdx), %rcx
	movq	%rcx, -8(%rax,%rdx)
	lock addq	$1, 248+__gcov0.change_unit(%rip)
	movl	8(%rbx), %eax
	subl	$1, %eax
	addq	$8, %rdx
	cmpl	%r9d, %eax
	jg	.L294
.L293:
	movl	%eax, 8(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L342:
	.cfi_restore_state
	lock addq	$1, 176+__gcov0.change_unit(%rip)
	testl	%r10d, %r10d
	je	.L283
	leal	-1(%r10), %esi
	movq	-56(%rbp), %rax
	leaq	(%rdx,%rsi,4), %rsi
	jmp	.L282
	.p2align 4,,10
	.p2align 3
.L281:
	lock addq	$1, 192+__gcov0.change_unit(%rip)
	addq	$4, %rax
	cmpq	%rax, %rsi
	je	.L283
.L282:
	cmpl	(%rax), %ecx
	jne	.L281
	lock addq	$1, 184+__gcov0.change_unit(%rip)
	jmp	.L278
.L283:
	lock addq	$1, 200+__gcov0.change_unit(%rip)
	movq	-56(%rbp), %rsi
	movslq	%r10d, %rax
	addl	$1, %r10d
	movl	%ecx, (%rsi,%rax,4)
	movq	-72(%rbp), %rsi
	salq	$4, %rcx
	movl	8(%rsi,%rcx), %ecx
	movl	%ecx, (%r8,%rax,4)
	jmp	.L278
.L338:
	movq	%rax, %rbx
	xorl	%r12d, %r12d
.L295:
	lock addq	$1, 24+__gcov0.change_unit(%rip)
	jmp	.L255
.L297:
	movl	$0, -56(%rbp)
.L337:
	movq	%r13, -96(%rbp)
	movl	%r12d, -84(%rbp)
	movq	%rbx, %r12
.L273:
	call	rand@PLT
	lock addq	$1, 112+__gcov0.change_unit(%rip)
	movq	-64(%rbp), %rbx
	movq	(%r12), %rsi
	cltd
	idivl	-56(%rbp)
	movslq	%edx, %rax
	movl	8(%r12), %edx
	movslq	(%rbx,%rax,4), %r15
	xorl	%eax, %eax
	movq	(%rsi,%r15,8), %rbx
	movq	%r15, %r13
	testl	%edx, %edx
	jle	.L274
	.p2align 4,,10
	.p2align 3
.L271:
	movq	(%rsi,%rax,8), %rdx
	movl	$0, 40(%rdx)
	lock addq	$1, 120+__gcov0.change_unit(%rip)
	addq	$1, %rax
	cmpl	%eax, 8(%r12)
	jg	.L271
.L274:
	movl	%r13d, %esi
	movq	%r12, %rdi
	call	are_remaining_units_contiguous
	lock addq	$1, 128+__gcov0.change_unit(%rip)
	testl	%eax, %eax
	je	.L273
	lock addq	$1, 136+__gcov0.change_unit(%rip)
	cmpl	$-1, %r13d
	je	.L273
	movq	%r15, -64(%rbp)
	movl	%r13d, %r9d
	movq	%rbx, %r15
	movq	-96(%rbp), %r13
	movq	%r12, %rbx
	movl	-84(%rbp), %r12d
	jmp	.L276
.L277:
	movl	%r9d, -80(%rbp)
	call	rand@PLT
	lock addq	$1, 224+__gcov0.change_unit(%rip)
	movl	-80(%rbp), %r9d
	jmp	.L291
.L251:
	call	rand@PLT
	lock addq	$1, 16+__gcov0.change_unit(%rip)
	ud2
	.cfi_endproc
.LFE60:
	.size	change_unit, .-change_unit
	.p2align 4
	.globl	is_contiguous_after_removal
	.type	is_contiguous_after_removal, @function
is_contiguous_after_removal:
.LFB61:
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
	movq	%rsi, %r12
	movl	8(%rdi), %esi
	cmpl	$1, %esi
	jle	.L361
	leal	-1(%rsi), %r14d
	xorl	%eax, %eax
	leaq	8(,%r14,8), %rcx
	.p2align 4,,10
	.p2align 3
.L348:
	movq	(%rdi), %rdx
	cmpq	%r12, (%rdx,%rax)
	je	.L362
	lock addq	$1, 16+__gcov0.is_contiguous_after_removal(%rip)
	addq	$8, %rax
	cmpq	%rax, %rcx
	jne	.L348
	lock addq	$1, 24+__gcov0.is_contiguous_after_removal(%rip)
	xorl	%r13d, %r13d
	movl	%r13d, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L362:
	.cfi_restore_state
	lock addq	$1, 8+__gcov0.is_contiguous_after_removal(%rip)
	movq	(%rdi), %r13
	leaq	0(%r13,%rax), %rbx
	leaq	8(%r13,%r14,8), %rdx
	movq	%r13, %rax
	movq	$0, (%rbx)
	.p2align 4,,10
	.p2align 3
.L347:
	cmpq	$0, (%rax)
	jne	.L363
	lock addq	$1, 40+__gcov0.is_contiguous_after_removal(%rip)
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L347
	lock addq	$1, 48+__gcov0.is_contiguous_after_removal(%rip)
	xorl	%r13d, %r13d
	movl	%r13d, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L363:
	.cfi_restore_state
	lock addq	$1, 32+__gcov0.is_contiguous_after_removal(%rip)
	lock addq	$1, 56+__gcov0.is_contiguous_after_removal(%rip)
	movslq	%esi, %rdi
	movl	$1, %esi
	call	calloc@PLT
	xorl	%edx, %edx
	movq	%rax, %rdi
	jmp	.L351
	.p2align 4,,10
	.p2align 3
.L353:
	lock addq	$1, 64+__gcov0.is_contiguous_after_removal(%rip)
	cmpb	$0, (%rdi,%rdx)
	je	.L364
	leaq	1(%rdx), %rcx
	cmpq	%rdx, %r14
	je	.L365
.L356:
	movq	%rcx, %rdx
.L351:
	cmpq	$0, 0(%r13,%rdx,8)
	jne	.L353
	lock addq	$1, 72+__gcov0.is_contiguous_after_removal(%rip)
	leaq	1(%rdx), %rcx
	cmpq	%rdx, %r14
	jne	.L356
.L365:
	movl	$1, %r13d
.L355:
	movq	%r12, (%rbx)
	call	free@PLT
	popq	%rbx
	movl	%r13d, %eax
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L361:
	.cfi_restore_state
	lock addq	$1, __gcov0.is_contiguous_after_removal(%rip)
	xorl	%r13d, %r13d
	movl	%r13d, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L364:
	.cfi_restore_state
	lock addq	$1, 80+__gcov0.is_contiguous_after_removal(%rip)
	xorl	%r13d, %r13d
	jmp	.L355
	.cfi_endproc
.LFE61:
	.size	is_contiguous_after_removal, .-is_contiguous_after_removal
	.p2align 4
	.globl	DFS
	.type	DFS, @function
DFS:
.LFB62:
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
	movq	%rdi, %r12
	movq	%rsi, %rbx
	movq	%rdx, %r14
	lock addq	$1, __gcov0.DFS(%rip)
	xorl	%eax, %eax
	movl	8(%rsi), %edx
	testl	%edx, %edx
	jg	.L367
	jmp	.L368
	.p2align 4,,10
	.p2align 3
.L369:
	lock addq	$1, 16+__gcov0.DFS(%rip)
	addq	$1, %rax
	cmpl	%eax, 8(%rbx)
	jle	.L368
.L367:
	movq	(%rbx), %rdx
	cmpq	%r12, (%rdx,%rax,8)
	jne	.L369
	lock addq	$1, 8+__gcov0.DFS(%rip)
	movb	$1, (%r14,%rax)
.L368:
	movl	12(%r12), %eax
	xorl	%r13d, %r13d
	testl	%eax, %eax
	jle	.L366
.L370:
	movl	8(%rbx), %ecx
	leaq	0(,%r13,4), %r8
	xorl	%eax, %eax
	testl	%ecx, %ecx
	jg	.L377
	jmp	.L378
	.p2align 4,,10
	.p2align 3
.L373:
	lock addq	$1, 24+__gcov0.DFS(%rip)
	movq	16(%r12), %rsi
	movl	(%rsi,%r8), %edx
	cmpl	%edx, (%rdi)
	je	.L394
	movl	8(%rbx), %ecx
	addq	$1, %rax
	cmpl	%eax, %ecx
	jle	.L378
.L377:
	movq	(%rbx), %rsi
	movq	(%rsi,%rax,8), %rdi
	testq	%rdi, %rdi
	jne	.L373
	lock addq	$1, 32+__gcov0.DFS(%rip)
	movl	8(%rbx), %ecx
	addq	$1, %rax
	cmpl	%eax, %ecx
	jg	.L377
	.p2align 4,,10
	.p2align 3
.L378:
	lock addq	$1, 96+__gcov0.DFS(%rip)
	addq	$1, %r13
	cmpl	%r13d, 12(%r12)
	jg	.L370
.L366:
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L394:
	.cfi_restore_state
	lock addq	$1, 40+__gcov0.DFS(%rip)
	xorl	%eax, %eax
	leal	-1(%rcx), %esi
	testl	%ecx, %ecx
	jg	.L382
	jmp	.L376
	.p2align 4,,10
	.p2align 3
.L379:
	lock addq	$1, 56+__gcov0.DFS(%rip)
	leaq	1(%rax), %rdx
	cmpq	%rax, %rsi
	je	.L376
	movq	%rdx, %rax
.L382:
	movq	(%rbx), %rdx
	cmpq	(%rdx,%rax,8), %rdi
	jne	.L379
	lock addq	$1, 48+__gcov0.DFS(%rip)
	lock addq	$1, 64+__gcov0.DFS(%rip)
	cmpb	$0, (%r14,%rax)
	jne	.L378
	lock addq	$1, 80+__gcov0.DFS(%rip)
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	DFS
	lock addq	$1, 88+__gcov0.DFS(%rip)
	jmp	.L378
	.p2align 4,,10
	.p2align 3
.L376:
	lock addq	$1, 72+__gcov0.DFS(%rip)
	jmp	.L378
	.cfi_endproc
.LFE62:
	.size	DFS, .-DFS
	.section	.rodata.str1.1
.LC12:
	.string	"Cluster %d with size %d: "
.LC13:
	.string	"%d "
.LC14:
	.string	"\n"
.LC15:
	.string	"--------------\n"
	.text
	.p2align 4
	.globl	transitionBound
	.type	transitionBound, @function
transitionBound:
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
	subq	$40, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movl	%edx, %ebx
	movl	%ecx, %r14d
	movq	%r8, %r13
	movq	%rsi, -72(%rbp)
	movl	%edx, -52(%rbp)
	movl	%ecx, -56(%rbp)
	lock addq	$1, __gcov0.transitionBound(%rip)
	xorl	%edi, %edi
	xorl	%eax, %eax
	call	time@PLT
	movl	%eax, %edi
	lock addq	$1, 8+__gcov0.transitionBound(%rip)
	call	srand@PLT
	movslq	%ebx, %rdi
	salq	$4, %rdi
	call	malloc@PLT
	movq	%rax, %r15
	movl	%ebx, %eax
	testl	%ebx, %ebx
	jle	.L396
	leal	-1(%rax), %r12d
	movslq	%r14d, %rbx
	addq	$1, %r12
	salq	$3, %rbx
	salq	$4, %r12
	addq	%r15, %r12
	.p2align 4,,10
	.p2align 3
.L397:
	movq	%rbx, %rdi
	call	malloc@PLT
	movl	$0, 8(%r15)
	movq	%rax, (%r15)
	lock addq	$1, 16+__gcov0.transitionBound(%rip)
	addq	$16, %r15
	cmpq	%r12, %r15
	jne	.L397
	lock addq	$1, 24+__gcov0.transitionBound(%rip)
	movl	-56(%rbp), %edx
	movl	-52(%rbp), %esi
	movq	-72(%rbp), %rdi
	call	first_cluster
	movq	%rax, -64(%rbp)
	lock addq	$1, 32+__gcov0.transitionBound(%rip)
	xorl	%r12d, %r12d
	leaq	.LC13(%rip), %rbx
	leaq	8(%rax), %r15
	.p2align 4,,10
	.p2align 3
.L401:
	movl	(%r15), %ecx
	movl	%r12d, %edx
	leaq	.LC12(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	lock addq	$1, 40+__gcov0.transitionBound(%rip)
	movl	(%r15), %esi
	testl	%esi, %esi
	jle	.L399
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L400:
	movq	-8(%r15), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	(%rax,%r14,8), %rax
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 48+__gcov0.transitionBound(%rip)
	addq	$1, %r14
	cmpl	%r14d, (%r15)
	jg	.L400
.L399:
	lock addq	$1, 56+__gcov0.transitionBound(%rip)
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 64+__gcov0.transitionBound(%rip)
	addl	$1, %r12d
	addq	$16, %r15
	cmpl	%r12d, -52(%rbp)
	jne	.L401
.L411:
	lock addq	$1, 72+__gcov0.transitionBound(%rip)
	leaq	.LC13(%rip), %rbx
	movl	$4, -76(%rbp)
.L406:
	movl	-52(%rbp), %r15d
	movq	-64(%rbp), %r14
	movl	-56(%rbp), %ecx
	movq	-72(%rbp), %rsi
	movl	%r15d, %edx
	movq	%r14, %rdi
	call	change_unit
	lock addq	$1, 80+__gcov0.transitionBound(%rip)
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 88+__gcov0.transitionBound(%rip)
	testl	%r15d, %r15d
	jle	.L402
	leaq	8(%r14), %r15
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L405:
	movl	(%r15), %ecx
	movl	%r12d, %edx
	leaq	.LC12(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	lock addq	$1, 96+__gcov0.transitionBound(%rip)
	movl	(%r15), %ecx
	testl	%ecx, %ecx
	jle	.L403
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L404:
	movq	-8(%r15), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	(%rax,%r14,8), %rax
	movl	(%rax), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 104+__gcov0.transitionBound(%rip)
	addq	$1, %r14
	cmpl	%r14d, (%r15)
	jg	.L404
.L403:
	lock addq	$1, 112+__gcov0.transitionBound(%rip)
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 120+__gcov0.transitionBound(%rip)
	addl	$1, %r12d
	addq	$16, %r15
	cmpl	%r12d, -52(%rbp)
	jne	.L405
.L402:
	lock addq	$1, 128+__gcov0.transitionBound(%rip)
	subl	$1, -76(%rbp)
	jne	.L406
	lock addq	$1, 136+__gcov0.transitionBound(%rip)
	movl	-52(%rbp), %edx
	testl	%edx, %edx
	jle	.L407
	movq	-64(%rbp), %rax
	xorl	%r14d, %r14d
	leaq	.LC13(%rip), %rbx
	leaq	8(%rax), %r15
	.p2align 4,,10
	.p2align 3
.L410:
	movl	(%r15), %r8d
	movl	%r14d, %ecx
	leaq	.LC12(%rip), %rdx
	movq	%r13, %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	lock addq	$1, 144+__gcov0.transitionBound(%rip)
	movl	(%r15), %eax
	testl	%eax, %eax
	jle	.L408
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L409:
	movq	-8(%r15), %rax
	movq	%rbx, %rdx
	movl	$1, %esi
	movq	%r13, %rdi
	movq	(%rax,%r12,8), %rax
	movl	(%rax), %ecx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	lock addq	$1, 152+__gcov0.transitionBound(%rip)
	addq	$1, %r12
	cmpl	%r12d, (%r15)
	jg	.L409
.L408:
	lock addq	$1, 160+__gcov0.transitionBound(%rip)
	leaq	.LC14(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	%r13, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 168+__gcov0.transitionBound(%rip)
	addl	$1, %r14d
	addq	$16, %r15
	cmpl	%r14d, -52(%rbp)
	jne	.L410
.L407:
	lock addq	$1, 176+__gcov0.transitionBound(%rip)
	movq	%r13, %rdi
	call	fclose@PLT
	lock addq	$1, 184+__gcov0.transitionBound(%rip)
	movq	-64(%rbp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L396:
	.cfi_restore_state
	lock addq	$1, 24+__gcov0.transitionBound(%rip)
	movl	-56(%rbp), %edx
	movl	-52(%rbp), %esi
	movq	-72(%rbp), %rdi
	call	first_cluster
	movq	%rax, -64(%rbp)
	lock addq	$1, 32+__gcov0.transitionBound(%rip)
	jmp	.L411
	.cfi_endproc
.LFE63:
	.size	transitionBound, .-transitionBound
	.p2align 4
	.globl	storeState
	.type	storeState, @function
storeState:
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
	subq	$24, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, -56(%rbp)
	movslq	%esi, %rdi
	movslq	%edx, %rbx
	movq	%rdi, %r13
	lock addq	$1, __gcov0.storeState(%rip)
	salq	$4, %rdi
	call	malloc@PLT
	movq	%rax, %r14
	testl	%r13d, %r13d
	jle	.L422
	movq	-56(%rbp), %rcx
	movq	%rax, %r15
	leal	-1(%r13), %eax
	leaq	0(,%rbx,8), %r12
	salq	$4, %rax
	leaq	8(%rcx), %rbx
	leaq	24(%rcx,%rax), %r13
	.p2align 4,,10
	.p2align 3
.L426:
	movq	%r12, %rdi
	call	malloc@PLT
	movl	$0, 8(%r15)
	movq	%rax, (%r15)
	lock addq	$1, 8+__gcov0.storeState(%rip)
	movl	(%rbx), %edx
	testl	%edx, %edx
	jle	.L424
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L425:
	movq	-8(%rbx), %rcx
	movq	(%rcx,%rdx,8), %rcx
	movq	%rcx, (%rax,%rdx,8)
	lock addq	$1, 16+__gcov0.storeState(%rip)
	addq	$1, %rdx
	cmpl	%edx, (%rbx)
	jg	.L425
.L424:
	addq	$16, %rbx
	addq	$16, %r15
	cmpq	%r13, %rbx
	jne	.L426
.L422:
	addq	$24, %rsp
	movq	%r14, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE64:
	.size	storeState, .-storeState
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_sub_I_00100_0, @function
_sub_I_00100_0:
.LFB65:
	.cfi_startproc
	endbr64
	leaq	.LPBX0(%rip), %rdi
	jmp	__gcov_init@PLT
	.cfi_endproc
.LFE65:
	.size	_sub_I_00100_0, .-_sub_I_00100_0
	.section	.init_array.00100,"aw"
	.align 8
	.quad	_sub_I_00100_0
	.section	.text.exit,"ax",@progbits
	.p2align 4
	.type	_sub_D_00100_1, @function
_sub_D_00100_1:
.LFB66:
	.cfi_startproc
	endbr64
	jmp	__gcov_exit@PLT
	.cfi_endproc
.LFE66:
	.size	_sub_D_00100_1, .-_sub_D_00100_1
	.section	.fini_array.00100,"aw"
	.align 8
	.quad	_sub_D_00100_1
	.section	.data.rel.local,"aw"
	.align 32
	.type	.LPBX1, @object
	.size	.LPBX1, 200
.LPBX1:
	.quad	__gcov_.storeState
	.quad	__gcov_.transitionBound
	.quad	__gcov_.DFS
	.quad	__gcov_.is_contiguous_after_removal
	.quad	__gcov_.change_unit
	.quad	__gcov_.contains
	.quad	__gcov_.are_remaining_units_contiguous
	.quad	__gcov_.dfs_contiguity_exclude
	.quad	__gcov_.are_neighbors_contiguous
	.quad	__gcov_.dfs_contiguity_check
	.quad	__gcov_.are_neighbors_contiguousss
	.quad	__gcov_.are_neighbors_contiguousd
	.quad	__gcov_.dfs_check_neighbors
	.quad	__gcov_.are_neighbors_contiguous00
	.quad	__gcov_.has_neighbor_in_cluster
	.quad	__gcov_.reset_visited
	.quad	__gcov_.first_cluster
	.quad	__gcov_.is_neighbor
	.quad	__gcov_.energy_compactness
	.quad	__gcov_.energy_population
	.quad	__gcov_.compactness
	.quad	__gcov_.compactness_s
	.quad	__gcov_.population_bounds
	.quad	__gcov_.popul_test1
	.quad	__gcov_._pop_ideal
	.align 32
	.type	__gcov_._pop_ideal, @object
	.size	__gcov_._pop_ideal, 40
__gcov_._pop_ideal:
	.quad	.LPBX0
	.long	1371204387
	.long	679707255
	.long	334540908
	.zero	4
	.long	2
	.zero	4
	.quad	__gcov0._pop_ideal
	.align 32
	.type	__gcov_.popul_test1, @object
	.size	__gcov_.popul_test1, 40
__gcov_.popul_test1:
	.quad	.LPBX0
	.long	515919635
	.long	-164139746
	.long	207843998
	.zero	4
	.long	5
	.zero	4
	.quad	__gcov0.popul_test1
	.align 32
	.type	__gcov_.population_bounds, @object
	.size	__gcov_.population_bounds, 40
__gcov_.population_bounds:
	.quad	.LPBX0
	.long	490045472
	.long	-1225336491
	.long	-1540324424
	.zero	4
	.long	1
	.zero	4
	.quad	__gcov0.population_bounds
	.align 32
	.type	__gcov_.compactness_s, @object
	.size	__gcov_.compactness_s, 40
__gcov_.compactness_s:
	.quad	.LPBX0
	.long	1168453911
	.long	211210620
	.long	-743752751
	.zero	4
	.long	5
	.zero	4
	.quad	__gcov0.compactness_s
	.align 32
	.type	__gcov_.compactness, @object
	.size	__gcov_.compactness, 40
__gcov_.compactness:
	.quad	.LPBX0
	.long	621085762
	.long	-1310572505
	.long	1139447479
	.zero	4
	.long	6
	.zero	4
	.quad	__gcov0.compactness
	.align 32
	.type	__gcov_.energy_population, @object
	.size	__gcov_.energy_population, 40
__gcov_.energy_population:
	.quad	.LPBX0
	.long	279141317
	.long	1873177470
	.long	141739543
	.zero	4
	.long	5
	.zero	4
	.quad	__gcov0.energy_population
	.align 32
	.type	__gcov_.energy_compactness, @object
	.size	__gcov_.energy_compactness, 40
__gcov_.energy_compactness:
	.quad	.LPBX0
	.long	652034717
	.long	-1093909491
	.long	-1192601709
	.zero	4
	.long	2
	.zero	4
	.quad	__gcov0.energy_compactness
	.align 32
	.type	__gcov_.is_neighbor, @object
	.size	__gcov_.is_neighbor, 40
__gcov_.is_neighbor:
	.quad	.LPBX0
	.long	1021019482
	.long	-1315714286
	.long	-1562846356
	.zero	4
	.long	3
	.zero	4
	.quad	__gcov0.is_neighbor
	.align 32
	.type	__gcov_.first_cluster, @object
	.size	__gcov_.first_cluster, 40
__gcov_.first_cluster:
	.quad	.LPBX0
	.long	457686930
	.long	335829849
	.long	-380827576
	.zero	4
	.long	19
	.zero	4
	.quad	__gcov0.first_cluster
	.align 32
	.type	__gcov_.reset_visited, @object
	.size	__gcov_.reset_visited, 40
__gcov_.reset_visited:
	.quad	.LPBX0
	.long	875338645
	.long	-1671335148
	.long	-1192601709
	.zero	4
	.long	2
	.zero	4
	.quad	__gcov0.reset_visited
	.align 32
	.type	__gcov_.has_neighbor_in_cluster, @object
	.size	__gcov_.has_neighbor_in_cluster, 40
__gcov_.has_neighbor_in_cluster:
	.quad	.LPBX0
	.long	742552788
	.long	357901970
	.long	513426919
	.zero	4
	.long	4
	.zero	4
	.quad	__gcov0.has_neighbor_in_cluster
	.align 32
	.type	__gcov_.are_neighbors_contiguous00, @object
	.size	__gcov_.are_neighbors_contiguous00, 40
__gcov_.are_neighbors_contiguous00:
	.quad	.LPBX0
	.long	616900872
	.long	1090591683
	.long	2046284110
	.zero	4
	.long	14
	.zero	4
	.quad	__gcov0.are_neighbors_contiguous00
	.align 32
	.type	__gcov_.dfs_check_neighbors, @object
	.size	__gcov_.dfs_check_neighbors, 40
__gcov_.dfs_check_neighbors:
	.quad	.LPBX0
	.long	523918190
	.long	1330510660
	.long	-875698785
	.zero	4
	.long	7
	.zero	4
	.quad	__gcov0.dfs_check_neighbors
	.align 32
	.type	__gcov_.are_neighbors_contiguousd, @object
	.size	__gcov_.are_neighbors_contiguousd, 40
__gcov_.are_neighbors_contiguousd:
	.quad	.LPBX0
	.long	436150292
	.long	787536631
	.long	1376482055
	.zero	4
	.long	6
	.zero	4
	.quad	__gcov0.are_neighbors_contiguousd
	.align 32
	.type	__gcov_.are_neighbors_contiguousss, @object
	.size	__gcov_.are_neighbors_contiguousss, 40
__gcov_.are_neighbors_contiguousss:
	.quad	.LPBX0
	.long	1663749854
	.long	-1768119143
	.long	1920027796
	.zero	4
	.long	9
	.zero	4
	.quad	__gcov0.are_neighbors_contiguousss
	.align 32
	.type	__gcov_.dfs_contiguity_check, @object
	.size	__gcov_.dfs_contiguity_check, 40
__gcov_.dfs_contiguity_check:
	.quad	.LPBX0
	.long	61974017
	.long	71439541
	.long	-875698785
	.zero	4
	.long	7
	.zero	4
	.quad	__gcov0.dfs_contiguity_check
	.align 32
	.type	__gcov_.are_neighbors_contiguous, @object
	.size	__gcov_.are_neighbors_contiguous, 40
__gcov_.are_neighbors_contiguous:
	.quad	.LPBX0
	.long	591483435
	.long	-230032877
	.long	1376482055
	.zero	4
	.long	6
	.zero	4
	.quad	__gcov0.are_neighbors_contiguous
	.align 32
	.type	__gcov_.dfs_contiguity_exclude, @object
	.size	__gcov_.dfs_contiguity_exclude, 40
__gcov_.dfs_contiguity_exclude:
	.quad	.LPBX0
	.long	1182882833
	.long	-9680878
	.long	-2055710150
	.zero	4
	.long	8
	.zero	4
	.quad	__gcov0.dfs_contiguity_exclude
	.align 32
	.type	__gcov_.are_remaining_units_contiguous, @object
	.size	__gcov_.are_remaining_units_contiguous, 40
__gcov_.are_remaining_units_contiguous:
	.quad	.LPBX0
	.long	2080394562
	.long	1703779025
	.long	-1582968321
	.zero	4
	.long	6
	.zero	4
	.quad	__gcov0.are_remaining_units_contiguous
	.align 32
	.type	__gcov_.contains, @object
	.size	__gcov_.contains, 40
__gcov_.contains:
	.quad	.LPBX0
	.long	214954695
	.long	2017912689
	.long	-1562846356
	.zero	4
	.long	3
	.zero	4
	.quad	__gcov0.contains
	.align 32
	.type	__gcov_.change_unit, @object
	.size	__gcov_.change_unit, 40
__gcov_.change_unit:
	.quad	.LPBX0
	.long	785053420
	.long	909450109
	.long	-1938118044
	.zero	4
	.long	32
	.zero	4
	.quad	__gcov0.change_unit
	.align 32
	.type	__gcov_.is_contiguous_after_removal, @object
	.size	__gcov_.is_contiguous_after_removal, 40
__gcov_.is_contiguous_after_removal:
	.quad	.LPBX0
	.long	1047737186
	.long	-2134013457
	.long	2103658024
	.zero	4
	.long	11
	.zero	4
	.quad	__gcov0.is_contiguous_after_removal
	.align 32
	.type	__gcov_.DFS, @object
	.size	__gcov_.DFS, 40
__gcov_.DFS:
	.quad	.LPBX0
	.long	2095234574
	.long	-899119135
	.long	1464906663
	.zero	4
	.long	13
	.zero	4
	.quad	__gcov0.DFS
	.align 32
	.type	__gcov_.transitionBound, @object
	.size	__gcov_.transitionBound, 40
__gcov_.transitionBound:
	.quad	.LPBX0
	.long	1434185528
	.long	832755161
	.long	826105140
	.zero	4
	.long	24
	.zero	4
	.quad	__gcov0.transitionBound
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"/home/mariana/tese/SA/state.gcda"
	.section	.data.rel,"aw"
	.align 32
	.type	.LPBX0, @object
	.size	.LPBX0, 120
.LPBX0:
	.long	1094267690
	.zero	4
	.quad	0
	.long	-1681997158
	.zero	4
	.quad	.LC16
	.quad	__gcov_merge_add
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	25
	.zero	4
	.quad	.LPBX1
	.section	.data.rel.local
	.align 32
	.type	__gcov_.storeState, @object
	.size	__gcov_.storeState, 40
__gcov_.storeState:
	.quad	.LPBX0
	.long	1521594313
	.long	1787655345
	.long	449688241
	.zero	4
	.long	3
	.zero	4
	.quad	__gcov0.storeState
	.local	__gcov0._pop_ideal
	.comm	__gcov0._pop_ideal,16,16
	.local	__gcov0.popul_test1
	.comm	__gcov0.popul_test1,40,32
	.local	__gcov0.population_bounds
	.comm	__gcov0.population_bounds,8,8
	.local	__gcov0.compactness_s
	.comm	__gcov0.compactness_s,40,32
	.local	__gcov0.compactness
	.comm	__gcov0.compactness,48,32
	.local	__gcov0.energy_population
	.comm	__gcov0.energy_population,40,32
	.local	__gcov0.energy_compactness
	.comm	__gcov0.energy_compactness,16,16
	.local	__gcov0.is_neighbor
	.comm	__gcov0.is_neighbor,24,16
	.local	__gcov0.first_cluster
	.comm	__gcov0.first_cluster,152,32
	.local	__gcov0.reset_visited
	.comm	__gcov0.reset_visited,16,16
	.local	__gcov0.has_neighbor_in_cluster
	.comm	__gcov0.has_neighbor_in_cluster,32,32
	.local	__gcov0.are_neighbors_contiguous00
	.comm	__gcov0.are_neighbors_contiguous00,112,32
	.local	__gcov0.dfs_check_neighbors
	.comm	__gcov0.dfs_check_neighbors,56,32
	.local	__gcov0.are_neighbors_contiguousd
	.comm	__gcov0.are_neighbors_contiguousd,48,32
	.local	__gcov0.are_neighbors_contiguousss
	.comm	__gcov0.are_neighbors_contiguousss,72,32
	.local	__gcov0.dfs_contiguity_check
	.comm	__gcov0.dfs_contiguity_check,56,32
	.local	__gcov0.are_neighbors_contiguous
	.comm	__gcov0.are_neighbors_contiguous,48,32
	.local	__gcov0.dfs_contiguity_exclude
	.comm	__gcov0.dfs_contiguity_exclude,64,32
	.local	__gcov0.are_remaining_units_contiguous
	.comm	__gcov0.are_remaining_units_contiguous,48,32
	.local	__gcov0.contains
	.comm	__gcov0.contains,24,16
	.local	__gcov0.change_unit
	.comm	__gcov0.change_unit,256,32
	.local	__gcov0.is_contiguous_after_removal
	.comm	__gcov0.is_contiguous_after_removal,88,32
	.local	__gcov0.DFS
	.comm	__gcov0.DFS,104,32
	.local	__gcov0.transitionBound
	.comm	__gcov0.transitionBound,192,32
	.local	__gcov0.storeState
	.comm	__gcov0.storeState,24,16
	.section	.rodata
	.align 32
	.type	CSWTCH.8, @object
	.size	CSWTCH.8, 72
CSWTCH.8:
	.long	80707
	.long	61494
	.long	77817
	.long	70771
	.long	85038
	.long	76019
	.long	68348
	.long	75360
	.long	75768
	.long	83049
	.long	80044
	.long	96391
	.long	79739
	.long	76178
	.long	81908
	.long	80306
	.long	73029
	.long	86991
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	1717986918
	.long	1072850534
	.align 8
.LC3:
	.long	858993459
	.long	1072378675
	.align 8
.LC8:
	.long	4294967295
	.long	2146435071
	.align 8
.LC10:
	.long	0
	.long	1072693248
	.align 8
.LC11:
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
