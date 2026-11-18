| Mod 0022 - looper mode: TRK + REC, pads as clip slots, reported to the USB host.
| GENERATED from looper.c by build.sh (m68k-elf-gcc -mcpu=5475 -Os, LP_SLOTS=1 and 0); edit looper.c.
	.ifne P_FXIN
	.ifeq P_RUI
	.error "0022-looper: fxin=1 needs rui=1 (and sfx=1, slots=1)"
	.endif
#NO_APP
	.file	"looper.c"
	.text
#APP
	  .section .lp2,"ax"
  .globl looper_uart
looper_uart:
  movel %sp@(8),%sp@-
  movel %sp@(8),%sp@-
  jsr looper_uart_drop
  addql #8,%sp
  tstl %d0
  jeq 1f
  rts
1:
  lea %sp@(-12),%sp
  moveml %d2-%d4,%sp@
  jmp 0x400019ec
  .globl looper_router
looper_router:
  movel %sp@(8),%sp@-
  movel %sp@(8),%sp@-
  jsr looper_sysex
  addql #8,%sp
  tstl %d0
  jeq 2f
  rts
2:
  lea %sp@(-16),%sp
  moveml %d2-%d3/%a2-%a3,%sp@
  jmp 0x40083d74

	  .text
  .globl looper_pad
looper_pad:
  jsr looper_pad_skip
  tstl %d0
  jeq 1f
  moveq #1,%d0
  rts
1:
  lea %sp@(-76),%sp
  moveml %d2-%d5/%a2-%fp,%sp@
  jmp 0x400c785c

#NO_APP
	.section	.lp2,"ax",@progbits
	.align	2
	.type	send6, @function
send6:
	moveq #-76,%d0
	link.w %fp,#-8
	move.b 11(%fp),-5(%fp)
	move.b 15(%fp),-4(%fp)
	move.b 19(%fp),-3(%fp)
	move.l #1100088672,-(%sp)
	move.b 23(%fp),-2(%fp)
	move.b 27(%fp),-1(%fp)
	move.b %d0,-6(%fp)
	jsr 1073746108
	moveq #1,%d0
	pea -6(%fp)
	mov3q.l #6,-(%sp)
	move.b %d0,mod_call
	jsr 1073748452
	clr.b %d0
	move.l #1100088672,-(%sp)
	move.b %d0,mod_call
	jsr 1073746414
	lea (16,%sp),%sp
	unlk %fp
	rts
	.size	send6, .-send6
	.align	2
	.type	paint, @function
paint:
	mvz.b looper+1,%d1
	move.l %d2,-(%sp)
	move.l 8(%sp),%d0
	move.l %d0,%a0
	add.l #slot_state,%a0
	muls.w #12,%d1
	mov3q.l #3,%d2
	move.b (%a0,%d1.l),%d1
	subq.l #1,%d1
	mvz.b %d1,%d1
	cmp.l %d1,%d2
	jcs .L7
	lea (CSWTCH.9),%a0
	mvs.b (%a0,%d1.l),%d1
.L3:
	mov3q.l #3,%d2
	cmp.l %d0,%d2
	jlt .L4
	add.l #80,%d0
.L5:
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr send6
	lea (20,%sp),%sp
	move.l (%sp)+,%d2
	rts
.L7:
	clr.l %d1
	jra .L3
.L4:
	mov3q.l #7,%d2
	cmp.l %d0,%d2
	jlt .L6
	add.l #72,%d0
	jra .L5
.L6:
	add.l #64,%d0
	jra .L5
	.size	paint, .-paint
	.text
	.align	2
	.type	report, @function
report:
	link.w %fp,#-8
	move.l #-260222380,%d0
	moveq #127,%d1
	move.l %d0,-8(%fp)
	move.b 15(%fp),%d0
	move.b 11(%fp),-4(%fp)
	and.l %d1,%d0
	move.b %d0,-3(%fp)
	move.b 19(%fp),%d0
	and.l %d1,%d0
	mov3q.l #1,%d1
	move.b %d0,-2(%fp)
	moveq #-9,%d0
	move.b %d0,-1(%fp)
	cmp.l 1094562388.l,%d1
	jne .L8
	move.l 1094562704,%a0
	mov3q.l #4,%d0
.L10:
	tst.l %a0
	jeq .L8
	move.l 52(%a0),%a0
	subq.l #1,%d0
	tst.l %d0
	jne .L10
	move.l #1123449384,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jeq .L8
	mvz.w #4027,%d0
	cmp.l 1094562392.l,%d0
	jlt .L12
	pea -8(%fp)
	pea 8.w
	jsr 1073752544
	addq.l #8,%sp
.L12:
	move.l #1123449384,-(%sp)
	jsr 1073746414
	addq.l #4,%sp
.L8:
	unlk %fp
	rts
	.size	report, .-report
	.section	.lp3,"ax",@progbits
	.align	2
	.type	paint_all, @function
paint_all:
	lea (-16,%sp),%sp
	movem.l #1052,(%sp)
	clr.l %d2
	tst.b looper.l
	jeq .L31
	lea paint,%a2
.L25:
	move.l %d2,-(%sp)
	jsr (%a2)
	addq.l #1,%d2
	addq.l #4,%sp
	moveq #12,%d0
	cmp.l %d2,%d0
	jne .L25
.L23:
	movem.l (%sp),#1052
	lea (16,%sp),%sp
	rts
.L31:
	lea send6,%a2
.L24:
	mvz.w %d2,%d0
	lsl.l #2,%d0
	move.l %d0,%a0
	add.l #1123774345,%a0
	mvs.b 1(%a0),%d0
	mvs.b 3(%a0),%d4
	mvs.b 2(%a0),%d3
	mvs.b (%a0),%d1
	move.l %d0,%a1
	mov3q.l #3,%d0
	cmp.l %d2,%d0
	jlt .L27
	move.l %d2,%d0
	add.l #80,%d0
.L28:
	move.l %d4,-(%sp)
	move.l %d3,-(%sp)
	move.l %a1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a2)
	addq.l #1,%d2
	lea (20,%sp),%sp
	moveq #12,%d0
	cmp.l %d2,%d0
	jne .L24
	move.l #1100088672,-(%sp)
	moveq #18,%d2
	jsr 1073746108
	moveq #1,%d0
	addq.l #4,%sp
	move.l #1100088628,%a2
	move.b %d0,mod_call
.L30:
	mvz.b (%a2,%d2.l),%d0
	move.l %d0,-(%sp)
	move.l %d2,-(%sp)
	jsr 1074355016
	addq.l #1,%d2
	addq.l #8,%sp
	moveq #21,%d0
	cmp.l %d2,%d0
	jne .L30
	clr.b %d0
	move.l #1100088672,-(%sp)
	move.b %d0,mod_call
	jsr 1073746414
	addq.l #4,%sp
	jra .L23
.L27:
	mov3q.l #7,%d0
	cmp.l %d2,%d0
	jlt .L29
	move.l %d2,%d0
	add.l #72,%d0
	jra .L28
.L29:
	move.l %d2,%d0
	add.l #64,%d0
	jra .L28
	.size	paint_all, .-paint_all
	.align	2
	.globl	looper_uart_drop
	.type	looper_uart_drop, @function
looper_uart_drop:
	move.l %d2,-(%sp)
	move.l 12(%sp),%a0
	tst.b looper.l
	jne .L36
.L40:
	clr.l %d0
	jra .L35
.L36:
	tst.b mod_call.l
	jne .L40
	mov3q.l #1,%d0
	cmp.l 8(%sp),%d0
	jge .L40
	move.b (%a0),%d0
	mov3q.l #4,%d1
	add.l #80,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d1
	jcs .L40
	move.b 1(%a0),%d1
	mov3q.l #1,%d0
	moveq #11,%d2
	add.l #-72,%d1
	mvz.b %d1,%d1
	cmp.l %d1,%d2
	jcs .L40
.L35:
	move.l (%sp)+,%d2
	rts
	.size	looper_uart_drop, .-looper_uart_drop
	.align	2
	.globl	looper_sel
	.type	looper_sel, @function
looper_sel:
	move.l %d2,-(%sp)
	move.l 8(%sp),%d0
	move.l 12(%sp),%d1
	tst.b looper.l
	jeq .L42
	tst.b mod_call.l
	jne .L42
	move.l %d0,%a0
	mov3q.l #2,%d2
	lea (-18,%a0),%a0
	cmp.l %a0,%d2
	jcc .L41
.L42:
	move.l %d1,12(%sp)
	move.l %d0,8(%sp)
	move.l (%sp)+,%d2
	jmp 1074355016
.L41:
	move.l (%sp)+,%d2
	rts
	.size	looper_sel, .-looper_sel
	.section	.lp4,"ax",@progbits
	.align	2
	.globl	looper_sysex
	.type	looper_sysex, @function
looper_sysex:
	lea (-12,%sp),%sp
	mov3q.l #6,%d0
	move.l 20(%sp),%a1
	movem.l #1036,(%sp)
	move.l 16(%sp),%a0
	cmp.l %a1,%d0
	jlt .L45
.L47:
	clr.l %d0
.L44:
	movem.l (%sp),#1036
	lea (12,%sp),%sp
	rts
.L45:
	mvz.b (%a0),%d0
	cmp.l #240,%d0
	jne .L47
	mvz.b 1(%a0),%d0
	moveq #125,%d1
	cmp.l %d0,%d1
	jne .L47
	mvz.b 2(%a0),%d0
	moveq #82,%d2
	cmp.l %d0,%d2
	jne .L47
	mvz.b 3(%a0),%d0
	moveq #84,%d3
	cmp.l %d0,%d3
	jne .L47
	move.b 4(%a0),%d1
	moveq #29,%d2
	mvz.b %d1,%d0
	cmp.l %d0,%d2
	jcs .L48
	moveq #20,%d3
	cmp.l %d0,%d3
	jcs .L56
	moveq #14,%d1
	cmp.l %d0,%d1
	jeq .L50
	cmp.l %d0,%d3
	jeq .L50
	moveq #8,%d2
	cmp.l %d0,%d2
	jeq .L51
	moveq #9,%d3
	cmp.l %d0,%d3
	jcs .L64
	mov3q.l #7,%d2
	cmp.l %d0,%d2
	jne .L55
	cmp.l %a1,%d2
	jeq .L55
	mvz.b 5(%a0),%d0
	moveq #95,%d3
	cmp.l %d0,%d3
	jcs .L55
	lea slot_state,%a1
	lea (6,%a0),%a2
	move.b (%a2),(%a1,%d0.l)
	tst.b looper.l
	jeq .L55
	mvz.b 5(%a0),%d0
	moveq #19,%d3
	move.w %d0,%d1
	mulu.w #43691,%d1
	move.l %d1,%d2
	lsr.l %d3,%d2
	move.l %d2,%a0
	mvz.b looper+1,%d2
	cmp.l %d2,%a0
	jne .L55
	move.w %a0,%d1
	muls.w #12,%d1
	sub.l %d1,%d0
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	jsr paint
	addq.l #4,%sp
	jra .L55
