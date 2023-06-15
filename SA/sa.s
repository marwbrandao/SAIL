	.file	"sa.c"
	.text
	.p2align 4
	.globl	getTemperature
	.type	getTemperature, @function
getTemperature:
.LFB47:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$8, %rsp
	.cfi_offset 3, -24
1:	call	*mcount@GOTPCREL(%rip)
	movl	%edi, %ebx
	lock addq	$1, __gcov0.getTemperature(%rip)
	movsd	.LC0(%rip), %xmm1
	subsd	%xmm0, %xmm1
	divsd	%xmm1, %xmm0
	call	log2@PLT
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ebx, %xmm1
	subsd	.LC1(%rip), %xmm1
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
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
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
1:	call	*mcount@GOTPCREL(%rip)
	movq	%rdi, %r12
	movsd	%xmm0, -24(%rbp)
	lock addq	$1, __gcov0.getEll(%rip)
	call	arc4random@PLT
	movl	%eax, %ebx
	lock addq	$1, 8+__gcov0.getEll(%rip)
	movl	$1, %eax
	movl	%ebx, (%r12)
	testl	%ebx, %ebx
	jne	.L11
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_restore_state
	movl	%ebx, %eax
	pxor	%xmm0, %xmm0
	negl	%eax
	movl	%eax, %eax
	cvtsi2sdq	%rax, %xmm0
	call	log2@PLT
	movsd	%xmm0, -32(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rbx, %xmm0
	call	log2@PLT
	movsd	-32(%rbp), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	divsd	-24(%rbp), %xmm0
	call	round@PLT
	lock addq	$1, 16+__gcov0.getEll(%rip)
	addq	$16, %rsp
	cvttsd2sil	%xmm0, %eax
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE48:
	.size	getEll, .-getEll
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"ideal pop: %d\n"
.LC4:
	.string	"\nBest solution found:\n"
.LC5:
	.string	"Best solution found:\n"
.LC6:
	.string	"%d:"
.LC7:
	.string	"%d,"
.LC8:
	.string	" --> popula\303\247\303\243o: %d"
.LC9:
	.string	"\n"
.LC10:
	.string	"deviation: %d\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC12:
	.string	"final population deviation to theoretical best value: %lf%%\n"
	.align 8
.LC13:
	.string	"maximum deviation of population between electoral districts: %lf%%\n"
	.section	.rodata.str1.1
.LC14:
	.string	"fronteiras internas: %d\n\n"
	.text
	.p2align 4
	.globl	print_best_clusters
	.type	print_best_clusters, @function
print_best_clusters:
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
	subq	$40, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movl	%edx, -68(%rbp)
	movl	%edx, %ebx
	movq	%rdi, %r14
	movq	%r8, %r12
	movl	%r9d, %edx
	movq	%rdi, -80(%rbp)
	movl	%r9d, -72(%rbp)
	lock addq	$1, __gcov0.print_best_clusters(%rip)
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 8+__gcov0.print_best_clusters(%rip)
	leaq	.LC4(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 16+__gcov0.print_best_clusters(%rip)
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 24+__gcov0.print_best_clusters(%rip)
	testl	%ebx, %ebx
	jle	.L17
	movl	$0, -60(%rbp)
	leaq	8(%r14), %r15
	leaq	.LC7(%rip), %rbx
	movl	$0, -64(%rbp)
	.p2align 4,,10
	.p2align 3
.L16:
	lock addq	$1, 104+__gcov0.print_best_clusters(%rip)
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	-60(%rbp), %r14d
	movl	%r14d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 32+__gcov0.print_best_clusters(%rip)
	leaq	.LC6(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	%r14d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 40+__gcov0.print_best_clusters(%rip)
	movl	(%r15), %eax
	testl	%eax, %eax
	jle	.L18
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L15:
	lock addq	$1, 56+__gcov0.print_best_clusters(%rip)
	movl	$1, %edi
	movq	-8(%r15), %rax
	movq	(%rax,%r13,8), %rax
	movl	(%rax), %ecx
	addl	8(%rax), %r14d
	movq	%rbx, %rsi
	xorl	%eax, %eax
	movl	%ecx, %edx
	movl	%ecx, -56(%rbp)
	call	__printf_chk@PLT
	lock addq	$1, 48+__gcov0.print_best_clusters(%rip)
	movl	$1, %esi
	xorl	%eax, %eax
	movl	-56(%rbp), %ecx
	movq	%rbx, %rdx
	movq	%r12, %rdi
	addq	$1, %r13
	call	__fprintf_chk@PLT
	cmpl	%r13d, (%r15)
	jg	.L15
.L14:
	lock addq	$1, 64+__gcov0.print_best_clusters(%rip)
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	%r14d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 72+__gcov0.print_best_clusters(%rip)
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 80+__gcov0.print_best_clusters(%rip)
	leaq	.LC8(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	%r14d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 88+__gcov0.print_best_clusters(%rip)
	leaq	.LC9(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 96+__gcov0.print_best_clusters(%rip)
	leaq	.LC10(%rip), %rsi
	movl	$1, %edi
	movl	%r14d, %r9d
	subl	-72(%rbp), %r9d
	movl	%r9d, %eax
	sarl	$31, %eax
	xorl	%eax, %r9d
	subl	%eax, %r9d
	xorl	%eax, %eax
	movl	%r9d, %edx
	movl	%r9d, -56(%rbp)
	call	__printf_chk@PLT
	movl	-64(%rbp), %eax
	movl	-56(%rbp), %r9d
	cmpl	%r9d, %eax
	cmovge	%eax, %r9d
	addl	$1, -60(%rbp)
	addq	$16, %r15
	movl	-60(%rbp), %eax
	movl	%r9d, -64(%rbp)
	cmpl	%eax, -68(%rbp)
	jne	.L16
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%r9d, %xmm0
	cvtsi2sdl	-72(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	mulsd	.LC11(%rip), %xmm0
.L13:
	lock addq	$1, 112+__gcov0.print_best_clusters(%rip)
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC12(%rip), %rsi
	movsd	%xmm0, -56(%rbp)
	call	__printf_chk@PLT
	lock addq	$1, 120+__gcov0.print_best_clusters(%rip)
	movl	$1, %esi
	movl	$1, %eax
	leaq	.LC12(%rip), %rdx
	movsd	-56(%rbp), %xmm0
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 128+__gcov0.print_best_clusters(%rip)
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC13(%rip), %rsi
	movsd	-56(%rbp), %xmm0
	call	__printf_chk@PLT
	lock addq	$1, 136+__gcov0.print_best_clusters(%rip)
	movl	$1, %esi
	movl	$1, %eax
	leaq	.LC13(%rip), %rdx
	movsd	-56(%rbp), %xmm0
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 144+__gcov0.print_best_clusters(%rip)
	movl	-68(%rbp), %esi
	movq	-80(%rbp), %rdi
	call	energy_compactness@PLT
	movl	%eax, %r13d
	lock addq	$1, 152+__gcov0.print_best_clusters(%rip)
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 160+__gcov0.print_best_clusters(%rip)
	leaq	.LC14(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	%r13d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 168+__gcov0.print_best_clusters(%rip)
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
.L18:
	.cfi_restore_state
	xorl	%r14d, %r14d
	jmp	.L14
.L17:
	pxor	%xmm0, %xmm0
	jmp	.L13
	.cfi_endproc
.LFE49:
	.size	print_best_clusters, .-print_best_clusters
	.section	.rodata.str1.1
.LC15:
	.string	"\nSA start!\n\n"
.LC16:
	.string	"w"
.LC17:
	.string	"output.txt"
.LC18:
	.string	"SA_graph.txt"
.LC19:
	.string	"%d;%d;%d\n"
.LC20:
	.string	"0,%d:"
.LC21:
	.string	"Cluster %d with size %d: "
.LC22:
	.string	"%d "
.LC23:
	.string	"cluster_info.txt"
.LC26:
	.string	"%d,%d:"
.LC27:
	.string	"prob: %f and random: %f\n"
.LC28:
	.string	"%d,%f,%f\n"
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"----->iteration: %d, perfect: %d, not_perfect: %d\n"
	.section	.rodata.str1.1
.LC30:
	.string	"fronteiras: %d prob: %f\n\n"
.LC31:
	.string	"SA end!\n"
	.text
	.p2align 4
	.globl	runSA
	.type	runSA, @function
runSA:
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
	movapd	%xmm0, %xmm5
	movsd	%xmm0, -96(%rbp)
	movl	%esi, %ebx
	movapd	%xmm1, %xmm0
	movq	%rdx, %r13
	movl	%ecx, %r14d
	movl	%r8d, %r15d
	movq	%rdx, -104(%rbp)
	movl	%ecx, -64(%rbp)
	movl	%r8d, -84(%rbp)
	movl	%r9d, -140(%rbp)
	lock addq	$1, __gcov0.runSA(%rip)
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%esi, %xmm1
	divsd	%xmm5, %xmm0
	movsd	.LC0(%rip), %xmm5
	divsd	%xmm1, %xmm5
	movapd	%xmm5, %xmm1
	call	pow@PLT
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movsd	%xmm0, -136(%rbp)
	call	__printf_chk@PLT
	lock addq	$1, 8+__gcov0.runSA(%rip)
	xorl	%edi, %edi
	call	time@PLT
	movq	%rax, %rdi
	lock addq	$1, 16+__gcov0.runSA(%rip)
	call	srand@PLT
	lock addq	$1, 24+__gcov0.runSA(%rip)
	leaq	.LC16(%rip), %rsi
	leaq	.LC17(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %r12
	lock addq	$1, 32+__gcov0.runSA(%rip)
	leaq	.LC16(%rip), %rsi
	leaq	.LC18(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -176(%rbp)
	lock addq	$1, 40+__gcov0.runSA(%rip)
	leaq	.LC19(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	%ebx, %r9d
	movl	%r15d, %r8d
	movl	%r14d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 48+__gcov0.runSA(%rip)
	movl	%r15d, %edx
	movl	%r14d, %esi
	movq	%r13, %rdi
	call	first_cluster@PLT
	movq	%rax, -112(%rbp)
	lock addq	$1, 56+__gcov0.runSA(%rip)
	testl	%r14d, %r14d
	jle	.L22
	movl	$0, -60(%rbp)
	leaq	8(%rax), %r15
	leaq	.LC22(%rip), %rbx
.L25:
	lock addq	$1, 120+__gcov0.runSA(%rip)
	leaq	.LC20(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	-60(%rbp), %r14d
	movl	%r14d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 64+__gcov0.runSA(%rip)
	leaq	.LC21(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	(%r15), %ecx
	movl	%r14d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 72+__gcov0.runSA(%rip)
	movl	(%r15), %r8d
	testl	%r8d, %r8d
	jle	.L66
	movq	%r12, -56(%rbp)
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L24:
	lock addq	$1, 88+__gcov0.runSA(%rip)
	movl	$1, %edi
	movq	-8(%r15), %rax
	movq	(%rax,%r13,8), %rax
	movl	(%rax), %r12d
	movq	%rbx, %rsi
	xorl	%eax, %eax
	movl	%r12d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 80+__gcov0.runSA(%rip)
	leaq	.LC7(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	-56(%rbp), %rdi
	movl	%r12d, %ecx
	call	__fprintf_chk@PLT
	movq	-8(%r15), %rax
	movq	(%rax,%r13,8), %rax
	addq	$1, %r13
	addl	8(%rax), %r14d
	cmpl	%r13d, (%r15)
	jg	.L24
	movq	-56(%rbp), %r12
.L23:
	lock addq	$1, 96+__gcov0.runSA(%rip)
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	%r14d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 104+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 112+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	addq	$16, %r15
	call	__fprintf_chk@PLT
	addl	$1, -60(%rbp)
	movl	-60(%rbp), %eax
	cmpl	%eax, -64(%rbp)
	jne	.L25
.L22:
	lock addq	$1, 128+__gcov0.runSA(%rip)
	movl	$-2147483648, %ebx
	leaq	.LC7(%rip), %r14
	movslq	-64(%rbp), %rax
	movq	%rax, %rsi
	salq	$4, %rax
	movq	%rax, -192(%rbp)
	movslq	-84(%rbp), %rax
	movl	$1, -60(%rbp)
	salq	$3, %rax
	movl	%ebx, -56(%rbp)
	movq	%rax, -200(%rbp)
	leal	-1(%rsi), %eax
	movq	$0, -168(%rbp)
	salq	$4, %rax
	movq	%rax, -184(%rbp)
	movabsq	$9223372036854775807, %rax
	movl	$0, -152(%rbp)
	movq	%rax, %r13
	movl	$0, -144(%rbp)
	movl	$-2147483648, -148(%rbp)
	movq	%rax, -160(%rbp)
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L26:
	lock addq	$1, 136+__gcov0.runSA(%rip)
	leaq	.LC16(%rip), %rsi
	leaq	.LC23(%rip), %rdi
	call	fopen@PLT
	lock addq	$1, 144+__gcov0.runSA(%rip)
	movl	-64(%rbp), %r15d
	movq	-112(%rbp), %rbx
	movl	-84(%rbp), %ecx
	movq	-104(%rbp), %rsi
	movl	%r15d, %edx
	movq	%rbx, %rdi
	call	change_unit@PLT
	lock addq	$1, 152+__gcov0.runSA(%rip)
	movl	16(%rbp), %r9d
	movl	-84(%rbp), %r8d
	movl	-140(%rbp), %edx
	movq	-104(%rbp), %rdi
	movl	%r15d, %ecx
	movq	%rbx, %rsi
	call	energy_population@PLT
	movq	%rax, -80(%rbp)
	lock addq	$1, 160+__gcov0.runSA(%rip)
	movl	%r15d, %esi
	movq	%rbx, %rdi
	call	energy_compactness@PLT
	movl	-56(%rbp), %edx
	movl	%eax, -88(%rbp)
	cmpl	%edx, %eax
	setg	%al
	cmpq	$0, -80(%rbp)
	jne	.L33
	testb	%al, %al
	je	.L33
	addl	$1, -144(%rbp)
	lock addq	$1, 168+__gcov0.runSA(%rip)
	call	rand@PLT
	lock addq	$1, 200+__gcov0.runSA(%rip)
	movsd	.LC0(%rip), %xmm4
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	divsd	.LC24(%rip), %xmm0
	comisd	%xmm0, %xmm4
	movsd	%xmm0, -120(%rbp)
	ja	.L120
.L35:
	movl	-60(%rbp), %eax
	movq	%rax, %rdi
	imulq	$2111067603, %rax, %rax
	shrq	$48, %rax
	imull	$133333, %eax, %eax
	cmpl	%eax, %edi
	je	.L121
.L55:
	movsd	-96(%rbp), %xmm2
	mulsd	-136(%rbp), %xmm2
	addl	$1, -60(%rbp)
	movl	-60(%rbp), %eax
	movsd	%xmm2, -96(%rbp)
	cmpl	$2000001, %eax
	je	.L122
.L60:
	lock addq	$1, __gcov0.getEll(%rip)
	call	arc4random@PLT
	lock addq	$1, 8+__gcov0.getEll(%rip)
	testl	%eax, %eax
	je	.L26
	movl	%eax, %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm6, %xmm6
	negl	%edx
	movl	%edx, %edx
	cvtsi2sdq	%rdx, %xmm0
	ucomisd	%xmm0, %xmm6
	jnb	.L123
.L29:
	movl	%eax, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm7, %xmm7
	cvtsi2sdq	%rax, %xmm0
	ucomisd	%xmm0, %xmm7
	jnb	.L124
.L32:
	lock addq	$1, 16+__gcov0.getEll(%rip)
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L33:
	cmpq	%r13, -80(%rbp)
	jle	.L36
	testb	%al, %al
	je	.L36
	lock addq	$1, 176+__gcov0.runSA(%rip)
.L119:
	movl	-60(%rbp), %eax
	pxor	%xmm0, %xmm0
	subl	$1, %eax
	cvtsi2sdl	%eax, %xmm0
	mulsd	.LC25(%rip), %xmm0
	addsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -128(%rbp)
	call	rand@PLT
	lock addq	$1, 200+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	movsd	-128(%rbp), %xmm5
	cvtsi2sdl	%eax, %xmm0
	divsd	.LC24(%rip), %xmm0
	comisd	%xmm0, %xmm5
	movsd	%xmm0, -120(%rbp)
	jbe	.L35
	ucomisd	.LC0(%rip), %xmm5
	jp	.L64
	je	.L34
.L64:
	lock addq	$1, 208+__gcov0.runSA(%rip)
	addl	$1, -152(%rbp)
.L34:
	movl	-148(%rbp), %esi
	cmpl	%esi, -88(%rbp)
	jle	.L73
	movq	-160(%rbp), %rsi
	cmpq	%rsi, -80(%rbp)
	jle	.L41
.L73:
	lock addq	$1, 216+__gcov0.runSA(%rip)
	movl	-148(%rbp), %esi
	cmpl	%esi, -88(%rbp)
	jl	.L43
	movq	-160(%rbp), %rsi
	cmpq	%rsi, -80(%rbp)
	jl	.L125
.L43:
	movl	-64(%rbp), %ecx
	testl	%ecx, %ecx
	jle	.L68
	movq	-112(%rbp), %rax
	leaq	8(%rax), %r13
.L50:
	movl	$0, -56(%rbp)
	movq	%r13, %r15
	movl	$0, -72(%rbp)
	.p2align 4,,10
	.p2align 3
.L54:
	lock addq	$1, 296+__gcov0.runSA(%rip)
	leaq	.LC26(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	-56(%rbp), %r8d
	movl	-60(%rbp), %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 264+__gcov0.runSA(%rip)
	movl	(%r15), %edx
	testl	%edx, %edx
	jle	.L69
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L53:
	movq	-8(%r15), %rax
	movq	%r14, %rdx
	movl	$1, %esi
	movq	%r12, %rdi
	movq	(%rax,%rbx,8), %rax
	movl	(%rax), %ecx
	addl	8(%rax), %r13d
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	lock addq	$1, 272+__gcov0.runSA(%rip)
	addq	$1, %rbx
	cmpl	%ebx, (%r15)
	jg	.L53
.L52:
	lock addq	$1, 280+__gcov0.runSA(%rip)
	leaq	.LC8(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	%r13d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 288+__gcov0.runSA(%rip)
	xorl	%eax, %eax
	movl	$1, %esi
	leaq	.LC9(%rip), %rdx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	movl	%r13d, %r9d
	subl	16(%rbp), %r9d
	movl	%r9d, %eax
	sarl	$31, %eax
	xorl	%eax, %r9d
	subl	%eax, %r9d
	movl	-72(%rbp), %eax
	cmpl	%r9d, %eax
	cmovge	%eax, %r9d
	addl	$1, -56(%rbp)
	addq	$16, %r15
	movl	-56(%rbp), %eax
	movl	%r9d, -72(%rbp)
	cmpl	%eax, -64(%rbp)
	jg	.L54
.L51:
	lock addq	$1, 304+__gcov0.runSA(%rip)
	movl	$1, %esi
	movl	$2, %eax
	leaq	.LC27(%rip), %rdx
	movsd	-120(%rbp), %xmm1
	movsd	-128(%rbp), %xmm0
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 312+__gcov0.runSA(%rip)
	leaq	.LC14(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	-88(%rbp), %ebx
	movl	%ebx, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 320+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	leaq	.LC28(%rip), %rdx
	movl	$1, %esi
	movl	$2, %eax
	movl	-60(%rbp), %ecx
	movq	-176(%rbp), %rdi
	cvtsi2sdl	16(%rbp), %xmm1
	cvtsi2sdl	-72(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	movsd	-96(%rbp), %xmm1
	mulsd	.LC11(%rip), %xmm0
	call	__fprintf_chk@PLT
	lock addq	$1, 328+__gcov0.runSA(%rip)
	movl	-84(%rbp), %edx
	movl	-64(%rbp), %esi
	movq	-112(%rbp), %rdi
	call	storeState@PLT
	lock addq	$1, 336+__gcov0.runSA(%rip)
	movq	-80(%rbp), %r13
	movl	%ebx, -56(%rbp)
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L36:
	lock addq	$1, 184+__gcov0.runSA(%rip)
	movl	-56(%rbp), %esi
	cmpl	%esi, -88(%rbp)
	jge	.L38
	cmpq	%r13, -80(%rbp)
	jge	.L38
	lock addq	$1, 192+__gcov0.runSA(%rip)
	jmp	.L119
	.p2align 4,,10
	.p2align 3
.L69:
	xorl	%r13d, %r13d
	jmp	.L52
.L121:
	lock addq	$1, 344+__gcov0.runSA(%rip)
	leaq	.LC29(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	-60(%rbp), %ebx
	movl	-152(%rbp), %r8d
	movl	-144(%rbp), %ecx
	movl	%ebx, %edx
	call	__printf_chk@PLT
	lock addq	$1, 352+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	movl	%ebx, %eax
	subl	$1, %eax
	cvtsi2sdl	%eax, %xmm0
	mulsd	.LC25(%rip), %xmm0
	movl	-64(%rbp), %eax
	addsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -72(%rbp)
	testl	%eax, %eax
	jle	.L56
	movq	-112(%rbp), %rsi
	xorl	%r15d, %r15d
	movq	%r12, -80(%rbp)
	movl	%r15d, %r12d
	leaq	8(%rsi), %rbx
	movq	%rbx, %r15
	movl	%eax, %ebx
	.p2align 4,,10
	.p2align 3
.L59:
	lock addq	$1, 384+__gcov0.runSA(%rip)
	leaq	.LC21(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	(%r15), %ecx
	movl	%r12d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 360+__gcov0.runSA(%rip)
	xorl	%edx, %edx
	movl	(%r15), %eax
	testl	%eax, %eax
	jle	.L57
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L58:
	movq	-8(%r15), %rcx
	movq	(%rcx,%rax,8), %rcx
	addl	8(%rcx), %edx
	lock addq	$1, 368+__gcov0.runSA(%rip)
	addq	$1, %rax
	cmpl	%eax, (%r15)
	jg	.L58
.L57:
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 376+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addl	$1, %r12d
	addq	$16, %r15
	cmpl	%r12d, %ebx
	jne	.L59
	movq	-80(%rbp), %r12
.L56:
	lock addq	$1, 392+__gcov0.runSA(%rip)
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC30(%rip), %rsi
	movsd	-72(%rbp), %xmm0
	movl	-88(%rbp), %edx
	call	__printf_chk@PLT
	lock addq	$1, 400+__gcov0.runSA(%rip)
	movl	$0, -152(%rbp)
	movl	$0, -144(%rbp)
	jmp	.L55
.L120:
	movsd	%xmm4, -128(%rbp)
	jmp	.L34
.L125:
	lock addq	$1, 224+__gcov0.runSA(%rip)
.L41:
	cmpq	$0, -168(%rbp)
	je	.L126
	lock addq	$1, 248+__gcov0.runSA(%rip)
	movl	-64(%rbp), %esi
	testl	%esi, %esi
	jle	.L48
.L65:
	movq	-112(%rbp), %rax
	xorl	%ebx, %ebx
	movl	-64(%rbp), %r15d
	movq	%r12, -56(%rbp)
	leaq	8(%rax), %r13
	movq	%r13, -72(%rbp)
	movq	%r13, %r12
	movq	%rbx, %r13
	movq	-168(%rbp), %rbx
	.p2align 4,,10
	.p2align 3
.L49:
	movl	(%r12), %edx
	movq	%r13, %rax
	movq	-8(%r12), %rsi
	salq	$4, %rax
	movl	%edx, 8(%rbx,%rax)
	movslq	(%r12), %rdx
	movq	(%rbx,%rax), %rdi
	salq	$3, %rdx
	call	memcpy@PLT
	lock addq	$1, 256+__gcov0.runSA(%rip)
	addq	$1, %r13
	addq	$16, %r12
	cmpl	%r13d, %r15d
	jg	.L49
	movl	-88(%rbp), %eax
	movq	-56(%rbp), %r12
	movq	-72(%rbp), %r13
	movl	%eax, -148(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -160(%rbp)
	jmp	.L50
.L38:
	call	rand@PLT
	lock addq	$1, 200+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	divsd	.LC24(%rip), %xmm0
	movapd	%xmm0, %xmm6
	movsd	%xmm0, -120(%rbp)
	pxor	%xmm0, %xmm0
	comisd	%xmm6, %xmm0
	jbe	.L35
	movsd	%xmm0, -128(%rbp)
	jmp	.L64
.L68:
	movl	$0, -72(%rbp)
	jmp	.L51
.L45:
	lock addq	$1, 248+__gcov0.runSA(%rip)
.L48:
	movl	-88(%rbp), %eax
	movl	$0, -72(%rbp)
	movl	%eax, -148(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -160(%rbp)
	jmp	.L51
.L126:
	lock addq	$1, 232+__gcov0.runSA(%rip)
	movq	-192(%rbp), %rdi
	call	malloc@PLT
	movl	-64(%rbp), %edi
	movq	%rax, -168(%rbp)
	testl	%edi, %edi
	jle	.L45
	movq	-184(%rbp), %rsi
	movq	-200(%rbp), %r13
	movq	%rax, %r15
	leaq	16(%rax,%rsi), %rbx
.L46:
	movq	%r13, %rdi
	call	malloc@PLT
	movl	$0, 8(%r15)
	movq	%rax, (%r15)
	lock addq	$1, 240+__gcov0.runSA(%rip)
	addq	$16, %r15
	cmpq	%rbx, %r15
	jne	.L46
	lock addq	$1, 248+__gcov0.runSA(%rip)
	jmp	.L65
.L122:
	lock addq	$1, 408+__gcov0.runSA(%rip)
	movq	-168(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L61
	lock addq	$1, 416+__gcov0.runSA(%rip)
	movl	-64(%rbp), %r14d
	movl	16(%rbp), %r9d
	movl	-84(%rbp), %ecx
	movq	-104(%rbp), %rsi
	movl	%r14d, %edx
	movq	%r12, %r8
	movq	%rbx, %rdi
	call	print_best_clusters
	lock addq	$1, 424+__gcov0.runSA(%rip)
	testl	%r14d, %r14d
	jle	.L62
	movq	-184(%rbp), %rsi
	leaq	16(%rbx,%rsi), %r13
.L63:
	movq	(%rbx), %rdi
	call	free@PLT
	lock addq	$1, 432+__gcov0.runSA(%rip)
	addq	$16, %rbx
	cmpq	%rbx, %r13
	jne	.L63
.L62:
	movq	-168(%rbp), %rdi
	call	free@PLT
.L61:
	movq	%r12, %rdi
	call	fclose@PLT
	lock addq	$1, 440+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 448+__gcov0.runSA(%rip)
	leaq	.LC31(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 456+__gcov0.runSA(%rip)
	xorl	%eax, %eax
	addq	$168, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L66:
	.cfi_restore_state
	xorl	%r14d, %r14d
	jmp	.L23
.L123:
	movl	%eax, -72(%rbp)
	call	log2@PLT
	movl	-72(%rbp), %eax
	jmp	.L29
.L124:
	call	log2@PLT
	jmp	.L32
	.cfi_endproc
.LFE50:
	.size	runSA, .-runSA
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_sub_I_00100_0, @function
_sub_I_00100_0:
.LFB51:
	.cfi_startproc
	endbr64
	leaq	.LPBX0(%rip), %rdi
	jmp	__gcov_init@PLT
	.cfi_endproc
.LFE51:
	.size	_sub_I_00100_0, .-_sub_I_00100_0
	.section	.init_array.00100,"aw"
	.align 8
	.quad	_sub_I_00100_0
	.section	.text.exit,"ax",@progbits
	.p2align 4
	.type	_sub_D_00100_1, @function
_sub_D_00100_1:
.LFB52:
	.cfi_startproc
	endbr64
	jmp	__gcov_exit@PLT
	.cfi_endproc
.LFE52:
	.size	_sub_D_00100_1, .-_sub_D_00100_1
	.section	.fini_array.00100,"aw"
	.align 8
	.quad	_sub_D_00100_1
	.section	.data.rel.local,"aw"
	.align 32
	.type	.LPBX1, @object
	.size	.LPBX1, 32
.LPBX1:
	.quad	__gcov_.runSA
	.quad	__gcov_.print_best_clusters
	.quad	__gcov_.getEll
	.quad	__gcov_.getTemperature
	.align 32
	.type	__gcov_.getTemperature, @object
	.size	__gcov_.getTemperature, 40
__gcov_.getTemperature:
	.quad	.LPBX0
	.long	5476361
	.long	-1425047581
	.long	-1540324424
	.zero	4
	.long	1
	.zero	4
	.quad	__gcov0.getTemperature
	.align 32
	.type	__gcov_.getEll, @object
	.size	__gcov_.getEll, 40
__gcov_.getEll:
	.quad	.LPBX0
	.long	1184119545
	.long	-1215728834
	.long	-694105602
	.zero	4
	.long	3
	.zero	4
	.quad	__gcov0.getEll
	.align 32
	.type	__gcov_.print_best_clusters, @object
	.size	__gcov_.print_best_clusters, 40
__gcov_.print_best_clusters:
	.quad	.LPBX0
	.long	1728803614
	.long	1013338324
	.long	568912973
	.zero	4
	.long	22
	.zero	4
	.quad	__gcov0.print_best_clusters
	.section	.rodata.str1.1
.LC32:
	.string	"/home/mariana/tese/SA/sa.gcda"
	.section	.data.rel,"aw"
	.align 32
	.type	.LPBX0, @object
	.size	.LPBX0, 120
.LPBX0:
	.long	1094267690
	.zero	4
	.quad	0
	.long	-1132333716
	.zero	4
	.quad	.LC32
	.quad	__gcov_merge_add
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	4
	.zero	4
	.quad	.LPBX1
	.section	.data.rel.local
	.align 32
	.type	__gcov_.runSA, @object
	.size	__gcov_.runSA, 40
__gcov_.runSA:
	.quad	.LPBX0
	.long	792344964
	.long	113728392
	.long	-1044651671
	.zero	4
	.long	58
	.zero	4
	.quad	__gcov0.runSA
	.local	__gcov0.getTemperature
	.comm	__gcov0.getTemperature,8,8
	.local	__gcov0.getEll
	.comm	__gcov0.getEll,24,16
	.local	__gcov0.print_best_clusters
	.comm	__gcov0.print_best_clusters,176,32
	.local	__gcov0.runSA
	.comm	__gcov0.runSA,464,32
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
.LC11:
	.long	0
	.long	1079574528
	.align 8
.LC24:
	.long	4290772992
	.long	1105199103
	.align 8
.LC25:
	.long	335092967
	.long	-1096759561
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
