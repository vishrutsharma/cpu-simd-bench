	.file	"vector_ops.cpp"
	.text
	.p2align 4
	.globl	_Z10add_scalarPKfS0_Pfy
	.def	_Z10add_scalarPKfS0_Pfy;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10add_scalarPKfS0_Pfy
_Z10add_scalarPKfS0_Pfy:
.LFB6602:
	.seh_endprologue
	testq	%r9, %r9
	je	.L33
	leaq	-1(%r9), %rax
	cmpq	$2, %rax
	jbe	.L12
	leaq	4(%rcx), %r11
	movq	%r8, %r10
	subq	%r11, %r10
	cmpq	$24, %r10
	jbe	.L12
	leaq	4(%rdx), %r11
	movq	%r8, %r10
	subq	%r11, %r10
	cmpq	$24, %r10
	jbe	.L12
	movq	%r9, %r10
	cmpq	$6, %rax
	jbe	.L13
	shrq	$3, %r10
	xorl	%eax, %eax
	salq	$5, %r10
	.p2align 4,,10
	.p2align 3
.L5:
	vmovups	(%rdx,%rax), %ymm0
	vaddps	(%rcx,%rax), %ymm0, %ymm0
	vmovups	%ymm0, (%r8,%rax)
	addq	$32, %rax
	cmpq	%r10, %rax
	jne	.L5
	movq	%r9, %rax
	andq	$-8, %rax
	testb	$7, %r9b
	je	.L31
	movq	%r9, %r10
	subq	%rax, %r10
	leaq	-1(%r10), %r11
	cmpq	$2, %r11
	jbe	.L35
	vzeroupper
.L4:
	vmovups	(%rdx,%rax,4), %xmm0
	vaddps	(%rcx,%rax,4), %xmm0, %xmm0
	movq	%r10, %r11
	andq	$-4, %r11
	vmovups	%xmm0, (%r8,%rax,4)
	addq	%r11, %rax
	andl	$3, %r10d
	je	.L33
.L7:
	vmovss	(%rcx,%rax,4), %xmm0
	vaddss	(%rdx,%rax,4), %xmm0, %xmm0
	leaq	1(%rax), %r11
	leaq	0(,%rax,4), %r10
	vmovss	%xmm0, (%r8,%rax,4)
	cmpq	%r9, %r11
	jnb	.L33
	vmovss	4(%rcx,%r10), %xmm0
	vaddss	4(%rdx,%r10), %xmm0, %xmm0
	addq	$2, %rax
	vmovss	%xmm0, 4(%r8,%r10)
	cmpq	%r9, %rax
	jnb	.L33
	vmovss	8(%rcx,%r10), %xmm0
	vaddss	8(%rdx,%r10), %xmm0, %xmm0
	vmovss	%xmm0, 8(%r8,%r10)
.L33:
	ret
.L35:
	vzeroupper
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L12:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L9:
	vmovss	(%rcx,%rax,4), %xmm0
	vaddss	(%rdx,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%r8,%rax,4)
	addq	$1, %rax
	cmpq	%rax, %r9
	jne	.L9
	ret
.L31:
	vzeroupper
	ret
.L13:
	xorl	%eax, %eax
	jmp	.L4
	.seh_endproc
	.p2align 4
	.globl	_Z8add_avx2PKfS0_Pfy
	.def	_Z8add_avx2PKfS0_Pfy;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8add_avx2PKfS0_Pfy
_Z8add_avx2PKfS0_Pfy:
.LFB6603:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	.seh_endprologue
	cmpq	$7, %r9
	jbe	.L46
	movl	$8, %eax
	.p2align 4,,10
	.p2align 3
.L38:
	vmovups	-32(%rdx,%rax,4), %ymm0
	vaddps	-32(%rcx,%rax,4), %ymm0, %ymm0
	vmovups	%ymm0, -32(%r8,%rax,4)
	addq	$8, %rax
	cmpq	%rax, %r9
	jnb	.L38
	leaq	-8(%r9), %rax
	andq	$-8, %rax
	addq	$8, %rax
	vzeroupper