.L48:
	moveq #36,%d3
	cmp.l %d0,%d3
	jcs .L53
	moveq #32,%d1
	cmp.l %d0,%d1
	jcs .L54
.L55:
	mov3q.l #1,%d0
	jra .L44
.L53:
	moveq #82,%d2
	cmp.l %d0,%d2
	jeq .L56
	moveq #40,%d2
	cmp.l %d0,%d2
	jeq .L62
	jcs .L63
.L64:
	moveq #38,%d2
	cmp.l %d0,%d2
	jne .L55
	mvz.b 5(%a0),%d0
	mov3q.l #1,%d1
	cmp.l %d0,%d1
	jcs .L69
	add.l #1180191024,%d0
	move.l %d0,1075551844
.L69:
	move.w 1075551848,%d0
	addq.l #1,%d0
	move.w %d0,1075551848
	jra .L55
.L51:
	move.b mutes_held,%d0
	tst.b 5(%a0)
	jeq .L58
	tst.b %d0
	jne .L55
	moveq #1,%d0
	move.l #-2147422824,%a0
	move.l (%a0),mutes_kept
	move.b %d0,mutes_held
	mvz.w #4095,%d0
.L59:
	moveq #24,%d2
	move.l %d0,%d1
	lsr.l %d2,%d1
	move.l %d0,-2147422824
	move.b %d1,1093765527
	move.l %d0,%d1
	clr.w %d1
	swap %d1
	move.b %d1,1093765528
	move.l %d0,%d1
	lsr.l #8,%d1
	move.b %d1,1093765529
	move.b %d0,1093765530
	jra .L55
.L58:
	tst.b %d0
	jeq .L55
	clr.b %d1
	move.l mutes_kept,%d0
	move.b %d1,mutes_held
	jra .L59
.L50:
	move.l #1413763670,%d3
	cmp.l 1075550836.l,%d3
	jne .L55
	move.l 1075550840,%d0
.L90:
	move.l %a1,-(%sp)
	move.l %a0,-(%sp)
	move.l %d0,%a0
	jsr (%a0)
	addq.l #8,%sp
	jra .L55
.L56:
	move.l #1247104591,%a2
	cmp.l 1073904132.l,%a2
	jne .L55
	move.l 1073904136,%d0
	jra .L90
.L54:
	moveq #35,%d1
	cmp.l %d0,%d1
	jeq .L55
.L61:
	move.l #1397119061,%d3
	cmp.l 1075551828.l,%d3
	jne .L55
	move.l 1075551832,%d0
	jra .L90
.L63:
	moveq #63,%d3
	cmp.l %d0,%d3
	jcs .L67
	moveq #45,%d1
	cmp.l %d0,%d1
	jcc .L55
.L62:
	move.l #1381321040,%a2
	cmp.l 1075551836.l,%a2
	jne .L55
	move.l 1075551840,%d0
	jra .L90
.L67:
	move.l %d1,%d0
	add.l #-69,%d0
	mvz.b %d0,%d0
	moveq #21,%d2
	cmp.l %d0,%d2
	jcs .L55
	mov3q.l #1,%d1
	lsl.l %d0,%d1
	and.l #2098223,%d1
	tst.l %d1
	jne .L62
	moveq #12,%d1
	cmp.l %d0,%d1
	jeq .L61
	jra .L55
	.size	looper_sysex, .-looper_sysex
	.text
	.align	2
	.globl	looper_pad_skip
	.type	looper_pad_skip, @function
looper_pad_skip:
	mvz.b looper,%d0
	rts
	.size	looper_pad_skip, .-looper_pad_skip
	.align	2
	.globl	looper_key
	.type	looper_key, @function
looper_key:
	subq.l #4,%sp
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 20(%sp),%a1
	mov3q.l #1,%d1
	move.l 16(%sp),8(%sp)
	move.l 12(%a1),%a0
	and.l 16(%a1),%d1
	cmp.l #134,%a0
	jne .L94
	move.b %d1,looper+2
.L95:
	tst.b looper.l
	jeq .L100
	move.l %a0,%d0
	add.l #-66,%d0
	lsr.l #1,%d0
	jne .L100
	tst.l %d1
	jeq .L93
	move.b looper+1,%d0
	moveq #66,%d1
	cmp.l %a0,%d1
	jne .L101
	mvz.b %d0,%d1
	mov3q.l #6,%d2
	cmp.l %d1,%d2
	jcs .L103
	move.l %d0,%d1
	addq.l #1,%d1
.L114:
	move.b %d1,%d0
	move.b %d1,looper+1
.L103:
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	mov3q.l #1,-(%sp)
	jra .L116
.L94:
	moveq #80,%d2
	cmp.l %a0,%d2
	jne .L96
	tst.l %d1
	jeq .L97
	tst.b looper+2.l
	jeq .L95
	move.b looper,%d0
	mov3q.l #1,%d1
	moveq #1,%d2
	eor.l %d1,%d0
	mvz.b looper+1,%d1
	move.b %d2,looper+3
	move.l %d1,-(%sp)
	move.b %d0,looper
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
.L116:
	mov3q.l #5,-(%sp)
	jsr report
	lea (12,%sp),%sp
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	jra paint_all
.L97:
	tst.b looper+3.l
	jeq .L95
	clr.b %d0
	move.b %d0,looper+3
.L93:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	rts
.L96:
	move.l %a0,%d2
	moveq #11,%d0
	add.l #-144,%d2
	cmp.l %d2,%d0
	jcs .L95
	mov3q.l #1,%d0
	lsl.l %d2,%d0
	tst.l %d1
	jeq .L99
	tst.b looper.l
	jeq .L100
	move.w looper+4,%d1
	mov3q.l #1,-(%sp)
	or.l %d1,%d0
	move.w %d0,looper+4
.L115:
	move.b looper+1,%d0
	muls.w #12,%d0
	lea 112(%a0,%d0.l),%a0
	move.l %a0,%d0
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	mov3q.l #6,-(%sp)
	jsr report
	lea (12,%sp),%sp
	jra .L93
.L99:
	move.w looper+4,%d2
	move.l %d0,%d3
	and.l %d2,%d3
	tst.w %d3
	jeq .L95
	not.l %d0
	and.l %d2,%d0
	clr.l -(%sp)
	move.w %d0,looper+4
	jra .L115
.L101:
	tst.b %d0
	jeq .L103
	move.l %d0,%d1
	subq.l #1,%d1
	jra .L114
.L100:
	move.l %a1,20(%sp)
	move.l 8(%sp),16(%sp)
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	jmp 1074397898
	.size	looper_key, .-looper_key
	.text
	.type	CSWTCH.9, @object
	.size	CSWTCH.9, 4
CSWTCH.9:
	.byte	63
	.byte	15
	.byte	47
	.byte	43
	.globl	mutes_kept
	.section	.lps,"aw"
	.align	2
	.type	mutes_kept, @object
	.size	mutes_kept, 4
mutes_kept:
	.zero	4
	.globl	mutes_held
	.type	mutes_held, @object
	.size	mutes_held, 1
mutes_held:
	.zero	1
	.globl	mod_call
	.type	mod_call, @object
	.size	mod_call, 1
mod_call:
	.zero	1
	.globl	slot_state
	.type	slot_state, @object
	.size	slot_state, 96
slot_state:
	.zero	96
	.globl	looper
	.align	2
	.type	looper, @object
	.size	looper, 8
looper:
	.zero	8
	.ident	"GCC: (GNU) 16.2.0"
	.else
	.ifne P_RUI
	.ifeq P_SFX
	.error "0022-looper: rui=1 needs sfx=1 (and slots=1)"
	.endif
#NO_APP
	.file	"looper.c"
	.text
#APP
	  .section .lp2,"ax"
  .globl looper_uart
looper_uart:
  movel %sp@(8),%sp@-
  movel %sp@(8),%sp@-
  jsr looper_uart_drop
  addql #8,%sp
  tstl %d0
  jeq 1f
  rts
1:
  lea %sp@(-12),%sp
  moveml %d2-%d4,%sp@
  jmp 0x400019ec
  .globl looper_router
looper_router:
  movel %sp@(8),%sp@-
  movel %sp@(8),%sp@-
  jsr looper_sysex
  addql #8,%sp
  tstl %d0
  jeq 2f
  rts
2:
  lea %sp@(-16),%sp
  moveml %d2-%d3/%a2-%a3,%sp@
  jmp 0x40083d74

	  .text
  .globl looper_pad
looper_pad:
  jsr looper_pad_skip
  tstl %d0
  jeq 1f
  moveq #1,%d0
  rts
1:
  lea %sp@(-76),%sp
  moveml %d2-%d5/%a2-%fp,%sp@
  jmp 0x400c785c

#NO_APP
	.section	.lp2,"ax",@progbits
	.align	2
	.type	send6, @function
send6:
	moveq #-76,%d0
	link.w %fp,#-8
	move.b 11(%fp),-5(%fp)
	move.b 15(%fp),-4(%fp)
	move.b 19(%fp),-3(%fp)
	move.l #1100088672,-(%sp)
	move.b 23(%fp),-2(%fp)
	move.b 27(%fp),-1(%fp)
	move.b %d0,-6(%fp)
	jsr 1073746108
	moveq #1,%d0
	pea -6(%fp)
	mov3q.l #6,-(%sp)
	move.b %d0,mod_call
	jsr 1073748452
	clr.b %d0
	move.l #1100088672,-(%sp)
	move.b %d0,mod_call
	jsr 1073746414
	lea (16,%sp),%sp
	unlk %fp
	rts
	.size	send6, .-send6
	.align	2
	.type	paint, @function
paint:
	mvz.b looper+1,%d1
	move.l %d2,-(%sp)
	move.l 8(%sp),%d0
	move.l %d0,%a0
	add.l #slot_state,%a0
	muls.w #12,%d1
	mov3q.l #3,%d2
	move.b (%a0,%d1.l),%d1
	subq.l #1,%d1
	mvz.b %d1,%d1
	cmp.l %d1,%d2
	jcs .L7
	lea (CSWTCH.9),%a0
	mvs.b (%a0,%d1.l),%d1
.L3:
	mov3q.l #3,%d2
	cmp.l %d0,%d2
	jlt .L4
	add.l #80,%d0
