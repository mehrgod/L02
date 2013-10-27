	.file	"racer.c"
	.text
	.p2align 4,,15
	.globl	racer
	.type	racer, @function
racer:
.LFB0:
	.cfi_startproc
	addl	$20000000, ring
	ret
	.cfi_endproc
.LFE0:
	.size	racer, .-racer
	.globl	ring
	.bss
	.align 4
	.type	ring, @object
	.size	ring, 4
ring:
	.zero	4
	.ident	"GCC: (SUSE Linux) 4.7.2 20130108 [gcc-4_7-branch revision 195012]"
	.section	.comment.SUSE.OPTs,"MS",@progbits,1
	.string	"Ospwg"
	.section	.note.GNU-stack,"",@progbits