.L37:
	cmpq	%r9, %rax
	jnb	.L67
	movq	%r9, %rsi
	leaq	0(,%rax,4), %r10
	subq	%rax, %rsi
	cmpq	$1, %rsi
	je	.L40
	leaq	0(,%rax,4), %r10
	leaq	(%r8,%r10), %rbx
	leaq	4(%r10), %r11
	leaq	(%rdx,%r11), %rbp
	movq	%rbx, %rdi
	subq	%rbp, %rdi
	cmpq	$8, %rdi
	jbe	.L40
	addq	%rcx, %r11
	movq	%rbx, %rdi
	subq	%r11, %rdi
	cmpq	$8, %rdi
	jbe	.L40
	leaq	-1(%rsi), %r9
	cmpq	$2, %r9
	jbe	.L47
	vmovups	(%rdx,%rax,4), %xmm0
	movq	%rsi, %r11
	vaddps	(%rcx,%rax,4), %xmm0, %xmm0
	andq	$-4, %r11
	leaq	(%rax,%r11), %r9
	vmovups	%xmm0, (%rbx)
	movq	%r9, %r10
	testb	$3, %sil
	je	.L67
	subq	%r11, %rsi
	cmpq	$1, %rsi
	je	.L43
.L41:
	vmovq	(%rdx,%r9,4), %xmm1
	vmovq	(%rcx,%r9,4), %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	vmovlps	%xmm0, (%r8,%r9,4)
	testb	$1, %sil
	je	.L67
	movq	%rsi, %rax
	andq	$-2, %rax
	addq	%rax, %r10
.L43:
	vmovss	(%rcx,%r10,4), %xmm0
	vaddss	(%rdx,%r10,4), %xmm0, %xmm0
	vmovss	%xmm0, (%r8,%r10,4)
.L67:
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	vmovss	(%rcx,%rax,4), %xmm0
	vaddss	(%rdx,%rax,4), %xmm0, %xmm0
	leaq	1(%rax), %r11
	vmovss	%xmm0, (%r8,%rax,4)
	cmpq	%r9, %r11
	jnb	.L67
	vmovss	4(%rcx,%r10), %xmm0
	vaddss	4(%rdx,%r10), %xmm0, %xmm0
	leaq	2(%rax), %r11
	vmovss	%xmm0, 4(%r8,%r10)
	cmpq	%r9, %r11
	jnb	.L67
	vmovss	8(%rcx,%r10), %xmm0
	vaddss	8(%rdx,%r10), %xmm0, %xmm0
	leaq	3(%rax), %r11
	vmovss	%xmm0, 8(%r8,%r10)
	cmpq	%r9, %r11
	jnb	.L67
	vmovss	12(%rcx,%r10), %xmm0
	vaddss	12(%rdx,%r10), %xmm0, %xmm0
	leaq	4(%rax), %r11
	vmovss	%xmm0, 12(%r8,%r10)
	cmpq	%r9, %r11
	jnb	.L67
	vmovss	16(%rcx,%r10), %xmm0
	vaddss	16(%rdx,%r10), %xmm0, %xmm0
	leaq	5(%rax), %r11
	vmovss	%xmm0, 16(%r8,%r10)
	cmpq	%r9, %r11
	jnb	.L67
	vmovss	20(%rcx,%r10), %xmm0
	vaddss	20(%rdx,%r10), %xmm0, %xmm0
	addq	$6, %rax
	vmovss	%xmm0, 20(%r8,%r10)
	cmpq	%r9, %rax
	jnb	.L67
	vmovss	24(%rcx,%r10), %xmm0
	vaddss	24(%rdx,%r10), %xmm0, %xmm0
	vmovss	%xmm0, 24(%r8,%r10)
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L46:
	xorl	%eax, %eax
	jmp	.L37
.L47:
	movq	%rax, %r10
	movq	%rax, %r9
	jmp	.L41
	.seh_endproc
	.ident	"GCC: (MinGW-W64 x86_64-ucrt-posix-seh, built by Brecht Sanders, r1) 14.1.0"