.L5:
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr send6
	lea (20,%sp),%sp
	move.l (%sp)+,%d2
	rts
.L7:
	clr.l %d1
	jra .L3
.L4:
	mov3q.l #7,%d2
	cmp.l %d0,%d2
	jlt .L6
	add.l #72,%d0
	jra .L5
.L6:
	add.l #64,%d0
	jra .L5
	.size	paint, .-paint
	.text
	.align	2
	.type	report, @function
report:
	link.w %fp,#-8
	move.l #-260222380,%d0
	moveq #127,%d1
	move.l %d0,-8(%fp)
	move.b 15(%fp),%d0
	move.b 11(%fp),-4(%fp)
	and.l %d1,%d0
	move.b %d0,-3(%fp)
	move.b 19(%fp),%d0
	and.l %d1,%d0
	mov3q.l #1,%d1
	move.b %d0,-2(%fp)
	moveq #-9,%d0
	move.b %d0,-1(%fp)
	cmp.l 1094562388.l,%d1
	jne .L8
	move.l 1094562704,%a0
	mov3q.l #4,%d0
.L10:
	tst.l %a0
	jeq .L8
	move.l 52(%a0),%a0
	subq.l #1,%d0
	tst.l %d0
	jne .L10
	move.l #1123449384,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jeq .L8
	mvz.w #4027,%d0
	cmp.l 1094562392.l,%d0
	jlt .L12
	pea -8(%fp)
	pea 8.w
	jsr 1073752544
	addq.l #8,%sp
.L12:
	move.l #1123449384,-(%sp)
	jsr 1073746414
	addq.l #4,%sp
.L8:
	unlk %fp
	rts
	.size	report, .-report
	.section	.lp3,"ax",@progbits
	.align	2
	.type	paint_all, @function
paint_all:
	lea (-16,%sp),%sp
	movem.l #1052,(%sp)
	clr.l %d2
	tst.b looper.l
	jeq .L31
	lea paint,%a2
.L25:
	move.l %d2,-(%sp)
	jsr (%a2)
	addq.l #1,%d2
	addq.l #4,%sp
	moveq #12,%d0
	cmp.l %d2,%d0
	jne .L25
.L23:
	movem.l (%sp),#1052
	lea (16,%sp),%sp
	rts
.L31:
	lea send6,%a2
.L24:
	mvz.w %d2,%d0
	lsl.l #2,%d0
	move.l %d0,%a0
	add.l #1123774345,%a0
	mvs.b 1(%a0),%d0
	mvs.b 3(%a0),%d4
	mvs.b 2(%a0),%d3
	mvs.b (%a0),%d1
	move.l %d0,%a1
	mov3q.l #3,%d0
	cmp.l %d2,%d0
	jlt .L27
	move.l %d2,%d0
	add.l #80,%d0
.L28:
	move.l %d4,-(%sp)
	move.l %d3,-(%sp)
	move.l %a1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a2)
	addq.l #1,%d2
	lea (20,%sp),%sp
	moveq #12,%d0
	cmp.l %d2,%d0
	jne .L24
	move.l #1100088672,-(%sp)
	moveq #18,%d2
	jsr 1073746108
	moveq #1,%d0
	addq.l #4,%sp
	move.l #1100088628,%a2
	move.b %d0,mod_call
.L30:
	mvz.b (%a2,%d2.l),%d0
	move.l %d0,-(%sp)
	move.l %d2,-(%sp)
	jsr 1074355016
	addq.l #1,%d2
	addq.l #8,%sp
	moveq #21,%d0
	cmp.l %d2,%d0
	jne .L30
	clr.b %d0
	move.l #1100088672,-(%sp)
	move.b %d0,mod_call
	jsr 1073746414
	addq.l #4,%sp
	jra .L23
.L27:
	mov3q.l #7,%d0
	cmp.l %d2,%d0
	jlt .L29
	move.l %d2,%d0
	add.l #72,%d0
	jra .L28
.L29:
	move.l %d2,%d0
	add.l #64,%d0
	jra .L28
	.size	paint_all, .-paint_all
	.align	2
	.globl	looper_uart_drop
	.type	looper_uart_drop, @function
looper_uart_drop:
	move.l %d2,-(%sp)
	move.l 12(%sp),%a0
	tst.b looper.l
	jne .L36
.L40:
	clr.l %d0
	jra .L35
.L36:
	tst.b mod_call.l
	jne .L40
	mov3q.l #1,%d0
	cmp.l 8(%sp),%d0
	jge .L40
	move.b (%a0),%d0
	mov3q.l #4,%d1
	add.l #80,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d1
	jcs .L40
	move.b 1(%a0),%d1
	mov3q.l #1,%d0
	moveq #11,%d2
	add.l #-72,%d1
	mvz.b %d1,%d1
	cmp.l %d1,%d2
	jcs .L40
.L35:
	move.l (%sp)+,%d2
	rts
	.size	looper_uart_drop, .-looper_uart_drop
	.align	2
	.globl	looper_sel
	.type	looper_sel, @function
looper_sel:
	move.l %d2,-(%sp)
	move.l 8(%sp),%d0
	move.l 12(%sp),%d1
	tst.b looper.l
	jeq .L42
	tst.b mod_call.l
	jne .L42
	move.l %d0,%a0
	mov3q.l #2,%d2
	lea (-18,%a0),%a0
	cmp.l %a0,%d2
	jcc .L41
.L42:
	move.l %d1,12(%sp)
	move.l %d0,8(%sp)
	move.l (%sp)+,%d2
	jmp 1074355016
.L41:
	move.l (%sp)+,%d2
	rts
	.size	looper_sel, .-looper_sel
	.section	.lp4,"ax",@progbits
	.align	2
	.globl	looper_sysex
	.type	looper_sysex, @function
looper_sysex:
	lea (-12,%sp),%sp
	mov3q.l #6,%d0
	move.l 20(%sp),%a1
	movem.l #1036,(%sp)
	move.l 16(%sp),%a0
	cmp.l %a1,%d0
	jlt .L45
.L47:
	clr.l %d0
.L44:
	movem.l (%sp),#1036
	lea (12,%sp),%sp
	rts
.L45:
	mvz.b (%a0),%d0
	cmp.l #240,%d0
	jne .L47
	mvz.b 1(%a0),%d0
	moveq #125,%d1
	cmp.l %d0,%d1
	jne .L47
	mvz.b 2(%a0),%d0
	moveq #82,%d2
	cmp.l %d0,%d2
	jne .L47
	mvz.b 3(%a0),%d0
	moveq #84,%d3
	cmp.l %d0,%d3
	jne .L47
	move.b 4(%a0),%d1
	moveq #29,%d2
	mvz.b %d1,%d0
	cmp.l %d0,%d2
	jcs .L48
	moveq #20,%d3
	cmp.l %d0,%d3
	jcs .L56
	moveq #14,%d2
	cmp.l %d0,%d2
	jeq .L50
	cmp.l %d0,%d3
	jeq .L50
	moveq #8,%d3
	cmp.l %d0,%d3
	jeq .L51
	moveq #9,%d2
	cmp.l %d0,%d2
	jcs .L64
	mov3q.l #7,%d1
	cmp.l %d0,%d1
	jne .L59
	cmp.l %a1,%d1
	jeq .L59
	mvz.b 5(%a0),%d0
	moveq #95,%d2
	cmp.l %d0,%d2
	jcs .L59
	lea slot_state,%a1
	lea (6,%a0),%a2
	move.b (%a2),(%a1,%d0.l)
	tst.b looper.l
	jeq .L59
	mvz.b 5(%a0),%d0
	moveq #19,%d3
	move.w %d0,%d1
	mulu.w #43691,%d1
	move.l %d1,%d2
	lsr.l %d3,%d2
	mvz.b looper+1,%d3
	cmp.l %d3,%d2
	jne .L59
	muls.w #12,%d2
	sub.l %d2,%d0
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	jsr paint
	addq.l #4,%sp
	jra .L59
.L48:
	moveq #36,%d2
	cmp.l %d0,%d2
	jcs .L53
	moveq #32,%d3
	cmp.l %d0,%d3
	jcs .L54
.L55:
	add.l #-46,%d1
	mvz.b %d1,%d1
	moveq #17,%d3
	cmp.l %d1,%d3
	jcc .L66
	jra .L59
.L53:
	moveq #82,%d2
	cmp.l %d0,%d2
	jeq .L56
	moveq #90,%d2
	cmp.l %d0,%d2
	jcs .L59
	moveq #68,%d3
	cmp.l %d0,%d3
	jcs .L63
.L64:
	moveq #40,%d2
	cmp.l %d0,%d2
	jne .L55
.L66:
	move.l #1381321040,%a2
	cmp.l 1075551836.l,%a2
	jne .L59
	move.l 1075551840,%d0
	jra .L85
.L51:
	move.b mutes_held,%d0
	tst.b 5(%a0)
	jeq .L58
	tst.b %d0
	jne .L59
	moveq #1,%d0
	move.l #-2147422824,%a0
	move.l (%a0),mutes_kept
	move.b %d0,mutes_held
	mvz.w #4095,%d0
.L60:
	moveq #24,%d2
	move.l %d0,%d1
	lsr.l %d2,%d1
	move.l %d0,-2147422824
	move.b %d1,1093765527
	move.l %d0,%d1
	clr.w %d1
	swap %d1
	move.b %d1,1093765528
	move.l %d0,%d1
	lsr.l #8,%d1
	move.b %d1,1093765529
	move.b %d0,1093765530
	jra .L59
.L58:
	tst.b %d0
	jne .L61
.L59:
	mov3q.l #1,%d0
	jra .L44
.L61:
	clr.b %d1
	move.l mutes_kept,%d0
	move.b %d1,mutes_held
	jra .L60
.L50:
	move.l #1413763670,%d3
	cmp.l 1075550836.l,%d3
	jne .L59
	move.l 1075550840,%d0
.L85:
	move.l %a1,-(%sp)
	move.l %a0,-(%sp)
	move.l %d0,%a0
	jsr (%a0)
	addq.l #8,%sp
	jra .L59
.L56:
	move.l #1247104591,%a2
	cmp.l 1073904132.l,%a2
	jne .L59
	move.l 1073904136,%d0
	jra .L85
.L54:
	moveq #35,%d1
	cmp.l %d0,%d1
	jeq .L59
.L62:
	move.l #1397119061,%a2
	cmp.l 1075551828.l,%a2
	jne .L59
	move.l 1075551832,%d0
	jra .L85
