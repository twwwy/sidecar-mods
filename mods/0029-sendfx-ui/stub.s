| Mod 0029 - Sidecar send FX pages: AMPLITUDE 2 (SEND FX 1/2) and the SEND FX 1/2 pages behind DELAY/REVERB.
| GENERATED from sfu.c by build.sh (m68k-elf-gcc -mcpu=5475 -Os); edit sfu.c.
#NO_APP
	.file	"sfu.c"
	.text
#APP
	  .text
  .globl sfu_pinfo, sfu_getv, sfu_title
  .align 2
sfu_pinfo:
  move.l 4(%sp),%d0
  moveq #-12,%d1
  add.l %d1,%d0
  moveq #2,%d1
  cmp.l %d0,%d1
  bcs.s 1f
  mulu.w #36,%d0
  add.l #sfu_pages,%d0
  rts
1:
  moveq #11,%d1
  move.l 4(%sp),%d0
  jmp 0x400ff57a
  .align 2
sfu_getv:
  move.l 8(%sp),%d0
  moveq #-14,%d1
  add.l %d1,%d0
  moveq #13,%d1
  cmp.l %d0,%d1
  bcc.w sfu_get
  move.l 8(%sp),-(%sp)
  jsr sfu_isext
  addq.l #4,%sp
  tst.l %d0
  bne.w sfu_get
  lea -12(%sp),%sp
  movem.l %d2-%d3/%a2,(%sp)
  jmp 0x4003846a
  .align 2
sfu_title:
  move.l %a2,-(%sp)
  jsr 0x40078514
  lea -24(%sp),%sp
  movem.l %d0-%d1/%a0-%a1,(%sp)
  move.l %a2,-(%sp)
  move.l (%a2),%a0
  move.l 0x4c(%a0),%a0
  jsr (%a0)
  addq.l #4,%sp
  pea 19(%sp)
  move.l %d0,-(%sp)
  pea 28(%sp)
  jsr 0x401bcd4c
  lea 12(%sp),%sp
  pea 20(%sp)
  move.l 108(%a2),-(%sp)
  jsr 0x40035fe8
  addq.l #8,%sp
  pea 20(%sp)
  jsr 0x401bb29c
  addq.l #4,%sp
  movem.l (%sp),%d0-%d1/%a0-%a1
  lea 24(%sp),%sp
  jmp 0x4003ab9c

#NO_APP
	.align	2
	.type	timed, @function
timed:
	move.l -66650100,%d0
	sub.l 4(%sp),%d0
	tst.l 8(%sp)
	jeq .L2
	add.l %d0,sfu_x+2176
	addq.l #1,sfu_x+2184
	cmp.l sfu_x+2180.l,%d0
	jls .L1
	move.l %d0,sfu_x+2180
.L1:
	rts
.L2:
	add.l %d0,sfu_x+2164
	addq.l #1,sfu_x+2172
	cmp.l sfu_x+2168.l,%d0
	jls .L1
	move.l %d0,sfu_x+2168
	jra .L1
	.size	timed, .-timed
	.align	2
	.type	merge, @function
merge:
	move.l %d2,-(%sp)
	move.l 16(%sp),%d0
	move.l 12(%sp),%d1
	cmp.l #32512,%d0
	jle .L5
	mvz.w #32512,%d0
.L6:
	move.l 8(%sp),%d2
	btst #0,%d2
	jeq .L7
	asr.l #7,%d0
	and.l #32512,%d1
	and.l #254,%d0
.L9:
	or.l %d1,%d0
	move.l (%sp)+,%d2
	rts
.L5:
	tst.l %d0
	jge .L6
	clr.l %d0
	jra .L6
.L7:
	and.l #32512,%d0
	and.l #254,%d1
	jra .L9
	.size	merge, .-merge
	.align	2
	.type	tcache, @function
tcache:
	lea (-28,%sp),%sp
	movem.l #3132,(%sp)
	move.l 32(%sp),%d1
	lea sfu_x,%a2
	move.l 36(%sp),%d2
	lea (%a2,%d1.l),%a0
	move.l sfu_x+2456,%d4
	addq.l #1,%d4
	mvz.b 2578(%a0),%d0
	cmp.l %d0,%d2
	jeq .L11
.L14:
	move.l sfu_x+2452,%d0
	mov3q.l #-1,%a1
	mov3q.l #1,%d3
	lea sfu_x+2324,%a3
	move.l %d0,24(%sp)
	clr.l %d0
.L12:
	cmp.l 24(%sp),%d0
	jne .L17
	move.b %d2,2578(%a0)
	mov3q.l #-1,%d0
	cmp.l %a1,%d0
	jne .L18
	move.w #255,%a1
.L18:
	move.w %a1,%d0
	add.l #646,%d1
	move.l %d4,(%a2,%d1.l*4)
	move.b %d3,2582(%a0)
	move.b %d0,2580(%a0)
	jra .L10
.L11:
	move.l %d1,%d0
	add.l #646,%d0
	cmp.l (%a2,%d0.l*4),%d4
	jne .L14
.L10:
	movem.l (%sp),#3132
	lea (28,%sp),%sp
	rts
.L17:
	mvz.b (%a3,%d0.l),%d5
	cmp.l %d5,%d2
	jne .L15
	move.l %d0,%a1
.L16:
	addq.l #1,%d0
	jra .L12
.L15:
	tst.l %d0
	jeq .L16
	cmp.l %d5,%d2
	jle .L16
	addq.l #1,%d3
	jra .L16
	.size	tcache, .-tcache
	.align	2
	.type	tid, @function
tid:
	move.l %d2,-(%sp)
	move.l 8(%sp),%d2
	move.l 12(%sp),-(%sp)
	move.l %d2,-(%sp)
	jsr tcache
	addq.l #8,%sp
	lea sfu_x,%a1
	lea (%a1,%d2.l),%a0
	move.b 2580(%a0),%d0
	move.l sfu_x+2452,%d2
	move.l %d0,%d1
	not.l %d1
	tst.b %d1
	seq %d1
	mvs.b %d1,%d1
	sub.l %d1,%d2
	move.l 16(%sp),%d1
	tst.l %d1
	jge .L23
	clr.l %d1
.L23:
	cmp.l %d1,%d2
	jgt .L24
	move.l %d2,%d1
	subq.l #1,%d1
.L24:
	mvz.b %d0,%d0
	cmp.l #255,%d0
	jne .L28
	mvz.b 2582(%a0),%d0
	cmp.l %d0,%d1
	jeq .L26
	jle .L28
	subq.l #1,%d1
.L28:
	add.l %d1,%a1
	mvz.b 2324(%a1),%d0
	move.l %d0,12(%sp)
.L26:
	move.l 12(%sp),%d0
	move.l (%sp)+,%d2
	rts
	.size	tid, .-tid
	.align	2
	.type	to_knob, @function
to_knob:
	lea (-20,%sp),%sp
	move.l 24(%sp),%d1
	movem.l #1084,(%sp)
	move.l 28(%sp),%d0
	mov3q.l #1,%d2
	cmp.l %d1,%d2
	jge .L33
	move.l %d0,%d3
	asr.l #8,%d3
	move.l %d1,%d2
	subq.l #2,%d2
	move.l %d2,%d4
	mov3q.l #6,%d5
	move.l %d3,%a1
	rems.l %d5,%d3:%d4
	move.l %d3,%d2
	tst.l %d3
	jne .L31
	mov3q.l #7,%d4
	cmp.l %d1,%d4
	slt %d2
	move.l %a1,-(%sp)
	mvs.b %d2,%d2
	neg.l %d2
	move.l %d2,-(%sp)
	jsr tcache
	addq.l #8,%sp
	move.l %d2,%a0
	add.l #sfu_x,%a0
	move.b 2580(%a0),%d0
	mvz.b %d0,%d1
	cmp.l #255,%d1
	jne .L32
	move.b 2582(%a0),%d0
.L32:
	mvz.b %d0,%d0
.L39:
	lsl.l #8,%d0
.L33:
	movem.l (%sp),#1084
	lea (20,%sp),%sp
	rts
.L31:
	mov3q.l #1,%d5
	cmp.l %d3,%d5
	jne .L34
	moveq #63,%d1
	cmp.l %a1,%d1
	slt %d0
	mvs.b %d0,%d0
	neg.l %d0
	jra .L39
.L34:
	mov3q.l #7,%d3
	cmp.l %d1,%d3
	slt %d1
	subq.l #2,%d2
	move.l %d2,%a2
	neg.l %d1
	mvz.b %d1,%d4
	lea (%a2,%d4.l*4),%a0
	add.l #sfu_x+2460,%a0
	mvz.b (%a0),%d3
	tst.l %d3
	jeq .L33
	move.l %d3,%d0
	subq.l #1,%d0
	tst.b %d1
	jeq .L36
	moveq #48,%d1
.L37:
	mulu.w #12,%d2
	add.l %d2,%d1
	move.l %d1,%a0
	add.l #sfu_x+2468,%a0
.L38:
	tst.l %d0
	jeq .L39
	mvz.b (%a0,%d0.l),%d1
	cmp.l %d1,%a1
	jge .L39
	subq.l #1,%d0
	jra .L38
.L36:
	clr.l %d1
	jra .L37
	.size	to_knob, .-to_knob
	.align	2
	.type	to_half, @function
to_half:
	lea (-24,%sp),%sp
	move.l 28(%sp),%d1
	movem.l #3132,(%sp)
	move.l 32(%sp),%d0
	mov3q.l #1,%d2
	cmp.l %d1,%d2
	jge .L46
	move.l %d0,%d2
	asr.l #8,%d2
	move.l %d2,%a1
	tst.l %d2
	jge .L47
	sub.l %a1,%a1
.L47:
	move.l %d1,%a2
	subq.l #2,%a2
	move.l %a2,%d3
	mov3q.l #6,%d4
	rems.l %d4,%d5:%d3
	move.l %d5,%a0
	tst.l %d5
	jne .L48
	mov3q.l #7,%d0
	cmp.l %d1,%d0
	slt %d1
	move.l %a1,-(%sp)
	move.l 40(%sp),-(%sp)
	mvs.b %d1,%d1
	neg.l %d1
	move.l %d1,-(%sp)
	jsr tid
	lea (12,%sp),%sp
	lsl.l #8,%d0
.L46:
	movem.l (%sp),#3132
	lea (24,%sp),%sp
	rts
.L48:
	mov3q.l #1,%d3
	cmp.l %d5,%d3
	jne .L49
	tst.l %d2
	jle .L52
	mvz.w #32512,%d0
	jra .L46
.L49:
	mov3q.l #7,%d4
	cmp.l %d1,%d4
	slt %d1
	lea sfu_x,%a2
	subq.l #2,%a0
	mvs.b %d1,%d1
	neg.l %d1
	lea (%a2,%d1.l*4),%a3
	add.l %a0,%a3
	mvz.b 2460(%a3),%d2
	tst.l %d2
	jeq .L46
	cmp.l %a1,%d2
	jgt .L51
	move.l %d2,%a1
	subq.l #1,%a1
.L51:
	move.l %a0,%d0
	moveq #12,%d2
	moveq #48,%d3
	muls.l %d2,%d0
	muls.l %d3,%d1
	addq.l #1,sfu_x+2592
	move.l %d0,%a0
	add.l %d1,%a0
	add.l %a2,%a0
	add.l %a1,%a0
	mvz.b 2468(%a0),%d0
	lsl.l #8,%d0
	jra .L46
.L52:
	clr.l %d0
	jra .L46
	.size	to_half, .-to_half
	.align	2
	.type	xmode, @function
xmode:
	lea (-36,%sp),%sp
	moveq #126,%d0
	movem.l #7420,(%sp)
	move.l 40(%sp),%d3
	move.l %d3,%d5
	add.l #-334,%d5
	cmp.l %d5,%d0
	jcc .L57
.L59:
	clr.l %d0
.L56:
	movem.l (%sp),#7420
	lea (36,%sp),%sp
	rts
.L57:
	tst.b sfu_st+1026.l
	jeq .L59
	move.l #1481856080,%d1
	cmp.l 1073848892.l,%d1
	jne .L59
	move.l %d5,%d4
	move.l #sfu_x,%d2
	lsl.l #2,%d4
	move.l sfu_st+1034,%d0
	move.l %d2,%a0
	move.l %d5,%a2
	addq.l #1,%d0
	add.l %d2,%a2
	add.l %d4,%a0
	cmp.l 2854(%a0),%d0
	jeq .L60
	move.l 1073848896,%a0
	move.l %d3,-(%sp)
	jsr (%a0)
	addq.l #1,sfu_x+6410
	addq.l #4,%sp
	btst #12,%d0
	jne .L67
	move.l %d0,%d1
	asr.l #8,%d1
	mov3q.l #3,%d6
	and.l %d6,%d1
.L61:
	moveq #10,%d6
	move.l %d0,%d7
	asr.l %d6,%d7
	mov3q.l #1,%d6
	move.b %d0,2727(%a2)
	move.b %d1,2600(%a2)
	and.l %d6,%d7
	moveq #11,%d6
	move.b %d7,6430(%a2)
	move.l %d0,%d7
	asr.l %d6,%d7
	mov3q.l #1,%d6
	mvz.b %d0,%d0
	and.l %d6,%d7
	move.b %d7,6557(%a2)
	cmp.l %d0,%d6
	jcs .L62
	mvz.b %d1,%d1
	subq.l #4,%d1
	tst.l %d1
	jeq .L62
	clr.b %d0
	move.b %d0,2600(%a2)
.L62:
	move.l sfu_st+1034,%d1
	move.l %d2,%a0
	addq.l #1,%d1
	add.l %d4,%a0
	move.l %d1,2854(%a0)
.L60:
	move.w %d3,%d0
	mulu.w #52,%d3
	move.l %d3,%a1
	add.l #1075575064,%a1
	mulu.w #84,%d0
	move.l %d0,%a0
	add.l #1100630152,%a0
	move.l 32(%a0),%d0
	tst.b 2600(%a2)
	jeq .L63
	cmp.l #sfu_xtext,%d0
	jeq .L64
	moveq #20,%d6
	muls.l %d6,%d5
	move.l %d2,%a3
	add.l %d4,%d2
	move.l #1100634276,%a4
	move.l #sfu_xtext,%d0
	add.l %d5,%a3
	move.l (%a0),3870(%a3)
	move.l 4(%a0),3874(%a3)
	move.l 8(%a0),3878(%a3)
	move.l 16(%a0),3882(%a3)
	move.l 48(%a0),3886(%a3)
	move.l %d2,%a3
	move.l 32(%a0),3362(%a3)
	move.l 1100634268,(%a0)
	move.l #1100634272,%a3
	move.l (%a3),4(%a0)
	move.l #1100634284,%a3
	move.l (%a4),8(%a0)
	lea sfu_draw,%a4
	move.l (%a3),16(%a0)
	move.l %a4,48(%a0)
	move.l %d0,32(%a0)
	addq.l #1,sfu_x+6414
.L64:
	mvz.b 2600(%a2),%d0
	subq.l #4,%d0
	tst.l %d0
	jeq .L65
	mvz.b 2727(%a2),%d0
	subq.l #1,%d0
	lsl.l #8,%d0
	tst.b 6557(%a2)
	jeq .L68
	mvz.w #224,%d1
.L66:
	or.l %d1,%d0
.L77:
	move.l %d0,12(%a1)
.L65:
	mvz.b 2600(%a2),%d0
	jra .L56
.L67:
	moveq #4,%d1
	jra .L61
.L68:
	clr.l %d1
	jra .L66
.L63:
	cmp.l #sfu_xtext,%d0
	jne .L65
	moveq #20,%d6
	muls.l %d6,%d5
	move.l %d2,%a3
	add.l %d4,%d2
	mvz.w #32512,%d0
	add.l %d5,%a3
	move.l 3870(%a3),(%a0)
	move.l 3874(%a3),4(%a0)
	move.l 3878(%a3),8(%a0)
	move.l 3882(%a3),16(%a0)
	move.l 3886(%a3),48(%a0)
	move.l %d2,%a3
	move.l 3362(%a3),32(%a0)
	jra .L77
	.size	xmode, .-xmode
	.align	2
	.type	x_knob, @function
x_knob:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 12(%sp),%a0
	add.l #sfu_x-334,%a0
	mvz.b 2600(%a0),%d2
	mov3q.l #4,%d1
	move.l 16(%sp),%d0
	cmp.l %d2,%d1
	jeq .L79
	mvz.b 2727(%a0),%d3
	move.l %d0,%d1
	asr.l #8,%d1
	move.l %d3,%a1
	moveq #127,%d3
	cmp.l %d1,%d3
	jge .L80
	moveq #127,%d1
.L81:
	mov3q.l #1,%d3
	cmp.l %d2,%d3
	jne .L82
	move.w %a1,%d2
	muls.w %d2,%d1
	asr.l #7,%d1
.L83:
	lsl.l #8,%d1
	tst.b 6557(%a0)
	jeq .L88
	and.l #224,%d0
.L86:
	or.l %d1,%d0
.L79:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L80:
	tst.l %d1
	jge .L81
	clr.l %d1
	jra .L81
.L82:
	subq.l #2,%d2
	tst.l %d2
	jne .L83
	cmp.l %d1,%a1
	jgt .L83
	tst.b 6430(%a0)
	jne .L87
	move.l %a1,%d1
	subq.l #1,%d1
	jra .L83
.L87:
	clr.l %d1
	jra .L83
.L88:
	clr.l %d0
	jra .L86
	.size	x_knob, .-x_knob
	.align	2
	.type	x_half, @function
x_half:
	lea (-12,%sp),%sp
	mov3q.l #4,%d1
	movem.l #1036,(%sp)
	move.l 16(%sp),%a1
	add.l #sfu_x-334,%a1
	move.l 20(%sp),%d0
	mvz.b 2600(%a1),%d2
	cmp.l %d2,%d1
	jeq .L93
	mvz.b 2727(%a1),%d3
	move.l %d0,%d1
	asr.l #8,%d1
	move.l %d3,%a0
	tst.l %d0
	jge .L94
	clr.l %d1
.L94:
	cmp.l %d1,%a0
	jgt .L95
	tst.b 6430(%a1)
	jeq .L96
	mov3q.l #2,%d1
	cmp.l %d2,%d1
	jeq .L99
.L96:
	move.l %a0,%d1
	subq.l #1,%d1
.L95:
	subq.l #1,%d2
	tst.l %d2
	jne .L97
	lsl.l #7,%d1
	move.l %a0,%d3
	lea -1(%a0,%d1.l),%a2
	move.l %a2,%d1
	divs.l %d3,%d1
.L97:
	lsl.l #8,%d1
	addq.l #1,sfu_x+2592
	tst.b 6557(%a1)
	jeq .L100
	and.l #224,%d0
.L98:
	or.l %d1,%d0
.L93:
	movem.l (%sp),#1036
	lea (12,%sp),%sp
	rts
.L99:
	clr.l %d1
	jra .L97
.L100:
	clr.l %d0
	jra .L98
	.size	x_half, .-x_half
	.align	2
	.type	xname, @function
xname:
	lea (-28,%sp),%sp
	movem.l #1148,(%sp)
	move.l 32(%sp),%d4
	move.l %d4,%d1
	add.l #-1100630172,%d1
	move.l %d1,%d2
	moveq #84,%d5
	divu.l %d5,%d2
	move.l 36(%sp),%d0
	move.l 40(%sp),%d3
	move.l %d2,%d1
	move.l %d2,%a0
	add.l #-334,%d1
	moveq #126,%d2
	cmp.l %d1,%d2
	jcs .L105
	move.l #sfu_x,%d2
	move.l %d2,%a1
	add.l %d1,%a1
	move.b 2600(%a1),%d5
	mvz.b %d5,%d6
	move.w %d5,%a1
	subq.l #4,%d6
	tst.l %d6
	jne .L106
	move.l sfu_p+522,%a2
	tst.l %a2
	jeq .L106
	mov3q.l #1,-(%sp)
	move.l %d3,-(%sp)
	move.l %d0,-(%sp)
	move.l %a0,-(%sp)
	move.l 16(%a2),%a0
	jsr (%a0)
