	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbi 0x4,6
	cbi 0x5,6
	sbi 0xd,0
	cbi 0xe,0
.L2:
	sbi 0x5,6
	rjmp .L2
	.size	main, .-main
	.ident	"GCC: (GNU) 5.4.0"