.L63:
	add.l #-69,%d1
	mvz.b %d1,%d1
	mov3q.l #1,%d2
	lsl.l %d1,%d2
	and.l #2098223,%d2
	tst.l %d2
	jne .L66
	moveq #81,%d3
	cmp.l %d0,%d3
	jne .L59
	jra .L62
	.size	looper_sysex, .-looper_sysex
	.text
	.align	2
	.globl	looper_pad_skip
	.type	looper_pad_skip, @function
looper_pad_skip:
	mvz.b looper,%d0
	rts
	.size	looper_pad_skip, .-looper_pad_skip
	.align	2
	.globl	looper_key
	.type	looper_key, @function
looper_key:
	subq.l #4,%sp
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 20(%sp),%a1
	mov3q.l #1,%d1
	move.l 16(%sp),8(%sp)
	move.l 12(%a1),%a0
	and.l 16(%a1),%d1
	cmp.l #134,%a0
	jne .L90
	move.b %d1,looper+2
.L91:
	tst.b looper.l
	jeq .L96
	move.l %a0,%d0
	add.l #-66,%d0
	lsr.l #1,%d0
	jne .L96
	tst.l %d1
	jeq .L89
	move.b looper+1,%d0
	moveq #66,%d1
	cmp.l %a0,%d1
	jne .L97
	mvz.b %d0,%d1
	mov3q.l #6,%d2
	cmp.l %d1,%d2
	jcs .L99
	move.l %d0,%d1
	addq.l #1,%d1
.L110:
	move.b %d1,%d0
	move.b %d1,looper+1
.L99:
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	mov3q.l #1,-(%sp)
	jra .L112
.L90:
	moveq #80,%d2
	cmp.l %a0,%d2
	jne .L92
	tst.l %d1
	jeq .L93
	tst.b looper+2.l
	jeq .L91
	move.b looper,%d0
	mov3q.l #1,%d1
	moveq #1,%d2
	eor.l %d1,%d0
	mvz.b looper+1,%d1
	move.b %d2,looper+3
	move.l %d1,-(%sp)
	move.b %d0,looper
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
.L112:
	mov3q.l #5,-(%sp)
	jsr report
	lea (12,%sp),%sp
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	jra paint_all
.L93:
	tst.b looper+3.l
	jeq .L91
	clr.b %d0
	move.b %d0,looper+3
.L89:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	rts
.L92:
	move.l %a0,%d2
	moveq #11,%d0
	add.l #-144,%d2
	cmp.l %d2,%d0
	jcs .L91
	mov3q.l #1,%d0
	lsl.l %d2,%d0
	tst.l %d1
	jeq .L95
	tst.b looper.l
	jeq .L96
	move.w looper+4,%d1
	mov3q.l #1,-(%sp)
	or.l %d1,%d0
	move.w %d0,looper+4
.L111:
	move.b looper+1,%d0
	muls.w #12,%d0
	lea 112(%a0,%d0.l),%a0
	move.l %a0,%d0
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	mov3q.l #6,-(%sp)
	jsr report
	lea (12,%sp),%sp
	jra .L89
.L95:
	move.w looper+4,%d2
	move.l %d0,%d3
	and.l %d2,%d3
	tst.w %d3
	jeq .L91
	not.l %d0
	and.l %d2,%d0
	clr.l -(%sp)
	move.w %d0,looper+4
	jra .L111
.L97:
	tst.b %d0
	jeq .L99
	move.l %d0,%d1
	subq.l #1,%d1
	jra .L110
.L96:
	move.l %a1,20(%sp)
	move.l 8(%sp),16(%sp)
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	jmp 1074397898
	.size	looper_key, .-looper_key
	.text
	.type	CSWTCH.9, @object
	.size	CSWTCH.9, 4
CSWTCH.9:
	.byte	63
	.byte	15
	.byte	47
	.byte	43
	.globl	mutes_kept
	.section	.lps,"aw"
	.align	2
	.type	mutes_kept, @object
	.size	mutes_kept, 4
mutes_kept:
	.zero	4
	.globl	mutes_held
	.type	mutes_held, @object
	.size	mutes_held, 1
mutes_held:
	.zero	1
	.globl	mod_call
	.type	mod_call, @object
	.size	mod_call, 1
mod_call:
	.zero	1
	.globl	slot_state
	.type	slot_state, @object
	.size	slot_state, 96
slot_state:
	.zero	96
	.globl	looper
	.align	2
	.type	looper, @object
	.size	looper, 8
looper:
	.zero	8
	.ident	"GCC: (GNU) 16.2.0"
	.else
	.ifne P_SFX
#NO_APP
	.file	"looper.c"
	.text
#APP
	  .section .lp2,"ax"
  .globl looper_uart
looper_uart:
  movel %sp@(8),%sp@-
  movel %sp@(8),%sp@-
  jsr looper_uart_drop
  addql #8,%sp
  tstl %d0
  jeq 1f
  rts
1:
  lea %sp@(-12),%sp
  moveml %d2-%d4,%sp@
  jmp 0x400019ec
  .globl looper_router
looper_router:
  movel %sp@(8),%sp@-
  movel %sp@(8),%sp@-
  jsr looper_sysex
  addql #8,%sp
  tstl %d0
  jeq 2f
  rts
2:
  lea %sp@(-16),%sp
  moveml %d2-%d3/%a2-%a3,%sp@
  jmp 0x40083d74

	  .text
  .globl looper_pad
looper_pad:
  jsr looper_pad_skip
  tstl %d0
  jeq 1f
  moveq #1,%d0
  rts
1:
  lea %sp@(-76),%sp
  moveml %d2-%d5/%a2-%fp,%sp@
  jmp 0x400c785c

#NO_APP
	.section	.lp2,"ax",@progbits
	.align	2
	.type	send6, @function
send6:
	moveq #-76,%d0
	link.w %fp,#-8
	move.b 11(%fp),-5(%fp)
	move.b 15(%fp),-4(%fp)
	move.b 19(%fp),-3(%fp)
	move.l #1100088672,-(%sp)
	move.b 23(%fp),-2(%fp)
	move.b 27(%fp),-1(%fp)
	move.b %d0,-6(%fp)
	jsr 1073746108
	moveq #1,%d0
	pea -6(%fp)
	mov3q.l #6,-(%sp)
	move.b %d0,mod_call
	jsr 1073748452
	clr.b %d0
	move.l #1100088672,-(%sp)
	move.b %d0,mod_call
	jsr 1073746414
	lea (16,%sp),%sp
	unlk %fp
	rts
	.size	send6, .-send6
	.align	2
	.type	paint, @function
paint:
	mvz.b looper+1,%d1
	move.l %d2,-(%sp)
	move.l 8(%sp),%d0
	move.l %d0,%a0
	add.l #slot_state,%a0
	muls.w #12,%d1
	mov3q.l #3,%d2
	move.b (%a0,%d1.l),%d1
	subq.l #1,%d1
	mvz.b %d1,%d1
	cmp.l %d1,%d2
	jcs .L7
	lea (CSWTCH.9),%a0
	mvs.b (%a0,%d1.l),%d1
.L3:
	mov3q.l #3,%d2
	cmp.l %d0,%d2
	jlt .L4
	add.l #80,%d0
.L5:
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr send6
	lea (20,%sp),%sp
	move.l (%sp)+,%d2
	rts
.L7:
	clr.l %d1
	jra .L3
.L4:
	mov3q.l #7,%d2
	cmp.l %d0,%d2
	jlt .L6
	add.l #72,%d0
	jra .L5
.L6:
	add.l #64,%d0
	jra .L5
	.size	paint, .-paint
	.text
	.align	2
	.type	report, @function
report:
	link.w %fp,#-8
	move.l #-260222380,%d0
	moveq #127,%d1
	move.l %d0,-8(%fp)
	move.b 15(%fp),%d0
	move.b 11(%fp),-4(%fp)
	and.l %d1,%d0
	move.b %d0,-3(%fp)
	move.b 19(%fp),%d0
	and.l %d1,%d0
	mov3q.l #1,%d1
	move.b %d0,-2(%fp)
	moveq #-9,%d0
	move.b %d0,-1(%fp)
	cmp.l 1094562388.l,%d1
	jne .L8
	move.l 1094562704,%a0
	mov3q.l #4,%d0
.L10:
	tst.l %a0
	jeq .L8
	move.l 52(%a0),%a0
	subq.l #1,%d0
	tst.l %d0
	jne .L10
	move.l #1123449384,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jeq .L8
	mvz.w #4027,%d0
	cmp.l 1094562392.l,%d0
	jlt .L12
	pea -8(%fp)
	pea 8.w
	jsr 1073752544
	addq.l #8,%sp
.L12:
	move.l #1123449384,-(%sp)
	jsr 1073746414
	addq.l #4,%sp
.L8:
	unlk %fp
	rts
	.size	report, .-report
	.section	.lp3,"ax",@progbits
	.align	2
	.type	paint_all, @function
paint_all:
	lea (-16,%sp),%sp
	movem.l #1052,(%sp)
	clr.l %d2
	tst.b looper.l
	jeq .L31
	lea paint,%a2
.L25:
	move.l %d2,-(%sp)
	jsr (%a2)
	addq.l #1,%d2
	addq.l #4,%sp
	moveq #12,%d0
	cmp.l %d2,%d0
	jne .L25
.L23:
	movem.l (%sp),#1052
	lea (16,%sp),%sp
	rts
.L31:
	lea send6,%a2
.L24:
	mvz.w %d2,%d0
	lsl.l #2,%d0
	move.l %d0,%a0
	add.l #1123774345,%a0
	mvs.b 1(%a0),%d0
	mvs.b 3(%a0),%d4
	mvs.b 2(%a0),%d3
	mvs.b (%a0),%d1
	move.l %d0,%a1
	mov3q.l #3,%d0
	cmp.l %d2,%d0
	jlt .L27
	move.l %d2,%d0
	add.l #80,%d0
.L28:
	move.l %d4,-(%sp)
	move.l %d3,-(%sp)
	move.l %a1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a2)
	addq.l #1,%d2
	lea (20,%sp),%sp
	moveq #12,%d0
	cmp.l %d2,%d0
	jne .L24
	move.l #1100088672,-(%sp)
	moveq #18,%d2
	jsr 1073746108
	moveq #1,%d0
	addq.l #4,%sp
	move.l #1100088628,%a2
	move.b %d0,mod_call
.L30:
	mvz.b (%a2,%d2.l),%d0
	move.l %d0,-(%sp)
	move.l %d2,-(%sp)
	jsr 1074355016
	addq.l #1,%d2
	addq.l #8,%sp
	moveq #21,%d0
	cmp.l %d2,%d0
	jne .L30
	clr.b %d0
	move.l #1100088672,-(%sp)
	move.b %d0,mod_call
	jsr 1073746414
	addq.l #4,%sp
	jra .L23