.L116:
	lea (16,%sp),%sp
	movem.l (%sp),#1148
	lea (28,%sp),%sp
	rts
.L106:
	lsl.l #2,%d1
	move.l %d2,%a2
	add.l %d1,%a2
	tst.l 3362(%a2)
	jne .L108
.L105:
	asr.l #8,%d0
	move.l %d0,-(%sp)
	pea s_empty
	pea fmt_d
	move.l %d3,-(%sp)
	jsr 1074365954
	jra .L116
.L108:
	move.w %a1,%d6
	tst.b %d6
	jeq .L109
	move.l %d0,-(%sp)
	move.l %a0,-(%sp)
	move.l %d1,32(%sp)
	jsr x_half
	addq.l #8,%sp
	subq.l #1,sfu_x+2592
	move.l 24(%sp),%d1
.L109:
	move.l %d3,40(%sp)
	move.l %d4,32(%sp)
	move.l %d2,%a0
	add.l %d1,%a0
	movem.l (%sp),#1148
	move.l %d0,36(%sp)
	move.l 3362(%a0),%a1
	lea (28,%sp),%sp
	jmp (%a1)
	.size	xname, .-xname
	.align	2
	.globl	sfu_xtext
	.type	sfu_xtext, @function
sfu_xtext:
	lea (-28,%sp),%sp
	movem.l #7228,(%sp)
	moveq #84,%d2
	moveq #126,%d5
	move.l 32(%sp),%d3
	move.l %d3,%d1
	add.l #-1100630172,%d1
	divu.l %d2,%d1
	move.l 36(%sp),%a0
	move.l 40(%sp),%a1
	move.l %d1,%d2
	add.l #-334,%d2
	cmp.l %d2,%d5
	jcs .L118
	lea sfu_x,%a3
	mov3q.l #4,%d5
	lea (%a3,%d2.l),%a2
	move.b 2600(%a2),%d0
	mvz.b %d0,%d4
	cmp.l %d4,%d5
	jne .L119
	move.l sfu_p+522,%a4
	tst.l %a4
	jeq .L119
	clr.l -(%sp)
	move.l %a1,-(%sp)
	move.l %a0,-(%sp)
	move.l %d1,-(%sp)
	move.l 16(%a4),%a0
	jsr (%a0)
.L128:
	lea (16,%sp),%sp
	movem.l (%sp),#7228
	lea (28,%sp),%sp
	rts
.L119:
	lea (%a3,%d2.l*4),%a3
	tst.l 3362(%a3)
	jeq .L118
	subq.l #1,%d0
	mvz.b %d0,%d0
	lsr.l #1,%d0
	jne .L118
	move.l %a0,%d0
	asr.l #8,%d0
	tst.l %a0
	jge .L121
	clr.l %d0
.L121:
	mvz.b 2727(%a2),%d1
	cmp.l %d1,%d0
	jlt .L122
	tst.b 6430(%a2)
	jeq .L123
	subq.l #2,%d4
	tst.l %d4
	jeq .L124
.L123:
	move.l %d1,%d0
	subq.l #1,%d0
.L122:
	move.l %d0,%a0
	pea 1(%a0)
	pea s_empty
	pea fmt_d
	move.l %a1,-(%sp)
	jsr 1074365954
	jra .L128
.L124:
	clr.l %d0
	jra .L122
.L118:
	move.l %d3,32(%sp)
	movem.l (%sp),#7228
	move.l %a1,40(%sp)
	move.l %a0,36(%sp)
	lea (28,%sp),%sp
	jra xname
	.size	sfu_xtext, .-sfu_xtext
	.align	2
	.type	um_val, @function
um_val:
	move.l sfu_p+522,%a0
	tst.l %a0
	jeq .L131
	move.l 4(%sp),%d0
	moveq #126,%d1
	add.l #-334,%d0
	cmp.l %d0,%d1
	jcs .L131
	move.l 4(%a0),%a1
	jmp (%a1)
.L131:
	mov3q.l #-1,%d0
	rts
	.size	um_val, .-um_val
	.align	2
	.type	step_to, @function
step_to:
	move.l %d3,-(%sp)
	move.l sfu_p+522,%a0
	move.l %d2,-(%sp)
	move.l 20(%sp),%d2
	tst.l %a0
	jeq .L136
	move.l 12(%a0),%a0
	move.l 12(%sp),-(%sp)
	jsr (%a0)
	addq.l #4,%sp
	move.l %d0,%d1
	and.l #65534,%d1
	tst.l %d1
	jeq .L136
	tst.l %d2
	jeq .L136
	move.l %d0,%d1
	mvz.w %d1,%d1
	move.l %d1,%a1
	move.l %d2,%d1
	tst.l %d2
	jge .L137
	add.l #255,%d1
.L137:
	asr.l #8,%d1
	jne .L138
	tst.l %d2
	jle .L145
	mov3q.l #1,%d0
.L139:
	move.l 16(%sp),%d1
	asr.l #1,%d1
	lea (-1,%a1),%a0
	move.l %a0,%d2
	mvz.w #16256,%d3
	and.l #16383,%d1
	muls.l %d2,%d1
	add.l #8128,%d1
	divs.l %d3,%d1
	cmp.l %a1,%d1
	jlt .L142
	move.l %a0,%d1
.L142:
	add.l %d1,%d0
	tst.l %d0
	jge .L143
	clr.l %d0
.L143:
	cmp.l %d0,%a1
	jgt .L144
	move.l %a0,%d0
.L144:
	mvz.w #16256,%d1
	move.l %a0,%d3
	addq.l #1,sfu_p+542
	muls.l %d1,%d0
	move.l %a0,%d1
	jpl .L154
	addq.l #1,%d1
.L154:
	move.l %d0,%d2
	asr.l #1,%d1
	add.l %d1,%d2
	divs.l %d3,%d2
	add.l %d2,%d2
	sub.l 16(%sp),%d2
.L136:
	move.l %d2,%d0
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L138:
	swap %d0
	ext.l %d0
	tst.l %d0
	jne .L140
.L141:
	move.l %d1,%d0
	jra .L139
.L140:
	move.l %d1,%a0
	mov3q.l #6,%d3
	addq.l #3,%a0
	cmp.l %a0,%d3
	jcc .L141
	cmp.l #255,%d2
	jgt .L139
	neg.l %d0
	jra .L139
.L145:
	mov3q.l #-1,%d0
	jra .L139
	.size	step_to, .-step_to
	.align	2
	.type	see_fxset, @function
see_fxset:
	move.l 4(%sp),%d0
	move.l sfu_x+2132,%d1
	cmp.l %d1,%d0
	jeq .L155
	tst.l %d1
	jeq .L157
	addq.l #1,sfu_x+2140
.L157:
	move.l %d0,sfu_x+2132
.L155:
	rts
	.size	see_fxset, .-see_fxset
	.align	2
	.type	type_text, @function
type_text:
	lea (-12,%sp),%sp
	movem.l #1036,(%sp)
	move.l 20(%sp),%d0
	asr.l #8,%d0
	move.l 16(%sp),%d2
	move.l %d2,%a0
	move.l 24(%sp),%d3
	add.l #sfu_x,%a0
	move.l %d0,-(%sp)
	mvz.b 2088(%a0),%d0
	move.l %d0,-(%sp)
	move.l %d2,-(%sp)
	jsr tid
	lea (12,%sp),%sp
	moveq #127,%d1
	move.l %d0,%a1
	cmp.l %d0,%d1
	jge .L162
	move.w #127,%a1
.L162:
	mvz.w %a1,%d1
	lsl.l #3,%d1
	move.l %d1,%a0
	add.l #sfu_st,%a0
	tst.b (%a0)
	jne .L163
	moveq #63,%d1
	cmp.l %d0,%d1
	jge .L167
	lea (-63,%a1),%a1
	move.l #s_ufx,%d0
.L164:
	move.l %a1,-(%sp)
	move.l %d0,-(%sp)
	pea fmt_d
	move.l %d3,-(%sp)
	jsr 1074365954
	movem.l 16(%sp),#1036
	lea (28,%sp),%sp
	rts
.L167:
	move.l #s_fx,%d0
	jra .L164
.L163:
	add.l #sfu_st,%d2
	move.l %d2,%a2
	mvz.b 1024(%a2),%d0
	cmp.l %d0,%a1
	jne .L168
	move.l #fmt_bang,%d0
.L166:
	move.l %d3,16(%sp)
	movem.l (%sp),#1036
	move.l %a0,24(%sp)
	move.l %d0,20(%sp)
	lea (12,%sp),%sp
	jmp 1074365954
.L168:
	move.l #fmt_s,%d0
	jra .L166
	.size	type_text, .-type_text
	.align	2
	.globl	sfu_type1_text
	.type	sfu_type1_text, @function
sfu_type1_text:
	clr.l 4(%sp)
	jra type_text
	.size	sfu_type1_text, .-sfu_type1_text
	.align	2
	.globl	sfu_type2_text
	.type	sfu_type2_text, @function
sfu_type2_text:
	mov3q.l #1,4(%sp)
	jra type_text
	.size	sfu_type2_text, .-sfu_type2_text
	.align	2
	.globl	sfu_route_text
	.type	sfu_route_text, @function
sfu_route_text:
	move.l 8(%sp),%d0
	asr.l #8,%d0
	move.l 12(%sp),%d1
	tst.l %d0
	jeq .L174
	move.l #s_post,%d0
.L173:
	move.l %d0,12(%sp)
	move.l #fmt_s,%d0
	move.l %d0,8(%sp)
	move.l %d1,4(%sp)
	jmp 1074365954
.L174:
	move.l #s_pre,%d0
	jra .L173
	.size	sfu_route_text, .-sfu_route_text
	.align	2
	.type	lab_of, @function
lab_of:
	move.l %d2,-(%sp)
	move.l 8(%sp),%d1
	clr.l %d0
	addq.l #1,%d1
	lea sfu_x,%a0
.L178:
	mvz.b (%a0),%d2
	cmp.l %d2,%d1
	jne .L176
	mulu.w #130,%d0
	add.l #sfu_x,%d0
.L175:
	move.l (%sp)+,%d2
	rts
.L176:
	addq.l #1,%d0
	lea (130,%a0),%a0
	moveq #16,%d2
	cmp.l %d0,%d2
	jne .L178
	clr.l %d0
	jra .L175
	.size	lab_of, .-lab_of
	.align	2
	.type	ptext, @function
ptext:
	lea (-40,%sp),%sp
	movem.l #1276,(%sp)
	lea sfu_x,%a0
	move.l 44(%sp),%d3
	add.l %d3,%a0
	move.l 48(%sp),%d5
	move.l 56(%sp),%d4
	move.l 52(%sp),36(%sp)
	move.l 60(%sp),%d2
	mvz.b 2090(%a0),%d0
	move.l %d0,-(%sp)
	jsr lab_of
	addq.l #4,%sp
	lea sfu_x,%a1
	lea (%a1,%d3.l*4),%a0
	move.l %d4,%d1
	asr.l #8,%d1
	add.l %d5,%a0
	mvz.b 2460(%a0),%d7
	tst.l %d4
	jge .L181
	clr.l %d1
.L181:
	tst.l %d7
	jeq .L182
	cmp.l %d1,%d7
	jgt .L183
	move.l %d7,%d1
	subq.l #1,%d1
.L183:
	moveq #48,%d7
	muls.l %d7,%d3
	moveq #12,%d7
	muls.l %d5,%d7
	move.l %d7,%a0
	add.l %d3,%a0
	add.l #sfu_x,%a0
	add.l %d1,%a0
	mvz.b 2468(%a0),%d1
.L182:
	move.l %d1,%a0
	moveq #127,%d1
	cmp.l %a0,%d1
	jge .L184
	move.w #127,%a0
.L184:
	tst.l %d0
	jeq .L185
	move.l %d0,%a1
	clr.l %d1
	mvz.b 1(%a1),%d3
	lea (22,%a1),%a1
	move.l %d3,28(%sp)
	mov3q.l #-1,%d3
.L186:
	cmp.l 28(%sp),%d1
	jge .L188
	moveq #12,%d6
	cmp.l %d1,%d6
	jne .L189
.L188:
	mov3q.l #-1,%d7
	cmp.l %d3,%d7
	jeq .L185
	move.l %d3,%d1
	lsl.l #3,%d1
	add.l %d3,%d1
	move.l %d0,%d3
	add.l %d1,%d3
	move.l %d3,%a1
	move.l %d3,%a2
	mvz.b 23(%a1),%d4
	mvz.b 24(%a2),%d3
	move.l %a0,%a1
	sub.l %d4,%a1
	add.l %d3,%a1
	moveq #99,%d3
	cmp.l %a1,%d3
	jlt .L198
	moveq #9,%d6
	cmp.l %a1,%d6
	jge .L199
	mov3q.l #2,%d3
.L190:
	move.l %d0,%a0
	lea 25(%a0,%d1.l),%a0
	move.l %a0,%d4
	move.l %d0,%a0
	add.l %d1,%a0
	move.b 22(%a0),%d0
	move.w %d0,%ccr
	jne .L191
	clr.l %d0
.L192:
	tst.b 25(%a0,%d0.l)
	jeq .L193
	addq.l #1,%d0
	mov3q.l #5,%d1
	cmp.l %d0,%d1
	jne .L192
.L193:
	move.l %d3,%a2
	lea 1(%a2,%d0.l),%a0
	mov3q.l #7,%d0
	cmp.l %a0,%d0
	jlt .L200
	move.l #fmt_sn,%d0
.L195:
	move.l %a1,56(%sp)
	move.l %d4,52(%sp)
	move.l %d0,48(%sp)
.L213:
	move.l %d2,44(%sp)
	movem.l (%sp),#1276
	lea (40,%sp),%sp
	jmp 1074365954
.L189:
	move.b (%a1),%d6
	mov3q.l #3,%d7
	and.l %d7,%d6
	cmp.l %d6,%d5
	jne .L187
	mvz.b 1(%a1),%d6
	cmp.l %d6,%a0
	jlt .L187
	move.l %d1,%d3
.L187:
	addq.l #1,%d1
	lea (9,%a1),%a1
	jra .L186
.L198:
	mov3q.l #3,%d3
	jra .L190
.L199:
	mov3q.l #1,%d3
	jra .L190
.L191:
	move.l %d4,52(%sp)
	move.l %d2,44(%sp)
	movem.l (%sp),#1276
	lea fmt_s,%a1
	move.l %a1,48(%sp)
	lea (40,%sp),%sp
	jmp 1074365954
.L200:
	move.l #fmt_n,%d0
	jra .L195
.L185:
	move.l sfu_x+2136,%a1
	tst.l %a1
	jeq .L196
	move.l %d2,52(%sp)
	move.l %d4,48(%sp)
	movem.l (%sp),#1276
	move.l 36(%sp),44(%sp)
	lea (40,%sp),%sp
	jmp (%a1)
.L196:
	move.l #s_empty,%d3
	move.l #fmt_d,%d6
	move.l %a0,56(%sp)
	move.l %d3,52(%sp)
	move.l %d6,48(%sp)
	jra .L213
	.size	ptext, .-ptext
	.align	2
	.globl	sfu_p00_text
	.type	sfu_p00_text, @function
