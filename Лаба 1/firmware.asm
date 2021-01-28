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
	ldi r24,lo8(-1)
	out 0xd,r24
	out 0xe,__zero_reg__
	ldi r31,lo8(125)
	ldi r30,lo8(5)
	ldi r23,lo8(91)
	ldi r22,lo8(79)
	ldi r21,lo8(39)
	ldi r20,lo8(110)
	ldi r19,lo8(126)
	ldi r18,lo8(69)
	ldi r25,lo8(127)
	ldi r24,lo8(111)
.L2:
	out 0xe,r31
	ldi r26,lo8(4799999)
	ldi r27,hi8(4799999)
	ldi r28,hlo8(4799999)
1:	subi r26,1
	sbci r27,0
	sbci r28,0
	brne 1b
	rjmp .
	nop
	out 0xe,r30
	ldi r26,lo8(4799999)
	ldi r27,hi8(4799999)
	ldi r28,hlo8(4799999)
1:	subi r26,1
	sbci r27,0
	sbci r28,0
	brne 1b
	rjmp .
	nop
	out 0xe,r23
	ldi r26,lo8(4799999)
	ldi r27,hi8(4799999)
	ldi r28,hlo8(4799999)
1:	subi r26,1
	sbci r27,0
	sbci r28,0
	brne 1b
	rjmp .
	nop
	out 0xe,r22
	ldi r26,lo8(4799999)
	ldi r27,hi8(4799999)
	ldi r28,hlo8(4799999)
1:	subi r26,1
	sbci r27,0
	sbci r28,0
	brne 1b
	rjmp .
	nop
	out 0xe,r21
	ldi r26,lo8(4799999)
	ldi r27,hi8(4799999)
	ldi r28,hlo8(4799999)
1:	subi r26,1
	sbci r27,0
	sbci r28,0
	brne 1b
	rjmp .
	nop
	out 0xe,r20
	ldi r26,lo8(4799999)
	ldi r27,hi8(4799999)
	ldi r28,hlo8(4799999)
1:	subi r26,1
	sbci r27,0
	sbci r28,0
	brne 1b
	rjmp .
	nop
	out 0xe,r19
	ldi r26,lo8(4799999)
	ldi r27,hi8(4799999)
	ldi r28,hlo8(4799999)
1:	subi r26,1
	sbci r27,0
	sbci r28,0
	brne 1b
	rjmp .
	nop
	out 0xe,r18
	ldi r26,lo8(4799999)
	ldi r27,hi8(4799999)
	ldi r28,hlo8(4799999)
1:	subi r26,1
	sbci r27,0
	sbci r28,0
	brne 1b
	rjmp .
	nop
	out 0xe,r25
	ldi r26,lo8(4799999)
	ldi r27,hi8(4799999)
	ldi r28,hlo8(4799999)
1:	subi r26,1
	sbci r27,0
	sbci r28,0
	brne 1b
	rjmp .
	nop
	out 0xe,r24
	ldi r26,lo8(4799999)
	ldi r27,hi8(4799999)
	ldi r28,hlo8(4799999)
1:	subi r26,1
	sbci r27,0
	sbci r28,0
	brne 1b
	rjmp .
	nop
	rjmp .L2
	.size	main, .-main
	.ident	"GCC: (GNU) 5.4.0"
