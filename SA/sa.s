	.file	"sa.c"
	.text
	.p2align 4
	.globl	getTemperature
	.type	getTemperature, @function
getTemperature:
.LFB41:
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
.LFE41:
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
.LFE42:
	.size	print_best_clusters, .-print_best_clusters
	.section	.rodata.str1.1
.LC15:
	.string	"temp start : %f\n"
.LC17:
	.string	"\nSA start!\n\n"
.LC18:
	.string	"w"
.LC19:
	.string	"output.txt"
.LC20:
	.string	"SA_graph.txt"
.LC21:
	.string	"%d;%d;%d\n"
.LC22:
	.string	"0,%d:"
.LC23:
	.string	"Cluster %d with size %d: "
.LC24:
	.string	"%d "
.LC25:
	.string	"cluster_info.txt"
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"best energy pop: %d, energy pop: %d \nbest energy comp: %d, energy comp: %d\n"
	.align 8
.LC27:
	.string	"temperature population: %f, temperature compactness: %f\n"
	.align 8
.LC28:
	.string	"---- here:accpet prob pop: %f and ccpet prob comp: %f\n"
	.section	.rodata.str1.1
.LC30:
	.string	"%d,%d:"
.LC31:
	.string	"prob: %f and random: %f\n"
.LC32:
	.string	"%d,%f,%d,%f\n"
	.section	.rodata.str1.8
	.align 8
.LC33:
	.string	"Temperature Population: %f, Temperature Compactness: %f, T: \n"
	.align 8
.LC34:
	.string	"----->iteration: %d, perfect: %d, not_perfect: %d\n"
	.section	.rodata.str1.1
.LC35:
	.string	"Borders: %d prob: %f\n\n"
.LC36:
	.string	"pop: %d prob: %f\n\n"
.LC37:
	.string	" --> population: %d\n"
.LC38:
	.string	"SA end!\n"
.LC40:
	.string	"Time taken: %f seconds\n"
	.text
	.p2align 4
	.globl	runSA
	.type	runSA, @function
