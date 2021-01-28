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
	sbi 0xd,0
	sbi 0xd,1
	sbi 0xd,2
	cbi 0xd,5
	cbi 0xe,0
	cbi 0xe,1
	cbi 0xe,2
	sbi 0xe,5
	ldi r25,0
.L10:
	ldi r24,0
.L2:
	sbic 0xc,5
	rjmp .L9
	ldi r30,lo8(-25537)
	ldi r31,hi8(-25537)
1:	sbiw r30,1
	brne 1b
	rjmp .
	nop
	cpse r25,__zero_reg__
	rjmp .L4
	subi r24,lo8(-(1))
	rjmp .L5
.L4:
	cpi r25,lo8(10)
	brsh .L3
.L5:
	subi r25,lo8(-(1))
	rjmp .L3
.L9:
	ldi r25,0
.L3:
	cpi r24,lo8(1)
	brne .L6
	sbi 0xe,0
	cbi 0xe,2
	rjmp .L2
.L6:
	cpi r24,lo8(2)
	brne .L8
	sbi 0xe,1
	cbi 0xe,0
	rjmp .L2
.L8:
	cpi r24,lo8(3)
	brne .L2
	sbi 0xe,2
	cbi 0xe,1
	rjmp .L10
	.size	main, .-main
	.ident	"GCC: (GNU) 5.4.0"
