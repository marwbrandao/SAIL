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
	.string	"temp start : %f\n"
.LC16:
	.string	"\nSA start!\n\n"
.LC17:
	.string	"w"
.LC18:
	.string	"output.txt"
.LC19:
	.string	"SA_graph.txt"
.LC20:
	.string	"%d;%d;%d\n"
.LC21:
	.string	"0,%d:"
.LC22:
	.string	"Cluster %d with size %d: "
.LC23:
	.string	"%d "
.LC24:
	.string	"cluster_info.txt"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"best energy pop: %d, energy pop: %d \nbest energy comp: %d, energy comp: %d\n"
	.align 8
.LC26:
	.string	"temperature population: %f, temperature compactness: %f\n"
	.align 8
.LC27:
	.string	"---- here:accpet prob pop: %f and ccpet prob comp: %f\n"
	.section	.rodata.str1.1
.LC29:
	.string	"%d,%d:"
.LC30:
	.string	"prob: %f and random: %f\n"
.LC31:
	.string	"%d,%f,%d,%f\n"
	.section	.rodata.str1.8
	.align 8
.LC32:
	.string	"Temperature Population: %f, Temperature Compactness: %f, T: %f\n"
	.align 8
.LC33:
	.string	"----->iteration: %d, perfect: %d, not_perfect: %d\n"
	.section	.rodata.str1.1
.LC34:
	.string	"Borders: %d prob: %f\n\n"
.LC35:
	.string	"pop: %d prob: %f\n\n"
.LC36:
	.string	" --> population: %d\n"
.LC37:
	.string	"SA end!\n"
.LC39:
	.string	"Time taken: %f seconds\n"
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
	subq	$184, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
