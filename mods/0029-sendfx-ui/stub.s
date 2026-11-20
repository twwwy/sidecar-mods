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
	jeq .L5
.L8:
	move.l sfu_x+2452,%d0
	mov3q.l #-1,%a1
	mov3q.l #1,%d3
	lea sfu_x+2324,%a3
	move.l %d0,24(%sp)
	clr.l %d0
.L6:
	cmp.l 24(%sp),%d0
	jne .L11
	move.b %d2,2578(%a0)
	mov3q.l #-1,%d0
	cmp.l %a1,%d0
	jne .L12
	move.w #255,%a1
.L12:
	move.w %a1,%d0
	add.l #646,%d1
	move.l %d4,(%a2,%d1.l*4)
	move.b %d3,2582(%a0)
	move.b %d0,2580(%a0)
	jra .L4
.L5:
	move.l %d1,%d0
	add.l #646,%d0
	cmp.l (%a2,%d0.l*4),%d4
	jne .L8
.L4:
	movem.l (%sp),#3132
	lea (28,%sp),%sp
	rts
.L11:
	mvz.b (%a3,%d0.l),%d5
	cmp.l %d5,%d2
	jne .L9
	move.l %d0,%a1
.L10:
	addq.l #1,%d0
	jra .L6
.L9:
	tst.l %d0
	jeq .L10
	cmp.l %d5,%d2
	jle .L10
	addq.l #1,%d3
	jra .L10
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
	jge .L17
	clr.l %d1
.L17:
	cmp.l %d1,%d2
	jgt .L18
	move.l %d2,%d1
	subq.l #1,%d1
.L18:
	mvz.b %d0,%d0
	cmp.l #255,%d0
	jne .L22
	mvz.b 2582(%a0),%d0
	cmp.l %d0,%d1
	jeq .L20
	jle .L22
	subq.l #1,%d1
.L22:
	add.l %d1,%a1
	mvz.b 2324(%a1),%d0
	move.l %d0,12(%sp)
.L20:
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
	jge .L27
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
	jne .L25
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
	jne .L26
	move.b 2582(%a0),%d0
.L26:
	mvz.b %d0,%d0
.L33:
	lsl.l #8,%d0
.L27:
	movem.l (%sp),#1084
	lea (20,%sp),%sp
	rts
.L25:
	mov3q.l #1,%d5
	cmp.l %d3,%d5
	jne .L28
	moveq #63,%d1
	cmp.l %a1,%d1
	slt %d0
	mvs.b %d0,%d0
	neg.l %d0
	jra .L33
.L28:
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
	jeq .L27
	move.l %d3,%d0
	subq.l #1,%d0
	tst.b %d1
	jeq .L30
	moveq #48,%d1
.L31:
	mulu.w #12,%d2
	add.l %d2,%d1
	move.l %d1,%a0
	add.l #sfu_x+2468,%a0
.L32:
	tst.l %d0
	jeq .L33
	mvz.b (%a0,%d0.l),%d1
	cmp.l %d1,%a1
	jge .L33
	subq.l #1,%d0
	jra .L32
.L30:
	clr.l %d1
	jra .L31
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
	jge .L40
	move.l %d0,%d2
	asr.l #8,%d2
	move.l %d2,%a1
	tst.l %d2
	jge .L41
	sub.l %a1,%a1
.L41:
	move.l %d1,%a2
	subq.l #2,%a2
	move.l %a2,%d3
	mov3q.l #6,%d4
	rems.l %d4,%d5:%d3
	move.l %d5,%a0
	tst.l %d5
	jne .L42
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
.L40:
	movem.l (%sp),#3132
	lea (24,%sp),%sp
	rts
.L42:
	mov3q.l #1,%d3
	cmp.l %d5,%d3
	jne .L43
	tst.l %d2
	jle .L46
	mvz.w #32512,%d0
	jra .L40
.L43:
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
	jeq .L40
	cmp.l %a1,%d2
	jgt .L45
	move.l %d2,%a1
	subq.l #1,%a1
.L45:
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
	jra .L40
.L46:
	clr.l %d0
	jra .L40
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
	jcc .L51
.L53:
	clr.l %d0
.L50:
	movem.l (%sp),#7420
	lea (36,%sp),%sp
	rts
.L51:
	tst.b sfu_st+1026.l
	jeq .L53
	move.l #1481856080,%d1
	cmp.l 1073848892.l,%d1
	jne .L53
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
	jeq .L54
	move.l 1073848896,%a0
	move.l %d3,-(%sp)
	jsr (%a0)
	addq.l #1,sfu_x+6410
	addq.l #4,%sp
	btst #12,%d0
	jne .L61
	move.l %d0,%d1
	asr.l #8,%d1
	mov3q.l #3,%d6
	and.l %d6,%d1
.L55:
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
	jcs .L56
	mvz.b %d1,%d1
	subq.l #4,%d1
	tst.l %d1
	jeq .L56
	clr.b %d0
	move.b %d0,2600(%a2)
.L56:
	move.l sfu_st+1034,%d1
	move.l %d2,%a0
	addq.l #1,%d1
	add.l %d4,%a0
	move.l %d1,2854(%a0)
.L54:
	move.w %d3,%d0
	mulu.w #52,%d3
	move.l %d3,%a1
	add.l #1075575064,%a1
	mulu.w #84,%d0
	move.l %d0,%a0
	add.l #1100630152,%a0
	move.l 32(%a0),%d0
	tst.b 2600(%a2)
	jeq .L57
	cmp.l #sfu_xtext,%d0
	jeq .L58
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
.L58:
	mvz.b 2600(%a2),%d0
	subq.l #4,%d0
	tst.l %d0
	jeq .L59
	mvz.b 2727(%a2),%d0
	subq.l #1,%d0
	lsl.l #8,%d0
	tst.b 6557(%a2)
	jeq .L62
	mvz.w #224,%d1
.L60:
	or.l %d1,%d0
.L71:
	move.l %d0,12(%a1)
.L59:
	mvz.b 2600(%a2),%d0
	jra .L50
.L61:
	moveq #4,%d1
	jra .L55
.L62:
	clr.l %d1
	jra .L60
.L57:
	cmp.l #sfu_xtext,%d0
	jne .L59
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
	jra .L71
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
	jeq .L73
	mvz.b 2727(%a0),%d3
	move.l %d0,%d1
	asr.l #8,%d1
	move.l %d3,%a1
	moveq #127,%d3
	cmp.l %d1,%d3
	jge .L74
	moveq #127,%d1
.L75:
	mov3q.l #1,%d3
	cmp.l %d2,%d3
	jne .L76
	move.w %a1,%d2
	muls.w %d2,%d1
	asr.l #7,%d1
.L77:
	lsl.l #8,%d1
	tst.b 6557(%a0)
	jeq .L82
	and.l #224,%d0
.L80:
	or.l %d1,%d0
.L73:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L74:
	tst.l %d1
	jge .L75
	clr.l %d1
	jra .L75
.L76:
	subq.l #2,%d2
	tst.l %d2
	jne .L77
	cmp.l %d1,%a1
	jgt .L77
	tst.b 6430(%a0)
	jne .L81
	move.l %a1,%d1
	subq.l #1,%d1
	jra .L77
.L81:
	clr.l %d1
	jra .L77
.L82:
	clr.l %d0
	jra .L80
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
	jeq .L87
	mvz.b 2727(%a1),%d3
	move.l %d0,%d1
	asr.l #8,%d1
	move.l %d3,%a0
	tst.l %d0
	jge .L88
	clr.l %d1
.L88:
	cmp.l %d1,%a0
	jgt .L89
	tst.b 6430(%a1)
	jeq .L90
	mov3q.l #2,%d1
	cmp.l %d2,%d1
	jeq .L93
.L90:
	move.l %a0,%d1
	subq.l #1,%d1
.L89:
	subq.l #1,%d2
	tst.l %d2
	jne .L91
	lsl.l #7,%d1
	move.l %a0,%d3
	lea -1(%a0,%d1.l),%a2
	move.l %a2,%d1
	divs.l %d3,%d1
.L91:
	lsl.l #8,%d1
	addq.l #1,sfu_x+2592
	tst.b 6557(%a1)
	jeq .L94
	and.l #224,%d0
.L92:
	or.l %d1,%d0
.L87:
	movem.l (%sp),#1036
	lea (12,%sp),%sp
	rts
.L93:
	clr.l %d1
	jra .L91
.L94:
	clr.l %d0
	jra .L92
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
	jcs .L99
	move.l #sfu_x,%d2
	move.l %d2,%a1
	add.l %d1,%a1
	move.b 2600(%a1),%d5
	mvz.b %d5,%d6
	move.w %d5,%a1
	subq.l #4,%d6
	tst.l %d6
	jne .L100
	move.l sfu_p+522,%a2
	tst.l %a2
	jeq .L100
	mov3q.l #1,-(%sp)
	move.l %d3,-(%sp)
	move.l %d0,-(%sp)
	move.l %a0,-(%sp)
	move.l 16(%a2),%a0
	jsr (%a0)
.L110:
	lea (16,%sp),%sp
	movem.l (%sp),#1148
	lea (28,%sp),%sp
	rts
.L100:
	lsl.l #2,%d1
	move.l %d2,%a2
	add.l %d1,%a2
	tst.l 3362(%a2)
	jne .L102
.L99:
	asr.l #8,%d0
	move.l %d0,-(%sp)
	pea s_empty
	pea fmt_d
	move.l %d3,-(%sp)
	jsr 1074365954
	jra .L110
.L102:
	move.w %a1,%d6
	tst.b %d6
	jeq .L103
	move.l %d0,-(%sp)
	move.l %a0,-(%sp)
	move.l %d1,32(%sp)
	jsr x_half
	addq.l #8,%sp
	subq.l #1,sfu_x+2592
	move.l 24(%sp),%d1
.L103:
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
	jcs .L112
	lea sfu_x,%a3
	mov3q.l #4,%d5
	lea (%a3,%d2.l),%a2
	move.b 2600(%a2),%d0
	mvz.b %d0,%d4
	cmp.l %d4,%d5
	jne .L113
	move.l sfu_p+522,%a4
	tst.l %a4
	jeq .L113
	clr.l -(%sp)
	move.l %a1,-(%sp)
	move.l %a0,-(%sp)
	move.l %d1,-(%sp)
	move.l 16(%a4),%a0
	jsr (%a0)
.L122:
	lea (16,%sp),%sp
	movem.l (%sp),#7228
	lea (28,%sp),%sp
	rts
.L113:
	lea (%a3,%d2.l*4),%a3
	tst.l 3362(%a3)
	jeq .L112
	subq.l #1,%d0
	mvz.b %d0,%d0
	lsr.l #1,%d0
	jne .L112
	move.l %a0,%d0
	asr.l #8,%d0
	tst.l %a0
	jge .L115
	clr.l %d0
.L115:
	mvz.b 2727(%a2),%d1
	cmp.l %d1,%d0
	jlt .L116
	tst.b 6430(%a2)
	jeq .L117
	subq.l #2,%d4
	tst.l %d4
	jeq .L118
.L117:
	move.l %d1,%d0
	subq.l #1,%d0
.L116:
	move.l %d0,%a0
	pea 1(%a0)
	pea s_empty
	pea fmt_d
	move.l %a1,-(%sp)
	jsr 1074365954
	jra .L122
.L118:
	clr.l %d0
	jra .L116
.L112:
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
	jeq .L125
	move.l 4(%sp),%d0
	moveq #126,%d1
	add.l #-334,%d0
	cmp.l %d0,%d1
	jcs .L125
	move.l 4(%a0),%a1
	jmp (%a1)
.L125:
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
	jeq .L130
	move.l 12(%a0),%a0
	move.l 12(%sp),-(%sp)
	jsr (%a0)
	addq.l #4,%sp
	move.l %d0,%d1
	and.l #65534,%d1
	tst.l %d1
	jeq .L130
	tst.l %d2
	jeq .L130
	move.l %d0,%d1
	mvz.w %d1,%d1
	move.l %d1,%a1
	move.l %d2,%d1
	tst.l %d2
	jge .L131
	add.l #255,%d1
.L131:
	asr.l #8,%d1
	jne .L132
	tst.l %d2
	jle .L139
	mov3q.l #1,%d0
.L133:
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
	jlt .L136
	move.l %a0,%d1
.L136:
	add.l %d1,%d0
	tst.l %d0
	jge .L137
	clr.l %d0
.L137:
	cmp.l %d0,%a1
	jgt .L138
	move.l %a0,%d0
.L138:
	mvz.w #16256,%d1
	move.l %a0,%d3
	addq.l #1,sfu_p+542
	muls.l %d1,%d0
	move.l %a0,%d1
	jpl .L148
	addq.l #1,%d1
.L148:
	move.l %d0,%d2
	asr.l #1,%d1
	add.l %d1,%d2
	divs.l %d3,%d2
	add.l %d2,%d2
	sub.l 16(%sp),%d2
.L130:
	move.l %d2,%d0
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L132:
	swap %d0
	ext.l %d0
	tst.l %d0
	jne .L134
.L135:
	move.l %d1,%d0
	jra .L133
.L134:
	move.l %d1,%a0
	mov3q.l #6,%d3
	addq.l #3,%a0
	cmp.l %a0,%d3
	jcc .L135
	cmp.l #255,%d2
	jgt .L133
	neg.l %d0
	jra .L133
.L139:
	mov3q.l #-1,%d0
	jra .L133
	.size	step_to, .-step_to
	.align	2
	.type	see_fxset, @function
see_fxset:
	move.l 4(%sp),%d0
	move.l sfu_x+2132,%d1
	cmp.l %d1,%d0
	jeq .L149
	tst.l %d1
	jeq .L151
	addq.l #1,sfu_x+2140
.L151:
	move.l %d0,sfu_x+2132
.L149:
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
	jge .L156
	move.w #127,%a1
.L156:
	mvz.w %a1,%d1
	lsl.l #3,%d1
	move.l %d1,%a0
	add.l #sfu_st,%a0
	tst.b (%a0)
	jne .L157
	moveq #63,%d1
	cmp.l %d0,%d1
	jge .L161
	lea (-63,%a1),%a1
	move.l #s_ufx,%d0
