	.file	"vector_ops.cpp"
	.text
	.globl	_Z10add_scalarPKfS0_Pfy
	.def	_Z10add_scalarPKfS0_Pfy;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10add_scalarPKfS0_Pfy
_Z10add_scalarPKfS0_Pfy:
.LFB5050:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L2
.L3:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	vmovss	(%rax), %xmm1
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	vmovss	(%rax), %xmm0
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L2:
	movq	-8(%rbp), %rax
	cmpq	40(%rbp), %rax
	jb	.L3
	nop
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z8add_avx2PKfS0_Pfy
	.def	_Z8add_avx2PKfS0_Pfy;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8add_avx2PKfS0_Pfy
_Z8add_avx2PKfS0_Pfy:
.LFB5051:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$240, %rsp
	.seh_stackalloc	240
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	%rbp, %rax
	subq	$240, %rax
	addq	$31, %rax
	shrq	$5, %rax
	salq	$5, %rax
	movq	$0, -8(%rbp)
	jmp	.L5
.L9:
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,4), %rcx
	movq	16(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, -32(%rbp)
	movq	-32(%rbp), %rdx
	vmovups	(%rdx), %ymm0
	vmovaps	%ymm0, 160(%rax)
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,4), %rcx
	movq	24(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rdx
	vmovups	(%rdx), %ymm0
	vmovaps	%ymm0, 128(%rax)
	vmovaps	160(%rax), %ymm0
	vmovaps	%ymm0, 32(%rax)
	vmovaps	128(%rax), %ymm0
	vmovaps	%ymm0, (%rax)
	vmovaps	32(%rax), %ymm0
	vaddps	(%rax), %ymm0, %ymm0
	vmovaps	%ymm0, 96(%rax)
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,4), %rcx
	movq	32(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, -16(%rbp)
	vmovaps	96(%rax), %ymm0
	vmovaps	%ymm0, 64(%rax)
	vmovaps	64(%rax), %ymm0
	movq	-16(%rbp), %rdx
	vmovups	%ymm0, (%rdx)
	nop
	addq	$8, -8(%rbp)
.L5:
	movq	-8(%rbp), %rdx
	addq	$8, %rdx
	cmpq	%rdx, 40(%rbp)
	jnb	.L9
	jmp	.L10
.L11:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	vmovss	(%rax), %xmm1
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	vmovss	(%rax), %xmm0
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L10:
	movq	-8(%rbp), %rax
	cmpq	40(%rbp), %rax
	jb	.L11
	nop
	nop
	addq	$240, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (MinGW-W64 x86_64-ucrt-posix-seh, built by Brecht Sanders, r1) 14.1.0"