.L27:
	mov3q.l #7,%d0
	cmp.l %d2,%d0
	jlt .L29
	move.l %d2,%d0
	add.l #72,%d0
	jra .L28
.L29:
	move.l %d2,%d0
	add.l #64,%d0
	jra .L28
	.size	paint_all, .-paint_all
	.align	2
	.globl	looper_uart_drop
	.type	looper_uart_drop, @function
looper_uart_drop:
	move.l %d2,-(%sp)
	move.l 12(%sp),%a0
	tst.b looper.l
	jne .L36
.L40:
	clr.l %d0
	jra .L35
.L36:
	tst.b mod_call.l
	jne .L40
	mov3q.l #1,%d0
	cmp.l 8(%sp),%d0
	jge .L40
	move.b (%a0),%d0
	mov3q.l #4,%d1
	add.l #80,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d1
	jcs .L40
	move.b 1(%a0),%d1
	mov3q.l #1,%d0
	moveq #11,%d2
	add.l #-72,%d1
	mvz.b %d1,%d1
	cmp.l %d1,%d2
	jcs .L40
.L35:
	move.l (%sp)+,%d2
	rts
	.size	looper_uart_drop, .-looper_uart_drop
	.align	2
	.globl	looper_sel
	.type	looper_sel, @function
looper_sel:
	move.l %d2,-(%sp)
	move.l 8(%sp),%d0
	move.l 12(%sp),%d1
	tst.b looper.l
	jeq .L42
	tst.b mod_call.l
	jne .L42
	move.l %d0,%a0
	mov3q.l #2,%d2
	lea (-18,%a0),%a0
	cmp.l %a0,%d2
	jcc .L41
.L42:
	move.l %d1,12(%sp)
	move.l %d0,8(%sp)
	move.l (%sp)+,%d2
	jmp 1074355016
.L41:
	move.l (%sp)+,%d2
	rts
	.size	looper_sel, .-looper_sel
	.section	.lp4,"ax",@progbits
	.align	2
	.globl	looper_sysex
	.type	looper_sysex, @function
looper_sysex:
	lea (-12,%sp),%sp
	mov3q.l #6,%d0
	move.l 20(%sp),%d1
	movem.l #1036,(%sp)
	move.l 16(%sp),%a0
	cmp.l %d1,%d0
	jlt .L45
.L47:
	clr.l %d0
.L44:
	movem.l (%sp),#1036
	lea (12,%sp),%sp
	rts
.L45:
	mvz.b (%a0),%d0
	cmp.l #240,%d0
	jne .L47
	mvz.b 1(%a0),%d0
	moveq #125,%d2
	cmp.l %d0,%d2
	jne .L47
	mvz.b 2(%a0),%d0
	moveq #82,%d3
	cmp.l %d0,%d3
	jne .L47
	mvz.b 3(%a0),%d0
	moveq #84,%d2
	cmp.l %d0,%d2
	jne .L47
	mvz.b 4(%a0),%d0
	moveq #29,%d3
	cmp.l %d0,%d3
	jcs .L48
	moveq #20,%d2
	cmp.l %d0,%d2
	jcs .L49
	moveq #14,%d3
	cmp.l %d0,%d3
	jeq .L50
	cmp.l %d0,%d2
	jeq .L50
	moveq #8,%d2
	cmp.l %d0,%d2
	jeq .L51
	mov3q.l #7,%d2
	cmp.l %d0,%d2
	jne .L55
	cmp.l %d1,%d2
	jeq .L55
	mvz.b 5(%a0),%d0
	moveq #95,%d3
	cmp.l %d0,%d3
	jcs .L55
	lea slot_state,%a1
	lea (6,%a0),%a2
	move.b (%a2),(%a1,%d0.l)
	tst.b looper.l
	jeq .L55
	mvz.b 5(%a0),%d0
	moveq #19,%d3
	move.w %d0,%d1
	mulu.w #43691,%d1
	move.l %d1,%d2
	lsr.l %d3,%d2
	move.l %d2,%a0
	mvz.b looper+1,%d2
	cmp.l %d2,%a0
	jne .L55
	move.w %a0,%d1
	muls.w #12,%d1
	sub.l %d1,%d0
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	jsr paint
	addq.l #4,%sp
	jra .L55
.L48:
	moveq #36,%d3
	cmp.l %d0,%d3
	jcs .L53
	moveq #32,%d2
	cmp.l %d0,%d2
	jcs .L54
.L55:
	mov3q.l #1,%d0
	jra .L44
.L53:
	moveq #82,%d3
	cmp.l %d0,%d3
	jeq .L56
	moveq #81,%d3
	cmp.l %d0,%d3
	jeq .L61
	jra .L55
.L51:
	move.b mutes_held,%d0
	tst.b 5(%a0)
	jeq .L58
	tst.b %d0
	jne .L55
	moveq #1,%d0
	move.l #-2147422824,%a0
	move.l (%a0),mutes_kept
	move.b %d0,mutes_held
	mvz.w #4095,%d0
.L59:
	moveq #24,%d2
	move.l %d0,%d1
	lsr.l %d2,%d1
	move.l %d0,-2147422824
	move.b %d1,1093765527
	move.l %d0,%d1
	clr.w %d1
	swap %d1
	move.b %d1,1093765528
	move.l %d0,%d1
	lsr.l #8,%d1
	move.b %d1,1093765529
	move.b %d0,1093765530
	jra .L55
.L58:
	tst.b %d0
	jeq .L55
	clr.b %d1
	move.l mutes_kept,%d0
	move.b %d1,mutes_held
	jra .L59
.L50:
	move.l #1413763670,%d3
	cmp.l 1075550836.l,%d3
	jne .L55
	move.l 1075550840,%a1
.L79:
	move.l %d1,-(%sp)
	move.l %a0,-(%sp)
	jsr (%a1)
	addq.l #8,%sp
	jra .L55
.L49:
	move.l #1247104591,%a2
	cmp.l 1073904132.l,%a2
	jne .L55
.L80:
	move.l 1073904136,%a1
	jra .L79
.L56:
	move.l #1247104591,%d0
	cmp.l 1073904132.l,%d0
	jne .L55
	jra .L80
.L54:
	moveq #35,%d2
	cmp.l %d0,%d2
	jeq .L55
.L61:
	move.l #1397119061,%d3
	cmp.l 1075551828.l,%d3
	jne .L55
	move.l 1075551832,%a1
	jra .L79
	.size	looper_sysex, .-looper_sysex
	.text
	.align	2
	.globl	looper_pad_skip
	.type	looper_pad_skip, @function
looper_pad_skip:
	mvz.b looper,%d0
	rts
	.size	looper_pad_skip, .-looper_pad_skip
	.align	2
	.globl	looper_key
	.type	looper_key, @function
looper_key:
	subq.l #4,%sp
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 20(%sp),%a1
	mov3q.l #1,%d1
	move.l 16(%sp),8(%sp)
	move.l 12(%a1),%a0
	and.l 16(%a1),%d1
	cmp.l #134,%a0
	jne .L83
	move.b %d1,looper+2
.L84:
	tst.b looper.l
	jeq .L89
	move.l %a0,%d0
	add.l #-66,%d0
	lsr.l #1,%d0
	jne .L89
	tst.l %d1
	jeq .L82
	move.b looper+1,%d0
	moveq #66,%d1
	cmp.l %a0,%d1
	jne .L90
	mvz.b %d0,%d1
	mov3q.l #6,%d2
	cmp.l %d1,%d2
	jcs .L92
	move.l %d0,%d1
	addq.l #1,%d1
.L103:
	move.b %d1,%d0
	move.b %d1,looper+1
.L92:
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	mov3q.l #1,-(%sp)
	jra .L105
.L83:
	moveq #80,%d2
	cmp.l %a0,%d2
	jne .L85
	tst.l %d1
	jeq .L86
	tst.b looper+2.l
	jeq .L84
	move.b looper,%d0
	mov3q.l #1,%d1
	moveq #1,%d2
	eor.l %d1,%d0
	mvz.b looper+1,%d1
	move.b %d2,looper+3
	move.l %d1,-(%sp)
	move.b %d0,looper
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
.L105:
	mov3q.l #5,-(%sp)
	jsr report
	lea (12,%sp),%sp
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	jra paint_all
.L86:
	tst.b looper+3.l
	jeq .L84
	clr.b %d0
	move.b %d0,looper+3
.L82:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	rts
.L85:
	move.l %a0,%d2
	moveq #11,%d0
	add.l #-144,%d2
	cmp.l %d2,%d0
	jcs .L84
	mov3q.l #1,%d0
	lsl.l %d2,%d0
	tst.l %d1
	jeq .L88
	tst.b looper.l
	jeq .L89
	move.w looper+4,%d1
	mov3q.l #1,-(%sp)
	or.l %d1,%d0
	move.w %d0,looper+4
.L104:
	move.b looper+1,%d0
	muls.w #12,%d0
	lea 112(%a0,%d0.l),%a0
	move.l %a0,%d0
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	mov3q.l #6,-(%sp)
	jsr report
	lea (12,%sp),%sp
	jra .L82
.L88:
	move.w looper+4,%d2
	move.l %d0,%d3
	and.l %d2,%d3
	tst.w %d3
	jeq .L84
	not.l %d0
	and.l %d2,%d0
	clr.l -(%sp)
	move.w %d0,looper+4
	jra .L104
.L90:
	tst.b %d0
	jeq .L92
	move.l %d0,%d1
	subq.l #1,%d1
	jra .L103
.L89:
	move.l %a1,20(%sp)
	move.l 8(%sp),16(%sp)
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	jmp 1074397898
	.size	looper_key, .-looper_key
	.text
	.type	CSWTCH.9, @object
	.size	CSWTCH.9, 4
CSWTCH.9:
	.byte	63
	.byte	15
	.byte	47
	.byte	43
	.globl	mutes_kept
	.section	.lps,"aw"
	.align	2
	.type	mutes_kept, @object
	.size	mutes_kept, 4
mutes_kept:
	.zero	4
	.globl	mutes_held
	.type	mutes_held, @object
	.size	mutes_held, 1
mutes_held:
	.zero	1
	.globl	mod_call
	.type	mod_call, @object
	.size	mod_call, 1
mod_call:
	.zero	1
	.globl	slot_state
	.type	slot_state, @object
	.size	slot_state, 96
slot_state:
	.zero	96
	.globl	looper
	.align	2
	.type	looper, @object
	.size	looper, 8
looper:
	.zero	8
	.ident	"GCC: (GNU) 16.2.0"
	.else
	.ifne P_SLOTS