.L158:
	move.l %a1,-(%sp)
	move.l %d0,-(%sp)
	pea fmt_d
	move.l %d3,-(%sp)
	jsr 1074365954
	movem.l 16(%sp),#1036
	lea (28,%sp),%sp
	rts
.L161:
	move.l #s_fx,%d0
	jra .L158
.L157:
	add.l #sfu_st,%d2
	move.l %d2,%a2
	mvz.b 1024(%a2),%d0
	cmp.l %d0,%a1
	jne .L162
	move.l #fmt_bang,%d0
.L160:
	move.l %d3,16(%sp)
	movem.l (%sp),#1036
	move.l %a0,24(%sp)
	move.l %d0,20(%sp)
	lea (12,%sp),%sp
	jmp 1074365954
.L162:
	move.l #fmt_s,%d0
	jra .L160
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
	jeq .L168
	move.l #s_post,%d0
.L167:
	move.l %d0,12(%sp)
	move.l #fmt_s,%d0
	move.l %d0,8(%sp)
	move.l %d1,4(%sp)
	jmp 1074365954
.L168:
	move.l #s_pre,%d0
	jra .L167
	.size	sfu_route_text, .-sfu_route_text
	.align	2
	.type	lab_of, @function
lab_of:
	move.l %d2,-(%sp)
	move.l 8(%sp),%d1
	clr.l %d0
	addq.l #1,%d1
	lea sfu_x,%a0
.L172:
	mvz.b (%a0),%d2
	cmp.l %d2,%d1
	jne .L170
	mulu.w #130,%d0
	add.l #sfu_x,%d0
.L169:
	move.l (%sp)+,%d2
	rts
.L170:
	addq.l #1,%d0
	lea (130,%a0),%a0
	moveq #16,%d2
	cmp.l %d0,%d2
	jne .L172
	clr.l %d0
	jra .L169
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
	jge .L175
	clr.l %d1
.L175:
	tst.l %d7
	jeq .L176
	cmp.l %d1,%d7
	jgt .L177
	move.l %d7,%d1
	subq.l #1,%d1
.L177:
	moveq #48,%d7
	muls.l %d7,%d3
	moveq #12,%d7
	muls.l %d5,%d7
	move.l %d7,%a0
	add.l %d3,%a0
	add.l #sfu_x,%a0
	add.l %d1,%a0
	mvz.b 2468(%a0),%d1
.L176:
	move.l %d1,%a0
	moveq #127,%d1
	cmp.l %a0,%d1
	jge .L178
	move.w #127,%a0
.L178:
	tst.l %d0
	jeq .L179
	move.l %d0,%a1
	clr.l %d1
	mvz.b 1(%a1),%d3
	lea (22,%a1),%a1
	move.l %d3,28(%sp)
	mov3q.l #-1,%d3
.L180:
	cmp.l 28(%sp),%d1
	jge .L182
	moveq #12,%d6
	cmp.l %d1,%d6
	jne .L183
.L182:
	mov3q.l #-1,%d7
	cmp.l %d3,%d7
	jeq .L179
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
	jlt .L192
	moveq #9,%d6
	cmp.l %a1,%d6
	jge .L193
	mov3q.l #2,%d3
.L184:
	move.l %d0,%a0
	lea 25(%a0,%d1.l),%a0
	move.l %a0,%d4
	move.l %d0,%a0
	add.l %d1,%a0
	move.b 22(%a0),%d0
	move.w %d0,%ccr
	jne .L185
	clr.l %d0
.L186:
	tst.b 25(%a0,%d0.l)
	jeq .L187
	addq.l #1,%d0
	mov3q.l #5,%d1
	cmp.l %d0,%d1
	jne .L186
.L187:
	move.l %d3,%a2
	lea 1(%a2,%d0.l),%a0
	mov3q.l #7,%d0
	cmp.l %a0,%d0
	jlt .L194
	move.l #fmt_sn,%d0
.L189:
	move.l %a1,56(%sp)
	move.l %d4,52(%sp)
	move.l %d0,48(%sp)
.L207:
	move.l %d2,44(%sp)
	movem.l (%sp),#1276
	lea (40,%sp),%sp
	jmp 1074365954
.L183:
	move.b (%a1),%d6
	mov3q.l #3,%d7
	and.l %d7,%d6
	cmp.l %d6,%d5
	jne .L181
	mvz.b 1(%a1),%d6
	cmp.l %d6,%a0
	jlt .L181
	move.l %d1,%d3
.L181:
	addq.l #1,%d1
	lea (9,%a1),%a1
	jra .L180
.L192:
	mov3q.l #3,%d3
	jra .L184
.L193:
	mov3q.l #1,%d3
	jra .L184
.L185:
	move.l %d4,52(%sp)
	move.l %d2,44(%sp)
	movem.l (%sp),#1276
	lea fmt_s,%a1
	move.l %a1,48(%sp)
	lea (40,%sp),%sp
	jmp 1074365954
.L194:
	move.l #fmt_n,%d0
	jra .L189
.L179:
	move.l sfu_x+2136,%a1
	tst.l %a1
	jeq .L190
	move.l %d2,52(%sp)
	move.l %d4,48(%sp)
	movem.l (%sp),#1276
	move.l 36(%sp),44(%sp)
	lea (40,%sp),%sp
	jmp (%a1)
.L190:
	move.l #s_empty,%d3
	move.l #fmt_d,%d6
	move.l %a0,56(%sp)
	move.l %d3,52(%sp)
	move.l %d6,48(%sp)
	jra .L207
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
	jge .L225
	move.l %d1,%d0
	mov3q.l #6,%d2
	subq.l #2,%d0
	divs.l %d2,%d0
	tst.l %d0
	jne .L226
	move.w #57,%a1
.L217:
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
	jne .L218
	tst.l %d1
	jeq .L219
	move.l #l_sfx2,%d3
	move.l %d3,40(%a0)
	move.l #s_sfx2,%d0
.L221:
	move.l (%sp)+,%d2
	move.l #s_empty,%d3
	move.l %d3,44(%a0)
	move.l %d0,48(%a0)
	move.l (%sp)+,%d3
	rts
.L225:
	move.w #53,%a1
	mov3q.l #-1,%d0
	jra .L217
.L226:
	move.w #56,%a1
	jra .L217
.L219:
	lea l_sfx1,%a1
	move.l %a1,1075575832
	move.l #s_sfx1,%d0
	jra .L221
.L218:
	subq.l #2,%d1
	mov3q.l #6,%d2
	rems.l %d2,%d3:%d1
	move.l %d3,%a1
	tst.l %d0
	jeq .L227
	move.l #l_fx2,%d1
.L222:
	move.l %d1,40(%a0)
	tst.l %a1
	jeq .L223
	mov3q.l #1,%d1
	cmp.l %a1,%d1
	jne .L224
	move.l #s_route,%d0
	jra .L221
.L227:
	move.l #l_fx1,%d1
	jra .L222
.L224:
	lea -10(%a1,%a1.l*4),%a1
	moveq #20,%d2
	muls.l %d2,%d0
	add.l %a1,%d0
	add.l #sfu_x+2092,%d0
	jra .L221
.L223:
	move.l #s_type,%d0
	jra .L221
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
	jlt .L233
	move.w #57,%a1
	moveq #29,%d0
.L229:
	move.l %d0,4(%a0)
	mov3q.l #1,%d0
	and.l %d1,%d0
	mvz.w #32512,%d2
	move.l %a1,(%a0)
	clr.l 8(%a0)
	move.l %d2,12(%a0)
	move.l %d0,%a1
	btst #0,%d1
	jeq .L234
	move.l %d2,%d0
.L230:
	move.l %d0,16(%a0)
	clr.l 20(%a0)
	mov3q.l #-1,24(%a0)
	mov3q.l #-1,28(%a0)
	clr.l 36(%a0)
	mov3q.l #1,%d2
	cmp.l %d1,%d2
	jlt .L235
	move.l #l_fx1,%d0
.L231:
	move.l %d0,40(%a0)
	move.l #s_empty,%d0
	move.l %d0,44(%a0)
	tst.l %a1
	jeq .L236
	move.l #s_wid,%d0
.L232:
	move.l %d0,48(%a0)
	move.l (%sp)+,%d2
	rts
.L233:
	move.w #56,%a1
	clr.l %d0
	jra .L229
.L234:
	clr.l %d0
	jra .L230
.L235:
	move.l #l_fx2,%d0
	jra .L231
.L236:
	move.l #s_base,%d0
	jra .L232
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
.L238:
	lea (%a0,%d0.l),%a2
	moveq #84,%d1
	move.l (%a2),(%a1,%a0.l)
	addq.l #4,%a0
	cmp.l %a0,%d1
	jne .L238
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
	jeq .L247
	mov3q.l #1,%d2
	cmp.l %d1,%d2
	jge .L248
	subq.l #1,%d1
	lsl.l #8,%d1
	move.l #1100634268,%a2
.L241:
	moveq #52,%d2
	muls.l %d0,%d2
	move.l #1075575076,%a4
	move.l %a0,%a3
	add.l #sfu_x,%a3
	move.l %d1,(%a4,%d2.l)
	mvz.b 2564(%a3),%d1
	cmp.l %d1,%a1
	jeq .L240
	moveq #84,%d1
	muls.l %d1,%d0
	move.l %d0,%a0
	add.l #1100630152,%a0
	move.l (%a2),(%a0)
	move.l 4(%a2),4(%a0)
	move.l 8(%a2),8(%a0)
	move.l 16(%a2),16(%a0)
	tst.l %a1
	jne .L243
	move.l 1100664640,%d0
.L244:
	move.w %a1,%d1
	move.l %d0,48(%a0)
	move.b %d1,2564(%a3)
.L240:
	movem.l (%sp),#7172
	lea (16,%sp),%sp
	rts
.L247:
	mvz.w #32512,%d1
	move.l #1100664592,%a2
	jra .L241
.L248:
	mvz.w #256,%d1
	move.l #1100634268,%a2
	jra .L241
.L243:
	mov3q.l #2,%d2
	cmp.l %a1,%d2
	jne .L245
	move.l 1100633980,%d0
	jra .L244
.L245:
	mov3q.l #3,%d0
	cmp.l %a1,%d0
	jne .L246
	move.l 1100637004,%d0
	jra .L244
.L246:
	move.l #sfu_draw,%d0
	jra .L244
	.size	set_look, .-set_look
	.align	2
	.type	restore_recs, @function
restore_recs:
	lea (-36,%sp),%sp
	movem.l #15420,(%sp)
	move.l 40(%sp),%d2
	move.w %d2,%d0
	muls.w #6,%d0
	move.l %d0,%a3
	lea (2,%a3),%a0
	move.l %a0,32(%sp)
	btst #0,%d2
	jeq .L250
	move.l #sfu_type2_text,%d5
.L251:
	move.w %d2,%d3
	mvz.w %d2,%d0
	clr.l %d4
	lea set_rec,%a5
	move.l #1100631360,%a4
	lsl.l #4,%d0
	mulu.w #6,%d3
	move.l %d0,%a2
	add.l #ptexts,%a2
	addq.l #2,%d3
.L254:
	move.l %d3,-(%sp)
	jsr (%a5)
	addq.l #4,%sp
	tst.l %d4
	jeq .L258
	mov3q.l #1,%d0
	cmp.l %d4,%d0
	jeq .L253
	move.l -8(%a2),%d0
.L252:
	moveq #84,%d1
	addq.l #1,%d4
	muls.l %d3,%d1
	addq.l #1,%d3
	addq.l #4,%a2
	move.l %d0,(%a4,%d1.l)
	mov3q.l #6,%d1
	cmp.l %d4,%d1
	jne .L254
	mov3q.l #2,-(%sp)
	mov3q.l #1,-(%sp)
	move.l 40(%sp),-(%sp)
	lea set_look,%a2
	jsr (%a2)
	mov3q.l #2,-(%sp)
	mov3q.l #3,-(%sp)
	pea 3(%a3)
	jsr (%a2)
	mvs.w %d2,%d0
	addq.l #1,%d2
	lea set_bw_rec,%a4
	mulu.w #36,%d2
	add.l %d0,%d0
	move.l %d0,-(%sp)
	move.l %d0,%a2
	addq.l #1,%a2
	jsr (%a4)
	move.l %a2,-(%sp)
	jsr (%a4)
	lea (32,%sp),%sp
	lea p1slot,%a4
	move.l %d2,%a0
	clr.l %d0
	add.l #sfu_pages+4,%a0
.L257:
	mvz.b (%a4,%d0.l),%d1
	mov3q.l #5,%d2
	cmp.l %d1,%d2
	jlt .L255
	lea 16(%a3,%d1.l),%a1
.L256:
	move.l %a1,(%a0)+
	moveq #8,%d1
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L257
	movem.l (%sp),#15420
	lea (36,%sp),%sp
	rts
.L250:
	move.l #sfu_type1_text,%d5
	jra .L251
.L253:
	move.l #sfu_route_text,%d0
	jra .L252
.L258:
	move.l %d5,%d0
	jra .L252
.L255:
	lea -6(%a2,%d1.l),%a1
	jra .L256
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
.L272:
	mvz.b (%a3,%d3.l),%d0
	move.l %d0,-(%sp)
	jsr lab_of
	addq.l #4,%sp
	tst.l %d0
	jne .L262
.L264:
	clr.b %d1
	moveq #1,%d0
.L263:
	move.b %d1,24(%a2)
	move.b %d0,22(%a2)
	mvz.b %d0,%d0
	mvz.b 20(%a2),%d1
	cmp.l %d0,%d1
	jcs .L265
	clr.b %d0
	move.b %d0,20(%a2)
	move.l %d3,-(%sp)
	jsr restore_recs
	addq.l #4,%sp
.L265:
	mvz.b 22(%a2),%d0
	lsr.l #1,%d0
	jeq .L266
	tst.l %d3
	jeq .L318
	move.l #n_fx2,%d1
.L267:
	move.l %a6,%a1
	sub.l %a0,%a0
