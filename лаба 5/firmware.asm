	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	__vector_20
	.type	__vector_20, @function
__vector_20:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
	push r19
	push r24
	push r25
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	lds r24,step
	lds r25,step+1
	sts 132+1,r25
	sts 132,r24
	in r24,0xc
	ldi r25,0
	lds r18,counter
	lds r19,counter+1
	subi r18,1
	sbc r19,__zero_reg__
	rjmp 2f
	1:
	asr r25
	ror r24
	2:
	dec r18
	brpl 1b
	sbrc r24,0
	out 0xe,__zero_reg__
.L2:
	in r18,0xe
	ldi r24,lo8(1)
	ldi r25,0
	lds r0,counter
	rjmp 2f
	1:
	lsl r24
	rol r25
	2:
	dec r0
	brpl 1b
	or r24,r18
	out 0xe,r24
	lds r24,counter
	lds r25,counter+1
	cpi r24,4
	cpc r25,__zero_reg__
	brne .L3
	sts counter+1,__zero_reg__
	sts counter,__zero_reg__
	rjmp .L1
.L3:
	adiw r24,1
	sts counter+1,r25
	sts counter,r24
.L1:
/* epilogue start */
	pop r25
	pop r24
	pop r19
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.size	__vector_20, .-__vector_20
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
	sbi 0xd,3
	sbi 0xd,4
	cbi 0xd,5
	sbi 0xd,6
	sbi 0xd,7
	ldi r24,lo8(3)
	sts 129,r24
	lds r24,111
	ori r24,lo8(1)
	sts 111,r24
/* #APP */
 ;  62 "main.c" 1
	sei
 ;  0 "" 2
/* #NOAPP */
.L14:
	sbis 0xc,5
	rjmp .L10
	ldi r24,lo8(-25537)
	ldi r25,hi8(-25537)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	lds r24,btn_ticks_counter
	cpse r24,__zero_reg__
	rjmp .L11
	lds r25,btn_click_counter
	subi r25,lo8(-(1))
	sts btn_click_counter,r25
	rjmp .L12
.L11:
	cpi r24,lo8(10)
	brsh .L13
.L12:
	subi r24,lo8(-(1))
	sts btn_ticks_counter,r24
	rjmp .L13
.L10:
	sts btn_ticks_counter,__zero_reg__
.L13:
	lds r24,btn_click_counter
	cpi r24,lo8(1)
	brne .L14
	lds r24,step
	lds r25,step+1
	subi r24,24
	sbci r25,-4
	sts step+1,r25
	sts step,r24
	sts btn_click_counter,__zero_reg__
	rjmp .L14
	.size	main, .-main
.global	step
	.data
	.type	step, @object
	.size	step, 2
step:
	.word	-7536
.global	btn_ticks_counter
	.section .bss
	.type	btn_ticks_counter, @object
	.size	btn_ticks_counter, 1
btn_ticks_counter:
	.zero	1
.global	btn_click_counter
	.type	btn_click_counter, @object
	.size	btn_click_counter, 1
btn_click_counter:
	.zero	1
.global	counter
	.type	counter, @object
	.size	counter, 2
counter:
	.zero	2
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
.global __do_clear_bss