#NO_APP
	.file	"looper.c"
	.text
#APP
	  .section .lp2,"ax"
  .globl looper_uart
looper_uart:
  movel %sp@(8),%sp@-
  movel %sp@(8),%sp@-
  jsr looper_uart_drop
  addql #8,%sp
  tstl %d0
  jeq 1f
  rts
1:
  lea %sp@(-12),%sp
  moveml %d2-%d4,%sp@
  jmp 0x400019ec
  .globl looper_router
looper_router:
  movel %sp@(8),%sp@-
  movel %sp@(8),%sp@-
  jsr looper_sysex
  addql #8,%sp
  tstl %d0
  jeq 2f
  rts
2:
  lea %sp@(-16),%sp
  moveml %d2-%d3/%a2-%a3,%sp@
  jmp 0x40083d74

	  .text
  .globl looper_pad
looper_pad:
  jsr looper_pad_skip
  tstl %d0
  jeq 1f
  moveq #1,%d0
  rts
1:
  lea %sp@(-76),%sp
  moveml %d2-%d5/%a2-%fp,%sp@
  jmp 0x400c785c

#NO_APP
	.section	.lp2,"ax",@progbits
	.align	2
	.type	send6, @function
send6:
	moveq #-76,%d0
	link.w %fp,#-8
	move.b 11(%fp),-5(%fp)
	move.b 15(%fp),-4(%fp)
	move.b 19(%fp),-3(%fp)
	move.l #1100088672,-(%sp)
	move.b 23(%fp),-2(%fp)
	move.b 27(%fp),-1(%fp)
	move.b %d0,-6(%fp)
	jsr 1073746108
	moveq #1,%d0
	pea -6(%fp)
	mov3q.l #6,-(%sp)
	move.b %d0,mod_call
	jsr 1073748452
	clr.b %d0
	move.l #1100088672,-(%sp)
	move.b %d0,mod_call
	jsr 1073746414
	lea (16,%sp),%sp
	unlk %fp
	rts
	.size	send6, .-send6
	.align	2
	.type	paint, @function
paint:
	mvz.b looper+1,%d1
	move.l %d2,-(%sp)
	move.l 8(%sp),%d0
	move.l %d0,%a0
	add.l #slot_state,%a0
	muls.w #12,%d1
	mov3q.l #3,%d2
	move.b (%a0,%d1.l),%d1
	subq.l #1,%d1
	mvz.b %d1,%d1
	cmp.l %d1,%d2
	jcs .L7
	lea (CSWTCH.9),%a0
	mvs.b (%a0,%d1.l),%d1
.L3:
	mov3q.l #3,%d2
	cmp.l %d0,%d2
	jlt .L4
	add.l #80,%d0
.L5:
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr send6
	lea (20,%sp),%sp
	move.l (%sp)+,%d2
	rts
.L7:
	clr.l %d1
	jra .L3
.L4:
	mov3q.l #7,%d2
	cmp.l %d0,%d2
	jlt .L6
	add.l #72,%d0
	jra .L5
.L6:
	add.l #64,%d0
	jra .L5
	.size	paint, .-paint
	.text
	.align	2
	.type	report, @function
report:
	link.w %fp,#-8
	move.l #-260222380,%d0
	moveq #127,%d1
	move.l %d0,-8(%fp)
	move.b 15(%fp),%d0
	move.b 11(%fp),-4(%fp)
	and.l %d1,%d0
	move.b %d0,-3(%fp)
	move.b 19(%fp),%d0
	and.l %d1,%d0
	move.b %d0,-2(%fp)
	moveq #-9,%d0
	move.b %d0,-1(%fp)
	mov3q.l #4,%d0
	move.l 1094562704,%a0
.L10:
	tst.l %a0
	jeq .L8
	move.l 52(%a0),%a0
	subq.l #1,%d0
	tst.l %d0
	jne .L10
	jsr 1073752340
	pea -8(%fp)
	pea 8.w
	jsr 1073752544
	jsr 1073752356
	addq.l #8,%sp
.L8:
	unlk %fp
	rts
	.size	report, .-report
	.section	.lp3,"ax",@progbits
	.align	2
	.type	paint_all, @function
paint_all:
	lea (-16,%sp),%sp
	movem.l #1052,(%sp)
	clr.l %d2
	tst.b looper.l
	jeq .L24
	lea paint,%a2
.L18:
	move.l %d2,-(%sp)
	jsr (%a2)
	addq.l #1,%d2
	addq.l #4,%sp
	moveq #12,%d0
	cmp.l %d2,%d0
	jne .L18
.L16:
	movem.l (%sp),#1052
	lea (16,%sp),%sp
	rts
.L24:
	lea send6,%a2
.L17:
	mvz.w %d2,%d0
	lsl.l #2,%d0
	move.l %d0,%a0
	add.l #1123774345,%a0
	mvs.b 1(%a0),%d0
	mvs.b 3(%a0),%d4
	mvs.b 2(%a0),%d3
	mvs.b (%a0),%d1
	move.l %d0,%a1
	mov3q.l #3,%d0
	cmp.l %d2,%d0
	jlt .L20
	move.l %d2,%d0
	add.l #80,%d0
.L21:
	move.l %d4,-(%sp)
	move.l %d3,-(%sp)
	move.l %a1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a2)
	addq.l #1,%d2
	lea (20,%sp),%sp
	moveq #12,%d0
	cmp.l %d2,%d0
	jne .L17
	move.l #1100088672,-(%sp)
	moveq #18,%d2
	jsr 1073746108
	moveq #1,%d0
	addq.l #4,%sp
	move.l #1100088628,%a2
	move.b %d0,mod_call
.L23:
	mvz.b (%a2,%d2.l),%d0
	move.l %d0,-(%sp)
	move.l %d2,-(%sp)
	jsr 1074355016
	addq.l #1,%d2
	addq.l #8,%sp
	moveq #21,%d0
	cmp.l %d2,%d0
	jne .L23
	clr.b %d0
	move.l #1100088672,-(%sp)
	move.b %d0,mod_call
	jsr 1073746414
	addq.l #4,%sp
	jra .L16
.L20:
	mov3q.l #7,%d0
	cmp.l %d2,%d0
	jlt .L22
	move.l %d2,%d0
	add.l #72,%d0
	jra .L21
.L22:
	move.l %d2,%d0
	add.l #64,%d0
	jra .L21
	.size	paint_all, .-paint_all
	.align	2
	.globl	looper_uart_drop
	.type	looper_uart_drop, @function
looper_uart_drop:
	move.l %d2,-(%sp)
	move.l 12(%sp),%a0
	tst.b looper.l
	jne .L29
.L33:
	clr.l %d0
	jra .L28
.L29:
	tst.b mod_call.l
	jne .L33
	mov3q.l #1,%d0
	cmp.l 8(%sp),%d0
	jge .L33
	move.b (%a0),%d0
	mov3q.l #4,%d1
	add.l #80,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d1
	jcs .L33
	move.b 1(%a0),%d1
	mov3q.l #1,%d0
	moveq #11,%d2
	add.l #-72,%d1
	mvz.b %d1,%d1
	cmp.l %d1,%d2
	jcs .L33
.L28:
	move.l (%sp)+,%d2
	rts
	.size	looper_uart_drop, .-looper_uart_drop
	.align	2
	.globl	looper_sel
	.type	looper_sel, @function
looper_sel:
	move.l %d2,-(%sp)
	move.l 8(%sp),%d0
	move.l 12(%sp),%d1
	tst.b looper.l
	jeq .L35
	tst.b mod_call.l
	jne .L35
	move.l %d0,%a0
	mov3q.l #2,%d2
	lea (-18,%a0),%a0
	cmp.l %a0,%d2
	jcc .L34
.L35:
	move.l %d1,12(%sp)
	move.l %d0,8(%sp)
	move.l (%sp)+,%d2
	jmp 1074355016
.L34:
	move.l (%sp)+,%d2
	rts
	.size	looper_sel, .-looper_sel
	.section	.lp4,"ax",@progbits
	.align	2
	.globl	looper_sysex
	.type	looper_sysex, @function
looper_sysex:
	lea (-12,%sp),%sp
	mov3q.l #6,%d0
	move.l 20(%sp),%d1
	movem.l #1036,(%sp)
	move.l 16(%sp),%a0
	cmp.l %d1,%d0
	jlt .L38
.L40:
	clr.l %d0
.L37:
	movem.l (%sp),#1036
	lea (12,%sp),%sp
	rts
.L38:
	mvz.b (%a0),%d0
	cmp.l #240,%d0
	jne .L40
	mvz.b 1(%a0),%d0
	moveq #125,%d2
	cmp.l %d0,%d2
	jne .L40
	mvz.b 2(%a0),%d0
	moveq #82,%d3
	cmp.l %d0,%d3
	jne .L40
	mvz.b 3(%a0),%d0
	moveq #84,%d2
	cmp.l %d0,%d2
	jne .L40
	move.b 4(%a0),%d0
	moveq #8,%d2
	mvz.b %d0,%d3
	move.l %d3,%a1
	cmp.l %d3,%d2
	jne .L41
	move.b mutes_held,%d0
	tst.b 5(%a0)
	jeq .L42
	tst.b %d0
	jne .L43
	moveq #1,%d0
	move.l #-2147422824,%a0
	move.l (%a0),mutes_kept
	move.b %d0,mutes_held
	mvz.w #4095,%d0
.L44:
	moveq #24,%d2
	move.l %d0,%d1
	lsr.l %d2,%d1
	move.l %d0,-2147422824
	move.b %d1,1093765527
	move.l %d0,%d1
	clr.w %d1
	swap %d1
	move.b %d1,1093765528
	move.l %d0,%d1
	lsr.l #8,%d1
	move.b %d1,1093765529
	move.b %d0,1093765530
	jra .L43
.L42:
	tst.b %d0
	jne .L45
.L43:
	mov3q.l #1,%d0
	jra .L37
.L45:
	clr.b %d1
	move.l mutes_kept,%d0
	move.b %d1,mutes_held
	jra .L44
.L41:
	moveq #14,%d3
	cmp.l %a1,%d3
	jeq .L46
	moveq #20,%d2
	cmp.l %a1,%d2
	jne .L47
.L46:
	move.l #1413763670,%d3
	cmp.l 1075550836.l,%d3
	jne .L43
	move.l 1075550840,%a1
.L55:
	move.l %d1,-(%sp)
	move.l %a0,-(%sp)
	jsr (%a1)
	addq.l #8,%sp
	jra .L43