.L268:
	move.b (%a0,%d1.l),%d0
	jne .L269
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
.L270:
	addq.l #1,%a2
	lea (16,%a6),%a6
	add.l #36,%d2
	subq.l #1,%d3
	tst.l %d3
	jne .L320
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
.L316:
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
	jeq .L273
	lea l_fx2,%a0
	move.l %a0,84(%sp)
.L274:
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
.L299:
	clr.b (%a3)
	tst.l %a5
	jeq .L275
	sub.l %a0,%a0
	move.w %d2,%d0
	mulu.w #5,%d0
	lea (%a5,%d0.l),%a1
.L276:
	move.b 2(%a1,%a0.l),%d0
	jeq .L277
	move.b %d0,(%a4,%a0.l)
	addq.l #1,%a0
	mov3q.l #4,%d4
	cmp.l %a0,%d4
	jne .L276
.L277:
	clr.b %d5
	move.b %d5,(%a4,%a0.l)
	mvz.w sfu_x+7794,%d0
	and.l 96(%sp),%d0
	tst.l %d0
	jeq .L279
	move.l 92(%sp),%a1
	sub.l %a0,%a0
	lea (-1090,%a1),%a1
	add.l %a3,%a1
.L280:
	move.b (%a1,%a0.l),%d0
	move.b %d0,(%a3,%a0.l)
	jeq .L279
	addq.l #1,%a0
	moveq #17,%d0
	cmp.l %a0,%d0
	jne .L280
.L279:
	moveq #12,%d0
	clr.l %d4
	muls.l %d2,%d0
	lea (22,%a5),%a1
	sub.l %a0,%a0
	clr.l %d1
	add.l 104(%sp),%d0
	add.l #sfu_x,%d0
.L281:
	mvz.b 1(%a5),%d3
	cmp.l %d3,%d1
	jge .L283
	moveq #12,%d3
	cmp.l %d1,%d3
	jne .L284
.L283:
	tst.l %d4
	jeq .L360
	mov3q.l #1,%d5
	cmp.l %a0,%d5
	jge .L360
.L285:
	clr.b %d0
	move.w %a0,%d1
	move.l 56(%sp),%a1
	move.l %a2,100(%sp)
	move.b %d0,16(%a3)
	move.b %d1,(%a1,%d2.l)
	tst.b (%a2)
	jne .L287
	tst.b (%a3)
	jeq .L322
	move.l %a3,%d0
.L288:
	moveq #52,%d1
	muls.l %d6,%d1
	move.l #1075575832,%a6
	move.l %d0,(%a6,%d1.l)
	tst.l %a0
	jeq .L323
	mov3q.l #2,%d0
	cmp.l %a0,%d0
	jne .L324
	lea (22,%a5),%a1
	clr.l %d0
	mvz.b 1(%a5),%d1
	move.l %d1,88(%sp)
	clr.l %d1
.L290:
	cmp.l 88(%sp),%d0
	jge .L297
	moveq #12,%d4
	cmp.l %d0,%d4
	jne .L298
.L297:
	mov3q.l #2,%d5
	cmp.l %d1,%d5
	seq %d1
	mvs.b %d1,%d1
	neg.l %d1
	jra .L295
.L320:
	mov3q.l #1,%d3
	jra .L272
.L262:
	sub.l #sfu_x,%d0
	jmi .L264
	asr.l #1,%d0
	move.l #-1057222719,%d1
	muls.l %d1,%d0
	mvz.w sfu_x+7794,%d1
	btst %d0,%d1
	jeq .L264
	move.b 4(%a5,%d0.l),%d0
	mov3q.l #4,%d4
	mvz.b %d0,%d1
	cmp.l %d1,%d4
	jcc .L264
	subq.l #4,%d0
	move.b %d0,%d1
	mvz.b %d0,%d0
	moveq #8,%d5
	cmp.l %d0,%d5
	scc %d0
	addq.l #3,%d0
	jra .L263
.L318:
	move.l #n_fx1,%d1
	jra .L267
.L269:
	move.b %d0,(%a1)+
	addq.l #1,%a0
	jra .L268
.L266:
	tst.l %d3
	jeq .L319
	move.l #n_fx2,%d0
.L271:
	move.l %d2,%a1
	move.l %d0,(%a1)
	jra .L270
.L319:
	move.l #n_fx1,%d0
	jra .L271
.L331:
	mov3q.l #1,%d7
	jra .L316
.L273:
	lea l_fx1,%a1
	move.l %a1,84(%sp)
	jra .L274
.L284:
	move.b (%a1),%d3
	mov3q.l #3,%d5
	and.l %d3,%d5
	cmp.l %d5,%d2
	jne .L282
	moveq #8,%d5
	and.l %d5,%d3
	lea (%a0,%d0.l),%a6
	addq.l #1,%a0
	move.b 1(%a1),2468(%a6)
	or.l %d3,%d4
.L282:
	addq.l #1,%d1
	lea (9,%a1),%a1
	jra .L281
.L275:
	clr.b %d4
	move.l %d2,%d0
	add.l #50,%d0
	move.b #80,(%a4)
	move.b %d0,1(%a4)
	move.b %d4,2(%a4)
.L360:
	sub.l %a0,%a0
	jra .L285
.L322:
	move.l 84(%sp),%d0
	jra .L288
.L298:
	move.b (%a1),%d3
	mov3q.l #3,%d4
	and.l %d4,%d3
	cmp.l %d3,%d2
	jne .L291
	lea (3,%a1),%a6
	move.l %a6,52(%sp)
	tst.l %d1
	jeq .L325
	lea .LC0,%a6
.L361:
	move.l %a6,44(%sp)
	clr.l %d5
.L294:
	move.l 44(%sp),%a6
	move.b (%a6,%d5.l),%d4
	move.l 52(%sp),%a6
	move.b (%a6,%d5.l),%d3
	tst.b %d4
	jeq .L293
	mvs.b %d4,%d4
	mvs.b %d3,%d3
	addq.l #1,%d5
	cmp.l %d4,%d3
	jeq .L294
.L296:
	clr.l %d1
.L295:
	addq.l #1,%d1
.L289:
	move.l %a0,-(%sp)
	move.l %d1,-(%sp)
	move.l %d6,-(%sp)
	jsr set_look
	lea (12,%sp),%sp
.L287:
	addq.l #1,%d2
	lea (17,%a3),%a3
	addq.l #1,%d6
	addq.l #5,%a4
	mov3q.l #4,%d0
	cmp.l %d2,%d0
	jne .L299
	move.l 48(%sp),%a0
	addq.l #1,%a2
	move.l 100(%sp),%a1
	move.b -1(%a0),%d0
	move.b %d0,1(%a0)
	tst.b (%a1)
	jeq .L300
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	jsr lab_of
	addq.l #4,%sp
	tst.l %d0
	jeq .L326
	sub.l #sfu_x,%d0
	move.l %d0,%d6
	asr.l #1,%d6
	move.l #-1057222719,%d1
	muls.l %d1,%d6
	tst.l %d0
	jlt .L327
	mvz.w sfu_x+7794,%d3
	mov3q.l #1,%d4
	asr.l %d6,%d3
	and.l %d3,%d4
	move.l %d4,96(%sp)
.L301:
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
.L315:
	mov3q.l #5,%d0
	cmp.l %d5,%d0
	jlt .L328
	move.l 88(%sp),%a0
	lea 21(%a5,%a0.l),%a0
	move.l %a0,%d4
.L302:
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
	jeq .L303
	mvz.b 3(%a2),%d0
	cmp.l %d2,%d0
	jle .L304
	tst.l sfu_p
	jeq .L306
	move.l %d2,%a0
	moveq #60,%d1
	lea (%a0,%d2.l*4),%a6
	muls.l %d6,%d1
	clr.l %d0
	add.l %d1,%a6
.L305:
	move.l sfu_p,%d1
	lea (%a6,%d1.l),%a0
	move.b (%a0,%d0.l),%d1
	jeq .L307
	move.b %d1,(%a3,%d0.l)
	addq.l #1,%d0
	mov3q.l #4,%d1
	cmp.l %d0,%d1
	jne .L305
.L307:
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
.L309:
	move.l sfu_p,%d0
	add.l %d1,%d0
	lea (%a0,%d0.l),%a6
	move.b 960(%a6),%d0
	jeq .L310
	move.b %d0,(%a4,%a0.l)
	addq.l #1,%a0
	moveq #16,%d3
	cmp.l %a0,%d3
	jne .L309
.L310:
	clr.b %d0
	move.b %d0,(%a4,%a0.l)
.L303:
	mvz.b 3(%a2),%d0
	cmp.l %d2,%d0
	jle .L304
	tst.b (%a3)
	jne .L304
.L306:
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
.L304:
	move.l %a3,48(%a1)
	tst.b (%a4)
	jeq .L330
	move.l %a4,%d0
.L312:
	mvz.w #32512,%d3
	move.l %d0,40(%a1)
	clr.l 16(%a1)
	mov3q.l #5,%d0
	move.l %d3,12(%a1)
	cmp.l %d5,%d0
	jlt .L313
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
.L313:
	mvz.b 3(%a2),%d0
	cmp.l %d2,%d0
	jgt .L314
	clr.l 52(%sp)
.L314:
	move.l 92(%sp),%a0
	addq.l #1,%d5
	addq.l #4,92(%sp)
	lea (17,%a4),%a4
	addq.l #5,%a3
	addq.l #1,%a5
	move.l 52(%sp),(%a0)+
	moveq #8,%d0
	cmp.l %d5,%d0
	jne .L315
.L300:
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
	jne .L331
	movem.l (%sp),#31996
	addq.l #1,sfu_x+2160
	lea (108,%sp),%sp
	rts
.L325:
	lea .LC1,%a6
	jra .L361
.L293:
	tst.b %d3
	jne .L296
	addq.l #1,%d1
	mov3q.l #2,%d3
	cmp.l %d1,%d3
	jlt .L296
.L291:
	addq.l #1,%d0
	lea (9,%a1),%a1
	jra .L290
.L323:
	clr.l %d1
	jra .L289
.L324:
	mov3q.l #1,%d1
	jra .L289
.L326:
	mov3q.l #-1,%d6
.L327:
	clr.l 96(%sp)
	jra .L301
.L328:
	move.l %a5,%d4
	jra .L302
.L330:
	move.l 84(%sp),%d0
	jra .L312
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
	jcs .L363
	moveq #84,%d0
	muls.l %d0,%d1
	move.l %a6,-(%sp)
	move.l %a0,-(%sp)
	add.l #1100630172,%d1
	move.l %d1,-(%sp)
	jsr xname
.L369:
	lea (12,%sp),%sp
.L364:
	clr.b %d0
	move.b %d0,24(%sp)
	tst.b 16(%sp)
	jeq .L368
	move.l %a6,%d2
.L367:
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
.L363:
	add.l #-16,%d1
	moveq #11,%d2
	cmp.l %d1,%d2
	jcs .L364
	mov3q.l #6,%d3
	rems.l %d3,%d2:%d1
	cmp.l #1847,%d0
	shi %d0
	move.l %d2,%a1
	mvs.b %d0,%d0
	neg.l %d0
	tst.l %d2
	jne .L365
	move.l %a6,-(%sp)
	move.l %a0,-(%sp)
	move.l %d0,-(%sp)
	jsr type_text
	jra .L369
.L365:
	mov3q.l #1,%d3
	cmp.l %d2,%d3
	jne .L366
	move.l %a6,-(%sp)
	move.l %a0,-(%sp)
	clr.l -(%sp)
	jsr sfu_route_text
	jra .L369
.L366:
	move.l %a6,-(%sp)
	move.l %a0,-(%sp)
	clr.l -(%sp)
	pea -2(%a1)
	move.l %d0,-(%sp)
	jsr ptext
	lea (20,%sp),%sp
	jra .L364
.L368:
	move.l #s_wide,%d2
	jra .L367
	.size	sfu_draw, .-sfu_draw
	.align	2
	.type	listed, @function
listed:
	lea (-12,%sp),%sp
	movem.l #1036,(%sp)
	move.l 16(%sp),%a1
	tst.l 20(%sp)
	jeq .L371
	move.l 28(%a1),%a0
	moveq #16,%d3
	clr.l %d2
	clr.l %d0
	lea (20,%a1),%a1
.L372:
	tst.l %a0
	jeq .L379
	cmp.l %a0,%a1
	jeq .L379
	move.l 8(%a0),%a2
	tst.l %a2
	jne .L373
.L371:
	clr.l %d0
.L370:
	movem.l (%sp),#1036
	lea (12,%sp),%sp
	rts
.L373:
	move.l (%a2),%d1
	tst.l %d0
	jeq .L375
	cmp.l #1075718412,%d1
	jeq .L377
	cmp.l #1075712228,%d1
	jeq .L377
	cmp.l #1075719596,%d1
	jeq .L377
	cmp.l #1075717140,%d1
	jne .L371
.L377:
	move.l (%a0),%a0
	subq.l #1,%d3
	tst.l %d3
	jne .L372
.L379:
	and.l %d2,%d0
	jra .L370
.L375:
	cmp.l #1076055292,%d1
	jeq .L382
	cmp.l 20(%sp),%a2
	jne .L377
	cmp.l 24(%sp),%d1
	seq %d1
	mvs.b %d1,%d1
	neg.l %d1
	or.l %d1,%d2
	jra .L377
.L382:
	mov3q.l #1,%d0
	jra .L377
	.size	listed, .-listed
	.align	2
	.type	fxv_view, @function
fxv_view:
	lea (-24,%sp),%sp
	move.l 28(%sp),%a0
	movem.l #1148,(%sp)
	move.l %a0,%d4
	moveq #16,%d6
	move.l 28(%a0),%a2
	mov3q.l #-1,%d3
	clr.l %d2
	clr.l %d5
	add.l #20,%d4
.L402:
	tst.l %a2
	jeq .L410
	cmp.l %a2,%d4
	jeq .L410
	move.l 8(%a2),%a1
	tst.l %a1
	jeq .L403
	move.l (%a1),%a0
	tst.l %d5
	jeq .L404
	cmp.l #1075718412,%a0
	jeq .L407
	cmp.l #1075712228,%a0
	jeq .L407
	cmp.l #1075719596,%a0
	jeq .L407
	cmp.l #1075717140,%a0
	sne %d1
	mvs.b %d1,%d1
	neg.l %d1
	or.l %d1,%d2