runSA:
.LFB43:
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
	movsd	-56(%rbp), %xmm1
	divsd	-72(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	movsd	.LC16(%rip), %xmm1
	call	pow@PLT
	leaq	.LC17(%rip), %rsi
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
	leaq	.LC18(%rip), %rsi
	leaq	.LC19(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %r12
	lock addq	$1, 48+__gcov0.runSA(%rip)
	leaq	.LC18(%rip), %rsi
	leaq	.LC20(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -168(%rbp)
	lock addq	$1, 56+__gcov0.runSA(%rip)
	leaq	.LC21(%rip), %rdx
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
	leaq	.LC24(%rip), %rbx
	movl	$0, -60(%rbp)
	leaq	8(%rax), %r15
	testl	%r14d, %r14d
	jle	.L18
	.p2align 4,,10
	.p2align 3
.L17:
	lock addq	$1, 136+__gcov0.runSA(%rip)
	leaq	.LC22(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	-60(%rbp), %r14d
	movl	%r14d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 80+__gcov0.runSA(%rip)
	leaq	.LC23(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	(%r15), %ecx
	movl	%r14d, %edx
	call	__printf_chk@PLT
	lock addq	$1, 88+__gcov0.runSA(%rip)
	movl	(%r15), %r9d
	testl	%r9d, %r9d
	jle	.L53
	movq	%r12, -56(%rbp)
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L16:
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
	jg	.L16
	movq	-56(%rbp), %r12
.L15:
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
	jne	.L17
.L18:
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
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L20:
	testb	$1, -60(%rbp)
	je	.L85
.L42:
	movsd	-72(%rbp), %xmm5
	mulsd	-136(%rbp), %xmm5
	addl	$1, -60(%rbp)
	movl	-60(%rbp), %eax
	movsd	%xmm5, -72(%rbp)
	cmpl	$21, %eax
	je	.L86
.L14:
	leaq	.LC18(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	fopen@PLT
	lock addq	$1, 152+__gcov0.runSA(%rip)
	movl	-64(%rbp), %r13d
	movq	-128(%rbp), %r15
	movq	-104(%rbp), %r14
	movl	-96(%rbp), %ecx
	movl	%r13d, %edx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	change_unit@PLT
	lock addq	$1, 160+__gcov0.runSA(%rip)
	movl	16(%rbp), %r9d
	movl	-96(%rbp), %r8d
	movl	-120(%rbp), %edx
	movq	%r15, %rdi
	movl	%r13d, %ecx
	movq	%r14, %rsi
	call	energy_population@PLT
	movl	%eax, %r15d
	lock addq	$1, 168+__gcov0.runSA(%rip)
	movl	%r13d, %esi
	movq	%r14, %rdi
	call	energy_compactness@PLT
	movl	%eax, %r13d
	lock addq	$1, 176+__gcov0.runSA(%rip)
	leaq	.LC26(%rip), %rsi
	movl	$1, %edi
	movl	-116(%rbp), %r14d
	movl	-92(%rbp), %r8d
	movl	%r14d, %edx
	movl	%eax, %r9d
	movl	%r15d, %ecx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 184+__gcov0.runSA(%rip)
	movl	$1, %edi
	movl	$2, %eax
	leaq	.LC27(%rip), %rsi
	movsd	-72(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	call	__printf_chk@PLT
	lock addq	$1, 192+__gcov0.runSA(%rip)
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
	leaq	.LC28(%rip), %rsi
	movsd	%xmm0, -80(%rbp)
	movapd	%xmm0, %xmm1
	movsd	-56(%rbp), %xmm0
	call	__printf_chk@PLT
	lock addq	$1, 200+__gcov0.runSA(%rip)
	movsd	-56(%rbp), %xmm3
	movsd	-80(%rbp), %xmm4
	comisd	%xmm3, %xmm4
	movsd	%xmm3, -88(%rbp)
	ja	.L19
	lock addq	$1, 208+__gcov0.runSA(%rip)
	movsd	%xmm4, -88(%rbp)
.L19:
	call	rand@PLT
	lock addq	$1, 216+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	movsd	-88(%rbp), %xmm6
	cvtsi2sdl	%eax, %xmm0
	divsd	.LC29(%rip), %xmm0
	comisd	%xmm0, %xmm6
	movsd	%xmm0, -112(%rbp)
	jbe	.L20
	ucomisd	.LC0(%rip), %xmm6
	jp	.L61
	je	.L22
.L61:
	lock addq	$1, 224+__gcov0.runSA(%rip)
	addl	$1, -156(%rbp)
.L22:
	cmpl	-144(%rbp), %r13d
	jle	.L24
	lock addq	$1, 232+__gcov0.runSA(%rip)
	movslq	%r15d, %rax
	cmpq	-152(%rbp), %rax
	jle	.L87
.L26:
	lock addq	$1, 240+__gcov0.runSA(%rip)
	cmpq	%rax, -152(%rbp)
	jg	.L88
.L28:
	movsd	-56(%rbp), %xmm7
	comisd	-112(%rbp), %xmm7
	jbe	.L34
	lock addq	$1, 296+__gcov0.runSA(%rip)
	movl	%r15d, -116(%rbp)
.L34:
	movsd	-80(%rbp), %xmm7
	comisd	-112(%rbp), %xmm7
	jbe	.L36
	lock addq	$1, 304+__gcov0.runSA(%rip)
	movl	%r13d, -92(%rbp)
.L36:
	movl	-64(%rbp), %esi
	testl	%esi, %esi
	jle	.L57
	movq	-104(%rbp), %rax
	movl	$0, -56(%rbp)
	movl	$0, -80(%rbp)
	leaq	8(%rax), %r15
	.p2align 4,,10
	.p2align 3
.L41:
	lock addq	$1, 344+__gcov0.runSA(%rip)
	leaq	.LC30(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	-56(%rbp), %r8d
	movl	-60(%rbp), %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 312+__gcov0.runSA(%rip)
	movl	(%r15), %ecx
	testl	%ecx, %ecx
	jle	.L58
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L40:
	movq	-8(%r15), %rax
	movq	%rbx, %rdx
	movl	$1, %esi
	movq	%r12, %rdi
	movq	(%rax,%r13,8), %rax
	movl	(%rax), %ecx
	addl	8(%rax), %r14d
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	lock addq	$1, 320+__gcov0.runSA(%rip)
	addq	$1, %r13
	cmpl	%r13d, (%r15)
	jg	.L40
.L39:
	lock addq	$1, 328+__gcov0.runSA(%rip)
	leaq	.LC8(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	%r14d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 336+__gcov0.runSA(%rip)
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
	jne	.L41
.L38:
	lock addq	$1, 352+__gcov0.runSA(%rip)
	movl	$1, %esi
	movl	$2, %eax
	leaq	.LC31(%rip), %rdx
	movsd	-112(%rbp), %xmm1
	movsd	-88(%rbp), %xmm0
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 360+__gcov0.runSA(%rip)
	leaq	.LC14(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	-92(%rbp), %r14d
	movl	%r14d, %ecx
	movq	%r12, %rdi
	call	__fprintf_chk@PLT
	lock addq	$1, 368+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	leaq	.LC32(%rip), %rdx
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
	lock addq	$1, 376+__gcov0.runSA(%rip)
	movl	-96(%rbp), %edx
	movl	-64(%rbp), %esi
	movq	-104(%rbp), %rdi
	call	storeState@PLT
	lock addq	$1, 384+__gcov0.runSA(%rip)
	testb	$1, -60(%rbp)
	jne	.L42
.L85:
	lock addq	$1, 392+__gcov0.runSA(%rip)
	movl	$1, %edi
	movl	$2, %eax
	leaq	.LC33(%rip), %rsi
	movsd	-72(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	call	__printf_chk@PLT
	lock addq	$1, 400+__gcov0.runSA(%rip)
	xorl	%ecx, %ecx
	leaq	.LC34(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movl	-156(%rbp), %r8d
	movl	-60(%rbp), %edx
	call	__printf_chk@PLT
	lock addq	$1, 408+__gcov0.runSA(%rip)
	xorl	%r15d, %r15d
	movq	-104(%rbp), %rax
	movl	-64(%rbp), %edx
	movl	-64(%rbp), %r14d
	leaq	8(%rax), %r13
	testl	%edx, %edx
	jle	.L47
	.p2align 4,,10
	.p2align 3
.L46:
	movl	0(%r13), %ecx
	movl	%r15d, %edx
	leaq	.LC23(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	lock addq	$1, 416+__gcov0.runSA(%rip)
	movl	0(%r13), %eax
	testl	%eax, %eax
	jle	.L59
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L45:
	movq	-8(%r13), %rcx
	movq	(%rcx,%rax,8), %rcx
	addl	8(%rcx), %edx
	lock addq	$1, 424+__gcov0.runSA(%rip)
	addq	$1, %rax
	cmpl	%eax, 0(%r13)
	jg	.L45
.L44:
	leaq	.LC37(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 432+__gcov0.runSA(%rip)
	addl	$1, %r15d
	addq	$16, %r13
	cmpl	%r15d, %r14d
	jne	.L46
.L47:
	lock addq	$1, 440+__gcov0.runSA(%rip)
	movl	-64(%rbp), %r15d
	movq	-104(%rbp), %r14
	movl	16(%rbp), %r9d
	movl	-96(%rbp), %r8d
	movl	-120(%rbp), %edx
	movq	-128(%rbp), %rdi
	movl	%r15d, %ecx
	movq	%r14, %rsi
	call	energy_population@PLT
	lock addq	$1, 448+__gcov0.runSA(%rip)
	movl	%r15d, %esi
	movq	%r14, %rdi
	movslq	%eax, %r13
	call	energy_compactness@PLT
	movl	%eax, %r15d
	lock addq	$1, 456+__gcov0.runSA(%rip)
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
	leaq	.LC35(%rip), %rsi
	movl	$1, %eax
	call	__printf_chk@PLT
	lock addq	$1, 464+__gcov0.runSA(%rip)
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC36(%rip), %rsi
	movsd	-56(%rbp), %xmm1
	movapd	%xmm1, %xmm0
	movq	%r13, %rdx
	call	__printf_chk@PLT
	lock addq	$1, 472+__gcov0.runSA(%rip)
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L58:
	xorl	%r14d, %r14d
	jmp	.L39
.L59:
	xorl	%edx, %edx
	jmp	.L44
.L24:
	movslq	%r15d, %rax
	je	.L26
	lock addq	$1, 248+__gcov0.runSA(%rip)
	jmp	.L28
.L86:
	lock addq	$1, 480+__gcov0.runSA(%rip)
	movq	-176(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L48
	lock addq	$1, 488+__gcov0.runSA(%rip)
	movl	-64(%rbp), %r14d
	movl	16(%rbp), %r9d
	movl	-96(%rbp), %ecx
	movq	-128(%rbp), %rsi
	movl	%r14d, %edx
	movq	%r12, %r8
	movq	%rbx, %rdi
	call	print_best_clusters
	lock addq	$1, 496+__gcov0.runSA(%rip)
	movq	%rbx, %r13
	movq	-208(%rbp), %rbx
	leaq	16(%r13,%rbx), %rbx
	testl	%r14d, %r14d
	jle	.L51
	.p2align 4,,10
	.p2align 3
.L50:
	movq	0(%r13), %rdi
	call	free@PLT
	lock addq	$1, 504+__gcov0.runSA(%rip)
	addq	$16, %r13
	cmpq	%r13, %rbx
	jne	.L50
.L51:
	movq	-176(%rbp), %rdi
	call	free@PLT
.L48:
	movq	%r12, %rdi
	call	fclose@PLT
	lock addq	$1, 512+__gcov0.runSA(%rip)
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 520+__gcov0.runSA(%rip)
	leaq	.LC38(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	lock addq	$1, 528+__gcov0.runSA(%rip)
	call	clock@PLT
	lock addq	$1, 536+__gcov0.runSA(%rip)
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	leaq	.LC40(%rip), %rsi
	subq	-200(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC39(%rip), %xmm0
	call	__printf_chk@PLT
	lock addq	$1, 544+__gcov0.runSA(%rip)
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
.L53:
	.cfi_restore_state
	xorl	%r14d, %r14d
	jmp	.L15
.L87:
	movq	%rax, -152(%rbp)
.L25:
	cmpq	$0, -176(%rbp)
	je	.L89
	lock addq	$1, 280+__gcov0.runSA(%rip)
	movl	-64(%rbp), %edi
	testl	%edi, %edi
	jle	.L56
.L52:
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
.L33:
	movl	0(%r13), %eax
	movq	-8(%r12), %rdi
	addl	$1, %r15d
	movq	-8(%r13), %rsi
	movl	%eax, (%r12)
	movslq	0(%r13), %rdx
	salq	$3, %rdx
	call	memcpy@PLT
	lock addq	$1, 288+__gcov0.runSA(%rip)
	addq	$16, %r13
	addq	$16, %r12
	cmpl	%r15d, %r14d
	jg	.L33
	movl	-180(%rbp), %r13d
	movq	-144(%rbp), %r12
	movl	-160(%rbp), %r15d
	movl	%r13d, -144(%rbp)
	jmp	.L28
.L88:
	lock addq	$1, 256+__gcov0.runSA(%rip)
	movq	%rax, -152(%rbp)
	jmp	.L25
.L57:
	movl	$0, -80(%rbp)
	jmp	.L38
.L56:
	movl	%r13d, -144(%rbp)
	jmp	.L28
.L89:
	lock addq	$1, 264+__gcov0.runSA(%rip)
	movq	-216(%rbp), %rdi
	call	malloc@PLT
	movl	-64(%rbp), %r8d
	movq	%rax, -176(%rbp)
	testl	%r8d, %r8d
	jle	.L30
	movq	-208(%rbp), %rdi
	movq	%rax, %rdx
	movq	%rdx, %r14
	leaq	16(%rax,%rdi), %rax
	movq	%rax, -144(%rbp)
.L31:
	movq	-192(%rbp), %rdi
	call	malloc@PLT
	movl	$0, 8(%r14)
	movq	%rax, (%r14)
	lock addq	$1, 272+__gcov0.runSA(%rip)
	addq	$16, %r14
	cmpq	%r14, -144(%rbp)
	jne	.L31
	lock addq	$1, 280+__gcov0.runSA(%rip)
	jmp	.L52
.L30:
	lock addq	$1, 280+__gcov0.runSA(%rip)
	movl	%r13d, -144(%rbp)
	jmp	.L28
	.cfi_endproc
.LFE43:
	.size	runSA, .-runSA
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_sub_I_00100_0, @function
_sub_I_00100_0:
.LFB44:
	.cfi_startproc
	endbr64
	leaq	.LPBX0(%rip), %rdi
	jmp	__gcov_init@PLT
	.cfi_endproc
.LFE44:
	.size	_sub_I_00100_0, .-_sub_I_00100_0
	.section	.init_array.00100,"aw"
	.align 8
	.quad	_sub_I_00100_0
	.section	.text.exit,"ax",@progbits
	.p2align 4
	.type	_sub_D_00100_1, @function
_sub_D_00100_1:
.LFB45:
	.cfi_startproc
	endbr64
	jmp	__gcov_exit@PLT
	.cfi_endproc
.LFE45:
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
	.section	.rodata.str1.1
.LC41:
	.string	"/home/mariana/tese/SA/sa.gcda"
	.section	.data.rel,"aw"
	.align 32
	.type	.LPBX0, @object
	.size	.LPBX0, 120
.LPBX0:
	.long	1094267690
	.zero	4
	.quad	0
	.long	-624015450
	.zero	4
	.quad	.LC41
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
	.long	-1567164810
	.long	520455762
	.zero	4
	.long	69
	.zero	4
	.quad	__gcov0.runSA
	.local	__gcov0.getTemperature
	.comm	__gcov0.getTemperature,8,8
	.local	__gcov0.print_best_clusters
	.comm	__gcov0.print_best_clusters,176,32
	.local	__gcov0.runSA
	.comm	__gcov0.runSA,552,32
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
.LC16:
	.long	2576980378
	.long	1068079513
	.align 8
.LC29:
	.long	4290772992
	.long	1105199103
	.align 8
.LC39:
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