.L47:
	add.l #-21,%d0
	mvz.b %d0,%d0
	moveq #8,%d2
	cmp.l %d0,%d2
	jcs .L48
	move.l #1247104591,%d3
	cmp.l 1073904132.l,%d3
	jne .L43
	move.l 1073904136,%a1
	jra .L55
.L48:
	mov3q.l #7,%d0
	cmp.l %a1,%d0
	jne .L43
	cmp.l %d1,%d0
	jeq .L43
	mvz.b 5(%a0),%d0
	moveq #95,%d1
	cmp.l %d0,%d1
	jcs .L43
	lea slot_state,%a1
	lea (6,%a0),%a2
	move.b (%a2),(%a1,%d0.l)
	tst.b looper.l
	jeq .L43
	mvz.b 5(%a0),%d0
	moveq #19,%d3
	move.w %d0,%d1
	mulu.w #43691,%d1
	move.l %d1,%d2
	lsr.l %d3,%d2
	move.l %d2,%a0
	mvz.b looper+1,%d2
	cmp.l %d2,%a0
	jne .L43
	move.w %a0,%d1
	muls.w #12,%d1
	sub.l %d1,%d0
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	jsr paint
	addq.l #4,%sp
	jra .L43
	.size	looper_sysex, .-looper_sysex
	.text
	.align	2
	.globl	looper_pad_skip
	.type	looper_pad_skip, @function
looper_pad_skip:
	mvz.b looper,%d0
	rts
	.size	looper_pad_skip, .-looper_pad_skip
	.align	2
	.globl	looper_key
	.type	looper_key, @function
looper_key:
	subq.l #4,%sp
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 20(%sp),%a1
	mov3q.l #1,%d1
	move.l 16(%sp),8(%sp)
	move.l 12(%a1),%a0
	and.l 16(%a1),%d1
	cmp.l #134,%a0
	jne .L58
	move.b %d1,looper+2
.L59:
	tst.b looper.l
	jeq .L64
	move.l %a0,%d0
	add.l #-66,%d0
	lsr.l #1,%d0
	jne .L64
	tst.l %d1
	jeq .L57
	move.b looper+1,%d0
	moveq #66,%d1
	cmp.l %a0,%d1
	jne .L65
	mvz.b %d0,%d1
	mov3q.l #6,%d2
	cmp.l %d1,%d2
	jcs .L67
	move.l %d0,%d1
	addq.l #1,%d1
.L78:
	move.b %d1,%d0
	move.b %d1,looper+1
.L67:
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	mov3q.l #1,-(%sp)
	jra .L80
.L58:
	moveq #80,%d2
	cmp.l %a0,%d2
	jne .L60
	tst.l %d1
	jeq .L61
	tst.b looper+2.l
	jeq .L59
	move.b looper,%d0
	mov3q.l #1,%d1
	moveq #1,%d2
	eor.l %d1,%d0
	mvz.b looper+1,%d1
	move.b %d2,looper+3
	move.l %d1,-(%sp)
	move.b %d0,looper
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
.L80:
	mov3q.l #5,-(%sp)
	jsr report
	lea (12,%sp),%sp
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	jra paint_all
.L61:
	tst.b looper+3.l
	jeq .L59
	clr.b %d0
	move.b %d0,looper+3
.L57:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	rts
.L60:
	move.l %a0,%d2
	moveq #11,%d0
	add.l #-144,%d2
	cmp.l %d2,%d0
	jcs .L59
	mov3q.l #1,%d0
	lsl.l %d2,%d0
	tst.l %d1
	jeq .L63
	tst.b looper.l
	jeq .L64
	move.w looper+4,%d1
	mov3q.l #1,-(%sp)
	or.l %d1,%d0
	move.w %d0,looper+4
.L79:
	move.b looper+1,%d0
	muls.w #12,%d0
	lea 112(%a0,%d0.l),%a0
	move.l %a0,%d0
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	mov3q.l #6,-(%sp)
	jsr report
	lea (12,%sp),%sp
	jra .L57
.L63:
	move.w looper+4,%d2
	move.l %d0,%d3
	and.l %d2,%d3
	tst.w %d3
	jeq .L59
	not.l %d0
	and.l %d2,%d0
	clr.l -(%sp)
	move.w %d0,looper+4
	jra .L79
.L65:
	tst.b %d0
	jeq .L67
	move.l %d0,%d1
	subq.l #1,%d1
	jra .L78
.L64:
	move.l %a1,20(%sp)
	move.l 8(%sp),16(%sp)
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	jmp 1074397898
	.size	looper_key, .-looper_key
	.text
	.type	CSWTCH.9, @object
	.size	CSWTCH.9, 4
CSWTCH.9:
	.byte	63
	.byte	15
	.byte	47
	.byte	43
	.globl	mutes_kept
	.section	.lps,"aw"
	.align	2
	.type	mutes_kept, @object
	.size	mutes_kept, 4
mutes_kept:
	.zero	4
	.globl	mutes_held
	.type	mutes_held, @object
	.size	mutes_held, 1
mutes_held:
	.zero	1
	.globl	mod_call
	.type	mod_call, @object
	.size	mod_call, 1
mod_call:
	.zero	1
	.globl	slot_state
	.type	slot_state, @object
	.size	slot_state, 96
slot_state:
	.zero	96
	.globl	looper
	.align	2
	.type	looper, @object
	.size	looper, 8
looper:
	.zero	8
	.ident	"GCC: (GNU) 16.2.0"
	.else
#NO_APP
	.file	"looper.c"
	.text
#APP
	  .section .lp2,"ax"
  .globl looper_uart
looper_uart:
  movel %sp@(8),%sp@-
  movel %sp@(8),%sp@-
  jsr looper_uart_drop
  addql #8,%sp
  tstl %d0
  jeq 1f
  rts
1:
  lea %sp@(-12),%sp
  moveml %d2-%d4,%sp@
  jmp 0x400019ec
  .globl looper_router
looper_router:
  movel %sp@(8),%sp@-
  movel %sp@(8),%sp@-
  jsr looper_sysex
  addql #8,%sp
  tstl %d0
  jeq 2f
  rts
2:
  lea %sp@(-16),%sp
  moveml %d2-%d3/%a2-%a3,%sp@
  jmp 0x40083d74

	  .text
  .globl looper_pad
looper_pad:
  jsr looper_pad_skip
  tstl %d0
  jeq 1f
  moveq #1,%d0
  rts
1:
  lea %sp@(-76),%sp
  moveml %d2-%d5/%a2-%fp,%sp@
  jmp 0x400c785c

#NO_APP
	.section	.lp2,"ax",@progbits
	.align	2
	.type	send6, @function
send6:
	moveq #-76,%d0
	link.w %fp,#-8
	move.b 11(%fp),-5(%fp)
	move.b 15(%fp),-4(%fp)
	move.b 19(%fp),-3(%fp)
	move.l #1100088672,-(%sp)
	move.b 23(%fp),-2(%fp)
	move.b 27(%fp),-1(%fp)
	move.b %d0,-6(%fp)
	jsr 1073746108
	moveq #1,%d0
	pea -6(%fp)
	mov3q.l #6,-(%sp)
	move.b %d0,mod_call
	jsr 1073748452
	clr.b %d0
	move.l #1100088672,-(%sp)
	move.b %d0,mod_call
	jsr 1073746414
	lea (16,%sp),%sp
	unlk %fp
	rts
	.size	send6, .-send6
	.align	2
	.type	paint, @function
paint:
	mvz.b looper+1,%d1
	move.l %d2,-(%sp)
	move.l 8(%sp),%d0
	move.l %d0,%a0
	add.l #slot_state,%a0
	muls.w #12,%d1
	mov3q.l #3,%d2
	move.b (%a0,%d1.l),%d1
	subq.l #1,%d1
	mvz.b %d1,%d1
	cmp.l %d1,%d2
	jcs .L7
	lea (CSWTCH.9),%a0
	mvs.b (%a0,%d1.l),%d1
.L3:
	mov3q.l #3,%d2
	cmp.l %d0,%d2
	jlt .L4
	add.l #80,%d0
.L5:
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr send6
	lea (20,%sp),%sp
	move.l (%sp)+,%d2
	rts
.L7:
	clr.l %d1
	jra .L3
.L4:
	mov3q.l #7,%d2
	cmp.l %d0,%d2
	jlt .L6
	add.l #72,%d0
	jra .L5
.L6:
	add.l #64,%d0
	jra .L5
	.size	paint, .-paint
	.text
	.align	2
	.type	report, @function
report:
	link.w %fp,#-8
	move.l #-260222380,%d0
	moveq #127,%d1
	move.l %d0,-8(%fp)
	move.b 15(%fp),%d0
	move.b 11(%fp),-4(%fp)
	and.l %d1,%d0
	move.b %d0,-3(%fp)
	move.b 19(%fp),%d0
	and.l %d1,%d0
	move.b %d0,-2(%fp)
	moveq #-9,%d0
	move.b %d0,-1(%fp)
	mov3q.l #4,%d0
	move.l 1094562704,%a0
.L10:
	tst.l %a0
	jeq .L8
	move.l 52(%a0),%a0
	subq.l #1,%d0
	tst.l %d0
	jne .L10
	jsr 1073752340
	pea -8(%fp)
	pea 8.w
	jsr 1073752544
	jsr 1073752356
	addq.l #8,%sp
.L8:
	unlk %fp
	rts
	.size	report, .-report
	.section	.lp3,"ax",@progbits
	.align	2
	.type	paint_all, @function
paint_all:
	lea (-16,%sp),%sp
	movem.l #1052,(%sp)
	clr.l %d2
	tst.b looper.l
	jeq .L24
	lea paint,%a2
.L18:
	move.l %d2,-(%sp)
	jsr (%a2)
	addq.l #1,%d2
	addq.l #4,%sp
	moveq #12,%d0
	cmp.l %d2,%d0
	jne .L18
.L16:
	movem.l (%sp),#1052
	lea (16,%sp),%sp
	rts
.L24:
	lea send6,%a2
.L17:
	mvz.w %d2,%d0
	lsl.l #2,%d0
	move.l %d0,%a0
	add.l #1123774345,%a0
	mvs.b 1(%a0),%d0
	mvs.b 3(%a0),%d4
	mvs.b 2(%a0),%d3
	mvs.b (%a0),%d1
	move.l %d0,%a1
	mov3q.l #3,%d0
	cmp.l %d2,%d0
	jlt .L20
	move.l %d2,%d0
	add.l #80,%d0
.L21:
	move.l %d4,-(%sp)
	move.l %d3,-(%sp)
	move.l %a1,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a2)
	addq.l #1,%d2
	lea (20,%sp),%sp
	moveq #12,%d0
	cmp.l %d2,%d0
	jne .L17
	move.l #1100088672,-(%sp)
	moveq #18,%d2
	jsr 1073746108
	moveq #1,%d0
	addq.l #4,%sp
	move.l #1100088628,%a2
	move.b %d0,mod_call