.L407:
	move.l (%a2),%a2
	subq.l #1,%d6
	tst.l %d6
	jne .L402
.L410:
	mov3q.l #-1,%d0
	cmp.l %d3,%d0
	jne .L413
.L403:
	clr.l %d0
.L401:
	movem.l (%sp),#1148
	lea (24,%sp),%sp
	rts
.L404:
	cmp.l #1076055292,%a0
	jeq .L416
	mov3q.l #-1,%d0
	cmp.l %d3,%d0
	jne .L407
	move.l #1073969498,%d1
	cmp.l 156(%a0),%d1
	jne .L407
	clr.l -(%sp)
	move.l %a1,-(%sp)
	jsr 1073969498
	addq.l #8,%sp
	moveq #16,%d1
	cmp.l %d0,%d1
	jeq .L417
	moveq #22,%d1
	cmp.l %d0,%d1
	jne .L407
	mov3q.l #1,%d3
	jra .L407
.L416:
	mov3q.l #1,%d5
	jra .L407
.L417:
	clr.l %d3
	jra .L407
.L413:
	lea sfu_p,%a0
	mvz.b 20(%a0,%d3.l),%d1
	add.l #12,%d3
	lsl.l #4,%d1
	or.l %d3,%d1
	tst.l %d2
	jne .L415
	mov3q.l #1,%d2
	eor.l %d5,%d2
.L415:
	move.l %d2,%d0
	lsl.l #6,%d0
	or.l %d1,%d0
	jra .L401
	.size	fxv_view, .-fxv_view
	.align	2
	.type	retitle, @function
retitle:
	link.w %fp,#-8
	move.l 12(%fp),%d0
	move.l %a2,-(%sp)
	move.l 8(%fp),%a2
	clr.l -4(%fp)
	tst.l %d0
	jne .L434
	move.l (%a2),%a0
	move.l %a2,-(%sp)
	move.l 76(%a0),%a0
	jsr (%a0)
	addq.l #4,%sp
.L434:
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
	jcs .L436
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
.L437:
	move.l 16(%sp),%a1
	move.l %a0,(%a1)
	lea sfu_p,%a1
	move.b 20(%a1,%a0.l),%d0
	jeq .L440
	mvz.b %d0,%d0
	subq.l #1,%d0
	lsl.l #3,%d0
	add.l %d1,%d0
	mvz.b 24(%a1,%a0.l),%d1
	cmp.l %d1,%d0
	jlt .L435
	moveq #-2,%d0
	jra .L435
.L436:
	subq.l #1,%d0
	mov3q.l #3,%d1
	cmp.l %d0,%d1
	jcc .L438
.L440:
	mov3q.l #-1,%d0
.L435:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L438:
	move.l %d0,%d2
	mov3q.l #1,%d3
	and.l %d3,%d0
	asr.l #1,%d2
	move.l %d2,%a0
	move.l %d0,%d1
	addq.l #6,%d1
	jra .L437
	.size	pq, .-pq
	.align	2
	.type	try_send, @function
try_send:
	mov3q.l #1,%d0
	cmp.l 1094562388.l,%d0
	jeq .L446
.L452:
	clr.l %d0
.L445:
	rts
.L446:
	move.l #1123449384,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L448
	addq.l #1,sfu_x+2156
	jra .L445
.L448:
	mvz.w #4027,%d0
	cmp.l 1094562392.l,%d0
	jlt .L449
	move.l 1094562704,%a0
	mov3q.l #4,%d0
.L450:
	tst.l %a0
	jeq .L449
	move.l 52(%a0),%a0
	subq.l #1,%d0
	tst.l %d0
	jne .L450
	move.l 4(%sp),-(%sp)
	move.l 12(%sp),-(%sp)
	jsr 1073752544
	move.l #1123449384,-(%sp)
	jsr 1073746414
	lea (12,%sp),%sp
	mov3q.l #1,%d0
	jra .L445
.L449:
	move.l #1123449384,-(%sp)
	jsr 1073746414
	addq.l #1,sfu_x+2156
	addq.l #4,%sp
	jra .L452
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
	jne .L467
	move.l %d2,%d3
	mov3q.l #1,%d0
	mvz.w %d3,%d3
	and.l %d2,%d0
	move.l %d3,%d4
	asr.l #8,%d4
	move.l %d4,%a1
	btst #0,%d2
	jne .L460
	asr.l #1,%d3
	moveq #127,%d0
	move.l %d4,%d1
	and.l %d3,%d0
	move.l %d0,%a1
	mov3q.l #3,%d0
.L459:
	mov3q.l #1,%d3
	and.l 16(%sp),%d3
	move.l %d3,%d2
	addq.l #1,%d2
	tst.l %a0
	jge .L461
	not.l %d2
	and.l %d0,%d2
	move.l %a1,%d0
.L462:
	mov3q.l #1,%d4
	cmp.l %d2,%d4
	jne .L466
	lsl.l #8,%d1
	mov3q.l #1,%d0
	jra .L470
.L460:
	btst #1,%d2
	jne .L468
	move.l %d4,%d1
	sub.l %a1,%a1
	jra .L459
.L467:
	sub.l %a1,%a1
	clr.l %d1
	clr.l %d0
	jra .L459
.L468:
	mov3q.l #2,%d0
	jra .L459
.L461:
	or.l %d0,%d2
	move.l %a0,%d0
	cmp.l #32512,%a0
	jle .L463
	mvz.w #32512,%d0
.L463:
	asr.l #8,%d0
	tst.l %d3
	jne .L464
	move.l %d0,%d1
	move.l %a1,%d0
.L464:
	mov3q.l #3,%d3
	cmp.l %d2,%d3
	jne .L462
	lsl.l #8,%d1
	add.l %d0,%d0
.L470:
	or.l %d1,%d0
.L458:
	movem.l (%sp),#28
	lea (12,%sp),%sp
	rts
.L466:
	subq.l #2,%d2
	tst.l %d2
	jne .L469
	lsl.l #8,%d0
	mov3q.l #3,%d3
	or.l %d3,%d0
	jra .L458
.L469:
	mov3q.l #-1,%d0
	jra .L458
	.size	lk_put, .-lk_put
	.align	2
	.globl	sfu_sysex
	.type	sfu_sysex, @function
sfu_sysex:
	lea (-52,%sp),%sp
	move.l -66650100,%d0
	move.l 56(%sp),%a0
	movem.l #31996,(%sp)
	move.l 60(%sp),%d1
	move.l %d0,44(%sp)
	tst.l %a0
	jne .L472
	move.l #sfu_fxv,%d0
.L471:
	movem.l (%sp),#31996
	lea (52,%sp),%sp
	rts
.L472:
	moveq #9,%d2
	cmp.l %d1,%d2
	jne .L474
	mvz.b 4(%a0),%d0
	moveq #34,%d3
	cmp.l %d0,%d3
	jne .L475
	mvz.b 5(%a0),%d0
	subq.l #4,%d0
	tst.l %d0
	jne .L475
	mvz.b 6(%a0),%d0
	mov3q.l #1,%d5
	cmp.l %d0,%d5
	jcs .L476
	move.b 7(%a0),%d1
	mvz.b %d1,%d2
	cmp.l %d2,%d5
	jcs .L476
	lea sfu_fxv,%a0
	move.b %d1,8(%a0,%d0.l)
.L476:
	mov3q.l #1,-(%sp)
	move.l 48(%sp),-(%sp)
	jsr timed
	addq.l #8,%sp
	mov3q.l #1,%d0
	jra .L471
.L474:
	moveq #10,%d6
	cmp.l %d1,%d6
	jge .L477
	mvz.b 4(%a0),%d0
	moveq #34,%d2
	cmp.l %d0,%d2
	jne .L475
	mvz.b 5(%a0),%d0
	subq.l #3,%d0
	tst.l %d0
	jne .L478
	mvz.b 6(%a0),%d2
	mov3q.l #1,%d4
	cmp.l %d2,%d4
	jcs .L475
	mvz.b 7(%a0),%d3
	mov3q.l #4,%d5
	cmp.l %d3,%d5
	jcc .L475
	move.b 8(%a0),%d0
	jeq .L475
	mvz.b %d0,%d0
	moveq #17,%d6
	add.l %d0,%d3
	cmp.l %d3,%d6
	jlt .L475
	add.l #9,%d0
	cmp.l %d1,%d0
	jge .L475
	lea sfu_p,%a2
	tst.w 50(%a2,%d2.l*2)
	jne .L479
	move.l 62(%a2,%d2.l*4),%d0
	tst.l %d0
	jeq .L550
	move.l -66650100,%d1
	sub.l %d0,%d1
	cmp.l #65999999,%d1
	jhi .L550
.L479:
	addq.l #1,sfu_p+74
	jra .L476
.L483:
	move.b 9(%a0,%a1.l),%d0
	mvz.b 7(%a0),%d3
	moveq #127,%d2
	lea -5(%a1,%d3.l),%a3
	and.l %d0,%d2
	mvz.b 26(%a2,%a3.l),%d3
	cmp.l %d2,%d3
	jeq .L481
	move.b %d2,26(%a2,%a3.l)
	mov3q.l #1,%d1
.L481:
	addq.l #1,%a1
.L482:
	mvz.b 8(%a0),%d0
	cmp.l %a1,%d0
	jgt .L483
	tst.l %d1
	jeq .L479
	moveq #1,%d5
	move.b %d5,sfu_p+54
	jra .L479
.L550:
	moveq #12,%d4
	clr.l %d1
	muls.l %d4,%d2
	sub.l %a1,%a1
	add.l %d2,%a2
	jra .L482
.L477:
	moveq #10,%d6
	cmp.l %d1,%d6
	jne .L484
	mvz.b 4(%a0),%d0
	moveq #34,%d2
	cmp.l %d0,%d2
	jne .L475
.L478:
	mvz.b 5(%a0),%d0
	subq.l #2,%d0
	tst.l %d0
	jne .L475
	mvz.b 6(%a0),%d0
	mov3q.l #1,%d4
	cmp.l %d0,%d4
	jcs .L476
	mvz.b sfu_x+6688,%d1
	lea sfu_x,%a1
	btst %d0,%d1
	jne .L485
	lea (%a1,%d0.l*4),%a2
	move.l 6698(%a2),%d1
	tst.l %d1
	jeq .L486
	move.l -66650100,%d2
	sub.l %d1,%d2
	cmp.l #65999999,%d2
	jls .L485
.L486:
	move.b 7(%a0),%d1
	moveq #127,%d3
	moveq #127,%d5
	move.l %d0,%d2
	add.l #3342,%d2
	mvz.b (%a1,%d2.l*2),%d4
	and.l %d1,%d3
	cmp.l %d4,%d3
	jne .L487
	lea (%a1,%d0.l*2),%a2
	move.b 8(%a0),%d0
	mvz.b 6685(%a2),%d1
	and.l %d5,%d0
	cmp.l %d1,%d0
	jeq .L485
.L487:
	move.b %d3,(%a1,%d2.l*2)
	moveq #127,%d6
	mvz.b 6(%a0),%d0
	lea (%a1,%d0.l*2),%a1
	move.b 8(%a0),%d0
	and.l %d6,%d0
	move.b %d0,6685(%a1)
	moveq #1,%d0
	move.b %d0,sfu_x+6689
.L485:
	addq.l #1,sfu_x+6694
	jra .L476
.L484:
	moveq #8,%d2
	cmp.l %d1,%d2
	jne .L476
.L475:
	mvz.b 5(%a0),%d0
	subq.l #1,%d0
	tst.l %d0
	jne .L476
	mvz.b 4(%a0),%d0
	moveq #33,%d4
	cmp.l %d0,%d4
	jne .L488
	addq.l #1,sfu_x+2320
	tst.b 6(%a0)
	jeq .L489
	clr.b %d5
	mov3q.l #1,sfu_x+2316
	lea sfu_st,%a1
	clr.l %d0
	move.b %d5,sfu_x+2188
.L490:
	clr.b (%a1)
	addq.l #1,%d0
	addq.l #8,%a1
	cmp.l #128,%d0
	jne .L490
	lea sfu_x,%a1
	clr.l %d0
.L491:
	clr.b (%a1)
	addq.l #1,%d0
	lea (130,%a1),%a1
	moveq #16,%d6
	cmp.l %d0,%d6
	jne .L491
	move.l #1330005504,%a1
	addq.l #1,sfu_x+2080
	move.l %a1,sfu_st
.L489:
	subq.l #1,%d1
	addq.l #8,%a0
	moveq #9,%d3
	lea sfu_st,%a3
	lea sfu_x+2188,%a4
.L492:
	move.l %d3,%d0
	add.l #12,%d0
	cmp.l %d1,%d0
	jlt .L501
	moveq #2,%d0
	addq.l #1,sfu_x+2596
	addq.l #1,sfu_x+2320
	move.b %d0,sfu_st+1027
	jra .L476
.L501:
	move.b (%a0),%d2
	jmi .L493
	move.b %d2,%d0
	sub.l %a2,%a2
	ext.w %d0
	mvz.w %d0,%d0
	lsl.l #3,%d0
	move.l %d0,%a1
	add.l #sfu_st,%a1
.L497:
	move.b 1(%a0,%a2.l),%d0
	moveq #94,%d5
	move.l %d0,%d4
	add.l #-32,%d4
	mvz.b %d4,%d4
	cmp.l %d4,%d5
	jcs .L494
	move.b %d0,(%a1,%a2.l)
.L495:
	addq.l #1,%a2
	mov3q.l #7,%d0
	cmp.l %a2,%d0
	jne .L497
	jra .L496
.L494:
	clr.b %d6
	move.b %d6,(%a1,%a2.l)
	tst.b %d0
	jne .L495
.L496:
	mvz.b %d2,%d4
	clr.b %d5
	sub.l %a1,%a1
	move.l %d4,%d0
	lsl.l #3,%d0
	move.b %d5,7(%a3,%d0.l)
	move.l sfu_x+2316,%d0
.L498:
	cmp.l %a1,%d0
	jle .L499
	mvz.b (%a4,%a1.l),%d5
	cmp.l %d4,%d5
	jne .L500
