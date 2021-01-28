	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	read_adc
	.type	read_adc, @function
read_adc:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,124
	andi r24,lo8(-32)
	sts 124,r24
	ldi r18,lo8(16)
	ldi r24,0
	ldi r25,0
.L3:
	lds r19,122
	ori r19,lo8(64)
	sts 122,r19
.L2:
	lds r19,122
	sbrc r19,6
	rjmp .L2
	lds r20,120
	lds r21,120+1
	add r24,r20
	adc r25,r21
	subi r18,lo8(-(-1))
	brne .L3
	ldi r18,4
	1:
	lsr r25
	ror r24
	dec r18
	brne 1b
	ret
	.size	read_adc, .-read_adc
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbi 0xd,3
	cbi 0xe,3
	sbi 0xd,2
	cbi 0xe,2
	ldi r24,lo8(64)
	sts 124,r24
	ldi r24,lo8(-121)
	sts 122,r24
.L8:
	lds r24,123
	sbrc r24,5
	rjmp .L8
.L11:
	ldi r24,0
	call read_adc
	cpi r24,lo8(60)
	brsh .L9
	sbi 0xe,3
	sbi 0xe,2
	rjmp .L10
.L9:
	cbi 0xe,3
	cbi 0xe,2
.L10:
	ldi r24,lo8(-25537)
	ldi r25,hi8(-25537)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	rjmp .L11
	.size	main, .-main
	.ident	"GCC: (GNU) 5.4.0"
