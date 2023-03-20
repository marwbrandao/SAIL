	.file	"text.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC14:
	.string	"Node 020100 has %d voters, %d votes for BE, %d votes for PCP, %d votes for PSD, %d votes for PS.\n"
	.align 8
.LC15:
	.string	"Node 020100 is connected to node %d.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$1, %edi
	movl	$382, %ecx
	movl	$1491, %r8d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	$274, %r9d
	movl	$8140, %edx
	leaq	.LC14(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$448, %rsp
	.cfi_def_cfa_offset 480
	movdqa	.LC0(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 440(%rsp)
	xorl	%eax, %eax
	movl	$1752, 16(%rsp)
	movq	%rsp, %rbx
	leaq	32(%rsp), %rax
	movaps	%xmm0, (%rsp)
	movdqa	.LC1(%rip), %xmm0
	movq	%rax, %xmm1
	leaq	64(%rsp), %rax
	movl	$1590, 48(%rsp)
	movaps	%xmm0, 32(%rsp)
	movdqa	.LC2(%rip), %xmm0
	movl	$372, 80(%rsp)
	movaps	%xmm0, 64(%rsp)
	movdqa	.LC3(%rip), %xmm0
	movl	$263, 112(%rsp)
	movaps	%xmm0, 96(%rsp)
	movdqa	.LC4(%rip), %xmm0
	movl	$5501, 144(%rsp)
	movaps	%xmm0, 128(%rsp)
	movdqa	.LC5(%rip), %xmm0
	movl	$1387, 176(%rsp)
	movaps	%xmm0, 160(%rsp)
	movdqa	.LC6(%rip), %xmm0
	movl	$857, 208(%rsp)
	movaps	%xmm0, 192(%rsp)
	movdqa	.LC7(%rip), %xmm0
	movl	$1483, 240(%rsp)
	movaps	%xmm0, 224(%rsp)
	movdqa	.LC8(%rip), %xmm0
	movaps	%xmm0, 256(%rsp)
	movl	$1547, 272(%rsp)
	movdqa	.LC9(%rip), %xmm0
	movl	$2352, 304(%rsp)
	movaps	%xmm0, 288(%rsp)
	movdqa	.LC10(%rip), %xmm0
	movl	$4782, 336(%rsp)
	movaps	%xmm0, 320(%rsp)
	movdqa	.LC11(%rip), %xmm0
	movl	$1035, 368(%rsp)
	movaps	%xmm0, 352(%rsp)
	movdqa	.LC12(%rip), %xmm0
	movl	$2236, 400(%rsp)
	movaps	%xmm0, 384(%rsp)
	movdqa	.LC13(%rip), %xmm0
	movl	$1004, 432(%rsp)
	movaps	%xmm0, 416(%rsp)
	movq	%rbx, %xmm0
	punpcklqdq	%xmm1, %xmm0
	movaps	%xmm0, graph(%rip)
	movq	%rax, %xmm0
	leaq	96(%rsp), %rax
	movq	%rax, %xmm2
	leaq	128(%rsp), %rax
	punpcklqdq	%xmm2, %xmm0
	movaps	%xmm0, 16+graph(%rip)
	movq	%rax, %xmm0
	leaq	160(%rsp), %rax
	movq	%rax, %xmm3
	leaq	192(%rsp), %rax
	punpcklqdq	%xmm3, %xmm0
	movaps	%xmm0, 32+graph(%rip)
	movq	%rax, %xmm0
	leaq	224(%rsp), %rax
	movq	%rax, %xmm4
	leaq	256(%rsp), %rax
	punpcklqdq	%xmm4, %xmm0
	movaps	%xmm0, 48+graph(%rip)
	movq	%rax, %xmm0
	leaq	288(%rsp), %rax
	movq	%rax, %xmm5
	leaq	320(%rsp), %rax
	punpcklqdq	%xmm5, %xmm0
	movaps	%xmm0, 64+graph(%rip)
	movq	%rax, %xmm0
	leaq	352(%rsp), %rax
	movq	%rax, %xmm6
	leaq	384(%rsp), %rax
	punpcklqdq	%xmm6, %xmm0
	movaps	%xmm0, 80+graph(%rip)
	movq	%rax, %xmm0
	leaq	416(%rsp), %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 488
	pushq	$1752
	.cfi_def_cfa_offset 496
	movq	%rax, %xmm7
	xorl	%eax, %eax
	punpcklqdq	%xmm7, %xmm0
	movaps	%xmm0, 96+graph(%rip)
	call	__printf_chk@PLT
	cmpq	%rbx, graph(%rip)
	popq	%rdi
	.cfi_def_cfa_offset 488
	popq	%r8
	.cfi_def_cfa_offset 480
	je	.L6
.L4:
	movq	440(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L11
	addq	$448, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	movl	$1, %ebx
	leaq	graph(%rip), %rbp
	leaq	.LC15(%rip), %r12
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L3:
	addq	$1, %rbx
	cmpq	$14, %rbx
	je	.L4
.L2:
	movq	0(%rbp), %rax
	movq	0(%rbp,%rbx,8), %rdx
	cmpq	%rdx, %rax
	je	.L3
	movl	(%rax), %esi
	testl	%esi, %esi
	jle	.L3
	movl	(%rdx), %ecx
	testl	%ecx, %ecx
	jle	.L3
	movl	4(%rdx), %ecx
	cmpl	%ecx, 4(%rax)
	jle	.L3
	leal	20100(%rbx), %edx
	movq	%r12, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L3
.L11:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	main, .-main
	.comm	graph,112,32
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	8140
	.long	382
	.long	1491
	.long	274
	.align 16
.LC1:
	.long	6240
	.long	388
	.long	299
	.long	600
	.align 16
.LC2:
	.long	1903
	.long	78
	.long	213
	.long	140
	.align 16
.LC3:
	.long	1330
	.long	49
	.long	156
	.long	80
	.align 16
.LC4:
	.long	29040
	.long	1549
	.long	3589
	.long	2460
	.align 16
.LC5:
	.long	6126
	.long	365
	.long	836
	.long	337
	.align 16
.LC6:
	.long	3778
	.long	141
	.long	674
	.long	197
	.align 16
.LC7:
	.long	6542
	.long	324
	.long	735
	.long	372
	.align 16
.LC8:
	.long	5998
	.long	232
	.long	901
	.long	301
	.align 16
.LC9:
	.long	12258
	.long	380
	.long	1083
	.long	653
	.align 16
.LC10:
	.long	19815
	.long	1181
	.long	1628
	.long	1496
	.align 16
.LC11:
	.long	4324
	.long	162
	.long	319
	.long	602
	.align 16
.LC12:
	.long	12745
	.long	437
	.long	2191
	.long	759
	.align 16
.LC13:
	.long	4748
	.long	165
	.long	540
	.long	273
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