.L499:
	cmp.l %d0,%a1
	jne .L493
	cmp.l #128,%d0
	jeq .L493
	move.l %d0,%d6
	add.l #sfu_x,%d0
	move.l %d0,%a1
	addq.l #1,%d6
	move.b %d2,2188(%a1)
	move.l %d6,sfu_x+2316
.L493:
	lea (14,%a0),%a0
	add.l #14,%d3
	jra .L492
.L500:
	addq.l #1,%a1
	jra .L498
.L488:
	moveq #36,%d2
	cmp.l %d0,%d2
	jne .L502
	moveq #23,%d3
	cmp.l %d1,%d3
	jge .L503
	mov3q.l #7,%d0
	and.l %d1,%d0
	tst.l %d0
	jne .L503
	move.b 6(%a0),%d2
	moveq #127,%d4
	mvz.b %d2,%d0
	cmp.l %d0,%d4
	jge .L504
.L503:
	addq.l #1,sfu_x+2144
	jra .L476
.L504:
	lea sfu_x,%a2
	addq.l #1,%d0
	move.l %a2,%a3
	clr.l %d3
.L507:
	mvz.b (%a3),%d4
	move.l %a3,%a1
	cmp.l %d4,%d0
	jeq .L505
	sub.l %a1,%a1
.L505:
	addq.l #1,%d3
	moveq #16,%d5
	cmp.l %d3,%d5
	jeq .L552
	lea (130,%a3),%a3
	tst.l %a1
	jeq .L507
.L552:
	clr.l %d0
.L509:
	tst.l %a1
	jeq .L511
.L512:
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
.L513:
	mvz.w %a3,%d0
	lea (%a0,%d0.l*4),%a2
	move.l %a2,%d4
	sub.l %a2,%a2
.L515:
	move.b 7(%a2,%d4.l),%d3
	moveq #94,%d5
	move.l %d3,%d0
	add.l #-32,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d5
	jcs .L514
	move.b %d3,2(%a4,%a2.l)
	addq.l #1,%a2
	mov3q.l #4,%d6
	cmp.l %a2,%d6
	jne .L515
.L514:
	lea (%a3,%a3.l*4),%a5
	clr.b %d3
	addq.l #1,%a3
	addq.l #5,%a4
	mov3q.l #4,%d4
	move.l %a5,%d0
	add.l %a1,%d0
	move.b %d3,2(%a2,%d0.l)
	cmp.l %a3,%d4
	jne .L513
	moveq #127,%d0
	cmp.l %d1,%d0
	jlt .L553
	asr.l #3,%d1
	subq.l #3,%d1
.L517:
	lea (23,%a0),%a0
	clr.l %d0
	lea (22,%a1),%a2
.L518:
	cmp.l %d0,%d1
	jne .L521
	addq.l #1,%d2
	move.b %d0,1(%a1)
	move.b %d2,(%a1)
	addq.l #1,sfu_x+2148
.L605:
	addq.l #1,sfu_x+2080
	jra .L476
.L511:
	tst.b (%a2)
	jne .L508
	move.l %a2,%a1
.L508:
	addq.l #1,%d0
	lea (130,%a2),%a2
	moveq #16,%d6
	cmp.l %d0,%d6
	jne .L509
	tst.l %a1
	jne .L512
	jra .L503
.L553:
	moveq #12,%d1
	jra .L517
.L521:
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
.L520:
	move.b 3(%a0,%a3.l),%d4
	moveq #94,%d6
	move.l %d4,%d3
	add.l #-32,%d3
	mvz.b %d3,%d3
	cmp.l %d3,%d6
	jcs .L519
	move.b %d4,25(%a4,%a3.l)
	addq.l #1,%a3
	mov3q.l #5,%d3
	cmp.l %a3,%d3
	jne .L520
.L519:
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
	jra .L518
.L502:
	moveq #81,%d5
	cmp.l %d0,%d5
	jne .L522
	moveq #9,%d6
	cmp.l %d1,%d6
	jge .L523
	mvz.b 6(%a0),%d3
	moveq #127,%d0
	cmp.l %d3,%d0
	jlt .L523
	move.b 7(%a0),%d0
	jeq .L523
	move.b 8(%a0),%d2
	move.l %d2,%d4
	subq.l #1,%d4
	mvz.b %d4,%d4
	lsr.l #2,%d4
	jne .L523
	mvz.b %d2,%d6
	ext.w %d2
	move.l %d6,48(%sp)
	muls.w #20,%d2
	add.l #9,%d2
	cmp.l %d1,%d2
	jlt .L524
.L523:
	addq.l #1,sfu_x+7936
	jra .L476
.L524:
	addq.l #1,%d3
	lea sfu_x,%a1
	clr.l %d2
.L527:
	mvz.b (%a1),%d4
	move.l %a1,%d1
	cmp.l %d4,%d3
	jeq .L525
	clr.l %d1
.L525:
	addq.l #1,%d2
	moveq #16,%d4
	cmp.l %d2,%d4
	jeq .L526
	lea (130,%a1),%a1
	tst.l %d1
	jeq .L527
.L528:
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
.L542:
	moveq #15,%d6
	cmp.l %d0,%d6
	jlt .L529
	mov3q.l #3,%d5
	cmp.l %d0,%d5
	jge .L530
	move.l (%a3),%a1
	tst.l %a1
	jne .L604
.L529:
	move.w sfu_x+7794,%d0
	addq.l #1,sfu_x+7932
	or.l %d0,%d2
	move.w %d2,sfu_x+7794
	jra .L605
.L526:
	tst.l %d1
	jne .L528
	jra .L523
.L530:
	move.l %d0,%d7
	lsl.l #4,%d7
	move.l %d7,%a1
	add.l %d0,%a1
	add.l %a5,%a1
.L532:
	sub.l %a2,%a2
.L534:
	move.b (%a0,%a2.l),%d7
	moveq #94,%d6
	move.l %d7,%d5
	add.l #-32,%d5
	mvz.b %d5,%d5
	cmp.l %d5,%d6
	jcs .L535
	move.b %d7,(%a1,%a2.l)
	addq.l #1,%a2
	moveq #16,%d5
	cmp.l %a2,%d5
	jne .L534
.L535:
	tst.l %a2
	jeq .L555
	mvs.b -1(%a1,%a2.l),%d5
	move.l %a2,%d7
	moveq #32,%d6
	cmp.l %d5,%d6
	jeq .L537
.L536:
	clr.b %d5
	mov3q.l #3,%d6
	move.b %d5,(%a1,%d7.l)
	cmp.l %d0,%d6
	jge .L538
	move.l %d0,%a1
	subq.l #4,%a1
	move.l %a1,%d5
	mov3q.l #5,%d6
	muls.l %d6,%d5
	sub.l %a2,%a2
	move.l %d5,%a1
	lea (%a1,%d1.l),%a4
.L540:
	move.b -4(%a0,%a2.l),%d5
	moveq #94,%d6
	move.l %d5,%d7
	add.l #-32,%d7
	mvz.b %d7,%d7
	cmp.l %d7,%d6
	jcs .L539
	move.l (%a3),%d7
	add.l %a4,%d7
	move.b %d5,(%a2,%d7.l)
	addq.l #1,%a2
	mov3q.l #4,%d5
	cmp.l %a2,%d5
	jne .L540
.L539:
	clr.b %d6
	add.l %d1,%a1
	add.l (%a3),%a1
	move.b %d6,(%a1,%a2.l)
.L538:
	mvz.b 4(%a3,%d4.l),%d5
	move.l %d0,%d7
	addq.l #1,%d7
	cmp.l %d5,%d0
	jlt .L541
	move.b %d7,4(%a3,%d4.l)
.L541:
	addq.l #1,%d3
	move.l %d7,%d0
	lea (20,%a0),%a0
	cmp.l 48(%sp),%d3
	jlt .L542
	jra .L529
.L604:
	move.l %d0,%d7
	lsl.l #4,%d7
	add.l %d0,%d7
	add.l %a6,%d7
	add.l %d7,%a1
	jra .L532
.L537:
	subq.l #1,%a2
	jra .L535
.L555:
	clr.l %d7
	jra .L536
.L522:
	moveq #34,%d6
	cmp.l %d0,%d6
	jne .L476
	moveq #8,%d0
	cmp.l %d1,%d0
	jeq .L476
	mvz.b 6(%a0),%d2
	mov3q.l #1,%d3
	cmp.l %d2,%d3
	jcs .L476
	mvz.b 8(%a0),%d3
	move.b 7(%a0),%d0
	subq.l #3,%d3
	tst.l %d3
	jne .L556
	move.b %d0,%d3
.L543:
	lea sfu_st,%a3
	lea (%a3,%d2.l),%a1
	move.b %d3,1024(%a1)
	mvz.b 8(%a0),%d2
	subq.l #3,%d2
	tst.l %d2
	jne .L476
	tst.b %d0
	jlt .L476
	mvz.b %d0,%d2
	lsl.l #3,%d2
	tst.b (%a3,%d2.l)
	jne .L476
	ext.w %d0
	subq.l #1,%d1
	sub.l %a2,%a2
	mvz.w %d0,%d0
	lsl.l #3,%d0
	lea (%a3,%d0.l),%a1
	moveq #9,%d0
.L544:
	cmp.l %d1,%d0
	jge .L546
	move.b (%a0,%d0.l),%d4
	moveq #94,%d6
	move.l %d4,%d3
	add.l #-32,%d3
	mvz.b %d3,%d3
	cmp.l %d3,%d6
	jcs .L546
	move.b %d4,(%a1,%a2.l)
	addq.l #1,%a2
	addq.l #1,%d0
	mov3q.l #7,%d3
	cmp.l %a2,%d3
	jne .L544
.L546:
	clr.b %d4
	add.l %d2,%a3
	move.b %d4,(%a3,%a2.l)
	jra .L476
.L556:
	st %d3
	jra .L543
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
	jmi .L611
	move.l %d2,%d1
	mov3q.l #1,%d3
	mvz.w %d1,%d1
	and.l %d2,%d3
	move.l %d1,%a1
	asr.l #8,%d1
	move.l %d3,%a0
	btst #0,%d2
	jne .L608
	move.l %a1,%d2
	asr.l #1,%d2
	move.l %d1,%d0
	moveq #127,%d1
	mov3q.l #3,%a0
	and.l %d2,%d1
.L607:
	mov3q.l #1,%d2
	and.l 12(%sp),%d2
	move.l %a0,%d3
	move.l %d2,%a1
	addq.l #1,%d2
	and.l %d3,%d2
	tst.l %d2
	jeq .L613
	tst.l %a1
	jeq .L610
	move.l %d1,%d0
.L610:
	lsl.l #8,%d0
.L606:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L608:
	btst #1,%d2
	jne .L612
	move.l %d1,%d0
	clr.l %d1
	jra .L607
.L611:
	clr.l %d1
	clr.l %d0
	sub.l %a0,%a0
	jra .L607
.L612:
	mov3q.l #2,%a0
	jra .L607
.L613:
	mov3q.l #-1,%d0
	jra .L606
	.size	lk_half, .-lk_half
	.align	2
	.type	lclr, @function
lclr:
	lea (-28,%sp),%sp
	moveq #13,%d0
	movem.l #124,(%sp)
	move.l 36(%sp),%d2
	move.l %d2,%d6
	move.l 32(%sp),%d4
	add.l #-14,%d6
	move.l 40(%sp),%d5
	move.l 44(%sp),%a0
	move.l 48(%sp),20(%sp)
	move.l 52(%sp),24(%sp)
	cmp.l %d6,%d0
	jcs .L615
	moveq #15,%d1
	cmp.l %d2,%d1
	jge .L616
	move.l %d2,%d1
	mov3q.l #6,%d3
	add.l #-16,%d1
	rems.l %d3,%d0:%d1
	mov3q.l #1,%d1
	cmp.l %d0,%d1
	jge .L615
.L616:
	move.l %d5,-(%sp)
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	jsr (%a0)
	lea (12,%sp),%sp
	addq.l #1,sfu_st+1030
	move.l %d0,%d3
	tst.l %d0
	jlt .L618
	move.l %d0,-(%sp)
	move.l %d6,-(%sp)
	jsr lk_half
	addq.l #8,%sp
	addq.l #1,%d0
	tst.l %d0
	jeq .L618
	mov3q.l #-1,-(%sp)
	move.l %d3,-(%sp)
	move.l %d6,-(%sp)
	jsr lk_put
	lea (12,%sp),%sp
	mov3q.l #-1,%d3
	cmp.l %d0,%d3
	jeq .L615
	move.l %d5,44(%sp)
	move.l %d2,36(%sp)
	move.l %d4,32(%sp)
	movem.l (%sp),#124
	move.l %d0,40(%sp)
	move.l 20(%sp),%a1
	lea (28,%sp),%sp
	jmp (%a1)
.L615:
	move.l %d5,40(%sp)
	move.l %d2,36(%sp)
	move.l %d4,32(%sp)
	movem.l (%sp),#124
	move.l 24(%sp),%a1
	lea (28,%sp),%sp
	jmp (%a1)
.L618:
	movem.l (%sp),#124
	clr.l %d0
	lea (28,%sp),%sp
	rts
	.size	lclr, .-lclr
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
	jne .L627
	mvz.b sfu_x+2090,%d0
	cmp.l %d0,%d3
	jne .L627
	mvz.b sfu_x+2091,%d0
	cmp.l %d0,%d2
	jeq .L628
.L627:
	lea sfu_x+2080,%a0
	move.l (%a0),sfu_x+2084
	jsr relabel
.L628:
	tst.b sfu_p+20.l
	jne .L629
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
.L629:
	tst.b sfu_p+21.l
	jne .L626
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
.L626:
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
	jne .L632
.L634:
	mov3q.l #1,%d0
.L631:
	rts
.L632:
	move.l 4(%sp),-(%sp)
	jsr xmode
	addq.l #4,%sp
	tst.l %d0
	jne .L634
	move.l sfu_p+522,%a0
	tst.l %a0
	jeq .L631
	move.l 24(%a0),%a0
	move.l 4(%sp),-(%sp)
	jsr (%a0)
	addq.l #4,%sp
	tst.l %d0
	sne %d0
	mvs.b %d0,%d0
	neg.l %d0
	jra .L631
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
	jeq .L639
	move.l %d0,%d2
	tst.l %d0
	jge .L641
	clr.l %d2
