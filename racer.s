	.file	"racer.c"
	.globl	ring
	.bss
	.align 4
	.type	ring, @object
	.size	ring, 4
ring:
	.zero	4
	.comm	mlock,24,4
	.comm	rc,4,4
	.text
	.globl	racer
	.type	racer, @function
racer:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$mlock, (%esp)
	call	pthread_mutex_lock
	movl	$20000000, -12(%ebp)
	jmp	.L2
.L3:
	movl	ring, %eax
	addl	$1, %eax
	movl	%eax, ring
	subl	$1, -12(%ebp)
.L2:
	cmpl	$0, -12(%ebp)
	jg	.L3
	movl	$mlock, (%esp)
	call	pthread_mutex_unlock
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	racer, .-racer
	.ident	"GCC: (SUSE Linux) 4.7.2 20130108 [gcc-4_7-branch revision 195012]"
	.section	.comment.SUSE.OPTs,"MS",@progbits,1
	.string	"ospwg"
	.section	.note.GNU-stack,"",@progbits