.L23:
	mvz.b (%a2,%d2.l),%d0
	move.l %d0,-(%sp)
	move.l %d2,-(%sp)
	jsr 1074355016
	addq.l #1,%d2
	addq.l #8,%sp
	moveq #21,%d0
	cmp.l %d2,%d0
	jne .L23
	clr.b %d0
	move.l #1100088672,-(%sp)
	move.b %d0,mod_call
	jsr 1073746414
	addq.l #4,%sp
	jra .L16
.L20:
	mov3q.l #7,%d0
	cmp.l %d2,%d0
	jlt .L22
	move.l %d2,%d0
	add.l #72,%d0
	jra .L21
.L22:
	move.l %d2,%d0
	add.l #64,%d0
	jra .L21
	.size	paint_all, .-paint_all
	.align	2
	.globl	looper_uart_drop
	.type	looper_uart_drop, @function
looper_uart_drop:
	move.l %d2,-(%sp)
	move.l 12(%sp),%a0
	tst.b looper.l
	jne .L29
.L33:
	clr.l %d0
	jra .L28
.L29:
	tst.b mod_call.l
	jne .L33
	mov3q.l #1,%d0
	cmp.l 8(%sp),%d0
	jge .L33
	move.b (%a0),%d0
	mov3q.l #4,%d1
	add.l #80,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d1
	jcs .L33
	move.b 1(%a0),%d1
	mov3q.l #1,%d0
	moveq #11,%d2
	add.l #-72,%d1
	mvz.b %d1,%d1
	cmp.l %d1,%d2
	jcs .L33
.L28:
	move.l (%sp)+,%d2
	rts
	.size	looper_uart_drop, .-looper_uart_drop
	.align	2
	.globl	looper_sel
	.type	looper_sel, @function
looper_sel:
	move.l %d2,-(%sp)
	move.l 8(%sp),%d0
	move.l 12(%sp),%d1
	tst.b looper.l
	jeq .L35
	tst.b mod_call.l
	jne .L35
	move.l %d0,%a0
	mov3q.l #2,%d2
	lea (-18,%a0),%a0
	cmp.l %a0,%d2
	jcc .L34
.L35:
	move.l %d1,12(%sp)
	move.l %d0,8(%sp)
	move.l (%sp)+,%d2
	jmp 1074355016
.L34:
	move.l (%sp)+,%d2
	rts
	.size	looper_sel, .-looper_sel
	.section	.lp4,"ax",@progbits
	.align	2
	.globl	looper_sysex
	.type	looper_sysex, @function
looper_sysex:
	lea (-12,%sp),%sp
	mov3q.l #6,%d0
	move.l 20(%sp),%d1
	movem.l #1036,(%sp)
	move.l 16(%sp),%a0
	cmp.l %d1,%d0
	jlt .L38
.L40:
	clr.l %d0
.L37:
	movem.l (%sp),#1036
	lea (12,%sp),%sp
	rts
.L38:
	mvz.b (%a0),%d0
	cmp.l #240,%d0
	jne .L40
	mvz.b 1(%a0),%d0
	moveq #125,%d2
	cmp.l %d0,%d2
	jne .L40
	mvz.b 2(%a0),%d0
	moveq #82,%d3
	cmp.l %d0,%d3
	jne .L40
	mvz.b 3(%a0),%d0
	moveq #84,%d2
	cmp.l %d0,%d2
	jne .L40
	move.b 4(%a0),%d0
	moveq #8,%d2
	mvz.b %d0,%d3
	move.l %d3,%a1
	cmp.l %d3,%d2
	jne .L41
	move.b mutes_held,%d0
	tst.b 5(%a0)
	jeq .L42
	tst.b %d0
	jne .L43
	moveq #1,%d0
	move.l #-2147422824,%a0
	move.l (%a0),mutes_kept
	move.b %d0,mutes_held
	mvz.w #4095,%d0
.L44:
	moveq #24,%d2
	move.l %d0,%d1
	lsr.l %d2,%d1
	move.l %d0,-2147422824
	move.b %d1,1093765527
	move.l %d0,%d1
	clr.w %d1
	swap %d1
	move.b %d1,1093765528
	move.l %d0,%d1
	lsr.l #8,%d1
	move.b %d1,1093765529
	move.b %d0,1093765530
	jra .L43
.L42:
	tst.b %d0
	jne .L45
.L43:
	mov3q.l #1,%d0
	jra .L37
.L45:
	clr.b %d1
	move.l mutes_kept,%d0
	move.b %d1,mutes_held
	jra .L44
.L41:
	moveq #14,%d3
	cmp.l %a1,%d3
	jeq .L46
	moveq #20,%d2
	cmp.l %a1,%d2
	jne .L47
.L46:
	move.l #1413763670,%d3
	cmp.l 1075550836.l,%d3
	jne .L43
	move.l 1075550840,%a1
.L55:
	move.l %d1,-(%sp)
	move.l %a0,-(%sp)
	jsr (%a1)
	addq.l #8,%sp
	jra .L43
.L47:
	add.l #-21,%d0
	mvz.b %d0,%d0
	mov3q.l #2,%d2
	cmp.l %d0,%d2
	jcs .L48
	move.l #1247104591,%d3
	cmp.l 1073904132.l,%d3
	jne .L43
	move.l 1073904136,%a1
	jra .L55
.L48:
	mov3q.l #7,%d0
	cmp.l %a1,%d0
	jne .L43
	cmp.l %d1,%d0
	jeq .L43
	mvz.b 5(%a0),%d0
	moveq #95,%d1
	cmp.l %d0,%d1
	jcs .L43
	lea slot_state,%a1
	lea (6,%a0),%a2
	move.b (%a2),(%a1,%d0.l)
	tst.b looper.l
	jeq .L43
	mvz.b 5(%a0),%d0
	moveq #19,%d3
	move.w %d0,%d1
	mulu.w #43691,%d1
	move.l %d1,%d2
	lsr.l %d3,%d2
	move.l %d2,%a0
	mvz.b looper+1,%d2
	cmp.l %d2,%a0
	jne .L43
	move.w %a0,%d1
	muls.w #12,%d1
	sub.l %d1,%d0
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	jsr paint
	addq.l #4,%sp
	jra .L43
	.size	looper_sysex, .-looper_sysex
	.text
	.align	2
	.globl	looper_pad_skip
	.type	looper_pad_skip, @function
looper_pad_skip:
	mvz.b looper,%d0
	rts
	.size	looper_pad_skip, .-looper_pad_skip
	.align	2
	.globl	looper_key
	.type	looper_key, @function
looper_key:
	subq.l #4,%sp
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 20(%sp),%a1
	mov3q.l #1,%d1
	move.l 16(%sp),8(%sp)
	move.l 12(%a1),%a0
	and.l 16(%a1),%d1
	cmp.l #134,%a0
	jne .L58
	move.b %d1,looper+2
.L59:
	tst.b looper.l
	jeq .L64
	move.l %a0,%d0
	add.l #-66,%d0
	lsr.l #1,%d0
	jne .L64
	tst.l %d1
	jeq .L57
	move.b looper+1,%d0
	moveq #66,%d1
	cmp.l %a0,%d1
	jne .L65
	mvz.b %d0,%d1
	mov3q.l #6,%d2
	cmp.l %d1,%d2
	jcs .L67
	move.l %d0,%d1
	addq.l #1,%d1
.L78:
	move.b %d1,%d0
	move.b %d1,looper+1
.L67:
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	mov3q.l #1,-(%sp)
	jra .L80
.L58:
	moveq #80,%d2
	cmp.l %a0,%d2
	jne .L60
	tst.l %d1
	jeq .L61
	tst.b looper+2.l
	jeq .L59
	move.b looper,%d0
	mov3q.l #1,%d1
	moveq #1,%d2
	eor.l %d1,%d0
	mvz.b looper+1,%d1
	move.b %d2,looper+3
	move.l %d1,-(%sp)
	move.b %d0,looper
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
.L80:
	mov3q.l #5,-(%sp)
	jsr report
	lea (12,%sp),%sp
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	jra paint_all
.L61:
	tst.b looper+3.l
	jeq .L59
	clr.b %d0
	move.b %d0,looper+3
.L57:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	rts
.L60:
	move.l %a0,%d2
	moveq #11,%d0
	add.l #-144,%d2
	cmp.l %d2,%d0
	jcs .L59
	mov3q.l #1,%d0
	lsl.l %d2,%d0
	tst.l %d1
	jeq .L63
	tst.b looper.l
	jeq .L64
	move.w looper+4,%d1
	mov3q.l #1,-(%sp)
	or.l %d1,%d0
	move.w %d0,looper+4
.L79:
	move.b looper+1,%d0
	muls.w #12,%d0
	lea 112(%a0,%d0.l),%a0
	move.l %a0,%d0
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	mov3q.l #6,-(%sp)
	jsr report
	lea (12,%sp),%sp
	jra .L57
.L63:
	move.w looper+4,%d2
	move.l %d0,%d3
	and.l %d2,%d3
	tst.w %d3
	jeq .L59
	not.l %d0
	and.l %d2,%d0
	clr.l -(%sp)
	move.w %d0,looper+4
	jra .L79
.L65:
	tst.b %d0
	jeq .L67
	move.l %d0,%d1
	subq.l #1,%d1
	jra .L78
.L64:
	move.l %a1,20(%sp)
	move.l 8(%sp),16(%sp)
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	addq.l #4,%sp
	jmp 1074397898
	.size	looper_key, .-looper_key
	.text
	.type	CSWTCH.9, @object
	.size	CSWTCH.9, 4
CSWTCH.9:
	.byte	63
	.byte	15
	.byte	47
	.byte	43
	.globl	mutes_kept
	.section	.lps,"aw"
	.align	2
	.type	mutes_kept, @object
	.size	mutes_kept, 4
mutes_kept:
	.zero	4
	.globl	mutes_held
	.type	mutes_held, @object
	.size	mutes_held, 1
mutes_held:
	.zero	1
	.globl	mod_call
	.type	mod_call, @object
	.size	mod_call, 1
mod_call:
	.zero	1
	.globl	slot_state
	.type	slot_state, @object
	.size	slot_state, 96
slot_state:
	.zero	96
	.globl	looper
	.align	2
	.type	looper, @object
	.size	looper, 8
looper:
	.zero	8
	.ident	"GCC: (GNU) 16.2.0"
	.endif
	.endif
	.endif
	.endif