.L641:
	move.l %d3,%d0
	moveq #13,%d1
	add.l #-14,%d0
	cmp.l %d0,%d1
	jcs .L642
	btst #0,%d0
	jeq .L643
	lsl.l #7,%d2
.L643:
	and.l #32512,%d2
.L638:
	move.l %d2,%d0
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L639:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	jsr 1074433530
	addq.l #8,%sp
	move.l %d0,%d2
	jra .L641
.L642:
	move.l %d3,-(%sp)
	jsr xmode
	addq.l #4,%sp
	tst.l %d0
	jeq .L638
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
	jeq .L649
	tst.l %d0
	jlt .L655
	move.l -4(%fp),%d1
	moveq #12,%d2
	muls.l %d2,%d1
	move.l %d1,%a0
	add.l #sfu_p,%a0
	mvz.b 26(%a0,%d0.l),%d2
.L656:
	lsl.l #8,%d2
.L648:
	move.l %d2,%d0
	move.l -16(%fp),%d2
	move.l -12(%fp),%d3
	unlk %fp
	rts
.L649:
	move.l -8(%fp),%d0
	mov3q.l #3,%d1
	subq.l #1,%d0
	cmp.l %d0,%d1
	jcs .L651
	add.l #sfu_x+6684,%d0
	move.l %d0,%a0
	mvz.b (%a0),%d2
	jra .L656
.L651:
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
	jcs .L648
	tst.b sfu_st+1026.l
	jeq .L652
	move.l %d3,-(%sp)
	jsr sync
	addq.l #4,%sp
.L652:
	move.l -8(%fp),%d1
	btst #0,%d1
	jeq .L653
	lsl.l #7,%d2
.L653:
	and.l #32512,%d2
	move.l -12(%fp),%d3
	move.l -8(%fp),8(%fp)
	move.l %d2,12(%fp)
	move.l -16(%fp),%d2
	unlk %fp
	jra to_knob
.L655:
	clr.l %d2
	jra .L648
	.size	sfu_f_read, .-sfu_f_read
	.align	2
	.globl	sfu_s_write
	.type	sfu_s_write, @function
sfu_s_write:
	lea (-24,%sp),%sp
	moveq #13,%d0
	movem.l #60,(%sp)
	move.l 32(%sp),%d3
	move.l %d3,%d5
	move.l 28(%sp),%d4
	add.l #-14,%d5
	move.l 36(%sp),%d2
	move.l 40(%sp),16(%sp)
	move.l 44(%sp),20(%sp)
	cmp.l %d5,%d0
	jcs .L658
	move.l %d3,-(%sp)
	move.l %d4,-(%sp)
	addq.l #1,sfu_st+1030
	jsr 1074433530
	addq.l #8,%sp
	cmp.l #32512,%d2
	jle .L659
	mvz.w #32512,%d2
.L660:
	btst #0,%d5
	jeq .L661
	asr.l #7,%d2
	and.l #32512,%d0
	and.l #254,%d2
.L673:
	or.l %d0,%d2
.L662:
	move.l %d2,36(%sp)
	move.l %d3,32(%sp)
	move.l %d4,28(%sp)
	movem.l (%sp),#60
	move.l 20(%sp),44(%sp)
	move.l 16(%sp),40(%sp)
	lea (24,%sp),%sp
	jmp 1074438046
.L659:
	tst.l %d2
	jge .L660
	clr.l %d2
	jra .L660
.L661:
	and.l #32512,%d2
	and.l #254,%d0
	jra .L673
.L658:
	move.l %d3,-(%sp)
	jsr um_val
	addq.l #4,%sp
	lea xmode,%a0
	addq.l #1,%d0
	tst.l %d0
	jeq .L663
	move.l sfu_p+522,%a1
	move.l 8(%a1),%d4
	move.l %d3,-(%sp)
	jsr (%a0)
	addq.l #4,%sp
	tst.l %d0
	jeq .L664
	move.l %d2,-(%sp)
	move.l %d3,-(%sp)
	jsr x_half
	addq.l #8,%sp
	move.l %d0,%d2
.L664:
	move.l %d2,32(%sp)
	move.l %d3,28(%sp)
	move.l %d4,%a1
	movem.l (%sp),#60
	lea (24,%sp),%sp
	jmp (%a1)
.L663:
	move.l %d3,-(%sp)
	jsr (%a0)
	addq.l #4,%sp
	tst.l %d0
	jeq .L662
	move.l %d3,-(%sp)
	move.l %d4,-(%sp)
	jsr 1074433530
	move.l %d2,-(%sp)
	move.l %d3,-(%sp)
	move.l %d0,%d5
	jsr x_half
	lea (16,%sp),%sp
	move.l %d3,%a0
	add.l #sfu_x,%a0
	move.l %d0,%d2
	tst.b 6223(%a0)
	jeq .L662
	tst.l %d5
	jlt .L662
	and.l #32512,%d2
	and.l #224,%d5
	or.l %d5,%d2
	jra .L662
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
	jeq .L675
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
	jeq .L676
	clr.b (%a3)
.L676:
	move.l 8(%a2),%d0
	cmp.l %d0,%d1
	jle .L677
	move.l %d1,%d0
.L677:
	move.l 12(%a2),%d1
	cmp.l %d0,%d1
	jge .L678
	move.l %d1,%d0
.L678:
	move.l %d2,32(%sp)
	move.l %d4,28(%sp)
	movem.l (%sp),#3100
	addq.l #1,sfu_p+546
	clr.l 44(%sp)
	clr.l 40(%sp)
	move.l %d0,36(%sp)
	lea (24,%sp),%sp
	jra sfu_s_write
.L675:
	move.l %d2,-(%sp)
	jsr xmode
	addq.l #4,%sp
	subq.l #4,%d0
	tst.l %d0
	jne .L679
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	jsr 1074433530
	move.l %d3,-(%sp)
	move.l %d0,-(%sp)
	move.l %d2,-(%sp)
	jsr step_to
	lea (20,%sp),%sp
	move.l %d0,%d3
.L679:
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
	link.w %fp,#-32
	movem.l #1148,(%sp)
	move.l 12(%fp),%d6
	pea -4(%fp)
	move.l 8(%fp),%a2
	move.l %d6,-(%sp)
	move.l 16(%fp),%d2
	jsr pq
	addq.l #8,%sp
	mov3q.l #-1,%d1
	cmp.l %d0,%d1
	jeq .L684
	tst.l %d0
	jlt .L685
	asr.l #8,%d2
	moveq #127,%d5
	cmp.l %d2,%d5
	jge .L686
	moveq #127,%d2
.L687:
	move.l -4(%fp),%d1
	moveq #12,%d3
	lea sfu_p,%a0
	muls.l %d1,%d3
	lea (%a0,%d3.l),%a1
	mvz.b 26(%a1,%d0.l),%d3
	cmp.l %d3,%d2
	jeq .L685
	move.b %d2,26(%a1,%d0.l)
	mov3q.l #1,%d2
	lsl.l %d0,%d2
	add.l #25,%d1
	move.w (%a0,%d1.l*2),%d0
	or.l %d0,%d2
	move.w %d2,(%a0,%d1.l*2)
.L685:
	mov3q.l #1,%d0
.L683:
	movem.l -32(%fp),#1148
	unlk %fp
	rts
.L686:
	tst.l %d2
	jge .L687
	clr.l %d2
	jra .L687
.L684:
	move.l %d6,%d0
	mov3q.l #3,%d1
	subq.l #1,%d0
	cmp.l %d0,%d1
	jcs .L689
	asr.l #8,%d2
	moveq #127,%d5
	cmp.l %d2,%d5
	jge .L690
	moveq #127,%d2
.L691:
	move.l %d0,%d1
	move.l %d0,%a0
	add.l #sfu_x+6684,%a0
	mvz.b (%a0),%d0
	asr.l #1,%d1
	cmp.l %d0,%d2
	jeq .L685
	mov3q.l #1,%d0
	lsl.l %d1,%d0
	move.b sfu_x+6688,%d1
	move.b %d2,(%a0)
	or.l %d1,%d0
	move.b %d0,sfu_x+6688
	jra .L685
.L690:
	tst.l %d2
	jge .L691
	clr.l %d2
	jra .L691
.L689:
	move.l %d6,%d1
	add.l #-14,%d1
	move.l %d1,-8(%fp)
	moveq #13,%d5
	cmp.l %d1,%d5
	jcs .L692
	lea k_cidx,%a0
	move.l %d6,-(%sp)
	mvz.b (%a0,%d1.l),%d3
	move.l %a2,-(%sp)
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
	move.l -8(%fp),-(%sp)
	jsr to_half
	lea (24,%sp),%sp
	move.l %d0,%d2
	cmp.l #32512,%d0
	jle .L693
	mvz.w #32512,%d2
.L694:
	move.l -8(%fp),%d1
	mov3q.l #1,%d4
	and.l -8(%fp),%d4
	btst #0,%d1
	jeq .L695
	asr.l #7,%d2
	and.l #32512,%d5
	and.l #254,%d2
.L700:
	or.l %d5,%d2
	mov3q.l #1,%d5
	cmp.l -8(%fp),%d5
	jge .L697
	move.l %d6,%d0
	mov3q.l #6,%d5
	add.l #-16,%d0
	rems.l %d5,%d1:%d0
	tst.l %d1
	jne .L697
	mov3q.l #7,%d1
	cmp.l -8(%fp),%d1
	slt %d0
	lea sfu_x,%a0
	mvs.b %d0,%d0
	sub.l %d0,%a0
	move.l %d2,%d0
	asr.l #8,%d0
	move.b %d0,2088(%a0)
.L697:
	moveq #37,%d5
	cmp.l %d3,%d5
	jge .L692
	move.l 20(%a2),%a0
	move.l (%a0),%a1
	move.l %a0,-(%sp)
	move.l 40(%a1),%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l %d3,%d1
	add.l #-38,%d1
	mvz.w %d1,%d1
	add.l %d1,%d1
	move.l %d1,%a1
	add.l #1081499899,%a1
	tst.l %d4
	jeq .L699
	mvz.w #65280,%d1
.L698:
	add.l %d3,%d3
	move.l %d0,%a0
	move.w %d2,(%a0,%d3.l)
	move.l %d3,%a0
	add.l #-2147423840,%a0
	move.w (%a0),%d0
	eor.l %d2,%d0
	and.l %d1,%d0
	eor.l %d2,%d0
	move.w %d0,(%a0)
	move.l %d2,%d0
	asr.l #8,%d0
	move.b %d0,(%a1)
	move.b %d2,1(%a1)
	jra .L685
.L693:
	tst.l %d0
	jge .L694
	clr.l %d2
	jra .L694
.L695:
	and.l #32512,%d2
	and.l #254,%d5
	jra .L700
.L699:
	mvz.w #255,%d1
	jra .L698
.L692:
	move.l 24(%fp),-(%sp)
	move.l 20(%fp),-(%sp)
	move.l %d2,-(%sp)
	move.l %d6,-(%sp)
	move.l %a2,-(%sp)
	jsr 1074438172
	lea (20,%sp),%sp
	jra .L683
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
	jcs .L702
	mov3q.l #6,%d4
	rems.l %d4,%d1:%d0
	mov3q.l #1,%d0
	cmp.l %d1,%d0
	jlt .L702
.L704:
	mov3q.l #-1,%d2
.L701:
	move.l %d2,%d0
	movem.l (%sp),#28
	lea (16,%sp),%sp
	rts
.L702:
	move.l %d3,-(%sp)
	jsr um_val
	addq.l #4,%sp
	addq.l #1,%d0
	tst.l %d0
	jne .L704
	move.l 12(%sp),-(%sp)
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	jsr 1074436168
	lea (12,%sp),%sp
	move.l %d0,%d2
	tst.l %d0
	jlt .L701
	move.l %d3,%d0
	moveq #13,%d4
	add.l #-14,%d0
	cmp.l %d0,%d4
	jcs .L706
	move.l %d2,24(%sp)
	movem.l (%sp),#28
	move.l %d0,20(%sp)
	lea (16,%sp),%sp
	jra lk_half
.L706:
	move.l %d3,-(%sp)
	jsr xmode
	addq.l #4,%sp
	tst.l %d0
	jeq .L701
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
	link.w %fp,#-24
	move.l 16(%fp),-8(%fp)
	movem.l #28,(%sp)
	move.l 12(%fp),%d2
	pea -4(%fp)
	move.l %d2,-(%sp)
	move.l 8(%fp),%d4
	jsr pq
	addq.l #8,%sp
	move.l %d0,-12(%fp)
	addq.l #1,%d0
	tst.l %d0
	jne .L718
	move.l %d2,%d0
	mov3q.l #3,%d1
	subq.l #1,%d0
	cmp.l %d0,%d1
	jcc .L708
	add.l #-15,%d0
	moveq #11,%d3
	cmp.l %d0,%d3
	jcc .L711
.L715:
	move.l -8(%fp),-(%sp)
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	jsr 1074436538
	move.l %d2,%d3
	add.l #-14,%d3
	lea (12,%sp),%sp
	move.l %d0,-12(%fp)
	moveq #13,%d0
	cmp.l %d3,%d0
	jcc .L722
.L708:
	movem.l -24(%fp),#28
	move.l -12(%fp),%d0
	unlk %fp
	rts
.L711:
	mov3q.l #6,%d3
	rems.l %d3,%d1:%d0
	mov3q.l #1,%d0
	cmp.l %d1,%d0
	jlt .L715
	jra .L708
.L722:
	tst.l -12(%fp)
	jlt .L708
	move.l -12(%fp),-(%sp)
	move.l %d3,-(%sp)
	jsr lk_half
	addq.l #8,%sp
	move.l %d0,-12(%fp)
	addq.l #1,%d0
	tst.l %d0
	jeq .L708
	tst.b sfu_st+1026.l
	jeq .L717
	move.l %d4,-(%sp)
	jsr sync
	addq.l #4,%sp