sfu_p00_text:
	move.l -66650100,%d0
	subq.l #8,%sp
	move.l %d0,4(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	clr.l -(%sp)
	clr.l -(%sp)
	jsr ptext
	clr.l -(%sp)
	move.l 28(%sp),-(%sp)
	move.l %d0,28(%sp)
	jsr timed
	move.l 28(%sp),%d0
	lea (36,%sp),%sp
	rts
	.size	sfu_p00_text, .-sfu_p00_text
	.align	2
	.globl	sfu_p01_text
	.type	sfu_p01_text, @function
sfu_p01_text:
	move.l -66650100,%d0
	subq.l #8,%sp
	move.l %d0,4(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	mov3q.l #1,-(%sp)
	clr.l -(%sp)
	jsr ptext
	clr.l -(%sp)
	move.l 28(%sp),-(%sp)
	move.l %d0,28(%sp)
	jsr timed
	move.l 28(%sp),%d0
	lea (36,%sp),%sp
	rts
	.size	sfu_p01_text, .-sfu_p01_text
	.align	2
	.globl	sfu_p02_text
	.type	sfu_p02_text, @function
sfu_p02_text:
	move.l -66650100,%d0
	subq.l #8,%sp
	move.l %d0,4(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	mov3q.l #2,-(%sp)
	clr.l -(%sp)
	jsr ptext
	clr.l -(%sp)
	move.l 28(%sp),-(%sp)
	move.l %d0,28(%sp)
	jsr timed
	move.l 28(%sp),%d0
	lea (36,%sp),%sp
	rts
	.size	sfu_p02_text, .-sfu_p02_text
	.align	2
	.globl	sfu_p03_text
	.type	sfu_p03_text, @function
sfu_p03_text:
	move.l -66650100,%d0
	subq.l #8,%sp
	move.l %d0,4(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	mov3q.l #3,-(%sp)
	clr.l -(%sp)
	jsr ptext
	clr.l -(%sp)
	move.l 28(%sp),-(%sp)
	move.l %d0,28(%sp)
	jsr timed
	move.l 28(%sp),%d0
	lea (36,%sp),%sp
	rts
	.size	sfu_p03_text, .-sfu_p03_text
	.align	2
	.globl	sfu_p10_text
	.type	sfu_p10_text, @function
sfu_p10_text:
	move.l -66650100,%d0
	subq.l #8,%sp
	move.l %d0,4(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	clr.l -(%sp)
	mov3q.l #1,-(%sp)
	jsr ptext
	clr.l -(%sp)
	move.l 28(%sp),-(%sp)
	move.l %d0,28(%sp)
	jsr timed
	move.l 28(%sp),%d0
	lea (36,%sp),%sp
	rts
	.size	sfu_p10_text, .-sfu_p10_text
	.align	2
	.globl	sfu_p11_text
	.type	sfu_p11_text, @function
sfu_p11_text:
	move.l -66650100,%d0
	subq.l #8,%sp
	move.l %d0,4(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	mov3q.l #1,-(%sp)
	mov3q.l #1,-(%sp)
	jsr ptext
	clr.l -(%sp)
	move.l 28(%sp),-(%sp)
	move.l %d0,28(%sp)
	jsr timed
	move.l 28(%sp),%d0
	lea (36,%sp),%sp
	rts
	.size	sfu_p11_text, .-sfu_p11_text
	.align	2
	.globl	sfu_p12_text
	.type	sfu_p12_text, @function
sfu_p12_text:
	move.l -66650100,%d0
	subq.l #8,%sp
	move.l %d0,4(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	mov3q.l #2,-(%sp)
	mov3q.l #1,-(%sp)
	jsr ptext
	clr.l -(%sp)
	move.l 28(%sp),-(%sp)
	move.l %d0,28(%sp)
	jsr timed
	move.l 28(%sp),%d0
	lea (36,%sp),%sp
	rts
	.size	sfu_p12_text, .-sfu_p12_text
	.align	2
	.globl	sfu_p13_text
	.type	sfu_p13_text, @function
sfu_p13_text:
	move.l -66650100,%d0
	subq.l #8,%sp
	move.l %d0,4(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	mov3q.l #3,-(%sp)
	mov3q.l #1,-(%sp)
	jsr ptext
	clr.l -(%sp)
	move.l 28(%sp),-(%sp)
	move.l %d0,28(%sp)
	jsr timed
	move.l 28(%sp),%d0
	lea (36,%sp),%sp
	rts
	.size	sfu_p13_text, .-sfu_p13_text
	.align	2
	.type	set_rec, @function
set_rec:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	moveq #52,%d2
	move.l 12(%sp),%d1
	move.l %d1,%d0
	add.l #14,%d0
	muls.l %d2,%d0
	mov3q.l #1,%d3
	move.l %d0,%a0
	add.l #1075575064,%a0
	cmp.l %d1,%d3
	jge .L231
	move.l %d1,%d0
	mov3q.l #6,%d2
	subq.l #2,%d0
	divs.l %d2,%d0
	tst.l %d0
	jne .L232
	move.w #57,%a1
.L223:
	move.l %a1,(%a0)
	lea k_cidx,%a1
	mvz.b (%a1,%d1.l),%d2
	mvz.w #32512,%d3
	clr.l 8(%a0)
	mov3q.l #1,20(%a0)
	move.l %d2,4(%a0)
	move.l %d3,12(%a0)
	clr.l 16(%a0)
	mov3q.l #-1,24(%a0)
	mov3q.l #-1,28(%a0)
	clr.l 36(%a0)
	mov3q.l #-1,%d2
	cmp.l %d0,%d2
	jne .L224
	tst.l %d1
	jeq .L225
	move.l #l_sfx2,%d3
	move.l %d3,40(%a0)
	move.l #s_sfx2,%d0
.L227:
	move.l (%sp)+,%d2
	move.l #s_empty,%d3
	move.l %d3,44(%a0)
	move.l %d0,48(%a0)
	move.l (%sp)+,%d3
	rts
.L231:
	move.w #53,%a1
	mov3q.l #-1,%d0
	jra .L223
.L232:
	move.w #56,%a1
	jra .L223
.L225:
	lea l_sfx1,%a1
	move.l %a1,1075575832
	move.l #s_sfx1,%d0
	jra .L227
.L224:
	subq.l #2,%d1
	mov3q.l #6,%d2
	rems.l %d2,%d3:%d1
	move.l %d3,%a1
	tst.l %d0
	jeq .L233
	move.l #l_fx2,%d1
.L228:
	move.l %d1,40(%a0)
	tst.l %a1
	jeq .L229
	mov3q.l #1,%d1
	cmp.l %a1,%d1
	jne .L230
	move.l #s_route,%d0
	jra .L227
.L233:
	move.l #l_fx1,%d1
	jra .L228
.L230:
	lea -10(%a1,%a1.l*4),%a1
	moveq #20,%d2
	muls.l %d2,%d0
	add.l %a1,%d0
	add.l #sfu_x+2092,%d0
	jra .L227
.L229:
	move.l #s_type,%d0
	jra .L227
	.size	set_rec, .-set_rec
	.align	2
	.type	set_bw_rec, @function
set_bw_rec:
	move.l %d2,-(%sp)
	moveq #52,%d2
	move.l 8(%sp),%d1
	move.l %d1,%d0
	addq.l #1,%d0
	muls.l %d2,%d0
	move.l %d0,%a0
	mov3q.l #1,%d0
	add.l #1075575064,%a0
	cmp.l %d1,%d0
	jlt .L239
	move.w #57,%a1
	moveq #29,%d0
.L235:
	move.l %d0,4(%a0)
	mov3q.l #1,%d0
	and.l %d1,%d0
	mvz.w #32512,%d2
	move.l %a1,(%a0)
	clr.l 8(%a0)
	move.l %d2,12(%a0)
	move.l %d0,%a1
	btst #0,%d1
	jeq .L240
	move.l %d2,%d0
.L236:
	move.l %d0,16(%a0)
	clr.l 20(%a0)
	mov3q.l #-1,24(%a0)
	mov3q.l #-1,28(%a0)
	clr.l 36(%a0)
	mov3q.l #1,%d2
	cmp.l %d1,%d2
	jlt .L241
	move.l #l_fx1,%d0
.L237:
	move.l %d0,40(%a0)
	move.l #s_empty,%d0
	move.l %d0,44(%a0)
	tst.l %a1
	jeq .L242
	move.l #s_wid,%d0
.L238:
	move.l %d0,48(%a0)
	move.l (%sp)+,%d2
	rts
.L239:
	move.w #56,%a1
	clr.l %d0
	jra .L235
.L240:
	clr.l %d0
	jra .L236
.L241:
	move.l #l_fx2,%d0
	jra .L237
.L242:
	move.l #s_base,%d0
	jra .L238
	.size	set_bw_rec, .-set_bw_rec
	.align	2
	.type	copy_desc, @function
copy_desc:
	move.l %a2,-(%sp)
	move.w 10(%sp),%d0
	sub.l %a0,%a0
	mulu.w #84,%d0
	move.l %d0,%a1
	add.l #1100630152,%a1
	move.w 14(%sp),%d0
	mulu.w #84,%d0
	add.l #1100630152,%d0
.L244:
	lea (%a0,%d0.l),%a2
	moveq #84,%d1
	move.l (%a2),(%a1,%a0.l)
	addq.l #4,%a0
	cmp.l %a0,%d1
	jne .L244
	move.l (%sp)+,%a2
	rts
	.size	copy_desc, .-copy_desc
	.align	2
	.type	set_look, @function
set_look:
	lea (-16,%sp),%sp
	move.l 24(%sp),%a1
	move.l 20(%sp),%a0
	move.l %a0,%d0
	movem.l #7172,(%sp)
	move.l 28(%sp),%d1
	add.l #14,%d0
	tst.l %a1
	jeq .L253
	mov3q.l #1,%d2
	cmp.l %d1,%d2
	jge .L254
	subq.l #1,%d1
	lsl.l #8,%d1
	move.l #1100634268,%a2
.L247:
	moveq #52,%d2
	muls.l %d0,%d2
	move.l #1075575076,%a4
	move.l %a0,%a3
	add.l #sfu_x,%a3
	move.l %d1,(%a4,%d2.l)
	mvz.b 2564(%a3),%d1
	cmp.l %d1,%a1
	jeq .L246
	moveq #84,%d1
	muls.l %d1,%d0
	move.l %d0,%a0
	add.l #1100630152,%a0
	move.l (%a2),(%a0)
	move.l 4(%a2),4(%a0)
	move.l 8(%a2),8(%a0)
	move.l 16(%a2),16(%a0)
	tst.l %a1
	jne .L249
	move.l 1100664640,%d0
.L250:
	move.w %a1,%d1
	move.l %d0,48(%a0)
	move.b %d1,2564(%a3)
.L246:
	movem.l (%sp),#7172
	lea (16,%sp),%sp
	rts
.L253:
	mvz.w #32512,%d1
	move.l #1100664592,%a2
	jra .L247
.L254:
	mvz.w #256,%d1
	move.l #1100634268,%a2
	jra .L247
.L249:
	mov3q.l #2,%d2
	cmp.l %a1,%d2
	jne .L251
	move.l 1100633980,%d0
	jra .L250
.L251:
	mov3q.l #3,%d0
	cmp.l %a1,%d0
	jne .L252
	move.l 1100637004,%d0
	jra .L250
.L252:
	move.l #sfu_draw,%d0
	jra .L250
	.size	set_look, .-set_look
	.align	2
	.type	restore_recs, @function
restore_recs:
	lea (-40,%sp),%sp
	movem.l #7420,(%sp)
	move.l 44(%sp),%d2
	move.w %d2,%d6
	muls.w #6,%d6
	move.l %d6,%d0
	addq.l #2,%d0
	move.l %d0,36(%sp)
	btst #0,%d2
	jeq .L256
	move.l #sfu_type2_text,%d7
.L257:
	move.w %d2,%d3
	mvz.w %d2,%d4
	clr.l %d5
	lea set_rec,%a4
	move.l #1100631360,%a3
	move.l %d4,%d0
	lsl.l #4,%d0
	mulu.w #6,%d3
	move.l %d0,%a2
	add.l #ptexts,%a2
	addq.l #2,%d3
.L260:
	move.l %d3,-(%sp)
	jsr (%a4)
	addq.l #4,%sp
	tst.l %d5
	jeq .L263
	mov3q.l #1,%d1
	cmp.l %d5,%d1
	jeq .L259
	move.l -8(%a2),%d0
.L258:
	moveq #84,%d1
	addq.l #1,%d5
	muls.l %d3,%d1
	addq.l #1,%d3
	addq.l #4,%a2
	move.l %d0,(%a3,%d1.l)
	mov3q.l #6,%d0
	cmp.l %d5,%d0
	jne .L260
	mvs.w %d2,%d3
	mov3q.l #2,-(%sp)
	mov3q.l #1,-(%sp)
	move.l 44(%sp),-(%sp)
	add.l %d3,%d3
	lea set_look,%a2
	addq.l #1,%d2
	jsr (%a2)
	mov3q.l #2,-(%sp)
	mov3q.l #3,-(%sp)
	mulu.w #36,%d2
	move.l %d6,%a0
	pea 3(%a0)
	jsr (%a2)
	lea set_bw_rec,%a2
	move.l %d3,-(%sp)
	jsr (%a2)
	move.l %d3,%a0
	pea 1(%a0)
	jsr (%a2)
	lea (32,%sp),%sp
	move.l %d4,%d0
	move.l %d2,%a0
	add.l %d0,%d0
	lsl.l #2,%d4
	add.l #sfu_pages+4,%a0
	move.l %d0,%a1
	clr.l %d0
	subq.l #5,%a1
.L262:
	mov3q.l #5,%d1
	cmp.l %d0,%d1
	jlt .L264
	lea 21(%a1,%d4.l),%a2
.L261:
	move.l %a2,(%a0)+
	moveq #8,%d1
	addq.l #1,%d0
	addq.l #1,%a1
	cmp.l %d0,%d1
	jne .L262
	movem.l (%sp),#7420
	lea (40,%sp),%sp
	rts
.L256:
	move.l #sfu_type1_text,%d7
	jra .L257
.L259:
	move.l #sfu_route_text,%d0
	jra .L258
.L263:
	move.l %d7,%d0
	jra .L258
.L264:
	move.l %a1,%a2
	jra .L261
	.size	restore_recs, .-restore_recs
	.text
.LC0:
	.string	"ON"
.LC1:
	.string	"OFF"
	.text
	.align	2
	.type	relabel, @function
relabel:
	lea (-108,%sp),%sp
	movem.l #31996,(%sp)
	lea sfu_p,%a2
	clr.l %d3
	lea sfu_p+486,%a6
	move.l #sfu_pages+36,%d2
	move.l %a2,%a5
	lea sfu_x+2088,%a3
.L278:
	mvz.b (%a3,%d3.l),%d0
	move.l %d0,-(%sp)
	jsr lab_of
	addq.l #4,%sp
	tst.l %d0
	jne .L268
.L270:
	clr.b %d1
	moveq #1,%d0
.L269:
	move.b %d1,24(%a2)
	move.b %d0,22(%a2)
	mvz.b %d0,%d0
	mvz.b 20(%a2),%d1
	cmp.l %d0,%d1
	jcs .L271
	clr.b %d0
	move.b %d0,20(%a2)
	move.l %d3,-(%sp)
	jsr restore_recs
	addq.l #4,%sp
.L271:
	mvz.b 22(%a2),%d0
	lsr.l #1,%d0
	jeq .L272
	tst.l %d3
	jeq .L324
	move.l #n_fx2,%d1
.L273:
	move.l %a6,%a1
	sub.l %a0,%a0
.L274:
	move.b (%a0,%d1.l),%d0
	jne .L275
	move.b #32,(%a1)
	moveq #47,%d4
	clr.b %d5
	move.b 20(%a2),%d0
	move.b %d4,2(%a6,%a0.l)
	add.l #49,%d0
	move.b %d0,1(%a0,%a6.l)
	move.b 22(%a2),%d0
	move.b %d5,4(%a6,%a0.l)
	add.l #48,%d0
	move.b %d0,3(%a6,%a0.l)
	move.l %d2,%a0
	move.l %a6,(%a0)
.L276:
	addq.l #1,%a2
	lea (16,%a6),%a6
	add.l #36,%d2
	subq.l #1,%d3
	tst.l %d3
	jne .L326
	lea sfu_x+2088,%a0
	moveq #18,%d1
	lea sfu_x+2460,%a1
	clr.l %d7
	move.l %a0,48(%sp)
	move.l %a1,56(%sp)
	lea sfu_pages+40,%a6
	lea sfu_p+214,%a0
	lea sfu_p+134,%a1
	lea sfu_p+20,%a2
	move.l %a6,64(%sp)
	move.l %a0,80(%sp)
	move.l %a1,72(%sp)
	clr.l 68(%sp)
	clr.l 60(%sp)
	move.l %d1,76(%sp)
.L322:
	move.l 48(%sp),%a0
	addq.l #1,48(%sp)
	mvz.b (%a0)+,%d0
	move.l %d0,-(%sp)
	jsr lab_of
	addq.l #4,%sp
	move.l #-1057222719,%d1
	move.l %d0,%a5
	sub.l #sfu_x,%d0
	asr.l #1,%d0
	muls.l %d1,%d0
	mov3q.l #1,%d1
	lsl.l %d0,%d1
	move.l %d1,96(%sp)
	tst.l %d7
	jeq .L279
	lea l_fx2,%a0
	move.l %a0,84(%sp)
.L280:
	sub.l %d7,%d0
	moveq #68,%d1
	moveq #48,%d3
	muls.l %d0,%d1
	muls.l %d7,%d3
	move.l 68(%sp),%a3
	clr.l %d2
	move.l 76(%sp),%d6
	add.l #sfu_x+7796,%a3
	move.l 60(%sp),%a4
	add.l #-14,%d6
	add.l #sfu_x+2092,%a4
	move.l %d1,92(%sp)
	move.l %d3,104(%sp)
.L305:
	clr.b (%a3)
	tst.l %a5
	jeq .L281
	sub.l %a0,%a0
	move.w %d2,%d0
	mulu.w #5,%d0
	lea (%a5,%d0.l),%a1
.L282:
	move.b 2(%a1,%a0.l),%d0
	jeq .L283
	move.b %d0,(%a4,%a0.l)
	addq.l #1,%a0
	mov3q.l #4,%d4
	cmp.l %a0,%d4
	jne .L282
.L283:
	clr.b %d5
	move.b %d5,(%a4,%a0.l)
	mvz.w sfu_x+7794,%d0
	and.l 96(%sp),%d0
	tst.l %d0
	jeq .L285
	move.l 92(%sp),%a1
	sub.l %a0,%a0
	lea (-1090,%a1),%a1
	add.l %a3,%a1
.L286:
	move.b (%a1,%a0.l),%d0
	move.b %d0,(%a3,%a0.l)
	jeq .L285
	addq.l #1,%a0
	moveq #17,%d0
	cmp.l %a0,%d0
	jne .L286
.L285:
	moveq #12,%d0
	clr.l %d4
	muls.l %d2,%d0
	lea (22,%a5),%a1
	sub.l %a0,%a0
	clr.l %d1
	add.l 104(%sp),%d0
	add.l #sfu_x,%d0
.L287:
	mvz.b 1(%a5),%d3
	cmp.l %d3,%d1
	jge .L289
	moveq #12,%d3
	cmp.l %d1,%d3
	jne .L290
.L289:
	tst.l %d4
	jeq .L366
	mov3q.l #1,%d5
	cmp.l %a0,%d5
	jge .L366
.L291:
	clr.b %d0
	move.w %a0,%d1
	move.l 56(%sp),%a1
	move.l %a2,100(%sp)
	move.b %d0,16(%a3)
	move.b %d1,(%a1,%d2.l)
	tst.b (%a2)
	jne .L293
	tst.b (%a3)
	jeq .L328
	move.l %a3,%d0
.L294:
	moveq #52,%d1
	muls.l %d6,%d1
	move.l #1075575832,%a6
	move.l %d0,(%a6,%d1.l)
	tst.l %a0
	jeq .L329
	mov3q.l #2,%d0
	cmp.l %a0,%d0
	jne .L330
	lea (22,%a5),%a1
	clr.l %d0
	mvz.b 1(%a5),%d1
	move.l %d1,88(%sp)
	clr.l %d1
.L296:
	cmp.l 88(%sp),%d0
	jge .L303
	moveq #12,%d4
	cmp.l %d0,%d4
	jne .L304
.L303:
	mov3q.l #2,%d5
	cmp.l %d1,%d5
	seq %d1
	mvs.b %d1,%d1
	neg.l %d1
	jra .L301
.L326:
	mov3q.l #1,%d3
	jra .L278
.L268:
	sub.l #sfu_x,%d0
	jmi .L270
	asr.l #1,%d0
	move.l #-1057222719,%d1
	muls.l %d1,%d0
	mvz.w sfu_x+7794,%d1
	btst %d0,%d1
	jeq .L270
	move.b 4(%a5,%d0.l),%d0
	mov3q.l #4,%d4
	mvz.b %d0,%d1
	cmp.l %d1,%d4
	jcc .L270
	subq.l #4,%d0
	move.b %d0,%d1
	mvz.b %d0,%d0
	moveq #8,%d5
	cmp.l %d0,%d5
	scc %d0
	addq.l #3,%d0
	jra .L269
.L324:
	move.l #n_fx1,%d1
	jra .L273
.L275:
	move.b %d0,(%a1)+
	addq.l #1,%a0
	jra .L274
.L272:
	tst.l %d3
	jeq .L325
	move.l #n_fx2,%d0
.L277:
	move.l %d2,%a1
	move.l %d0,(%a1)
	jra .L276
.L325:
	move.l #n_fx1,%d0
	jra .L277
.L337:
	mov3q.l #1,%d7
	jra .L322
.L279:
	lea l_fx1,%a1
	move.l %a1,84(%sp)
	jra .L280
.L290:
	move.b (%a1),%d3
	mov3q.l #3,%d5
	and.l %d3,%d5
	cmp.l %d5,%d2
	jne .L288
	moveq #8,%d5
	and.l %d5,%d3
	lea (%a0,%d0.l),%a6
	addq.l #1,%a0
	move.b 1(%a1),2468(%a6)
	or.l %d3,%d4
.L288:
	addq.l #1,%d1
	lea (9,%a1),%a1
	jra .L287
.L281:
	clr.b %d4
	move.l %d2,%d0
	add.l #50,%d0
	move.b #80,(%a4)
	move.b %d0,1(%a4)
	move.b %d4,2(%a4)
.L366:
	sub.l %a0,%a0
	jra .L291
.L328:
	move.l 84(%sp),%d0
	jra .L294
.L304:
	move.b (%a1),%d3
	mov3q.l #3,%d4
	and.l %d4,%d3
	cmp.l %d3,%d2
	jne .L297
	lea (3,%a1),%a6
	move.l %a6,52(%sp)
	tst.l %d1
	jeq .L331
	lea .LC0,%a6
.L367:
	move.l %a6,44(%sp)
	clr.l %d5
.L300:
	move.l 44(%sp),%a6
	move.b (%a6,%d5.l),%d4
	move.l 52(%sp),%a6
	move.b (%a6,%d5.l),%d3
	tst.b %d4
	jeq .L299
	mvs.b %d4,%d4
	mvs.b %d3,%d3
	addq.l #1,%d5
	cmp.l %d4,%d3
	jeq .L300
.L302:
	clr.l %d1
.L301:
	addq.l #1,%d1
.L295:
	move.l %a0,-(%sp)
	move.l %d1,-(%sp)
	move.l %d6,-(%sp)
	jsr set_look
	lea (12,%sp),%sp
.L293:
	addq.l #1,%d2
	lea (17,%a3),%a3
	addq.l #1,%d6
	addq.l #5,%a4
	mov3q.l #4,%d0
	cmp.l %d2,%d0
	jne .L305
	move.l 48(%sp),%a0
	addq.l #1,%a2
	move.l 100(%sp),%a1
	move.b -1(%a0),%d0
	move.b %d0,1(%a0)
	tst.b (%a1)
	jeq .L306
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	jsr lab_of
	addq.l #4,%sp
	tst.l %d0
	jeq .L332
	sub.l #sfu_x,%d0
	move.l %d0,%d6
	asr.l #1,%d6
	move.l #-1057222719,%d1
	muls.l %d1,%d6
	tst.l %d0
	jlt .L333
	mvz.w sfu_x+7794,%d3
	mov3q.l #1,%d4
	asr.l %d6,%d3
	and.l %d3,%d4
	move.l %d4,96(%sp)
.L307:
	move.l %d7,%d5
	move.l %d7,%d0
	lsl.l #2,%d5
	add.l %d0,%d0
	move.l 72(%sp),%a3
	move.l 80(%sp),%a4
	move.l 64(%sp),92(%sp)
	move.l %d5,88(%sp)
	move.l %d0,%a5
	clr.l %d5
	subq.l #5,%a5
.L321:
	mov3q.l #5,%d0
	cmp.l %d5,%d0
	jlt .L334
	move.l 88(%sp),%a0
	lea 21(%a5,%a0.l),%a0
	move.l %a0,%d4
.L308:
	mvz.b -1(%a2),%d0
	clr.b (%a4)
	clr.b (%a3)
	move.l %d4,52(%sp)
	subq.l #1,%d0
	lsl.l #3,%d0
	move.l %d0,%d2
	add.l %d5,%d2
	move.w %d4,%d0
	mulu.w #52,%d0
	move.l %d0,%a1
	add.l #1075575064,%a1
	tst.l 96(%sp)
	jeq .L309
	mvz.b 3(%a2),%d0
	cmp.l %d2,%d0
	jle .L310
	tst.l sfu_p
	jeq .L312
	move.l %d2,%a0
	moveq #60,%d1
	lea (%a0,%d2.l*4),%a6
	muls.l %d6,%d1
	clr.l %d0
	add.l %d1,%a6
.L311:
	move.l sfu_p,%d1
	lea (%a6,%d1.l),%a0
	move.b (%a0,%d0.l),%d1
	jeq .L313
	move.b %d1,(%a3,%d0.l)
	addq.l #1,%d0
	mov3q.l #4,%d1
	cmp.l %d0,%d1
	jne .L311
.L313:
	clr.b %d1
	sub.l %a0,%a0
	move.b %d1,(%a3,%d0.l)
	move.l %d2,%d0
	lsl.l #4,%d0
	move.l %d0,%d1
	add.l %d2,%d1
	mvz.w #204,%d0
	muls.l %d6,%d0
	add.l %d0,%d1
.L315:
	move.l sfu_p,%d0
	add.l %d1,%d0
	lea (%a0,%d0.l),%a6
	move.b 960(%a6),%d0
	jeq .L316
	move.b %d0,(%a4,%a0.l)
	addq.l #1,%a0
	moveq #16,%d3
	cmp.l %a0,%d3
	jne .L315
.L316:
	clr.b %d0
	move.b %d0,(%a4,%a0.l)
.L309:
	mvz.b 3(%a2),%d0
	cmp.l %d2,%d0
	jle .L310
	tst.b (%a3)
	jne .L310
.L312:
	move.l %d2,%a0
	addq.l #5,%a0
	move.l %a0,%d1
	moveq #10,%d3
	rems.l %d3,%d0:%d1
	divs.l %d3,%d1
	move.b #80,(%a3)
	move.l %d1,%a6
	move.l %d0,%d1
	add.l #48,%d1
	move.b %d1,2(%a3)
	clr.b %d1
	move.l %a6,%d0
	add.l #48,%d0
	move.b %d0,1(%a3)
	move.b %d1,3(%a3)
.L310:
	move.l %a3,48(%a1)
	tst.b (%a4)
	jeq .L336
	move.l %a4,%d0
.L318:
	mvz.w #32512,%d3
	move.l %d0,40(%a1)
	clr.l 16(%a1)
	mov3q.l #5,%d0
	move.l %d3,12(%a1)
	cmp.l %d5,%d0
	jlt .L319
	clr.l -(%sp)
	move.l %d4,%a0
	clr.l -(%sp)
	mulu.w #84,%d4
	pea -14(%a0)
	jsr set_look
	lea sfu_x+2136,%a6
	lea (12,%sp),%sp
	move.l #1100630184,%a1
	move.l (%a6),(%a1,%d4.l)
.L319:
	mvz.b 3(%a2),%d0
	cmp.l %d2,%d0
	jgt .L320
	clr.l 52(%sp)
.L320:
	move.l 92(%sp),%a0
	addq.l #1,%d5
	addq.l #4,92(%sp)
	lea (17,%a4),%a4
	addq.l #5,%a3
	addq.l #1,%a5
	move.l 52(%sp),(%a0)+
	moveq #8,%d0
	cmp.l %d5,%d0
	jne .L321
.L306:
	mvz.w #136,%d5
	moveq #20,%d1
	moveq #68,%d3
	moveq #36,%d4
	moveq #40,%d0
	addq.l #4,56(%sp)
	addq.l #6,76(%sp)
	add.l %d1,60(%sp)
	add.l %d3,68(%sp)
	subq.l #1,%d7
	add.l %d4,64(%sp)
	add.l %d5,80(%sp)
	add.l %d0,72(%sp)
	tst.l %d7
	jne .L337
	movem.l (%sp),#31996
	addq.l #1,sfu_x+2160
	lea (108,%sp),%sp
	rts
.L331:
	lea .LC1,%a6
	jra .L367
.L299:
	tst.b %d3
	jne .L302
	addq.l #1,%d1
	mov3q.l #2,%d3
	cmp.l %d1,%d3
	jlt .L302
.L297:
	addq.l #1,%d0
	lea (9,%a1),%a1
	jra .L296
.L329:
	clr.l %d1
	jra .L295
.L330:
	mov3q.l #1,%d1
	jra .L295
.L332:
	mov3q.l #-1,%d6
.L333:
	clr.l 96(%sp)
	jra .L307
.L334:
	move.l %a5,%d4
	jra .L308
.L336:
	move.l 84(%sp),%d0
	jra .L318
	.size	relabel, .-relabel
	.align	2
	.globl	sfu_draw
	.type	sfu_draw, @function
sfu_draw:
	move.l -66650100,%d1
	lea (-40,%sp),%sp
	movem.l #16396,(%sp)
	move.l 44(%sp),%d0
	add.l #-1100630188,%d0
	move.l %d1,12(%sp)
	moveq #84,%d3
	move.l %d0,%d1
	divu.l %d3,%d1
	clr.b %d2
	move.l 48(%sp),%a0
	moveq #126,%d3
	lea (16,%sp),%a6
	move.l %d1,%a1
	lea (-334,%a1),%a1
	move.b %d2,16(%sp)
	cmp.l %a1,%d3
	jcs .L369
	moveq #84,%d0
	muls.l %d0,%d1
	move.l %a6,-(%sp)
	move.l %a0,-(%sp)
	add.l #1100630172,%d1
	move.l %d1,-(%sp)
	jsr xname
.L375:
	lea (12,%sp),%sp
.L370:
	clr.b %d0
	move.b %d0,24(%sp)
	tst.b 16(%sp)
	jeq .L374
	move.l %a6,%d2
.L373:
	move.l #1098791068,-(%sp)
	jsr 1074207612
	move.l %a6,-(%sp)
	pea fmt_s
	move.l %d2,-(%sp)
	clr.l -(%sp)
	mov3q.l #1,-(%sp)
	move.l 84(%sp),%d1
	subq.l #2,%d1
	move.l %d1,-(%sp)
	move.l 84(%sp),-(%sp)
	move.l %d0,-(%sp)
	move.l 88(%sp),-(%sp)
	jsr 1074205920
	lea (36,%sp),%sp
	clr.l (%sp)
	move.l 16(%sp),-(%sp)
	jsr timed
	movem.l 8(%sp),#16396
	clr.l %d0
	lea (48,%sp),%sp
	rts
.L369:
	add.l #-16,%d1
	moveq #11,%d2
	cmp.l %d1,%d2
	jcs .L370
	mov3q.l #6,%d3
	rems.l %d3,%d2:%d1
	cmp.l #1847,%d0
	shi %d0
	move.l %d2,%a1
	mvs.b %d0,%d0
	neg.l %d0
	tst.l %d2
	jne .L371
	move.l %a6,-(%sp)
	move.l %a0,-(%sp)
	move.l %d0,-(%sp)
	jsr type_text
	jra .L375
.L371:
	mov3q.l #1,%d3
	cmp.l %d2,%d3
	jne .L372
	move.l %a6,-(%sp)
	move.l %a0,-(%sp)
	clr.l -(%sp)
	jsr sfu_route_text
	jra .L375
.L372:
	move.l %a6,-(%sp)
	move.l %a0,-(%sp)
	clr.l -(%sp)
	pea -2(%a1)
	move.l %d0,-(%sp)
	jsr ptext
	lea (20,%sp),%sp
	jra .L370
.L374:
	move.l #s_wide,%d2
	jra .L373
	.size	sfu_draw, .-sfu_draw
	.align	2
	.type	listed, @function
listed:
	lea (-12,%sp),%sp
	movem.l #1036,(%sp)
	move.l 16(%sp),%a1
	tst.l 20(%sp)
	jeq .L377
	move.l 28(%a1),%a0
	moveq #16,%d3
	clr.l %d2
	clr.l %d0
	lea (20,%a1),%a1
.L378:
	tst.l %a0
	jeq .L385
	cmp.l %a0,%a1
	jeq .L385
	move.l 8(%a0),%a2
	tst.l %a2
	jne .L379
.L377:
	clr.l %d0
.L376:
	movem.l (%sp),#1036
	lea (12,%sp),%sp
	rts
.L379:
	move.l (%a2),%d1
	tst.l %d0
	jeq .L381
	cmp.l #1075718412,%d1
	jeq .L383
	cmp.l #1075712228,%d1
	jeq .L383
	cmp.l #1075719596,%d1
	jeq .L383
	cmp.l #1075717140,%d1
	jne .L377
.L383:
	move.l (%a0),%a0
	subq.l #1,%d3
	tst.l %d3
	jne .L378
.L385:
	and.l %d2,%d0
	jra .L376
.L381:
	cmp.l #1076055292,%d1
	jeq .L388
	cmp.l 20(%sp),%a2
	jne .L383
	cmp.l 24(%sp),%d1
	seq %d1
	mvs.b %d1,%d1
	neg.l %d1
	or.l %d1,%d2
	jra .L383
.L388:
	mov3q.l #1,%d0
	jra .L383
	.size	listed, .-listed
	.align	2
	.type	retitle, @function
retitle:
	link.w %fp,#-8
	move.l 12(%fp),%d0
	move.l %a2,-(%sp)
	move.l 8(%fp),%a2
	clr.l -4(%fp)
	tst.l %d0
	jne .L408
	move.l (%a2),%a0
	move.l %a2,-(%sp)
	move.l 76(%a0),%a0
	jsr (%a0)
	addq.l #4,%sp
.L408:
	pea -5(%fp)
	move.l %d0,-(%sp)
	pea -4(%fp)
	jsr 1075563852
	pea -4(%fp)
	move.l 108(%a2),-(%sp)
	jsr 1073962984
	pea -4(%fp)
	jsr 1075557020
	lea (24,%sp),%sp
	move.l -12(%fp),%a2
	addq.l #1,sfu_p+90
	unlk %fp
	rts
	.size	retitle, .-retitle
	.align	2
	.type	pq, @function
pq:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	moveq #11,%d2
	move.l 12(%sp),%d0
	move.l %d0,%d1
	add.l #-16,%d1
	cmp.l %d1,%d2
	jcs .L410
	moveq #21,%d3
	mov3q.l #6,%d2
	cmp.l %d0,%d3
	slt %d0
	mvs.b %d0,%d0
	neg.l %d0
	move.l %d0,%a0
	move.l %d1,%d0
	rems.l %d2,%d3:%d0
	move.l %d3,%d1
.L411:
	move.l 16(%sp),%a1
	move.l %a0,(%a1)
	lea sfu_p,%a1
	move.b 20(%a1,%a0.l),%d0
	jeq .L414
	mvz.b %d0,%d0
	subq.l #1,%d0
	lsl.l #3,%d0
	add.l %d1,%d0
	mvz.b 24(%a1,%a0.l),%d1
	cmp.l %d1,%d0
	jlt .L409
	moveq #-2,%d0
	jra .L409
.L410:
	subq.l #1,%d0
	mov3q.l #3,%d1
	cmp.l %d0,%d1
	jcc .L412
.L414:
	mov3q.l #-1,%d0
.L409:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L412:
	move.l %d0,%d2
	mov3q.l #1,%d3
	and.l %d3,%d0
	asr.l #1,%d2
	move.l %d2,%a0
	move.l %d0,%d1
	addq.l #6,%d1
	jra .L411
	.size	pq, .-pq
	.align	2
	.type	try_send, @function
try_send:
	mov3q.l #1,%d0
	cmp.l 1094562388.l,%d0
	jeq .L420
.L426:
	clr.l %d0
.L419:
	rts
.L420:
	move.l #1123449384,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L422
	addq.l #1,sfu_x+2156
	jra .L419
.L422:
	mvz.w #4027,%d0
	cmp.l 1094562392.l,%d0
	jlt .L423
	move.l 1094562704,%a0
	mov3q.l #4,%d0
.L424:
	tst.l %a0
	jeq .L423
	move.l 52(%a0),%a0
	subq.l #1,%d0
	tst.l %d0
	jne .L424
	move.l 4(%sp),-(%sp)
	move.l 12(%sp),-(%sp)
	jsr 1073752544
	move.l #1123449384,-(%sp)
	jsr 1073746414
	lea (12,%sp),%sp
	mov3q.l #1,%d0
	jra .L419
.L423:
	move.l #1123449384,-(%sp)
	jsr 1073746414
	addq.l #1,sfu_x+2156
	addq.l #4,%sp
	jra .L426
	.size	try_send, .-try_send
	.align	2
	.type	lk_put, @function
lk_put:
	lea (-12,%sp),%sp
	movem.l #28,(%sp)
	move.l 20(%sp),%d2
	move.l %d2,%d1
	and.l #-2147450880,%d1
	move.l 24(%sp),%a0
	tst.l %d1
	jne .L441
	move.l %d2,%d3
	mov3q.l #1,%d0
	mvz.w %d3,%d3
	and.l %d2,%d0
	move.l %d3,%d4
	asr.l #8,%d4
	move.l %d4,%a1
	btst #0,%d2
	jne .L434
	asr.l #1,%d3
	moveq #127,%d0
	move.l %d4,%d1
	and.l %d3,%d0
	move.l %d0,%a1
	mov3q.l #3,%d0
.L433:
	mov3q.l #1,%d3
	and.l 16(%sp),%d3
	move.l %d3,%d2
	addq.l #1,%d2
	tst.l %a0
	jge .L435
	not.l %d2
	and.l %d0,%d2
	move.l %a1,%d0
.L436:
	mov3q.l #1,%d4
	cmp.l %d2,%d4
	jne .L440
	lsl.l #8,%d1
	mov3q.l #1,%d0
	jra .L444
.L434:
	btst #1,%d2
	jne .L442
	move.l %d4,%d1
	sub.l %a1,%a1
	jra .L433
.L441:
	sub.l %a1,%a1
	clr.l %d1
	clr.l %d0
	jra .L433
.L442:
	mov3q.l #2,%d0
	jra .L433
.L435:
	or.l %d0,%d2
	move.l %a0,%d0
	cmp.l #32512,%a0
	jle .L437
	mvz.w #32512,%d0
.L437:
	asr.l #8,%d0
	tst.l %d3
	jne .L438
	move.l %d0,%d1
	move.l %a1,%d0
.L438:
	mov3q.l #3,%d3
	cmp.l %d2,%d3
	jne .L436
	lsl.l #8,%d1
	add.l %d0,%d0
.L444:
	or.l %d1,%d0
.L432:
	movem.l (%sp),#28
	lea (12,%sp),%sp
	rts
.L440:
	subq.l #2,%d2
	tst.l %d2
	jne .L443
	lsl.l #8,%d0
	mov3q.l #3,%d3
	or.l %d3,%d0
	jra .L432
.L443:
	mov3q.l #-1,%d0
	jra .L432
	.size	lk_put, .-lk_put
	.align	2
	.globl	sfu_sysex
	.type	sfu_sysex, @function
sfu_sysex:
	lea (-52,%sp),%sp
	move.l -66650100,%d0
	move.l 60(%sp),%d1
	movem.l #31996,(%sp)
	move.l 56(%sp),%a0
	moveq #10,%d2
	move.l %d0,44(%sp)
	cmp.l %d1,%d2
	jge .L446
	mvz.b 4(%a0),%d0
	moveq #34,%d3
	cmp.l %d0,%d3
	jne .L447
	mvz.b 5(%a0),%d0
	subq.l #3,%d0
	tst.l %d0
	jne .L448
	mvz.b 6(%a0),%d2
	mov3q.l #1,%d5
	cmp.l %d2,%d5
	jcs .L447
	mvz.b 7(%a0),%d3
	mov3q.l #4,%d6
	cmp.l %d3,%d6
	jcc .L447
	move.b 8(%a0),%d0
	jeq .L447
	mvz.b %d0,%d0
	moveq #17,%d4
	add.l %d0,%d3
	cmp.l %d3,%d4
	jlt .L447
	add.l #9,%d0
	cmp.l %d1,%d0
	jge .L447
	lea sfu_p,%a2
	tst.w 50(%a2,%d2.l*2)
	jne .L449
	move.l 62(%a2,%d2.l*4),%d0
	tst.l %d0
	jeq .L521
	move.l -66650100,%d1
	sub.l %d0,%d1
	cmp.l #65999999,%d1
	jhi .L521
.L449:
	addq.l #1,sfu_p+74
.L454:
	mov3q.l #1,-(%sp)
	move.l 48(%sp),-(%sp)
	jsr timed
	movem.l 8(%sp),#31996
	mov3q.l #1,%d0
	lea (60,%sp),%sp
	rts
.L453:
	move.b 9(%a0,%a1.l),%d0
	mvz.b 7(%a0),%d3
	moveq #127,%d2
	lea -5(%a1,%d3.l),%a3
	and.l %d0,%d2
	mvz.b 26(%a2,%a3.l),%d3
	cmp.l %d2,%d3
	jeq .L451
	move.b %d2,26(%a2,%a3.l)
	mov3q.l #1,%d1
.L451:
	addq.l #1,%a1
.L452:
	mvz.b 8(%a0),%d0
	cmp.l %a1,%d0
	jgt .L453
	tst.l %d1
	jeq .L449
	moveq #1,%d0
	move.b %d0,sfu_p+54
	jra .L449
.L521:
	moveq #12,%d6
	clr.l %d1
	muls.l %d6,%d2
	sub.l %a1,%a1
	add.l %d2,%a2
	jra .L452
.L446:
	moveq #10,%d2
	cmp.l %d1,%d2
	jne .L455
	mvz.b 4(%a0),%d0
	moveq #34,%d3
	cmp.l %d0,%d3
	jne .L447
.L448:
	mvz.b 5(%a0),%d0
	subq.l #2,%d0
	tst.l %d0
	jne .L447
	mvz.b 6(%a0),%d0
	mov3q.l #1,%d5
	cmp.l %d0,%d5
	jcs .L454
	mvz.b sfu_x+6688,%d1
	lea sfu_x,%a1
	btst %d0,%d1
	jne .L456
	lea (%a1,%d0.l*4),%a2
	move.l 6698(%a2),%d1
	tst.l %d1
	jeq .L457
	move.l -66650100,%d2
	sub.l %d1,%d2
	cmp.l #65999999,%d2
	jls .L456
.L457:
	move.b 7(%a0),%d1
	moveq #127,%d3
	moveq #127,%d6
	move.l %d0,%d2
	add.l #3342,%d2
	mvz.b (%a1,%d2.l*2),%d4
	and.l %d1,%d3
	cmp.l %d4,%d3
	jne .L458
	lea (%a1,%d0.l*2),%a2
	move.b 8(%a0),%d0
	mvz.b 6685(%a2),%d1
	and.l %d6,%d0
	cmp.l %d1,%d0
	jeq .L456
.L458:
	move.b %d3,(%a1,%d2.l*2)
	moveq #127,%d1
	moveq #1,%d2
	mvz.b 6(%a0),%d0
	lea (%a1,%d0.l*2),%a1
	move.b 8(%a0),%d0
	move.b %d2,sfu_x+6689
	and.l %d1,%d0
	move.b %d0,6685(%a1)
.L456:
	addq.l #1,sfu_x+6694
	jra .L454
.L455:
	mov3q.l #7,%d3
	cmp.l %d1,%d3
	jge .L454
.L447:
	mvz.b 5(%a0),%d0
	subq.l #1,%d0
	tst.l %d0
	jne .L454
	mvz.b 4(%a0),%d0
	moveq #33,%d5
	cmp.l %d0,%d5
	jne .L459
	addq.l #1,sfu_x+2320
	tst.b 6(%a0)
	jeq .L460
	clr.b %d6
	mov3q.l #1,sfu_x+2316
	lea sfu_st,%a1
	clr.l %d0
	move.b %d6,sfu_x+2188
.L461:
	clr.b (%a1)
	addq.l #1,%d0
	addq.l #8,%a1
	cmp.l #128,%d0
	jne .L461
	lea sfu_x,%a1
	clr.l %d0
.L462:
	clr.b (%a1)
	addq.l #1,%d0
	lea (130,%a1),%a1
	moveq #16,%d2
	cmp.l %d0,%d2
	jne .L462
	move.l #1330005504,%d3
	addq.l #1,sfu_x+2080
	move.l %d3,sfu_st
.L460:
	subq.l #1,%d1
	addq.l #8,%a0
	moveq #9,%d3
	lea sfu_st,%a3
	lea sfu_x+2188,%a4
.L463:
	move.l %d3,%d0
	add.l #12,%d0
	cmp.l %d1,%d0
	jlt .L472
	moveq #2,%d0
	addq.l #1,sfu_x+2596
	addq.l #1,sfu_x+2320
	move.b %d0,sfu_st+1027
	jra .L454
.L472:
	move.b (%a0),%d2
	jmi .L464
	move.b %d2,%d0
	sub.l %a2,%a2
	ext.w %d0
	mvz.w %d0,%d0
	lsl.l #3,%d0
	move.l %d0,%a1
	add.l #sfu_st,%a1
.L468:
	move.b 1(%a0,%a2.l),%d0
	moveq #94,%d5
	move.l %d0,%d4
	add.l #-32,%d4
	mvz.b %d4,%d4
	cmp.l %d4,%d5
	jcs .L465
	move.b %d0,(%a1,%a2.l)
.L466:
	addq.l #1,%a2
	mov3q.l #7,%d0
	cmp.l %a2,%d0
	jne .L468
	jra .L467
.L465:
	clr.b %d6
	move.b %d6,(%a1,%a2.l)
	tst.b %d0
	jne .L466
.L467:
	mvz.b %d2,%d4
	clr.b %d5
	sub.l %a1,%a1
	move.l %d4,%d0
	lsl.l #3,%d0
	move.b %d5,7(%a3,%d0.l)
	move.l sfu_x+2316,%d0
.L469:
	cmp.l %a1,%d0
	jle .L470
	mvz.b (%a4,%a1.l),%d5
	cmp.l %d4,%d5
	jne .L471
.L470:
	cmp.l %d0,%a1
	jne .L464
	cmp.l #128,%d0
	jeq .L464
	move.l %d0,%d6
	add.l #sfu_x,%d0
	move.l %d0,%a1
	addq.l #1,%d6
	move.b %d2,2188(%a1)
	move.l %d6,sfu_x+2316
.L464:
	lea (14,%a0),%a0
	add.l #14,%d3
	jra .L463
.L471:
	addq.l #1,%a1
	jra .L469
.L459:
	moveq #36,%d2
	cmp.l %d0,%d2
	jne .L473
	moveq #23,%d3
	cmp.l %d1,%d3
	jge .L474
	mov3q.l #7,%d0
	and.l %d1,%d0
	tst.l %d0
	jne .L474
	move.b 6(%a0),%d2
	moveq #127,%d4
	mvz.b %d2,%d0
	cmp.l %d0,%d4
	jge .L475
.L474:
	addq.l #1,sfu_x+2144
	jra .L454
.L475:
	lea sfu_x,%a2
	addq.l #1,%d0
	move.l %a2,%a3
	clr.l %d3
.L478:
	mvz.b (%a3),%d4
	move.l %a3,%a1
	cmp.l %d4,%d0
	jeq .L476
	sub.l %a1,%a1
.L476:
	addq.l #1,%d3
	moveq #16,%d5
	cmp.l %d3,%d5
	jeq .L523
	lea (130,%a3),%a3
	tst.l %a1
	jeq .L478
.L523:
	clr.l %d0
.L480:
	tst.l %a1
	jeq .L482
.L483:
	move.l %a1,%d3
	sub.l #sfu_x,%d3
	asr.l #1,%d3
	clr.b (%a1)
	move.l #-1057222719,%d0
	sub.l %a3,%a3
	lea sfu_p,%a2
	muls.l %d0,%d3
	mov3q.l #1,%d0
	move.l %a1,%a4
	lsl.l %d3,%d0
	move.w sfu_x+7794,%d4
	not.l %d0
	and.l %d4,%d0
	clr.b %d4
	move.w %d0,sfu_x+7794
	move.b %d4,4(%a2,%d3.l)
.L484:
	mvz.w %a3,%d0
	lea (%a0,%d0.l*4),%a2
	move.l %a2,%d4
	sub.l %a2,%a2
.L486:
	move.b 7(%a2,%d4.l),%d3
	moveq #94,%d5
	move.l %d3,%d0
	add.l #-32,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d5
	jcs .L485
	move.b %d3,2(%a4,%a2.l)
	addq.l #1,%a2
	mov3q.l #4,%d6
	cmp.l %a2,%d6
	jne .L486
.L485:
	lea (%a3,%a3.l*4),%a5
	clr.b %d3
	addq.l #1,%a3
	addq.l #5,%a4
	mov3q.l #4,%d4
	move.l %a5,%d0
	add.l %a1,%d0
	move.b %d3,2(%a2,%d0.l)
	cmp.l %a3,%d4
	jne .L484
	moveq #127,%d0
	cmp.l %d1,%d0
	jlt .L524
	asr.l #3,%d1
	subq.l #3,%d1
.L488:
	lea (23,%a0),%a0
	clr.l %d0
	lea (22,%a1),%a2
.L489:
	cmp.l %d0,%d1
	jne .L492
	addq.l #1,%d2
	move.b %d0,1(%a1)
	move.b %d2,(%a1)
	addq.l #1,sfu_x+2148
.L576:
	addq.l #1,sfu_x+2080
	jra .L454
.L482:
	tst.b (%a2)
	jne .L479
	move.l %a2,%a1
.L479:
	addq.l #1,%d0
	lea (130,%a2),%a2
	moveq #16,%d6
	cmp.l %d0,%d6
	jne .L480
	tst.l %a1
	jne .L483
	jra .L474
.L524:
	moveq #12,%d1
	jra .L488
.L492:
	move.b (%a0),%d3
	moveq #15,%d4
	moveq #127,%d5
	sub.l %a3,%a3
	lea (-22,%a2),%a4
	and.l %d4,%d3
	move.b %d3,(%a2)
	move.b 1(%a0),%d3
	and.l %d5,%d3
	move.b %d3,1(%a2)
	move.b 2(%a0),%d3
	and.l %d5,%d3
	move.b %d3,2(%a2)
.L491:
	move.b 3(%a0,%a3.l),%d4
	moveq #94,%d6
	move.l %d4,%d3
	add.l #-32,%d3
	mvz.b %d3,%d3
	cmp.l %d3,%d6
	jcs .L490
	move.b %d4,25(%a4,%a3.l)
	addq.l #1,%a3
	mov3q.l #5,%d3
	cmp.l %a3,%d3
	jne .L491
.L490:
	move.l %d0,%d3
	addq.l #8,%a0
	lsl.l #3,%d3
	clr.b %d4
	lea (9,%a2),%a2
	move.l %d3,%a4
	add.l %d0,%a4
	add.l %a1,%a4
	move.b %d4,25(%a3,%a4.l)
	addq.l #1,%d0
	jra .L489
.L473:
	moveq #81,%d5
	cmp.l %d0,%d5
	jne .L493
	moveq #9,%d6
	cmp.l %d1,%d6
	jge .L494
	mvz.b 6(%a0),%d3
	moveq #127,%d0
	cmp.l %d3,%d0
	jlt .L494
	move.b 7(%a0),%d0
	jeq .L494
	move.b 8(%a0),%d2
	move.l %d2,%d4
	subq.l #1,%d4
	mvz.b %d4,%d4
	lsr.l #2,%d4
	jne .L494
	mvz.b %d2,%d6
	ext.w %d2
	move.l %d6,48(%sp)
	muls.w #20,%d2
	add.l #9,%d2
	cmp.l %d1,%d2
	jlt .L495
.L494:
	addq.l #1,sfu_x+7936
	jra .L454
.L495:
	addq.l #1,%d3
	lea sfu_x,%a1
	clr.l %d2
.L498:
	mvz.b (%a1),%d4
	move.l %a1,%d1
	cmp.l %d4,%d3
	jeq .L496
	clr.l %d1
.L496:
	addq.l #1,%d2
	moveq #16,%d4
	cmp.l %d2,%d4
	jeq .L497
	lea (130,%a1),%a1
	tst.l %d1
	jeq .L498
.L499:
	sub.l #sfu_x,%d1
	asr.l #1,%d1
	move.l #-1057222719,%d4
	mov3q.l #1,%d2
	move.w sfu_x+7794,%d5
	move.l #-925069876,%d6
	muls.l %d1,%d4
	muls.l %d1,%d6
	mvz.b %d0,%d0
	lea (13,%a0),%a0
	lea sfu_p,%a3
	subq.l #1,%d0
	lsl.l %d4,%d2
	move.l %d6,%a6
	lea (892,%a6),%a6
	move.l %d2,%d3
	not.l %d3
	and.l %d5,%d3
	move.l #1123299140,%d5
	muls.l %d1,%d5
	move.l %d5,%a5
	move.l #991146300,%d5
	muls.l %d5,%d1
	move.w %d3,sfu_x+7794
	clr.l %d3
	add.l #sfu_x+6706,%a5
.L513:
	moveq #15,%d6
	cmp.l %d0,%d6
	jlt .L500
	mov3q.l #3,%d5
	cmp.l %d0,%d5
	jge .L501
	move.l (%a3),%a1
	tst.l %a1
	jne .L575
.L500:
	move.w sfu_x+7794,%d0
	addq.l #1,sfu_x+7932
	or.l %d0,%d2
	move.w %d2,sfu_x+7794
	jra .L576
.L497:
	tst.l %d1
	jne .L499
	jra .L494
.L501:
	move.l %d0,%d7
	lsl.l #4,%d7
	move.l %d7,%a1
	add.l %d0,%a1
	add.l %a5,%a1
.L503:
	sub.l %a2,%a2
.L505:
	move.b (%a0,%a2.l),%d7
	moveq #94,%d6
	move.l %d7,%d5
	add.l #-32,%d5
	mvz.b %d5,%d5
	cmp.l %d5,%d6
	jcs .L506
	move.b %d7,(%a1,%a2.l)
	addq.l #1,%a2
	moveq #16,%d5
	cmp.l %a2,%d5
	jne .L505
.L506:
	tst.l %a2
	jeq .L526
	mvs.b -1(%a1,%a2.l),%d5
	move.l %a2,%d7
	moveq #32,%d6
	cmp.l %d5,%d6
	jeq .L508
.L507:
	clr.b %d5
	mov3q.l #3,%d6
	move.b %d5,(%a1,%d7.l)
	cmp.l %d0,%d6
	jge .L509
	move.l %d0,%a1
	subq.l #4,%a1
	move.l %a1,%d5
	mov3q.l #5,%d6
	muls.l %d6,%d5
	sub.l %a2,%a2
	move.l %d5,%a1
	lea (%a1,%d1.l),%a4
.L511:
	move.b -4(%a0,%a2.l),%d5
	moveq #94,%d6
	move.l %d5,%d7
	add.l #-32,%d7
	mvz.b %d7,%d7
	cmp.l %d7,%d6
	jcs .L510
	move.l (%a3),%d7
	add.l %a4,%d7
	move.b %d5,(%a2,%d7.l)
	addq.l #1,%a2
	mov3q.l #4,%d5
	cmp.l %a2,%d5
	jne .L511
.L510:
	clr.b %d6
	add.l %d1,%a1
	add.l (%a3),%a1
	move.b %d6,(%a1,%a2.l)
.L509:
	mvz.b 4(%a3,%d4.l),%d5
	move.l %d0,%d7
	addq.l #1,%d7
	cmp.l %d5,%d0
	jlt .L512
	move.b %d7,4(%a3,%d4.l)
.L512:
	addq.l #1,%d3
	move.l %d7,%d0
	lea (20,%a0),%a0
	cmp.l 48(%sp),%d3
	jlt .L513
	jra .L500
.L575:
	move.l %d0,%d7
	lsl.l #4,%d7
	add.l %d0,%d7
	add.l %a6,%d7
	add.l %d7,%a1
	jra .L503
.L508:
	subq.l #1,%a2
	jra .L506
.L526:
	clr.l %d7
	jra .L507
.L493:
	moveq #34,%d6
	cmp.l %d0,%d6
	jne .L454
	moveq #8,%d0
	cmp.l %d1,%d0
	jeq .L454
	mvz.b 6(%a0),%d2
	mov3q.l #1,%d3
	cmp.l %d2,%d3
	jcs .L454
	mvz.b 8(%a0),%d3
	move.b 7(%a0),%d0
	subq.l #3,%d3
	tst.l %d3
	jne .L527
	move.b %d0,%d3
.L514:
	lea sfu_st,%a3
	lea (%a3,%d2.l),%a1
	move.b %d3,1024(%a1)
	mvz.b 8(%a0),%d2
	subq.l #3,%d2
	tst.l %d2
	jne .L454
	tst.b %d0
	jlt .L454
	mvz.b %d0,%d2
	lsl.l #3,%d2
	tst.b (%a3,%d2.l)
	jne .L454
	ext.w %d0
	subq.l #1,%d1
	sub.l %a2,%a2
	mvz.w %d0,%d0
	lsl.l #3,%d0
	lea (%a3,%d0.l),%a1
	moveq #9,%d0
.L515:
	cmp.l %d1,%d0
	jge .L517
	move.b (%a0,%d0.l),%d4
	moveq #94,%d6
	move.l %d4,%d3
	add.l #-32,%d3
	mvz.b %d3,%d3
	cmp.l %d3,%d6
	jcs .L517
	move.b %d4,(%a1,%a2.l)
	addq.l #1,%a2
	addq.l #1,%d0
	mov3q.l #7,%d3
	cmp.l %a2,%d3
	jne .L515
.L517:
	clr.b %d4
	add.l %d2,%a3
	move.b %d4,(%a3,%a2.l)
	jra .L454
.L527:
	st %d3
	jra .L514
	.size	sfu_sysex, .-sfu_sysex
	.align	2
	.type	lk_half, @function
lk_half:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 16(%sp),%d2
	move.l %d2,%d0
	and.l #32768,%d0
	tst.w %d2
	jmi .L582
	move.l %d2,%d1
	mov3q.l #1,%d3
	mvz.w %d1,%d1
	and.l %d2,%d3
	move.l %d1,%a1
	asr.l #8,%d1
	move.l %d3,%a0
	btst #0,%d2
	jne .L579
	move.l %a1,%d2
	asr.l #1,%d2
	move.l %d1,%d0
	moveq #127,%d1
	mov3q.l #3,%a0
	and.l %d2,%d1
.L578:
	mov3q.l #1,%d2
	and.l 12(%sp),%d2
	move.l %a0,%d3
	move.l %d2,%a1
	addq.l #1,%d2
	and.l %d3,%d2
	tst.l %d2
	jeq .L584
	tst.l %a1
	jeq .L581
	move.l %d1,%d0
.L581:
	lsl.l #8,%d0
.L577:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L579:
	btst #1,%d2
	jne .L583
	move.l %d1,%d0
	clr.l %d1
	jra .L578
.L582:
	clr.l %d1
	clr.l %d0
	sub.l %a0,%a0
	jra .L578
.L583:
	mov3q.l #2,%a0
	jra .L578
.L584:
	mov3q.l #-1,%d0
	jra .L577
	.size	lk_half, .-lk_half
	.align	2
	.type	sync, @function
sync:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	pea 16.w
	move.l 16(%sp),-(%sp)
	jsr 1074433680
	pea 22.w
	move.l 24(%sp),-(%sp)
	move.l %d0,%d3
	asr.l #8,%d3
	moveq #127,%d0
	and.l %d0,%d3
	jsr 1074433680
	lea (16,%sp),%sp
	move.l sfu_x+2084,%a0
	move.l %d0,%d2
	asr.l #8,%d2
	moveq #127,%d0
	and.l %d0,%d2
	move.b %d3,sfu_x+2088
	move.b %d2,sfu_x+2089
	cmp.l sfu_x+2080.l,%a0
	jne .L586
	mvz.b sfu_x+2090,%d0
	cmp.l %d0,%d3
	jne .L586
	mvz.b sfu_x+2091,%d0
	cmp.l %d0,%d2
	jeq .L587
.L586:
	lea sfu_x+2080,%a0
	move.l (%a0),sfu_x+2084
	jsr relabel
.L587:
	tst.b sfu_p+20.l
	jne .L588
	move.l %d3,-(%sp)
	clr.l -(%sp)
	jsr tcache
	move.b sfu_x+2580,%d0
	addq.l #8,%sp
	move.l sfu_x+2452,%d1
	not.l %d0
	tst.b %d0
	seq %d0
	mvs.b %d0,%d0
	sub.l %d0,%d1
	lsl.l #8,%d1
	add.l #-256,%d1
	move.l %d1,1075575908
.L588:
	tst.b sfu_p+21.l
	jne .L585
	move.l %d2,-(%sp)
	mov3q.l #1,-(%sp)
	jsr tcache
	move.b sfu_x+2581,%d0
	addq.l #8,%sp
	move.l sfu_x+2452,%d1
	not.l %d0
	tst.b %d0
	seq %d0
	mvs.b %d0,%d0
	sub.l %d0,%d1
	lsl.l #8,%d1
	add.l #-256,%d1
	move.l %d1,1075576220
.L585:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
	.size	sync, .-sync
	.align	2
	.globl	sfu_isext
	.type	sfu_isext, @function
sfu_isext:
	move.l 4(%sp),%d0
	subq.l #1,%d0
	lsr.l #2,%d0
	jne .L591
.L593:
	mov3q.l #1,%d0
.L590:
	rts
.L591:
	move.l 4(%sp),-(%sp)
	jsr xmode
	addq.l #4,%sp
	tst.l %d0
	jne .L593
	move.l sfu_p+522,%a0
	tst.l %a0
	jeq .L590
	move.l 24(%a0),%a0
	move.l 4(%sp),-(%sp)
	jsr (%a0)
	addq.l #4,%sp
	tst.l %d0
	sne %d0
	mvs.b %d0,%d0
	neg.l %d0
	jra .L590
	.size	sfu_isext, .-sfu_isext
	.align	2
	.globl	sfu_s_read
	.type	sfu_s_read, @function
sfu_s_read:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 16(%sp),%d3
	move.l 12(%sp),%d2
	move.l %d3,-(%sp)
	jsr um_val
	addq.l #4,%sp
	mov3q.l #-1,%d1
	cmp.l %d0,%d1
	jeq .L598
	move.l %d0,%d2
	tst.l %d0
	jge .L600
	clr.l %d2
.L600:
	move.l %d3,%d0
	moveq #13,%d1
	add.l #-14,%d0
	cmp.l %d0,%d1
	jcs .L601
	btst #0,%d0
	jeq .L602
	lsl.l #7,%d2
.L602:
	and.l #32512,%d2
.L597:
	move.l %d2,%d0
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L598:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	jsr 1074433530
	addq.l #8,%sp
	move.l %d0,%d2
	jra .L600
.L601:
	move.l %d3,-(%sp)
	jsr xmode
	addq.l #4,%sp
	tst.l %d0
	jeq .L597
	move.l %d2,16(%sp)
	move.l %d3,12(%sp)
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	jra x_knob
	.size	sfu_s_read, .-sfu_s_read
	.align	2
	.globl	sfu_f_read
	.type	sfu_f_read, @function
sfu_f_read:
	link.w %fp,#-8
	move.l 12(%fp),%d1
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	pea -4(%fp)
	move.l %d1,-(%sp)
	move.l %d1,-8(%fp)
	mov3q.l #-1,%d2
	move.l 8(%fp),%d3
	jsr pq
	addq.l #8,%sp
	cmp.l %d0,%d2
	jeq .L608
	tst.l %d0
	jlt .L614
	move.l -4(%fp),%d1
	moveq #12,%d2
	muls.l %d2,%d1
	move.l %d1,%a0
	add.l #sfu_p,%a0
	mvz.b 26(%a0,%d0.l),%d2
.L615:
	lsl.l #8,%d2
.L607:
	move.l %d2,%d0
	move.l -16(%fp),%d2
	move.l -12(%fp),%d3
	unlk %fp
	rts
.L608:
	move.l -8(%fp),%d0
	mov3q.l #3,%d1
	subq.l #1,%d0
	cmp.l %d0,%d1
	jcs .L610
	add.l #sfu_x+6684,%d0
	move.l %d0,%a0
	mvz.b (%a0),%d2
	jra .L615
.L610:
	move.l -8(%fp),-(%sp)
	move.l %d3,-(%sp)
	jsr 1074433680
	move.l %d3,-(%sp)
	move.l %d0,%d2
	jsr see_fxset
	lea (12,%sp),%sp
	move.l -8(%fp),%d1
	add.l #-14,%d1
	move.l %d1,-8(%fp)
	moveq #13,%d0
	cmp.l %d1,%d0
	jcs .L607
	tst.b sfu_st+1026.l
	jeq .L611
	move.l %d3,-(%sp)
	jsr sync
	addq.l #4,%sp
.L611:
	move.l -8(%fp),%d1
	btst #0,%d1
	jeq .L612
	lsl.l #7,%d2
.L612:
	and.l #32512,%d2
	move.l -12(%fp),%d3
	move.l -8(%fp),8(%fp)
	move.l %d2,12(%fp)
	move.l -16(%fp),%d2
	unlk %fp
	jra to_knob
.L614:
	clr.l %d2
	jra .L607
	.size	sfu_f_read, .-sfu_f_read
	.align	2
	.globl	sfu_s_write
	.type	sfu_s_write, @function
sfu_s_write:
	lea (-24,%sp),%sp
	moveq #13,%d0
	movem.l #60,(%sp)
	move.l 32(%sp),%d4
	move.l %d4,%d3
	move.l 28(%sp),%d5
	add.l #-14,%d3
	move.l 36(%sp),%d2
	move.l 40(%sp),16(%sp)
	move.l 44(%sp),20(%sp)
	cmp.l %d3,%d0
	jcs .L617
	move.l %d4,-(%sp)
	move.l %d5,-(%sp)
	addq.l #1,sfu_st+1030
	jsr 1074433530
	move.l %d2,-(%sp)
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	jsr merge
	lea (20,%sp),%sp
	move.l %d0,%d2
.L618:
	move.l %d2,36(%sp)
	move.l %d4,32(%sp)
	move.l %d5,28(%sp)
	movem.l (%sp),#60
	move.l 20(%sp),44(%sp)
	move.l 16(%sp),40(%sp)
	lea (24,%sp),%sp
	jmp 1074438046
.L617:
	move.l %d4,-(%sp)
	jsr um_val
	addq.l #4,%sp
	lea xmode,%a0
	addq.l #1,%d0
	tst.l %d0
	jeq .L619
	move.l sfu_p+522,%a1
	move.l 8(%a1),%d3
	move.l %d4,-(%sp)
	jsr (%a0)
	addq.l #4,%sp
	tst.l %d0
	jeq .L620
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	jsr x_half
	addq.l #8,%sp
	move.l %d0,%d2
.L620:
	move.l %d2,32(%sp)
	move.l %d4,28(%sp)
	move.l %d3,%a1
	movem.l (%sp),#60
	lea (24,%sp),%sp
	jmp (%a1)
.L619:
	move.l %d4,-(%sp)
	jsr (%a0)
	addq.l #4,%sp
	tst.l %d0
	jeq .L618
	move.l %d4,-(%sp)
	move.l %d5,-(%sp)
	jsr 1074433530
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	move.l %d0,%d3
	jsr x_half
	lea (16,%sp),%sp
	move.l %d4,%a0
	add.l #sfu_x,%a0
	move.l %d0,%d2
	tst.b 6223(%a0)
	jeq .L618
	tst.l %d3
	jlt .L618
	and.l #32512,%d2
	and.l #224,%d3
	or.l %d3,%d2
	jra .L618
	.size	sfu_s_write, .-sfu_s_write
	.align	2
	.globl	sfu_s_delta
	.type	sfu_s_delta, @function
sfu_s_delta:
	lea (-24,%sp),%sp
	movem.l #3100,(%sp)
	move.l 32(%sp),%d2
	move.l 28(%sp),%d4
	move.l 36(%sp),%d3
	move.l 40(%sp),%a2
	move.l 48(%sp),%a3
	move.l 44(%sp),20(%sp)
	move.l %d2,-(%sp)
	jsr um_val
	addq.l #4,%sp
	addq.l #1,%d0
	tst.l %d0
	jeq .L630
	moveq #52,%d0
	muls.l %d2,%d0
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	move.l %d0,%a2
	add.l #1075575064,%a2
	jsr sfu_s_read
	addq.l #8,%sp
	move.l %d0,%d1
	add.l %d3,%d1
	tst.l %a3
	jeq .L631
	clr.b (%a3)
.L631:
	move.l 8(%a2),%d0
	cmp.l %d0,%d1
	jle .L632
	move.l %d1,%d0
.L632:
	move.l 12(%a2),%d1
	cmp.l %d0,%d1
	jge .L633
	move.l %d1,%d0
.L633:
	move.l %d2,32(%sp)
	move.l %d4,28(%sp)
	movem.l (%sp),#3100
	addq.l #1,sfu_p+546
	clr.l 44(%sp)
	clr.l 40(%sp)
	move.l %d0,36(%sp)
	lea (24,%sp),%sp
	jra sfu_s_write
.L630:
	move.l %d2,-(%sp)
	jsr xmode
	addq.l #4,%sp
	subq.l #4,%d0
	tst.l %d0
	jne .L634
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	jsr 1074433530
	move.l %d3,-(%sp)
	move.l %d0,-(%sp)
	move.l %d2,-(%sp)
	jsr step_to
	lea (20,%sp),%sp
	move.l %d0,%d3
.L634:
	move.l %a3,48(%sp)
	move.l %a2,40(%sp)
	move.l %d3,36(%sp)
	move.l %d2,32(%sp)
	move.l %d4,28(%sp)
	movem.l (%sp),#3100
	move.l 20(%sp),44(%sp)
	lea (24,%sp),%sp
	jmp 1074435548
	.size	sfu_s_delta, .-sfu_s_delta
	.align	2
	.globl	sfu_f_write
	.type	sfu_f_write, @function
sfu_f_write:
	link.w %fp,#-28
	movem.l #1084,(%sp)
	move.l 12(%fp),%d4
	pea -4(%fp)
	move.l 8(%fp),%a2
	move.l %d4,-(%sp)
	move.l 16(%fp),%d2
	jsr pq
	addq.l #8,%sp
	mov3q.l #-1,%d1
	cmp.l %d0,%d1
	jeq .L639
	tst.l %d0
	jlt .L640
	asr.l #8,%d2
	moveq #127,%d5
	cmp.l %d2,%d5
	jge .L641
	moveq #127,%d2
.L642:
	move.l -4(%fp),%d1
	moveq #12,%d3
	lea sfu_p,%a0
	muls.l %d1,%d3
	lea (%a0,%d3.l),%a1
	mvz.b 26(%a1,%d0.l),%d3
	cmp.l %d3,%d2
	jeq .L640
	move.b %d2,26(%a1,%d0.l)
	mov3q.l #1,%d2
	lsl.l %d0,%d2
	add.l #25,%d1
	move.w (%a0,%d1.l*2),%d0
	or.l %d0,%d2
	move.w %d2,(%a0,%d1.l*2)
.L640:
	mov3q.l #1,%d0
.L638:
	movem.l -28(%fp),#1084
	unlk %fp
	rts
.L641:
	tst.l %d2
	jge .L642
	clr.l %d2
	jra .L642
.L639:
	move.l %d4,%d0
	mov3q.l #3,%d1
	subq.l #1,%d0
	cmp.l %d0,%d1
	jcs .L644
	asr.l #8,%d2
	moveq #127,%d5
	cmp.l %d2,%d5
	jge .L645
	moveq #127,%d2
.L646:
	move.l %d0,%d1
	move.l %d0,%a0
	add.l #sfu_x+6684,%a0
	mvz.b (%a0),%d0
	asr.l #1,%d1
	cmp.l %d0,%d2
	jeq .L640
	mov3q.l #1,%d0
	lsl.l %d1,%d0
	move.b sfu_x+6688,%d1
	move.b %d2,(%a0)
	or.l %d1,%d0
	move.b %d0,sfu_x+6688
	jra .L640
.L645:
	tst.l %d2
	jge .L646
	clr.l %d2
	jra .L646
.L644:
	move.l %d4,%d3
	moveq #13,%d0
	add.l #-14,%d3
	cmp.l %d3,%d0
	jcs .L647
	lea k_cidx,%a0
	mvz.b (%a0,%d3.l),%d1
	move.l %d4,-(%sp)
	move.l %a2,-(%sp)
	move.l %d1,-8(%fp)
	jsr 1074433680
	move.l %a2,-(%sp)
	addq.l #1,sfu_st+1030
	move.l %d0,%d5
	jsr see_fxset
	move.l %d5,%d0
	asr.l #8,%d0
	moveq #127,%d1
	and.l %d0,%d1
	move.l %d1,-(%sp)
	move.l %d2,-(%sp)
	move.l %d3,-(%sp)
	jsr to_half
	move.l %d0,-(%sp)
	move.l %d5,-(%sp)
	move.l %d3,-(%sp)
	jsr merge
	lea (36,%sp),%sp
	mov3q.l #1,%d5
	move.l %d0,%d2
	cmp.l %d3,%d5
	jge .L648
	move.l %d4,%d0
	mov3q.l #6,%d5
	add.l #-16,%d0
	rems.l %d5,%d1:%d0
	tst.l %d1
	jne .L648
	mov3q.l #7,%d1
	cmp.l %d3,%d1
	slt %d0
	lea sfu_x,%a0
	mvs.b %d0,%d0
	sub.l %d0,%a0
	move.l %d2,%d0
	asr.l #8,%d0
	move.b %d0,2088(%a0)
.L648:
	moveq #37,%d5
	cmp.l -8(%fp),%d5
	jge .L647
	move.l 20(%a2),%a0
	move.l (%a0),%a1
	move.l %a0,-(%sp)
	move.l 40(%a1),%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l -8(%fp),%d1
	add.l #-38,%d1
	mvz.w %d1,%d1
	add.l %d1,%d1
	move.l %d1,%a0
	add.l #1081499899,%a0
	btst #0,%d3
	jeq .L650
	mvz.w #65280,%d3
.L649:
	move.l -8(%fp),%d1
	add.l %d1,%d1
	move.l %d1,%a1
	move.w %d2,(%a1,%d0.l)
	add.l #-2147423840,%a1
	move.l %d1,-8(%fp)
	move.w (%a1),%d0
	eor.l %d2,%d0
	and.l %d3,%d0
	eor.l %d2,%d0
	move.w %d0,(%a1)
	move.l %d2,%d0
	asr.l #8,%d0
	move.b %d0,(%a0)
	move.b %d2,1(%a0)
	jra .L640
.L650:
	mvz.w #255,%d3
	jra .L649
.L647:
	move.l 24(%fp),-(%sp)
	move.l 20(%fp),-(%sp)
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	move.l %a2,-(%sp)
	jsr 1074438172
	lea (20,%sp),%sp
	jra .L638
	.size	sfu_f_write, .-sfu_f_write
	.align	2
	.globl	sfu_s_lget
	.type	sfu_s_lget, @function
sfu_s_lget:
	lea (-16,%sp),%sp
	movem.l #28,(%sp)
	move.l 24(%sp),%d3
	moveq #11,%d4
	move.l %d3,%d0
	add.l #-16,%d0
	move.l 20(%sp),%d2
	move.l 28(%sp),12(%sp)
	cmp.l %d0,%d4
	jcs .L652
	mov3q.l #6,%d4
	rems.l %d4,%d1:%d0
	mov3q.l #1,%d0
	cmp.l %d1,%d0
	jlt .L652
.L654:
	mov3q.l #-1,%d2
.L651:
	move.l %d2,%d0
	movem.l (%sp),#28
	lea (16,%sp),%sp
	rts
.L652:
	move.l %d3,-(%sp)
	jsr um_val
	addq.l #4,%sp
	addq.l #1,%d0
	tst.l %d0
	jne .L654
	move.l 12(%sp),-(%sp)
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	jsr 1074436168
	lea (12,%sp),%sp
	move.l %d0,%d2
	tst.l %d0
	jlt .L651
	move.l %d3,%d0
	moveq #13,%d4
	add.l #-14,%d0
	cmp.l %d0,%d4
	jcs .L656
	btst #0,%d0
	jeq .L657
	lsl.l #7,%d2
.L657:
	and.l #32512,%d2
	jra .L651
.L656:
	move.l %d3,-(%sp)
	jsr xmode
	addq.l #4,%sp
	tst.l %d0
	jeq .L651
	move.l %d2,24(%sp)
	move.l %d3,20(%sp)
	movem.l (%sp),#28
	lea (16,%sp),%sp
	jra x_knob
	.size	sfu_s_lget, .-sfu_s_lget
	.align	2
	.globl	sfu_f_lget
	.type	sfu_f_lget, @function
sfu_f_lget:
	link.w %fp,#-32
	move.l 16(%fp),-8(%fp)
	movem.l #60,(%sp)
	move.l 12(%fp),%d2
	mov3q.l #-1,%d4
	pea -4(%fp)
	move.l %d2,-(%sp)
	move.l 8(%fp),%d3
	jsr pq
	addq.l #8,%sp
	cmp.l %d0,%d4
	jne .L673
	move.l %d2,%d1
	mov3q.l #3,%d5
	subq.l #1,%d1
	cmp.l %d1,%d5
	jcc .L659
	add.l #-15,%d1
	moveq #11,%d4
	cmp.l %d1,%d4
	jcc .L662
.L666:
	move.l -8(%fp),-(%sp)
	move.l %d2,-(%sp)
	move.l %d2,%d5
	add.l #-14,%d5
	move.l %d3,-(%sp)
	move.l %d5,-16(%fp)
	jsr 1074436538
	lea (12,%sp),%sp
	moveq #13,%d1
	cmp.l %d5,%d1
	jcc .L677
.L659:
	movem.l -32(%fp),#60
	unlk %fp
	rts
.L662:
	mov3q.l #6,%d4
	rems.l %d4,%d5:%d1
	mov3q.l #1,%d1
	cmp.l %d5,%d1
	jlt .L666
	jra .L659
.L677:
	tst.l %d0
	jlt .L659
	move.l -16(%fp),%d2
	moveq #37,%d4
	lea k_cidx,%a0
	mvz.b (%a0,%d2.l),%d1
	cmp.l %d1,%d4
	jcs .L668
	btst #0,%d2
	jne .L669
.L678:
	and.l #32512,%d0
	jra .L671
.L668:
	move.l %d0,-(%sp)
	move.l -16(%fp),-(%sp)
	jsr lk_half
	addq.l #8,%sp
	mov3q.l #-1,%d5
	cmp.l %d0,%d5
	jeq .L659
.L671:
	tst.b sfu_st+1026.l
	jeq .L672
	move.l %d3,-(%sp)
	move.l %d0,-12(%fp)
	jsr sync
	addq.l #4,%sp
	move.l -12(%fp),%d0
.L672:
	movem.l -32(%fp),#60
	move.l %d0,12(%fp)
	move.l -16(%fp),8(%fp)
	unlk %fp
	jra to_knob
.L669:
	lsl.l #7,%d0
	jra .L678
.L673:
	mov3q.l #-1,%d0
	jra .L659
	.size	sfu_f_lget, .-sfu_f_lget
	.align	2
	.globl	sfu_s_lset
	.type	sfu_s_lset, @function
sfu_s_lset:
	lea (-24,%sp),%sp
	moveq #13,%d0
	movem.l #252,(%sp)
	move.l 32(%sp),%d3
	move.l %d3,%d4
	move.l 28(%sp),%d5
	add.l #-14,%d4
	move.l 36(%sp),%d2
	move.l 40(%sp),%d6
	cmp.l %d4,%d0
	jcs .L680
	moveq #15,%d1
	cmp.l %d3,%d1
	jge .L681
	move.l %d3,%d0
	mov3q.l #6,%d7
	add.l #-16,%d0
	rems.l %d7,%d1:%d0
	mov3q.l #1,%d0
	cmp.l %d1,%d0
	jge .L682
.L681:
	move.l %d6,-(%sp)
	move.l %d3,-(%sp)
	move.l %d5,-(%sp)
	addq.l #1,sfu_st+1030
	jsr 1074436168
	lea (12,%sp),%sp
	tst.l %d0
	jge .L683
	move.l %d3,-(%sp)
	move.l %d5,-(%sp)
	jsr 1074433530
	addq.l #8,%sp
.L683:
	move.l %d2,-(%sp)
	move.l %d0,-(%sp)
	move.l %d4,-(%sp)
	jsr merge
	lea (12,%sp),%sp
	move.l %d0,%d2
.L684:
	move.l %d6,40(%sp)
	move.l %d2,36(%sp)
	move.l %d3,32(%sp)
	move.l %d5,28(%sp)
	movem.l (%sp),#252
	lea (24,%sp),%sp
	jmp 1074436282
.L680:
	move.l %d3,-(%sp)
	jsr um_val
	addq.l #4,%sp
	addq.l #1,%d0
	tst.l %d0
	jne .L682
	move.l %d3,-(%sp)
	jsr xmode
	addq.l #4,%sp
	subq.l #4,%d0
	tst.l %d0
	jne .L686
	move.l %d6,-(%sp)
	move.l %d3,-(%sp)
	move.l %d5,-(%sp)
	jsr 1074436168
	lea (12,%sp),%sp
	move.l %d0,%d4
	tst.l %d0
	jge .L687
	move.l %d3,-(%sp)
	move.l %d5,-(%sp)
	jsr 1074433530
	addq.l #8,%sp
	move.l %d0,%d4
.L687:
	sub.l %d4,%d2
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	move.l %d3,-(%sp)
	jsr step_to
	lea (12,%sp),%sp
	move.l %d0,%d2
	add.l %d4,%d2
	jra .L684
.L686:
	move.l %d3,-(%sp)
	jsr xmode
	addq.l #4,%sp
	tst.l %d0
	jeq .L684
	move.l %d6,-(%sp)
	move.l %d3,-(%sp)
	move.l %d5,-(%sp)
	jsr 1074436168
	lea (12,%sp),%sp
	move.l %d0,%d4
	tst.l %d0
	jge .L688
	move.l %d3,-(%sp)
	move.l %d5,-(%sp)
	jsr 1074433530
	addq.l #8,%sp
	move.l %d0,%d4
.L688:
	move.l %d2,-(%sp)
	move.l %d3,-(%sp)
	jsr x_half
	addq.l #8,%sp
	move.l %d3,%a0
	add.l #sfu_x,%a0
	move.l %d0,%d2
	tst.b 6223(%a0)
	jeq .L684
	tst.l %d4
	jlt .L684
	and.l #32512,%d2
	and.l #224,%d4
	or.l %d4,%d2
	jra .L684
.L682:
	movem.l (%sp),#252
	clr.l %d0
	lea (24,%sp),%sp
	rts
	.size	sfu_s_lset, .-sfu_s_lset
	.align	2
	.globl	sfu_f_lset
	.type	sfu_f_lset, @function
sfu_f_lset:
	link.w %fp,#-28
	move.l 16(%fp),-8(%fp)
	movem.l #124,(%sp)
	move.l 12(%fp),%d2
	pea -4(%fp)
	move.l %d2,-(%sp)
	move.l 8(%fp),%d3
	move.l 20(%fp),%d4
	jsr pq
	addq.l #8,%sp
	addq.l #1,%d0
	tst.l %d0
	jne .L696
	move.l %d2,%d0
	subq.l #1,%d0
	lsr.l #2,%d0
	jeq .L696
	move.l %d2,%d5
	moveq #13,%d6
	add.l #-14,%d5
	cmp.l %d5,%d6
	jcs .L698
	moveq #15,%d0
	cmp.l %d2,%d0
	jge .L699
	move.l %d2,%d0
	mov3q.l #6,%d6
	add.l #-16,%d0
	rems.l %d6,%d1:%d0
	mov3q.l #1,%d0
	cmp.l %d1,%d0
	jge .L696
.L699:
	move.l %d4,-(%sp)
	move.l %d2,-(%sp)
	move.l %d3,-(%sp)
	addq.l #1,sfu_st+1030
	jsr 1074436538
	lea (12,%sp),%sp
	lea k_cidx,%a0
	moveq #37,%d1
	move.l %d0,%d6
	mvz.b (%a0,%d5.l),%d0
	lea to_half,%a0
	cmp.l %d0,%d1
	jcc .L700
	clr.l -(%sp)
	move.l -8(%fp),-(%sp)
	move.l %d5,-(%sp)
	jsr (%a0)
	move.l %d0,-(%sp)
	move.l %d6,-(%sp)
	move.l %d5,-(%sp)
	jsr lk_put
	lea (24,%sp),%sp
	move.l %d0,-8(%fp)
.L698:
	move.l %d4,20(%fp)
	move.l %d2,12(%fp)
	move.l %d3,8(%fp)
	movem.l -28(%fp),#124
	move.l -8(%fp),16(%fp)
	unlk %fp
	jmp 1074436652
.L700:
	clr.l -(%sp)
	move.l -8(%fp),-(%sp)
	move.l %d5,-(%sp)
	jsr (%a0)
	lea (12,%sp),%sp
	move.l %d0,-8(%fp)
	tst.l %d6
	jge .L701
	move.l %d2,-(%sp)
	move.l %d3,-(%sp)
	jsr 1074433680
	addq.l #8,%sp
	move.l %d0,%d6
.L701:
	move.l -8(%fp),-(%sp)
	move.l %d6,-(%sp)
	move.l %d5,-(%sp)
	jsr merge
	lea (12,%sp),%sp
	move.l %d0,-8(%fp)
	jra .L698
.L696:
	movem.l -28(%fp),#124
	clr.l %d0
	unlk %fp
	rts
	.size	sfu_f_lset, .-sfu_f_lset
	.align	2
	.globl	sfu_f_lclr
	.type	sfu_f_lclr, @function
sfu_f_lclr:
	lea (-20,%sp),%sp
	moveq #13,%d0
	movem.l #124,(%sp)
	move.l 28(%sp),%d3
	move.l %d3,%d4
	move.l 24(%sp),%d5
	add.l #-14,%d4
	move.l 32(%sp),%d6
	cmp.l %d4,%d0
	jcs .L703
	lea k_cidx,%a0
	moveq #37,%d1
	mvz.b (%a0,%d4.l),%d0
	cmp.l %d0,%d1
	jcc .L703
	move.l %d6,-(%sp)
	move.l %d3,-(%sp)
	move.l %d5,-(%sp)
	jsr 1074436538
	lea (12,%sp),%sp
	addq.l #1,sfu_st+1030
	move.l %d0,%d2
	tst.l %d0
	jge .L704
.L706:
	clr.l %d0
.L702:
	movem.l (%sp),#124
	lea (20,%sp),%sp
	rts
.L704:
	move.l %d0,-(%sp)
	move.l %d4,-(%sp)
	jsr lk_half
	addq.l #8,%sp
	addq.l #1,%d0
	tst.l %d0
	jeq .L706
	mov3q.l #-1,-(%sp)
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	jsr lk_put
	lea (12,%sp),%sp
	mov3q.l #-1,%d1
	cmp.l %d0,%d1
	jeq .L703
	move.l %d6,-(%sp)
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	move.l %d5,-(%sp)
	jsr 1074436652
	lea (16,%sp),%sp
	jra .L702
.L703:
	move.l %d6,32(%sp)
	move.l %d3,28(%sp)
	move.l %d5,24(%sp)
	movem.l (%sp),#124
	lea (20,%sp),%sp
	jmp 1074436770
	.size	sfu_f_lclr, .-sfu_f_lclr
	.align	2
	.globl	sfu_get
	.type	sfu_get, @function
sfu_get:
	lea (-20,%sp),%sp
	movem.l #7180,(%sp)
	move.l 24(%sp),%a2
	move.l 28(%sp),%d2
	move.l 32(%sp),%d3
	move.l (%a2),%a0
	mov3q.l #-1,-(%sp)
	move.l %a2,-(%sp)
	move.l 160(%a0),%a0
	jsr (%a0)
	addq.l #8,%sp
	moveq #11,%d1
	move.l %d0,%a3
	move.l %d2,%d0
	move.l (%a3),%a4
	add.l #-16,%d0
	cmp.l %d0,%d1
	jcc .L714
	add.l #15,%d0
	lsr.l #2,%d0
	jeq .L714
	move.l sfu_p+522,%a0
	tst.l %a0
	jne .L715
.L716:
	tst.l %d3
	jge .L717
.L718:
	move.l %d2,28(%sp)
	move.l %a3,24(%sp)
	move.l 40(%a4),%a1
	movem.l (%sp),#7180
	lea (20,%sp),%sp
	jmp (%a1)
.L714:
	move.l %a2,sfu_p+94
	move.l (%a2),sfu_p+98
	jra .L716
.L715:
	move.l %d2,-(%sp)
	move.l 24(%a0),%a0
	jsr (%a0)
	addq.l #4,%sp
	tst.l %d0
	jeq .L716
	move.l %a2,sfu_p+530
	move.l (%a2),sfu_p+534
	jra .L716
.L717:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l %a3,-(%sp)
	move.l 60(%a4),%a0
	jsr (%a0)
	lea (12,%sp),%sp
	tst.l %d0
	jlt .L718
	movem.l (%sp),#7180
	lea (20,%sp),%sp
	rts
	.size	sfu_get, .-sfu_get
	.align	2
	.globl	sfu_key
	.type	sfu_key, @function
sfu_key:
	lea (-28,%sp),%sp
	movem.l #1084,(%sp)
	move.l -66650100,%d1
	moveq #49,%d2
	move.l 36(%sp),%a2
	move.l %d1,24(%sp)
	move.l 12(%a2),%d3
	move.l %d3,%d1
	mvz.b %d1,%d1
	cmp.l %d1,%d2
	jeq .L758
	moveq #50,%d4
	cmp.l %d1,%d4
	jne .L759
	mov3q.l #1,%a0
.L723:
	tst.b sfu_st+1026.l
	jeq .L724
	mov3q.l #1,%d5
	and.l 16(%a2),%d5
	move.l %d5,%a1
	cmp.l #128,%d1
	jne .L725
	move.b %d5,sfu_p+60
.L724:
	clr.l %d0
.L726:
	clr.l -(%sp)
	move.l 28(%sp),-(%sp)
	move.l %d0,28(%sp)
	jsr timed
	movem.l 8(%sp),#1084
	move.l 28(%sp),%d0
	lea (36,%sp),%sp
	rts
.L758:
	sub.l %a0,%a0
	jra .L723
.L759:
	mov3q.l #-1,%a0
	jra .L723
.L725:
	move.l %d1,%d0
	add.l #-66,%d0
	lsr.l #1,%d0
	jne .L727
	move.b sfu_p+61,%d0
	tst.l %d5
	jeq .L728
	move.l %d3,%d2
	add.l #-65,%d2
	or.l %d2,%d0
.L729:
	move.b %d0,sfu_p+61
	mov3q.l #-1,%d4
	cmp.l %a0,%d4
	jeq .L730
.L757:
	move.b sfu_p+56,%d2
	move.b sfu_p+58,%d4
	tst.l %a1
	jeq .L731
	mvz.b %d4,%d0
	move.l %a0,%d5
	asr.l %d5,%d0
	mov3q.l #1,%d5
	move.l %d0,%a1
	and.l %d5,%d0
	move.l %a1,%d5
	btst #0,%d5
	jeq .L732
	mvz.b %d2,%d0
	cmp.l %d0,%d1
	seq %d0
.L777:
	mvs.b %d0,%d0
	neg.l %d0
	jra .L726
.L728:
	moveq #64,%d2
	sub.l %d3,%d2
	and.l %d2,%d0
	jra .L729
.L732:
	mov3q.l #1,%d1
	move.l %a0,%d5
	lsl.l %d5,%d1
	or.l %d4,%d1
	move.b %d1,sfu_p+58
	move.b sfu_p+60,%d1
	or.l %d2,%d1
	tst.b %d1
	jne .L726
	mvz.b sfu_p+55,%d2
	move.l %a0,%d1
	addq.l #1,%d1
	cmp.l %d2,%d1
	jne .L734
	lea sfu_p,%a1
	mvz.b 22(%a1,%a0.l),%d2
	lsr.l #1,%d2
	jne .L760
.L734:
	mvz.b sfu_p+527,%d2
	cmp.l %d1,%d2
	jne .L726
	tst.b sfu_p+61.l
	jne .L726
.L760:
	clr.l %d0
	lea sfu_p+102,%a0
.L737:
	lea (%a2,%d0.l),%a1
	moveq #32,%d1
	move.l (%a1),(%a0,%d0.l)
	addq.l #4,%d0
	cmp.l %d0,%d1
	jne .L737
	clr.b %d2
	move.b %d3,sfu_p+56
	addq.l #1,sfu_p+86
	move.b %d2,sfu_p+57
.L738:
	mov3q.l #1,%d0
	jra .L726
.L731:
	mov3q.l #1,%d0
	move.l %a0,%d3
	lsl.l %d3,%d0
	mvz.b %d2,%d2
	not.l %d0
	and.l %d4,%d0
	move.b %d0,sfu_p+58
	cmp.l %d1,%d2
	jne .L724
	clr.b %d4
	move.b %d4,sfu_p+56
	tst.b sfu_p+57.l
	jne .L738
	pea sfu_p+102
	mov3q.l #1,%d5
	move.l 36(%sp),-(%sp)
	or.l %d5,sfu_p+118
	jsr 1074397898
	addq.l #1,sfu_p+82
	addq.l #8,%sp
	jra .L724
.L730:
	moveq #66,%d0
	cmp.l %d1,%d0
	jne .L761
	mov3q.l #1,%d3
.L739:
	tst.l %a1
	jne .L740
	move.b sfu_p+59,%d1
	move.l %d3,%d0
	and.l %d1,%d0
	tst.l %d0
	jeq .L726
	move.l %d3,%d0
	not.l %d0
	and.l %d1,%d0
	move.b %d0,sfu_p+59
	jra .L738
.L761:
	mov3q.l #2,%d3
	jra .L739
.L740:
	move.b sfu_p+58,%d0
	btst #0,%d0
	jne .L762
	btst #1,%d0
	jeq .L742
	mov3q.l #1,%d2
.L741:
	move.b sfu_p+60,%d4
	move.l %d2,%d0
	addq.l #1,%d0
	tst.b %d4
	jne .L743
	mvz.b sfu_p+527,%d5
	cmp.l %d5,%d0
	jne .L743
	move.l sfu_p+522,%a1
	moveq #67,%d0
	move.l 20(%a1),%a1
	cmp.l %d1,%d0
	jne .L744
	mov3q.l #1,%a0
.L744:
	move.l %a0,-(%sp)
	move.l %d2,-(%sp)
	jsr (%a1)
	move.b sfu_p+59,%d1
	addq.l #8,%sp
	move.l %d0,%d4
	mvz.b sfu_p+56,%d0
	or.l %d3,%d1
	move.b %d1,sfu_p+59
	move.l %d2,%d1
	add.l #49,%d1
	cmp.l %d0,%d1
	jne .L745
	moveq #1,%d1
	move.b %d1,sfu_p+57
.L745:
	move.l sfu_p+530,-(%sp)
	addq.l #1,sfu_p+538
	jsr 1074234644
	addq.l #4,%sp
	tst.l %d2
	jne .L746
	btst #0,%d4
	jne .L747
.L746:
	clr.l %d0
.L748:
	move.l %d0,-(%sp)
	move.l sfu_p+530,-(%sp)
	jsr retitle
	addq.l #8,%sp
	jra .L738
.L762:
	clr.l %d2
	jra .L741
.L747:
	move.l sfu_p+522,%a0
	move.l 28(%a0),%a0
	jsr (%a0)
	jra .L748
.L743:
	mvz.b sfu_p+55,%d5
	lea sfu_p,%a1
	cmp.l %d5,%d0
	jne .L742
	mvz.b 22(%a1,%d2.l),%d0
	mov3q.l #1,%d5
	cmp.l %d0,%d5
	jcc .L742
	tst.b %d4
	jeq .L749
.L742:
	mvz.b sfu_p+59,%d0
	and.l %d3,%d0
	tst.l %d0
	sne %d0
	jra .L777
.L749:
	mvz.b 20(%a1,%d2.l),%d4
	moveq #67,%d5
	cmp.l %d1,%d5
	jne .L750
	mov3q.l #1,%a0
.L750:
	move.l %d4,%d1
	add.l %a0,%d1
	tst.l %d1
	jge .L751
	clr.l %d1
.L751:
	cmp.l %d1,%d0
	jgt .L752
	move.l %d0,%d1
	subq.l #1,%d1
.L752:
	cmp.l %d4,%d1
	jeq .L753
	move.b %d1,20(%a1,%d2.l)
	tst.l %d1
	jne .L754
	move.l %d2,-(%sp)
	jsr restore_recs
	addq.l #4,%sp
.L754:
	jsr relabel
	move.l sfu_x+2132,%d0
	tst.l %d0
	jeq .L755
	move.l %d0,-(%sp)
	jsr sync
	addq.l #4,%sp
.L755:
	addq.l #1,sfu_p+78
.L753:
	move.b sfu_p+59,%d0
	mvz.b sfu_p+56,%d1
	or.l %d3,%d0
	move.b %d0,sfu_p+59
	move.l %d2,%d0
	add.l #49,%d0
	cmp.l %d1,%d0
	jne .L756
	moveq #1,%d0
	move.b %d0,sfu_p+57
.L756:
	move.l sfu_p+94,%d0
	tst.l %d0
	jeq .L738
	move.l %d0,-(%sp)
	jsr 1074234644
	clr.l -(%sp)
	move.l sfu_p+94,-(%sp)
	jsr retitle
	lea (12,%sp),%sp
	jra .L738
.L727:
	mov3q.l #-1,%d2
	cmp.l %a0,%d2
	jne .L757
	jra .L724
	.size	sfu_key, .-sfu_key
	.align	2
	.globl	sfu_tick
	.type	sfu_tick, @function
sfu_tick:
	link.w %fp,#-52
	move.l -66650100,%d1
	movem.l #15364,(%sp)
	move.l 8(%fp),%a2
	move.l %d1,-28(%fp)
	addq.l #1,sfu_st+1034
	tst.b sfu_st+1026.l
	jne .L779
	tst.l 1100664624
	jeq .L780
	tst.l 1100635224
	jeq .L780
	lea copy_desc,%a3
	clr.l -32(%fp)
	lea set_rec,%a5
	move.l %a3,%a4
.L782:
	move.l -32(%fp),-(%sp)
	jsr (%a5)
	addq.l #4,%sp
	mov3q.l #1,%d2
	cmp.l -32(%fp),%d2
	jlt .L828
	moveq #60,%d0
.L781:
	move.l -32(%fp),%a0
	move.l %d0,-(%sp)
	pea 14(%a0)
	jsr (%a3)
	addq.l #8,%sp
	addq.l #1,-32(%fp)
	moveq #14,%d0
	cmp.l -32(%fp),%d0
	jne .L782
	clr.l -32(%fp)
	lea set_bw_rec,%a3
.L783:
	move.l -32(%fp),-(%sp)
	jsr (%a3)
	pea 410.w
	addq.l #1,-32(%fp)
	move.l -32(%fp),-(%sp)
	jsr (%a4)
	lea (12,%sp),%sp
	mov3q.l #4,%d1
	cmp.l -32(%fp),%d1
	jne .L783
	tst.l sfu_x+6694
	jne .L784
	moveq #127,%d2
	move.b %d2,sfu_x+6687
	move.b %d2,sfu_x+6685
.L784:
	sub.l %a3,%a3
	move.l #1100664624,%a0
	move.l (%a0),sfu_x+2136
	lea sfu_type1_text,%a1
	move.l %a1,1100631528
	move.l #sfu_route_text,%d1
	lea sfu_p10_text,%a0
	lea sfu_p01_text,%a1
	move.l #sfu_type2_text,%d0
	move.l %a0,1100632200
	move.l #sfu_p00_text,%d2
	move.l %a1,1100631780
	lea sfu_p03_text,%a0
	lea sfu_p13_text,%a1
	move.l %d0,1100632032
	move.l #sfu_p11_text,%d0
	move.l %d1,1100631612
	move.l %d1,1100632116
	move.l #sfu_p02_text,%d1
	move.l %d2,1100631696
	move.l #sfu_p12_text,%d2
	move.l %d0,1100632284
	move.l %d1,1100631864
	move.l %a0,1100631948
	move.l %a1,1100632452
	move.l %d2,1100632368
	lea sfu_st,%a1
	sub.l %a0,%a0
	move.l sfu_x+2316,%d1
	move.l %d1,%d0
.L786:
	tst.b (%a1)
	jeq .L785
	move.w %a0,%d2
	move.l %d0,%a3
	add.l #sfu_x,%a3
	addq.l #1,%d0
	move.b %d2,2188(%a3)
	move.w #1,%a3
.L785:
	addq.l #1,%a0
	addq.l #8,%a1
	cmp.l #128,%a0
	jne .L786
	move.w %a3,%d2
	tst.b %d2
	jeq .L787
	move.l %d0,sfu_x+2316
	move.l %d0,%d1
.L787:
	lea sfu_x+2188,%a0
	clr.l %d0
.L788:
	cmp.l %d0,%d1
	jgt .L789
	move.l %d1,sfu_x+2452
	clr.l %d0
	lea sfu_x+2564,%a0
.L790:
	clr.b %d1
	moveq #14,%d2
	move.b %d1,(%a0,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d2
	jne .L790
	mov3q.l #2,-(%sp)
	mov3q.l #1,-(%sp)
	mov3q.l #2,-(%sp)
	lea set_look,%a3
	jsr (%a3)
	mov3q.l #2,-(%sp)
	mov3q.l #1,-(%sp)
	pea 8.w
	jsr (%a3)
	mov3q.l #2,-(%sp)
	mov3q.l #3,-(%sp)
	mov3q.l #3,-(%sp)
	jsr (%a3)
	lea (32,%sp),%sp
	mov3q.l #2,(%sp)
	mov3q.l #3,-(%sp)
	pea 9.w
	jsr (%a3)
	jsr relabel
	pea 4224.w
	jsr 1074276820
	lea (16,%sp),%sp
	tst.l %d0
	jeq .L791
	clr.l %d1
.L792:
	clr.b %d2
	move.l %d0,%a0
	move.b %d2,(%a0,%d1.l)
	addq.l #1,%d1
	cmp.l #4224,%d1
	jne .L792
.L791:
	moveq #1,%d1
	move.l %d0,sfu_p
	move.l #1397119061,%d0
	lea sfu_sysex,%a1
	move.l %a1,1075551832
	move.l %d0,1075551828
	move.b %d1,sfu_st+1026
.L779:
	move.l sfu_x+2320,%d0
	mov3q.l #1,%d1
	and.l %d0,%d1
	btst #0,%d0
	jne .L793
	cmp.l sfu_x+2456.l,%d0
	jeq .L793
	move.l sfu_x+2316,%a0
	lea sfu_x+2188,%a1
.L794:
	cmp.l %a0,%d1
	jeq .L795
	cmp.l #128,%d1
	jne .L796
.L795:
	cmp.l sfu_x+2320.l,%d0
	jne .L793
	tst.l %a0
	jeq .L793
	move.l %d0,sfu_x+2456
	moveq #1,%d0
	move.l %a0,sfu_x+2452
	move.b %d0,32(%a2)
.L793:
	move.l sfu_x+2132,%d0
	tst.l %d0
	jeq .L797
	move.l %d0,-(%sp)
	move.l sfu_x+2160,%a3
	jsr sync
	addq.l #4,%sp
	cmp.l sfu_x+2160.l,%a3
	jeq .L798
	moveq #1,%d1
	move.b %d1,32(%a2)
.L798:
	move.l sfu_p+98,%a4
	move.l sfu_p+94,%a5
	move.l %a2,sfu_p+518
	move.l %a4,-(%sp)
	move.l %a5,-(%sp)
	move.l %a2,-(%sp)
	lea listed,%a3
	jsr (%a3)
	lea (12,%sp),%sp
	move.l %d0,-32(%fp)
	tst.l %d0
	jeq .L800
	clr.l -(%sp)
	move.l 156(%a4),%a0
	move.l %a5,-(%sp)
	jsr (%a0)
	addq.l #8,%sp
	moveq #16,%d1
	cmp.l %d0,%d1
	jeq .L800
	moveq #22,%d2
	cmp.l %d0,%d2
	seq %d0
	mvs.b %d0,%d0
	neg.l %d0
	add.l %d0,%d0
	move.l %d0,-32(%fp)
.L800:
	lea (-29,%fp),%a0
	move.b (%a0),sfu_p+55
	tst.b sfu_p+526.l
	jne .L802
	move.l #1481856080,%a1
	cmp.l 1073848892.l,%a1
	jne .L802
	move.l 1073848896,%a0
	moveq #28,%d2
	move.l #1431130183,-(%sp)
	jsr (%a0)
	moveq #1,%d1
	addq.l #4,%sp
	move.b %d1,sfu_p+526
	move.l %d0,%d1
	lsr.l %d2,%d1
	subq.l #4,%d1
	tst.l %d1
	jne .L802
	mov3q.l #3,%d1
	and.l %d0,%d1
	tst.l %d1
	jne .L802
	move.l #1431130183,%a1
	move.l %d0,%a0
	cmp.l (%a0),%a1
	jne .L802
	move.l %d0,sfu_p+522
.L803:
	move.l sfu_p+534,-(%sp)
	move.l sfu_p+530,-(%sp)
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	move.l %d0,-32(%fp)
	tst.l %d0
	jeq .L804
	sub.l %a3,%a3
.L807:
	move.l sfu_p+534,%a0
	move.l %a3,-(%sp)
	move.l sfu_p+530,-(%sp)
	move.l 156(%a0),%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l %d0,-32(%fp)
	tst.l %d0
	jeq .L805
	move.l sfu_p+522,%a0
	move.l %d0,-(%sp)
	move.l 24(%a0),%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l %d0,-32(%fp)
	subq.l #1,%d0
	tst.l %d0
	jeq .L806
.L804:
	lea (-29,%fp),%a0
	move.b (%a0),sfu_p+527
	tst.b sfu_p+54.l
	jeq .L809
	clr.b %d0
	moveq #1,%d1
	move.b %d0,sfu_p+54
	move.b %d1,32(%a2)
.L809:
	move.l sfu_p+62,%d0
	tst.l %d0
	jeq .L810
	move.l -66650100,%d1
	sub.l %d0,%d1
	cmp.l #65999999,%d1
	jls .L810
	clr.l sfu_p+62
.L810:
	move.l sfu_p+66,%d0
	tst.l %d0
	jeq .L811
	move.l -66650100,%d1
	sub.l %d0,%d1
	cmp.l #65999999,%d1
	jls .L811
	clr.l sfu_p+66
.L811:
	lea sfu_p,%a0
	sub.l %a3,%a3
	move.l %a0,-32(%fp)
	lea sfu_p+50,%a4
	move.l %a0,%a5
.L817:
	tst.w (%a4)+
	jeq .L812
	lea sfu_p+24,%a0
	move.b (%a0,%a3.l),%d1
	jeq .L812
	move.w #8707,%d2
	move.b %d1,-14(%fp)
	mvz.b %d1,%d0
	move.l #-260222380,%a1
	sub.l %a0,%a0
	move.l %a1,-22(%fp)
	move.w %d2,-18(%fp)
	move.w %a3,%d2
	move.b %d2,-16(%fp)
	moveq #5,%d2
	move.b %d2,-15(%fp)
.L813:
	lea 26(%a5,%a0.l),%a1
	addq.l #1,%a0
	move.b (%a1),-14(%a0,%fp.l)
	cmp.l %d0,%a0
	jlt .L813
	moveq #-9,%d1
	move.l %d0,%a0
	move.b %d1,-13(%fp,%d0.l)
	pea 10(%a0)
	pea -22(%fp)
	jsr try_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L816
	clr.w %d0
	mov3q.l #1,%d1
	or.l -66650100,%d1
	move.l -32(%fp),%a0
	move.w %d0,-2(%a4)
	move.l %d1,62(%a0)
	addq.l #1,sfu_p+70
.L815:
	addq.l #4,-32(%fp)
	lea (12,%a5),%a5
	mov3q.l #1,%d1
	cmp.l %a3,%d1
	jne .L830
.L816:
	tst.b sfu_x+6689.l
	jeq .L818
	clr.b %d2
	moveq #1,%d0
	move.b %d2,sfu_x+6689
	move.b %d0,32(%a2)
.L818:
	move.l sfu_x+6698,%d0
	tst.l %d0
	jeq .L819
	move.l -66650100,%d1
	sub.l %d0,%d1
	cmp.l #65999999,%d1
	jls .L819
	clr.l sfu_x+6698
.L819:
	move.l sfu_x+6702,%d0
	tst.l %d0
	jeq .L820
	move.l -66650100,%d1
	sub.l %d0,%d1
	cmp.l #65999999,%d1
	jls .L820
	clr.l sfu_x+6702
.L820:
	lea sfu_x,%a4
	lea sfu_x+6684,%a3
	clr.l -32(%fp)
.L824:
	mvz.b sfu_x+6688,%d0
	move.l -32(%fp),%d1
	btst %d1,%d0
	jeq .L821
	move.w #8706,%a0
	moveq #-9,%d0
	move.b (%a3),-15(%fp)
	move.b 1(%a3),-14(%fp)
	pea 10.w
	move.l #-260222380,%d2
	pea -22(%fp)
	move.b -29(%fp),-16(%fp)
	move.l %d2,-22(%fp)
	move.w %a0,-18(%fp)
	move.b %d0,-13(%fp)
	jsr try_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L823
	move.l -32(%fp),%d1
	mov3q.l #1,%d0
	mov3q.l #1,%d2
	or.l -66650100,%d2
	lsl.l %d1,%d0
	move.b sfu_x+6688,%d1
	not.l %d0
	and.l %d1,%d0
	move.b %d0,sfu_x+6688
	move.l %d2,6698(%a4)
	addq.l #1,sfu_x+6690
.L821:
	addq.l #4,%a4
	addq.l #2,%a3
	mov3q.l #1,%d0
	cmp.l -32(%fp),%d0
	jne .L831
.L823:
	mvz.b sfu_st+1027,%d0
	lsr.l #1,%d0
	jne .L780
	move.w sfu_st+1028,%d0
	moveq #99,%d2
	mvz.w %d0,%d1
	cmp.l %d1,%d2
	jcs .L825
	addq.l #1,%d0
	move.w %d0,sfu_st+1028
	mvz.w %d0,%d0
	moveq #100,%d1
	cmp.l %d0,%d1
	jne .L780
.L825:
	mov3q.l #7,-(%sp)
	pea (m.0)
	jsr try_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L780
	clr.w %d2
	addq.l #1,sfu_x+2152
	move.w %d2,sfu_st+1028
.L780:
	clr.l -(%sp)
	move.l -28(%fp),-(%sp)
	jsr timed
	addq.l #8,%sp
	tst.b sfu_st+1026.l
	jeq .L778
	move.l #1481856080,%a0
	cmp.l 1073848892.l,%a0
	jne .L778
	tst.l 1073848900
	jeq .L778
	move.l -66650100,%a3
	move.l 1073848900,%a0
	move.l %a2,-(%sp)
	jsr (%a0)
	addq.l #4,%sp
	tst.l %d0
	jeq .L827
	moveq #1,%d0
	move.b %d0,32(%a2)
.L827:
	move.l -66650100,%d0
	sub.l %a3,%d0
	add.l %d0,sfu_x+6418
	addq.l #1,sfu_x+6426
	cmp.l sfu_x+6422.l,%d0
	jls .L778
	move.l %d0,sfu_x+6422
.L778:
	movem.l -52(%fp),#15364
	unlk %fp
	rts
.L828:
	mvz.w #410,%d0
	jra .L781
.L789:
	move.b (%a0)+,%d2
	addq.l #1,%d0
	move.b %d2,135(%a0)
	jra .L788
.L796:
	move.b (%a1)+,%d2
	addq.l #1,%d1
	move.b %d2,135(%a1)
	jra .L794
.L797:
	move.l sfu_x+2084,%d2
	cmp.l sfu_x+2080.l,%d2
	jeq .L798
	lea sfu_x+2080,%a0
	move.l (%a0),sfu_x+2084
	jsr relabel
	moveq #1,%d0
	move.b %d0,32(%a2)
	jra .L798
.L802:
	tst.l sfu_p+522
	jne .L803
	clr.l -32(%fp)
	jra .L804
.L805:
	addq.l #1,%a3
	moveq #8,%d2
	cmp.l %a3,%d2
	jne .L807
	jra .L804
.L806:
	mvz.b sfu_p+527,%d0
	subq.l #1,%d0
	tst.l %d0
	jeq .L804
	move.l sfu_p+522,%a0
	clr.l -(%sp)
	clr.l -(%sp)
	move.l 20(%a0),%a0
	jsr (%a0)
	addq.l #8,%sp
	btst #0,%d0
	jeq .L804
	move.l sfu_p+522,%a0
	move.l %d0,%d2
	move.l 28(%a0),%a0
	jsr (%a0)
	move.l %d0,-(%sp)
	move.l sfu_p+530,-(%sp)
	jsr retitle
	addq.l #8,%sp
	mov3q.l #1,%d0
	and.l %d0,%d2
	addq.l #1,sfu_p+550
	move.l %d2,-32(%fp)
	jra .L804
.L830:
	mov3q.l #1,%a3
	jra .L817
.L812:
	clr.w %d0
	move.w %d0,-2(%a4)
	jra .L815
.L831:
	mov3q.l #1,-32(%fp)
	jra .L824
	.size	sfu_tick, .-sfu_tick
	.text
	.type	m.0, @object
	.size	m.0, 7
m.0:
	.base64	"8H1SVCMB9w=="
	.align	2
	.type	ptexts, @object
	.size	ptexts, 32
ptexts:
	.long	sfu_p00_text
	.long	sfu_p01_text
	.long	sfu_p02_text
	.long	sfu_p03_text
	.long	sfu_p10_text
	.long	sfu_p11_text
	.long	sfu_p12_text
	.long	sfu_p13_text
	.globl	sfu_p
	.section	.bss
	.align	2
	.type	sfu_p, @object
	.size	sfu_p, 554
sfu_p:
	.zero	554
	.globl	sfu_x
	.align	2
	.type	sfu_x, @object
	.size	sfu_x, 7940
sfu_x:
	.zero	7940
	.globl	sfu_st
	.text
	.align	2
	.type	sfu_st, @object
	.size	sfu_st, 1038
sfu_st:
	.string	"OFF"
	.zero	4
	.string	"CHORUS"
	.zero	1
	.string	"COMB"
	.zero	3
	.string	"DELAY"
	.zero	2
	.string	"PINGPNG"
	.string	"TAPEDLY"
	.string	"RINGS"
	.zero	2
	.string	"S4 RESO"
	.string	"CLDSEED"
	.string	"PLASMA"
	.zero	1
	.string	"PLATE"
	.zero	2
	.string	"HALL"
	.zero	3
	.string	"SHIMMER"
	.string	"FLANGER"
	.string	"PHASER"
	.zero	1
	.zero	904
	.ascii	"\377\377"
	.byte	0
	.byte	0
	.word	0
	.long	0
	.long	0
	.globl	sfu_vec_rev
	.text
	.align	2
	.type	sfu_vec_rev, @object
	.size	sfu_vec_rev, 8
sfu_vec_rev:
	.long	9
	.long	14
	.globl	sfu_vec_del
	.align	2
	.type	sfu_vec_del, @object
	.size	sfu_vec_del, 8
sfu_vec_del:
	.long	8
	.long	13
	.globl	sfu_vec_amp
	.align	2
	.type	sfu_vec_amp, @object
	.size	sfu_vec_amp, 8
sfu_vec_amp:
	.long	7
	.long	12
	.globl	sfu_pages
	.text
	.align	2
	.type	sfu_pages, @object
	.size	sfu_pages, 108
sfu_pages:
	.long	n_amp2
	.long	14
	.long	15
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	n_fx1
	.long	16
	.long	17
	.long	18
	.long	19
	.long	20
	.long	21
	.long	1
	.long	2
	.long	n_fx2
	.long	22
	.long	23
	.long	24
	.long	25
	.long	26
	.long	27
	.long	3
	.long	4
	.text
	.type	n_fx2, @object
	.size	n_fx2, 10
n_fx2:
	.string	"SEND FX 2"
	.type	n_fx1, @object
	.size	n_fx1, 10
n_fx1:
	.string	"SEND FX 1"
	.type	n_amp2, @object
	.size	n_amp2, 12
n_amp2:
	.string	"AMPLITUDE 2"
	.type	s_wid, @object
	.size	s_wid, 4
s_wid:
	.string	"WID"
	.type	s_base, @object
	.size	s_base, 5
s_base:
	.string	"BASE"
	.type	s_ufx, @object
	.size	s_ufx, 4
s_ufx:
	.string	"UFX"
	.type	s_fx, @object
	.size	s_fx, 3
s_fx:
	.string	"FX"
	.type	s_wide, @object
	.size	s_wide, 5
s_wide:
	.string	"XXXX"
	.type	fmt_d, @object
	.size	fmt_d, 5
fmt_d:
	.string	"%s%d"
	.type	fmt_bang, @object
	.size	fmt_bang, 4
fmt_bang:
	.string	"!%s"
	.type	fmt_s, @object
	.size	fmt_s, 3
fmt_s:
	.string	"%s"
	.type	s_empty, @object
	.size	s_empty, 1
s_empty:
	.zero	1
	.type	l_fx2, @object
	.size	l_fx2, 10
l_fx2:
	.string	"Send FX 2"
	.type	l_fx1, @object
	.size	l_fx1, 10
l_fx1:
	.string	"Send FX 1"
	.type	l_sfx2, @object
	.size	l_sfx2, 10
l_sfx2:
	.string	"Send FX 2"
	.type	l_sfx1, @object
	.size	l_sfx1, 10
l_sfx1:
	.string	"Send FX 1"
	.type	fmt_sn, @object
	.size	fmt_sn, 6
fmt_sn:
	.string	"%s %d"
	.type	fmt_n, @object
	.size	fmt_n, 5
fmt_n:
	.string	"%s%d"
	.type	s_post, @object
	.size	s_post, 5
s_post:
	.string	"POST"
	.type	s_pre, @object
	.size	s_pre, 4
s_pre:
	.string	"PRE"
	.type	s_route, @object
	.size	s_route, 5
s_route:
	.string	"ROUT"
	.type	s_type, @object
	.size	s_type, 5
s_type:
	.string	"TYPE"
	.type	s_sfx2, @object
	.size	s_sfx2, 5
s_sfx2:
	.string	"SFX2"
	.type	s_sfx1, @object
	.size	s_sfx1, 5
s_sfx1:
	.string	"SFX1"
	.type	k_cidx, @object
	.size	k_cidx, 14
k_cidx:
	.base64	"AAAdHSYmJycAACgoKSk="
	.ident	"GCC: (GNU) 16.2.0"
