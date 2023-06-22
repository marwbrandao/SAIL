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
	jle	.L8
	movl	$0, -60(%rbp)
	leaq	8(%r14), %r15
	leaq	.LC7(%rip), %rbx
	movl	$0, -64(%rbp)
	.p2align 4,,10
	.p2align 3
.L7:
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
	jle	.L9
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L6:
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
	jg	.L6
.L5:
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
	jne	.L7
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%r9d, %xmm0
	cvtsi2sdl	-72(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	mulsd	.LC11(%rip), %xmm0
.L4:
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
.L9:
	.cfi_restore_state
	xorl	%r14d, %r14d
	jmp	.L5
.L8:
	pxor	%xmm0, %xmm0
	jmp	.L4
	.cfi_endproc
.LFE48:
	.size	print_best_clusters, .-print_best_clusters
	.section	.rodata.str1.1
.LC15:
	.string	"w"
.LC16:
	.string	"output.txt"
.LC17:
	.string	"SA_graph.csv"
.LC18:
	.string	"%d;%d;%d\n"
.LC19:
	.string	"0,%d:"
.LC20:
	.string	"Cluster %d with size %d: "
.LC21:
	.string	"%d "
.LC22:
	.string	"\nSA start!\n\n"
.LC23:
	.string	"cluster_info.txt"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"----->iteration: %d, perfect: %d, not_perfect: %d\n"
	.section	.rodata.str1.1
.LC26:
	.string	"fronteiras: %d prob: %f\n\n"
.LC28:
	.string	"%d,%d,%f\n"
.LC29:
	.string	"%d,%d,0.5\n"
.LC30:
	.string	"%d,%d:"
.LC31:
	.string	"prob: %f and random: %f\n"
.LC32:
	.string	"SA end!\n"
.LC34:
	.string	"Time taken: %f seconds\n"
	.text
	.p2align 4
	.globl	runSA
	.type	runSA, @function
runSA:
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
	subq	$152, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movl	%esi, %ebx
	movq	%rdx, %r13
	movl	%ecx, %r15d
	movl	%r8d, %r14d
	movq	%rdx, -96(%rbp)
	movl	%ecx, -68(%rbp)
	movl	%r8d, -72(%rbp)
	movl	%r9d, -112(%rbp)
	movsd	%xmm0, -56(%rbp)
	movsd	%xmm1, -64(%rbp)
	lock addq	$1, __gcov0.runSA(%rip)
	call	clock@PLT
	movq	%rax, -192(%rbp)
	lock addq	$1, 8+__gcov0.runSA(%rip)
	pxor	%xmm1, %xmm1
	movsd	.LC0(%rip), %xmm5
	movsd	-64(%rbp), %xmm0
	divsd	-56(%rbp), %xmm0
	cvtsi2sdl	%ebx, %xmm1
	divsd	%xmm1, %xmm5
	movapd	%xmm5, %xmm1
	call	pow@PLT
	movl	16(%rbp), %ecx
	movl	%r15d, %edx
	movl	%r14d, %esi
	movq	%r13, %rdi
	call	popul_test1@PLT
	lock addq	$1, 16+__gcov0.runSA(%rip)
	xorl	%edi, %edi
	call	time@PLT
	movq	%rax, %rdi
	lock addq	$1, 24+__gcov0.runSA(%rip)
	call	srand@PLT
	lock addq	$1, 32+__gcov0.runSA(%rip)
	leaq	.LC15(%rip), %rsi
	leaq	.LC16(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %r12
	lock addq	$1, 40+__gcov0.runSA(%rip)
	leaq	.LC15(%rip), %rsi
	leaq	.LC17(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -152(%rbp)
	lock addq	$1, 48+__gcov0.runSA(%rip)
	leaq	.LC18(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	%ebx, %r9d
	movl	%r14d, %r8d
	movl	%r15d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 56+__gcov0.runSA(%rip)
	movl	%r14d, %edx
	movl	%r15d, %esi
	movq	%r13, %rdi
	call	first_cluster@PLT
	movq	%rax, -88(%rbp)
	lock addq	$1, 64+__gcov0.runSA(%rip)
	testl	%r15d, %r15d
	jle	.L13
	movl	$0, -64(%rbp)
	leaq	8(%rax), %r15
	leaq	.LC21(%rip), %rbx
.L16:
	lock addq	$1, 128+__gcov0.runSA(%rip)
	leaq	.LC19(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	-64(%rbp), %r14d
	movl	%r14d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 72+__gcov0.runSA(%rip)
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	(%r15), %ecx
	movl	%r14d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 80+__gcov0.runSA(%rip)
	movl	(%r15), %r10d
	testl	%r10d, %r10d
	jle	.L54
	movq	%r12, -56(%rbp)
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L15:
	lock addq	$1, 96+__gcov0.runSA(%rip)
	movl	$1, %edi
	movq	-8(%r15), %rax
	movq	(%rax,%r13,8), %rax
	movl	(%rax), %r12d
	movq	%rbx, %rsi
	xorl	%eax, %eax
	movl	%r12d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 88+__gcov0.runSA(%rip)
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
	jg	.L15
	movq	-56(%rbp), %r12
.L14:
	lock addq	$1, 104+__gcov0.runSA(%rip)
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	%r14d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 112+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 120+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	addq	$16, %r15
	call	__fprintf_chk@PLT
	addl	$1, -64(%rbp)
	movl	-64(%rbp), %eax
	cmpl	%eax, -68(%rbp)
	jne	.L16
.L13:
	lock addq	$1, 136+__gcov0.runSA(%rip)
	leaq	.LC22(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 144+__gcov0.runSA(%rip)
	leaq	.LC15(%rip), %rsi
	leaq	.LC23(%rip), %rdi
	call	fopen@PLT
	lock addq	$1, 152+__gcov0.runSA(%rip)
	movl	-72(%rbp), %r15d
	movl	-68(%rbp), %ebx
	movq	-96(%rbp), %rsi
	movq	-88(%rbp), %rdi
	movl	%r15d, %ecx
	movl	%ebx, %edx
	call	change_unit@PLT
	lock addq	$1, 160+__gcov0.runSA(%rip)
	movslq	%ebx, %rax
	movl	$1, -64(%rbp)
	salq	$4, %rax
	movl	$0, -120(%rbp)
	movq	%rax, -176(%rbp)
	movslq	%r15d, %rax
	movl	$1, %r15d
	salq	$3, %rax
	movl	$-2147483648, -104(%rbp)
	movl	%r15d, %r10d
	movq	%rax, -184(%rbp)
	leal	-1(%rbx), %eax
	leaq	.LC7(%rip), %rbx
	movq	$0, -160(%rbp)
	salq	$4, %rax
	movq	%rax, -168(%rbp)
	movabsq	$9223372036854775807, %rax
	movl	$0, -140(%rbp)
	movq	%rax, -136(%rbp)
	.p2align 4,,10
	.p2align 3
.L17:
	movl	-68(%rbp), %r13d
	movq	-88(%rbp), %r14
	movl	%r10d, -80(%rbp)
	movl	16(%rbp), %r9d
	movl	-72(%rbp), %r8d
	movl	-112(%rbp), %edx
	movq	-96(%rbp), %rdi
	movl	%r13d, %ecx
	movq	%r14, %rsi
	call	energy_population@PLT
	lock addq	$1, 224+__gcov0.runSA(%rip)
	movl	%r13d, %esi
	movq	%r14, %rdi
	movslq	%eax, %r15
	call	energy_compactness@PLT
	movl	-104(%rbp), %esi
	movl	-80(%rbp), %r10d
	movl	%eax, -108(%rbp)
	cmpl	%esi, %eax
	setg	-56(%rbp)
	testq	%r15, %r15
	movzbl	-56(%rbp), %eax
	jne	.L23
	testb	%al, %al
	je	.L23
	addl	$1, -120(%rbp)
	lock addq	$1, 232+__gcov0.runSA(%rip)
	movq	.LC0(%rip), %rax
	movq	%rax, -80(%rbp)
.L24:
	testl	%r10d, %r10d
	je	.L107
.L26:
	call	rand@PLT
	lock addq	$1, 328+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	movsd	-80(%rbp), %xmm2
	cvtsi2sdl	%eax, %xmm0
	divsd	.LC27(%rip), %xmm0
	comisd	%xmm0, %xmm2
	movsd	%xmm0, -128(%rbp)
	ja	.L108
	addl	$1, -64(%rbp)
	movl	-64(%rbp), %eax
	cmpl	$100001, %eax
	je	.L109
.L50:
	leaq	.LC15(%rip), %rsi
	leaq	.LC23(%rip), %rdi
	call	fopen@PLT
	lock addq	$1, 152+__gcov0.runSA(%rip)
	movl	-72(%rbp), %ecx
	movl	-68(%rbp), %edx
	movq	-96(%rbp), %rsi
	movq	-88(%rbp), %rdi
	call	change_unit@PLT
	lock addq	$1, 160+__gcov0.runSA(%rip)
	movl	$3518437209, %eax
	movl	-64(%rbp), %r10d
	movq	%r10, %rdi
	imulq	%rax, %r10
	shrq	$45, %r10
	imull	$10000, %r10d, %r10d
	subl	%r10d, %edi
	movl	%edi, %r10d
	jne	.L17
	lock addq	$1, 168+__gcov0.runSA(%rip)
	movl	-120(%rbp), %r9d
	testl	%r9d, %r9d
	jne	.L17
	movl	%edi, -56(%rbp)
	lock addq	$1, 176+__gcov0.runSA(%rip)
	movl	-68(%rbp), %r15d
	movq	-88(%rbp), %r9
	movl	16(%rbp), %r8d
	movl	-112(%rbp), %ecx
	movl	-72(%rbp), %edx
	movq	-96(%rbp), %rdi
	movl	%r15d, %esi
	call	runILP@PLT
	movq	%rax, -88(%rbp)
	lock addq	$1, 184+__gcov0.runSA(%rip)
	movl	-56(%rbp), %r10d
	testl	%r15d, %r15d
	jle	.L19
	movq	-168(%rbp), %rsi
	leaq	8(%rax), %r13
	movl	%r10d, %r15d
	leaq	24(%rax,%rsi), %r14
	.p2align 4,,10
	.p2align 3
.L20:
	movl	0(%r13), %r8d
	xorl	%edx, %edx
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jle	.L22
	.p2align 4,,10
	.p2align 3
.L21:
	movq	-8(%r13), %rcx
	movq	(%rcx,%rax,8), %rcx
	addl	8(%rcx), %edx
	lock addq	$1, 192+__gcov0.runSA(%rip)
	addq	$1, %rax
	cmpl	%eax, 0(%r13)
	jg	.L21
.L22:
	lock addq	$1, 200+__gcov0.runSA(%rip)
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 208+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$16, %r13
	cmpq	%r13, %r14
	jne	.L20
	movl	%r15d, %r10d
.L19:
	lock addq	$1, 216+__gcov0.runSA(%rip)
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L23:
	cmpq	%r15, -136(%rbp)
	jge	.L25
	cmpb	$0, -56(%rbp)
	je	.L25
	lock addq	$1, 240+__gcov0.runSA(%rip)
.L106:
	movl	-64(%rbp), %eax
	pxor	%xmm0, %xmm0
	addl	$1, -140(%rbp)
	subl	$1, %eax
	cvtsi2sdl	%eax, %xmm0
	mulsd	.LC24(%rip), %xmm0
	addsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -80(%rbp)
	testl	%r10d, %r10d
	jne	.L26
.L107:
	lock addq	$1, 264+__gcov0.runSA(%rip)
	leaq	.LC25(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	-64(%rbp), %r14d
	movl	-140(%rbp), %r8d
	movl	-120(%rbp), %ecx
	movl	%r14d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 272+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	movl	%r14d, %eax
	subl	$1, %eax
	cvtsi2sdl	%eax, %xmm0
	mulsd	.LC24(%rip), %xmm0
	movl	-68(%rbp), %eax
	addsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -80(%rbp)
	testl	%eax, %eax
	jle	.L27
	movq	-88(%rbp), %rsi
	xorl	%r14d, %r14d
	movq	%r12, -120(%rbp)
	movl	%r14d, %r12d
	leaq	8(%rsi), %r13
	movq	%r13, %r14
	movl	%eax, %r13d
	.p2align 4,,10
	.p2align 3
.L30:
	lock addq	$1, 304+__gcov0.runSA(%rip)
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	(%r14), %ecx
	movl	%r12d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 280+__gcov0.runSA(%rip)
	xorl	%edx, %edx
	movl	(%r14), %edi
	testl	%edi, %edi
	jle	.L28
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L29:
	movq	-8(%r14), %rcx
	movq	(%rcx,%rax,8), %rcx
	addl	8(%rcx), %edx
	lock addq	$1, 288+__gcov0.runSA(%rip)
	addq	$1, %rax
	cmpl	%eax, (%r14)
	jg	.L29
.L28:
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 296+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addl	$1, %r12d
	addq	$16, %r14
	cmpl	%r12d, %r13d
	jne	.L30
	movq	-120(%rbp), %r12
.L27:
	lock addq	$1, 312+__gcov0.runSA(%rip)
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC26(%rip), %rsi
	movsd	-80(%rbp), %xmm0
	movl	-108(%rbp), %edx
	call	__printf_chk@PLT
	lock addq	$1, 320+__gcov0.runSA(%rip)
	movl	$0, -140(%rbp)
	movl	$0, -120(%rbp)
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L108:
	cmpq	%r15, -136(%rbp)
	jl	.L60
	cmpb	$0, -56(%rbp)
	je	.L60
	ucomisd	.LC0(%rip), %xmm2
	jnp	.L110
.L62:
	lock addq	$1, 368+__gcov0.runSA(%rip)
.L40:
	movl	-108(%rbp), %r14d
	movl	-64(%rbp), %ecx
	leaq	.LC28(%rip), %rdx
	movl	$1, %esi
	movsd	-80(%rbp), %xmm0
	movq	-152(%rbp), %rdi
	movl	$1, %eax
	movl	%r14d, %r8d
	call	__fprintf_chk@PLT
	movl	%r14d, -104(%rbp)
	movq	%r15, -136(%rbp)
.L45:
	lock addq	$1, 408+__gcov0.runSA(%rip)
	movl	-68(%rbp), %edx
	testl	%edx, %edx
	jle	.L46
	movq	-88(%rbp), %rax
	movl	$0, -56(%rbp)
	leaq	8(%rax), %r13
	.p2align 4,,10
	.p2align 3
.L49:
	lock addq	$1, 448+__gcov0.runSA(%rip)
	leaq	.LC30(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	-56(%rbp), %r8d
	movl	-64(%rbp), %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 416+__gcov0.runSA(%rip)
	movl	0(%r13), %eax
	testl	%eax, %eax
	jle	.L58
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L48:
	movq	-8(%r13), %rax
	movq	%rbx, %rdx
	movl	$1, %esi
	movq	%r12, %rdi
	movq	(%rax,%r14,8), %rax
	movl	(%rax), %ecx
	addl	8(%rax), %r15d
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	lock addq	$1, 424+__gcov0.runSA(%rip)
	addq	$1, %r14
	cmpl	%r14d, 0(%r13)
	jg	.L48
.L47:
	lock addq	$1, 432+__gcov0.runSA(%rip)
	leaq	.LC8(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	%r15d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 440+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	addq	$16, %r13
	call	__fprintf_chk@PLT
	addl	$1, -56(%rbp)
	movl	-56(%rbp), %eax
	cmpl	%eax, -68(%rbp)
	jne	.L49
.L46:
	lock addq	$1, 456+__gcov0.runSA(%rip)
	movl	$1, %esi
	movl	$2, %eax
	leaq	.LC31(%rip), %rdx
	movsd	-128(%rbp), %xmm1
	movsd	-80(%rbp), %xmm0
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 464+__gcov0.runSA(%rip)
	leaq	.LC14(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	-104(%rbp), %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 472+__gcov0.runSA(%rip)
	movl	-72(%rbp), %edx
	movl	-68(%rbp), %esi
	movq	-88(%rbp), %rdi
	call	storeState@PLT
	lock addq	$1, 480+__gcov0.runSA(%rip)
	addl	$1, -64(%rbp)
	movl	-64(%rbp), %eax
	cmpl	$100001, %eax
	jne	.L50
.L109:
	lock addq	$1, 488+__gcov0.runSA(%rip)
	movq	-160(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L51
	lock addq	$1, 496+__gcov0.runSA(%rip)
	movl	-68(%rbp), %r15d
	movl	16(%rbp), %r9d
	movl	-72(%rbp), %ecx
	movq	-96(%rbp), %rsi
	movl	%r15d, %edx
	movq	%r12, %r8
	movq	%rbx, %rdi
	call	print_best_clusters
	lock addq	$1, 504+__gcov0.runSA(%rip)
	testl	%r15d, %r15d
	jle	.L52
	movq	-168(%rbp), %rsi
	leaq	16(%rbx,%rsi), %r13
.L53:
	movq	(%rbx), %rdi
	call	free@PLT
	lock addq	$1, 512+__gcov0.runSA(%rip)
	addq	$16, %rbx
	cmpq	%r13, %rbx
	jne	.L53
.L52:
	movq	-160(%rbp), %rdi
	call	free@PLT
.L51:
	movq	%r12, %rdi
	call	fclose@PLT
	lock addq	$1, 520+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 528+__gcov0.runSA(%rip)
	leaq	.LC32(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 536+__gcov0.runSA(%rip)
	call	clock@PLT
	lock addq	$1, 544+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	leaq	.LC34(%rip), %rsi
	subq	-192(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC33(%rip), %xmm0
	call	__printf_chk@PLT
	lock addq	$1, 552+__gcov0.runSA(%rip)
	addq	$152, %rsp
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
.L25:
	.cfi_restore_state
	lock addq	$1, 248+__gcov0.runSA(%rip)
	movl	-104(%rbp), %esi
	cmpl	%esi, -108(%rbp)
	jge	.L56
	cmpq	%r15, -136(%rbp)
	jle	.L56
	lock addq	$1, 256+__gcov0.runSA(%rip)
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L58:
	xorl	%r15d, %r15d
	jmp	.L47
.L60:
	movl	-104(%rbp), %esi
	cmpl	%esi, -108(%rbp)
	jl	.L35
	cmpq	%r15, -136(%rbp)
	jle	.L35
	lock addq	$1, 336+__gcov0.runSA(%rip)
	movsd	-80(%rbp), %xmm4
	ucomisd	.LC0(%rip), %xmm4
	jp	.L36
	jne	.L36
	lock addq	$1, 352+__gcov0.runSA(%rip)
.L38:
	lock addq	$1, 360+__gcov0.runSA(%rip)
	cmpq	$0, -160(%rbp)
	je	.L111
	movl	-68(%rbp), %ecx
	testl	%ecx, %ecx
	jle	.L40
.L43:
	movq	%r12, -56(%rbp)
	movl	$8, %ecx
	xorl	%r8d, %r8d
	movq	-88(%rbp), %r12
	movq	%r15, -104(%rbp)
	movq	-160(%rbp), %r15
	movq	%rcx, %r13
	movl	%r8d, %r14d
	.p2align 4,,10
	.p2align 3
.L44:
	movl	(%r12,%r13), %eax
	movq	-8(%r15,%r13), %rdi
	addl	$1, %r14d
	movq	-8(%r12,%r13), %rsi
	movl	%eax, (%r15,%r13)
	movslq	(%r12,%r13), %rdx
	salq	$3, %rdx
	call	memcpy@PLT
	lock addq	$1, 392+__gcov0.runSA(%rip)
	addq	$16, %r13
	cmpl	%r14d, -68(%rbp)
	jg	.L44
	movq	-56(%rbp), %r12
	movq	-104(%rbp), %r15
	jmp	.L40
.L56:
	movq	$0x000000000, -80(%rbp)
	jmp	.L24
.L35:
	lock addq	$1, 344+__gcov0.runSA(%rip)
.L36:
	movl	-108(%rbp), %r8d
	movl	-64(%rbp), %ecx
	leaq	.LC29(%rip), %rdx
	xorl	%eax, %eax
	movq	-152(%rbp), %rdi
	movl	$1, %esi
	call	__fprintf_chk@PLT
	lock addq	$1, 400+__gcov0.runSA(%rip)
	jmp	.L45
.L54:
	xorl	%r14d, %r14d
	jmp	.L14
.L111:
	lock addq	$1, 376+__gcov0.runSA(%rip)
	movq	-176(%rbp), %rdi
	call	malloc@PLT
	movl	-68(%rbp), %esi
	movq	%rax, -160(%rbp)
	testl	%esi, %esi
	jle	.L40
	movq	-168(%rbp), %rsi
	movq	%rax, %rdx
	movq	%rdx, %r13
	leaq	16(%rax,%rsi), %rax
	movq	%rax, %r14
.L42:
	movq	-184(%rbp), %rdi
	call	malloc@PLT
	movl	$0, 8(%r13)
	movq	%rax, 0(%r13)
	lock addq	$1, 384+__gcov0.runSA(%rip)
	addq	$16, %r13
	cmpq	%r13, %r14
	jne	.L42
	jmp	.L43
.L110:
	je	.L38
	jmp	.L62
	.cfi_endproc
.LFE49:
	.size	runSA, .-runSA
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_sub_I_00100_0, @function
_sub_I_00100_0:
.LFB50:
	.cfi_startproc
	endbr64
	leaq	.LPBX0(%rip), %rdi
	jmp	__gcov_init@PLT
	.cfi_endproc
.LFE50:
	.size	_sub_I_00100_0, .-_sub_I_00100_0
	.section	.init_array.00100,"aw"
	.align 8
	.quad	_sub_I_00100_0
	.section	.text.exit,"ax",@progbits
	.p2align 4
	.type	_sub_D_00100_1, @function
_sub_D_00100_1:
.LFB51:
	.cfi_startproc
	endbr64
	jmp	__gcov_exit@PLT
	.cfi_endproc
.LFE51:
	.size	_sub_D_00100_1, .-_sub_D_00100_1
	.section	.fini_array.00100,"aw"
	.align 8
	.quad	_sub_D_00100_1
	.section	.data.rel.local,"aw"
	.align 16
	.type	.LPBX1, @object
	.size	.LPBX1, 24
.LPBX1:
	.quad	__gcov_.runSA
	.quad	__gcov_.print_best_clusters
	.quad	__gcov_.getTemperature
	.align 32
	.type	__gcov_.getTemperature, @object
	.size	__gcov_.getTemperature, 40
__gcov_.getTemperature:
	.quad	.LPBX0
	.long	5476361
	.long	1702646469
	.long	-1540324424
	.zero	4
	.long	1
	.zero	4
	.quad	__gcov0.getTemperature
	.align 32
	.type	__gcov_.print_best_clusters, @object
	.size	__gcov_.print_best_clusters, 40
__gcov_.print_best_clusters:
	.quad	.LPBX0
	.long	1728803614
	.long	-1618511408
	.long	568912973
	.zero	4
	.long	22
	.zero	4
	.quad	__gcov0.print_best_clusters
	.section	.rodata.str1.8
	.align 8
.LC35:
	.string	"/mnt/c/Users/maria/OneDrive/Ambiente de Trabalho/SA_COPY/SA_copy/SA/sa.gcda"
	.section	.data.rel,"aw"
	.align 32
	.type	.LPBX0, @object
	.size	.LPBX0, 120
.LPBX0:
	.long	1094267690
	.zero	4
	.quad	0
	.long	-491839196
	.zero	4
	.quad	.LC35
	.quad	__gcov_merge_add
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	3
	.zero	4
	.quad	.LPBX1
	.section	.data.rel.local
	.align 32
	.type	__gcov_.runSA, @object
	.size	__gcov_.runSA, 40
__gcov_.runSA:
	.quad	.LPBX0
	.long	792344964
	.long	-113825092
	.long	1920284656
	.zero	4
	.long	70
	.zero	4
	.quad	__gcov0.runSA
	.local	__gcov0.getTemperature
	.comm	__gcov0.getTemperature,8,8
	.local	__gcov0.print_best_clusters
	.comm	__gcov0.print_best_clusters,176,32
	.local	__gcov0.runSA
	.comm	__gcov0.runSA,560,32
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
	.long	3884151564
	.long	-1092290367
	.align 8
.LC27:
	.long	4290772992
	.long	1105199103
	.align 8
.LC33:
	.long	0
	.long	1093567616
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