.L717:
	move.l %d3,8(%fp)
	movem.l -24(%fp),#28
	move.l -12(%fp),12(%fp)
	unlk %fp
	jra to_knob
.L718:
	mov3q.l #-1,-12(%fp)
	jra .L708
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
	jcs .L724
	moveq #15,%d1
	cmp.l %d3,%d1
	jge .L725
	move.l %d3,%d0
	mov3q.l #6,%d7
	add.l #-16,%d0
	rems.l %d7,%d1:%d0
	mov3q.l #1,%d0
	cmp.l %d1,%d0
	jge .L726
.L725:
	move.l %d6,-(%sp)
	move.l %d3,-(%sp)
	move.l %d5,-(%sp)
	addq.l #1,sfu_st+1030
	jsr 1074436168
	move.l %d2,-(%sp)
	move.l %d0,-(%sp)
	move.l %d4,-(%sp)
	jsr lk_put
	lea (24,%sp),%sp
	move.l %d0,%d2
.L727:
	move.l %d6,40(%sp)
	move.l %d2,36(%sp)
	move.l %d3,32(%sp)
	move.l %d5,28(%sp)
	movem.l (%sp),#252
	lea (24,%sp),%sp
	jmp 1074436282
.L724:
	move.l %d3,-(%sp)
	jsr um_val
	addq.l #4,%sp
	addq.l #1,%d0
	tst.l %d0
	jne .L726
	move.l %d3,-(%sp)
	jsr xmode
	addq.l #4,%sp
	subq.l #4,%d0
	tst.l %d0
	jne .L729
	move.l %d6,-(%sp)
	move.l %d3,-(%sp)
	move.l %d5,-(%sp)
	jsr 1074436168
	lea (12,%sp),%sp
	move.l %d0,%d4
	tst.l %d0
	jge .L730
	move.l %d3,-(%sp)
	move.l %d5,-(%sp)
	jsr 1074433530
	addq.l #8,%sp
	move.l %d0,%d4
.L730:
	sub.l %d4,%d2
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	move.l %d3,-(%sp)
	jsr step_to
	lea (12,%sp),%sp
	move.l %d0,%d2
	add.l %d4,%d2
	jra .L727
.L729:
	move.l %d3,-(%sp)
	jsr xmode
	addq.l #4,%sp
	tst.l %d0
	jeq .L727
	move.l %d6,-(%sp)
	move.l %d3,-(%sp)
	move.l %d5,-(%sp)
	jsr 1074436168
	lea (12,%sp),%sp
	move.l %d0,%d4
	tst.l %d0
	jge .L731
	move.l %d3,-(%sp)
	move.l %d5,-(%sp)
	jsr 1074433530
	addq.l #8,%sp
	move.l %d0,%d4
.L731:
	move.l %d2,-(%sp)
	move.l %d3,-(%sp)
	jsr x_half
	addq.l #8,%sp
	move.l %d3,%a0
	add.l #sfu_x,%a0
	move.l %d0,%d2
	tst.b 6223(%a0)
	jeq .L727
	tst.l %d4
	jlt .L727
	and.l #32512,%d2
	and.l #224,%d4
	or.l %d4,%d2
	jra .L727
.L726:
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
	move.l 12(%fp),%d1
	movem.l #124,(%sp)
	pea -4(%fp)
	move.l %d1,-(%sp)
	move.l 8(%fp),%d4
	move.l 16(%fp),%d2
	move.l %d1,-8(%fp)
	move.l 20(%fp),%d5
	jsr pq
	addq.l #8,%sp
	addq.l #1,%d0
	tst.l %d0
	jne .L739
	move.l -8(%fp),%d0
	subq.l #1,%d0
	lsr.l #2,%d0
	jeq .L739
	move.l -8(%fp),%d3
	moveq #13,%d6
	add.l #-14,%d3
	cmp.l %d3,%d6
	jcs .L741
	moveq #15,%d0
	cmp.l -8(%fp),%d0
	jge .L742
	move.l -8(%fp),%d0
	mov3q.l #6,%d6
	add.l #-16,%d0
	rems.l %d6,%d1:%d0
	mov3q.l #1,%d0
	cmp.l %d1,%d0
	jge .L739
.L742:
	clr.l -(%sp)
	move.l %d2,-(%sp)
	move.l %d3,-(%sp)
	addq.l #1,sfu_st+1030
	jsr to_half
	move.l %d5,-(%sp)
	move.l -8(%fp),-(%sp)
	move.l %d4,-(%sp)
	move.l %d0,%d2
	jsr 1074436538
	move.l %d2,-(%sp)
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	jsr lk_put
	lea (36,%sp),%sp
	move.l %d0,%d2
.L741:
	move.l %d5,20(%fp)
	move.l %d2,16(%fp)
	move.l %d4,8(%fp)
	movem.l -28(%fp),#124
	move.l -8(%fp),12(%fp)
	unlk %fp
	jmp 1074436652
.L739:
	movem.l -28(%fp),#124
	clr.l %d0
	unlk %fp
	rts
	.size	sfu_f_lset, .-sfu_f_lset
	.align	2
	.globl	sfu_f_lclr
	.type	sfu_f_lclr, @function
sfu_f_lclr:
	move.l #1074436770,-(%sp)
	move.l #1074436652,-(%sp)
	move.l #1074436538,-(%sp)
	move.l 24(%sp),-(%sp)
	move.l 24(%sp),-(%sp)
	move.l 24(%sp),-(%sp)
	jsr lclr
	lea (24,%sp),%sp
	rts
	.size	sfu_f_lclr, .-sfu_f_lclr
	.align	2
	.globl	sfu_s_lclr
	.type	sfu_s_lclr, @function
sfu_s_lclr:
	move.l #1074436438,-(%sp)
	move.l #1074436282,-(%sp)
	move.l #1074436168,-(%sp)
	move.l 24(%sp),-(%sp)
	move.l 24(%sp),-(%sp)
	move.l 24(%sp),-(%sp)
	jsr lclr
	lea (24,%sp),%sp
	rts
	.size	sfu_s_lclr, .-sfu_s_lclr
	.align	2
	.globl	sfu_scn_ok
	.type	sfu_scn_ok, @function
sfu_scn_ok:
	link.w %fp,#-12
	move.l 12(%fp),%d1
	move.l %d1,%d0
	move.l 8(%fp),-8(%fp)
	add.l #-14,%d0
	move.l %d1,-12(%fp)
	moveq #13,%d1
	cmp.l %d0,%d1
	jcc .L747
	move.l -12(%fp),%d0
	subq.l #1,%d0
	lsr.l #2,%d0
	jeq .L747
	pea -4(%fp)
	move.l -12(%fp),-(%sp)
	jsr pq
	addq.l #8,%sp
	addq.l #1,%d0
	tst.l %d0
	jne .L747
	move.l -12(%fp),12(%fp)
	move.l -8(%fp),8(%fp)
	unlk %fp
	jmp 1074496464
.L747:
	clr.l %d0
	unlk %fp
	rts
	.size	sfu_scn_ok, .-sfu_scn_ok
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
	jcc .L750
	add.l #15,%d0
	lsr.l #2,%d0
	jeq .L750
	move.l sfu_p+522,%a0
	tst.l %a0
	jne .L751
.L752:
	tst.l %d3
	jge .L753
.L754:
	move.l %d2,28(%sp)
	move.l %a3,24(%sp)
	move.l 40(%a4),%a1
	movem.l (%sp),#7180
	lea (20,%sp),%sp
	jmp (%a1)
.L750:
	move.l %a2,sfu_p+94
	move.l (%a2),sfu_p+98
	jra .L752
.L751:
	move.l %d2,-(%sp)
	move.l 24(%a0),%a0
	jsr (%a0)
	addq.l #4,%sp
	tst.l %d0
	jeq .L752
	move.l %a2,sfu_p+530
	move.l (%a2),sfu_p+534
	jra .L752
.L753:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l %a3,-(%sp)
	move.l 60(%a4),%a0
	jsr (%a0)
	lea (12,%sp),%sp
	tst.l %d0
	jlt .L754
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
	jeq .L794
	moveq #50,%d4
	cmp.l %d1,%d4
	jne .L795
	mov3q.l #1,%a0
.L759:
	tst.b sfu_st+1026.l
	jeq .L760
	mov3q.l #1,%d5
	and.l 16(%a2),%d5
	move.l %d5,%a1
	cmp.l #128,%d1
	jne .L761
	move.b %d5,sfu_p+60
.L760:
	clr.l %d0
.L762:
	clr.l -(%sp)
	move.l 28(%sp),-(%sp)
	move.l %d0,28(%sp)
	jsr timed
	movem.l 8(%sp),#1084
	move.l 28(%sp),%d0
	lea (36,%sp),%sp
	rts
.L794:
	sub.l %a0,%a0
	jra .L759
.L795:
	mov3q.l #-1,%a0
	jra .L759
.L761:
	move.l %d1,%d0
	add.l #-66,%d0
	lsr.l #1,%d0
	jne .L763
	move.b sfu_p+61,%d0
	tst.l %d5
	jeq .L764
	move.l %d3,%d2
	add.l #-65,%d2
	or.l %d2,%d0
.L765:
	move.b %d0,sfu_p+61
	mov3q.l #-1,%d4
	cmp.l %a0,%d4
	jeq .L766
.L793:
	move.b sfu_p+56,%d2
	move.b sfu_p+58,%d4
	tst.l %a1
	jeq .L767
	mvz.b %d4,%d0
	move.l %a0,%d5
	asr.l %d5,%d0
	mov3q.l #1,%d5
	move.l %d0,%a1
	and.l %d5,%d0
	move.l %a1,%d5
	btst #0,%d5
	jeq .L768
	mvz.b %d2,%d0
	cmp.l %d0,%d1
	seq %d0
.L813:
	mvs.b %d0,%d0
	neg.l %d0
	jra .L762
.L764:
	moveq #64,%d2
	sub.l %d3,%d2
	and.l %d2,%d0
	jra .L765
.L768:
	mov3q.l #1,%d1
	move.l %a0,%d5
	lsl.l %d5,%d1
	or.l %d4,%d1
	move.b %d1,sfu_p+58
	move.b sfu_p+60,%d1
	or.l %d2,%d1
	tst.b %d1
	jne .L762
	mvz.b sfu_p+55,%d2
	move.l %a0,%d1
	addq.l #1,%d1
	cmp.l %d2,%d1
	jne .L770
	lea sfu_p,%a1
	mvz.b 22(%a1,%a0.l),%d2
	lsr.l #1,%d2
	jne .L796
.L770:
	mvz.b sfu_p+527,%d2
	cmp.l %d1,%d2
	jne .L762
	tst.b sfu_p+61.l
	jne .L762
.L796:
	clr.l %d0
	lea sfu_p+102,%a0
.L773:
	lea (%a2,%d0.l),%a1
	moveq #32,%d1
	move.l (%a1),(%a0,%d0.l)
	addq.l #4,%d0
	cmp.l %d0,%d1
	jne .L773
	clr.b %d2
	move.b %d3,sfu_p+56
	addq.l #1,sfu_p+86
	move.b %d2,sfu_p+57
.L774:
	mov3q.l #1,%d0
	jra .L762
.L767:
	mov3q.l #1,%d0
	move.l %a0,%d3
	lsl.l %d3,%d0
	mvz.b %d2,%d2
	not.l %d0
	and.l %d4,%d0
	move.b %d0,sfu_p+58
	cmp.l %d1,%d2
	jne .L760
	clr.b %d4
	move.b %d4,sfu_p+56
	tst.b sfu_p+57.l
	jne .L774
	pea sfu_p+102
	mov3q.l #1,%d5
	move.l 36(%sp),-(%sp)
	or.l %d5,sfu_p+118
	jsr 1074397898
	addq.l #1,sfu_p+82
	addq.l #8,%sp
	jra .L760
.L766:
	moveq #66,%d0
	cmp.l %d1,%d0
	jne .L797
	mov3q.l #1,%d3
.L775:
	tst.l %a1
	jne .L776
	move.b sfu_p+59,%d1
	move.l %d3,%d0
	and.l %d1,%d0
	tst.l %d0
	jeq .L762
	move.l %d3,%d0
	not.l %d0
	and.l %d1,%d0
	move.b %d0,sfu_p+59
	jra .L774
.L797:
	mov3q.l #2,%d3
	jra .L775
.L776:
	move.b sfu_p+58,%d0
	btst #0,%d0
	jne .L798
	btst #1,%d0
	jeq .L778
	mov3q.l #1,%d2
.L777:
	move.b sfu_p+60,%d4
	move.l %d2,%d0
	addq.l #1,%d0
	tst.b %d4
	jne .L779
	mvz.b sfu_p+527,%d5
	cmp.l %d5,%d0
	jne .L779
	move.l sfu_p+522,%a1
	moveq #67,%d0
	move.l 20(%a1),%a1
	cmp.l %d1,%d0
	jne .L780
	mov3q.l #1,%a0
.L780:
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
	jne .L781
	moveq #1,%d1
	move.b %d1,sfu_p+57
.L781:
	move.l sfu_p+530,-(%sp)
	addq.l #1,sfu_p+538
	jsr 1074234644
	addq.l #4,%sp
	tst.l %d2
	jne .L782
	btst #0,%d4
	jne .L783
.L782:
	clr.l %d0
.L784:
	move.l %d0,-(%sp)
	move.l sfu_p+530,-(%sp)
	jsr retitle
	addq.l #8,%sp
	jra .L774
.L798:
	clr.l %d2
	jra .L777
.L783:
	move.l sfu_p+522,%a0
	move.l 28(%a0),%a0
	jsr (%a0)
	jra .L784
.L779:
	mvz.b sfu_p+55,%d5
	lea sfu_p,%a1
	cmp.l %d5,%d0
	jne .L778
	mvz.b 22(%a1,%d2.l),%d0
	mov3q.l #1,%d5
	cmp.l %d0,%d5
	jcc .L778
	tst.b %d4
	jeq .L785
.L778:
	mvz.b sfu_p+59,%d0
	and.l %d3,%d0
	tst.l %d0
	sne %d0
	jra .L813
.L785:
	mvz.b 20(%a1,%d2.l),%d4
	moveq #67,%d5
	cmp.l %d1,%d5
	jne .L786
	mov3q.l #1,%a0