1:	call	*mcount@GOTPCREL(%rip)
	movl	%esi, %ebx
	movq	%rdx, %r13
	movl	%ecx, %r14d
	movl	%r8d, %r15d
	movq	%rdx, -128(%rbp)
	movl	%ecx, -64(%rbp)
	movl	%r8d, -96(%rbp)
	movl	%r9d, -120(%rbp)
	movsd	%xmm0, -72(%rbp)
	movsd	%xmm1, -56(%rbp)
	lock addq	$1, __gcov0.runSA(%rip)
	call	clock@PLT
	movq	%rax, -200(%rbp)
	lock addq	$1, 8+__gcov0.runSA(%rip)
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC15(%rip), %rsi
	movsd	-72(%rbp), %xmm0
	call	__printf_chk@PLT
	lock addq	$1, 16+__gcov0.runSA(%rip)
	pxor	%xmm2, %xmm2
	movsd	-56(%rbp), %xmm1
	divsd	-72(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	movsd	.LC0(%rip), %xmm1
	cvtsi2sdl	%ebx, %xmm2
	divsd	%xmm2, %xmm1
	call	pow@PLT
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movsd	%xmm0, -136(%rbp)
	call	__printf_chk@PLT
	lock addq	$1, 24+__gcov0.runSA(%rip)
	xorl	%edi, %edi
	call	time@PLT
	movq	%rax, %rdi
	lock addq	$1, 32+__gcov0.runSA(%rip)
	call	srand@PLT
	lock addq	$1, 40+__gcov0.runSA(%rip)
	leaq	.LC17(%rip), %rsi
	leaq	.LC18(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %r12
	lock addq	$1, 48+__gcov0.runSA(%rip)
	leaq	.LC17(%rip), %rsi
	leaq	.LC19(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -168(%rbp)
	lock addq	$1, 56+__gcov0.runSA(%rip)
	leaq	.LC20(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	%ebx, %r9d
	movl	%r15d, %r8d
	movl	%r14d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 64+__gcov0.runSA(%rip)
	movl	%r15d, %edx
	movl	%r14d, %esi
	movq	%r13, %rdi
	call	first_cluster@PLT
	movq	%rax, -104(%rbp)
	lock addq	$1, 72+__gcov0.runSA(%rip)
	leaq	.LC23(%rip), %rbx
	movl	$0, -60(%rbp)
	leaq	8(%rax), %r15
	testl	%r14d, %r14d
	jle	.L27
	.p2align 4,,10
	.p2align 3
.L26:
	lock addq	$1, 136+__gcov0.runSA(%rip)
	leaq	.LC21(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	-60(%rbp), %r14d
	movl	%r14d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 80+__gcov0.runSA(%rip)
	leaq	.LC22(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	(%r15), %ecx
	movl	%r14d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 88+__gcov0.runSA(%rip)
	movl	(%r15), %r9d
	testl	%r9d, %r9d
	jle	.L69
	movq	%r12, -56(%rbp)
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L25:
	lock addq	$1, 104+__gcov0.runSA(%rip)
	movl	$1, %edi
	movq	-8(%r15), %rax
	movq	(%rax,%r13,8), %rax
	movl	(%rax), %r12d
	movq	%rbx, %rsi
	xorl	%eax, %eax
	movl	%r12d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 96+__gcov0.runSA(%rip)
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
	jg	.L25
	movq	-56(%rbp), %r12
.L24:
	lock addq	$1, 112+__gcov0.runSA(%rip)
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	%r14d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 120+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 128+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	addq	$16, %r15
	call	__fprintf_chk@PLT
	addl	$1, -60(%rbp)
	movl	-60(%rbp), %eax
	cmpl	%eax, -64(%rbp)
	jne	.L26
.L27:
	lock addq	$1, 144+__gcov0.runSA(%rip)
	movslq	-64(%rbp), %rax
	movq	%rax, %rbx
	salq	$4, %rax
	movq	%rax, -216(%rbp)
	movslq	-96(%rbp), %rax
	movl	$1, -60(%rbp)
	salq	$3, %rax
	movq	$0, -176(%rbp)
	movq	%rax, -192(%rbp)
	leal	-1(%rbx), %eax
	leaq	.LC7(%rip), %rbx
	salq	$4, %rax
	movl	$-2147483648, -92(%rbp)
	movq	%rax, -208(%rbp)
	movabsq	$9223372036854775807, %rax
	movl	$0, -156(%rbp)
	movl	$-2147483648, -144(%rbp)
	movq	%rax, -152(%rbp)
	movl	$2147483647, -116(%rbp)
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L28:
	lock addq	$1, 152+__gcov0.runSA(%rip)
	leaq	.LC17(%rip), %rsi
	leaq	.LC24(%rip), %rdi
	call	fopen@PLT
	lock addq	$1, 160+__gcov0.runSA(%rip)
	movl	-64(%rbp), %r13d
	movq	-128(%rbp), %r15
	movq	-104(%rbp), %r14
	movl	-96(%rbp), %ecx
	movl	%r13d, %edx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	change_unit@PLT
	lock addq	$1, 168+__gcov0.runSA(%rip)
	movl	16(%rbp), %r9d
	movl	-96(%rbp), %r8d
	movl	-120(%rbp), %edx
	movq	%r15, %rdi
	movl	%r13d, %ecx
	movq	%r14, %rsi
	call	energy_population@PLT
	movl	%eax, %r15d
	lock addq	$1, 176+__gcov0.runSA(%rip)
	movl	%r13d, %esi
	movq	%r14, %rdi
	call	energy_compactness@PLT
	movl	%eax, %r13d
	lock addq	$1, 184+__gcov0.runSA(%rip)
	leaq	.LC25(%rip), %rsi
	movl	$1, %edi
	movl	-116(%rbp), %r14d
	movl	-92(%rbp), %r8d
	movl	%r14d, %edx
	movl	%eax, %r9d
	movl	%r15d, %ecx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 192+__gcov0.runSA(%rip)
	movl	$1, %edi
	movl	$2, %eax
	leaq	.LC26(%rip), %rsi
	movsd	-72(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	call	__printf_chk@PLT
	lock addq	$1, 200+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	movl	%r14d, %eax
	subl	%r15d, %eax
	cvtsi2sdl	%eax, %xmm0
	divsd	-72(%rbp), %xmm0
	call	exp@PLT
	movl	-92(%rbp), %eax
	movsd	%xmm0, -56(%rbp)
	pxor	%xmm0, %xmm0
	subl	%r13d, %eax
	cvtsi2sdl	%eax, %xmm0
	divsd	-72(%rbp), %xmm0
	call	exp@PLT
	movl	$1, %edi
	movl	$2, %eax
	leaq	.LC27(%rip), %rsi
	movsd	%xmm0, -80(%rbp)
	movapd	%xmm0, %xmm1
	movsd	-56(%rbp), %xmm0
	call	__printf_chk@PLT
	lock addq	$1, 208+__gcov0.runSA(%rip)
	movsd	-56(%rbp), %xmm4
	movsd	-80(%rbp), %xmm5
	comisd	%xmm4, %xmm5
	movsd	%xmm4, -88(%rbp)
	ja	.L35
	lock addq	$1, 216+__gcov0.runSA(%rip)
	movsd	%xmm5, -88(%rbp)
.L35:
	call	rand@PLT
	lock addq	$1, 224+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	movsd	-88(%rbp), %xmm7
	cvtsi2sdl	%eax, %xmm0
	divsd	.LC28(%rip), %xmm0
	comisd	%xmm0, %xmm7
	movsd	%xmm0, -112(%rbp)
	ja	.L104
	testb	$1, -60(%rbp)
	je	.L105
.L58:
	movsd	-72(%rbp), %xmm6
	mulsd	-136(%rbp), %xmm6
	addl	$1, -60(%rbp)
	movl	-60(%rbp), %eax
	movsd	%xmm6, -72(%rbp)
	cmpl	$21, %eax
	je	.L106
.L23:
	lock addq	$1, __gcov0.getEll(%rip)
	call	arc4random@PLT
	lock addq	$1, 8+__gcov0.getEll(%rip)
	testl	%eax, %eax
	je	.L28
	movl	%eax, %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm7, %xmm7
	negl	%edx
	movl	%edx, %edx
	cvtsi2sdq	%rdx, %xmm0
	ucomisd	%xmm0, %xmm7
	jnb	.L107
.L31:
	movl	%eax, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm0
	ucomisd	%xmm0, %xmm2
	jnb	.L108
.L34:
	lock addq	$1, 16+__gcov0.getEll(%rip)
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L104:
	ucomisd	.LC0(%rip), %xmm7
	jp	.L77
	je	.L38
.L77:
	lock addq	$1, 232+__gcov0.runSA(%rip)
	addl	$1, -156(%rbp)
.L38:
	cmpl	-144(%rbp), %r13d
	jle	.L40
	lock addq	$1, 240+__gcov0.runSA(%rip)
	movslq	%r15d, %rax
	cmpq	-152(%rbp), %rax
	jle	.L109
.L42:
	lock addq	$1, 248+__gcov0.runSA(%rip)
	cmpq	%rax, -152(%rbp)
	jg	.L110
.L44:
	movsd	-56(%rbp), %xmm6
	comisd	-112(%rbp), %xmm6
	jbe	.L50
	lock addq	$1, 304+__gcov0.runSA(%rip)
	movl	%r15d, -116(%rbp)
.L50:
	movsd	-80(%rbp), %xmm2
	comisd	-112(%rbp), %xmm2
	jbe	.L52
	lock addq	$1, 312+__gcov0.runSA(%rip)
	movl	%r13d, -92(%rbp)
.L52:
	movl	-64(%rbp), %esi
	testl	%esi, %esi
	jle	.L73
	movq	-104(%rbp), %rax
	movl	$0, -56(%rbp)
	movl	$0, -80(%rbp)
	leaq	8(%rax), %r15
	.p2align 4,,10
	.p2align 3
.L57:
	lock addq	$1, 352+__gcov0.runSA(%rip)
	leaq	.LC29(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	-56(%rbp), %r8d
	movl	-60(%rbp), %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 320+__gcov0.runSA(%rip)
	movl	(%r15), %ecx
	testl	%ecx, %ecx
	jle	.L74
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L56:
	movq	-8(%r15), %rax
	movq	%rbx, %rdx
	movl	$1, %esi
	movq	%r12, %rdi
	movq	(%rax,%r13,8), %rax
	movl	(%rax), %ecx
	addl	8(%rax), %r14d
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	lock addq	$1, 328+__gcov0.runSA(%rip)
	addq	$1, %r13
	cmpl	%r13d, (%r15)
	jg	.L56
.L55:
	lock addq	$1, 336+__gcov0.runSA(%rip)
	leaq	.LC8(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	%r14d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 344+__gcov0.runSA(%rip)
	xorl	%eax, %eax
	movl	$1, %esi
	leaq	.LC9(%rip), %rdx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	movl	%r14d, %r9d
	subl	16(%rbp), %r9d
	movl	%r9d, %eax
	sarl	$31, %eax
	xorl	%eax, %r9d
	subl	%eax, %r9d
	movl	-80(%rbp), %eax
	cmpl	%r9d, %eax
	cmovge	%eax, %r9d
	addl	$1, -56(%rbp)
	addq	$16, %r15
	movl	-56(%rbp), %eax
	movl	%r9d, -80(%rbp)
	cmpl	%eax, -64(%rbp)
	jne	.L57
.L54:
	lock addq	$1, 360+__gcov0.runSA(%rip)
	movl	$1, %esi
	movl	$2, %eax
	leaq	.LC30(%rip), %rdx
	movsd	-112(%rbp), %xmm1
	movsd	-88(%rbp), %xmm0
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 368+__gcov0.runSA(%rip)
	leaq	.LC14(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	-92(%rbp), %r14d
	movl	%r14d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 376+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	leaq	.LC31(%rip), %rdx
	movl	$1, %esi
	movl	$2, %eax
	movl	-60(%rbp), %ecx
	movq	-168(%rbp), %rdi
	cvtsi2sdl	16(%rbp), %xmm1
	movl	%r14d, %r8d
	cvtsi2sdl	-80(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	movsd	-88(%rbp), %xmm1
	mulsd	.LC11(%rip), %xmm0
	call	__fprintf_chk@PLT
	lock addq	$1, 384+__gcov0.runSA(%rip)
	movl	-96(%rbp), %edx
	movl	-64(%rbp), %esi
	movq	-104(%rbp), %rdi
	call	storeState@PLT
	lock addq	$1, 392+__gcov0.runSA(%rip)
	testb	$1, -60(%rbp)
	jne	.L58
.L105:
	lock addq	$1, 400+__gcov0.runSA(%rip)
	movl	$1, %edi
	movl	$3, %eax
	leaq	.LC32(%rip), %rsi
	movsd	-72(%rbp), %xmm1
	movapd	%xmm1, %xmm2
	movapd	%xmm1, %xmm0
	call	__printf_chk@PLT
	lock addq	$1, 408+__gcov0.runSA(%rip)
	xorl	%ecx, %ecx
	leaq	.LC33(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movl	-156(%rbp), %r8d
	movl	-60(%rbp), %edx
	call	__printf_chk@PLT
	lock addq	$1, 416+__gcov0.runSA(%rip)
	xorl	%r15d, %r15d
	movq	-104(%rbp), %rax
	movl	-64(%rbp), %edx
	movl	-64(%rbp), %r14d
	leaq	8(%rax), %r13
	testl	%edx, %edx
	jle	.L63
	.p2align 4,,10
	.p2align 3
.L62:
	movl	0(%r13), %ecx
	movl	%r15d, %edx
	leaq	.LC22(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	lock addq	$1, 424+__gcov0.runSA(%rip)
	movl	0(%r13), %eax
	testl	%eax, %eax
	jle	.L75
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L61:
	movq	-8(%r13), %rcx
	movq	(%rcx,%rax,8), %rcx
	addl	8(%rcx), %edx
	lock addq	$1, 432+__gcov0.runSA(%rip)
	addq	$1, %rax
	cmpl	%eax, 0(%r13)
	jg	.L61
.L60:
	leaq	.LC36(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 440+__gcov0.runSA(%rip)
	addl	$1, %r15d
	addq	$16, %r13
	cmpl	%r15d, %r14d
	jne	.L62
.L63:
	lock addq	$1, 448+__gcov0.runSA(%rip)
	movl	-64(%rbp), %r15d
	movq	-104(%rbp), %r14
	movl	16(%rbp), %r9d
	movl	-96(%rbp), %r8d
	movl	-120(%rbp), %edx
	movq	-128(%rbp), %rdi
	movl	%r15d, %ecx
	movq	%r14, %rsi
	call	energy_population@PLT
	lock addq	$1, 456+__gcov0.runSA(%rip)
	movl	%r15d, %esi
	movq	%r14, %rdi
	movslq	%eax, %r13
	call	energy_compactness@PLT
	movl	%eax, %r15d
	lock addq	$1, 464+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	movslq	-116(%rbp), %rax
	subq	%r13, %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	-72(%rbp), %xmm0
	call	exp@PLT
	movl	-92(%rbp), %eax
	movsd	%xmm0, -56(%rbp)
	pxor	%xmm0, %xmm0
	subl	%r15d, %eax
	cvtsi2sdl	%eax, %xmm0
	divsd	-72(%rbp), %xmm0
	call	exp@PLT
	movl	%r15d, %edx
	movl	$1, %edi
	leaq	.LC34(%rip), %rsi
	movl	$1, %eax
	call	__printf_chk@PLT
	lock addq	$1, 472+__gcov0.runSA(%rip)
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC35(%rip), %rsi
	movsd	-56(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	movq	%r13, %rdx
	call	__printf_chk@PLT
	lock addq	$1, 480+__gcov0.runSA(%rip)
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L74:
	xorl	%r14d, %r14d
	jmp	.L55
.L75:
	xorl	%edx, %edx
	jmp	.L60
.L40:
	movslq	%r15d, %rax
	je	.L42
	lock addq	$1, 256+__gcov0.runSA(%rip)
	jmp	.L44
.L106:
	lock addq	$1, 488+__gcov0.runSA(%rip)
	movq	-176(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L64
	lock addq	$1, 496+__gcov0.runSA(%rip)
	movl	-64(%rbp), %r14d
	movl	16(%rbp), %r9d
	movl	-96(%rbp), %ecx
	movq	-128(%rbp), %rsi
	movl	%r14d, %edx
	movq	%r12, %r8
	movq	%rbx, %rdi
	call	print_best_clusters
	lock addq	$1, 504+__gcov0.runSA(%rip)
	movq	%rbx, %r13
	movq	-208(%rbp), %rbx
	leaq	16(%r13,%rbx), %rbx
	testl	%r14d, %r14d
	jle	.L67
	.p2align 4,,10
	.p2align 3
.L66:
	movq	0(%r13), %rdi
	call	free@PLT
	lock addq	$1, 512+__gcov0.runSA(%rip)
	addq	$16, %r13
	cmpq	%r13, %rbx
	jne	.L66
.L67:
	movq	-176(%rbp), %rdi
	call	free@PLT
.L64:
	movq	%r12, %rdi
	call	fclose@PLT
	lock addq	$1, 520+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 528+__gcov0.runSA(%rip)
	leaq	.LC37(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 536+__gcov0.runSA(%rip)
	call	clock@PLT
	lock addq	$1, 544+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	leaq	.LC39(%rip), %rsi
	subq	-200(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC38(%rip), %xmm0
	call	__printf_chk@PLT
	lock addq	$1, 552+__gcov0.runSA(%rip)
	xorl	%eax, %eax
	addq	$184, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L69:
	.cfi_restore_state
	xorl	%r14d, %r14d
	jmp	.L24
.L109:
	movq	%rax, -152(%rbp)
.L41:
	cmpq	$0, -176(%rbp)
	je	.L111
	lock addq	$1, 288+__gcov0.runSA(%rip)
	movl	-64(%rbp), %edi
	testl	%edi, %edi
	jle	.L72
.L68:
	movq	-104(%rbp), %rax
	xorl	%r9d, %r9d
	movl	-64(%rbp), %r14d
	movq	%r12, -144(%rbp)
	movl	%r15d, -160(%rbp)
	movl	%r9d, %r15d
	leaq	8(%rax), %rcx
	movq	-176(%rbp), %rax
	movl	%r13d, -180(%rbp)
	movq	%rcx, %r13
	leaq	8(%rax), %r8
	movq	%r8, %r12
	.p2align 4,,10
	.p2align 3
.L49:
	movl	0(%r13), %eax
	movq	-8(%r12), %rdi
	addl	$1, %r15d
	movq	-8(%r13), %rsi
	movl	%eax, (%r12)
	movslq	0(%r13), %rdx
	salq	$3, %rdx
	call	memcpy@PLT
	lock addq	$1, 296+__gcov0.runSA(%rip)
	addq	$16, %r13
	addq	$16, %r12
	cmpl	%r15d, %r14d
	jg	.L49
	movl	-180(%rbp), %r13d
	movq	-144(%rbp), %r12
	movl	-160(%rbp), %r15d
	movl	%r13d, -144(%rbp)
	jmp	.L44
.L110:
	lock addq	$1, 264+__gcov0.runSA(%rip)
	movq	%rax, -152(%rbp)
	jmp	.L41
.L73:
	movl	$0, -80(%rbp)
	jmp	.L54
.L72:
	movl	%r13d, -144(%rbp)
	jmp	.L44
.L111:
	lock addq	$1, 272+__gcov0.runSA(%rip)
	movq	-216(%rbp), %rdi
	call	malloc@PLT
	movl	-64(%rbp), %r8d
	movq	%rax, -176(%rbp)
	testl	%r8d, %r8d
	jle	.L46
	movq	-208(%rbp), %rdi
	movq	%rax, %rdx
	movq	%rdx, %r14
	leaq	16(%rax,%rdi), %rax
	movq	%rax, -144(%rbp)
.L47:
	movq	-192(%rbp), %rdi
	call	malloc@PLT
	movl	$0, 8(%r14)
	movq	%rax, (%r14)
	lock addq	$1, 280+__gcov0.runSA(%rip)
	addq	$16, %r14
	cmpq	%r14, -144(%rbp)
	jne	.L47
	lock addq	$1, 288+__gcov0.runSA(%rip)
	jmp	.L68
.L46:
	lock addq	$1, 288+__gcov0.runSA(%rip)
	movl	%r13d, -144(%rbp)
	jmp	.L44
.L108:
	call	log2@PLT
	jmp	.L34
.L107:
	movl	%eax, -56(%rbp)
	call	log2@PLT
	movl	-56(%rbp), %eax
	jmp	.L31
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
	.long	1702646469
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
	.long	1464416837
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
	.long	-1618511408
	.long	568912973
	.zero	4
	.long	22
	.zero	4
	.quad	__gcov0.print_best_clusters
	.section	.rodata.str1.1
.LC40:
	.string	"/home/mariana/tese/SA/sa.gcda"
	.section	.data.rel,"aw"
	.align 32
	.type	.LPBX0, @object
	.size	.LPBX0, 120
.LPBX0:
	.long	1094267690
	.zero	4
	.quad	0
	.long	-901035710
	.zero	4
	.quad	.LC40
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
	.long	-1567164810
	.long	-186166888
	.zero	4
	.long	70
	.zero	4
	.quad	__gcov0.runSA
	.local	__gcov0.getTemperature
	.comm	__gcov0.getTemperature,8,8
	.local	__gcov0.getEll
	.comm	__gcov0.getEll,24,16
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
.LC28:
	.long	4290772992
	.long	1105199103
	.align 8
.LC38:
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