.L786:
	move.l %d4,%d1
	add.l %a0,%d1
	tst.l %d1
	jge .L787
	clr.l %d1
.L787:
	cmp.l %d1,%d0
	jgt .L788
	move.l %d0,%d1
	subq.l #1,%d1
.L788:
	cmp.l %d4,%d1
	jeq .L789
	move.b %d1,20(%a1,%d2.l)
	tst.l %d1
	jne .L790
	move.l %d2,-(%sp)
	jsr restore_recs
	addq.l #4,%sp
.L790:
	jsr relabel
	move.l sfu_x+2132,%d0
	tst.l %d0
	jeq .L791
	move.l %d0,-(%sp)
	jsr sync
	addq.l #4,%sp
.L791:
	addq.l #1,sfu_p+78
.L789:
	move.b sfu_p+59,%d0
	mvz.b sfu_p+56,%d1
	or.l %d3,%d0
	move.b %d0,sfu_p+59
	move.l %d2,%d0
	add.l #49,%d0
	cmp.l %d1,%d0
	jne .L792
	moveq #1,%d0
	move.b %d0,sfu_p+57
.L792:
	move.l sfu_p+94,%d0
	tst.l %d0
	jeq .L774
	move.l %d0,-(%sp)
	jsr 1074234644
	clr.l -(%sp)
	move.l sfu_p+94,-(%sp)
	jsr retitle
	lea (12,%sp),%sp
	jra .L774
.L763:
	mov3q.l #-1,%d2
	cmp.l %a0,%d2
	jne .L793
	jra .L760
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
	jne .L815
	tst.l 1100664624
	jeq .L816
	tst.l 1100635224
	jeq .L816
	lea copy_desc,%a3
	clr.l -32(%fp)
	lea set_rec,%a5
	move.l %a3,%a4
.L818:
	move.l -32(%fp),-(%sp)
	jsr (%a5)
	addq.l #4,%sp
	mov3q.l #1,%d2
	cmp.l -32(%fp),%d2
	jlt .L865
	moveq #60,%d0
.L817:
	move.l -32(%fp),%a0
	move.l %d0,-(%sp)
	pea 14(%a0)
	jsr (%a3)
	addq.l #8,%sp
	addq.l #1,-32(%fp)
	moveq #14,%d0
	cmp.l -32(%fp),%d0
	jne .L818
	clr.l -32(%fp)
	lea set_bw_rec,%a3
.L819:
	move.l -32(%fp),-(%sp)
	jsr (%a3)
	pea 410.w
	addq.l #1,-32(%fp)
	move.l -32(%fp),-(%sp)
	jsr (%a4)
	lea (12,%sp),%sp
	mov3q.l #4,%d1
	cmp.l -32(%fp),%d1
	jne .L819
	tst.l sfu_x+6694
	jne .L820
	moveq #127,%d2
	move.b %d2,sfu_x+6687
	move.b %d2,sfu_x+6685
.L820:
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
.L822:
	tst.b (%a1)
	jeq .L821
	move.w %a0,%d2
	move.l %d0,%a3
	add.l #sfu_x,%a3
	addq.l #1,%d0
	move.b %d2,2188(%a3)
	move.w #1,%a3
.L821:
	addq.l #1,%a0
	addq.l #8,%a1
	cmp.l #128,%a0
	jne .L822
	move.w %a3,%d2
	tst.b %d2
	jeq .L823
	move.l %d0,sfu_x+2316
	move.l %d0,%d1
.L823:
	lea sfu_x+2188,%a0
	clr.l %d0
.L824:
	cmp.l %d0,%d1
	jgt .L825
	move.l %d1,sfu_x+2452
	clr.l %d0
	lea sfu_x+2564,%a0
.L826:
	clr.b %d1
	moveq #14,%d2
	move.b %d1,(%a0,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d2
	jne .L826
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
	jeq .L827
	clr.l %d1
.L828:
	clr.b %d2
	move.l %d0,%a0
	move.b %d2,(%a0,%d1.l)
	addq.l #1,%d1
	cmp.l #4224,%d1
	jne .L828
.L827:
	moveq #1,%d1
	move.l %d0,sfu_p
	move.l #1397119061,%d0
	lea sfu_sysex,%a1
	move.l %a1,1075551832
	move.l %d0,1075551828
	move.b %d1,sfu_st+1026
.L815:
	move.l sfu_x+2320,%d0
	mov3q.l #1,%d1
	and.l %d0,%d1
	btst #0,%d0
	jne .L829
	cmp.l sfu_x+2456.l,%d0
	jeq .L829
	move.l sfu_x+2316,%a0
	lea sfu_x+2188,%a1
.L830:
	cmp.l %a0,%d1
	jeq .L831
	cmp.l #128,%d1
	jne .L832
.L831:
	cmp.l sfu_x+2320.l,%d0
	jne .L829
	tst.l %a0
	jeq .L829
	move.l %d0,sfu_x+2456
	moveq #1,%d0
	move.l %a0,sfu_x+2452
	move.b %d0,32(%a2)
.L829:
	move.l sfu_x+2132,%d0
	tst.l %d0
	jeq .L833
	move.l %d0,-(%sp)
	move.l sfu_x+2160,%a3
	jsr sync
	addq.l #4,%sp
	cmp.l sfu_x+2160.l,%a3
	jeq .L834
	moveq #1,%d1
	move.b %d1,32(%a2)
.L834:
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
	jeq .L836
	clr.l -(%sp)
	move.l 156(%a4),%a0
	move.l %a5,-(%sp)
	jsr (%a0)
	addq.l #8,%sp
	moveq #16,%d1
	cmp.l %d0,%d1
	jeq .L836
	moveq #22,%d2
	cmp.l %d0,%d2
	seq %d0
	mvs.b %d0,%d0
	neg.l %d0
	add.l %d0,%d0
	move.l %d0,-32(%fp)
.L836:
	lea (-29,%fp),%a0
	mov3q.l #1,%d0
	move.b (%a0),sfu_p+55
	cmp.l 1094562388.l,%d0
	jeq .L838
	clr.b %d1
	move.b %d1,sfu_fxv+9
	move.b %d1,sfu_fxv+8
.L838:
	tst.b sfu_p+526.l
	jne .L839
	move.l #1481856080,%d2
	cmp.l 1073848892.l,%d2
	jne .L839
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
	jne .L839
	mov3q.l #3,%d1
	and.l %d0,%d1
	tst.l %d1
	jne .L839
	move.l #1431130183,%a1
	move.l %d0,%a0
	cmp.l (%a0),%a1
	jne .L839
	move.l %d0,sfu_p+522
.L840:
	move.l sfu_p+534,-(%sp)
	move.l sfu_p+530,-(%sp)
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	move.l %d0,-32(%fp)
	tst.l %d0
	jeq .L841
	sub.l %a3,%a3
.L844:
	move.l sfu_p+534,%a0
	move.l %a3,-(%sp)
	move.l sfu_p+530,-(%sp)
	move.l 156(%a0),%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l %d0,-32(%fp)
	tst.l %d0
	jeq .L842
	move.l sfu_p+522,%a0
	move.l %d0,-(%sp)
	move.l 24(%a0),%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l %d0,-32(%fp)
	subq.l #1,%d0
	tst.l %d0
	jeq .L843
.L841:
	lea (-29,%fp),%a0
	move.b (%a0),sfu_p+527
	tst.b sfu_p+54.l
	jeq .L846
	clr.b %d0
	moveq #1,%d1
	move.b %d0,sfu_p+54
	move.b %d1,32(%a2)
.L846:
	move.l sfu_p+62,%d0
	tst.l %d0
	jeq .L847
	move.l -66650100,%d1
	sub.l %d0,%d1
	cmp.l #65999999,%d1
	jls .L847
	clr.l sfu_p+62
.L847:
	move.l sfu_p+66,%d0
	tst.l %d0
	jeq .L848
	move.l -66650100,%d1
	sub.l %d0,%d1
	cmp.l #65999999,%d1
	jls .L848
	clr.l sfu_p+66
.L848:
	lea sfu_p,%a0
	sub.l %a3,%a3
	move.l %a0,-32(%fp)
	lea sfu_p+50,%a4
	move.l %a0,%a5
.L854:
	tst.w (%a4)+
	jeq .L849
	lea sfu_p+24,%a0
	move.b (%a0,%a3.l),%d1
	jeq .L849
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
.L850:
	lea 26(%a5,%a0.l),%a1
	addq.l #1,%a0
	move.b (%a1),-14(%a0,%fp.l)
	cmp.l %d0,%a0
	jlt .L850
	moveq #-9,%d1
	move.l %d0,%a0
	move.b %d1,-13(%fp,%d0.l)
	pea 10(%a0)
	pea -22(%fp)
	jsr try_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L853
	clr.w %d0
	mov3q.l #1,%d1
	or.l -66650100,%d1
	move.l -32(%fp),%a0
	move.w %d0,-2(%a4)
	move.l %d1,62(%a0)
	addq.l #1,sfu_p+70
.L852:
	addq.l #4,-32(%fp)
	lea (12,%a5),%a5
	mov3q.l #1,%d1
	cmp.l %a3,%d1
	jne .L867
.L853:
	tst.b sfu_x+6689.l
	jeq .L855
	clr.b %d2
	moveq #1,%d0
	move.b %d2,sfu_x+6689
	move.b %d0,32(%a2)
.L855:
	move.l sfu_x+6698,%d0
	tst.l %d0
	jeq .L856
	move.l -66650100,%d1
	sub.l %d0,%d1
	cmp.l #65999999,%d1
	jls .L856
	clr.l sfu_x+6698
.L856:
	move.l sfu_x+6702,%d0
	tst.l %d0
	jeq .L857
	move.l -66650100,%d1
	sub.l %d0,%d1
	cmp.l #65999999,%d1
	jls .L857
	clr.l sfu_x+6702
.L857:
	lea sfu_x,%a4
	lea sfu_x+6684,%a3
	clr.l -32(%fp)
.L861:
	mvz.b sfu_x+6688,%d0
	move.l -32(%fp),%d1
	btst %d1,%d0
	jeq .L858
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
	jeq .L860
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
.L858:
	addq.l #4,%a4
	addq.l #2,%a3
	mov3q.l #1,%d0
	cmp.l -32(%fp),%d0
	jne .L868
.L860:
	mvz.b sfu_st+1027,%d0
	lsr.l #1,%d0
	jne .L816
	move.w sfu_st+1028,%d0
	moveq #99,%d2
	mvz.w %d0,%d1
	cmp.l %d1,%d2
	jcs .L862
	addq.l #1,%d0
	move.w %d0,sfu_st+1028
	mvz.w %d0,%d0
	moveq #100,%d1
	cmp.l %d0,%d1
	jne .L816
.L862:
	mov3q.l #7,-(%sp)
	pea (m.0)
	jsr try_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L816
	clr.w %d2
	addq.l #1,sfu_x+2152
	move.w %d2,sfu_st+1028
.L816:
	clr.l -(%sp)
	move.l -28(%fp),-(%sp)
	jsr timed
	addq.l #8,%sp
	tst.b sfu_st+1026.l
	jeq .L814
	move.l #1481856080,%a0
	cmp.l 1073848892.l,%a0
	jne .L814
	tst.l 1073848900
	jeq .L814
	move.l -66650100,%a3
	move.l 1073848900,%a0
	move.l %a2,-(%sp)
	jsr (%a0)
	addq.l #4,%sp
	tst.l %d0
	jeq .L864
	moveq #1,%d0
	move.b %d0,32(%a2)
.L864:
	move.l -66650100,%d0
	sub.l %a3,%d0
	add.l %d0,sfu_x+6418
	addq.l #1,sfu_x+6426
	cmp.l sfu_x+6422.l,%d0
	jls .L814
	move.l %d0,sfu_x+6422
.L814:
	movem.l -52(%fp),#15364
	unlk %fp
	rts
.L865:
	mvz.w #410,%d0
	jra .L817
.L825:
	move.b (%a0)+,%d2
	addq.l #1,%d0
	move.b %d2,135(%a0)
	jra .L824
.L832:
	move.b (%a1)+,%d2
	addq.l #1,%d1
	move.b %d2,135(%a1)
	jra .L830
.L833:
	move.l sfu_x+2084,%d2
	cmp.l sfu_x+2080.l,%d2
	jeq .L834
	lea sfu_x+2080,%a0
	move.l (%a0),sfu_x+2084
	jsr relabel
	moveq #1,%d0
	move.b %d0,32(%a2)
	jra .L834
.L839:
	tst.l sfu_p+522
	jne .L840
	clr.l -32(%fp)
	jra .L841
.L842:
	addq.l #1,%a3
	moveq #8,%d2
	cmp.l %a3,%d2
	jne .L844
	jra .L841
.L843:
	mvz.b sfu_p+527,%d0
	subq.l #1,%d0
	tst.l %d0
	jeq .L841
	move.l sfu_p+522,%a0
	clr.l -(%sp)
	clr.l -(%sp)
	move.l 20(%a0),%a0
	jsr (%a0)
	addq.l #8,%sp
	btst #0,%d0
	jeq .L841
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
	jra .L841
.L867:
	mov3q.l #1,%a3
	jra .L854
.L849:
	clr.w %d0
	move.w %d0,-2(%a4)
	jra .L852
.L868:
	mov3q.l #1,-32(%fp)
	jra .L861
	.size	sfu_tick, .-sfu_tick
	.text
	.type	m.0, @object
	.size	m.0, 7
m.0:
	.base64	"8H1SVCMB9w=="
	.globl	sfu_fxv
	.text
	.align	4
	.type	sfu_fxv, @object
	.size	sfu_fxv, 12
sfu_fxv:
	.long	1397119062
	.long	fxv_view
	.zero	2
	.zero	2
	.text
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
	.type	p1slot, @object
	.size	p1slot, 8
p1slot:
	.base64	"AAEGBwIDBAU="
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
	.long	1
	.long	2
	.long	18
	.long	19
	.long	20
	.long	21
	.long	n_fx2
	.long	22
	.long	23
	.long	3
	.long	4
	.long	24
	.long	25
	.long	26
	.long	27
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
