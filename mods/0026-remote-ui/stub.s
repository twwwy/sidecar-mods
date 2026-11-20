| Mod 0026 - remote UI: the Rytm as a terminal for Sidecar-drawn pages (M1).
| GENERATED from rui.c by build.sh (m68k-elf-gcc -mcpu=5475 -Os); edit rui.c.
#NO_APP
	.file	"rui.c"
	.text
#APP
	  .text
  .globl pm_menu_det, pm_label, pm_action, pm_icon
  .align 2
pm_menu_det:
  move.l %d6,-(%sp)
  jsr pm_menu_add
  addq.l #4,%sp
  lea 24(%sp),%sp
  tst.l %d6
  jmp 0x400cb5c4
  .align 2
pm_label:
  link.w %fp,#-4
  move.l %a2,-(%sp)
  move.l %a0,%a2
  pea -1(%fp)
  pea pm_text
  move.l %a2,-(%sp)
  jsr 0x401bcd4c
  lea 12(%sp),%sp
  move.l %a2,%d0
  move.l (%sp)+,%a2
  unlk %fp
  rts
  .align 2
pm_action:
  move.l 4(%sp),%a0
  move.l (%a0),%a0
  move.l (%a0),-(%sp)
  jsr pm_pick
  addq.l #4,%sp
  rts
  .align 2
pm_icon:
  rts

	  .text
  .globl cu_setm_det
  .align 2
cu_setm_det:
  move.l 12(%sp),-(%sp)
  move.l 12(%sp),-(%sp)
  jsr cu_prep
  addq.l #8,%sp
  link.w %fp,#-40
  movem.l %d2-%d6/%a2-%a4,(%sp)
  jmp 0x400bd156

	  .text
  .globl pmo_lfo_det, pmo_vel_det
  .align 2
pmo_lfo_det:
  jsr pmo_pre
  move.l (%sp),-(%sp)
  jsr 0x4009e790
  addq.l #4,%sp
  jsr pmo_post
  jmp 0x40120fb4
  .align 2
pmo_vel_det:
  move.l 60(%sp),%d0
  adda.l %a2,%a3
  move.l %d0,-(%sp)
  move.l 96(%sp),-(%sp)
  jsr pmo_vel
  addq.l #8,%sp
  moveq #-1,%d1
  cmp.l 72(%sp),%d1
  beq.s 1f
  move.l %d0,%d1
  lsl.l #8,%d1
  move.l %d1,72(%sp)
1:
  jmp 0x4009afa6

	  .text
  .globl rui_uart_det, rui_uart_raw
  .align 2
rui_uart_det:
  move.l 8(%sp),-(%sp)
  move.l 8(%sp),-(%sp)
  jsr rui_uart
  addq.l #8,%sp
  tst.l %d0
  beq.s rui_uart_raw
  rts
  .align 2
rui_uart_raw:
  lea -12(%sp),%sp
  movem.l %d2-%d4,(%sp)
  jmp 0x400019ec

	  .text
  .globl rui_rec_det
  .align 2
rui_rec_det:
  move.l 20(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  jsr rui_rec_note
  lea 12(%sp),%sp
  tst.l %d0
  beq.s 1f
  rts
1:
  link.w %fp,#-48
  moveq #12,%d0
  jmp 0x400b45e6

	  .text
  .globl sq_fire_det, sq_end_det
  .align 2
sq_fire_det:
  move.l 12(%sp),-(%sp)
  move.l 12(%sp),-(%sp)
  move.l 12(%sp),-(%sp)
  jsr sq_fire
  lea 12(%sp),%sp
  lea -88(%sp),%sp
  move.l 96(%sp),%d0
  jmp 0x4009a9c4
  .align 2
sq_end_det:
  jsr sq_end
  movem.l (%sp),%d0-%fp
  lea 76(%sp),%sp
  jmp 0x4009bfa6

	  .text
  .globl ed_pcopy_det
  .align 2
ed_pcopy_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_pcopy_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #1,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_pcopy_orig:
  .short 0x4e56,0xffdc,0x48d7,0x1c0c
  jmp 0x400abde8
  .globl ed_ppaste_det
  .align 2
ed_ppaste_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_ppaste_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #2,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_ppaste_orig:
  .short 0x4e56,0xffd4,0x48d7,0x3c04
  jmp 0x400abffe
  .globl ed_pclear_det
  .align 2
ed_pclear_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_pclear_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #3,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_pclear_orig:
  .short 0x4e56,0xffd8,0x48d7,0x3c0c
  jmp 0x400ac124
  .globl ed_pundo_det
  .align 2
ed_pundo_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_pundo_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #4,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_pundo_orig:
  .short 0x4e56,0xffe4,0x48d7,0x0c04
  jmp 0x400abec8
  .globl ed_tcopy_det
  .align 2
ed_tcopy_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_tcopy_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #5,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_tcopy_orig:
  .short 0x4e56,0xffd8,0x48d7,0x3c0c
  jmp 0x400c2f04
  .globl ed_tpaste_det
  .align 2
ed_tpaste_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_tpaste_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #6,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_tpaste_orig:
  .short 0x4e56,0xffc4,0x48d7,0x3c7c
  jmp 0x400c475c
  .globl ed_tclear_det
  .align 2
ed_tclear_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_tclear_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #7,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_tclear_orig:
  .short 0x4e56,0xffd4,0x48d7,0x3c1c
  jmp 0x400c4952
  .globl ed_tundo_det
  .align 2
ed_tundo_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_tundo_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #8,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_tundo_orig:
  .short 0x4e56,0xffd0,0x48d7,0x3c3c
  jmp 0x400c3810
  .globl ed_gcopy_det
  .align 2
ed_gcopy_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_gcopy_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #9,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_gcopy_orig:
  .short 0x4e56,0xffd8,0x48d7,0x3c0c
  jmp 0x400c4628
  .globl ed_gpaste_det
  .align 2
ed_gpaste_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_gpaste_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #10,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_gpaste_orig:
  .short 0x4e56,0xffb8,0x48d7,0x3cfc
  jmp 0x400c334a
  .globl ed_gclear_det
  .align 2
ed_gclear_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_gclear_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #11,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_gclear_orig:
  .short 0x4e56,0xffc8,0x48d7,0x3cfc
  jmp 0x400c4456
  .globl ed_gundo_det
  .align 2
ed_gundo_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_gundo_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #12,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_gundo_orig:
  .short 0x4e56,0xffc8,0x48d7,0x3cfc
  jmp 0x400c3602
  .globl ed_rcopy_det
  .align 2
ed_rcopy_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_rcopy_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #13,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_rcopy_orig:
  .short 0x4e56,0xff84,0x48d7,0x3cfc
  jmp 0x400c4ad4
  .globl ed_rpaste_det
  .align 2
ed_rpaste_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_rpaste_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #14,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_rpaste_orig:
  .short 0x4e56,0xff90,0x41ee,0xffb8
  jmp 0x400c3972
  .globl ed_preload_det
  .align 2
ed_preload_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_preload_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #16,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_preload_orig:
  .short 0x4fef,0xfff4,0x48d7,0x0c04
  jmp 0x400af5e8
  .globl ed_psave_det
  .align 2
ed_psave_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_psave_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #17,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_psave_orig:
  .short 0x4fef,0xfff4,0x48d7,0x040c
  jmp 0x400ae590
  .globl ed_treload_det
  .align 2
ed_treload_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_treload_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #18,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_treload_orig:
  .short 0x4fef,0xffe8,0x48d7,0x3c0c
  jmp 0x400af652
  .globl ed_tsave_det
  .align 2
ed_tsave_det:
  lea -24(%sp),%sp
  move.l 28(%sp),(%sp)
  move.l 32(%sp),4(%sp)
  move.l 36(%sp),8(%sp)
  move.l 40(%sp),12(%sp)
  move.l 44(%sp),16(%sp)
  move.l 48(%sp),20(%sp)
  jsr ed_tsave_orig
  lea 24(%sp),%sp
  move.l %d0,-(%sp)
  move.l %d0,-(%sp)
  move.l 16(%sp),-(%sp)
  move.l 16(%sp),-(%sp)
  move.l #19,-(%sp)
  jsr ed_report
  lea 16(%sp),%sp
  move.l (%sp)+,%d0
  rts
ed_tsave_orig:
  .short 0x4fef,0xffe8,0x48d7,0x3c0c
  jmp 0x400ae61c

	  .text
  .globl pin_det
  .align 2
pin_det:
  move.l 4(%sp),-(%sp)
  jsr pin_frame
  addq.l #4,%sp
  .short 0x4fef,0xffec,0x7001
  jmp 0x4007a53e

	  .text
  .globl pj_write_det, pj_delete_det, pj_copy_det, pj_save_det, pj_act_det
  .globl kt_save_det, kt_reload_det, kt_all_det
  .align 2
pj_write_det:
  move.l 8(%sp),-(%sp)
  move.l 4(%sp),-(%sp)
  jsr pj_write
  addq.l #8,%sp
  .short 0x4fef,0xffe0,0x727f
  jmp 0x40034e9e
  .align 2
pj_delete_det:
  move.l 8(%sp),-(%sp)
  jsr pj_delete
  addq.l #4,%sp
  .short 0x2f02,0x70ff,0x242f,0x000c
  jmp 0x40034a5c
  .align 2
pj_copy_det:
  move.l 8(%sp),-(%sp)
  jsr pj_copy
  addq.l #4,%sp
  .short 0x4e56,0xffe4,0x48d7,0x040c
  jmp 0x40035034
  .align 2
pj_save_det:
  move.l 8(%sp),-(%sp)
  jsr pj_save
  addq.l #4,%sp
  .short 0x4fef,0xffd0,0x48d7,0x7c1c
  jmp 0x400b0740
  .align 2
pj_act_det:
  move.l 8(%sp),-(%sp)
  move.l 4(%sp),-(%sp)
  move.l 12(%sp),-(%sp)
  jsr pj_activate
  lea 12(%sp),%sp
  .short 0x7339,0x405c,0x8e4d
  jmp 0x400fa69a
  .align 2
kt_save_det:
  move.l 0x800067b8,-(%sp)
  lea -16(%sp),%sp
  move.l 24(%sp),(%sp)
  move.l 28(%sp),4(%sp)
  move.l 32(%sp),8(%sp)
  move.l 36(%sp),12(%sp)
  jsr kt_save_orig
  lea 16(%sp),%sp
  move.l %d0,-(%sp)
  move.l 4(%sp),-(%sp)
  move.l 20(%sp),-(%sp)
  jsr kt_saved
  addq.l #8,%sp
  move.l (%sp)+,%d0
  addq.l #4,%sp
  rts
kt_save_orig:
  .short 0x4fef,0xffc4,0x48d7,0x7cfc
  jmp 0x400b11a4
  .align 2
kt_reload_det:
  move.l 8(%sp),-(%sp)
  move.l 8(%sp),-(%sp)
  jsr kt_reload_orig
  addq.l #8,%sp
  move.l %d0,-(%sp)
  pea 0x42
  jsr kt_reloaded
  addq.l #4,%sp
  move.l (%sp)+,%d0
  rts
kt_reload_orig:
  .short 0x4fef,0xffec,0x48d7,0x0c1c
  jmp 0x400af0da
  .align 2
kt_all_det:
  move.l 8(%sp),-(%sp)
  move.l 8(%sp),-(%sp)
  jsr kt_all_orig
  addq.l #8,%sp
  move.l %d0,-(%sp)
  pea 0x44
  jsr kt_reloaded
  addq.l #4,%sp
  move.l (%sp)+,%d0
  rts
kt_all_orig:
  .short 0x4fef,0xffe4,0x48d7,0x3c1c
  jmp 0x400b1322

#NO_APP
	.align	2
	.type	copy32, @function
copy32:
	move.l %a2,-(%sp)
	mvz.w 18(%sp),%d1
	move.l 8(%sp),%a0
	clr.l %d0
	move.l 12(%sp),%a1
	lsl.l #2,%d1
.L2:
	cmp.l %d0,%d1
	jne .L3
	move.l (%sp)+,%a2
	rts
.L3:
	lea (%a1,%d0.l),%a2
	move.l (%a2),(%a0,%d0.l)
	addq.l #4,%d0
	jra .L2
	.size	copy32, .-copy32
	.align	2
	.type	txsx_wait, @function
txsx_wait:
	move.l txsx_test_on,%d0
	tst.l %d0
	jeq .L6
	move.l st+8,%d1
	sub.l txsx_test_end,%d1
	jmi .L6
	clr.l txsx_test_on
	clr.l %d0
.L6:
	move.l 1094562372,%d1
	or.l %d0,%d1
	jne .L8
	clr.l txsx_on
	clr.l txsx_gap
.L13:
	clr.l %d0
.L4:
	rts
.L8:
	tst.l txsx_on
	jeq .L10
	tst.l txsx_gap
	jeq .L11
	tst.l %d0
	jne .L11
.L10:
	lea st+8,%a0
	mov3q.l #1,txsx_on
	move.l (%a0),txsx_t0
	clr.l txsx_gap
.L12:
	mov3q.l #1,%d0
	jra .L4
.L11:
	move.l st+8,%d0
	moveq #39,%d1
	sub.l txsx_t0,%d0
	cmp.l %d0,%d1
	jge .L12
	addq.l #1,txsx_over
	jra .L13
	.size	txsx_wait, .-txsx_wait
	.align	2
	.type	mr_vb, @function
mr_vb:
	move.l %d2,-(%sp)
	moveq #17,%d2
	move.l 12(%sp),%d0
	move.l %d0,%d1
	add.l #-35,%d1
	cmp.l %d1,%d2
	jcc .L18
.L20:
	moveq #127,%d0
.L17:
	move.l (%sp)+,%d2
	rts
.L18:
	mvz.w %d0,%d0
	lsl.l #2,%d0
	move.l %d0,%a0
	add.l #1076429692,%a0
	move.l 1076429868,%d0
	cmp.l (%a0),%d0
	jne .L20
	lea mr_flag,%a0
	moveq #127,%d2
	move.b (%a0,%d1.l),%d0
	mvz.b %d0,%d1
	cmp.l %d1,%d2
	jeq .L17
	move.l 8(%sp),%d1
	lea mr_voice,%a0
	move.b (%a0,%d1.l),%d1
	or.l %d1,%d0
	jra .L17
	.size	mr_vb, .-mr_vb
	.align	2
	.type	sv_word, @function
sv_word:
	lea (-32,%sp),%sp
	movem.l #3196,(%sp)
	move.w 38(%sp),%d2
	move.l 40(%sp),%d0
	moveq #16,%d4
	move.l -2147457096,%d1
	mulu.w #152,%d2
	move.l %d2,%a1
	move.b sv+10,%d2
	mvz.b %d2,%d3
	cmp.l %d3,%d4
	jne .L47
	move.l %d0,%d3
	subq.l #8,%d3
.L25:
	moveq #127,%d4
	moveq #43,%d5
	and.l -2147457096,%d4
	mulu.w #2531,%d4
	move.l %d4,%a0
	add.l #1092966773,%a0
	mvz.b (%a0,%a1.l),%d4
	cmp.l %d4,%d5
	jne .L26
	mov3q.l #7,%d6
	cmp.l %d0,%d6
	jge .L48
.L26:
	moveq #127,%d4
	and.l %d4,%d1
	mulu.w #2531,%d1
	move.l %d1,%a0
	add.l #1092966707,%a0
	mvz.w %d0,%d1
	lea (%a0,%d1.l*2),%a2
	add.l %a1,%a2
	tst.b %d2
	jeq .L28
.L33:
	move.l %d3,%d0
.L29:
	mov3q.l #7,%d6
	cmp.l %d0,%d6
	jcs .L32
	jra .L31
.L47:
	move.l %d0,%d3
	jra .L25
.L28:
	moveq #127,%d1
	moveq #45,%d5
	and.l -2147457096,%d1
	mulu.w #2531,%d1
	move.l %d1,%a0
	add.l #1092966773,%a0
	mvz.b (%a0,%a1.l),%d1
	cmp.l %d1,%d5
	jne .L30
	moveq #10,%d6
	cmp.l %d0,%d6
	jeq .L49
	tst.l %d0
	jne .L29
.L32:
	move.b (%a2),%d0
	mvz.b 1(%a2),%d1
	lsr.l #1,%d1
	lsl.l #7,%d0
	and.l #16256,%d0
	jra .L65
.L30:
	moveq #127,%d1
	moveq #43,%d2
	and.l -2147457096,%d1
	mulu.w #2531,%d1
	move.l %d1,%a0
	add.l #1092966773,%a0
	mvz.b (%a0,%a1.l),%d1
	cmp.l %d1,%d2
	jne .L33
	move.l %d0,%d1
	mov3q.l #5,%d4
	subq.l #8,%d1
	cmp.l %d1,%d4
	jcs .L34
	lea CSWTCH.489,%a0
	mvs.b (%a0,%d1.l),%d0
.L31:
	move.l sv+80,%a0
	tst.l %a0
	jeq .L32
	move.l (%a0),%a3
	move.l %d0,-(%sp)
	move.l %a0,-(%sp)
	move.l 156(%a3),%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l %d0,%d4
	tst.l %d0
	jle .L32
	tst.l 44(%sp)
	jlt .L35
	mov3q.l #-1,-(%sp)
	move.l 160(%a3),%a0
	move.l sv+80,-(%sp)
	jsr (%a0)
	addq.l #8,%sp
	move.l %d0,%a0
	tst.l %d0
	jeq .L35
	move.l (%a0),%a1
	move.l 44(%sp),-(%sp)
	move.l %d4,-(%sp)
	move.l 60(%a1),%a0
	move.l %d0,-(%sp)
	jsr (%a0)
	lea (12,%sp),%sp
	move.l %d0,%d2
	tst.l %d0
	jge .L50
.L35:
	mov3q.l #-1,-(%sp)
	move.l %d4,-(%sp)
	move.l 84(%a3),%a0
	clr.l %d3
	move.l sv+80,-(%sp)
	jsr (%a0)
	lea (12,%sp),%sp
	move.l %d0,%d2
.L36:
	move.l %d2,%d1
	move.l #1481856080,%a0
	asr.l #8,%d1
	cmp.l 1073848892.l,%a0
	jne .L37
	move.l 1073848896,%a0
	mov3q.l #2,%d6
	move.l %d4,-(%sp)
	move.l %d1,32(%sp)
	jsr (%a0)
	move.b (%a2),%d5
	addq.l #4,%sp
	move.l %d0,%d4
	asr.l #8,%d4
	move.l 28(%sp),%d1
	move.l %d4,%a1
	subq.l #1,%a1
	move.w %d5,%a0
	cmp.l %a1,%d6
	jcs .L37
	move.l %d0,%d5
	mvz.b %d5,%d5
	move.l %d5,%a1
	tst.b %d0
	jeq .L37
	mvz.b %d1,%d1
	tst.l %d3
	jne .L38
	moveq #127,%d6
	move.l %a0,%d0
	and.l %d6,%d0
	mov3q.l #1,%d6
	cmp.l %d4,%d6
	jne .L39
	move.l %d5,%d2
	muls.l %d0,%d2
	asr.l #7,%d2
	cmp.l %d1,%d2
	jne .L41
.L40:
	move.l %d0,%d1
	lsl.l #7,%d1
	mvz.b 1(%a2),%d0
	lsr.l #1,%d0
.L65:
	or.l %d1,%d0
	jra .L24
.L34:
	moveq #13,%d5
	cmp.l %d0,%d5
	jge .L32
	move.l %d1,%d0
	jra .L29
.L49:
	clr.l %d0
	jra .L31
.L50:
	mov3q.l #1,%d3
	jra .L36
.L39:
	cmp.l %d1,%d0
	jeq .L40
	subq.l #3,%d4
	tst.l %d4
	jne .L44
	jra .L46
.L38:
	mov3q.l #3,%d0
	cmp.l %d4,%d0
	jne .L43
.L46:
	move.l %d2,%d3
	asr.l #1,%d3
	moveq #112,%d2
	and.l %d2,%d3
.L44:
	moveq #127,%d4
	cmp.l %d1,%d4
	jlt .L52
	move.l %d1,%d0
	lsl.l #7,%d0
.L45:
	or.l %d3,%d0
.L24:
	movem.l (%sp),#3196
	lea (32,%sp),%sp
	rts
.L43:
	subq.l #1,%d4
	tst.l %d4
	jne .L51
.L41:
	mvs.w %d1,%d1
	move.l %a1,%d2
	lsl.l #7,%d1
	lea -1(%a1,%d1.l),%a0
	move.l %a0,%d1
	divs.l %d2,%d1
.L51:
	clr.l %d3
	jra .L44
.L52:
	move.w #16256,%d0
	jra .L45
.L37:
	lsl.l #7,%d1
	asr.l #1,%d2
	moveq #127,%d5
	and.l %d5,%d2
	and.l #16256,%d1
	move.l %d1,%d0
	or.l %d2,%d0
	jra .L24
.L48:
	clr.w %d0
	jra .L24
	.size	sv_word, .-sv_word
	.align	2
	.type	splash_end, @function
splash_end:
	tst.l st+972
	jeq .L66
	moveq #1,%d0
	lea (8,%sp),%a0
	move.l (%a0),st+988
	move.l 4(%sp),%a0
	clr.l st+972
	move.b %d0,32(%a0)
.L66:
	rts
	.size	splash_end, .-splash_end
	.align	2
	.type	uart_byte, @function
uart_byte:
	move.b ps_left,%d0
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.b 15(%sp),%d2
	addq.l #1,uart_bytes
	tst.b %d0
	jne .L69
	move.b %d0,ps_pos
	mvz.b %d2,%d0
	move.b %d2,ps_hdr
	mov3q.l #1,%d3
	move.l %d0,%d1
	lsr.l #4,%d1
	cmp.l %d1,%d3
	jeq .L86
	moveq #11,%d3
	cmp.l %d1,%d3
	jeq .L71
	tst.l %d1
	jne .L87
.L90:
	mov3q.l #1,%d0
	jra .L70
.L71:
	cmp.l #179,%d0
	jhi .L72
.L73:
	mov3q.l #3,%d0
.L70:
	subq.l #1,%d0
	move.b %d0,ps_left
.L74:
	move.b %d2,%d0
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L72:
	cmp.l #182,%d0
	jeq .L73
	cmp.l #180,%d0
	jeq .L88
	cmp.l #181,%d0
	jeq .L89
	cmp.l #184,%d0
	jeq .L90
.L87:
	mov3q.l #2,%d0
	jra .L70
.L86:
	moveq #10,%d0
	jra .L70
.L88:
	mov3q.l #6,%d0
	jra .L70
.L89:
	mov3q.l #5,%d0
	jra .L70
.L69:
	subq.l #1,%d0
	move.b %d0,ps_left
	move.b ps_hdr,%d0
	move.b ps_pos,%d1
	move.l %d0,%a0
	lea (-32,%a0),%a0
	addq.l #1,%d1
	move.w %a0,%d3
	move.b %d1,ps_pos
	mvz.b %d3,%d3
	move.l %d3,%a0
	mov3q.l #3,%d3
	cmp.l %a0,%d3
	jcs .L75
	and.l %d3,%d0
	lea shs,%a0
	move.b %d2,(%a0,%d0.l)
	jra .L74
.L75:
	move.l %d0,%a0
	lea (80,%a0),%a0
	move.w %a0,%d3
	mvz.b %d3,%d3
	move.l %d3,%a0
	mov3q.l #4,%d3
	cmp.l %a0,%d3
	jcs .L74
	mvz.b %d1,%d1
	mov3q.l #1,%d3
	cmp.l %d1,%d3
	jne .L77
	move.b %d2,ps_id
	jra .L74
.L77:
	move.b ps_id,%d3
	move.w %d3,%a0
	mvz.b %d3,%d3
	move.l %d3,%a1
	moveq #55,%d3
	cmp.l %a1,%d3
	jne .L78
	mvz.b %d0,%d3
	cmp.l #180,%d3
	jne .L79
	move.l %d1,%d0
	subq.l #2,%d0
.L80:
	lea sht,%a0
	move.b %d2,(%a0,%d0.l)
	tst.b ovt_on.l
	jeq .L74
	move.b ovt_col,%d2
	addq.l #1,uart_sub
	jra .L74
.L79:
	mov3q.l #3,%d1
	and.l %d1,%d0
	jra .L80
.L78:
	lea (-40,%a0),%a0
	move.w %a0,%d3
	mvz.b %d3,%d3
	move.l %d3,%a0
	mov3q.l #3,%d3
	cmp.l %a0,%d3
	jcs .L81
	move.w #43,%a0
	mvz.b %d0,%d3
	sub.l %a1,%a0
	cmp.l #180,%d3
	jne .L82
	subq.l #2,%d1
.L83:
	move.l %a0,%d0
	lsl.l #2,%d0
	move.l %d0,%a1
	add.l #shp,%a1
	mvz.b ovp_on,%d0
	move.b %d2,(%a1,%d1.l)
	move.l %a0,%d1
	btst %d1,%d0
	jeq .L74
	addq.l #1,uart_sub
	lea ovp_col,%a1
.L103:
	move.b (%a0,%a1.l),%d2
	jra .L74
.L82:
	mov3q.l #3,%d1
	and.l %d0,%d1
	jra .L83
.L81:
	moveq #15,%d3
	cmp.l %a1,%d3
	jcs .L74
	mvz.b %d0,%d3
	cmp.l #180,%d3
	jne .L84
	subq.l #2,%d1
.L85:
	move.l %a1,%d0
	lsl.l #2,%d0
	move.l %d0,%a0
	add.l #sh,%a0
	move.b %d2,(%a0,%d1.l)
	tst.b ov_on.l
	jeq .L74
	addq.l #1,uart_sub
	lea ov_col,%a0
	jra .L103
.L84:
	mov3q.l #3,%d1
	and.l %d0,%d1
	jra .L85
	.size	uart_byte, .-uart_byte
	.align	2
	.type	blk4, @function
blk4:
	move.l %d2,-(%sp)
	moveq #21,%d2
	move.l 12(%sp),%d1
	move.l %d1,%d0
	lsr.l %d2,%d0
	moveq #127,%d2
	move.l 8(%sp),%a0
	and.l %d2,%d0
	moveq #14,%d2
	move.b %d0,(%a0)
	move.l %d1,%d0
	lsr.l %d2,%d0
	moveq #127,%d2
	and.l %d2,%d0
	move.b %d0,1(%a0)
	move.l %d1,%d0
	lsr.l #7,%d0
	and.l %d2,%d1
	and.l %d2,%d0
	move.b %d1,3(%a0)
	move.b %d0,2(%a0)
	move.l %a0,%d0
	addq.l #4,%d0
	move.l (%sp)+,%d2
	rts
	.size	blk4, .-blk4
	.align	2
	.type	sq_event, @function
sq_event:
	move.l sq+344,%d0
	mov3q.l #3,%d1
	move.l %a2,-(%sp)
	cmp.l %d0,%d1
	jcc .L106
	addq.l #1,sq+384
.L105:
	move.l (%sp)+,%a2
	rts
.L106:
	lsl.l #4,%d0
	move.w #11521,%a1
	move.l %d0,%a2
	add.l #sq+276,%a2
	move.w %a1,4(%a2)
	move.b 11(%sp),6(%a2)
	move.b 15(%sp),7(%a2)
	move.l #-260222380,(%a2)
	mov3q.l #2,%d0
	cmp.l 20(%sp),%d0
	jeq .L108
	move.l %a2,%d0
	addq.l #8,%d0
.L109:
	move.l 24(%sp),-(%sp)
	move.l %d0,-(%sp)
	jsr blk4
	addq.l #8,%sp
	move.l %d0,%a0
	move.b #-9,(%a0)+
	move.l sq+344,%d0
	move.l %d0,%d1
	addq.l #1,%d1
	move.l %d1,sq+344
	sub.l %a2,%a0
	move.w %a0,%d1
	add.l #sq,%d0
	move.l %d0,%a1
	move.b %d1,340(%a1)
	jra .L105
.L108:
	move.l %a2,%d0
	add.l #9,%d0
	move.b 19(%sp),8(%a2)
	jra .L109
	.size	sq_event, .-sq_event
	.align	2
	.type	sq_grid, @function
sq_grid:
	move.l 1100949720,%a0
	move.l %a0,%d0
	add.l #-1073741824,%d0
	cmp.l #67108863,%d0
	jhi .L113
	tst.b 353(%a0)
	jeq .L113
	tst.b 360(%a0)
	sne %d0
	mvs.b %d0,%d0
	neg.l %d0
.L110:
	rts
.L113:
	clr.l %d0
	jra .L110
	.size	sq_grid, .-sq_grid
	.align	2
	.type	sq_forget, @function
sq_forget:
	clr.l sq
	clr.l sq+4
	clr.l pin
	clr.l pin+4
	clr.l sq+8
	clr.l sq+404
	clr.l sq+408
	rts
	.size	sq_forget, .-sq_forget
	.align	2
	.type	ls_banked, @function
ls_banked:
	move.l 4(%sp),%d0
	moveq #41,%d1
	cmp.l %d0,%d1
	jcs .L117
	moveq #39,%d1
	cmp.l %d0,%d1
	jcs .L118
.L119:
	clr.l %d0
	jra .L116
.L117:
	move.l %d0,%d1
	mov3q.l #6,%d0
	add.l #-46,%d1
	cmp.l %d1,%d0
	jcs .L119
	moveq #75,%d0
	lsr.l %d1,%d0
	mov3q.l #1,%d1
	and.l %d1,%d0
.L116:
	rts
.L118:
	tst.l ls_host_presets
	sne %d0
	mvs.b %d0,%d0
	neg.l %d0
	jra .L116
	.size	ls_banked, .-ls_banked
	.align	2
	.type	pm_popup, @function
pm_popup:
	link.w %fp,#-24
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	pea -17(%fp)
	move.l 12(%fp),-(%sp)
	move.l %fp,%d3
	add.l #-16,%d3
	move.l %d3,-(%sp)
	jsr 1075563852
	pea 160.w
	jsr 1074276820
	pea 16.w
	move.l %d0,%d2
	jsr 1074276820
	lea (20,%sp),%sp
	move.l %d0,-24(%fp)
	tst.l %d2
	jeq .L123
	tst.l %d0
	jeq .L123
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	jsr 1074226920
	move.l -24(%fp),%a0
	move.l #1075628724,(%a0)
	mov3q.l #1,4(%a0)
	mov3q.l #1,8(%a0)
	move.l %d2,12(%a0)
	move.l %a0,-4(%fp)
	clr.l -(%sp)
	pea -8(%fp)
	move.l %d2,-8(%fp)
	move.l 8(%fp),%a0
	move.l 100(%a0),-(%sp)
	jsr 1074238454
	pea -4(%fp)
	jsr 1075251724
	lea (24,%sp),%sp
.L123:
	move.l %d3,-(%sp)
	jsr 1075557020
	move.l -32(%fp),%d2
	addq.l #4,%sp
	move.l -28(%fp),%d3
	unlk %fp
	rts
	.size	pm_popup, .-pm_popup
	.align	2
	.type	cu_tab, @function
cu_tab:
	move.l %d2,-(%sp)
	moveq #12,%d2
	move.l 8(%sp),%d1
	add.l #-40,%d1
	move.l 12(%sp),%d0
	cmp.l %d1,%d2
	jcs .L141
	move.w .L133(%pc,%d1.l*2),%d1
	ext.l %d1
	jmp %pc@(2,%d1:l)
	.balignw 2,0x284c
	.swbeg	&13
.L133:
	.word .L140-.L133
	.word .L141-.L133
	.word .L141-.L133
	.word .L139-.L133
	.word .L141-.L133
	.word .L141-.L133
	.word .L138-.L133
	.word .L137-.L133
	.word .L136-.L133
	.word .L135-.L133
	.word .L134-.L133
	.word .L141-.L133
	.word .L132-.L133
.L138:
	tst.l %d0
	jeq .L142
	move.l #cu_wtp2k,%d0
.L130:
	move.l (%sp)+,%d2
	rts
.L137:
	tst.l %d0
	jeq .L143
	move.l #cu_grp2k,%d0
	jra .L130
.L132:
	tst.l %d0
	jne .L149
	move.l #cu_srck,%d0
	jra .L130
.L136:
	tst.l %d0
	jeq .L145
	move.l #cu_lip2k,%d0
	jra .L130
.L135:
	tst.l %d0
	jeq .L146
	move.l #cu_cpp2k,%d0
	jra .L130
.L134:
	tst.l %d0
	jeq .L147
	move.l #cu_mip2k,%d0
	jra .L130
.L139:
	tst.l %d0
	jeq .L130
	move.l #cu_sap2k,%d0
	jra .L130
.L140:
	tst.l %d0
	jeq .L130
.L149:
	move.l #cu_p2k,%d0
	jra .L130
.L141:
	clr.l %d0
	jra .L130
.L142:
	move.l #cu_wtk,%d0
	jra .L130
.L143:
	move.l #cu_grk,%d0
	jra .L130
.L145:
	move.l #cu_lik,%d0
	jra .L130
.L146:
	move.l #cu_cpk,%d0
	jra .L130
.L147:
	move.l #cu_mik,%d0
	jra .L130
	.size	cu_tab, .-cu_tab
	.align	2
	.globl	cu_text
	.type	cu_text, @function
cu_text:
	lea (-48,%sp),%sp
	moveq #84,%d1
	movem.l #15612,(%sp)
	move.l 52(%sp),%d6
	add.l #-1100630172,%d6
	divu.l %d1,%d6
	move.b cu+8,%d5
	move.l 56(%sp),%d4
	move.l %d4,%d3
	move.l 60(%sp),%d2
	asr.l #8,%d3
	lea cu_tab,%a2
	lea cu_src,%a3
	lea cu_p2,%a4
	move.b %d5,43(%sp)
	mvz.b %d5,%d0
	clr.l -(%sp)
	move.l %d0,-(%sp)
	jsr (%a2)
	addq.l #8,%sp
	mov3q.l #1,-(%sp)
	move.l %d0,%d7
	mvz.b cu+1,%d0
	move.l %d0,-(%sp)
	jsr (%a2)
	addq.l #8,%sp
	move.l %d7,%a1
	sub.l %a0,%a0
	move.l %d0,%a2
	clr.l %d1
	add.l #10,%d0
	lea (10,%a1),%a1
.L155:
	mvs.w (%a3,%a0.l),%d5
	cmp.l %d5,%d6
	jne .L151
	tst.l %d7
	jeq .L153
	mvz.b (%a1),%d1
.L153:
	add.l #16,%d0
	lea (16,%a1),%a1
	addq.l #2,%a0
	moveq #16,%d5
	cmp.l %a0,%d5
	jne .L155
	cmp.l #441,%d6
	jne .L156
	moveq #12,%d1
.L156:
	move.l %d3,%d0
	moveq #127,%d5
	cmp.l %d3,%d5
	jge .L157
	moveq #127,%d0
.L158:
	addq.l #1,cu+4
	subq.l #1,%d1
	moveq #32,%d5
	cmp.l %d1,%d5
	jcs .L159
	move.w .L161(%pc,%d1.l*2),%d1
	ext.l %d1
	jmp %pc@(2,%d1:l)
	.balignw 2,0x284c
	.swbeg	&33
.L161:
	.word .L191-.L161
	.word .L190-.L161
	.word .L189-.L161
	.word .L188-.L161
	.word .L187-.L161
	.word .L186-.L161
	.word .L185-.L161
	.word .L184-.L161
	.word .L181-.L161
	.word .L183-.L161
	.word .L182-.L161
	.word .L181-.L161
	.word .L180-.L161
	.word .L179-.L161
	.word .L178-.L161
	.word .L177-.L161
	.word .L176-.L161
	.word .L175-.L161
	.word .L174-.L161
	.word .L173-.L161
	.word .L159-.L161
	.word .L172-.L161
	.word .L171-.L161
	.word .L170-.L161
	.word .L169-.L161
	.word .L168-.L161
	.word .L167-.L161
	.word .L166-.L161
	.word .L165-.L161
	.word .L162-.L161
	.word .L163-.L161
	.word .L162-.L161
	.word .L160-.L161
.L151:
	mvs.w (%a4,%a0.l),%d5
	cmp.l %d5,%d6
	jne .L153
	tst.l %a2
	jeq .L153
	move.l %d0,%a5
	mvz.b (%a5),%d1
	jra .L153
.L157:
	tst.l %d3
	jge .L158
	clr.l %d0
	jra .L158
.L191:
	moveq #63,%d0
	cmp.l %d3,%d0
	jge .L208
	move.l #cu_loop+10,%d0
.L242:
	move.l %d0,60(%sp)
	move.l #cu_fmt_s,%d1
.L231:
	move.l %d1,56(%sp)
	jra .L227
.L208:
	move.l #cu_loop+5,%d0
	jra .L242
.L190:
	muls.w #3,%d0
	asr.l #7,%d0
	mulu.w #5,%d0
	add.l #cu_loop,%d0
.L239:
	move.l %d0,60(%sp)
	move.l #cu_fmt_s,%d3
	jra .L233
.L189:
	moveq #15,%d5
	cmp.l %d3,%d5
	jge .L193
	clr.l %d0
.L193:
	mulu.w #5,%d0
	add.l #cu_chd,%d0
.L245:
	move.l %d0,60(%sp)
	lea cu_fmt_s,%a0
	jra .L232
.L188:
	mov3q.l #3,%d1
	cmp.l %d3,%d1
	jge .L194
	clr.l %d0
.L194:
	move.l %d0,60(%sp)
	move.l #cu_fmt_inv,%d3
.L233:
	move.l %d3,56(%sp)
.L227:
	move.l %d2,52(%sp)
	movem.l (%sp),#15612
	lea (48,%sp),%sp
	jmp 1074365954
.L187:
	mov3q.l #2,%d5
	cmp.l %d3,%d5
	jge .L195
	clr.l %d0
.L195:
	move.l %d0,60(%sp)
	lea cu_fmt_spr,%a0
.L232:
	move.l %a0,56(%sp)
	jra .L227
.L186:
	move.l %d0,%d1
	mov3q.l #5,%d3
	subq.l #1,%d1
	cmp.l %d1,%d3
	jcs .L196
.L243:
	move.l %d0,60(%sp)
	move.l #cu_fmt_d,%d5
	jra .L234
.L196:
	lea cu_loop,%a0
	move.l %a0,60(%sp)
.L230:
	lea cu_fmt_s,%a5
	jra .L228
.L185:
	mvs.w %d0,%d0
	asr.l #5,%d0
	mulu.w #5,%d0
	add.l #cu_warp,%d0
.L235:
	move.l %d0,60(%sp)
	jra .L237
.L184:
	mvs.w %d0,%d0
	asr.l #5,%d0
	mulu.w #6,%d0
	add.l #cu_win,%d0
	jra .L242
.L183:
	moveq #119,%d5
	cmp.l %d3,%d5
	jlt .L197
	muls.w #99,%d0
	divs.l %d5,%d0
.L236:
	move.l %d0,60(%sp)
	lea cu_fmt_d,%a0
	jra .L232
.L197:
	lea cu_frz,%a5
	move.l %a5,60(%sp)
.L237:
	move.l #cu_fmt_s,%d0
	move.l %d0,56(%sp)
	jra .L227
.L182:
	tst.l %d3
	jle .L198
	asr.l #4,%d0
	mulu.w #5,%d0
	add.l #cu_anim,%d0
	jra .L242
.L180:
	mvs.w %d0,%d0
	lsr.l #3,%d0
	and.l #262140,%d0
	add.l #cu_inpt,%d0
	jra .L245
.L179:
	mvs.w %d0,%d0
	asr.l #6,%d0
	mulu.w #5,%d0
	add.l #cu_mon,%d0
.L229:
	move.l %d0,60(%sp)
	jra .L230
.L178:
	tst.l %d3
	jle .L198
	muls.w #60,%d0
	moveq #126,%d3
	move.l #cu_fmt_db,%d5
	addq.l #3,%d0
	divs.l %d3,%d0
	add.l #-80,%d0
	move.l %d0,60(%sp)
.L234:
	move.l %d5,56(%sp)
	jra .L227
.L177:
	asr.l #1,%d0
	addq.l #1,%d0
	jra .L236
.L176:
	moveq #63,%d1
	cmp.l %d3,%d1
	jge .L199
	muls.w #48,%d0
	moveq #126,%d3
	add.l #-3009,%d0
	divs.l %d3,%d0
	tst.l %d0
	jeq .L213
.L241:
	move.l #cu_fmt_pd,%d1
.L202:
	move.l %d0,60(%sp)
	jra .L231
.L199:
	moveq #64,%d1
	moveq #-126,%d5
	sub.l %d0,%d1
	muls.w #48,%d1
	move.l %d1,%d0
	add.l #63,%d0
	divs.l %d5,%d0
.L213:
	move.l #cu_fmt_d,%d1
	jra .L202
.L175:
	muls.w #100,%d0
	moveq #127,%d3
	move.l #cu_fmt_pct,%d5
	add.l #63,%d0
	divs.l %d3,%d0
	move.l %d0,60(%sp)
	jra .L234
.L174:
	tst.l %d3
	jgt .L236
.L198:
	move.l #cu_off,%d3
.L238:
	move.l %d3,60(%sp)
	jra .L240
.L173:
	mvs.w %d0,%d0
	asr.l #3,%d0
	jeq .L201
	addq.l #1,%d0
	move.l %d0,60(%sp)
	lea cu_fmt_x,%a5
.L228:
	move.l %a5,56(%sp)
	jra .L227
.L172:
	mvs.w %d0,%d0
	asr.l #5,%d0
	mulu.w #5,%d0
	add.l #cu_tape,%d0
	jra .L239
.L171:
	muls.w #3,%d0
	lsr.l #5,%d0
	and.l #262140,%d0
	add.l #cu_dir,%d0
	move.l %d0,60(%sp)
.L240:
	move.l #cu_fmt_s,%d5
	jra .L234
.L170:
	mvs.w %d0,%d0
	asr.l #5,%d0
	mulu.w #5,%d0
	add.l #cu_cloop,%d0
	jra .L245
.L169:
	tst.l %d3
	jle .L201
.L159:
	move.l %d0,60(%sp)
	lea cu_fmt_d,%a5
	jra .L228
.L167:
	mvs.w %d0,%d0
	asr.l #5,%d0
	mulu.w #5,%d0
	add.l #cu_dst,%d0
	jra .L235
.L166:
	mvs.w %d0,%d0
	asr.l #3,%d0
	move.l #cu_fmt_d,%d1
	addq.l #1,%d0
	move.l %d0,60(%sp)
	jra .L231
.L165:
	tst.l %d3
	jle .L198
	add.l #-64,%d0
	moveq #64,%d5
	cmp.l %d3,%d5
	jge .L213
	jra .L241
.L163:
	tst.l %d3
	jle .L198
	subq.l #1,%d0
	muls.w #127,%d0
	moveq #126,%d3
	divs.l %d3,%d0
	jra .L243
.L162:
	tst.l %d3
	jle .L198
	subq.l #1,%d0
	jra .L236
.L160:
	muls.w #9,%d0
	asr.l #7,%d0
	mulu.w #6,%d0
	add.l #cu_play,%d0
	jra .L229
.L168:
	moveq #126,%d1
	cmp.l %d3,%d1
	jge .L203
	move.l #cu_hold,%d3
	jra .L238
.L203:
	tst.l %d3
	jgt .L236
.L201:
	move.l #cu_slc,%d0
	jra .L242
.L181:
	cmp.l #441,%d6
	jeq .L214
	move.b 43(%sp),%d5
	mov3q.l #6,%d1
	add.l #-46,%d5
	mvz.b %d5,%d5
	cmp.l %d5,%d1
	jcs .L215
	lea CSWTCH.548,%a0
	mvs.b (%a0,%d5.l),%d1
.L204:
	tst.l %d3
	jle .L198
	asr.l #5,%d4
	mov3q.l #7,%d3
	mov3q.l #-1,%d5
	and.l %d3,%d4
	cmp.l %d1,%d5
	jeq .L205
	lea ux,%a1
	lea (%a1,%d1.l),%a0
	mvz.b 3948(%a0),%d3
	cmp.l %d3,%d4
	jne .L205
	mvz.w #1280,%d3
	moveq #10,%d5
	muls.l %d0,%d5
	muls.l %d1,%d3
	move.l %d5,%a0
	add.l %d3,%a0
	tst.b 40(%a1,%a0.l)
	jeq .L205
	mulu.w #10,%d0
	mulu.w #1280,%d1
	move.l %d0,%a0
	lea 40(%a0,%d1.l),%a0
	move.l %a0,%d0
	add.l %a1,%d0
	jra .L229
.L214:
	clr.l %d1
	jra .L204
.L215:
	mov3q.l #-1,%d1
	jra .L204
.L205:
	move.l %d0,-(%sp)
	move.l %d4,%a0
	pea 65(%a0)
	pea cu_fmt_bk
	move.l %d2,-(%sp)
	jsr 1074365954
	movem.l 16(%sp),#15612
	lea (64,%sp),%sp
	rts
	.size	cu_text, .-cu_text
	.align	2
	.type	cu_knob, @function
cu_knob:
	lea (-16,%sp),%sp
	move.w 22(%sp),%d0
	move.l 24(%sp),%a1
	move.w 22(%sp),%d1
	movem.l #7172,(%sp)
	mulu.w #52,%d0
	mulu.w #84,%d1
	move.l %d0,%a0
	add.l #1075575064,%a0
	move.w 8(%a1),%d0
	add.l #1100630152,%d1
	muls.w #84,%d0
	move.l %d0,%a2
	clr.l %d0
	add.l #1100630152,%a2
.L248:
	lea (%a2,%d0.l),%a4
	moveq #84,%d2
	move.l %d1,%a3
	move.l (%a4),(%a3,%d0.l)
	addq.l #4,%d0
	cmp.l %d0,%d2
	jne .L248
	tst.b 10(%a1)
	jeq .L249
	lea cu_text,%a2
	move.l %a2,32(%a3)
.L249:
	move.l (%a1),40(%a0)
	move.l 4(%a1),48(%a0)
	move.l 28(%sp),44(%a0)
	mvz.b 14(%a1),%d0
	move.w 12(%a1),%d1
	lsl.l #8,%d0
	and.l #2048,%d1
	move.l %d0,8(%a0)
	move.b 15(%a1),%d0
	jeq .L250
	mvz.b %d0,%d0
	lsl.l #8,%d0
.L251:
	move.l %d0,12(%a0)
	mvz.b 11(%a1),%d0
	lsl.l #8,%d0
	move.l %d0,16(%a0)
	tst.w %d1
	jeq .L247
	mov3q.l #1,20(%a0)
.L247:
	movem.l (%sp),#7172
	lea (16,%sp),%sp
	rts
.L250:
	tst.w %d1
	jeq .L253
	mvz.w #32736,%d0
	jra .L251
.L253:
	mvz.w #32512,%d0
	jra .L251
	.size	cu_knob, .-cu_knob
	.align	2
	.type	cu_src_setup, @function
cu_src_setup:
	lea (-36,%sp),%sp
	movem.l #31804,(%sp)
	move.l 40(%sp),%d2
	clr.l -(%sp)
	move.l %d2,-(%sp)
	jsr cu_tab
	addq.l #8,%sp
	move.l %d0,%a2
	tst.l %d0
	jeq .L258
	moveq #40,%d0
	cmp.l %d2,%d0
	jeq .L258
	move.l #1094564988,%a0
.L260:
	move.l (%a0),%d0
	addq.l #4,%a0
	move.l %d0,-68(%a0)
	move.l %d0,-100(%a0)
	move.l %d0,-132(%a0)
	move.l %d0,-164(%a0)
	move.l %d0,-196(%a0)
	cmp.l #1094565020,%a0
	jne .L260
	mvz.b cu+8,%d0
	cmp.l %d0,%d2
	jeq .L261
.L263:
	move.l %d2,%d5
	clr.l %d3
	add.l #-43,%d5
	lea cu_src,%a6
	lea CSWTCH.546,%a5
	lea cu_knob,%a4
	move.l #1075575064,%a3
.L262:
	moveq #9,%d0
	cmp.l %d5,%d0
	jcs .L265
	move.l (%a5,%d5.l*4),%d0
.L264:
	move.w (%a6)+,%d4
	move.l %d0,-(%sp)
	mvz.w %d3,%d0
	addq.l #1,%d3
	lsl.l #4,%d0
	pea (%a2,%d0.l)
	mvs.w %d4,%d0
	mulu.w #52,%d4
	move.l %d0,-(%sp)
	jsr (%a4)
	lea (12,%sp),%sp
	move.l %d2,(%a3,%d4.l)
	moveq #8,%d0
	cmp.l %d3,%d0
	jne .L262
	move.b %d2,cu+8
	jra .L258
.L261:
	move.l 1075595808,%d0
	cmp.l 4(%a2),%d0
	jne .L263
	move.l 1075596276,%d0
	cmp.l 116(%a2),%d0
	jne .L263
	cmp.l 1075595760.l,%d2
	jne .L263
.L258:
	movem.l (%sp),#31804
	lea (36,%sp),%sp
	rts
.L265:
	move.l #cu_fm_short,%d0
	jra .L264
	.size	cu_src_setup, .-cu_src_setup
	.align	2
	.globl	cu_steps
	.type	cu_steps, @function
cu_steps:
	lea (-12,%sp),%sp
	moveq #-12,%d1
	movem.l #28,(%sp)
	move.l 16(%sp),%d2
	move.b 1093765506,%d0
	cmp.l %d2,%d1
	jle .L275
	moveq #127,%d0
	moveq #-13,%d1
	and.l -2147457096,%d0
	sub.l %d2,%d1
	moveq #-24,%d3
	mulu.w #2531,%d0
	move.l %d0,%a0
	add.l #1092966773,%a0
	mvz.w #152,%d0
	muls.l %d1,%d0
	move.b (%a0,%d0.l),%d0
	cmp.l %d2,%d3
	jgt .L276
	mvz.b %d0,%d2
	mov3q.l #2,%d4
	move.l %d2,%a0
	lea (-48,%a0),%a0
	cmp.l %a0,%d4
	jcc .L277
	moveq #43,%d3
	cmp.l %d2,%d3
	jne .L276
.L277:
	move.b %d0,cu+9
	mvz.b cu+30,%d0
	lea st+8,%a0
	move.b %d1,cu+10
	move.l (%a0),cu+16
	cmp.l %d0,%d1
	jne .L290
	move.b cu+28,%d0
.L278:
	move.b %d0,cu+29
.L276:
	clr.l %d0
.L274:
	movem.l (%sp),#28
	lea (12,%sp),%sp
	rts
.L290:
	clr.b %d0
	jra .L278
.L275:
	tst.l %d2
	jge .L280
	mvz.b cu+9,%d0
	moveq #50,%d1
	cmp.l %d0,%d1
	jne .L281
	mvz.b cu+10,%d1
	move.l %d2,%d0
	not.l %d0
	cmp.l %d1,%d0
	jeq .L291
.L281:
	mvz.b cu+11,%d0
	neg.l %d2
	cmp.l %d0,%d2
	jne .L276
	move.l st+8,%d0
	mov3q.l #3,%d2
	sub.l cu+24,%d0
	cmp.l %d0,%d2
	scc %d0
	mvs.b %d0,%d0
	neg.l %d0
	jra .L274
.L280:
	cmp.l #441,%d2
	jeq .L292
	lea cu_src,%a0
	clr.l %d3
.L283:
	mvs.w (%a0),%d1
	cmp.l %d1,%d2
	jne .L282
	mvz.b cu+8,%d0
	clr.l -(%sp)
	move.l %d0,-(%sp)
	jsr cu_tab
	addq.l #8,%sp
	tst.l %d0
	jeq .L276
	mvz.w %d3,%d3
	move.l %d0,%a0
	lsl.l #4,%d3
	mvz.w 12(%a0,%d3.l),%d0
	jra .L274
.L282:
	addq.l #2,%a0
	addq.l #1,%d3
	moveq #8,%d1
	cmp.l %d3,%d1
	jne .L283
	mvz.b %d0,%d0
	moveq #11,%d3
	cmp.l %d0,%d3
	jge .L284
	clr.l %d0
.L284:
	moveq #127,%d1
	and.l -2147457096,%d1
	mulu.w #152,%d0
	mulu.w #2531,%d1
	move.l %d1,%a0
	add.l #1092966773,%a0
	mvz.b (%a0,%d0.l),%d3
	mvz.b cu+1,%d0
	cmp.l %d3,%d0
	jne .L276
	mov3q.l #1,-(%sp)
	move.l %d3,-(%sp)
	jsr cu_tab
	addq.l #8,%sp
	tst.l %d0
	jeq .L276
	move.l 1075596172,%d1
	move.l %d0,%a0
	cmp.l 116(%a0),%d1
	jne .L276
	lea cu_p2,%a0
	clr.l %d1
.L285:
	mvs.w (%a0),%d4
	cmp.l %d4,%d2
	jne .L286
	moveq #40,%d2
	cmp.l %d3,%d2
	jne .L289
	mov3q.l #3,%d2
	cmp.l %d1,%d2
	jge .L276
.L289:
	mvz.w %d1,%d1
	move.l %d0,%a0
	lsl.l #4,%d1
	mvz.w 12(%a0,%d1.l),%d0
	jra .L274
.L286:
	addq.l #2,%a0
	addq.l #1,%d1
	moveq #8,%d4
	cmp.l %d1,%d4
	jne .L285
	jra .L276
.L291:
	mov3q.l #1,%d0
	jra .L274
.L292:
	mvz.w #2944,%d0
	jra .L274
	.size	cu_steps, .-cu_steps
	.align	2
	.type	pmo_time, @function
pmo_time:
	move.l -66650100,%d0
	add.l pmo+116,%d0
	sub.l 4(%sp),%d0
	move.l %d0,pmo+116
	rts
	.size	pmo_time, .-pmo_time
	.align	2
	.type	led_send4, @function
led_send4:
	moveq #-76,%d0
	link.w %fp,#-8
	move.l 12(%fp),%a0
	move.b 11(%fp),-5(%fp)
	move.l (%a0),-4(%fp)
	pea -6(%fp)
	mov3q.l #6,-(%sp)
	move.b %d0,-6(%fp)
	jsr rui_uart_raw
	addq.l #8,%sp
	unlk %fp
	rts
	.size	led_send4, .-led_send4
	.align	2
	.type	led_stock, @function
led_stock:
	lea (-24,%sp),%sp
	movem.l #19468,(%sp)
	move.l #sh,%d2
	sub.l %a6,%a6
	lea led_send4,%a2
.L308:
	move.l %d2,-(%sp)
	move.l %a6,-(%sp)
	jsr (%a2)
	addq.l #1,%a6
	addq.l #4,%d2
	addq.l #8,%sp
	moveq #16,%d0
	cmp.l %a6,%d0
	jne .L308
	move.l %sp,%d2
	sub.l %a6,%a6
	lea shs,%a3
	add.l #22,%d2
	lea rui_uart_raw,%a2
.L310:
	move.b (%a3,%a6.l),%d0
	mvz.b %d0,%d1
	cmp.l #255,%d1
	jeq .L309
	move.l %a6,%d1
	moveq #32,%d3
	or.l %d3,%d1
	move.b %d0,23(%sp)
	move.b %d1,22(%sp)
	move.l %d2,-(%sp)
	mov3q.l #2,-(%sp)
	jsr (%a2)
	addq.l #8,%sp
.L309:
	addq.l #1,%a6
	mov3q.l #4,%d0
	cmp.l %a6,%d0
	jne .L310
	movem.l (%sp),#19468
	lea (24,%sp),%sp
	rts
	.size	led_stock, .-led_stock
	.align	2
	.type	send, @function
send:
	move.l %a2,-(%sp)
	move.l %d2,-(%sp)
	mov3q.l #1,%d0
	cmp.l 1094562388.l,%d0
	jne .L317
	lea txsx_wait,%a2
	jsr (%a2)
	move.l %d0,%d2
	tst.l %d0
	jeq .L318
	addq.l #1,st+40
.L317:
	clr.l %d2
.L316:
	move.l %d2,%d0
	move.l (%sp)+,%d2
	move.l (%sp)+,%a2
	rts
.L318:
	move.l #1123449384,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L320
	addq.l #1,st+40
	jra .L316
.L320:
	jsr (%a2)
	tst.l %d0
	jne .L321
	mvz.w #4027,%d0
	cmp.l 1094562392.l,%d0
	jlt .L321
	move.l 1094562704,%a0
	mov3q.l #4,%d0
.L322:
	tst.l %a0
	jeq .L321
	move.l 52(%a0),%a0
	subq.l #1,%d0
	tst.l %d0
	jne .L322
	move.l 12(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	jsr 1073752544
	move.l #1123449384,-(%sp)
	jsr 1073746414
	lea (12,%sp),%sp
	mov3q.l #1,%d2
	addq.l #1,st+36
	jra .L316
.L321:
	move.l #1123449384,-(%sp)
	jsr 1073746414
	addq.l #1,st+40
	addq.l #4,%sp
	jra .L316
	.size	send, .-send
	.align	2
	.type	send3, @function
send3:
	link.w %fp,#-12
	move.l #-260222380,%d0
	move.l %d0,-10(%fp)
	moveq #1,%d0
	pea 10.w
	pea -10(%fp)
	move.b 11(%fp),-6(%fp)
	move.b 15(%fp),-4(%fp)
	move.b 19(%fp),-3(%fp)
	move.b 23(%fp),-2(%fp)
	move.b %d0,-5(%fp)
	moveq #-9,%d0
	move.b %d0,-1(%fp)
	jsr send
	addq.l #8,%sp
	unlk %fp
	rts
	.size	send3, .-send3
	.align	2
	.type	mr_send, @function
mr_send:
	move.w #13057,%d1
	link.w %fp,#-52
	move.b 11(%fp),-27(%fp)
	movem.l #3084,(%sp)
	move.l 12(%fp),%d2
	move.l #-260222380,%d0
	move.l %d0,-33(%fp)
	move.l 8(%fp),%d3
	add.l %d2,%d3
	move.b %d2,-26(%fp)
	lea (-25,%fp),%a2
	move.w %d1,-29(%fp)
.L331:
	move.l 8(%fp),%d1
	addq.l #2,%a2
	move.l 16(%fp),%a0
	move.b (%a0,%d1.l),%d0
	moveq #127,%d1
	and.l %d0,%d1
	mvz.b %d0,%d0
	move.b %d1,-2(%a2)
	move.l %d0,-(%sp)
	move.l 8(%fp),-(%sp)
	jsr mr_vb
	addq.l #1,8(%fp)
	addq.l #8,%sp
	move.b %d0,-1(%a2)
	cmp.l 8(%fp),%d3
	jgt .L331
	moveq #-9,%d0
	move.b %d0,-25(%fp,%d2.l*2)
	add.l %d2,%d2
	move.l %d2,%a0
	pea 9(%a0)
	pea -33(%fp)
	jsr send
	movem.l -52(%fp),#3084
	addq.l #8,%sp
	unlk %fp
	rts
	.size	mr_send, .-mr_send
	.align	2
	.type	kit_tick, @function
kit_tick:
	link.w %fp,#-12
	moveq #127,%d0
	and.l -2147457096,%d0
	move.l #-260222380,%a0
	move.l %a0,-8(%fp)
	move.l %d0,-12(%fp)
	move.l #989921527,%d0
	move.l %d0,-4(%fp)
	tst.b mr+19.l
	jne .L334
	mvz.b mr+18,%d0
	cmp.l -12(%fp),%d0
	jeq .L333
.L334:
	pea 8.w
	pea -8(%fp)
	move.b -9(%fp),-2(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L333
	clr.b %d0
	lea (-9,%fp),%a0
	move.b (%a0),mr+18
	move.b %d0,mr+19
	move.w mr+20,%d0
	addq.l #1,%d0
	move.w %d0,mr+20
.L333:
	unlk %fp
	rts
	.size	kit_tick, .-kit_tick
	.align	2
	.type	arp_tick, @function
arp_tick:
	lea (-56,%sp),%sp
	movem.l #31996,(%sp)
	lea ar,%a2
	clr.l %d5
	move.l %sp,%d2
	move.l #1081497995,%d4
	sub.l %a6,%a6
	move.l %a2,%a5
	add.l #46,%d2
.L345:
	moveq #127,%d0
	and.l -2147457096,%d0
	move.l %a6,%d1
	add.l #12,%d1
	move.w (%a5,%d1.l*2),%a1
	mulu.w #2531,%d0
	move.w %a1,%d6
	move.l %d0,%a0
	add.l #1092966778,%a0
	mvz.w %a1,%d0
	add.l %d5,%a0
	tst.w %d6
	jeq .L340
	clr.w %d7
	lea ar+48,%a3
	move.w %d7,(%a5,%d1.l*2)
	moveq #127,%d1
	and.l -2147457096,%d1
	mvz.b (%a3,%a6.l),%d6
	cmp.l %d6,%d1
	jne .L340
	move.w %a1,%d1
	lsr.l #8,%d0
	moveq #63,%d6
	mov3q.l #3,%d7
	move.l %d4,%a3
	move.b %d1,(%a0)
	move.b 1(%a0),%d1
	and.l %d6,%d1
	move.l %d0,%d6
	lsl.l #6,%d6
	and.l %d7,%d0
	or.l %d6,%d1
	move.b %d1,1(%a0)
	move.b %d0,(%a3)+
	move.w %a1,%d0
	move.b %d0,(%a3)
	addq.l #1,ar+66
.L340:
	move.b 1(%a0),%d6
	move.b (%a0),%d0
	lsl.l #2,%d6
	mvz.b %d0,%d1
	and.l #768,%d6
	or.l %d1,%d6
	mvz.w (%a2),%d1
	cmp.l %d1,%d6
	jne .L341
	mvz.w ar+60,%d1
	move.l %a6,%d7
	btst %d7,%d1
	jeq .L342
.L341:
	move.w #17665,%d1
	move.w %a6,%d7
	move.l #-260222380,%a3
	move.l %a3,46(%sp)
	move.w %d1,50(%sp)
	moveq #127,%d1
	and.l %d1,%d0
	move.b %d7,52(%sp)
	moveq #-9,%d7
	move.b %d0,53(%sp)
	move.l %d6,%d0
	lsr.l #7,%d0
	move.b %d7,55(%sp)
	move.b %d0,54(%sp)
	pea 10.w
	move.l %d2,-(%sp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L339
	move.w %d6,(%a2)
	move.l %a6,%d1
	mov3q.l #1,%d0
	lsl.l %d1,%d0
	addq.l #1,ar+62
	move.w ar+60,%d1
	not.l %d0
	and.l %d1,%d0
	move.w %d0,ar+60
.L342:
	addq.l #1,%a6
	add.l #152,%d5
	addq.l #2,%a2
	add.l #162,%d4
	moveq #12,%d6
	cmp.l %a6,%d6
	jne .L345
.L339:
	movem.l (%sp),#31996
	lea (56,%sp),%sp
	rts
	.size	arp_tick, .-arp_tick
	.align	2
	.type	sq_send2, @function
sq_send2:
	link.w %fp,#-16
	move.l #-260222380,%d0
	move.l %a2,-(%sp)
	move.w #11521,%a2
	move.l %d0,-16(%fp)
	move.b 11(%fp),-10(%fp)
	clr.l %d0
	move.l 12(%fp),%a1
	move.w %a2,-12(%fp)
.L354:
	lea (%a1,%d0.l),%a2
	move.b (%a2),-9(%fp,%d0.l)
	move.l %d0,%a0
	addq.l #1,%d0
	cmp.l 16(%fp),%d0
	jne .L354
	moveq #-9,%d0
	move.b %d0,-8(%fp,%a0.l)
	pea 9(%a0)
	pea -16(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L353
	addq.l #1,sq+456
.L353:
	move.l -20(%fp),%a2
	unlk %fp
	rts
	.size	sq_send2, .-sq_send2
	.align	2
	.type	pj_send, @function
pj_send:
	link.w %fp,#-12
	move.l #-260222380,%d0
	move.l %d2,-(%sp)
	moveq #64,%d2
	move.l %d0,-12(%fp)
	pea 12.w
	move.b 11(%fp),%d0
	pea -12(%fp)
	move.l 16(%fp),%d1
	and.l %d2,%d0
	moveq #63,%d2
	tst.b %d0
	seq %d0
	add.l #76,%d0
	move.b %d0,-8(%fp)
	moveq #1,%d0
	move.b %d0,-7(%fp)
	move.b 11(%fp),%d0
	and.l %d2,%d0
	moveq #127,%d2
	move.b %d0,-6(%fp)
	move.l 12(%fp),%d0
	lsr.l #7,%d0
	and.l %d2,%d0
	moveq #-9,%d2
	move.b %d0,-5(%fp)
	moveq #127,%d0
	and.l 12(%fp),%d0
	move.b %d2,-1(%fp)
	move.b %d0,-4(%fp)
	move.l %d1,%d0
	lsr.l #7,%d0
	move.b %d0,-3(%fp)
	moveq #127,%d0
	and.l %d0,%d1
	move.b %d1,-2(%fp)
	jsr send
	move.l -16(%fp),%d2
	addq.l #8,%sp
	unlk %fp
	rts
	.size	pj_send, .-pj_send
	.align	2
	.type	kq_owed_in.part.0, @function
kq_owed_in.part.0:
	lea (-32,%sp),%sp
	clr.l %d1
	movem.l #3324,(%sp)
	clr.b %d2
	move.l kq_owes,%a0
	move.l st+196,%d0
	lea kq_owed,%a2
	lea st,%a3
.L364:
	moveq #15,%d3
	cmp.l %d0,%d3
	jcs .L379
	moveq #31,%d6
	mov3q.l #1,%d7
	and.l %d1,%d6
	move.l %d1,%d3
	lsr.l #5,%d3
	move.l (%a2,%d3.l*4),%d4
	lsl.l %d6,%d7
	move.l %d7,%d6
	and.l %d4,%d6
	tst.l %d6
	jeq .L365
	move.l %d7,%d2
	not.l %d2
	and.l %d4,%d2
	move.l %d0,%a1
	subq.l #1,%a0
	lea (82,%a1),%a1
	move.b %d1,(%a3,%a1.l*2)
	lea (%a3,%d0.l*2),%a1
	addq.l #1,%d0
	move.l %d2,(%a2,%d3.l*4)
	clr.b %d2
	move.b %d2,165(%a1)
	moveq #1,%d2
.L365:
	addq.l #1,%d1
	cmp.l #256,%d1
	jne .L364
.L379:
	tst.b %d2
	jeq .L363
	move.l %a0,kq_owes
	move.l %d0,st+196
.L363:
	movem.l (%sp),#3324
	lea (32,%sp),%sp
	rts
	.size	kq_owed_in.part.0, .-kq_owed_in.part.0
	.align	2
	.type	flush, @function
flush:
	link.w %fp,#-36
	movem.l #7180,(%sp)
	tst.b st+992.l
	jeq .L381
	move.l st+8,%d0
	cmp.l #16383,%d0
	jls .L382
	mvz.w #16383,%d0
.L382:
	move.l #-260222380,%d1
	move.l %d1,-12(%fp)
	move.l %d0,%d1
	lsr.l #7,%d1
	move.w #13569,%a0
	pea 11.w
	pea -12(%fp)
	move.b %d1,-6(%fp)
	moveq #127,%d1
	and.l %d1,%d0
	move.w %a0,-8(%fp)
	move.w #32513,%a0
	move.b %d0,-5(%fp)
	moveq #-9,%d0
	move.w %a0,-4(%fp)
	move.b %d0,-2(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L380
	clr.b %d1
	addq.l #1,qp+8
	addq.l #1,st+968
	mov3q.l #1,qp+48
	mov3q.l #1,qp+100
	addq.l #1,pmo+68
	move.b %d1,st+992
.L381:
	tst.b st+161.l
	jeq .L385
	move.w st+162,%d1
	move.l #-260222380,%a0
	move.w #12289,%a1
	move.l %a0,-12(%fp)
	lea st+993,%a0
	move.b (%a0),-6(%fp)
	pea 10.w
	pea -12(%fp)
	mvz.w %d1,%d0
	lsr.l #8,%d0
	lsl.l #8,%d1
	move.w %a1,-8(%fp)
	add.l %d1,%d0
	move.w %d0,-5(%fp)
	moveq #-9,%d0
	move.b %d0,-3(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L380
	clr.b %d1
	move.b %d1,st+161
.L385:
	lea ls+4,%a0
	clr.l %d2
	move.l %fp,%d3
	move.l #-260222380,%a3
	lea ls,%a2
	add.l #-12,%d3
	move.l %a0,-16(%fp)
.L387:
	cmp.l ls+24.l,%d2
	jcs .L390
.L389:
	move.w %d2,%d0
	move.l ls+24,%d1
	move.l %d1,-16(%fp)
	mulu.w #5,%d0
	lea (%a2,%d0.l),%a0
	move.l %d2,%d0
.L391:
	cmp.l -16(%fp),%d0
	jcs .L392
	move.l -16(%fp),%d1
	sub.l %d2,%d1
	move.l %d1,-16(%fp)
	move.l %d1,ls+24
	tst.l %d1
	jne .L380
	lea st+164,%a2
	move.l %a2,%a4
.L393:
	move.l -16(%fp),%a0
	cmp.l st+196.l,%a0
	jcc .L397
	move.b (%a4),%d0
	mvz.b 1(%a4),%d1
	move.l %d1,-(%sp)
	moveq #127,%d1
	and.l %d0,%d1
	lsr.l #7,%d0
	move.l %d1,-(%sp)
	mov3q.l #1,%d1
	and.l %d0,%d1
	move.l %d1,-(%sp)
	pea 49.w
	jsr send3
	lea (16,%sp),%sp
	tst.l %d0
	jne .L394
.L397:
	move.l st+196,%d0
	move.l -16(%fp),%d1
.L395:
	cmp.l %d0,%d1
	jcs .L398
	sub.l -16(%fp),%d0
	move.l %d0,st+196
	tst.l %d0
	jne .L380
	move.l kq_owes,%d2
	tst.l %d2
	jeq .L399
	movem.l -36(%fp),#7180
	unlk %fp
	jra (kq_owed_in.part.0)
.L390:
	move.w #18945,%a1
	moveq #-9,%d0
	move.l -16(%fp),%a0
	move.l %a3,-12(%fp)
	move.b (%a0),-6(%fp)
	move.b 1(%a0),-5(%fp)
	move.b 2(%a0),-4(%fp)
	move.b 3(%a0),-3(%fp)
	move.b 4(%a0),-2(%fp)
	pea 12.w
	move.l %d3,-(%sp)
	move.w %a1,-8(%fp)
	move.b %d0,-1(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L389
	addq.l #5,-16(%fp)
	addq.l #1,%d2
	jra .L387
.L392:
	addq.l #5,%a0
	addq.l #5,%a2
	move.b -1(%a0),-1(%a2)
	addq.l #1,%d0
	move.b (%a0),(%a2)
	move.b 1(%a0),1(%a2)
	move.b 2(%a0),2(%a2)
	move.b 3(%a0),3(%a2)
	jra .L391
.L394:
	addq.l #2,%a4
	addq.l #1,-16(%fp)
	jra .L393
.L398:
	move.l -16(%fp),%a1
	addq.l #1,%d1
	move.b (%a2,%a1.l*2),(%a2)
	lea 1(%a2,%a1.l*2),%a0
	addq.l #2,%a2
	move.b (%a0),-1(%a2)
	jra .L395
.L399:
	lea st+96,%a2
.L404:
	move.l (%a2)+,-16(%fp)
	tst.l -16(%fp)
	jeq .L400
	moveq #-63,%d0
	cmp.l -16(%fp),%d0
	jle .L401
	moveq #-63,%d1
.L418:
	move.l %d1,-16(%fp)
.L402:
	mvz.b st+160,%d0
	move.l %d0,-(%sp)
	move.l -16(%fp),%d0
	add.l #64,%d0
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	move.l %d2,%d0
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	pea 50.w
	jsr send3
	lea (16,%sp),%sp
	tst.l %d0
	jeq .L380
	move.l -16(%fp),%d1
	sub.l %d1,-4(%a2)
	move.l st+64,%d1
	tst.l %d1
	jeq .L400
	move.l -66650100,%d0
	sub.l %d1,%d0
	move.l %d0,st+68
	add.l %d0,st+316
	addq.l #1,st+320
	cmp.l st+324.l,%d0
	jls .L403
	move.l %d0,st+324
.L403:
	clr.l st+64
.L400:
	addq.l #1,%d2
	moveq #16,%d0
	cmp.l %d2,%d0
	jne .L404
.L380:
	movem.l -36(%fp),#7180
	unlk %fp
	rts
.L401:
	moveq #63,%d0
	cmp.l -16(%fp),%d0
	jge .L402
	moveq #63,%d1
	jra .L418
	.size	flush, .-flush
	.align	2
	.type	ed_queue, @function
ed_queue:
	move.l %d2,-(%sp)
	move.l 8(%sp),%a1
	move.l 20(%sp),%d1
	addq.l #1,ed+80
	mov3q.l #1,ed+376
	tst.l sq
	jeq .L419
	move.l ed+64,%d0
	move.l %d0,%a0
	mov3q.l #7,%d2
	sub.l ed+68,%a0
	cmp.l %a0,%d2
	jcc .L421
	addq.l #1,ed+72
.L419:
	move.l (%sp)+,%d2
	rts
.L421:
	mov3q.l #7,%d2
	and.l %d2,%d0
	moveq #127,%d2
	lsl.l #3,%d0
	move.l %d0,%a0
	add.l #ed,%a0
	move.w %a1,%d0
	move.b %d0,(%a0)
	move.b 1079807236,%d0
	and.l %d2,%d0
	move.b %d0,1(%a0)
	mov3q.l #4,%d0
	cmp.l %a1,%d0
	jcc .L422
	lea (-16,%a1),%a1
	mov3q.l #1,%d2
	cmp.l %a1,%d2
	jcc .L422
	mvz.b 1093765506,%d0
	moveq #11,%d2
	cmp.l %d0,%d2
	jcc .L423
.L422:
	moveq #127,%d0
.L424:
	move.b %d0,2(%a0)
	tst.l 12(%sp)
	sne %d0
	moveq #127,%d2
	move.b 19(%sp),4(%a0)
	neg.l %d0
	move.b %d0,3(%a0)
	moveq #127,%d0
	and.l %d1,%d0
	move.b %d0,5(%a0)
	move.l %d1,%d0
	lsr.l #7,%d0
	and.l %d2,%d0
	move.b %d0,6(%a0)
	moveq #14,%d0
	lsr.l %d0,%d1
	move.b %d1,7(%a0)
	addq.l #1,ed+64
	jra .L419
.L423:
	move.b 1093765506,%d0
	jra .L424
	.size	ed_queue, .-ed_queue
	.align	2
	.type	ls_queue, @function
ls_queue:
	mvz.b ls+124,%d0
	move.l %a3,-(%sp)
	move.l %a2,-(%sp)
	mov3q.l #-1,-(%sp)
	move.l %d0,-(%sp)
	lea ls,%a2
	mvz.b ls+1,%d0
	move.l %d0,-(%sp)
	jsr sv_word
	lea (12,%sp),%sp
	move.l ls+24,%a0
	mov3q.l #3,%d1
	cmp.l %a0,%d1
	jcc .L429
	addq.l #1,ls+92
.L428:
	move.l (%sp)+,%a2
	move.l (%sp)+,%a3
	rts
.L429:
	lea (%a0,%a0.l*4),%a1
	lea ls+1,%a3
	addq.l #1,%a0
	move.l %a0,ls+24
	add.l %a2,%a1
	move.b (%a3),4(%a1)
	lea (%a0,%a0.l*4),%a3
	move.b 19(%sp),8(%a1)
	move.l %a3,%d1
	lea (15,%sp),%a3
	move.b (%a3),(%a2,%d1.l)
	move.l %d0,%d1
	lsr.l #7,%d1
	move.b %d1,6(%a1)
	moveq #127,%d1
	and.l %d1,%d0
	move.b %d0,7(%a1)
	jra .L428
	.size	ls_queue, .-ls_queue
	.align	2
	.type	ls_close, @function
ls_close:
	lea ls,%a0
	tst.b ls.l
	jeq .L431
	clr.b %d0
	clr.l ls+36
	addq.l #1,ls+80
	clr.l st+96
	clr.l st+124
	move.b %d0,ls
	mvz.b 7(%sp),%d0
	addq.l #1,100(%a0,%d0.l*4)
	move.l %d0,-(%sp)
	clr.l -(%sp)
	jsr ls_queue
	addq.l #8,%sp
.L431:
	rts
	.size	ls_close, .-ls_close
	.align	2
	.type	ls_enc, @function
ls_enc:
	lea (-12,%sp),%sp
	movem.l #28,(%sp)
	move.b ls,%d3
	move.l 16(%sp),%d0
	move.l 20(%sp),%d2
	tst.b %d3
	jeq .L434
	tst.l ls+36
	jeq .L435
	move.b ls+2,%d1
	add.l #-40,%d1
	mvz.b %d1,%d1
	lsr.l #1,%d1
	jeq .L435
	mov3q.l #7,%d1
	cmp.l %d0,%d1
	jne .L435
	add.l %d2,st+124
.L450:
	jsr flush
	jra .L436
.L435:
	mvz.b ls+125,%d1
	cmp.l %d1,%d0
	jeq .L434
	mov3q.l #3,-(%sp)
	jsr ls_close
	addq.l #4,%sp
.L438:
	clr.l %d0
.L433:
	movem.l (%sp),#28
	lea (12,%sp),%sp
	rts
.L434:
	or.l st+972,%d0
	jne .L438
	tst.b %d3
	jne .L439
	tst.b sv.l
	jeq .L438
	tst.b sv+8.l
	jeq .L438
	move.b sv+10,%d3
	jne .L438
	move.b sv+2,%d4
	mvz.b %d4,%d2
	move.l %d2,-(%sp)
	jsr ls_banked
	addq.l #4,%sp
	tst.l %d0
	jne .L440
	moveq #45,%d1
	cmp.l %d2,%d1
	jeq .L440
	moveq #43,%d1
	cmp.l %d2,%d1
	jne .L433
.L440:
	lea sv+1,%a0
	moveq #45,%d0
	move.b (%a0),ls+1
	move.b %d4,ls+2
	cmp.l %d2,%d0
	jeq .L443
	moveq #43,%d1
	cmp.l %d2,%d1
	jne .L441
.L443:
	moveq #10,%d3
.L441:
	clr.b %d0
	moveq #1,%d4
	lea st+8,%a0
	move.l (%a0),ls+126
	clr.l -(%sp)
	mov3q.l #1,-(%sp)
	move.b %d3,ls+124
	move.b %d0,ls+125
	move.b %d4,ls
	addq.l #1,ls+76
	jsr ls_queue
	jsr flush
	addq.l #8,%sp
.L436:
	mov3q.l #1,%d0
	jra .L433
.L439:
	add.l %d2,st+96
	addq.l #1,ls+84
	jra .L450
	.size	ls_enc, .-ls_enc
	.align	2
	.type	pmo_get, @function
pmo_get:
	lea (-28,%sp),%sp
	movem.l #3196,(%sp)
	move.l 32(%sp),%d3
	move.l %d3,%d2
	lsl.l #6,%d2
	lea pmo,%a2
	move.l 36(%sp),%d5
	lea (%a2,%d2.l),%a0
	add.l %d5,%a0
	mvz.b 584(%a0),%d0
	tst.l %d0
	jne .L452
	clr.b %d1
	move.l pmo+104,%d4
	move.l pmo+9096,%d0
	lea pmo+9100,%a1
.L453:
	tst.l %d0
	jne .L455
	tst.b %d1
	jeq .L456
	clr.l pmo+9096
.L456:
	moveq #127,%d0
	cmp.l %d4,%d0
	jcc .L462
	clr.l %d0
	jra .L451
.L452:
	mulu.w #44,%d0
	add.l #pmo+3420,%d0
.L451:
	movem.l (%sp),#3196
	lea (28,%sp),%sp
	rts
.L455:
	subq.l #1,%d0
	moveq #1,%d1
	mvz.b (%a1,%d0.l),%d6
	cmp.l %d6,%d4
	jls .L453
	move.l %d0,pmo+9096
	lea (%a2,%d0.l),%a0
	mvz.b 9100(%a0),%d0
	move.l %d0,%a1
	jra .L460
.L462:
	move.l %d4,%a1
.L460:
	move.l %a1,%d1
	moveq #44,%d6
	muls.l %d6,%d1
	move.w %a1,%d0
	move.l %d5,%a3
	addq.l #1,(%a2)
	lea (%a2,%d1.l),%a0
	move.l %d3,%d1
	addq.l #1,%d1
	mulu.w #42,%d3
	move.b %d1,3464(%a0)
	clr.w %d1
	mulu.w #44,%d0
	move.b %d5,3465(%a0)
	clr.l 3500(%a0)
	clr.l 3492(%a0)
	lea 26(%a3,%d3.l),%a3
	clr.l 3488(%a0)
	clr.l 3480(%a0)
	clr.l 3476(%a0)
	clr.l 3468(%a0)
	add.l #pmo+3464,%d0
	move.w %d1,3466(%a0)
	move.l %a3,3504(%a0)
	lea (%a2,%d2.l),%a0
	add.l %d5,%a0
	move.l %a1,%d1
	addq.l #1,%d1
	move.b %d1,584(%a0)
	cmp.l %d4,%d1
	jls .L451
	move.l %d1,pmo+104
	jra .L451
	.size	pmo_get, .-pmo_get
	.align	2
	.type	pj_push, @function
pj_push:
	lea (-12,%sp),%sp
	movem.l #28,(%sp)
	move.l 20(%sp),%d1
	move.l 24(%sp),%a1
#APP
| 5046 "rui.c" 1
	tas pj+136
	smi %d2
| 0 "" 2
#NO_APP
	tst.b %d2
	jeq .L468
	addq.l #1,pj+156
.L467:
	movem.l (%sp),#28
	lea (12,%sp),%sp
	rts
.L468:
	move.l pj,%d3
	move.l %d3,%d0
	sub.l pj+4,%d0
	lsr.l #5,%d0
	jeq .L470
	addq.l #1,pj+156
.L471:
	clr.b %d0
	move.b %d0,pj+136
	jra .L467
.L470:
	moveq #31,%d0
	and.l %d3,%d0
	lsl.l #2,%d0
	move.l %d0,%a0
	add.l #pj+8,%a0
	move.b 19(%sp),(%a0)
	moveq #127,%d0
	cmp.l %d1,%d0
	jcs .L474
	move.l %d1,%d0
	addq.l #1,%d0
.L472:
	move.b %d0,1(%a0)
	moveq #127,%d4
	cmp.l %a1,%d4
	jcs .L473
	move.l %a1,%d2
	addq.l #1,%d2
.L473:
	move.b %d2,2(%a0)
	addq.l #1,%d3
	move.l %d3,pj
	jra .L471
.L474:
	clr.b %d0
	jra .L472
	.size	pj_push, .-pj_push
	.align	2
	.type	led_restore, @function
led_restore:
	tst.b ov_on.l
	jeq .L475
	move.l #1100088672,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L477
	addq.l #1,st+1018
.L475:
	rts
.L477:
	clr.b %d0
	move.b %d0,ov_on
	jsr led_stock
	move.l #1100088672,-(%sp)
	jsr 1073746414
	addq.l #4,%sp
	move.l st+8,%d0
	addq.l #4,%d0
	tst.l %d0
	jne .L478
	mov3q.l #1,%d0
.L478:
	move.l %d0,led_again
	addq.l #1,st+1014
	jra .L475
	.size	led_restore, .-led_restore
	.align	2
	.type	led_tick, @function
led_tick:
	move.l st+4,%d0
	lea (-32,%sp),%sp
	movem.l #19460,(%sp)
	or.l sq+408,%d0
	move.l led_gen,%d1
	tst.l %d0
	jne .L483
	clr.l sq+468
	clr.l st+1006
.L484:
	clr.b %d1
	move.b %d1,led_owed
	jsr led_restore
	move.l led_again,%d0
	tst.l %d0
	jeq .L482
	tst.b ov_on.l
	jne .L482
	move.l st+8,%d1
	sub.l %d0,%d1
	jmi .L482
	move.l #1100088672,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L493
.L509:
	addq.l #1,st+1018
.L482:
	movem.l (%sp),#19460
	lea (32,%sp),%sp
	rts
.L483:
	tst.l sq+468
	jne .L485
	lea led_gen,%a0
	move.l (%a0),st+1002
	lea pg_gen,%a1
	move.l #2139062143,%a2
	clr.l st+1006
	mov3q.l #1,sq+476
	move.l (%a1),sq+472
	move.l %a2,sq+480
.L485:
	mov3q.l #1,sq+468
	cmp.l st+1002.l,%d1
	jeq .L486
	btst #0,%d1
	jne .L486
	move.b led_req_mode,%d0
	lea led_req,%a1
	move.w %d0,%a0
	clr.l %d0
.L487:
	lea (%a1,%d0.l),%a2
	moveq #16,%d2
	move.b (%a2),16(%sp,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d2
	jne .L487
	cmp.l led_gen.l,%d1
	jne .L486
	move.l %d1,st+1002
	move.w %a0,%d1
	lea st+1022,%a0
	mvz.b %d1,%d0
	move.l %d0,st+1006
	clr.l %d0
.L489:
	lea 16(%sp,%d0.l),%a1
	moveq #16,%d1
	move.b (%a1),(%a0,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L489
	moveq #1,%d2
	move.b %d2,led_owed
.L486:
	mov3q.l #1,%d0
	cmp.l st+1006.l,%d0
	jne .L484
	clr.l led_again
	tst.b ov_on.l
	jeq .L494
	tst.b led_owed.l
	jeq .L482
.L494:
	move.l #1100088672,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jeq .L509
	clr.l %d0
	lea st+1022,%a2
	lea ov_col,%a0
.L495:
	lea (%a2,%d0.l),%a1
	moveq #16,%d1
	move.b (%a1),(%a0,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L495
	moveq #1,%d2
	sub.l %a6,%a6
	lea led_send4,%a3
	move.b %d2,ov_on
.L496:
	move.b (%a2,%a6.l),%d0
	move.b %d0,19(%sp)
	move.b %d0,18(%sp)
	move.b %d0,17(%sp)
	move.b %d0,16(%sp)
	pea 16(%sp)
	move.l %a6,-(%sp)
	jsr (%a3)
	addq.l #1,%a6
	addq.l #8,%sp
	moveq #16,%d0
	cmp.l %a6,%d0
	jne .L496
	move.l #1100088672,-(%sp)
	jsr 1073746414
	clr.b %d1
	addq.l #1,st+1010
	move.b %d1,led_owed
	jra .L508
.L493:
	jsr led_stock
	move.l #1100088672,-(%sp)
	jsr 1073746414
	clr.l led_again
.L508:
	addq.l #4,%sp
	jra .L482
	.size	led_tick, .-led_tick
	.align	2
	.globl	rui_sysex
	.type	rui_sysex, @function
rui_sysex:
	link.w %fp,#-80
	move.l -66650100,%d1
	move.l 12(%fp),%d0
	movem.l #15612,(%sp)
	move.l %d1,-38(%fp)
	move.l 8(%fp),%a5
	mov3q.l #6,%d2
	cmp.l %d0,%d2
	jge .L514
	mvz.b 5(%a5),%d1
	subq.l #1,%d1
	tst.l %d1
	jne .L514
	mvz.b -1(%a5,%d0.l),%d1
	cmp.l #247,%d1
	jeq .L512
.L514:
	addq.l #1,rx_bad
	jra .L513
.L512:
	move.b 4(%a5),%d3
	move.l %d0,%d2
	moveq #50,%d4
	subq.l #7,%d2
	move.l %d3,%d1
	add.l #-40,%d1
	mvz.b %d1,%d1
	cmp.l %d1,%d4
	jcs .L514
	move.w .L516(%pc,%d1.l*2),%d1
	ext.l %d1
	jmp %pc@(2,%d1:l)
	.balignw 2,0x284c
	.swbeg	&51
.L516:
	.word .L535-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L534-.L516
	.word .L533-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L532-.L516
	.word .L514-.L516
	.word .L531-.L516
	.word .L530-.L516
	.word .L529-.L516
	.word .L528-.L516
	.word .L527-.L516
	.word .L514-.L516
	.word .L526-.L516
	.word .L525-.L516
	.word .L524-.L516
	.word .L523-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L522-.L516
	.word .L521-.L516
	.word .L520-.L516
	.word .L519-.L516
	.word .L514-.L516
	.word .L518-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L517-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L514-.L516
	.word .L515-.L516
.L529:
	mov3q.l #4,%d5
	cmp.l %d2,%d5
	jge .L536
	move.b 7(%a5),%d2
	moveq #15,%d6
	mvz.b %d2,%d4
	cmp.l %d4,%d6
	jcs .L536
	mvz.b 8(%a5),%d5
	mov3q.l #7,%d7
	cmp.l %d5,%d7
	jcs .L536
	move.b 9(%a5),%d1
	jeq .L536
	move.b 10(%a5),%d3
	jeq .L536
	mvz.b %d1,%d6
	add.l %d6,%d4
	moveq #16,%d6
	cmp.l %d4,%d6
	jlt .L536
	mvz.b %d3,%d4
	move.l %d5,%a0
	moveq #8,%d7
	add.l %d4,%a0
	cmp.l %a0,%d7
	jlt .L536
	ext.w %d3
	ext.w %d1
	mov3q.l #7,%d7
	add.l #-12,%d0
	muls.w %d3,%d1
	lsl.l #3,%d1
	move.l %d1,%d3
	addq.l #6,%d3
	divs.l %d7,%d3
	add.l %d1,%d3
	cmp.l %d0,%d3
	jne .L536
	mvs.b %d2,%d2
	lea (11,%a5),%a2
	clr.l %d0
	lsl.l #6,%d2
	move.l %d2,%a0
	add.l %d5,%a0
	add.l #staging,%a0
.L540:
	move.l %d1,%a1
	mov3q.l #7,%d2
	cmp.l %d1,%d2
	jge .L537
	mov3q.l #7,%a1
.L537:
	move.l %a2,%a3
	sub.l %a1,%d1
	mvz.b (%a3)+,%d3
	clr.l %d2
.L539:
	move.l %d3,%d5
	lsr.l #1,%d3
	move.b 1(%a2,%d2.l),%d6
	lsl.l #7,%d5
	or.l %d6,%d5
	move.b %d5,(%a0,%d0.l)
	addq.l #1,%d0
	cmp.l %d4,%d0
	jne .L538
	addq.l #8,%a0
	clr.l %d0
.L538:
	addq.l #1,%d2
	cmp.l %a1,%d2
	jne .L539
	lea (%a3,%a1.l),%a2
	tst.l %d1
	jgt .L540
.L751:
	moveq #1,%d3
	addq.l #6,%a5
	move.b (%a5),st_seq
	move.b %d3,st_valid
	jra .L526
.L536:
	clr.b %d4
	addq.l #1,rx_bad
	move.b %d4,st_valid
.L513:
	move.l -66650100,%d0
	addq.l #1,mt_calls
	sub.l -38(%fp),%d0
	add.l %d0,mt_sum
	cmp.l mt_max.l,%d0
	jls .L696
	move.l %d0,mt_max
.L696:
	movem.l -80(%fp),#15612
	mov3q.l #1,%d0
	unlk %fp
	rts
.L528:
	tst.l %d2
	jeq .L514
	tst.b st_valid.l
	jeq .L542
	mvz.b 6(%a5),%d1
	mvz.b st_seq,%d0
	cmp.l %d1,%d0
	jne .L542
	addq.l #1,sh_seq
	pea 256.w
	pea staging
	pea shadow
	lea copy32,%a2
	jsr (%a2)
	pea 704.w
	pea txt_st
	pea txt_sh
	jsr (%a2)
	move.l #-66650100,%a0
	lea (24,%sp),%sp
	addq.l #1,sh_seq
	addq.l #1,commits
	move.l (%a0),t_commit
.L542:
	clr.b %d0
	move.b %d0,st_valid
.L526:
	addq.l #1,rx
	jra .L513
.L527:
	mov3q.l #1,%d1
	cmp.l %d2,%d1
	jge .L514
	tst.b 7(%a5)
	jeq .L544
	moveq #1,%d2
	move.b %d2,host_open
	jra .L526
.L544:
	moveq #1,%d3
	move.b %d3,host_close
	jra .L526
.L515:
	move.l qp+56,%d4
	tst.l %d2
	jeq .L545
	move.b 6(%a5),%d5
	mov3q.l #3,%d6
	mvz.b %d5,%d0
	move.b %d5,-40(%fp)
	cmp.l %d0,%d6
	jcc .L546
	mov3q.l #7,%d7
	cmp.l %d0,%d7
	jcs .L547
	clr.l %d1
.L549:
	tst.b 6(%a5,%d1.l)
	jlt .L548
	addq.l #1,%d1
	cmp.l %d2,%d1
	jlt .L549
	mov3q.l #7,%d1
	cmp.l %d0,%d1
	jne .L550
	mov3q.l #1,%d3
	cmp.l %d2,%d3
	jne .L548
	addq.l #1,pmo+64
.L551:
	addq.l #1,qp+72
	jra .L526
.L550:
	mov3q.l #6,%d5
	cmp.l %d0,%d5
	jne .L552
	mov3q.l #5,%d6
	cmp.l %d2,%d6
	jne .L548
	mvz.b 10(%a5),%d1
	lsr.l #6,%d1
	jeq .L553
.L548:
	addq.l #1,pmo+20
.L545:
	mov3q.l #1,%d0
.L572:
	addq.l #1,qp+72
	tst.l %d0
	jeq .L577
	addq.l #1,qp+76
.L577:
	move.l %d4,%d1
	sub.l qp+60,%d1
	lsr.l #2,%d1
	jeq .L578
	addq.l #1,qp+80
	tst.l %d0
	jeq .L526
	tst.l %d2
	jeq .L666
	move.b 6(%a5),%d0
	moveq #127,%d4
	and.l %d4,%d0
.L579:
	move.l %d0,qp+88
	addq.l #1,qp+92
	jra .L526
.L552:
	mov3q.l #4,%d1
	cmp.l %d0,%d1
	jne .L662
	mov3q.l #4,%d5
.L554:
	mov3q.l #3,%d3
	cmp.l %d2,%d3
	jge .L548
	move.b 9(%a5),%d1
	mvz.b %d1,%d6
	tst.b %d1
	jeq .L548
	mov3q.l #4,%d7
	cmp.l %d0,%d7
	jne .L663
	move.w #28,%a0
.L555:
	cmp.l %d6,%a0
	jlt .L548
	ext.w %d1
	muls.w %d5,%d1
	addq.l #4,%d1
	cmp.l %d2,%d1
	jne .L548
	lea (10,%a5),%a0
	sub.l %a1,%a1
.L561:
	mvz.b (%a0),%d3
	moveq #12,%d1
	cmp.l %d3,%d1
	jcs .L548
	move.b 1(%a0),%d7
	move.w %d7,%a2
	moveq #63,%d7
	move.l %a2,%d1
	and.l %d7,%d1
	moveq #40,%d7
	move.l %d1,%a3
	subq.l #1,%a3
	cmp.l %a3,%d7
	jcs .L556
	mov3q.l #4,%d7
	cmp.l %d1,%d7
	jeq .L548
	moveq #12,%d7
	cmp.l %d3,%d7
	jne .L557
	moveq #29,%d3
	cmp.l %d1,%d3
	jeq .L548
	moveq #37,%d7
	cmp.l %d1,%d7
	jcs .L548
.L557:
	mov3q.l #4,%d3
	cmp.l %d0,%d3
	jeq .L559
.L560:
	addq.l #1,%a1
	add.l %d5,%a0
	cmp.l %d6,%a1
	jlt .L561
.L553:
	moveq #127,%d1
	and.l -2147457096,%d1
	mvz.b 7(%a5),%d2
	cmp.l %d2,%d1
	jeq .L562
	addq.l #1,pmo+8
	jra .L551
.L662:
	mov3q.l #5,%d5
	jra .L554
.L663:
	move.w #22,%a0
	jra .L555
.L556:
	move.l %d1,%a3
	mov3q.l #7,%d7
	lea (-48,%a3),%a3
	cmp.l %a3,%d7
	jcs .L558
	moveq #12,%d1
	cmp.l %d3,%d1
	jeq .L548
	mov3q.l #4,%d3
	cmp.l %d0,%d3
	jne .L548
.L559:
	move.l %a2,%d7
	btst #6,%d7
	jeq .L560
	jra .L548
.L558:
	moveq #56,%d7
	cmp.l %d1,%d7
	jne .L548
	moveq #12,%d1
	cmp.l %d3,%d1
	jne .L557
	jra .L548
.L562:
	lea fp,%a0
	mov3q.l #6,%d3
	move.l (%a0),pmo+60
	move.b 8(%a5),%d1
	move.b 7(%a5),%d2
	move.b %d1,-34(%fp)
	move.b %d2,-33(%fp)
	cmp.l %d0,%d3
	jeq .L664
	mvz.b 9(%a5),%d6
.L563:
	mov3q.l #4,%d4
	cmp.l %d0,%d4
	seq %d1
	neg.l %d1
	tst.b %d1
	jeq .L564
	mov3q.l #4,%a3
.L565:
	lea (10,%a5),%a0
	clr.l %d3
	lea pmo,%a2
.L566:
	cmp.l %d3,%d6
	jeq .L551
	mov3q.l #6,%d5
	cmp.l %d0,%d5
	jne .L567
	mvz.b 10(%a5),%d1
	clr.b %d7
	mvz.b 9(%a5),%d2
	clr.b %d5
	lsl.l #7,%d1
	sub.l %a4,%a4
	move.b %d7,-39(%fp)
	or.l %d1,%d2
	move.l %d2,%a1
.L568:
	move.l pmo+56,%d4
	move.l %d4,%d1
	sub.l pmo+80,%d1
	lsr.l #8,%d1
	jeq .L569
	addq.l #1,pmo+4
.L570:
	addq.l #1,%d3
	add.l %a3,%a0
	jra .L566
.L664:
	mov3q.l #1,%d6
	jra .L563
.L564:
	mov3q.l #5,%a3
	jra .L565
.L567:
	move.b 1(%a0),%d1
	mvz.b 3(%a0),%d2
	move.b (%a0),-39(%fp)
	move.w %d1,%a4
	mvz.b 2(%a0),%d1
	lsl.l #7,%d1
	or.l %d1,%d2
	move.l %d2,%a1
	mov3q.l #5,%d2
	cmp.l %d0,%d2
	jne .L665
	move.b 4(%a0),%d5
	jra .L568
.L665:
	clr.b %d5
	jra .L568
.L569:
	move.l %d4,%d1
	mvz.b %d1,%d1
	move.b -39(%fp),%d7
	move.l %d1,%d2
	add.l #177,%d2
	lsl.l #3,%d2
	lsl.l #3,%d1
	move.b %d7,(%a2,%d2.l)
	move.w %a4,%d7
	lea (%a2,%d1.l),%a4
	move.b -40(%fp),1418(%a4)
	move.b -34(%fp),1419(%a4)
	move.w %a1,1420(%a4)
	move.b %d5,1422(%a4)
	move.b -33(%fp),1423(%a4)
	move.b %d7,1(%a2,%d2.l)
	addq.l #1,%d4
	move.l %d4,pmo+56
	jra .L570
.L546:
	mov3q.l #1,%d6
	cmp.l %d0,%d6
	jne .L547
	mov3q.l #5,%d7
	cmp.l %d2,%d7
	jne .L547
	mvz.b 8(%a5),%d5
	mvz.b 10(%a5),%d3
	mvz.b 7(%a5),%d0
	clr.l %d6
	lsl.l #7,%d5
	lsl.l #7,%d3
	and.l #3968,%d5
	and.l #3968,%d3
	or.l %d0,%d5
	mvz.b 9(%a5),%d0
	or.l %d0,%d3
	or.l %d5,%d3
.L574:
	btst %d6,%d3
	jeq .L573
	jsr 1075312702
	mov3q.l #1,%d7
	clr.l -(%sp)
	move.l %d5,%d1
	lsr.l %d6,%d1
	move.l %d0,%a0
	and.l %d1,%d7
	move.l %d7,-(%sp)
	move.l %d6,-(%sp)
	pea 48(%a0)
	jsr 1074493548
	lea (16,%sp),%sp
.L573:
	addq.l #1,%d6
	moveq #12,%d0
	cmp.l %d6,%d0
	jne .L574
.L575:
	clr.l %d0
	jra .L572
.L547:
	mov3q.l #2,%d1
	cmp.l %d2,%d1
	jne .L576
	cmp.l %d0,%d1
	jne .L545
	mvz.b 7(%a5),%d3
	moveq #12,%d5
	cmp.l %d3,%d5
	jcs .L545
	jsr 1075312702
	clr.l -(%sp)
	move.l %d3,%a0
	pea -1(%a0)
	move.l %d0,%a1
	pea 352(%a1)
	jsr 1074429188
.L750:
	lea (12,%sp),%sp
	jra .L575
.L576:
	mov3q.l #3,%d1
	cmp.l %d2,%d1
	jne .L545
	cmp.l %d0,%d1
	jne .L545
	move.b 7(%a5),%d3
	moveq #11,%d5
	move.l %d3,%d0
	subq.l #1,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d5
	jcs .L545
	move.b 8(%a5),%d5
	jmi .L545
	lsl.l #8,%d5
	jsr 1075398792
	mvz.b %d3,%d3
	move.l %d3,%a0
	and.l #65280,%d5
	move.l %d5,-(%sp)
	pea -1(%a0)
	move.l %d0,-(%sp)
	jsr 1074499748
	jra .L750
.L666:
	clr.l %d0
	jra .L579
.L578:
	tst.l %d2
	jeq .L667
	move.b 6(%a5),%d1
	moveq #127,%d5
	and.l %d5,%d1
.L580:
	mov3q.l #3,%d2
	and.l %d4,%d2
	lea qp,%a0
	move.b %d1,64(%a0,%d2.l*2)
	move.b %d0,65(%a0,%d2.l*2)
	addq.l #1,%d4
	move.l %d4,qp+56
	jra .L526
.L667:
	clr.b %d1
	jra .L580
.L518:
	mov3q.l #2,%d6
	cmp.l %d2,%d6
	jne .L581
	mvz.b 6(%a5),%d0
	moveq #127,%d7
	cmp.l %d0,%d7
	jne .L582
	mvz.b 7(%a5),%d0
	mov3q.l #1,%d1
	cmp.l %d0,%d1
	jcs .L582
	move.l %d0,ls_host_presets
	jra .L526
.L581:
	mov3q.l #1,%d3
	cmp.l %d2,%d3
	jge .L514
.L582:
	mvz.b 6(%a5),%d0
	moveq #126,%d4
	cmp.l %d0,%d4
	jne .L584
	move.b 7(%a5),%d0
	mov3q.l #1,%d5
	and.l %d0,%d5
	move.l %d5,fk_claim
	jra .L526
.L584:
	subq.l #2,%d2
	tst.l %d2
	jne .L514
	moveq #11,%d7
	cmp.l %d0,%d7
	jcs .L514
	mvz.b 7(%a5),%d0
	lsr.l #1,%d0
	jne .L514
	mvz.w 6(%a5),%d0
	move.l %d0,ls_in_v
	addq.l #1,ls_in_gen
	jra .L526
.L535:
	subq.l #6,%d2
	tst.l %d2
	jne .L514
	move.l %a5,%d0
	add.l #12,%d0
	lea (6,%a5),%a0
.L588:
	tst.b (%a0)
	jlt .L514
	addq.l #1,%a0
	cmp.l %a0,%d0
	jne .L588
	addq.l #1,pc_seq
	clr.l %d0
	lea pc_req,%a0
.L589:
	lea 6(%a5,%d0.l),%a1
	mov3q.l #6,%d1
	move.b (%a1),(%a0,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L589
	addq.l #1,pc_seq
	jra .L526
.L532:
	tst.l %d2
	jeq .L514
	move.b 6(%a5),%d0
	mov3q.l #1,%d3
	mvz.b %d0,%d1
	cmp.l %d1,%d3
	jcs .L514
	jne .L591
	moveq #17,%d4
	cmp.l %d2,%d4
	jne .L514
	move.l %a5,%d1
	add.l #23,%d1
	lea (7,%a5),%a0
.L594:
	mvz.b (%a0),%d2
	moveq #111,%d5
	cmp.l %d2,%d5
	jcs .L514
	addq.l #1,%a0
	cmp.l %a0,%d1
	jne .L594
.L591:
	addq.l #1,led_gen
	move.b %d0,led_req_mode
	clr.l %d0
	lea led_req,%a0
.L595:
	mvz.b 6(%a5),%d1
	subq.l #1,%d1
	tst.l %d1
	jne .L596
	moveq #16,%d3
	cmp.l %d0,%d3
	jne .L597
.L596:
	addq.l #1,led_gen
	jra .L526
.L597:
	lea 7(%a5,%d0.l),%a1
	move.b (%a1),(%a0,%d0.l)
	addq.l #1,%d0
	jra .L595
.L534:
	moveq #14,%d4
	cmp.l %d0,%d4
	jcs .L514
	mvz.w #21504,%d1
	btst %d0,%d1
	jeq .L514
	mvz.b 7(%a5),%d0
	moveq #31,%d5
	cmp.l %d0,%d5
	jcs .L514
	mov3q.l #4,%d6
	cmp.l %d2,%d6
	jge .L599
	mvz.b 10(%a5),%d0
	cmp.l %d0,%d5
	jcs .L514
	mov3q.l #7,%d7
	cmp.l %d2,%d7
	jne .L599
	mvz.b 12(%a5),%d0
	cmp.l %d0,%d5
	jcs .L514
.L599:
	addq.l #1,sq_gen
	clr.l %d0
	lea sq_req,%a0
.L601:
	cmp.l %d2,%d0
	jge .L668
	moveq #127,%d3
	move.b 6(%a5,%d0.l),%d1
	and.l %d3,%d1
.L600:
	move.b %d1,(%a0,%d0.l)
	addq.l #1,%d0
	mov3q.l #7,%d4
	cmp.l %d0,%d4
	jne .L601
	addq.l #1,sq_gen
	jra .L526
.L668:
	clr.b %d1
	jra .L600
.L521:
	subq.l #2,%d2
	tst.l %d2
	jne .L514
	mvz.b 7(%a5),%d0
	moveq #31,%d6
	cmp.l %d0,%d6
	jcs .L514
	lsl.l #7,%d0
	mvz.b 6(%a5),%d1
	addq.l #1,pin+56
	or.l %d0,%d1
	move.l %d1,pin+4
	jra .L526
.L520:
	move.l %d0,%d1
	moveq #14,%d7
	add.l #-10,%d1
	rems.l %d7,%d6:%d1
	tst.l %d6
	jne .L669
	mov3q.l #3,%d1
.L604:
	mov3q.l #2,%d3
	cmp.l %d2,%d3
	jge .L605
	move.b 6(%a5),%d4
	mvz.b %d4,%d5
	cmp.l %d5,%d3
	jcs .L605
	move.b 7(%a5),%d3
	mvz.b %d3,%d7
	move.l %d7,%a0
	mov3q.l #1,%d7
	cmp.l %a0,%d7
	jcs .L605
	tst.l %d6
	jeq .L606
	add.l #-11,%d0
	moveq #14,%d7
	rems.l %d7,%d6:%d0
	tst.l %d6
	jne .L605
.L606:
	mov3q.l #4,%d0
	cmp.l %d1,%d0
	jne .L607
	mvz.b 9(%a5),%d0
	lsr.l #3,%d0
	jeq .L607
.L605:
	addq.l #1,ux+12
	jra .L514
.L669:
	mov3q.l #4,%d1
	jra .L604
.L607:
	ext.w %d4
	tst.b %d3
	jne .L608
	move.l %d5,%a0
	add.l #ux,%a0
	mvz.b 3948(%a0),%d0
	mov3q.l #4,%d7
	cmp.l %d1,%d7
	jne .L609
	mvz.b 9(%a5),%d3
	cmp.l %d0,%d3
	jeq .L610
.L608:
	move.w %d4,%d0
	mulu.w #1280,%d0
	move.l %d0,%a0
	add.l #ux+40,%a0
	mvz.w #128,%d0
.L611:
	clr.b (%a0)
	subq.l #1,%d0
	lea (10,%a0),%a0
	tst.l %d0
	jne .L611
	mov3q.l #4,%d0
	cmp.l %d1,%d0
	jne .L670
.L610:
	move.b 9(%a5),%d3
.L612:
	lea ux,%a0
	lea (%a0,%d5.l),%a1
	move.b %d3,3948(%a1)
	moveq #127,%d3
	mulu.w #1280,%d4
	lea (%a5,%d1.l),%a2
	addq.l #1,%d1
	move.b 8(%a5),%d0
	and.l %d3,%d0
	move.b %d0,36(%a0,%d5.l)
.L613:
	move.l %d1,%d0
	add.l #12,%d0
	cmp.l %d2,%d0
	jlt .L618
	addq.l #1,ux+8
	jra .L526
.L670:
	clr.b %d3
	jra .L612
.L618:
	move.b 6(%a2),%d0
	jmi .L614
	ext.w %d0
	move.l %d4,%a0
	mulu.w #10,%d0
	lea 40(%a0,%d0.l),%a1
	sub.l %a0,%a0
	add.l #ux,%a1
.L615:
	move.b 7(%a2,%a0.l),%d3
	moveq #94,%d5
	move.l %d3,%d0
	add.l #-32,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d5
	jcs .L616
	move.b %d3,(%a1,%a0.l)
	addq.l #1,%a0
	moveq #9,%d0
	cmp.l %a0,%d0
	jne .L615
.L616:
	clr.b %d6
	move.b %d6,(%a1,%a0.l)
.L614:
	lea (14,%a2),%a2
	add.l #14,%d1
	jra .L613
.L517:
	move.b 6(%a5),%d1
	moveq #96,%d0
	moveq #64,%d7
	and.l %d1,%d0
	cmp.l %d0,%d7
	jne .L671
	tst.l %d2
	jeq .L514
	mov3q.l #1,%a1
	mov3q.l #2,%d0
.L619:
	cmp.l %d2,%d0
	jne .L514
	mvz.b %d1,%d0
	moveq #111,%d3
	cmp.l %d0,%d3
	jcs .L514
	moveq #-128,%d0
	or.l %d1,%d0
	move.b %d0,-32(%fp)
	move.b 7(%a5),-31(%fp)
	tst.l %a1
	jne .L672
	move.b 8(%a5),%d0
.L622:
	move.b %d0,-30(%fp)
	moveq #112,%d4
	moveq #16,%d5
	and.l %d4,%d1
	move.l 1094559344,%a0
	move.l 1094559356,%d3
	move.w -66825036,%d0
	mvz.w %d0,%d0
	sub.l %d3,%d0
	mvz.w -66825028,%d3
	add.l %a0,%d0
	move.l 1094559352,%a0
	add.l %d2,%a0
	sub.l %d3,%d0
	and.l #4095,%d0
	mvz.w #4096,%d3
	sub.l %d0,%d3
	cmp.l %d1,%d5
	jne .L623
	tst.l %a1
	jne .L675
	tst.b 8(%a5)
	jeq .L675
	mvz.w #512,%d0
.L624:
	add.l %a0,%d0
	cmp.l %d0,%d3
	jge .L625
	addq.l #1,din_drop
	jra .L526
.L671:
	sub.l %a1,%a1
	mov3q.l #3,%d0
	jra .L619
.L672:
	clr.b %d0
	jra .L622
.L623:
	lsr.l #5,%d1
	jeq .L675
	mvz.w #1536,%d0
	jra .L624
.L675:
	moveq #8,%d0
	jra .L624
.L625:
	mov3q.l #3,-(%sp)
	pea -32(%fp)
	move.l %d2,-(%sp)
	jsr 1074288478
	lea (12,%sp),%sp
	addq.l #1,din_sent
	jra .L526
.L522:
	subq.l #3,%d2
	tst.l %d2
	jne .L514
	mvz.b 6(%a5),%d0
	moveq #11,%d1
	cmp.l %d0,%d1
	jcs .L514
	tst.b 7(%a5)
	jlt .L514
	mvz.b 8(%a5),%d1
	lsr.l #3,%d1
	jne .L514
	moveq #127,%d1
	and.l -2147457096,%d1
	lea ar,%a0
	move.b %d1,48(%a0,%d0.l)
	mvz.b 8(%a5),%d1
	mvz.b 7(%a5),%d0
	mvz.b 6(%a5),%d2
	lsl.l #7,%d1
	or.l %d1,%d0
	or.l #-32768,%d0
	move.w %d0,24(%a0,%d2.l*2)
	jra .L526
.L519:
	move.l ux+3880,%d3
	add.l #-10,%d0
	mov3q.l #2,%d4
	cmp.l %d0,%d4
	jcs .L514
	move.b 6(%a5),%d1
	moveq #11,%d5
	mvz.b %d1,%d0
	cmp.l %d0,%d5
	jcs .L514
	mvz.b 7(%a5),%d0
	lsr.l #4,%d0
	jne .L514
	tst.b 8(%a5)
	jlt .L514
	mov3q.l #3,%d7
	cmp.l %d2,%d7
	jge .L630
	tst.b 9(%a5)
	jlt .L514
	mov3q.l #5,%d0
	cmp.l %d2,%d0
	jne .L630
	tst.b 10(%a5)
	jlt .L514
.L630:
	move.l %d3,%d0
	sub.l ux+3884,%d0
	lea ux,%a0
	lsr.l #3,%d0
	jeq .L631
	addq.l #1,ux+28
	jra .L526
.L631:
	mov3q.l #7,%d0
	and.l %d3,%d0
	mov3q.l #3,%d5
	move.l %d0,%a1
	lea (972,%a1),%a1
	move.b %d1,(%a0,%a1.l*4)
	lea (%a0,%d0.l*4),%a1
	move.b 7(%a5),3889(%a1)
	move.b 8(%a5),3890(%a1)
	cmp.l %d2,%d5
	jlt .L632
	clr.b %d6
	move.b %d6,3891(%a1)
.L633:
	clr.b %d1
.L635:
	add.l %d0,%a0
	addq.l #1,%d3
	move.b %d1,3952(%a0)
	move.l %d3,ux+3880
	addq.l #1,ux+16
	jra .L526
.L632:
	move.b 9(%a5),3891(%a1)
	subq.l #5,%d2
	tst.l %d2
	jne .L633
	move.b 10(%a5),%d1
	jra .L635
.L533:
	subq.l #4,%d2
	tst.l %d2
	jne .L514
	move.l %a5,%d1
	add.l #10,%d1
	lea (6,%a5),%a0
.L638:
	mvz.b (%a0),%d0
	moveq #111,%d2
	cmp.l %d0,%d2
	jcc .L637
	moveq #127,%d3
	cmp.l %d0,%d3
	jne .L514
.L637:
	addq.l #1,%a0
	cmp.l %d1,%a0
	jne .L638
	addq.l #1,pg_gen
	clr.l %d0
	lea pg_req,%a0
.L639:
	lea 6(%a5,%d0.l),%a1
	mov3q.l #4,%d1
	move.b (%a1),(%a0,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L639
	addq.l #1,pg_gen
	jra .L526
.L531:
	tst.l %d2
	jeq .L514
	move.b 6(%a5),%d0
	moveq #127,%d2
	and.l %d2,%d0
	bset #8,%d0
	move.l %d0,splash_req
	jra .L526
.L530:
	add.l #-10,%d0
	moveq #37,%d3
	cmp.l %d0,%d3
	jcs .L514
	clr.l -32(%fp)
	moveq #127,%d4
	clr.l -28(%fp)
	moveq #14,%d5
	clr.l -24(%fp)
	clr.l -20(%fp)
	clr.l -16(%fp)
	clr.l -12(%fp)
	clr.l -8(%fp)
	clr.l -4(%fp)
	move.b 8(%a5),%d1
	move.b 7(%a5),%d2
	and.l %d4,%d1
	and.l %d4,%d2
	lsl.l %d5,%d1
	lsl.l #7,%d2
	or.l %d2,%d1
	move.b 6(%a5),%d2
	and.l %d4,%d2
	or.l %d2,%d1
	clr.l %d2
.L642:
	cmp.l %d2,%d0
	jgt .L645
	mvz.w %d1,%d1
	lea (-32,%fp),%a0
	clr.l %d0
	lea mask_keys,%a1
	move.l %d1,mask_enc
.L646:
	move.l (%a0)+,(%a1,%d0.l*4)
	moveq #8,%d1
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L646
	mov3q.l #1,mask_set
	addq.l #1,masks
	jra .L526
.L645:
	move.w %d2,%d3
	mvz.b 9(%a5,%d2.l),%d6
	clr.l %d4
	mulu.w #7,%d3
.L644:
	btst %d4,%d6
	jeq .L643
	cmp.l #255,%d3
	jgt .L643
	moveq #31,%d7
	and.l %d3,%d7
	move.l %d7,%d5
	mov3q.l #1,%d7
	lsl.l %d5,%d7
	move.l %d3,%d5
	asr.l #5,%d5
	or.l %d7,-32(%fp,%d5.l*4)
.L643:
	addq.l #1,%d4
	addq.l #1,%d3
	mov3q.l #7,%d7
	cmp.l %d4,%d7
	jne .L644
	addq.l #1,%d2
	jra .L642
.L525:
	mov3q.l #5,%d3
	cmp.l %d2,%d3
	jge .L647
	move.b 7(%a5),%d1
	moveq #63,%d4
	mvz.b %d1,%d2
	cmp.l %d2,%d4
	jcs .L647
	move.b 8(%a5),%d4
	jmi .L647
	mvz.b 9(%a5),%d3
	lsr.l #6,%d3
	jne .L647
	mvz.b 10(%a5),%d3
	moveq #16,%d6
	cmp.l %d3,%d6
	jcs .L647
	add.l #-13,%d0
	moveq #32,%d7
	cmp.l %d0,%d7
	jge .L676
.L647:
	clr.b %d0
	addq.l #1,rx_bad
	move.b %d0,st_valid
	jra .L513
.L650:
	move.b 12(%a5,%a0.l),%d3
	moveq #94,%d5
	add.l #-32,%d3
	mvz.b %d3,%d3
	cmp.l %d3,%d5
	jcc .L649
	clr.b %d6
	addq.l #1,rx_bad
	move.b %d6,st_valid
	jra .L513
.L649:
	addq.l #1,%a0
.L648:
	cmp.l %d0,%a0
	jlt .L650
	moveq #44,%d7
	ext.w %d1
	muls.l %d7,%d2
	lea txt_st,%a1
	mulu.w #44,%d1
	move.b %d4,(%a1,%d2.l)
	lea (%a1,%d2.l),%a0
	move.b 9(%a5),1(%a0)
	move.b 10(%a5),2(%a0)
	move.b 11(%a5),3(%a0)
	move.b %d0,4(%a0)
	lea (%a1,%d1.l),%a0
	clr.l %d1
.L651:
	cmp.l %d0,%d1
	jlt .L652
	clr.b %d1
	add.l %d2,%a1
	moveq #1,%d2
	addq.l #6,%a5
	move.b %d1,8(%a1,%d0.l)
	move.b %d2,st_valid
	move.b (%a5),st_seq
	jra .L526
.L676:
	sub.l %a0,%a0
	jra .L648
.L652:
	lea 12(%a5,%d1.l),%a2
	move.b (%a2),8(%a0,%d1.l)
	addq.l #1,%d1
	jra .L651
.L524:
	tst.l %d2
	jeq .L514
	lea txt_st+4,%a0
	moveq #64,%d0
.L654:
	clr.b (%a0)
	subq.l #1,%d0
	lea (44,%a0),%a0
	tst.l %d0
	jne .L654
	jra .L751
.L523:
	mov3q.l #5,%d4
	cmp.l %d2,%d4
	jge .L514
	move.b 6(%a5),%d1
	moveq #15,%d5
	mvz.b %d1,%d2
	cmp.l %d2,%d5
	jcs .L514
	add.l #-13,%d0
	moveq #11,%d6
	cmp.l %d0,%d6
	jlt .L514
	lea bind_gen,%a1
	addq.l #1,(%a1,%d2.l*4)
	move.b 7(%a5),%d4
	mvz.b %d4,%d5
	lsr.l #6,%d5
	jeq .L657
	st %d4
.L657:
	moveq #20,%d5
	ext.w %d1
	muls.l %d5,%d2
	lea bind_in,%a0
	mulu.w #20,%d1
	move.b %d4,(%a0,%d2.l)
	add.l %d2,%a0
	move.b 8(%a5),1(%a0)
	move.b 9(%a5),2(%a0)
	move.b 10(%a5),3(%a0)
	move.b 11(%a5),4(%a0)
	move.b %d0,5(%a0)
	move.l %d1,%a0
	clr.l %d1
	add.l #bind_in,%a0
.L658:
	cmp.l %d0,%d1
	jlt .L660
	mvz.b 6(%a5),%d0
	addq.l #1,(%a1,%d0.l*4)
	jra .L526
.L660:
	move.b 12(%a5,%d1.l),%d2
	moveq #94,%d6
	move.l %d2,%d4
	add.l #-32,%d4
	mvz.b %d4,%d4
	cmp.l %d4,%d6
	jcc .L659
	move.b %d3,%d2
.L659:
	move.b %d2,6(%a0,%d1.l)
	addq.l #1,%d1
	jra .L658
.L609:
	tst.l %d0
	jne .L608
	jra .L612
	.size	rui_sysex, .-rui_sysex
	.align	2
	.type	ov_suffix, @function
ov_suffix:
	move.l %a2,-(%sp)
	move.l %d2,-(%sp)
	move.l 16(%sp),%d1
	clr.l %d0
.L754:
	move.l 20(%sp),%a0
	tst.b (%a0,%d0.l)
	jne .L755
	cmp.l %d1,%d0
	jle .L760
.L758:
	clr.l %d0
.L753:
	move.l (%sp)+,%d2
	move.l (%sp)+,%a2
	rts
.L755:
	addq.l #1,%d0
	jra .L754
.L759:
	move.l 20(%sp),%a2
	mvs.b (%a0,%a1.l),%d2
	mvs.b (%a2,%a1.l),%d1
	cmp.l %d2,%d1
	jne .L758
	addq.l #1,%a1
.L756:
	cmp.l %a1,%d0
	jne .L759
	mov3q.l #1,%d0
	jra .L753
.L760:
	add.l 12(%sp),%d1
	sub.l %a1,%a1
	move.l %d1,%a0
	sub.l %d0,%a0
	jra .L756
	.size	ov_suffix, .-ov_suffix
	.text
.LC0:
	.string	"List"
.LC1:
	.string	"Browser"
.LC2:
	.string	"MenuView"
.LC3:
	.string	"QuickMuteMenuView"
.LC4:
	.string	"Window"
.LC5:
	.string	"ListView"
	.text
	.align	2
	.type	overlay, @function
overlay:
	lea (-20,%sp),%sp
	move.l 24(%sp),%d0
	movem.l #7180,(%sp)
	cmp.l ov_vt.l,%d0
	jne .L762
.L774:
	move.l ov_is,%d0
	jra .L761
.L762:
	move.l %d0,%d1
	add.l #-1073742852,%d1
	move.l %d0,ov_vt
	clr.l ov_is
	clr.l ov_list
	addq.l #1,ov_n
	cmp.l #2997243,%d1
	jls .L764
.L765:
	clr.l %d0
.L761:
	movem.l (%sp),#7180
	lea (20,%sp),%sp
	rts
.L764:
	mov3q.l #3,%d1
	and.l %d0,%d1
	tst.l %d1
	jne .L765
	move.l %d0,%a0
	move.l -4(%a0),%d0
	move.l %d0,%d1
	add.l #-1073742848,%d1
	cmp.l #2997247,%d1
	jhi .L765
	btst #0,%d0
	jne .L765
	move.l %d0,%a0
	move.l 4(%a0),%a2
	move.l %a2,%d0
	add.l #-1073742848,%d0
	cmp.l #2997247,%d0
	jhi .L765
.L766:
	move.b (%a2),%d0
	moveq #9,%d1
	add.l #-48,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d1
	jcc .L767
	clr.l %d2
.L768:
	tst.b (%a2,%d2.l)
	jne .L769
	pea .LC5
	move.l %d2,-(%sp)
	move.l %a2,-(%sp)
	lea ov_suffix,%a3
	jsr (%a3)
	lea (12,%sp),%sp
	tst.l %d0
	jne .L771
	pea .LC0
	move.l %d2,-(%sp)
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	tst.l %d0
	jne .L771
	pea .LC1
	move.l %d2,-(%sp)
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
.L771:
	pea .LC2
	move.l %d2,-(%sp)
	move.l %a2,-(%sp)
	move.l %d0,ov_list
	jsr (%a3)
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L772
	moveq #17,%d1
	cmp.l %d2,%d1
	jne .L773
	pea .LC3
	pea 17.w
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	mov3q.l #1,%d1
	eor.l %d1,%d0
.L773:
	move.l %d0,ov_is
	jra .L774
.L767:
	addq.l #1,%a2
	jra .L766
.L769:
	addq.l #1,%d2
	moveq #48,%d0
	cmp.l %d2,%d0
	jne .L768
	jra .L765
.L772:
	pea .LC4
	move.l %d2,-(%sp)
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L775
	mov3q.l #1,ov_is
	jra .L774
.L775:
	lea ov_names,%a4
	clr.l %d3
.L779:
	move.l (%a4)+,%a0
	clr.l %d0
.L776:
	tst.b (%a0,%d0.l)
	jne .L777
	cmp.l %d0,%d2
	jne .L778
	move.l %a0,-(%sp)
	move.l %d2,-(%sp)
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L778
	mov3q.l #1,ov_is
.L778:
	addq.l #1,%d3
	moveq #14,%d0
	cmp.l %d3,%d0
	jne .L779
	jra .L774
.L777:
	addq.l #1,%d0
	jra .L776
	.size	overlay, .-overlay
	.align	2
	.type	sv_tick, @function
sv_tick:
	lea (-60,%sp),%sp
	sub.l %a1,%a1
	movem.l #31996,(%sp)
	move.l 64(%sp),%a4
	clr.l %d7
	clr.l sv+80
	sub.l %a6,%a6
	move.l 28(%a4),%a2
	sub.l %a5,%a5
	lea (20,%a4),%a0
	clr.l %d0
	clr.l %d6
	clr.l %d2
	move.b 1093765506,%d1
	move.l %a0,56(%sp)
	move.b %d1,47(%sp)
	mvz.b %d1,%d4
	clr.l %d1
.L791:
	tst.l %a2
	jeq .L804
	cmp.l 56(%sp),%a2
	jeq .L804
	move.l 8(%a2),%a3
	tst.l %a3
	jne .L792
.L813:
	clr.l %d2
.L793:
	move.l %d2,%d3
	moveq #16,%d5
	lsl.l #2,%d3
	move.b sv+103,%d6
	moveq #11,%d0
	and.l %d5,%d3
	move.w %d6,%a5
	cmp.l %d4,%d0
	jge .L818
	move.l sv_fxb,%a2
	tst.l %a2
	jne .L819
	move.l #1397119061,%d1
	cmp.l 1075551828.l,%d1
	jne .L820
	move.l 1075551832,%a0
	clr.l -(%sp)
	clr.l -(%sp)
	jsr (%a0)
	addq.l #8,%sp
	btst #0,%d0
	jne .L821
	move.l %d0,%a2
	move.l #1397119062,%d5
	cmp.l (%a2),%d5
	jeq .L822
.L821:
	mov3q.l #1,sv_fxb
.L820:
	clr.b %d5
	clr.l %d7
	clr.l %d2
.L823:
	mvz.b %d5,%d1
	mov3q.l #3,%d0
	and.l %d0,%d2
	mov3q.l #4,%d6
	move.l %d1,%a2
	lea (-35,%a2),%a3
	cmp.l %a3,%d6
	jcc .L826
	tst.l %d3
	jeq .L827
	clr.l sv+80
.L827:
	tst.l %d2
	jne .L834
.L828:
	tst.b sv.l
	jeq .L839
	move.b sv+4,%d0
	mov3q.l #1,%d5
	clr.b %d4
	addq.l #1,sv+60
	or.l %d5,%d0
	move.b %d4,sv
	move.b %d4,sv+6
	move.b %d0,sv+4
	jra .L839
.L792:
	move.l (%a3),%d3
	tst.l %d2
	jeq .L794
	cmp.l #1075718412,%d3
	jeq .L795
	cmp.l #1075712228,%d3
	jeq .L795
	cmp.l #1075719596,%d3
	jeq .L795
	cmp.l #1075717140,%d3
	jne .L794
.L795:
	move.l (%a2),%a2
.L796:
	addq.l #1,%d6
	moveq #16,%d3
	cmp.l %d6,%d3
	jne .L791
.L804:
	cmp.l sv+84.l,%d0
	jne .L808
	cmp.l sv+88.l,%a5
	jeq .L809
.L808:
	move.l %d0,sv+84
	move.l %a5,sv+88
	clr.l sv+96
.L810:
	move.l %d6,sv+92
	tst.l %d1
	jeq .L811
	moveq #16,%d5
	cmp.l %d6,%d5
	jeq .L811
	tst.l %a2
	jne .L812
.L811:
	clr.l sv+80
	jra .L813
.L794:
	move.l %d3,%a5
	cmp.l #1075721468,%d3
	jne .L797
	move.l %a3,sv+80
	mov3q.l #1,%d1
.L798:
	tst.l %d2
	jeq .L800
	lea sv_covers,%a0
	clr.l %d0
.L801:
	cmp.l (%a0),%d3
	jne .L803
.L875:
	move.l %d2,%d7
.L800:
	cmp.l #1076055292,%d3
	seq %d3
	move.l (%a2),%a2
	move.l %a3,%d0
	mvs.b %d3,%d3
	neg.l %d3
	or.l %d3,%d2
	jra .L796
.L797:
	cmp.l #1075720560,%d3
	jne .L799
	mov3q.l #2,%d0
	or.l %d0,%d1
	move.l %a3,%a1
	jra .L798
.L799:
	cmp.l #1075628548,%d3
	jne .L798
	tst.b 127(%a3)
	sne %d0
	mvs.b %d0,%d0
	neg.l %d0
	or.l %d0,%d7
	jra .L798
.L803:
	addq.l #4,%a0
	addq.l #1,%d0
	moveq #8,%d5
	cmp.l %d0,%d5
	jne .L801
	move.l %d3,-(%sp)
	move.l %d1,52(%sp)
	move.l %a1,56(%sp)
	jsr overlay
	addq.l #4,%sp
	move.l 48(%sp),%d1
	move.l 52(%sp),%a1
	tst.l %d0
	jne .L875
	move.l %d2,%a6
	jra .L800
.L809:
	move.l sv+96,%d0
	cmp.l #65534,%d0
	jhi .L810
	addq.l #1,%d0
	move.l %d0,sv+96
	jra .L810
.L812:
	mov3q.l #1,%d6
	eor.l %d6,%d2
	or.l %d7,%d2
	tst.l %a6
	jeq .L815
	cmp.l #1076055292,%a5
	jeq .L815
	moveq #59,%d3
	cmp.l sv+96.l,%d3
	scc %d0
	mvs.b %d0,%d0
	neg.l %d0
	or.l %d0,%d2
.L815:
	btst #0,%d1
	jne .L817
	move.l %a1,sv+80
	addq.l #5,%d2
	jra .L793
.L817:
	addq.l #1,%d2
	jra .L793
.L822:
	move.l %d0,sv_fxb
.L824:
	move.l %a4,-(%sp)
	move.l 4(%a2),%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l %d0,%d2
	tst.l %d0
	jeq .L868
	moveq #15,%d4
	moveq #48,%d3
	and.l %d0,%d4
	and.l %d0,%d3
	btst #6,%d0
	jeq .L869
	mov3q.l #2,%d2
.L825:
	mvz.b -4(%a2,%d4.l),%d7
	clr.l sv+80
.L944:
	clr.b %d5
	jra .L823
.L819:
	mov3q.l #1,%d6
	cmp.l %a2,%d6
	jne .L824
	jra .L820
.L869:
	mov3q.l #1,%d2
	jra .L825
.L818:
	tst.l %d2
	jeq .L870
	move.b 47(%sp),%d5
	moveq #127,%d0
	clr.l %d7
	and.l -2147457096,%d0
	ext.w %d5
	mulu.w #2531,%d0
	mulu.w #152,%d5
	move.l %d0,%a0
	add.l %d5,%a0
	add.l #1092966773,%a0
	move.b (%a0),%d5
	jra .L823
.L868:
	clr.l %d7
	jra .L944
.L870:
	clr.l %d7
	clr.l %d3
	jra .L944
.L826:
	tst.l %d2
	jeq .L828
	move.l sv_umb,%d0
	tst.l %d0
	jne .L829
	move.l #1481856080,%a0
	cmp.l 1073848892.l,%a0
	jne .L834
	move.l 1073848896,%a0
	moveq #28,%d6
	move.l #1431130183,-(%sp)
	jsr (%a0)
	addq.l #4,%sp
	move.l %d0,%d1
	lsr.l %d6,%d1
	subq.l #4,%d1
	tst.l %d1
	jeq .L831
.L832:
	mov3q.l #1,sv_umb
.L834:
	moveq #11,%d6
	cmp.l %d4,%d6
	jlt .L835
	move.l %a2,-(%sp)
	move.l %d4,-(%sp)
	jsr mr_vb
	addq.l #8,%sp
	moveq #127,%d1
	mvz.b %d0,%d0
	cmp.l %d0,%d1
	jeq .L828
.L835:
	tst.b sv.l
	jeq .L836
	mvz.b sv+1,%d6
	mvz.b sv+10,%d0
	move.l %d6,%a0
	cmp.l %d6,%d4
	jne .L837
	mvz.b sv+2,%d1
	cmp.l %d1,%a2
	jne .L837
	cmp.l %d3,%d0
	jne .L838
.L839:
	mov3q.l #2,%d6
	cmp.l %d2,%d6
	seq %d3
	move.b sv,%d4
	neg.l %d3
	move.b %d3,sv+3
	tst.b %d4
	jeq .L845
	mov3q.l #1,%d0
	cmp.l %d2,%d0
	jeq .L846
.L845:
	mov3q.l #-1,%d0
.L847:
	move.l 68(%sp),%d5
	move.l %d0,sv+116
	cmp.l sv+20.l,%d5
	jeq .L853
	clr.l sv+16
	sub.l %a0,%a0
.L854:
	move.l 68(%sp),%d6
	move.l sv+12,%d0
	move.l st+4,%d7
	move.l %d6,sv+20
	cmp.l commits.l,%d0
	jne .L855
	tst.b %d4
	jeq .L856
	move.l %d7,%d1
	or.l st+972,%d1
	jne .L857
	move.b sv+103,%d1
	jeq .L858
	subq.l #1,%d1
	move.b %d1,sv+103
	mvz.b %d1,%d1
	cmp.l #128,%d1
	jne .L858
.L857:
	clr.b %d1
	move.b %d1,sv+103
.L858:
	mov3q.l #2,%d1
	cmp.l %d2,%d1
	jeq .L860
	cmp.l commits.l,%d0
	jne .L861
	tst.b sv+103.l
	jle .L860
.L861:
	moveq #19,%d5
	cmp.l %a0,%d5
	jcs .L860
	move.l %d7,%d1
	or.l st+972,%d1
	seq %d1
	mvs.b %d1,%d1
	neg.l %d1
	jra .L859
.L831:
	mov3q.l #3,%d1
	and.l %d0,%d1
	tst.l %d1
	jne .L832
	move.l #1431130183,%a1
	move.l %d0,%a0
	cmp.l (%a0),%a1
	jne .L832
	move.l %d0,sv_umb
.L833:
	move.l %d3,%d1
	asr.l #4,%d1
	clr.l -(%sp)
	move.l %d0,%a1
	move.l %d1,-(%sp)
	move.l 20(%a1),%a0
	jsr (%a0)
	addq.l #8,%sp
	moveq #17,%d1
	cmp.l %d0,%d1
	jne .L834
	add.l #32,%d3
	clr.l sv+80
	jra .L834
.L829:
	mov3q.l #1,%d1
	cmp.l %d0,%d1
	jne .L833
	jra .L834
.L837:
	cmp.l %d3,%d0
	jne .L838
	moveq #11,%d1
	moveq #11,%d6
	cmp.l %d4,%d1
	slt %d0
	moveq #1,%d1
	neg.l %d0
	cmp.l %a0,%d6
	jcs .L840
	clr.b %d1
.L840:
	mvz.b %d1,%d1
	mvz.b %d0,%d0
	cmp.l %d1,%d0
	jeq .L836
.L838:
	move.b sv+4,%d0
	mov3q.l #2,%d1
	lea sv+5,%a0
	move.b (%a0),sv+11
	or.l %d1,%d0
	move.b %d0,sv+4
.L836:
	tst.l %d7
	jne .L841
	mvz.b sv+1,%d0
	cmp.l %d0,%d4
	jeq .L842
.L945:
	clr.b %d0
.L843:
	moveq #1,%d1
	move.b %d3,sv+10
	or.l %d4,%d3
	move.b %d0,sv+103
	move.b sv+4,%d0
	lea commits,%a0
	move.b %d4,sv+1
	move.b %d5,sv+2
	move.l (%a0),sv+12
	addq.l #1,sv+56
	move.b %d1,sv
	mov3q.l #1,%d1
	move.b %d3,sv+5
	or.l %d1,%d0
	move.w #257,%d3
	move.b %d0,sv+4
	move.w %d3,sv+6
	jra .L839
.L842:
	mvz.b sv+2,%d0
	cmp.l %d0,%a2
	jne .L945
	mov3q.l #4,%d6
	cmp.l %a3,%d6
	jcs .L945
.L841:
	tst.b sv+8.l
	jne .L871
	tst.l %d7
	jeq .L945
	move.l st+972,%d0
	or.l st+4,%d0
	jne .L945
	moveq #19,%d0
	cmp.l sv+16.l,%d0
	jcs .L945
	moveq #-122,%d0
	jra .L843
.L871:
	moveq #6,%d0
	jra .L843
.L846:
	mvz.b sv+10,%d0
	lsr.l #5,%d0
	jne .L845
	move.l 1100949720,%a2
	move.l %a2,%d0
	add.l #-1073741824,%d0
	cmp.l #67108863,%d0
	jhi .L845
	jsr sq_grid
	tst.l %d0
	jeq .L845
	move.l 348(%a2),%d1
	tst.l %d1
	jeq .L943
	clr.l %d0
	jra .L848
.L850:
	addq.l #1,%d0
.L848:
	btst %d0,%d1
	jeq .L850
	jra .L847
.L943:
	move.l 344(%a2),%d1
	clr.l %d0
	tst.l %d1
	jeq .L845
.L851:
	btst %d0,%d1
	jeq .L852
	add.l #32,%d0
	jra .L847
.L852:
	addq.l #1,%d0
	jra .L851
.L853:
	move.l sv+16,%a0
	cmp.l #65534,%a0
	jhi .L854
	addq.l #1,%a0
	move.l %a0,sv+16
	jra .L854
.L856:
	clr.b %d5
	move.b %d5,sv+103
.L860:
	clr.l %d1
.L859:
	move.w %a5,%d6
	move.b %d1,%d5
	move.b %d1,sv+8
	tst.b %d6
	jge .L862
	tst.b sv+103.l
	jlt .L862
	moveq #1,%d6
	move.b %d6,32(%a4)
.L862:
	cmp.l commits.l,%d0
	sne %d0
	tst.l %d7
	sne %d7
	add.l %d3,%d3
	neg.l %d0
	neg.l %d7
	lsl.l #2,%d0
	lsl.l #4,%d7
	or.l %d7,%d0
	or.l %d4,%d0
	tst.l st+972
	sne %d4
	neg.l %d4
	lsl.l #5,%d4
	or.l %d4,%d0
	moveq #19,%d4
	or.l %d3,%d0
	cmp.l %a0,%d4
	scs %d3
	mvz.b sv+101,%d4
	neg.l %d3
	lsl.l #3,%d3
	or.l %d3,%d0
	move.l %d1,%d3
	lsl.l #6,%d3
	or.l %d3,%d0
	mvz.b %d0,%d3
	cmp.l %d4,%d3
	jne .L863
	move.l sv+104,%d6
	cmp.l sv+88.l,%d6
	jne .L863
	tst.l %d2
	jeq .L864
	move.l st+8,%a0
	moveq #19,%d3
	sub.l sv+108,%a0
	cmp.l %a0,%d3
	jge .L864
.L863:
	moveq #1,%d4
	move.b %d4,sv+102
.L864:
	move.b %d0,sv+100
	mvz.b %d5,%d0
	mvz.b sv+9,%d3
	cmp.l %d0,%d3
	jeq .L790
	tst.l %d1
	jeq .L866
	addq.l #1,sv+72
	mov3q.l #-1,st+20
	mov3q.l #1,st+344
.L867:
	moveq #1,%d0
	move.b %d5,sv+9
	move.b %d0,32(%a4)
.L790:
	movem.l (%sp),#31996
	lea (60,%sp),%sp
	rts
.L855:
	clr.b %d6
	move.b %d6,sv+103
	tst.b %d4
	jeq .L860
	jra .L858
.L866:
	subq.l #2,%d2
	tst.l %d2
	jne .L867
	addq.l #1,sv+76
	jra .L867
	.size	sv_tick, .-sv_tick
	.align	2
	.type	enter, @function
enter:
	move.l %d2,-(%sp)
	move.b 15(%sp),%d1
	tst.l st+4
	jne .L946
	tst.l st+972
	jeq .L948
	clr.l st+972
	mov3q.l #6,st+988
.L948:
	lea commits,%a0
	moveq #16,%d0
	move.l (%a0),st+24
	mov3q.l #1,st+4
	clr.l st+12
	mov3q.l #-1,st+20
	lea st+96,%a0
	addq.l #1,st+48
.L949:
	clr.l (%a0)+
	subq.l #1,%d0
	tst.l %d0
	jne .L949
	lea st+408,%a0
.L950:
	clr.l (%a0)+
	moveq #16,%d2
	addq.l #1,%d0
	cmp.l %d0,%d2
	jne .L950
	mvz.b %d1,%d0
	moveq #1,%d2
	lea (19,%sp),%a0
	move.b (%a0),st+993
	bset #8,%d0
	move.l 8(%sp),%a0
	move.b %d1,st+162
	clr.l st+196
	move.l %d0,st+296
	moveq #1,%d0
	move.b %d0,st+161
	move.b %d0,st+163
	move.b %d0,mr+13
	move.b %d0,mr+19
	move.w #4095,%d0
	move.w %d0,ar+60
	move.b %d2,32(%a0)
.L946:
	move.l (%sp)+,%d2
	rts
	.size	enter, .-enter
	.align	2
	.type	leave, @function
leave:
	move.l %d2,-(%sp)
	move.b 15(%sp),%d1
	tst.l st+4
	jeq .L953
	clr.l st+4
	clr.l st+1038
	addq.l #1,st+52
	clr.l st+1058
	clr.l st+196
	tst.l nk
	jeq .L955
	moveq #-33,%d0
	moveq #32,%d2
	and.l %d0,st+240
	or.l %d2,st+272
	clr.l nk
.L955:
	clr.l %d0
	lea kq_nodown,%a1
	lea kq_owed,%a0
.L956:
	clr.l (%a1,%d0.l)
	moveq #32,%d2
	clr.l (%a0,%d0.l)
	addq.l #4,%d0
	cmp.l %d0,%d2
	jne .L956
	mvs.b %d1,%d0
	moveq #1,%d2
	lea commits,%a0
	move.b %d1,st+162
	move.l %d0,st+296
	clr.b %d0
	clr.l kq_owes
	move.l (%a0),sv+12
	move.b %d2,st+161
	move.b %d0,st+163
	move.b %d0,st+993
	tst.l sq+408
	jne .L957
	clr.l st+1006
	jsr led_restore
.L957:
	moveq #1,%d0
	move.l 8(%sp),%a0
	move.b %d0,32(%a0)
.L953:
	move.l (%sp)+,%d2
	rts
	.size	leave, .-leave
	.align	2
	.type	queue_key, @function
queue_key:
	lea (-20,%sp),%sp
	movem.l #1084,(%sp)
	move.l 24(%sp),%d3
	tst.l txsx_test
	jeq .L960
	move.l st+8,%d0
	mov3q.l #1,txsx_test_on
	add.l txsx_test,%d0
	clr.l txsx_test
	move.l %d0,txsx_test_end
.L960:
	tst.l kq_owes
	jeq .L961
	jsr (kq_owed_in.part.0)
.L961:
	moveq #31,%d1
	mov3q.l #1,%d0
	and.l %d3,%d1
	move.l %d3,%d2
	lsr.l #5,%d2
	lea kq_nodown,%a0
	move.l (%a0,%d2.l*4),%d4
	lsl.l %d1,%d0
	tst.l 28(%sp)
	jeq .L962
	move.l %d0,%d1
	not.l %d1
	and.l %d4,%d1
	move.l %d1,(%a0,%d2.l*4)
	tst.l kq_owes
	jne .L963
	move.l st+196,%d1
	moveq #15,%d5
	move.l %d1,%a1
	addq.l #6,%a1
	cmp.l %a1,%d5
	jcc .L964
.L963:
	or.l %d0,%d4
	addq.l #1,st+44
	move.l %d4,(%a0,%d2.l*4)
.L959:
	movem.l (%sp),#1084
	lea (20,%sp),%sp
	rts
.L962:
	move.l %d4,%d1
	and.l %d0,%d1
	tst.l %d1
	jeq .L966
	not.l %d0
	and.l %d4,%d0
	move.l %d0,(%a0,%d2.l*4)
	jra .L959
.L966:
	move.l st+196,%d1
	moveq #15,%d4
	cmp.l %d1,%d4
	jcc .L964
	move.l %d1,%a1
	subq.l #1,%a1
	lea st+164,%a0
.L967:
	tst.l %a1
	jlt .L968
	mvz.b (%a0,%a1.l*2),%d4
	cmp.l %d4,%d3
	jne .L969
	move.l %a1,%d3
	add.l %d3,%d3
	move.l %d3,%d4
	add.l #st,%d4
	move.l %d4,%a2
	tst.b 165(%a2)
	jeq .L968
	add.l %d3,%a0
.L970:
	addq.l #1,%a1
	cmp.l %d1,%a1
	jlt .L971
	subq.l #1,%d1
	move.l %d1,st+196
	addq.l #1,st+44
	jra .L959
.L969:
	subq.l #1,%a1
	jra .L967
.L971:
	addq.l #2,%a0
	move.b (%a0),-2(%a0)
	move.b 1(%a0),-1(%a0)
	jra .L970
.L968:
	lea kq_owed,%a0
	move.l (%a0,%d2.l*4),%d1
	move.l %d1,%d3
	and.l %d0,%d3
	tst.l %d3
	jne .L959
	or.l %d0,%d1
	addq.l #1,kq_owes
	move.l %d1,(%a0,%d2.l*4)
	jra .L959
.L964:
	lea st,%a0
	move.l %d1,%d0
	add.l #82,%d0
	move.b %d3,(%a0,%d0.l*2)
	lea (%a0,%d1.l*2),%a0
	addq.l #1,%d1
	move.l %d1,st+196
	move.b 31(%sp),165(%a0)
	jra .L959
	.size	queue_key, .-queue_key
	.align	2
	.type	pmo_mix, @function
pmo_mix:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 12(%sp),%a0
	move.l 16(%sp),%d0
	move.l 24(%a0),%d1
	move.l %d0,36(%a0)
	tst.l 20(%sp)
	jne .L976
	move.l %d0,28(%a0)
	clr.b %d0
	move.l %d1,16(%a0)
.L977:
	move.b %d0,3(%a0)
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L976:
	moveq #127,%d3
	and.l 20(%sp),%d3
	sub.l 28(%a0),%d0
	lea pmo_rcp,%a1
	sub.l 16(%a0),%d1
	mvz.w (%a1,%d3.l*2),%d2
	moveq #9,%d3
	asr.l %d3,%d0
	asr.l %d3,%d1
	muls.l %d2,%d0
	muls.l %d2,%d1
	asr.l #6,%d0
	asr.l #6,%d1
	move.l %d0,32(%a0)
	move.b 23(%sp),%d0
	move.l %d1,20(%a0)
	jra .L977
	.size	pmo_mix, .-pmo_mix
	.align	2
	.type	pmo_fade, @function
pmo_fade:
	lea (-16,%sp),%sp
	movem.l #3084,(%sp)
	move.l 24(%sp),%d2
	clr.l %d3
	lea pmo+3464,%a2
	lea pmo_mix,%a3
.L979:
	cmp.l pmo+104.l,%d3
	jcs .L983
	movem.l (%sp),#3084
	lea (16,%sp),%sp
	rts
.L983:
	move.b (%a2),%d0
	jeq .L980
	mvz.b %d0,%d0
	move.l 20(%sp),%d1
	subq.l #1,%d0
	btst %d0,%d1
	jeq .L980
	clr.l 12(%a2)
	tst.l %d2
	jne .L981
	clr.b %d0
	clr.l 4(%a2)
.L982:
	move.b %d0,2(%a2)
	move.l %d2,-(%sp)
	clr.l -(%sp)
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
.L980:
	addq.l #1,%d3
	lea (44,%a2),%a2
	jra .L979
.L981:
	moveq #9,%d1
	move.l 4(%a2),%d0
	neg.l %d0
	asr.l %d1,%d0
	moveq #127,%d1
	and.l %d2,%d1
	lea pmo_rcp,%a0
	mvz.w (%a0,%d1.l*2),%d1
	muls.l %d1,%d0
	asr.l #6,%d0
	move.l %d0,8(%a2)
	move.b %d2,%d0
	jra .L982
	.size	pmo_fade, .-pmo_fade
	.align	2
	.globl	cu_setup
	.type	cu_setup, @function
cu_setup:
	lea (-28,%sp),%sp
	movem.l #15388,(%sp)
	move.l 32(%sp),%d2
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	jsr cu_tab
	addq.l #8,%sp
	move.l %d0,%a2
	tst.l %d0
	jeq .L990
	move.l %d2,-(%sp)
	jsr cu_src_setup
	mvz.b cu+1,%d0
	move.l %d2,%d4
	addq.l #4,%sp
	add.l #-43,%d4
	cmp.l %d0,%d2
	jne .L992
	move.l 1075597888,%d0
	cmp.l 4(%a2),%d0
	jne .L992
	move.l 1075596172,%d0
	cmp.l 116(%a2),%d0
	jne .L992
	move.l 1075597884,%d1
	moveq #9,%d0
	cmp.l %d4,%d0
	jcs .L996
	lea CSWTCH.546,%a0
	move.l (%a0,%d4.l*4),%d0
.L993:
	cmp.l %d0,%d1
	jeq .L990
.L992:
	lea cu_p2,%a3
	clr.l %d3
	lea CSWTCH.546,%a5
	lea cu_knob,%a4
.L995:
	moveq #9,%d0
	cmp.l %d4,%d0
	jcs .L997
	move.l (%a5,%d4.l*4),%d0
.L994:
	move.l %d0,-(%sp)
	mvz.w %d3,%d0
	addq.l #1,%d3
	lsl.l #4,%d0
	pea (%a2,%d0.l)
	mvs.w (%a3)+,%d0
	move.l %d0,-(%sp)
	jsr (%a4)
	lea (12,%sp),%sp
	moveq #8,%d0
	cmp.l %d3,%d0
	jne .L995
	move.w cu+2,%d0
	move.b %d2,cu+1
	addq.l #1,%d0
	move.w %d0,cu+2
.L990:
	movem.l (%sp),#15388
	lea (28,%sp),%sp
	rts
.L996:
	move.l #cu_fm_short,%d0
	jra .L993
.L997:
	move.l #cu_fm_short,%d0
	jra .L994
	.size	cu_setup, .-cu_setup
	.align	2
	.type	isr_send, @function
isr_send:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 16(%sp),%d1
	mov3q.l #1,%d0
	cmp.l 1094562388.l,%d0
	jeq .L1003
.L1011:
	clr.l %d0
.L1002:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L1003:
#APP
| 1781 "rui.c" 1
	move.w %sr,%d0
| 0 "" 2
#NO_APP
	move.l %d0,%d3
	move.l %d0,%d2
	and.l #1792,%d3
	mvz.w %d2,%d2
	cmp.l #1279,%d3
	jhi .L1005
	and.l #63743,%d0
	or.l #1280,%d0
#APP
| 1785 "rui.c" 1
	move.w %d0,%sr
| 0 "" 2
#NO_APP
.L1005:
	tst.l 1123449384
	jeq .L1006
.L1008:
#APP
| 1790 "rui.c" 1
	move.w %d2,%sr
| 0 "" 2
#NO_APP
	addq.l #1,sq+388
	jra .L1011
.L1006:
	tst.l 1094562372
	jne .L1008
	move.l %d1,%d0
	add.l 1094562392,%d0
	cmp.l #3800,%d0
	jgt .L1008
	move.l 1094562704,%a0
	tst.l %a0
	jeq .L1008
	move.l 52(%a0),%a0
	tst.l %a0
	jeq .L1008
	move.l 52(%a0),%d0
	move.l 12(%sp),-(%sp)
	move.l %d1,-(%sp)
	jsr 1073752544
#APP
| 1790 "rui.c" 1
	move.w %d2,%sr
| 0 "" 2
#NO_APP
	mov3q.l #1,%d0
	addq.l #8,%sp
	jra .L1002
	.size	isr_send, .-isr_send
	.align	2
	.globl	rui_render_in
	.type	rui_render_in, @function
rui_render_in:
	link.w %fp,#-112
	movem.l #1084,(%sp)
	tst.l 1094562372
	jne .L1019
	mov3q.l #1,txsx_gap
.L1019:
	lea fp,%a0
	addq.l #1,(%a0)
	tst.l fp+8
	jeq .L1020
	move.l (%a0),%d0
	sub.l fp+4,%d0
	cmp.l #3000,%d0
	jls .L1020
	move.l fp+8,%a0
	move.l fp,%d0
	move.l fp+4,%d1
	move.l 1123449124,%d2
	tst.l fp+12
	jeq .L1021
	move.l fp,%a1
	sub.l fp+12,%a1
	cmp.l #7499,%a1
	jls .L1020
.L1021:
	cmp.l %a0,%d2
	seq %d3
	sub.l %d1,%d0
	lea (-90,%fp),%a1
	clr.l %d1
	move.l %a1,%d4
	neg.l %d3
.L1022:
	move.l %d4,%a2
	addq.l #1,%d1
	clr.l (%a2)+
	moveq #9,%d5
	move.l %a2,%d4
	cmp.l %d1,%d5
	jne .L1022
	cmp.l %a0,%d2
	jeq .L1023
	mov3q.l #1,%d1
	move.l 72(%a0),%d2
	and.l %d2,%d1
	btst #0,%d2
	jne .L1023
	move.l %d2,%a0
	add.l #-1073741824,%a0
	cmp.l #129892303,%a0
	jhi .L1023
.L1024:
	move.l %d2,%a0
	moveq #36,%d4
	lea 4(%a0,%d1.l),%a2
	move.l (%a2),(%a1,%d1.l)
	addq.l #4,%d1
	cmp.l %d1,%d4
	jne .L1024
.L1023:
	move.w #19969,%a0
	move.l #-260222380,%d5
	move.b %d3,-48(%fp)
	move.l %d5,-54(%fp)
	move.w %a0,-50(%fp)
	cmp.l #191999,%d0
	jhi .L1036
	mvz.w #1500,%d2
	divu.l %d2,%d0
.L1025:
	move.b %d0,-47(%fp)
	lea (-46,%fp),%a0
	clr.l %d1
.L1026:
	moveq #28,%d3
	moveq #21,%d4
	move.l (%a1)+,%d0
	move.l %d0,%d2
	lsr.l %d3,%d2
	moveq #127,%d5
	moveq #14,%d3
	addq.l #1,%d1
	addq.l #5,%a0
	move.b %d2,-5(%a0)
	move.l %d0,%d2
	lsr.l %d4,%d2
	moveq #9,%d4
	and.l %d5,%d2
	move.b %d2,-4(%a0)
	move.l %d0,%d2
	lsr.l %d3,%d2
	and.l %d5,%d2
	move.b %d2,-3(%a0)
	move.l %d0,%d2
	lsr.l #7,%d2
	and.l %d5,%d0
	and.l %d5,%d2
	move.b %d0,-1(%a0)
	move.b %d2,-2(%a0)
	cmp.l %d1,%d4
	jne .L1026
	moveq #-9,%d5
	pea 54.w
	pea -54(%fp)
	move.b %d5,-1(%fp)
	jsr isr_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1020
	lea fp,%a0
	tst.l (%a0)
	jeq .L1037
	move.l (%a0),%d0
.L1028:
	move.l %d0,fp+12
	addq.l #1,fp+16
.L1020:
	move.l 1123623180,%d0
	move.l qp,%d4
	move.l qp+8,%d3
	tst.l qp+12
	jne .L1029
	tst.l %d0
	sne %d1
	mov3q.l #1,qp+12
	move.l #1123623184,%a1
	move.l %d0,qp+16
	move.l (%a1),qp+20
	mov3q.l #-1,qp+28
	mvs.b %d1,%d1
	neg.l %d1
	move.l %d1,qp+24
.L1029:
	tst.l qp+24
	jne .L1030
	cmp.l qp+16.l,%d0
	jne .L1031
	move.l qp+20,%a2
	cmp.l 1123623184.l,%a2
	jeq .L1030
.L1031:
	mov3q.l #1,qp+24
.L1030:
	tst.l qp+4
	jeq .L1018
	move.l %d0,%d1
	mov3q.l #1,%d5
	mvz.b %d1,%d1
	and.l #4095,%d4
	move.l %d1,%d2
	move.l %d1,%a0
	swap %d2
	clr.w %d2
	move.l %d4,%d1
	lsl.l #4,%d1
	or.l %d1,%d2
	tst.l qp+24
	sne %d1
	mvs.b %d1,%d1
	neg.l %d1
	add.l %d1,%d1
	or.l %d1,%d2
	mvz.b 1099764550,%d1
	lsr.l #5,%d1
	and.l %d5,%d1
	or.l %d1,%d2
	cmp.l qp+28.l,%d2
	jne .L1033
	cmp.l qp+36.l,%d3
	jeq .L1018
.L1033:
	move.l fp,%d1
	moveq #11,%d5
	sub.l qp+32,%d1
	cmp.l %d1,%d5
	jcc .L1018
	moveq #127,%d5
	and.l %d5,%d0
	moveq #14,%d1
	move.w #11521,%a2
	pea 13.w
	move.l #-260222380,%a1
	pea -54(%fp)
	move.l %a1,-54(%fp)
	move.b %d0,-46(%fp)
	moveq #127,%d0
	and.l %d4,%d0
	move.b %d1,-48(%fp)
	move.l %a0,%d1
	lsr.l #7,%d4
	lsr.l #7,%d1
	move.w %a2,-50(%fp)
	move.b %d4,-44(%fp)
	move.b %d1,-47(%fp)
	move.b %d0,-45(%fp)
	mov3q.l #3,%d0
	and.l %d2,%d0
	move.b %d0,-43(%fp)
	moveq #-9,%d0
	move.b %d0,-42(%fp)
	jsr isr_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1018
	move.l qp+40,%d0
	tst.l %d0
	jeq .L1034
	move.l qp+84,%a0
	move.l qp+32,%d1
	tst.l %a0
	jeq .L1035
	move.l fp,%a1
	sub.l %d1,%a1
	cmp.l %a0,%a1
	jcc .L1034
.L1035:
	move.l fp,%d4
	sub.l %d1,%d4
	move.l %d4,qp+84
.L1034:
	lea fp,%a1
	addq.l #1,%d0
	move.l %d2,qp+28
	move.l %d3,qp+36
	move.l %d0,qp+40
	move.l (%a1),qp+32
.L1018:
	movem.l -112(%fp),#1084
	unlk %fp
	rts
.L1036:
	moveq #127,%d0
	jra .L1025
.L1037:
	mov3q.l #1,%d0
	jra .L1028
	.size	rui_render_in, .-rui_render_in
	.align	2
	.globl	rui_uart
	.type	rui_uart, @function
rui_uart:
	lea (-40,%sp),%sp
	movem.l #19468,(%sp)
	clr.l %d2
	tst.b ov_on.l
	jne .L1077
	tst.b ovp_on.l
	jne .L1077
	tst.b ovt_on.l
	jeq .L1064
.L1077:
	move.l 44(%sp),%a0
	subq.l #1,%a0
	sub.l %a6,%a6
	lea rui_uart_raw,%a3
	move.l %a0,20(%sp)
	jra .L1069
.L1065:
	move.l 48(%sp),%a0
	mvz.b (%a0,%d2.l),%d0
	addq.l #1,%d2
	move.l %d0,-(%sp)
	jsr uart_byte
	addq.l #4,%sp
.L1064:
	cmp.l 44(%sp),%d2
	jlt .L1065
	clr.l %d0
.L1062:
	movem.l (%sp),#19468
	lea (40,%sp),%sp
	rts
.L1070:
	move.l 48(%sp),%a0
	move.l %d2,%d3
	addq.l #1,%d3
	mvz.b (%a0,%a6.l),%d0
	move.l %d0,-(%sp)
	jsr uart_byte
	move.b %d0,28(%sp,%d2.l)
	addq.l #4,%sp
	moveq #16,%d0
	cmp.l %d3,%d0
	jeq .L1067
	cmp.l 20(%sp),%a6
	jne .L1068
.L1067:
	pea 24(%sp)
	move.l %d3,-(%sp)
	jsr (%a3)
	addq.l #8,%sp
	clr.l %d3
.L1068:
	addq.l #1,%a6
	move.l %d3,%d2
.L1069:
	cmp.l 44(%sp),%a6
	jlt .L1070
	mov3q.l #1,%d0
	jra .L1062
	.size	rui_uart, .-rui_uart
	.align	2
	.globl	rui_rec_note
	.type	rui_rec_note, @function
rui_rec_note:
	move.w pc+80,%a0
	move.l %d2,-(%sp)
	moveq #11,%d2
	move.l 8(%sp),%d1
	move.l 16(%sp),%d0
	addq.l #1,%a0
	move.w %a0,pc+80
	cmp.l %d1,%d2
	jcc .L1079
.L1083:
	clr.l %d0
.L1078:
	move.l (%sp)+,%d2
	rts
.L1079:
	tst.l sq
	jeq .L1081
	move.l sq+4,%a0
	move.l %a0,%d2
	btst %d1,%d2
	jeq .L1081
	addq.l #1,sq+448
	mov3q.l #1,%d0
	jra .L1078
.L1081:
	tst.l %d0
	jlt .L1084
	moveq #63,%d2
	cmp.l %d0,%d2
	jlt .L1085
.L1082:
	lea pc,%a0
	move.b %d0,48(%a0,%d1.l)
	moveq #1,%d0
	lea st+8,%a1
	move.l (%a1),(%a0,%d1.l*4)
	move.b %d0,60(%a0,%d1.l)
	jra .L1083
.L1084:
	clr.b %d0
	jra .L1082
.L1085:
	moveq #63,%d0
	jra .L1082
	.size	rui_rec_note, .-rui_rec_note
	.align	2
	.globl	sq_fire
	.type	sq_fire, @function
sq_fire:
	lea (-24,%sp),%sp
	moveq #11,%d0
	movem.l #3132,(%sp)
	move.l 28(%sp),%d2
	addq.l #1,sq+364
	lea sq,%a2
	cmp.l %d2,%d0
	jcs .L1092
	mov3q.l #1,%d1
	cmp.l 1079807120.l,%d1
	jeq .L1094
	clr.l sq+540
	clr.l sq+544
.L1092:
	movem.l (%sp),#3132
	lea (24,%sp),%sp
	rts
.L1094:
	move.l %d2,%a0
	add.l #1079807210,%a0
	move.b (%a0),%d3
	move.l sq+540,%a1
	move.l %a1,%d1
	lsr.l %d2,%d1
	mov3q.l #1,%d0
	move.l %d2,%a0
	add.l #sq,%a0
	and.l %d1,%d0
	mvz.b %d3,%d4
	btst #0,%d1
	jeq .L1096
	mvz.b 516(%a0),%d1
	cmp.l %d4,%d1
	jeq .L1097
.L1098:
	clr.l %d0
.L1096:
	mov3q.l #1,%d1
	lsl.l %d2,%d1
	move.l %a1,%d5
	move.b %d3,516(%a0)
	move.b 35(%sp),528(%a0)
	or.l %d1,%d5
	move.l sq+360,%d1
	move.l %d5,sq+540
	btst #8,%d1
	jeq .L1100
	tst.l %d0
	jne .L1092
	tst.l %d4
	jeq .L1101
	tst.l sq+544
	jeq .L1102
.L1101:
	mvz.b sq+359,%d0
	move.l 1100784300,-(%sp)
	mov3q.l #2,-(%sp)
	move.l %d0,-(%sp)
	moveq #127,%d0
	and.l %d1,%d0
	move.l %d0,-(%sp)
	mov3q.l #3,-(%sp)
	jsr sq_event
	clr.l sq+360
	clr.l sq+544
	lea (20,%sp),%sp
.L1102:
	lsr.l #7,%d4
	jne .L1092
	tst.l (%a2)
	jeq .L1092
	move.l sq+8,%d0
	btst %d2,%d0
	jeq .L1092
	moveq #127,%d0
	and.l 32(%sp),%d0
	move.l #85760,%d1
	move.l %d2,%a0
	add.l #1079807269,%a0
	move.b (%a0),%d5
	muls.l %d1,%d0
	move.w %d5,%a1
	move.l %d0,%a0
	move.l #85689,%d0
	add.l #1081989347,%a0
	mvz.b (%a0,%d0.l),%d0
	subq.l #1,%d0
	tst.l %d0
	jne .L1103
	mvz.w #917,%d0
	muls.l %d2,%d0
	add.l #709,%d0
	move.b (%a0,%d0.l),%d0
	jpl .L1105
	moveq #127,%d0
.L1105:
#APP
| 1781 "rui.c" 1
	move.w %sr,%d1
| 0 "" 2
#NO_APP
	move.l %d1,%d5
	move.l %d1,%d4
	and.l #1792,%d5
	mvz.w %d4,%d4
	cmp.l #1792,%d5
	jeq .L1107
	and.l #63743,%d1
	or.l #1792,%d1
#APP
| 1785 "rui.c" 1
	move.w %d1,%sr
| 0 "" 2
#NO_APP
.L1107:
	move.l sq+268,%d1
	sub.l sq+272,%d1
	lsr.l #5,%d1
	jeq .L1108
	addq.l #1,sq+380
.L1109:
#APP
| 1790 "rui.c" 1
	move.w %d4,%sr
| 0 "" 2
#NO_APP
	jra .L1092
.L1097:
	mvz.b 528(%a0),%d1
	cmp.l 32(%sp),%d1
	jeq .L1098
	addq.l #1,sq+548
	mov3q.l #1,sq+544
	jra .L1096
.L1100:
	tst.l %d0
	jne .L1092
	jra .L1102
.L1103:
	move.l #85683,%d0
	move.b (%a0,%d0.l),%d0
	move.l #85684,%d1
	mvz.b (%a0,%d1.l),%d1
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d1,%d0
	moveq #127,%d1
	cmp.l %d0,%d1
	jcc .L1105
	moveq #127,%d0
	jra .L1105
.L1108:
	moveq #31,%d1
	and.l sq+268,%d1
	move.l #1100784300,%a3
	move.l %d1,%d5
	addq.l #2,%d1
	lsl.l #3,%d5
	lsl.l #3,%d1
	move.l (%a3),12(%a2,%d5.l)
	move.b %d0,18(%a2,%d5.l)
	move.w %a1,%d0
	move.b %d2,(%a2,%d1.l)
	move.b %d3,1(%a2,%d1.l)
	addq.l #1,sq+268
	addq.l #1,sq+368
	move.b %d0,19(%a2,%d5.l)
	jra .L1109
	.size	sq_fire, .-sq_fire
	.align	2
	.globl	sq_end
	.type	sq_end, @function
sq_end:
	lea (-104,%sp),%sp
	mov3q.l #2,%d0
	movem.l #23612,(%sp)
	move.l 1079807120,%d2
	moveq #127,%d5
	addq.l #1,sq+392
	move.b 1079807236,%d3
	move.l 1100784300,%d4
	move.l -66650100,%d1
	move.l %d1,32(%sp)
	and.l %d3,%d5
	move.l %d5,%d3
	cmp.l %d2,%d0
	jcc .L1123
	clr.l %d2
.L1123:
	tst.l sq+348
	jne .L1124
	move.l %d2,sq+352
	move.l %d3,sq+356
	mov3q.l #1,sq+348
.L1124:
	lea sq,%a6
	tst.l (%a6)
	jeq .L1125
	cmp.l sq+352.l,%d2
	jeq .L1126
	move.l %d2,%d1
	mvz.b %d1,%d1
	move.l %d4,-(%sp)
	mov3q.l #1,-(%sp)
	clr.l -(%sp)
	move.l %d1,-(%sp)
	mov3q.l #1,-(%sp)
	jsr sq_event
	lea (20,%sp),%sp
.L1126:
	move.l sq+356,%d0
	cmp.l %d0,%d3
	jeq .L1127
	mov3q.l #1,%d1
	cmp.l %d2,%d1
	jne .L1128
	bset #8,%d0
	move.l %d0,sq+360
.L1125:
	move.l %d2,sq+352
	move.l %d3,sq+356
.L1130:
	tst.l sq+344
	jne .L1135
	move.l %sp,%d3
	move.l %sp,%d2
	add.l #42,%d3
	add.l #36,%d2
.L1136:
	move.l sq+272,%d4
	cmp.l sq+268.l,%d4
	jne .L1142
.L1141:
	move.l -66650100,%d0
	sub.l 32(%sp),%d0
	cmp.l sq+396.l,%d0
	jls .L1122
	move.l %d0,sq+396
.L1122:
	movem.l (%sp),#23612
	lea (104,%sp),%sp
	rts
.L1128:
	mvz.b %d0,%d0
	move.l %d4,-(%sp)
	mov3q.l #2,-(%sp)
	move.l %d5,-(%sp)
	move.l %d0,-(%sp)
	mov3q.l #3,-(%sp)
	jsr sq_event
	lea (20,%sp),%sp
.L1129:
	move.l sq+360,%d0
	btst #8,%d0
	jeq .L1125
	moveq #127,%d1
	and.l %d0,%d1
	move.l %d4,-(%sp)
	mov3q.l #2,-(%sp)
	move.l %d5,-(%sp)
	move.l %d1,-(%sp)
	mov3q.l #3,-(%sp)
	jsr sq_event
	clr.l sq+360
	lea (20,%sp),%sp
	jra .L1125
.L1127:
	mov3q.l #1,%d0
	cmp.l %d2,%d0
	jne .L1129
	jra .L1125
.L1135:
	mvz.b sq+340,%d0
	move.l %d0,-(%sp)
	pea sq+276
	jsr isr_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1122
	move.l sq+344,%d3
	clr.l %d1
	addq.l #1,sq+376
	lea sq+340,%a0
.L1132:
	cmp.l %d3,%d0
	jlt .L1134
	subq.l #1,%d3
	move.l %d3,sq+344
	jra .L1130
.L1134:
	mvz.w %d0,%d2
	lea sq+276,%a2
	sub.l %a1,%a1
	sub.l %d1,%a2
	lsl.l #4,%d2
.L1133:
	move.l %a2,%d4
	add.l %d1,%d4
	move.l %d4,%a4
	addq.l #1,%a1
	move.b (%a4,%d2.l),(%a2)+
	moveq #16,%d4
	cmp.l %a1,%d4
	jne .L1133
	move.b 1(%a0),(%a0)
	addq.l #1,%a0
	addq.l #1,%d0
	add.l #-16,%d1
	jra .L1132
.L1142:
	moveq #31,%d0
	clr.l %d4
	and.l sq+272,%d0
	move.w #11265,%a4
	move.l #-260222380,%a1
	move.l %a1,36(%sp)
	lsl.l #3,%d0
	move.w %a4,40(%sp)
	move.l 12(%a6,%d0.l),%d5
	move.l %d5,-(%sp)
	move.l %d3,-(%sp)
	jsr blk4
	addq.l #8,%sp
	move.l %d0,%a0
	addq.l #1,%a0
.L1137:
	move.l sq+272,%d0
	add.l %d4,%d0
	cmp.l sq+268.l,%d0
	jeq .L1138
	moveq #14,%d0
	cmp.l %d4,%d0
	jeq .L1138
	move.l sq+272,%d0
	moveq #31,%d1
	add.l %d4,%d0
	and.l %d1,%d0
	lsl.l #3,%d0
	cmp.l 12(%a6,%d0.l),%d5
	jeq .L1139
.L1138:
	move.b %d4,46(%sp)
	move.b #-9,(%a0)+
	sub.l %d2,%a0
	move.l %a0,-(%sp)
	move.l %d2,-(%sp)
	jsr isr_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1141
	add.l %d4,sq+272
	addq.l #1,sq+372
	jra .L1136
.L1139:
	move.l sq+272,%d0
	moveq #31,%d1
	add.l %d4,%d0
	and.l %d1,%d0
	addq.l #1,%d4
	move.l %d0,%d1
	addq.l #2,%d1
	lsl.l #3,%d1
	lsl.l #3,%d0
	move.b (%a6,%d1.l),(%a0)
	lea 1(%a6,%d1.l),%a1
	addq.l #4,%a0
	move.b (%a1),-3(%a0)
	lea (%a6,%d0.l),%a1
	move.b 18(%a1),-2(%a0)
	move.b 19(%a1),-1(%a0)
	jra .L1137
	.size	sq_end, .-sq_end
	.align	2
	.globl	pin_frame
	.type	pin_frame, @function
pin_frame:
	lea (-72,%sp),%sp
	movem.l #31996,(%sp)
	move.l pin,%d0
	move.l #-2147458112,%d7
	move.l pin+4,%d4
	move.l -66650100,%d5
	move.l %d0,58(%sp)
	move.l %d4,64(%sp)
	move.l %d5,68(%sp)
	cmp.l 76(%sp),%d7
	jne .L1163
	move.l pin+16,%d0
	move.l pin+12,%d1
	addq.l #1,pin+32
	move.l %d0,50(%sp)
	or.l 58(%sp),%d0
	or.l %d1,%d0
	jeq .L1163
	move.l pin+20,%a1
	tst.l %a1
	jne .L1165
	move.l 1075766284,%d0
	and.l #1048575,%d0
	or.l #-1341128704,%d0
	move.l %d0,%a1
	move.l %d0,pin+20
	move.l 1075767148,%d0
	and.l #1048575,%d0
	or.l #-1342177280,%d0
	move.l %d0,pin+24
	move.l 1075767148,%d0
	and.l #1048575,%d0
	or.l #805306368,%d0
	move.l %d0,pin+28
.L1165:
	clr.b %d4
	clr.b %d5
	sub.l %a0,%a0
	clr.l %d3
	move.l pin+8,%d2
	clr.l %d6
	move.l pin+48,%a6
	move.b %d4,63(%sp)
	move.b %d5,62(%sp)
.L1179:
	move.l %d3,%a2
	add.l #1076432344,%a2
	move.b (%a2),%d7
	mvz.w %d3,%d4
	lsl.l #3,%d4
	mvz.b %d7,%d0
	move.w %d7,%a5
	move.l %d0,%a4
	mov3q.l #1,%d0
	move.l %d4,%a2
	move.l %d4,%a3
	move.l %d4,46(%sp)
	moveq #11,%d4
	lsl.l %d3,%d0
	add.l #-2147457944,%a2
	add.l #-2147457880,%a3
	cmp.l %a4,%d4
	jcs .L1166
	move.l 58(%sp),%d5
	move.l %a4,%d7
	btst %d7,%d5
	jeq .L1166
	move.w %a5,%d5
	move.l %d0,%d7
	move.l %d0,%d4
	and.l %d2,%d7
	not.l %d4
	and.l %d4,%d1
	move.l %d4,54(%sp)
	move.l 64(%sp),%d4
	or.l %d0,%d6
	ext.w %d5
	move.l %d7,%a5
	move.l %a4,%d7
	mvz.w %d5,%d5
	add.l %d5,%d5
	move.l %d5,%a0
	add.l #-2147457084,%a0
	mvz.w (%a0),%d5
	btst %d7,%d4
	jeq .L1167
	move.l #128,(%a3)
	move.l #128,(%a2)
	move.l %a1,4(%a3)
	move.l %a1,4(%a2)
	tst.l %a5
	jeq .L1168
	addq.l #1,pin+44
.L1168:
	moveq #1,%d0
	and.l 54(%sp),%d2
	move.b %d0,62(%sp)
.L1169:
	move.l 46(%sp),%a2
	add.l #-2147457816,%a2
	clr.l (%a2)
	cmp.l #32512,%d5
	jeq .L1184
	cmp.l #255,%d5
	jls .L1172
	mvz.w %d3,%d0
	add.l %d0,%d0
	move.l %d0,%a3
	add.l #-2147458102,%a3
	move.w (%a3),%d4
	move.l %d0,%a2
	add.l #-2147458086,%a2
	move.w (%a2),%d0
	mulu.w #32512,%d4
	divu.l %d5,%d4
	cmp.l #65535,%d4
	jls .L1173
	mvz.w #65535,%d4
.L1173:
	mulu.w #32512,%d0
	move.w %d4,(%a3)
	divu.l %d5,%d0
	cmp.l #65535,%d0
	jls .L1174
	mvz.w #65535,%d0
.L1174:
	move.w %d0,(%a2)
.L1172:
	moveq #1,%d0
	move.w #32512,(%a0)
	addq.l #1,%a6
	move.b %d0,63(%sp)
.L1184:
	move.w #1,%a0
	jra .L1171
.L1167:
	tst.l %a5
	jeq .L1170
	moveq #127,%d0
	moveq #127,%d4
	move.l %d0,(%a3)
	move.l pin+28,%d0
	move.l %d4,(%a2)
	move.l %d0,4(%a3)
	move.l %d0,4(%a2)
	jra .L1169
.L1170:
	moveq #1,%d4
	move.l pin+24,%d7
	move.l #1073741951,(%a3)
	move.l #1073741951,(%a2)
	move.l %d7,4(%a3)
	or.l %d0,%d2
	move.l %d7,4(%a2)
	addq.l #1,pin+40
	move.b %d4,62(%sp)
	jra .L1169
.L1166:
	move.l 50(%sp),%d4
	and.l %d0,%d4
	tst.l %d4
	jeq .L1175
	move.l %d0,%d4
	not.l %d4
	and.l %d4,%d2
	moveq #1,%d4
	or.l %d0,%d1
	move.w #1,%a0
	move.b %d4,62(%sp)
.L1175:
	move.l %d1,%d4
	and.l %d0,%d4
	tst.l %d4
	jeq .L1171
	btst #6,(%a2)
	jeq .L1177
	not.l %d0
	and.l %d0,%d1
	jra .L1184
.L1177:
	move.l #128,(%a3)
	move.l #128,(%a2)
	move.l %a1,4(%a3)
	move.l %a1,4(%a2)
.L1171:
	addq.l #1,%d3
	moveq #8,%d5
	cmp.l %d3,%d5
	jne .L1179
	tst.b 63(%sp)
	jeq .L1180
	move.l %a6,pin+48
.L1180:
	tst.b 62(%sp)
	jeq .L1181
	move.l %d2,pin+8
.L1181:
	move.w %a0,%d7
	tst.b %d7
	jeq .L1182
	move.l %d1,pin+12
.L1182:
	tst.l %d6
	jeq .L1183
	addq.l #1,pin+36
.L1183:
	move.l -66650100,%d0
	move.l %d6,pin+16
	sub.l 68(%sp),%d0
	cmp.l pin+52.l,%d0
	jls .L1163
	move.l %d0,pin+52
.L1163:
	movem.l (%sp),#31996
	lea (72,%sp),%sp
	rts
	.size	pin_frame, .-pin_frame
	.align	2
	.globl	ed_report
	.type	ed_report, @function
ed_report:
	move.l 4(%sp),%d0
	moveq #12,%d1
	move.l 16(%sp),%a0
	cmp.l %d0,%d1
	jcc .L1211
.L1213:
	clr.l %d1
.L1212:
	move.l %d1,16(%sp)
	move.l %a0,%d1
	mvz.b %d1,%d1
	clr.l 12(%sp)
	move.l %d0,4(%sp)
	move.l %d1,8(%sp)
	jra ed_queue
.L1211:
	mvz.w #4368,%d1
	btst %d0,%d1
	jeq .L1213
	mov3q.l #3,%d1
	and.l 12(%sp),%d1
	jra .L1212
	.size	ed_report, .-ed_report
	.align	2
	.globl	pm_menu_add
	.type	pm_menu_add, @function
pm_menu_add:
	link.w %fp,#-68
	move.l %a3,-(%sp)
	move.l %a2,-(%sp)
	tst.l 8(%fp)
	jeq .L1217
	lea (-64,%fp),%a2
	clr.l %d0
	move.l %a2,%a0
.L1219:
	clr.l 12(%a0)
	clr.l 8(%a0)
	clr.l (%a0)
	clr.l 4(%a0)
	addq.l #1,%d0
	lea (16,%a0),%a0
	mov3q.l #4,%d1
	cmp.l %d0,%d1
	jne .L1219
	mov3q.l #1,-(%sp)
	jsr 1074276820
	mov3q.l #4,-(%sp)
	move.l #pm_label,%d1
	move.l %d0,-64(%fp)
	move.l #1074764344,%d0
	move.l %d1,-52(%fp)
	move.l %d0,-56(%fp)
	jsr 1074276820
	mov3q.l #1,-(%sp)
	move.l %d0,%a3
	jsr 1074276820
	pea 84.w
	move.l #pm_icon,%d1
	move.l %d0,-32(%fp)
	move.l #1074764518,%d0
	move.l %d0,-24(%fp)
	move.l %d1,-20(%fp)
	jsr 1074276820
	lea (16,%sp),%sp
	move.l %d0,-68(%fp)
	tst.l -64(%fp)
	jeq .L1217
	tst.l %a3
	jeq .L1217
	tst.l -32(%fp)
	jeq .L1217
	tst.l %d0
	jeq .L1217
	move.l 8(%fp),(%a3)
	pea 8.w
	move.l #1074764426,%d0
	mov3q.l #-1,-(%sp)
	move.l #pm_action,%d1
	pea -16(%fp)
	pea -32(%fp)
	pea -48(%fp)
	move.l %a2,-(%sp)
	move.l %d0,-40(%fp)
	move.l %d1,-36(%fp)
	move.l %a3,-48(%fp)
	move.l -68(%fp),-(%sp)
	jsr 1074212688
	move.l -68(%fp),-(%sp)
	move.l 8(%fp),-(%sp)
	jsr 1074210694
	lea (36,%sp),%sp
	mov3q.l #3,-68(%fp)
.L1220:
	mvz.w -66(%fp),%d0
	lsl.l #4,%d0
	pea (%a2,%d0.l)
	jsr 1075251654
	subq.l #1,-68(%fp)
	addq.l #4,%sp
	mov3q.l #-1,%d0
	cmp.l -68(%fp),%d0
	jne .L1220
	addq.l #1,pm+4
.L1217:
	move.l -76(%fp),%a2
	move.l -72(%fp),%a3
	unlk %fp
	rts
	.size	pm_menu_add, .-pm_menu_add
	.align	2
	.globl	pm_pick
	.type	pm_pick, @function
pm_pick:
	mvz.b 1093765506,%d0
	move.l 4(%sp),%a0
	moveq #11,%d1
	addq.l #1,pm+8
	cmp.l %d0,%d1
	jcc .L1233
	addq.l #1,pm+24
	pea pm_t_track
.L1237:
	move.l %a0,-(%sp)
	jsr pm_popup
	addq.l #8,%sp
	rts
.L1233:
	mov3q.l #1,%d1
	cmp.l 1094562388.l,%d1
	jne .L1235
	move.l commits,%d1
	cmp.l pm+28.l,%d1
	jne .L1236
.L1235:
	addq.l #1,pm+20
	pea pm_t_none
	jra .L1237
.L1236:
	move.l (%a0),%a1
	addq.l #1,%d0
	move.l %a0,4(%sp)
	move.l %d0,pm
	move.l 128(%a1),%a1
	jmp (%a1)
	.size	pm_pick, .-pm_pick
	.align	2
	.globl	cu_prep
	.type	cu_prep, @function
cu_prep:
	move.l %d2,-(%sp)
	move.l 8(%sp),%d2
	tst.b cu.l
	jeq .L1238
	move.l %d2,-(%sp)
	addq.l #1,cu+12
	jsr cu_src_setup
	addq.l #4,%sp
	move.l %d2,%d0
	mov3q.l #2,%d1
	add.l #-48,%d0
	cmp.l %d0,%d1
	jcc .L1240
	moveq #43,%d0
	cmp.l %d2,%d0
	jne .L1238
.L1240:
	moveq #11,%d1
	cmp.l 12(%sp),%d1
	jcs .L1238
	move.l #1075731444,%a0
	cmp.l sv+88.l,%a0
	jne .L1238
	lea (15,%sp),%a0
	mvz.b cu+30,%d0
	move.b (%a0),cu+10
	lea st+8,%a0
	move.b %d2,cu+9
	move.l (%a0),cu+16
	cmp.l 12(%sp),%d0
	jne .L1242
	move.b cu+28,%d0
.L1241:
	move.b %d0,cu+29
.L1238:
	move.l (%sp)+,%d2
	rts
.L1242:
	clr.b %d0
	jra .L1241
	.size	cu_prep, .-cu_prep
	.align	2
	.globl	cu_mi_settling
	.type	cu_mi_settling, @function
cu_mi_settling:
	mvz.b cu+11,%d1
	move.l 4(%sp),%d0
	addq.l #1,%d0
	cmp.l %d1,%d0
	jne .L1245
	move.l st+8,%d0
	moveq #15,%d1
	sub.l cu+24,%d0
	cmp.l %d0,%d1
	scc %d0
	mvs.b %d0,%d0
	neg.l %d0
.L1243:
	rts
.L1245:
	clr.l %d0
	jra .L1243
	.size	cu_mi_settling, .-cu_mi_settling
	.align	2
	.type	sv_flush, @function
sv_flush:
	link.w %fp,#-112
	movem.l #15420,(%sp)
	move.w #10497,%d4
	move.l #-260222380,%d3
	lea (-42,%fp),%a2
.L1247:
	move.b sv+4,%d0
	jne .L1252
	tst.b sv+102.l
	jeq .L1253
	moveq #127,%d0
	moveq #127,%d4
	and.l sv+92,%d0
	move.w #11009,%d3
	move.l #-260222380,%d1
	moveq #14,%d5
	move.l %d1,-74(%fp)
	moveq #28,%d1
	move.l sv+88,%d2
	lea sv+100,%a0
	move.b (%a0),-68(%fp)
	move.b %d0,-67(%fp)
	move.l %d2,%d0
	lsr.l %d1,%d0
	move.w %d3,-70(%fp)
	moveq #21,%d3
	moveq #127,%d1
	move.b %d0,-66(%fp)
	move.l %d2,%d0
	lsr.l %d3,%d0
	and.l %d4,%d0
	move.b %d0,-65(%fp)
	move.l %d2,%d0
	lsr.l %d5,%d0
	and.l %d4,%d0
	move.b %d0,-64(%fp)
	move.l %d2,%d0
	lsr.l #7,%d0
	and.l %d4,%d0
	move.b %d0,-63(%fp)
	moveq #127,%d0
	and.l %d2,%d0
	move.b %d0,-62(%fp)
	move.l sv+96,%d0
	cmp.l %d0,%d1
	jcc .L1254
	moveq #127,%d0
.L1254:
	move.b %d0,-61(%fp)
	clr.l %d0
	lea (-42,%fp),%a0
.L1255:
	lea -74(%fp,%d0.l),%a1
	addq.l #1,%d0
	moveq #14,%d1
	move.b (%a1),-1(%a0,%d0.l)
	cmp.l %d0,%d1
	jne .L1255
	moveq #-9,%d3
	pea 15.w
	move.l %a0,-(%sp)
	move.b %d3,-28(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1246
	clr.b %d4
	lea sv+100,%a0
	move.b (%a0),sv+101
	lea st+8,%a1
	move.l %d2,sv+104
	move.l (%a1),sv+108
	addq.l #1,sv+112
	move.b %d4,sv+102
.L1253:
	tst.b sv.l
	jeq .L1246
	mvz.b sv+1,%d0
	moveq #11,%d1
	cmp.l %d0,%d1
	jcs .L1246
	not.l %d0
	move.l %d0,-(%sp)
	jsr cu_steps
	addq.l #4,%sp
	tst.l %d0
	jne .L1246
	move.l sv+120,%d3
	cmp.l sv+116.l,%d3
	jeq .L1257
	moveq #1,%d4
	move.b %d4,sv+7
.L1257:
	lea (-74,%fp),%a3
	moveq #16,%d5
	lea sv,%a4
	clr.l %d3
	mov3q.l #-1,%d2
	move.l %d5,-80(%fp)
	move.l %a3,%a2
.L1262:
	mvz.b sv+1,%d0
	move.l sv+116,-(%sp)
	move.l %d3,-(%sp)
	move.l %d0,-(%sp)
	jsr sv_word
	lea (12,%sp),%sp
	move.b sv+7,%d4
	move.w %d0,(%a3)
	tst.b %d4
	jne .L1258
	mvz.w %d0,%d1
	mvz.w 24(%a4),%d5
	cmp.l %d1,%d5
	jeq .L1259
.L1258:
	cmp.l -80(%fp),%d3
	jge .L1260
	move.l %d3,-80(%fp)
.L1260:
	move.l %d3,%d2
.L1259:
	mov3q.l #7,%d1
	cmp.l %d3,%d1
	jge .L1261
	tst.w %d0
	jeq .L1261
	mvz.b sv+1,%d0
	move.l %d0,-(%sp)
	jsr cu_mi_settling
	addq.l #4,%sp
	tst.l %d0
	jne .L1246
.L1261:
	addq.l #2,%a3
	addq.l #1,%d3
	addq.l #2,%a4
	moveq #16,%d5
	cmp.l %d3,%d5
	jne .L1262
	tst.b %d4
	jne .L1273
	mov3q.l #-1,%d0
	cmp.l %d2,%d0
	jne .L1263
.L1246:
	movem.l -112(%fp),#15420
	unlk %fp
	rts
.L1252:
	clr.b %d1
	mov3q.l #2,%d2
	and.l %d0,%d2
	move.w %d4,-38(%fp)
	move.l %d3,-42(%fp)
	move.b %d1,-33(%fp)
	btst #1,%d0
	jeq .L1248
	lea sv+11,%a0
	move.b (%a0),-36(%fp)
	clr.b %d0
.L1249:
	move.b %d0,-35(%fp)
	moveq #-9,%d0
	pea 9.w
	move.l %a2,-(%sp)
	move.b %d0,-34(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1246
	move.b sv+4,%d0
	lsr.l #1,%d2
	addq.l #1,sv+64
	and.l %d0,%d2
	move.b %d2,sv+4
	jra .L1247
.L1248:
	lea sv+5,%a1
	move.b (%a1),-36(%fp)
	move.b sv+6,%d0
	jra .L1249
.L1273:
	clr.l -80(%fp)
	moveq #15,%d2
.L1263:
	move.l sv+116,%d0
	not.l %d0
	add.l %d0,%d0
	subx.l %d0,%d0
	neg.l %d0
	move.l #-260222380,%d1
	move.l %d1,-42(%fp)
	move.b sv+1,%d1
	move.w #10753,%d3
	move.b -77(%fp),-35(%fp)
	lea (-33,%fp),%a0
	lsl.l #6,%d0
	move.w %d3,-38(%fp)
	or.l %d1,%d0
	move.b %d0,-36(%fp)
	move.l %d2,%d0
	addq.l #1,%d0
	move.l %d0,%d1
	sub.l -80(%fp),%d1
	move.b %d1,-34(%fp)
	move.l -80(%fp),%d1
.L1264:
	cmp.l %d2,%d1
	jle .L1265
	cmp.l -80(%fp),%d0
	sge %d0
	move.l %d0,%d1
	neg.l %d1
	tst.b %d1
	jeq .L1266
	move.l %d2,%d1
	sub.l -80(%fp),%d1
	add.l %d1,%d1
	add.l #11,%d1
.L1267:
	moveq #-9,%d5
	neg.l %d0
	move.b %d5,-42(%fp,%d1.l)
	tst.b %d0
	jeq .L1268
	move.l %d2,%d0
	addq.l #6,%d0
	sub.l -80(%fp),%d0
	add.l %d0,%d0
.L1269:
	move.l %d0,-(%sp)
	pea -42(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1246
	lea sv+24,%a0
.L1270:
	cmp.l -80(%fp),%d2
	jge .L1271
	clr.b %d3
	move.l sv+116,%d0
	addq.l #1,sv+68
	move.b %d3,sv+7
	tst.l %d0
	jlt .L1272
	addq.l #1,sv+124
.L1272:
	move.l %d0,sv+120
	jra .L1246
.L1265:
	move.w (%a2,%d1.l*2),%d3
	addq.l #1,%d1
	addq.l #2,%a0
	move.l %d3,%d4
	lsr.l #7,%d4
	move.b %d4,-2(%a0)
	moveq #127,%d4
	and.l %d4,%d3
	move.b %d3,-1(%a0)
	jra .L1264
.L1266:
	moveq #9,%d1
	jra .L1267
.L1268:
	moveq #10,%d0
	jra .L1269
.L1271:
	move.l -80(%fp),%d1
	lea (%a2,%d1.l*2),%a1
	move.w (%a1),(%a0,%d1.l*2)
	addq.l #1,%d1
	move.l %d1,-80(%fp)
	jra .L1270
	.size	sv_flush, .-sv_flush
	.align	2
	.globl	pmo_pre
	.type	pmo_pre, @function
pmo_pre:
	move.l -66650100,%d1
	moveq #127,%d0
	and.l -2147457096,%d0
	lea (-80,%sp),%sp
	movem.l #31996,(%sp)
	lea fp,%a3
	move.l %d1,56(%sp)
	clr.l pmo+116
	addq.l #1,pmo+24
	move.l (%a3),pmo+112
	lea pmo,%a2
	cmp.l pmo+100.l,%d0
	jne .L1286
	move.l pmo+96,%d2
	cmp.l pmo+76.l,%d2
	jeq .L1287
.L1286:
	lea pmo+76,%a0
	move.l %d0,pmo+100
	move.l (%a0),pmo+96
	tst.l pmo
	jeq .L1287
	lea pmo+584,%a0
	clr.l %d0
.L1288:
	clr.l (%a0)+
	addq.l #1,%d0
	cmp.l #208,%d0
	jne .L1288
	lea pmo+3464,%a0
	clr.l %d0
.L1289:
	clr.b (%a0)
	addq.l #1,%d0
	lea (44,%a0),%a0
	cmp.l #128,%d0
	jne .L1289
	clr.l %d0
.L1290:
	move.l %d0,%d1
	add.l #36,%d1
	clr.l (%a2,%d1.l*4)
	moveq #13,%d1
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L1290
	clr.l pmo
	clr.l pmo+104
	clr.l pmo+9096
	clr.l pmo+300
	addq.l #1,pmo+32
.L1287:
	move.l pmo+56,%d7
	move.l pmo+88,%d2
	cmp.l pmo+68.l,%d2
	jne .L1291
	move.l pmo+92,%d3
	cmp.l pmo+72.l,%d3
	jeq .L1353
.L1291:
	move.l %d7,%d0
	mov3q.l #1,%d5
	add.l pmo+9228,%d0
	lea pmo+68,%a0
	move.l (%a0),pmo+88
	lea pmo+72,%a5
	sub.l pmo+80,%d0
	move.l (%a5),pmo+92
	pea 32.w
	pea 8191.w
	move.l %d0,pmo+9228
	move.l %d7,pmo+80
	jsr pmo_fade
	addq.l #8,%sp
.L1292:
	moveq #65,%d6
	sub.l %a4,%a4
	clr.l %d4
	lea pmo_get,%a5
.L1293:
	move.l pmo+80,%d2
	cmp.l %d2,%d7
	jeq .L1309
	subq.l #1,%d6
	tst.l %d6
	jne .L1310
.L1309:
	tst.l %d4
	jeq .L1311
.L1297:
	move.l %a4,-(%sp)
	move.l %d4,-(%sp)
	jsr pmo_fade
	addq.l #8,%sp
	mov3q.l #1,%d5
.L1311:
	tst.l pmo
	jne .L1312
.L1343:
	move.l 56(%sp),-(%sp)
	jsr pmo_time
	addq.l #4,%sp
	movem.l (%sp),#31996
	lea (80,%sp),%sp
	rts
.L1353:
	clr.l %d5
	jra .L1292
.L1310:
	mvz.b %d2,%d2
	move.l %d2,%d3
	lsl.l #3,%d3
	lea (%a2,%d3.l),%a0
	mvz.b 1423(%a0),%d0
	cmp.l pmo+100.l,%d0
	jeq .L1294
	addq.l #1,pmo+8
.L1295:
	addq.l #1,pmo+80
	jra .L1293
.L1294:
	mvz.b 1418(%a0),%d0
	mov3q.l #6,%d1
	move.l %d0,%a1
	cmp.l %d0,%d1
	jne .L1296
	mvz.w 1420(%a0),%d0
	mvz.b 1419(%a0),%d2
	addq.l #1,pmo+28
	or.l %d0,%d4
	move.l %d2,%a4
	jra .L1295
.L1296:
	tst.l %d4
	jne .L1297
	add.l #177,%d2
	move.l %d2,%d0
	lsl.l #3,%d0
	move.l %d2,60(%sp)
	addq.l #1,pmo+28
	move.b 1(%a2,%d0.l),%d2
	mvz.b (%a2,%d0.l),%d1
	moveq #63,%d0
	and.l %d2,%d0
	mov3q.l #4,%d2
	move.l %d0,52(%sp)
	cmp.l %a1,%d2
	jne .L1298
	mvz.w 1420(%a0),%d2
	moveq #18,%d0
	lsl.l %d0,%d2
	move.l %d2,%a0
	asr.l %d0,%d2
	tst.l %a0
	jne .L1299
	move.l %d1,%d0
	lsl.l #6,%d0
	lea (%a2,%d0.l),%a0
	add.l 52(%sp),%a0
	tst.b 584(%a0)
	jeq .L1295
.L1299:
	move.l 52(%sp),-(%sp)
	move.l %d1,-(%sp)
	jsr (%a5)
	addq.l #8,%sp
	move.l %d0,%a0
	tst.l %d0
	jne .L1301
	addq.l #1,pmo+16
	mov3q.l #4,pmo+120
	jra .L1295
.L1301:
	moveq #10,%d1
	lsl.l %d1,%d2
	move.l %d3,%a1
	add.l #pmo+1419,%a1
	move.b (%a1),%d0
	move.l %d2,12(%a0)
	tst.b %d0
	jne .L1302
	move.l %d2,4(%a0)
.L1303:
	move.b %d0,2(%a0)
	jra .L1295
.L1302:
	moveq #127,%d1
	moveq #9,%d3
	and.l %d0,%d1
	sub.l 4(%a0),%d2
	lea pmo_rcp,%a1
	asr.l %d3,%d2
	mvz.w (%a1,%d1.l*2),%d1
	muls.l %d1,%d2
	asr.l #6,%d2
	move.l %d2,8(%a0)
	jra .L1303
.L1298:
	move.b 1422(%a0),%d0
	mvz.b %d0,%d2
	move.w %d0,%a1
	moveq #126,%d0
	move.l %d2,%a6
	cmp.l %d2,%d0
	jcs .L1354
	move.w %a1,%d2
	tst.b %d2
	jeq .L1305
	move.l %a6,%d0
	move.l #66052,%d2
	muls.l %d2,%d0
	move.l %d0,%a6
.L1304:
	move.l 52(%sp),-(%sp)
	move.l %d1,-(%sp)
	jsr (%a5)
	addq.l #8,%sp
	move.l %d0,%a0
	tst.l %d0
	jne .L1306
	addq.l #1,pmo+16
	mov3q.l #5,pmo+120
	jra .L1295
.L1305:
	move.l %d1,%d0
	lsl.l #6,%d0
	lea (%a2,%d0.l),%a0
	add.l 52(%sp),%a0
	tst.b 584(%a0)
	jeq .L1295
	sub.l %a6,%a6
	jra .L1304
.L1354:
	move.l #8388608,%a6
	jra .L1304
.L1306:
	move.l %d3,%a1
	add.l #pmo+1420,%a1
	mvz.w (%a1),%d1
	moveq #9,%d2
	lsl.l %d2,%d1
	move.l %d1,24(%a0)
	tst.l 28(%a0)
	jne .L1307
	tst.b 3(%a0)
	jne .L1307
	move.l %d1,16(%a0)
.L1307:
	move.l 60(%sp),%d2
	lsl.l #3,%d2
	move.b 1(%a2,%d2.l),%d1
	btst #6,%d1
	jne .L1355
	move.l %d3,%a1
	add.l #pmo+1419,%a1
	mvz.b (%a1),%d1
.L1308:
	move.l %d1,-(%sp)
	move.l %a6,-(%sp)
	move.l %a0,-(%sp)
	jsr pmo_mix
	lea (12,%sp),%sp
	jra .L1295
.L1355:
	clr.l %d1
	jra .L1308
.L1312:
	tst.l %d5
	jne .L1314
	move.l pmo+84,%d3
	cmp.l pmo+60.l,%d3
	jeq .L1314
	move.l (%a3),%d0
	sub.l pmo+60,%d0
	cmp.l #375,%d0
	jls .L1314
	lea pmo+60,%a0
	move.l (%a0),pmo+84
	pea 32.w
	pea 8191.w
	addq.l #1,pmo+12
	jsr pmo_fade
	addq.l #8,%sp
.L1314:
	tst.l -2147418904
	jeq .L1315
	lea pmo+512,%a0
	clr.l %d0
.L1316:
	clr.l (%a0)+
	moveq #18,%d1
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L1316
	move.l #-2147423060,%a0
.L1318:
	move.w (%a0),%d1
	mvz.w %d1,%d0
	cmp.l #571,%d0
	jhi .L1317
	moveq #31,%d3
	lsr.l #5,%d0
	and.l %d3,%d1
	mov3q.l #1,%d3
	add.l #128,%d0
	lsl.l %d1,%d3
	or.l %d3,(%a2,%d0.l*4)
.L1317:
	addq.l #2,%a0
	cmp.l #-2147422964,%a0
	jne .L1318
.L1315:
	move.l pmo+104,%a1
	clr.l %d2
	clr.l pmo+300
	lea pmo,%a4
	lea pmo+3464,%a0
.L1319:
	cmp.l %a1,%d2
	jne .L1333
	lea pmo+3464,%a0
	clr.b %d0
.L1336:
	tst.l %d2
	jne .L1334
	tst.b %d0
	jeq .L1335
	clr.l pmo+104
.L1335:
	move.l pmo+300,%d2
	move.l #-2147420170,%a2
	lea pmo,%a0
	clr.l %d1
	move.l #-2147457058,%a1
	jra .L1341
.L1333:
	move.b (%a0),%d1
	jeq .L1320
	move.b 2(%a0),%d0
	jeq .L1321
	subq.l #1,%d0
	move.b %d0,2(%a0)
	jeq .L1322
	move.l 8(%a0),%d4
	add.l %d4,4(%a0)
.L1321:
	move.b 3(%a0),%d0
	jeq .L1323
	subq.l #1,%d0
	move.b %d0,3(%a0)
	jeq .L1324
	move.l 20(%a0),%d5
	move.l 32(%a0),%d0
	add.l %d5,16(%a0)
	add.l %d0,28(%a0)
.L1323:
	move.b 1(%a0),%d4
	move.l 4(%a0),%d0
	mvz.b %d4,%d3
	tst.l %d0
	jne .L1325
	tst.b 2(%a0)
	jne .L1325
	tst.l 28(%a0)
	jne .L1325
	tst.b 3(%a0)
	jne .L1325
	mvz.b %d1,%d1
	subq.l #1,%d1
	lsl.l #6,%d1
	lea (%a2,%d1.l),%a5
	clr.b %d1
	add.l %d3,%a5
	move.b %d1,584(%a5)
	clr.b (%a0)
	move.l pmo+9096,%d0
	move.l %d0,%d3
	addq.l #1,%d3
	subq.l #1,(%a2)
	lea (%a2,%d0.l),%a5
	move.b %d2,9100(%a5)
	move.l %d3,pmo+9096
.L1320:
	addq.l #1,%d2
	lea (44,%a0),%a0
	jra .L1319
.L1322:
	move.l 12(%a0),4(%a0)
	jra .L1321
.L1324:
	move.l 24(%a0),16(%a0)
	move.l 36(%a0),28(%a0)
	jra .L1323
.L1325:
	moveq #8,%d5
	cmp.l %d3,%d5
	jcs .L1326
	move.l 40(%a0),%d1
	move.l %d1,%d3
	add.l %d3,%d3
	move.l 28(%a0),%d4
	move.l %d3,%a5
	add.l #-2147420300,%a5
	mvz.w (%a5),%d3
	tst.l %d4
	jeq .L1329
	tst.l -2147418904
	jeq .L1328
	move.l %d1,%d5
	lsr.l #5,%d5
	add.l #128,%d5
	move.l (%a2,%d5.l*4),%d6
	moveq #31,%d5
	and.l %d1,%d5
	btst %d5,%d6
	jeq .L1328
	addq.l #1,pmo+52
	move.l (%a3),pmo+108
.L1329:
	asr.l #8,%d0
	add.l %d3,%d0
	tst.l %d0
	jlt .L1356
	cmp.l #32767,%d0
	jgt .L1357
.L1330:
	move.w %d0,(%a5)
	jra .L1320
.L1328:
	lsl.l #2,%d1
	asr.l #8,%d4
	move.l %d1,%a6
	add.l #-2147422588,%a6
	move.l (%a6),%d5
	move.l 16(%a0),%d1
	asr.l #8,%d1
	clr.w %d5
	swap %d5
	sub.l %d5,%d1
	muls.l %d4,%d1
	moveq #15,%d4
	asr.l %d4,%d1
	add.l %d1,%d3
	jra .L1329
.L1356:
	clr.w %d0
	jra .L1330
.L1357:
	move.w #32767,%d0
	jra .L1330
.L1326:
	add.l #-48,%d4
	mvz.b %d4,%d4
	lsr.l #3,%d4
	jne .L1320
	mvz.b %d1,%d1
	move.l pmo+300,%d6
	asr.l #8,%d0
	move.l %d1,%d4
	subq.l #1,%d4
	btst %d4,%d6
	jne .L1331
	mov3q.l #1,%d5
	lsl.l %d4,%d5
	add.l #18,%d1
	lsl.l #4,%d1
	or.l %d6,%d5
	move.l %d5,pmo+300
	clr.w %d5
	move.w %d5,(%a2,%d1.l)
	move.l %d4,%d1
	lsl.l #4,%d1
	move.l %d1,%a5
	add.l #pmo,%a5
	move.w %d5,306(%a5)
	clr.l 308(%a5)
	clr.l 312(%a5)
	clr.l 316(%a5)
.L1331:
	cmp.l #-32768,%d0
	jlt .L1358
	cmp.l #32767,%d0
	jgt .L1359
.L1332:
	lsl.l #3,%d4
	move.l %d4,%a6
	lea 104(%a6,%d3.l),%a5
	move.w %d0,(%a2,%a5.l*2)
	jra .L1320
.L1358:
	move.w #-32768,%d0
	jra .L1332
.L1359:
	move.w #32767,%d0
	jra .L1332
.L1360:
	moveq #1,%d0
	move.l %d1,%d2
	jra .L1336
.L1334:
	move.l %d2,%d1
	subq.l #1,%d1
	move.w %d1,%d3
	mulu.w #44,%d3
	tst.b (%a0,%d3.l)
	jeq .L1360
	tst.b %d0
	jeq .L1335
	move.l %d2,pmo+104
	jra .L1335
.L1342:
	btst #0,%d0
	jeq .L1338
	move.l %d1,%d3
	add.l #-536856241,%d3
	lsl.l #2,%d3
	mvz.w -26(%a1),%d0
	move.l %d3,%a3
	btst #3,3(%a3)
	jeq .L1361
	mvs.w (%a2),%d3
.L1339:
	move.l %d0,%a5
	add.l %d3,%a5
	move.l %a5,196(%a0)
	move.l %a5,%d0
	cmp.l #32767,%a5
	jle .L1340
	mvz.w #32767,%d0
.L1340:
	move.l %d0,196(%a0)
	mvs.w (%a1),%d0
	move.l %d0,248(%a0)
.L1338:
	addq.l #1,%d1
	addq.l #4,%a0
	addq.l #2,%a1
	lea (84,%a2),%a2
.L1341:
	move.l %d2,%d0
	lsr.l %d1,%d0
	jne .L1342
	tst.l %d2
	jeq .L1343
	lea pmo+9248,%a2
	clr.l %d5
	move.l #pmo+304,%d6
	lea pmo,%a6
.L1352:
	mov3q.l #1,%d1
	and.l %d2,%d1
	move.l %d1,64(%sp)
	btst #0,%d2
	jeq .L1344
	move.w %d5,%d0
	mvz.w %d5,%d4
	lea (16,%a2),%a1
	clr.l %d3
	move.l %d6,48(%sp)
	clr.l %d7
	lsl.l #4,%d4
	mulu.w #21,%d0
	add.l #26,%d0
	move.l %d0,68(%sp)
.L1350:
	move.l %d4,%a5
	add.l #-2147423684,%a5
	lea (-32,%a1),%a3
	sub.l %a0,%a0
	move.l 48(%sp),52(%sp)
	move.l %a5,72(%sp)
.L1349:
	move.l 72(%sp),%a5
	move.l (%a5,%a0.l),%d1
	move.l 52(%sp),%a5
	addq.l #2,52(%sp)
	mvz.w %d1,%d1
	mvz.w (%a5)+,%d0
	move.l %d0,44(%sp)
	tst.l %d0
	jeq .L1345
	move.l %d1,%d0
	sub.l 68(%sp),%d0
	move.l %d0,60(%sp)
	subq.l #1,%d0
	move.l %d0,76(%sp)
	moveq #40,%d0
	cmp.l 76(%sp),%d0
	jcc .L1346
.L1345:
	move.l %d1,(%a1,%a0.l)
	move.l %d1,(%a3,%a0.l)
.L1347:
	addq.l #4,%a0
	moveq #16,%d1
	cmp.l %a0,%d1
	jne .L1349
	lea (16,%a1),%a1
	add.l #16,%d4
	addq.l #8,48(%sp)
	subq.l #1,%d7
	tst.l %d7
	jne .L1362
	move.b %d3,10064(%a6)
	btst #0,%d3
	jeq .L1351
	pea -16(%a2)
	move.l 196(%a4),-(%sp)
	jsr 1074912702
	addq.l #8,%sp
.L1351:
	btst #1,%d3
	jeq .L1344
	move.l %a2,-(%sp)
	move.l 248(%a4),-(%sp)
	jsr 1074912702
	addq.l #8,%sp
.L1344:
	lsr.l #1,%d2
	addq.l #4,%a4
	lea (64,%a2),%a2
	addq.l #1,%a6
	addq.l #2,%d5
	add.l #16,%d6
	tst.l %d2
	jne .L1352
	jra .L1343
.L1361:
	clr.l %d3
	jra .L1339
.L1362:
	move.l 64(%sp),%d7
	jra .L1350
.L1346:
	move.l 44(%sp),%d0
	swap %d0
	clr.w %d0
	or.l %d1,%d0
	move.l %d0,%a5
	moveq #8,%d0
	cmp.l 60(%sp),%d0
	jcs .L1348
	move.l %a5,(%a3,%a0.l)
	move.l %d1,(%a1,%a0.l)
	mov3q.l #1,%d0
.L1419:
	lsl.l %d7,%d0
	or.l %d0,%d3
	jra .L1347
.L1348:
	move.l %a5,(%a1,%a0.l)
	move.l %d1,(%a3,%a0.l)
	mov3q.l #4,%d0
	jra .L1419
	.size	pmo_pre, .-pmo_pre
	.align	2
	.globl	pmo_post
	.type	pmo_post, @function
pmo_post:
	move.l -66650100,%d0
	lea (-92,%sp),%sp
	movem.l #31804,(%sp)
	move.l %d0,40(%sp)
	lea pmo,%a3
	move.l (%a3),%d0
	tst.l %d0
	jeq .L1421
	move.w #12,%a6
	lea (44,%sp),%a2
	move.l %a2,%a0
.L1422:
	clr.l (%a0)+
	subq.l #1,%a6
	tst.l %a6
	jne .L1422
	move.l pmo+104,%d1
	clr.l %d5
	lea pmo,%a4
	lea pmo+3464,%a0
	move.l %d1,36(%sp)
.L1423:
	cmp.l 36(%sp),%d5
	jne .L1432
	move.l pmo+300,%d2
	tst.l %d2
	jeq .L1437
	lea pmo+9280,%a5
	move.l #pmo,%d3
.L1436:
	btst #0,%d2
	jeq .L1434
	move.b 10064(%a4),%d0
	move.w %d0,%ccr
	jne .L1435
	pea -16(%a5)
	move.l %d3,%a0
	move.l 196(%a0),-(%sp)
	jsr 1074912702
	addq.l #8,%sp
.L1435:
	move.b 10064(%a4),%d0
	move.w %d0,%ccr
	jpl .L1434
	move.l %a5,-(%sp)
	move.l %d3,%a1
	move.l 248(%a1),-(%sp)
	jsr 1074912702
	addq.l #8,%sp
.L1434:
	lsr.l #1,%d2
	addq.l #1,%a4
	addq.l #4,%d3
	lea (64,%a5),%a5
	tst.l %d2
	jne .L1436
.L1437:
	move.l %a6,%d0
	add.l #36,%d0
	move.l (%a2)+,(%a3,%d0.l*4)
	addq.l #1,%a6
	moveq #12,%d0
	cmp.l %a6,%d0
	jne .L1437
	mov3q.l #1,pmo+140
.L1438:
	move.l 40(%sp),-(%sp)
	jsr pmo_time
	addq.l #4,%sp
	move.l pmo+116,%d0
	cmp.l pmo+36.l,%d0
	jls .L1440
	move.l %d0,pmo+36
.L1440:
	movem.l (%sp),#31804
	add.l %d0,pmo+40
	addq.l #1,pmo+44
	lea (92,%sp),%sp
	rts
.L1432:
	move.b (%a0),%d1
	jeq .L1424
	mvz.b 1(%a0),%d0
	moveq #41,%d2
	cmp.l %d0,%d2
	jcs .L1425
	moveq #8,%d3
	cmp.l %d0,%d3
	jcc .L1424
	move.l 40(%a0),%d0
	move.l %d0,%d1
	add.l %d1,%d1
	move.l 28(%a0),%d3
	move.l %d1,%a5
	add.l #-2147420300,%a5
	mvz.w (%a5),%d2
	tst.l %d3
	jeq .L1428
	tst.l -2147418904
	jeq .L1427
	move.l %d0,%d1
	lsr.l #5,%d1
	add.l #128,%d1
	move.l (%a3,%d1.l*4),%d4
	moveq #31,%d1
	and.l %d0,%d1
	btst %d1,%d4
	jeq .L1427
	lea fp,%a1
	addq.l #1,pmo+52
	move.l (%a1),pmo+108
.L1428:
	move.l 4(%a0),%d0
	asr.l #8,%d0
	add.l %d2,%d0
	tst.l %d0
	jlt .L1441
	cmp.l #32767,%d0
	jgt .L1442
.L1429:
	move.w %d0,(%a5)
.L1424:
	addq.l #1,%d5
	lea (44,%a0),%a0
	jra .L1423
.L1427:
	lsl.l #2,%d0
	move.l 16(%a0),%d1
	asr.l #8,%d1
	asr.l #8,%d3
	add.l #-2147422588,%d0
	move.l %d0,%a1
	move.l (%a1),%d0
	clr.w %d0
	swap %d0
	sub.l %d0,%d1
	muls.l %d3,%d1
	moveq #15,%d0
	asr.l %d0,%d1
	add.l %d1,%d2
	jra .L1428
.L1441:
	clr.w %d0
	jra .L1429
.L1442:
	move.w #32767,%d0
	jra .L1429
.L1425:
	moveq #56,%d2
	cmp.l %d0,%d2
	jne .L1424
	move.l 4(%a0),%d0
	asr.l #8,%d0
	cmp.l #32767,%d0
	jle .L1430
	mvz.w #32767,%d0
.L1430:
	mvz.b %d1,%d1
	move.l 16(%a0),%d2
	subq.l #1,%d1
	and.l #8323072,%d2
	cmp.l #-32768,%d0
	jge .L1431
	mvs.w #-32768,%d0
.L1431:
	mvz.w %d0,%d0
	moveq #24,%d3
	or.l %d0,%d2
	mvs.w 28(%a0),%d0
	lsl.l %d3,%d0
	or.l %d0,%d2
	move.l %d2,44(%sp,%d1.l*4)
	jra .L1424
.L1421:
	tst.l pmo+140
	jeq .L1438
.L1439:
	move.l %d0,%d1
	add.l #36,%d1
	clr.l (%a3,%d1.l*4)
	moveq #12,%d1
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L1439
	clr.l pmo+140
	jra .L1438
	.size	pmo_post, .-pmo_post
	.align	2
	.globl	pmo_vel
	.type	pmo_vel, @function
pmo_vel:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	moveq #11,%d2
	move.l 12(%sp),%d1
	move.l 16(%sp),%d0
	cmp.l %d1,%d2
	jcs .L1473
	add.l #36,%d1
	lea pmo,%a0
	move.l (%a0,%d1.l*4),%a0
	tst.l %a0
	jeq .L1473
	move.l %a0,%d1
	moveq #127,%d3
	clr.w %d1
	swap %d1
	move.l %a0,%d2
	addq.l #1,pmo+48
	and.l %d3,%d1
	moveq #24,%d3
	lsr.l %d3,%d2
	sub.l %d0,%d1
	muls.l %d2,%d1
	add.l #64,%d1
	asr.l #7,%d1
	add.l %d1,%d0
	mvs.w %a0,%d1
	add.l #128,%d1
	asr.l #8,%d1
	add.l %d1,%d0
	moveq #127,%d1
	cmp.l %d0,%d1
	jge .L1475
	moveq #127,%d0
.L1473:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L1475:
	tst.l %d0
	jgt .L1473
	mov3q.l #1,%d0
	jra .L1473
	.size	pmo_vel, .-pmo_vel
	.align	2
	.globl	rui_tick
	.type	rui_tick, @function
rui_tick:
	link.w %fp,#-204
	move.l #1123449124,%a0
	movem.l #15612,(%sp)
	move.l -66650100,%d1
	lea fp,%a1
	move.l (%a0),fp+8
	move.l (%a1),fp+4
	move.l %d1,-152(%fp)
	clr.l fp+12
.L1481:
	mov3q.l #1,%d0
	cmp.l fp+20.l,%d0
	jeq .L1481
.L1482:
	mov3q.l #2,%d1
	cmp.l fp+20.l,%d1
	jeq .L1483
	move.l 1100667228,%d0
	cmp.l #cu_text,%d0
	jeq .L1484
	cmp.l 1100664624.l,%d0
	jne .L1484
	move.l #cu_text,%d2
	move.l %d2,1100667228
.L1484:
	move.l #1075731444,%d3
	cmp.l sv+88.l,%d3
	jeq .L1485
	move.l #1093765506,%a1
	moveq #11,%d4
	mvz.b (%a1),%d0
	cmp.l %d0,%d4
	jcs .L1485
	move.l -2147457096,%d0
	moveq #127,%d5
	mvz.b (%a1),%d1
	and.l %d5,%d0
	mulu.w #152,%d1
	mulu.w #2531,%d0
	move.l %d0,%a0
	add.l %d1,%a0
	add.l #1092966773,%a0
	move.b (%a0),cu+28
	move.b (%a1),cu+30
.L1485:
	tst.b cu.l
	jne .L1486
	move.l #1128813124,%d6
	cmp.l 1073849308.l,%d6
	jne .L1486
	moveq #1,%d7
	pea 52.w
	move.b %d7,cu
	jsr cu_src_setup
	addq.l #4,%sp
	lea cu_steps,%a0
	move.l %a0,1073849316
	lea cu_setup,%a1
	move.l %a1,1073849312
.L1486:
	move.l rx,%d2
	move.l #-66650100,%a2
	addq.l #1,st+8
	move.l (%a2),st+300
	tst.l st
	jne .L1487
	lea rui_sysex,%a3
	move.l %a3,1075551840
	move.l #1381321040,%a4
	move.l %a4,1075551836
	mov3q.l #1,st
	move.l %d2,st+16
.L1488:
	move.l #ux,%d5
	jra .L1658
.L1483:
	pea 10000.w
	jsr 1074367512
	addq.l #4,%sp
	jra .L1482
.L1487:
	tst.b host_close.l
	jeq .L1489
	clr.b %d0
	lea commits,%a0
	move.b %d0,host_close
	move.b %d0,host_open
	move.l (%a0),sv+12
	tst.b sv+103.l
	jeq .L1490
	moveq #-127,%d0
	move.b %d0,sv+103
.L1490:
	mov3q.l #1,-(%sp)
	move.l 8(%fp),-(%sp)
	jsr leave
	addq.l #8,%sp
.L1489:
	tst.b host_open.l
	jeq .L1491
	clr.b %d1
	clr.l -(%sp)
	mov3q.l #1,-(%sp)
	move.l 8(%fp),-(%sp)
	move.b %d1,host_open
	jsr enter
	lea (12,%sp),%sp
.L1491:
	move.l st+956,%d0
	mov3q.l #1,%d3
	cmp.l 1094562388.l,%d3
	jne .L1492
	cmp.l #65534,%d0
	jhi .L1493
	tst.l %d0
	jne .L1494
	moveq #50,%d4
	cmp.l st+8.l,%d4
	jcc .L1495
.L1494:
	addq.l #1,%d0
	move.l %d0,st+956
	moveq #10,%d5
	cmp.l %d0,%d5
	jne .L1493
.L1496:
	moveq #1,%d7
	move.w #4095,%a0
	move.l %d2,st+964
	mov3q.l #1,st+960
	move.b %d7,st+992
	move.b %d7,mr+13
	move.b %d7,mr+19
	move.w %a0,ar+60
	jsr sq_forget
	lea commits,%a1
	move.l (%a1),pm+28
.L1497:
	tst.b st+992.l
	jne .L1501
.L1502:
	tst.l splash_req
	jeq .L1504
	move.l splash_req,%d0
	clr.l splash_req
	tst.l st+4
	jne .L1505
	moveq #127,%d1
	and.l %d1,%d0
	tst.l %d0
	jeq .L1506
	tst.l commits
	jne .L1507
.L1505:
	addq.l #1,st+984
.L1504:
	tst.l st+4
	jeq .L1509
	cmp.l st+16.l,%d2
	jeq .L1510
	clr.l st+12
.L1511:
	move.l %d2,st+16
	clr.b %d1
	move.l st+8,%d3
	clr.l %d0
	lea st+408,%a0
.L1517:
	move.l (%a0)+,%a1
	tst.l %a1
	jeq .L1515
	move.l %d3,%d4
	sub.l %a1,%d4
	jmi .L1515
	moveq #1,%d1
	clr.l -4(%a0)
.L1515:
	addq.l #1,%d0
	moveq #16,%d5
	cmp.l %d0,%d5
	jne .L1517
	tst.b %d1
	jeq .L1518
	mov3q.l #1,st+344
.L1518:
	move.l %d2,-(%sp)
	move.l 8(%fp),-(%sp)
	jsr sv_tick
	addq.l #8,%sp
	tst.b ls.l
	jeq .L1519
	tst.b sv.l
	jeq .L1520
	tst.b sv+8.l
	jeq .L1520
	tst.b sv+10.l
	jne .L1520
	move.l sv,%d0
	move.l ls,%d6
	eor.l %d6,%d0
	and.l #16776960,%d0
	or.l st+4,%d0
	jeq .L1519
.L1520:
	mov3q.l #5,-(%sp)
	jsr ls_close
	addq.l #4,%sp
.L1519:
	move.l ls_in_gen,%d7
	cmp.l ls+48.l,%d7
	jeq .L1521
	move.l ls_in_v,%d0
	lea ls_in_gen,%a1
	move.l ls+36,%a0
	move.l (%a1),ls+48
	tst.b ls.l
	jeq .L1521
	move.l %d0,%d1
	lsr.l #8,%d1
	mvz.b ls+1,%d2
	cmp.l %d1,%d2
	jne .L1521
	mov3q.l #1,%d1
	and.l %d1,%d0
	tst.l %a0
	jeq .L1522
	tst.l %d0
	jne .L1522
	clr.l st+124
.L1522:
	move.l %d0,ls+36
	mov3q.l #1,ls+40
.L1521:
	tst.l ls+36
	jeq .L1523
	tst.l ls+40
	jne .L1523
	move.l st+8,%d0
	moveq #20,%d2
	sub.l ls+44,%d0
	cmp.l %d0,%d2
	jcc .L1523
	clr.l ls+36
	addq.l #1,ls+56
	clr.l st+124
.L1523:
	move.l u46+8,%d0
	tst.l %d0
	jeq .L1524
	tst.b ls.l
	jne .L1525
	tst.l st+4
	jne .L1525
	move.l st+8,%d1
	moveq #20,%d3
	sub.l %d0,%d1
	cmp.l %d1,%d3
	jcs .L1525
	move.l #1093765506,%a1
	moveq #11,%d4
	mvz.b (%a1),%d0
	cmp.l %d0,%d4
	jcs .L1525
	move.l -2147457096,%d0
	moveq #127,%d5
	mvz.b (%a1),%d1
	and.l %d5,%d0
	mulu.w #152,%d1
	mulu.w #2531,%d0
	move.l %d0,%a0
	add.l %d1,%a0
	add.l #1092966773,%a0
	mvz.b (%a0),%d1
	move.l u46+12,%d0
	cmp.l %d1,%d0
	jeq .L1526
.L1525:
	clr.l u46+8
.L1524:
	move.l pm,%d2
	tst.l %d2
	jeq .L1527
	clr.l pm
	add.l #31,%d2
	tst.b ls.l
	jeq .L1528
	mov3q.l #4,-(%sp)
	jsr ls_close
	addq.l #4,%sp
.L1528:
	clr.l st+1038
	tst.l st+4
	jeq .L1529
	moveq #1,%d7
	mvz.w #256,%d6
	moveq #1,%d0
	move.b %d2,st+993
	addq.l #1,pm+16
	move.l %d6,st+296
	move.b %d7,st+161
	move.w %d0,st+162
.L1530:
	tst.l st+1058
	jne .L1532
	tst.l sv+96
	jne .L1533
	move.l sv+88,-(%sp)
	jsr overlay
	addq.l #4,%sp
	tst.l %d0
	jeq .L1531
	lea st+8,%a0
	mov3q.l #1,st+1058
	mov3q.l #1,st+1062
	move.l (%a0),st+1066
	addq.l #1,st+1070
	addq.l #1,st+1090
.L1532:
	tst.l st+4
	jne .L1534
	clr.l st+1058
.L1535:
	tst.l st+972
	jne .L1539
	tst.b sv+8.l
	jne .L1539
.L1540:
	move.l st+1082,%d0
	tst.l %d0
	jeq .L1542
	sub.l st+8,%d0
	tst.l %d0
	jgt .L1543
	clr.l st+1082
.L1543:
	moveq #1,%d0
	move.l 8(%fp),%a0
	move.b %d0,32(%a0)
.L1542:
	move.l sq_gen,%d0
	move.b 1093765506,%d2
	cmp.l sq+400.l,%d0
	jeq .L1544
	mov3q.l #1,%d1
	and.l %d0,%d1
	btst #0,%d0
	jne .L1544
	sub.l %a0,%a0
	lea sq_req,%a1
.L1545:
	lea (%a1,%a0.l),%a3
	mov3q.l #7,%d3
	lea (-140,%fp),%a2
	move.b (%a3),(%a2,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d3
	jne .L1545
	cmp.l sq_gen.l,%d0
	jne .L1544
	move.l %d0,sq+400
	mvz.b -139(%fp),%d0
	mvz.b -140(%fp),%d3
	lsl.l #7,%d0
	or.l %d3,%d0
	mvz.b -137(%fp),%d3
	and.l #4095,%d0
	move.l %d0,sq+4
	mvz.b -136(%fp),%d0
	lsl.l #7,%d0
	or.l %d3,%d0
	move.b -138(%fp),%d3
	and.l #4095,%d0
	or.l sq+4,%d0
	move.l %d0,sq+8
	move.w %d3,%ccr
	jeq .L1547
	move.l sq+4,%d1
.L1547:
	mvz.b -134(%fp),%d0
	mvz.b -135(%fp),%d4
	lsl.l #7,%d0
	or.l %d4,%d0
	and.l #4095,%d0
	or.l %d1,%d0
	move.l %d0,pin
	tst.l sq
	jeq .L1548
	btst #1,%d3
	jeq .L1549
.L1548:
	mvz.w #255,%d4
	mvz.w #8191,%d5
	addq.l #1,sq+452
	mov3q.l #1,ed+92
	move.l %d4,sq+404
	move.l %d5,ed+260
.L1549:
	mov3q.l #1,sq
.L1544:
	tst.l sq
	jne .L1550
	clr.l sq+408
.L1551:
	jsr led_tick
	move.l sq+468,%d2
	move.l pg_gen,%d0
	mvz.b ovp_on,%d3
	tst.l %d2
	jeq .L1601
	cmp.l sq+472.l,%d0
	jeq .L1602
	btst #0,%d0
	jne .L1602
	move.b pg_req,%d5
	move.b pg_req+1,%d4
	move.b pg_req+2,%d2
	move.b pg_req+3,%d1
	cmp.l pg_gen.l,%d0
	jne .L1602
	move.b %d5,sq+480
	move.b %d4,sq+481
	move.b %d2,sq+482
	move.b %d1,sq+483
	move.l %d0,sq+472
	mov3q.l #1,sq+476
.L1602:
	clr.l %d2
	clr.l %d0
	lea sq+480,%a0
.L1604:
	mvz.b (%a0,%d0.l),%d4
	moveq #111,%d5
	cmp.l %d4,%d5
	jcs .L1603
	mov3q.l #1,%d4
	lsl.l %d0,%d4
	or.l %d4,%d2
.L1603:
	addq.l #1,%d0
	mov3q.l #4,%d6
	cmp.l %d0,%d6
	jne .L1604
.L1601:
	cmp.l %d3,%d2
	jne .L1605
	tst.l sq+476
	jeq .L1606
.L1605:
	move.l #1100088672,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L1793
	addq.l #1,st+1018
.L1606:
	tst.l st+4
	jeq .L1794
	tst.l st+1058
	seq %d2
	mvs.b %d2,%d2
	neg.l %d2
.L1614:
	move.l st+8,%d0
	moveq #10,%d3
	divu.l %d3,%d0
	btst #0,%d0
	jeq .L1795
	clr.b %d3
.L1615:
	mvz.b k44+24,%d0
	cmp.l %d2,%d0
	jne .L1616
	tst.l %d2
	jeq .L1617
	mvz.b k44+25,%d1
	mvz.b %d3,%d0
	cmp.l %d1,%d0
	jeq .L1617
.L1616:
	move.l #1100088672,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L1618
	addq.l #1,st+1018
.L1617:
	jsr flush
	move.b pc+79,%d2
	move.l pc_seq,%d1
	lea pc,%a2
	tst.b %d2
	jne .L1621
	btst #0,%d1
	jne .L1622
	cmp.l pc+72.l,%d1
	jeq .L1622
	clr.l %d0
	lea pc_req,%a0
	lea (-140,%fp),%a3
.L1623:
	lea (%a0,%d0.l),%a1
	mov3q.l #6,%d3
	move.b (%a1),(%a3,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d3
	jne .L1623
	cmp.l pc_seq.l,%d1
	jne .L1622
	move.b -140(%fp),%d4
	move.w pc+82,%d0
	moveq #127,%d5
	move.l %d1,pc+72
	moveq #11,%d6
	mvz.b %d4,%d3
	addq.l #1,%d0
	move.w %d0,pc+82
	move.b %d5,pc+77
	cmp.l %d3,%d6
	jlt .L1625
	jsr 1075320104
	move.l %d0,-(%sp)
	jsr 1073963888
	addq.l #4,%sp
	tst.l %d0
	jne .L1626
.L1625:
	moveq #3,%d2
.L1627:
	move.b %d2,pc+78
	mvz.b %d2,%d2
	moveq #1,%d1
	move.b %d4,pc+76
	add.l #42,%d2
	move.w (%a2,%d2.l*2),%d0
	move.b %d1,pc+79
	addq.l #1,%d0
	move.w %d0,(%a2,%d2.l*2)
.L1621:
	moveq #-9,%d0
	move.w #10242,%d3
	lea pc+76,%a0
	lea pc+78,%a1
	move.w (%a0),-134(%fp)
	move.b (%a1),-132(%fp)
	pea 10.w
	move.l #-260222380,%d2
	pea -140(%fp)
	move.l %d2,-140(%fp)
	move.w %d3,-136(%fp)
	move.b %d0,-131(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1622
	move.w pc+92,%d0
	clr.b %d1
	addq.l #1,%d0
	move.b %d1,pc+79
	move.w %d0,pc+92
.L1622:
	move.b st+992,%d0
	move.b st+161,%d1
	or.l %d1,%d0
	tst.b %d0
	jne .L1642
	lea (-140,%fp),%a2
	sub.l %a1,%a1
	lea mr,%a4
	clr.l %d1
	move.l %a2,%a5
	move.l %a2,%d3
	move.l %a4,%a3
.L1644:
	moveq #127,%d0
	and.l -2147457096,%d0
	mvz.b (%a4)+,%d2
	mulu.w #2531,%d0
	move.l %d0,%a0
	add.l #1092966773,%a0
	move.b (%a0,%a1.l),%d0
	move.b %d0,(%a5)+
	mvz.b %d0,%d0
	cmp.l %d0,%d2
	jeq .L1643
	addq.l #1,%d1
.L1643:
	lea (152,%a1),%a1
	cmp.l #1824,%a1
	jne .L1644
	tst.b mr+12.l
	jne .L1645
	sub.l %a0,%a0
.L1646:
	lea (%a2,%a0.l),%a1
	moveq #12,%d0
	move.b (%a1),(%a3,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d0
	jne .L1646
	moveq #127,%d0
	and.l -2147457096,%d0
	moveq #1,%d1
	move.b %d0,mr+18
	move.b %d1,mr+12
.L1647:
	jsr sv_flush
	jsr arp_tick
.L1642:
	tst.b sv+103.l
	jge .L1654
	clr.b %d1
	move.l 8(%fp),%a0
	move.b %d1,32(%a0)
.L1654:
	tst.l st
	jne .L1488
.L1655:
	mvz.b cu+9,%d2
	tst.l %d2
	jeq .L1683
	move.b cu+10,%d4
	moveq #127,%d0
	and.l -2147457096,%d0
	mvz.b %d4,%d6
	mulu.w #2531,%d0
	move.w %d6,%d1
	move.l %d0,%a0
	mulu.w #152,%d1
	add.l %d1,%a0
	add.l #1092966773,%a0
	mvz.b (%a0),%d0
	cmp.l %d2,%d0
	jeq .L1684
	move.l st+8,%d0
	mov3q.l #4,%d3
	sub.l cu+16,%d0
	cmp.l %d0,%d3
	jcc .L1683
.L1688:
	clr.b %d4
	move.b %d4,cu+9
.L1683:
	tst.l st
	jeq .L1689
	mov3q.l #1,%d0
	cmp.l 1094562388.l,%d0
	jne .L1690
	tst.l st+968
	jeq .L1690
	move.l dp,%d0
	move.b 1093765506,%d2
	tst.l %d0
	jeq .L1691
	move.w #18689,%d3
	moveq #1,%d4
	move.w #-2304,%d5
	pea 9.w
	move.l #-260222380,%d1
	pea -140(%fp)
	move.b %d0,-133(%fp)
	move.l %d1,-140(%fp)
	move.w %d3,-136(%fp)
	move.b %d4,-134(%fp)
	move.w %d5,-132(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1693
	clr.l dp
.L1691:
	tst.b k44+20.l
	jeq .L1694
	move.l k44+20,%d0
	and.l #16776960,%d0
	tst.l %d0
	jne .L1694
	tst.l st+4
	jeq .L1695
	tst.l st+1058
	jne .L1694
.L1695:
	move.l st+8,%d0
	sub.l k44,%d0
	lsr.l #3,%d0
	jeq .L1694
	move.l sv+88,-(%sp)
	jsr overlay
	addq.l #4,%sp
	or.l ov_list,%d0
	jne .L1694
	tst.l st+4
	sne %d0
	move.w #257,%d7
	neg.l %d0
	move.b %d0,k44+26
	move.w %d7,k44+22
.L1694:
	move.b k44+23,%d0
	jeq .L1696
	tst.b k44+26.l
	seq %d1
	move.w #18689,%a1
	move.w #-2304,%d3
	pea 9.w
	move.l #-260222380,%a0
	pea -140(%fp)
	move.l %a0,-140(%fp)
	addq.l #5,%d1
	move.b %d1,-134(%fp)
	mov3q.l #1,%d1
	eor.l %d1,%d0
	move.w %a1,-136(%fp)
	move.w %d3,-132(%fp)
	tst.b %d0
	seq %d0
	neg.l %d0
	move.b %d0,-133(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1693
	mvz.b k44+23,%d0
	tst.b k44+26.l
	jeq .L1699
	mov3q.l #1,%d4
	cmp.l %d0,%d4
	jne .L1700
	addq.l #1,k44+28
.L1701:
	clr.b %d0
	move.b %d0,k44+23
.L1696:
	mvz.b %d2,%d1
	moveq #11,%d3
	cmp.l %d1,%d3
	jcs .L1693
	move.b %d2,%d4
	moveq #127,%d0
	and.l -2147457096,%d0
	ext.w %d4
	mulu.w #2531,%d0
	mulu.w #152,%d4
	move.l %d0,%a0
	move.l st+968,%d0
	add.l %d4,%a0
	add.l #1092966773,%a0
	move.b (%a0),%d3
	mvz.b %d3,%d5
	cmp.l dp+8.l,%d0
	jeq .L1704
	clr.b %d6
	move.l %d0,dp+8
	move.b %d6,dp+22
.L1705:
	moveq #52,%d7
	cmp.l %d5,%d7
	jcs .L1800
	move.b %d3,%d0
	move.l #1075572644,%a0
	ext.w %d0
	mvz.w %d0,%d0
	lsl.l #3,%d0
	move.l (%a0,%d0.l),%a0
.L1707:
	moveq #2,%d0
	move.w #18689,%a2
	move.l #-260222380,%a1
	move.b %d2,-133(%fp)
	move.l %a1,-140(%fp)
	move.b %d0,-134(%fp)
	moveq #127,%d0
	and.l %d3,%d0
	move.w %a2,-136(%fp)
	move.b %d0,-132(%fp)
	tst.l %a0
	jeq .L1801
	move.l %a0,%d0
	add.l #-1073741824,%d0
	cmp.l #67108863,%d0
	sls %d0
	mvs.b %d0,%d0
	neg.l %d0
.L1708:
	clr.l %d1
	lea (-140,%fp),%a1
.L1710:
	tst.l %d0
	jeq .L2113
	move.b (%a0,%d1.l),%d6
	move.l %d6,%d7
	subq.l #1,%d7
	mvz.b %d7,%d7
	move.l %d7,%a2
	moveq #125,%d7
	cmp.l %a2,%d7
	jcs .L1803
.L1709:
	move.b %d6,9(%a1,%d1.l)
	addq.l #1,%d1
	moveq #12,%d6
	cmp.l %d1,%d6
	jne .L1710
	moveq #-9,%d7
	pea 22.w
	move.l %a1,-(%sp)
	move.b %d7,-119(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1693
	move.w #257,%a0
	move.b %d2,dp+20
	move.b %d3,dp+21
	addq.l #1,dp+12
	move.w %a0,dp+22
	jra .L1706
.L1495:
	move.l st+4,%d0
	tst.l %d0
	jeq .L1493
	moveq #10,%d6
	move.l %d6,st+956
	jra .L1496
.L1493:
	move.l st+960,%d3
	move.l %d3,%d1
	subq.l #1,%d1
	lsr.l #1,%d1
	jne .L1497
	moveq #20,%d1
	moveq #20,%d5
	muls.l %d3,%d1
	cmp.l %d1,%d5
	seq %d1
	neg.l %d1
	tst.b %d1
	jeq .L1498
	moveq #30,%d1
.L1499:
	cmp.l %d1,%d0
	jne .L1497
	cmp.l st+964.l,%d2
	jne .L1500
	moveq #1,%d6
	move.w #4095,%d7
	addq.l #1,%d3
	move.l %d3,st+960
	move.b %d6,st+992
	move.b %d6,mr+13
	move.b %d6,mr+19
	move.w %d7,ar+60
.L1501:
	tst.b sv.l
	jeq .L1502
	moveq #1,%d0
	move.b sv+10,%d1
	move.b %d0,sv+4
	move.b sv+1,%d0
	or.l %d1,%d0
	move.w #257,%d1
	move.b %d0,sv+5
	move.w %d1,sv+6
	jra .L1502
.L1498:
	moveq #50,%d1
	jra .L1499
.L1500:
	mov3q.l #3,st+960
	jra .L1497
.L1492:
	tst.l %d0
	jeq .L1503
	addq.l #1,pmo+72
.L1503:
	clr.b %d3
	clr.l qp+4
	lea qp+56,%a0
	lea qp+92,%a1
	move.l (%a0),qp+60
	clr.l st+956
	move.l (%a1),qp+96
	clr.l ls_host_presets
	clr.l st+960
	clr.l qp+100
	clr.l fk_claim
	move.b %d3,st+992
	tst.l sq
	jeq .L1502
	jsr sq_forget
	jra .L1502
.L1506:
	mov3q.l #2,-(%sp)
	move.l 8(%fp),-(%sp)
	jsr splash_end
	addq.l #8,%sp
	jra .L1504
.L1507:
	tst.l st+972
	jne .L1508
	mov3q.l #1,st+972
	addq.l #1,st+980
	mov3q.l #-1,st+20
	clr.l st+12
	mov3q.l #1,st+344
.L1508:
	move.l %d0,st+976
.L1509:
	tst.l st+972
	jeq .L1511
	cmp.l st+16.l,%d2
	jeq .L1512
	clr.l st+12
.L1513:
	move.l st+976,%d0
	subq.l #1,%d0
	move.l %d0,st+976
	tst.l %d0
	jne .L1511
	mov3q.l #1,-(%sp)
	jra .L2110
.L1510:
	move.l st+12,%d0
	addq.l #1,%d0
	move.l %d0,st+12
	moveq #19,%d3
	cmp.l %d0,%d3
	jcc .L1511
	mov3q.l #2,-(%sp)
	move.l 8(%fp),-(%sp)
	jsr leave
	clr.l mask_set
.L2109:
	addq.l #8,%sp
	jra .L1511
.L1512:
	move.l st+12,%d0
	addq.l #1,%d0
	move.l %d0,st+12
	moveq #19,%d4
	cmp.l %d0,%d4
	jcc .L1513
	mov3q.l #3,-(%sp)
.L2110:
	move.l 8(%fp),-(%sp)
	jsr splash_end
	jra .L2109
.L1526:
	tst.b sv.l
	jeq .L1524
	tst.b sv+8.l
	jeq .L1524
	tst.b sv+10.l
	jne .L1524
	mvz.b sv+1,%d2
	mvz.b (%a1),%d1
	cmp.l %d2,%d1
	jne .L1524
	mvz.b sv+2,%d1
	cmp.l %d0,%d1
	jne .L1524
	clr.l -(%sp)
	clr.l -(%sp)
	jsr ls_enc
	addq.l #8,%sp
	tst.l %d0
	jeq .L1524
	clr.l u46+8
	addq.l #1,u46+28
	jra .L1524
.L1529:
	mvz.b %d2,%d2
	move.l %d2,-(%sp)
	clr.l -(%sp)
	move.l 8(%fp),-(%sp)
	jsr enter
	lea (12,%sp),%sp
	addq.l #1,pm+12
.L1527:
	tst.l st+4
	jne .L1530
.L1531:
	tst.l st+1058
	jne .L1532
.L1533:
	tst.l st+4
	jeq .L1535
.L1539:
	tst.l st+1058
	jne .L1540
	move.l commits,%d2
	cmp.l st+20.l,%d2
	jne .L1541
	tst.l st+344
	jeq .L1540
.L1541:
	moveq #1,%d3
	move.l 8(%fp),%a0
	move.b %d3,32(%a0)
	jra .L1540
.L1534:
	move.l sv+88,%d0
	cmp.l #1075650164,%d0
	jeq .L1536
	move.l %d0,-(%sp)
	jsr overlay
	addq.l #4,%sp
	tst.l %d0
	jeq .L1537
.L1536:
	mov3q.l #1,st+1062
	jra .L1533
.L1537:
	tst.l st+1062
	jne .L1538
	move.l st+8,%d0
	moveq #20,%d1
	sub.l st+1066,%d0
	cmp.l %d0,%d1
	jcc .L1533
.L1538:
	clr.l st+1058
	mov3q.l #-1,st+20
	mov3q.l #1,st+344
	jra .L1533
.L1550:
	mvz.b %d2,%d2
	lea sq_grid,%a2
	moveq #11,%d6
	cmp.l %d2,%d6
	jcs .L1552
	move.l sq+4,%d0
	btst %d2,%d0
	jne .L1553
.L1552:
	clr.l %d0
.L1554:
	cmp.l sq+408.l,%d0
	jne .L1555
	tst.l %d0
	jeq .L1556
	cmp.l sq+412.l,%d2
	jeq .L1556
.L1555:
	mov3q.l #1,%d7
	or.l %d7,sq+404
	move.l %d0,sq+408
	move.l %d2,sq+412
.L1556:
	move.b 1093615249,%d0
	move.b 1093615250,%d2
	moveq #127,%d3
	move.b 1079807236,%d1
	and.l %d3,%d1
	move.l sq+360,%d3
	btst #8,%d3
	jeq .L1557
	move.l %d1,%d0
	moveq #127,%d1
	and.l %d3,%d1
.L1558:
	cmp.l %d0,%d1
	jeq .L1787
.L1559:
	cmp.l sq+420.l,%d1
	jne .L1560
	cmp.l sq+424.l,%d0
	jeq .L1561
.L1560:
	mov3q.l #4,%d5
	or.l %d5,sq+404
	move.l %d1,sq+420
	move.l %d0,sq+424
.L1561:
	jsr 1075320104
	move.l %d0,-(%sp)
	jsr 1073963888
	addq.l #4,%sp
	tst.l %d0
	sne %d2
	mvs.b %d2,%d2
	neg.l %d2
	jsr (%a2)
	cmp.l sq+428.l,%d2
	jne .L1562
	cmp.l sq+432.l,%d0
	jeq .L1563
.L1562:
	moveq #16,%d6
	or.l %d6,sq+404
	move.l %d2,sq+428
	move.l %d0,sq+432
.L1563:
	move.l 1076395164,%d0
	and.l #2097151,%d0
	cmp.l sq+436.l,%d0
	jeq .L1564
	moveq #32,%d7
	or.l %d7,sq+404
	move.l %d0,sq+436
.L1564:
	move.b 1081877443,%d0
	mvz.b 1081877444,%d1
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d1,%d0
	and.l #8191,%d0
	cmp.l sq+440.l,%d0
	jeq .L1565
	move.l %d0,sq+440
	moveq #8,%d0
	or.l %d0,sq+404
.L1565:
	move.b 1081877445,%d0
	mvz.b 1081877446,%d1
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d1,%d0
	and.l #8191,%d0
	cmp.l sq+552.l,%d0
	jeq .L1566
	mvz.w #128,%d1
	move.l %d0,sq+552
	or.l %d1,sq+404
.L1566:
	mov3q.l #1,%d3
	move.l 1079807120,%d2
	cmp.l %d2,%d3
	jne .L1567
	move.l st+8,%d0
	moveq #19,%d4
	sub.l sq+444,%d0
	cmp.l %d0,%d4
	jcc .L1567
	moveq #64,%d5
	or.l %d5,sq+404
.L1567:
	move.l sq+404,%d0
	btst #0,%d0
	jeq .L1568
	move.l sq+408,%d0
	move.b %d0,-140(%fp)
	tst.l %d0
	jeq .L1788
	move.b sq+415,%d0
.L1569:
	mov3q.l #2,-(%sp)
	pea -140(%fp)
	pea 8.w
	move.b %d0,-139(%fp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1551
	moveq #-2,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1568:
	btst #1,%d0
	jeq .L1570
	mov3q.l #2,%d6
	cmp.l %d2,%d6
	jcc .L1789
	clr.l %d0
.L1571:
	move.b %d0,-140(%fp)
	lea (-140,%fp),%a2
	move.l 1100784300,-(%sp)
	pea 1(%a2)
	jsr blk4
	mov3q.l #5,-(%sp)
	move.l %a2,-(%sp)
	mov3q.l #1,-(%sp)
	jsr sq_send2
	lea (20,%sp),%sp
	tst.l %d0
	jeq .L1551
	moveq #-3,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1570:
	move.w %d0,%ccr
	jne .L1572
	lea sq+423,%a0
	lea sq+427,%a1
	move.b (%a0),-140(%fp)
	move.b (%a1),-139(%fp)
	mov3q.l #2,-(%sp)
	pea -140(%fp)
	mov3q.l #2,-(%sp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1551
	moveq #-5,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1572:
	move.w %d0,%ccr
	jpl .L1573
	move.l sq+440,%d0
	moveq #127,%d1
	mov3q.l #2,-(%sp)
	pea -140(%fp)
	and.l %d0,%d1
	lsr.l #7,%d0
	mov3q.l #5,-(%sp)
	move.b %d1,-140(%fp)
	moveq #63,%d1
	and.l %d1,%d0
	move.b %d0,-139(%fp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1551
	moveq #-9,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1573:
	tst.b %d0
	jpl .L1574
	move.l sq+552,%d0
	moveq #127,%d1
	moveq #63,%d3
	mov3q.l #2,-(%sp)
	and.l %d0,%d1
	lsr.l #7,%d0
	pea -140(%fp)
	pea 13.w
	and.l %d3,%d0
	move.b %d1,-140(%fp)
	move.b %d0,-139(%fp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1551
	move.l sq+404,%d0
	bclr #7,%d0
	move.l %d0,sq+404
.L1574:
	btst #4,%d0
	jeq .L1575
	lea sq+431,%a0
	lea sq+435,%a1
	move.b (%a0),-140(%fp)
	move.b (%a1),-139(%fp)
	mov3q.l #2,-(%sp)
	pea -140(%fp)
	mov3q.l #6,-(%sp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1551
	moveq #-17,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1575:
	btst #5,%d0
	jeq .L1576
	moveq #14,%d3
	moveq #127,%d4
	move.l sq+436,%d0
	move.l %d0,%d1
	lsr.l %d3,%d1
	mov3q.l #3,-(%sp)
	pea -140(%fp)
	mov3q.l #7,-(%sp)
	and.l %d4,%d1
	move.b %d1,-140(%fp)
	move.l %d0,%d1
	lsr.l #7,%d1
	and.l %d4,%d0
	and.l %d4,%d1
	move.b %d0,-138(%fp)
	move.b %d1,-139(%fp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1551
	moveq #-33,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1576:
	btst #6,%d0
	jeq .L1577
	move.l 1100784300,-(%sp)
	move.l %fp,%d3
	add.l #-140,%d3
	move.l %d3,-(%sp)
	jsr blk4
	addq.l #8,%sp
	mov3q.l #2,%d5
	cmp.l %d2,%d5
	jcc .L1578
	clr.l %d2
.L1578:
	move.b %d2,-136(%fp)
	moveq #127,%d6
	move.w 1079807124,%d0
	subq.l #1,%d0
	and.l %d6,%d0
	move.b %d0,-135(%fp)
	move.l sq+380,%d0
	cmp.l %d0,%d6
	jcc .L1579
	moveq #127,%d0
.L1579:
	mov3q.l #7,-(%sp)
	move.l %d3,-(%sp)
	pea 9.w
	move.b %d0,-134(%fp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1551
	moveq #-65,%d7
	and.l %d7,sq+404
	lea st+8,%a0
	move.l (%a0),sq+444
.L1577:
	move.l sq+360,%d0
	btst #8,%d0
	jeq .L1580
	moveq #127,%d1
	and.l %d1,%d0
.L1581:
	move.l #85760,%d3
	clr.l %d1
	muls.l %d3,%d0
	move.l ed+96,%d4
	move.l #85685,%d6
	lea ed,%a3
	lea ed+100,%a1
	move.l %d4,-156(%fp)
	move.l #85686,%d7
	move.l %a3,%a4
	move.l %d0,%a2
	move.l %d0,%a0
	add.l #1081989347,%a2
	add.l #1081990056,%a0
.L1587:
	move.l #85689,%d5
	moveq #12,%d0
	mvz.b (%a2,%d5.l),%d4
	cmp.l %d1,%d0
	jeq .L1582
	mvz.b (%a0),%d0
	move.b 2(%a0),%d3
.L1583:
	mvz.b %d3,%d3
	cmp.l (%a1),%d0
	jne .L1584
	cmp.l 52(%a1),%d3
	jne .L1584
	cmp.l 104(%a1),%d4
	jne .L1584
	moveq #12,%d2
	cmp.l %d1,%d2
	jne .L1585
	move.l #85685,%d2
	move.b (%a2,%d2.l),%d2
	move.l #85686,%a5
	mvz.b (%a2,%a5.l),%d5
	mvz.b %d2,%d2
	lsl.l #8,%d2
	or.l %d5,%d2
	cmp.l ed+256.l,%d2
	jeq .L1585
.L1584:
	move.l %d0,(%a1)
	moveq #12,%d0
	move.l %d3,52(%a1)
	move.l %d4,104(%a1)
	cmp.l %d1,%d0
	jne .L1586
	move.b (%a2,%d6.l),%d0
	mvz.b (%a2,%d7.l),%d2
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d2,%d0
	move.l %d0,ed+256
.L1586:
	tst.l -156(%fp)
	jeq .L1585
	mov3q.l #1,%d0
	lsl.l %d1,%d0
	or.l %d0,ed+260
.L1585:
	addq.l #1,%d1
	addq.l #4,%a1
	lea (917,%a0),%a0
	moveq #13,%d2
	cmp.l %d1,%d2
	jne .L1587
	move.b 1079807236,%d1
	moveq #127,%d3
	move.l #85760,%d0
	mov3q.l #1,ed+96
	and.l %d3,%d1
	muls.l %d1,%d0
	move.l %d0,%a1
	add.l #1081989344,%a1
	mvz.w #21441,%d0
	cmp.l ed+272.l,%d1
	jeq .L1588
	move.l %d1,ed+272
	clr.l ed+268
	clr.l ed+372
.L1588:
	move.l ed+268,%d2
	move.l %d2,%d3
	addq.l #1,%d3
	move.l %d3,%d1
	moveq #10,%d4
	lsl.l %d4,%d1
	cmp.l %d0,%d1
	jls .L1790
	move.l %d2,%d1
	move.l %d0,%d5
	lsl.l %d4,%d1
	sub.l %d1,%d5
.L1589:
	move.l %d2,%d1
	moveq #12,%d6
	lsl.l %d6,%d1
	clr.l %d4
	add.l %d1,%a1
	clr.l %d1
.L1590:
	move.l %d1,%d6
	addq.l #1,%d4
	add.l %d6,%d6
	subx.l %d6,%d6
	neg.l %d6
	move.l %d6,%a2
	lea (%a2,%d1.l*2),%a0
	move.l %a0,%d1
	add.l (%a1)+,%d1
	cmp.l %d4,%d5
	jne .L1590
	move.l ed+372,%d4
	move.l %d2,%a0
	lea (69,%a0),%a0
	btst %d2,%d4
	jeq .L1591
	cmp.l (%a4,%a0.l*4),%d1
	jeq .L1591
	mov3q.l #1,ed+376
.L1591:
	move.l %d1,(%a4,%a0.l*4)
	mov3q.l #1,%d1
	add.l #1023,%d0
	lsl.l %d2,%d1
	or.l %d4,%d1
	move.l %d1,ed+372
	moveq #10,%d1
	lsr.l %d1,%d0
	cmp.l %d3,%d0
	jhi .L1592
	clr.l %d3
.L1592:
	move.l %d3,ed+268
	move.l %fp,%d3
	clr.l %d2
	add.l #-148,%d3
.L1597:
	move.l ed+260,%d0
	btst %d2,%d0
	jeq .L1593
	moveq #12,%d5
	cmp.l %d2,%d5
	jne .L1791
	moveq #127,%d0
.L1594:
	move.b %d0,-148(%fp)
	move.l 100(%a3),%d0
	moveq #127,%d1
	moveq #127,%d6
	moveq #127,%d7
	and.l %d0,%d1
	lsr.l #7,%d0
	and.l %d6,%d0
	move.b %d1,-147(%fp)
	moveq #127,%d1
	move.b %d0,-146(%fp)
	moveq #127,%d0
	and.l 152(%a3),%d0
	move.b %d0,-145(%fp)
	moveq #127,%d0
	and.l 204(%a3),%d0
	move.b %d0,-144(%fp)
	move.l ed+256,%d0
	and.l %d0,%d1
	lsr.l #7,%d0
	and.l %d7,%d0
	move.b %d1,-143(%fp)
	move.b %d0,-142(%fp)
	moveq #12,%d0
	cmp.l %d2,%d0
	jeq .L1792
	mov3q.l #5,%d0
.L1595:
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	mov3q.l #4,-(%sp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1551
	mov3q.l #1,%d0
	lsl.l %d2,%d0
	addq.l #1,ed+264
	not.l %d0
	and.l %d0,ed+260
.L1593:
	addq.l #1,%d2
	addq.l #4,%a3
	moveq #13,%d1
	cmp.l %d2,%d1
	jne .L1597
.L1598:
	move.l ed+68,%d0
	cmp.l ed+64.l,%d0
	jne .L1599
	tst.l ed+92
	jeq .L1600
	lea ed+91,%a0
	move.b (%a0),-148(%fp)
	mov3q.l #1,-(%sp)
	pea -148(%fp)
	pea 12.w
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1551
	clr.l ed+92
.L1600:
	tst.l ed+376
	jeq .L1551
	move.l st+8,%d0
	sub.l ed+380,%d0
	lsr.l #2,%d0
	jeq .L1551
	move.b 1079807236,%d0
	moveq #127,%d2
	mov3q.l #1,-(%sp)
	pea -148(%fp)
	pea 11.w
	and.l %d2,%d0
	move.b %d0,-148(%fp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1551
	lea st+8,%a0
	clr.l ed+376
	move.l (%a0),ed+380
	addq.l #1,ed+384
	jra .L1551
.L1553:
	jsr (%a2)
	jra .L1554
.L1557:
	mvz.b %d0,%d0
	mvz.b %d2,%d2
	moveq #127,%d4
	lsl.l #8,%d0
	or.l %d2,%d0
	cmp.l %d0,%d4
	jge .L1558
.L1787:
	moveq #127,%d0
	jra .L1559
.L1788:
	moveq #127,%d0
	jra .L1569
.L1789:
	move.l %d2,%d0
	jra .L1571
.L1580:
	move.b 1079807236,%d0
	moveq #127,%d2
	and.l %d2,%d0
	jra .L1581
.L1582:
	move.l #85683,%d2
	move.b (%a2,%d2.l),%d0
	move.l #85684,%d3
	move.l #85690,%d5
	mvz.b (%a2,%d3.l),%d2
	move.b (%a2,%d5.l),%d3
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d2,%d0
	jra .L1583
.L1790:
	mvz.w #1024,%d5
	jra .L1589
.L1791:
	move.l %d2,%d0
	jra .L1594
.L1792:
	mov3q.l #7,%d0
	jra .L1595
.L1599:
	mov3q.l #7,%d2
	and.l %d2,%d0
	pea 8.w
	lsl.l #3,%d0
	add.l #ed,%d0
	move.l %d0,-(%sp)
	pea 10.w
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1551
	addq.l #1,ed+68
	addq.l #1,ed+76
	jra .L1598
.L1793:
	clr.l %d0
	lea sq+480,%a0
	lea ovp_col,%a1
.L1607:
	btst %d0,%d2
	jeq .L1608
	lea (%a0,%d0.l),%a2
	move.b (%a2),(%a1,%d0.l)
.L1608:
	addq.l #1,%d0
	mov3q.l #4,%d1
	cmp.l %d0,%d1
	jne .L1607
	move.l %d3,%d4
	clr.l %d3
	move.b %d2,ovp_on
	or.l %d2,%d4
	lea shp,%a2
	lea sq+480,%a4
	lea (-140,%fp),%a3
	lea rui_uart_raw,%a5
.L1613:
	btst %d3,%d4
	jeq .L1609
	moveq #-76,%d5
	moveq #43,%d0
	mov3q.l #1,%d6
	sub.l %d3,%d0
	move.b %d0,-139(%fp)
	move.l %d2,%d0
	lsr.l %d3,%d0
	sub.l %a0,%a0
	and.l %d6,%d0
	move.b %d5,-140(%fp)
.L1612:
	tst.l %d0
	jeq .L1610
	move.b (%a4,%d3.l),%d1
.L1611:
	move.b %d1,2(%a3,%a0.l)
	addq.l #1,%a0
	mov3q.l #4,%d7
	cmp.l %a0,%d7
	jne .L1612
	move.l %a3,-(%sp)
	mov3q.l #6,-(%sp)
	jsr (%a5)
	addq.l #8,%sp
.L1609:
	addq.l #1,%d3
	addq.l #4,%a2
	mov3q.l #4,%d0
	cmp.l %d3,%d0
	jne .L1613
	move.l #1100088672,-(%sp)
	jsr 1073746414
	clr.l sq+476
	addq.l #4,%sp
	jra .L1606
.L1610:
	move.b (%a2,%a0.l),%d1
	jra .L1611
.L1794:
	clr.l %d2
	jra .L1614
.L1795:
	moveq #111,%d3
	jra .L1615
.L1618:
	move.b %d3,ovt_col
	move.b %d2,%d4
	move.b %d2,ovt_on
	lea led_send4,%a0
	tst.l %d2
	jeq .L1619
	move.b %d3,-137(%fp)
	move.b %d3,-138(%fp)
	move.b %d3,-139(%fp)
	move.b %d3,-140(%fp)
	pea -140(%fp)
	pea 55.w
	jsr (%a0)
	addq.l #1,k44+12
.L2111:
	addq.l #4,%sp
	move.l #1100088672,(%sp)
	jsr 1073746414
	addq.l #4,%sp
	move.b %d4,k44+24
	move.b %d3,k44+25
	jra .L1617
.L1619:
	pea sht
	pea 55.w
	jsr (%a0)
	addq.l #1,k44+16
	jra .L2111
.L1626:
	move.b %d4,%d6
	moveq #127,%d0
	moveq #127,%d7
	and.l -2147457096,%d0
	ext.w %d6
	mulu.w #2531,%d0
	move.w %d6,%d1
	move.l %d0,%a0
	mulu.w #152,%d1
	add.l %d1,%a0
	add.l #1092966773,%a0
	mvz.b (%a0),%d0
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	jsr mr_vb
	addq.l #8,%sp
	mvz.b %d0,%d0
	cmp.l %d0,%d7
	jeq .L1625
	tst.b 60(%a2,%d3.l)
	jeq .L1628
	move.l st+8,%d0
	moveq #20,%d1
	sub.l (%a2,%d3.l*4),%d0
	cmp.l %d0,%d1
	jcc .L1629
.L1628:
	moveq #1,%d2
	jra .L1627
.L1629:
	lea 48(%a2,%d3.l),%a0
	move.b (%a0),77(%a2)
	jsr 1075312702
	move.l %d0,-(%sp)
	jsr 1074458688
	move.l %d3,-(%sp)
	move.l %d0,-(%sp)
	jsr 1074442802
	lea (12,%sp),%sp
	move.l %d0,%a4
	move.l 44(%a4),%a5
	tst.l %a5
	jeq .L1625
	move.l (%a5),%a0
	move.l %a5,-(%sp)
	move.l 40(%a0),%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l 32(%a5),%d1
	move.l %d0,%d3
	tst.l %d1
	jeq .L1630
	move.l %d1,%d5
	move.l %d1,%a0
	add.l #4752,%d5
	clr.l %d0
.L1634:
	mvz.b (%a0),%d7
	cmp.l #255,%d7
	jeq .L1632
	mvz.b 1(%a0),%d7
	cmp.l #255,%d7
	jeq .L1632
	addq.l #1,%d0
.L1632:
	lea (66,%a0),%a0
	cmp.l %d5,%a0
	jne .L1634
	mulu.w #5674,%d6
	move.l %d3,%a5
	move.l #1075599904,%a1
	add.l %d6,%a5
	mvz.b %d4,%d6
	move.l %d6,-160(%fp)
.L1639:
	mvz.b 3(%a1),%d7
	move.l %d1,%a0
.L1637:
	mvz.b (%a0),%d6
	cmp.l %d6,%d7
	jne .L1635
	mvz.b 1(%a0),%d6
	cmp.l -160(%fp),%d6
	jeq .L1636
.L1635:
	lea (66,%a0),%a0
	cmp.l %d5,%a0
	jne .L1637
	tst.b 5653(%a5)
	jne .L1784
	mov3q.l #1,%a0
	jra .L1785
.L1784:
	mov3q.l #2,%a0
.L1785:
	add.l %a0,%d0
	moveq #71,%d7
	cmp.l %d0,%d7
	jlt .L1796
.L1636:
	addq.l #4,%a1
	addq.l #1,%a5
	cmp.l #1075599920,%a1
	jne .L1639
.L1630:
	mvz.b -139(%fp),%d0
	moveq #21,%d5
	move.l %d0,-(%sp)
	mvz.b pc+77,%d0
	move.l %d0,-(%sp)
	move.l %a4,-(%sp)
	jsr 1074530058
	move.b %d4,%d0
	lea (12,%sp),%sp
	ext.w %d0
	mulu.w #5674,%d0
	add.l %d0,%d3
	move.l %d3,%a5
	lea (5632,%a5),%a5
.L1640:
	tst.b (%a5,%d5.l)
	sne %d0
	mvs.b %d0,%d0
	neg.l %d0
	move.l %d0,-(%sp)
	mvz.b -19(%a3,%d5.l),%d0
	lsl.l #8,%d0
	move.l %d0,-(%sp)
	mvz.b pc+77,%d0
	move.l %d5,-(%sp)
	addq.l #1,%d5
	move.l %d0,-(%sp)
	move.l %a4,-(%sp)
	jsr 1074529568
	lea (20,%sp),%sp
	moveq #25,%d0
	cmp.l %d5,%d0
	jne .L1640
	jra .L1627
.L1796:
	moveq #2,%d2
	jra .L1627
.L1645:
	mov3q.l #1,%d2
	cmp.l %d1,%d2
	jge .L1648
	moveq #1,%d3
	move.b %d3,mr+13
.L1649:
	move.l %a2,-(%sp)
	pea 12.w
	clr.l -(%sp)
	jsr mr_send
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1642
	sub.l %a0,%a0
.L1652:
	lea (%a2,%a0.l),%a1
	moveq #12,%d0
	move.b (%a1),(%a3,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d0
	jne .L1652
	move.w mr+16,%d0
	clr.b %d1
	addq.l #1,%d0
	move.b %d1,mr+13
	move.w %d0,mr+16
.L2112:
	jsr kit_tick
	jra .L1647
.L1648:
	clr.l %d2
	tst.b mr+13.l
	jne .L1649
.L1650:
	mvz.b (%a3,%d2.l),%d0
	mvz.b (%a2)+,%d1
	cmp.l %d1,%d0
	jeq .L1653
	move.l %d3,-(%sp)
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	jsr mr_send
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1642
	lea (-1,%a2),%a0
	move.b (%a0),(%a3,%d2.l)
	move.w mr+14,%d0
	addq.l #1,%d0
	move.w %d0,mr+14
.L1653:
	addq.l #1,%d2
	moveq #12,%d0
	cmp.l %d2,%d0
	jne .L1650
	jra .L2112
.L1659:
	mvz.b ux+3922,%d0
	move.l %d0,-(%sp)
	mvz.b ux+3921,%d0
	move.l %d0,-(%sp)
	mvz.b ux+3920,%d0
	move.l %d0,-(%sp)
	pea 72.w
	jsr send3
	lea (16,%sp),%sp
	tst.l %d0
	jeq .L1655
	move.l ux+3944,%d1
	mov3q.l #1,%d0
	lea ux+3920,%a0
.L1656:
	cmp.l %d0,%d1
	jhi .L1657
	subq.l #1,%d1
	move.l %d1,ux+3944
	addq.l #1,ux+32
.L1658:
	tst.l ux+3944
	jne .L1659
.L1660:
	move.l ux+3880,%d1
	cmp.l ux+3884.l,%d1
	jeq .L1655
	mov3q.l #7,%d2
	cmp.l ux+3944.l,%d2
	jcs .L1655
	mov3q.l #7,%d0
	and.l ux+3884,%d0
	lsl.l #2,%d0
	move.l %d0,%a2
	add.l #ux+3888,%a2
	move.b 1(%a2),%d6
	move.b (%a2),%d7
	mvz.b %d6,%d0
	mvz.b %d7,%d3
	move.l %d0,%a1
	moveq #127,%d0
	and.l -2147457096,%d0
	move.l %a1,%d4
	add.l #9,%d4
	mulu.w #2531,%d0
	move.l %d0,%a0
	add.l #1092966773,%a0
	move.w %d3,%d0
	mulu.w #152,%d0
	move.b (%a0,%d0.l),%d0
	mvz.b %d0,%d1
	move.w %d0,%a3
	move.l %d1,-(%sp)
	move.l %d4,-(%sp)
	move.l %a1,-164(%fp)
	move.l %d1,%a5
	jsr 1073770536
	addq.l #8,%sp
	move.l ux+3884,%a0
	move.l -164(%fp),%a1
	move.l %d0,%a4
	tst.l %d0
	jle .L1798
	mvz.b 2(%a2),%d2
	mvz.b 3(%a2),%d0
	lsl.l #8,%d2
	add.l %d0,%d0
	or.l %d0,%d2
	mov3q.l #7,%d0
	cmp.l %a1,%d0
	jlt .L1662
	move.l %a3,%d0
	add.l #-46,%d0
	mvz.b %d0,%d0
	mov3q.l #4,%d1
	cmp.l %d0,%d1
	jcc .L1663
	moveq #52,%d0
	cmp.l %a5,%d0
	jne .L1664
.L1663:
	cmp.l 1075595760.l,%a5
	jne .L1665
.L1664:
	tst.l %a1
	jne .L1667
.L1668:
	move.l %a0,%d1
	mov3q.l #7,%d0
	and.l %d0,%d1
	move.l %d5,%a0
	add.l %d1,%a0
	move.b 3952(%a0),%d0
	btst #0,%d0
	jeq .L1667
	move.l ls+60,%d0
	or.l ls+64,%d0
	jeq .L1667
	cmp.l ls+68.l,%d3
	jne .L1667
	move.l st+8,%d0
	moveq #20,%d1
	sub.l ls+72,%d0
	cmp.l %d0,%d1
	jcs .L1667
	move.l #1075599820,%a0
	move.l (%a0,%d4.l*4),%a3
	jsr 1075312702
	move.l %d0,-(%sp)
	jsr 1074458688
	move.l %d3,-(%sp)
	move.l %d0,-(%sp)
	jsr 1074442802
	lea (12,%sp),%sp
	move.l %d0,%a2
	move.l 44(%a2),%a5
	tst.l %a5
	jeq .L1667
	move.l (%a5),%a0
	move.l %a5,-(%sp)
	move.l 40(%a0),%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l 32(%a5),%d0
	tst.l %d0
	jeq .L1669
	move.l %d0,%a0
	add.l #4753,%d0
	move.l %d0,-156(%fp)
	move.w %a3,%d0
	addq.l #1,%a0
	sub.l %a4,%a4
	sub.l %a1,%a1
	mvz.b %d0,%d0
	move.l %d0,%a3
.L1674:
	mvz.b -1(%a0),%d1
	cmp.l #255,%d1
	jeq .L1671
	mvz.b (%a0),%d0
	cmp.l #255,%d0
	jeq .L1671
	addq.l #1,%a1
.L1671:
	cmp.l %d1,%a3
	jne .L1673
	mvz.b (%a0),%d1
	move.l %a4,%d0
	cmp.l %d1,%d3
	seq %d1
	mvs.b %d1,%d1
	neg.l %d1
	or.l %d1,%d0
	move.l %d0,%a4
.L1673:
	lea (66,%a0),%a0
	cmp.l -156(%fp),%a0
	jne .L1674
	tst.l %a4
	jne .L1669
	moveq #69,%d1
	cmp.l %a1,%d1
	jge .L1669
	moveq #3,%d0
	addq.l #1,ux+3964
.L1661:
	addq.l #1,ux+24
	jra .L1681
.L1657:
	addq.l #3,%a0
	move.b (%a0),-3(%a0)
	move.b 1(%a0),-2(%a0)
	move.b 2(%a0),-1(%a0)
	addq.l #1,%d0
	jra .L1656
.L1662:
	move.l %a5,%d0
	mov3q.l #2,%d1
	add.l #-48,%d0
	cmp.l %d0,%d1
	jcs .L1666
	mvz.b cu+1,%d0
	cmp.l %a5,%d0
	jne .L1665
.L1667:
	move.l %d4,-(%sp)
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	jsr 1074918394
	jsr 1075398168
	move.l %d2,-(%sp)
	move.l %a4,-(%sp)
	move.l %d3,-(%sp)
	move.l %d0,-(%sp)
	jsr 1073952092
	lea (28,%sp),%sp
	clr.b %d0
	addq.l #1,ux+20
	jra .L1681
.L1666:
	moveq #10,%d0
	cmp.l %a1,%d0
	jne .L1667
	moveq #45,%d1
	cmp.l %a5,%d1
	jeq .L1668
	moveq #43,%d0
	cmp.l %a5,%d0
	jeq .L1668
	jra .L1667
.L1669:
	move.l %a2,-(%sp)
	moveq #64,%d3
	jsr 1074529464
	addq.l #4,%sp
	move.l %d0,%a3
	cmp.l %d0,%d3
	jge .L1675
	move.w #64,%a3
.L1675:
	clr.l %d3
.L1676:
	cmp.l %a3,%d3
	jlt .L1680
	moveq #4,%d0
	clr.l ls+64
	clr.l ls+60
	addq.l #1,ux+3960
.L1681:
	move.l ux+3944,%a0
	lea (%a0,%a0.l*2),%a1
	addq.l #1,%a0
	move.l %a0,ux+3944
	addq.l #1,ux+3884
	add.l %d5,%a1
	move.b %d7,3920(%a1)
	move.b %d6,3921(%a1)
	move.b %d0,3922(%a1)
	jra .L1660
.L1680:
	moveq #31,%d0
	cmp.l %d3,%d0
	jlt .L1677
	move.l ls+60,%d1
	lsr.l %d3,%d1
.L1678:
	btst #0,%d1
	jeq .L1679
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	move.l %d3,-(%sp)
	move.l %a2,-(%sp)
	jsr 1074529568
	lea (20,%sp),%sp
	addq.l #1,ls+96
.L1679:
	addq.l #1,%d3
	jra .L1676
.L1677:
	move.l %d3,%d0
	add.l #-32,%d0
	move.l ls+64,%d1
	lsr.l %d0,%d1
	jra .L1678
.L1665:
	moveq #1,%d0
	jra .L1661
.L1798:
	moveq #2,%d0
	jra .L1661
.L1684:
	move.l #1075731444,%d5
	cmp.l sv+88.l,%d5
	jeq .L1683
	move.l st+8,%d0
	sub.l cu+16,%d0
	lsr.l #1,%d0
	jeq .L1683
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	jsr cu_tab
	addq.l #8,%sp
	move.l %d0,%a2
	tst.l %d0
	jeq .L1683
	move.l %d2,-(%sp)
	moveq #8,%d3
	jsr cu_setup
	lea (11,%a2),%a2
	addq.l #4,%sp
.L1687:
	move.l %d3,%a3
	move.l %d2,-(%sp)
	lea (9,%a3),%a3
	move.l %a3,-(%sp)
	jsr 1073770536
	addq.l #8,%sp
	move.l %d0,%d5
	tst.l %d0
	jle .L1685
	moveq #43,%d0
	cmp.l %d2,%d0
	jne .L1686
	moveq #10,%d1
	cmp.l %d3,%d1
	jne .L1686
	mvz.b cu+29,%d0
	moveq #45,%d7
	cmp.l %d0,%d7
	jeq .L1685
	moveq #43,%d1
	cmp.l %d0,%d1
	jeq .L1685
.L1686:
	mvz.b (%a2),%d7
	move.l %a3,-(%sp)
	move.l %d6,-(%sp)
	lsl.l #8,%d7
	move.l %d7,-(%sp)
	jsr 1074918394
	jsr 1075398168
	move.l %d7,-(%sp)
	move.l %d5,-(%sp)
	move.l %d6,-(%sp)
	move.l %d0,-(%sp)
	jsr 1073952092
	lea (28,%sp),%sp
.L1685:
	addq.l #1,%d3
	lea (16,%a2),%a2
	moveq #16,%d5
	cmp.l %d3,%d5
	jne .L1687
	addq.l #1,cu+20
	moveq #50,%d6
	cmp.l %d2,%d6
	jne .L1688
	addq.l #1,%d4
	lea st+8,%a0
	move.b %d4,cu+11
	move.l (%a0),cu+24
	jra .L1688
.L1700:
	addq.l #1,k44+32
.L1702:
	subq.l #2,%d0
	tst.l %d0
	jne .L1701
	clr.b %d7
	move.b %d7,k44+26
	jra .L1701
.L1699:
	mov3q.l #1,%d5
	cmp.l %d0,%d5
	jne .L1703
	addq.l #1,k44+4
	jra .L1701
.L1703:
	addq.l #1,k44+8
	jra .L1702
.L1704:
	tst.b dp+22.l
	jeq .L1705
	mvz.b dp+20,%d0
	cmp.l %d1,%d0
	jne .L1705
	mvz.b dp+21,%d0
	cmp.l %d5,%d0
	jne .L1705
.L1706:
	lea dp,%a3
	sub.l %a2,%a2
	lea dp+32,%a1
	move.l %a1,-156(%fp)
	move.l %a3,%a4
.L1718:
	moveq #43,%d0
	cmp.l %d5,%d0
	jeq .L1804
	moveq #127,%d0
	moveq #127,%d1
	and.l -2147457096,%d0
	mulu.w #2531,%d0
	move.l %d0,%a0
	add.l %d4,%a0
	mvz.w %a2,%d0
	add.l #1092966707,%a0
	move.b (%a0,%d0.l*2),%d3
	and.l %d1,%d3
.L1711:
	move.l %d5,-(%sp)
	pea 9(%a2)
	jsr 1073770536
	addq.l #8,%sp
	tst.l %d0
	jgt .L1712
	clr.l -148(%fp)
.L1713:
	move.b -148(%fp),%d7
	move.b -147(%fp),%d0
	mvz.b %d3,%d6
	move.b -146(%fp),%d1
	move.w %d7,%a1
	mvz.b 24(%a4),%d7
	move.w %d0,%a0
	move.b -145(%fp),%d0
	cmp.l %d7,%d6
	jne .L1716
	move.l -156(%fp),%a5
	mvs.b %a1,%d6
	mvs.b (%a5),%d7
	cmp.l %d7,%d6
	jne .L1716
	mvs.b 1(%a5),%d7
	mvs.b %a0,%d6
	cmp.l %d7,%d6
	jne .L1716
	mvs.b 2(%a5),%d7
	mvs.b %d1,%d6
	cmp.l %d7,%d6
	jne .L1716
	mvs.b 3(%a5),%d7
	mvs.b %d0,%d6
	cmp.l %d7,%d6
	jeq .L1717
.L1716:
	move.b %d3,24(%a4)
	move.w %a1,%d3
	move.l -156(%fp),%a5
	moveq #1,%d6
	move.b %d1,2(%a5)
	move.b %d0,3(%a5)
	move.b %d3,(%a5)
	move.w %a0,%d3
	move.b %d3,1(%a5)
	move.b %d6,dp+23
.L1717:
	addq.l #1,%a2
	addq.l #4,-156(%fp)
	addq.l #1,%a4
	moveq #8,%d7
	cmp.l %a2,%d7
	jne .L1718
	tst.b dp+23.l
	jeq .L1693
	move.w #18689,%a1
	moveq #3,%d0
	move.b %d2,-133(%fp)
	move.l #-260222380,%a0
	move.l %fp,%d1
	add.l #-140,%d1
	move.l %a0,-140(%fp)
	lea dp+24,%a2
	move.w %a1,-136(%fp)
	move.b %d0,-134(%fp)
	move.l %d1,%a1
	moveq #9,%d0
	addq.l #8,%a1
.L1720:
	move.b (%a2)+,(%a1)
	mov3q.l #1,%a0
.L1719:
	lea 31(%a3,%a0.l),%a4
	mov3q.l #5,%d2
	move.b (%a4),(%a1,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d2
	jne .L1719
	addq.l #5,%a1
	addq.l #5,%d0
	addq.l #4,%a3
	moveq #49,%d3
	cmp.l %d0,%d3
	jne .L1720
	moveq #-9,%d4
	pea 49.w
	move.l %d1,-(%sp)
	move.b %d4,-92(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1693
	clr.b %d5
	addq.l #1,dp+16
	move.b %d5,dp+23
.L1693:
	tst.l st
	jeq .L1689
.L1690:
	mov3q.l #1,%d6
	cmp.l 1094562388.l,%d6
	jne .L1689
	tst.l st+968
	jeq .L1689
	move.b 1079807565,%d2
	mvs.b %d2,%d0
	lsr.l #7,%d0
	jne .L1806
	addq.l #1,%d2
.L1721:
	move.l pj+160,%d0
	cmp.l pj+156.l,%d0
	jeq .L1725
	move.l pj+156,%d3
	sub.l %d0,%d3
	clr.l -(%sp)
	move.l %d3,%d0
	cmp.l #16383,%d3
	jls .L1723
	mvz.w #16383,%d0
.L1723:
	move.l %d0,-(%sp)
	mov3q.l #6,-(%sp)
	jsr pj_send
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1755
	moveq #2,%d0
	add.l %d3,pj+160
	move.w %d0,pj+180
.L1725:
	move.l pj,%d1
	cmp.l pj+4.l,%d1
	jne .L1726
	tst.b pj+139.l
	jeq .L1727
	mvz.b pj+138,%d1
	mvz.b %d2,%d0
	cmp.l %d1,%d0
	jeq .L1728
.L1727:
	clr.l %d0
.L1729:
	move.l #1081903571,%a0
	lea pj-1081903431,%a1
.L1730:
	tst.l %d0
	jne .L1732
.L1733:
	move.l st+968,%d6
	cmp.l pj+164.l,%d6
	jeq .L1750
	moveq #2,%d7
	move.w %d7,pj+180
.L1750:
	clr.b %d0
	move.w #19201,%a1
	move.l #-260222380,%a0
	move.l %a0,-140(%fp)
	sub.l %a0,%a0
	move.b %d0,-134(%fp)
	mvz.b %d2,%d0
	lsr.l #7,%d0
	move.w %a1,-136(%fp)
	lea (-140,%fp),%a1
	move.b %d0,-133(%fp)
	moveq #127,%d0
	and.l %d2,%d0
	move.b %d0,-132(%fp)
.L1751:
	move.l #1081903571,%a2
	add.l %a0,%a2
	tst.b (%a2)
	jeq .L1752
	move.b (%a2),%d0
	moveq #127,%d1
	moveq #15,%d3
	and.l %d1,%d0
	move.b %d0,9(%a1,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d3
	jne .L1751
.L1752:
	moveq #-9,%d4
	lea (%fp,%a0.l),%a2
	move.b %d4,-131(%a2)
	pea 10(%a0)
	move.l %a1,-(%sp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1755
	moveq #1,%d5
	move.b %d2,pj+138
	lea st+968,%a0
	lea st+8,%a1
	move.l (%a0),pj+164
	move.l (%a1),pj+168
	move.l #1081903571,%a0
	lea pj-1081903431,%a1
	move.b %d5,pj+139
.L1754:
	move.b (%a0),(%a1,%a0.l)
	addq.l #1,%a0
	cmp.l #1081903587,%a0
	jne .L1754
	addq.l #1,pj+176
	jra .L1755
.L1800:
	sub.l %a0,%a0
	jra .L1707
.L1801:
	clr.l %d0
	jra .L1708
.L1803:
	clr.l %d0
.L2113:
	clr.b %d6
	jra .L1709
.L1804:
	clr.b %d3
	jra .L1711
.L1712:
	moveq #52,%d6
	muls.l %d6,%d0
	move.l #1075575112,%a0
	move.l (%a0,%d0.l),%a1
	clr.l -148(%fp)
	move.l %a1,%d0
	sub.l %a0,%a0
	add.l #-1073741824,%d0
	cmp.l #67108863,%d0
	jhi .L1713
.L1714:
	moveq #125,%d6
	move.b (%a1,%a0.l),%d1
	move.l %d1,%d0
	subq.l #1,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d6
	jcs .L1713
	lea (-148,%a0),%a5
	mov3q.l #4,%d0
	move.b %d1,(%a5,%fp.l)
	addq.l #1,%a0
	cmp.l %a0,%d0
	jne .L1714
	jra .L1713
.L1806:
	clr.b %d2
	jra .L1721
.L1726:
	moveq #31,%d0
	and.l pj+4,%d0
	lsl.l #2,%d0
	move.l %d0,%a0
	add.l #pj+8,%a0
	mvz.b 2(%a0),%d0
	move.l %d0,-(%sp)
	mvz.b 1(%a0),%d0
	move.l %d0,-(%sp)
	mvz.b (%a0),%d0
	move.l %d0,-(%sp)
	jsr pj_send
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1755
	addq.l #1,pj+4
	addq.l #1,pj+172
	jra .L1725
.L1728:
	move.l st+968,%d3
	cmp.l pj+164.l,%d3
	jne .L1727
	move.l st+8,%d0
	moveq #99,%d4
	sub.l pj+168,%d0
	cmp.l %d0,%d4
	scc %d0
	mvs.b %d0,%d0
	neg.l %d0
	jra .L1729
.L1732:
	move.b (%a0),%d3
	move.b (%a0,%a1.l),%d1
	addq.l #1,%a0
	move.l %d3,%d0
	eor.l %d1,%d0
	tst.b %d0
	seq %d0
	mvs.b %d0,%d0
	neg.l %d0
	cmp.l #1081903587,%a0
	jne .L1730
	mvz.b %d3,%d3
	mvz.b %d1,%d1
	cmp.l %d3,%d1
	jne .L1733
	tst.b pj+181.l
	jeq .L1755
	move.l 1100949640,%d0
	mov3q.l #3,%d1
	and.l %d0,%d1
	tst.l %d1
	jne .L1734
	move.l %d0,%d1
	add.l #-1073741824,%d1
	cmp.l #129892351,%d1
	jhi .L1734
	move.l %d0,%a0
	add.l #1073744908,%d1
	lea (12,%a0),%a0
	move.l %a0,%a1
.L1737:
	mvz.b (%a1),%d0
	lsr.l #1,%d0
	jeq .L1735
.L1734:
	mvz.w #16383,%d0
	clr.l %d3
.L1736:
	clr.l -(%sp)
	move.l %d0,-(%sp)
	pea 9.w
	jsr pj_send
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1755
	addq.l #1,pj+184
	tst.l %d3
	jeq .L1741
	move.b pj+181,%d0
	mvz.b %d0,%d1
	lsr.l #1,%d1
	jeq .L1741
	clr.b %d7
	subq.l #1,%d0
	move.b %d0,pj+181
	move.b %d7,pj+180
.L1755:
	tst.l st
	jeq .L1759
	mov3q.l #1,%d3
	cmp.l 1094562388.l,%d3
	jne .L1760
	tst.l st+968
	jeq .L1760
	move.l st+44,%d1
	move.l txsx_over,%d0
	cmp.l kd_drop.l,%d1
	jne .L1761
	cmp.l kd_over.l,%d0
	jeq .L1762
.L1761:
	move.l st+8,%a0
	moveq #19,%d4
	sub.l kd_t,%a0
	cmp.l %a0,%d4
	jcc .L1762
	cmp.l #16383,%d1
	jls .L1763
	mvz.w #16383,%d1
.L1763:
	cmp.l #16383,%d0
	jls .L1764
	mvz.w #16383,%d0
.L1764:
	move.l %d1,%d2
	moveq #127,%d7
	and.l %d7,%d1
	move.w #19713,%d6
	lsr.l #7,%d2
	pea 11.w
	move.l #-260222380,%d5
	pea -140(%fp)
	move.l %d5,-140(%fp)
	move.b %d2,-134(%fp)
	move.b %d1,-133(%fp)
	move.l %d0,%d1
	lsr.l #7,%d1
	and.l %d7,%d0
	move.w %d6,-136(%fp)
	move.b %d1,-132(%fp)
	move.b %d0,-131(%fp)
	moveq #-9,%d0
	move.b %d0,-130(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1762
	lea st+44,%a0
	lea txsx_over,%a1
	lea st+8,%a2
	move.l (%a0),kd_drop
	move.l (%a1),kd_over
	move.l (%a2),kd_t
.L1762:
	tst.l st
	jeq .L1759
.L1760:
	mov3q.l #1,%d0
	cmp.l 1094562388.l,%d0
	jne .L1765
	tst.l st+968
	jeq .L1765
	jsr 1075312702
	move.l %d0,%d2
	add.l #352,%d2
	move.l %d2,-(%sp)
	move.l %d0,%a2
	jsr 1074425250
	addq.l #4,%sp
	tst.l qp+100
	jeq .L1766
	cmp.l #4095,%d0
	jle .L1767
	mvz.w #4095,%d0
.L1768:
	move.l 352(%a2),%a0
	lea qp,%a3
	move.l %d0,(%a3)
	move.l %d2,-(%sp)
	move.l 52(%a0),%a0
	mov3q.l #1,qp+4
	jsr (%a0)
	addq.l #4,%sp
	tst.l %d0
	jeq .L1769
	move.l %d0,%a0
	moveq #11,%d0
	mvz.b 2430(%a0),%d2
	cmp.l %d2,%d0
	jcc .L1770
.L1769:
	clr.l %d2
.L1771:
	move.w #11521,%d3
	move.l #-260222380,%d1
	move.l %d1,-140(%fp)
	move.w %d3,-136(%fp)
	cmp.l qp+44.l,%d2
	jne .L1772
	tst.l qp+48
	jeq .L1773
.L1772:
	moveq #15,%d4
	moveq #-9,%d5
	pea 9.w
	pea -140(%fp)
	move.b %d2,-133(%fp)
	move.b %d4,-134(%fp)
	move.b %d5,-132(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1766
	move.l %d2,qp+44
	clr.l qp+48
	addq.l #1,qp+52
.L1773:
	move.l %fp,%d2
	add.l #-140,%d2
	jra .L1774
.L1735:
	lea (24,%a1),%a1
	cmp.l %d1,%a1
	jne .L1737
	move.b pj+180,%d0
	move.l %a0,%d3
	tst.b %d0
	jge .L1738
	clr.l %d0
.L1739:
	tst.b (%a0)
	sne %d2
	lea (24,%a0),%a0
	mvs.b %d2,%d2
	sub.l %d2,%d0
	cmp.l %d1,%a0
	jne .L1739
	jra .L1736
.L1741:
	clr.b %d0
	move.b %d0,pj+181
	jra .L1755
.L1738:
	move.l #-260222380,%d1
	addq.l #1,%d0
	move.l %d1,-140(%fp)
	moveq #127,%d4
	mvz.b %d0,%d1
	moveq #8,%d3
	and.l %d4,%d0
	asr.l #7,%d1
	move.w #19201,%d2
	move.b %d1,-133(%fp)
	clr.l %d1
	move.b %d3,-134(%fp)
	move.b %d0,-132(%fp)
	move.b %d3,-131(%fp)
	move.w %d2,-136(%fp)
	move.l %fp,%d2
	add.l #-140,%d2
	move.l %d2,%a2
	lea (10,%a2),%a2
.L1749:
	mvz.b pj+180,%d0
	sub.l %a3,%a3
	add.l %d1,%d0
	muls.w #24,%d0
	lea (%a0,%d0.l),%a1
	tst.b (%a1)
	sne %d0
	neg.l %d0
	move.b %d0,(%a2)
.L1743:
	move.b (%a1),%d0
	jeq .L1742
	move.b 8(%a1,%a3.l),%d0
	moveq #127,%d5
	and.l %d5,%d0
.L1742:
	addq.l #1,%a3
	move.b %d0,(%a2,%a3.l)
	moveq #15,%d6
	cmp.l %a3,%d6
	jne .L1743
	sub.l %a1,%a1
.L1744:
	move.l %a1,%a3
	addq.l #1,%a1
	tst.b (%a2,%a1.l)
	jne .L1746
.L1747:
	moveq #15,%d3
	cmp.l %a3,%d3
	jeq .L1745
	clr.b %d0
	addq.l #1,%a3
	move.b %d0,(%a2,%a3.l)
	jra .L1747
.L1746:
	moveq #15,%d7
	cmp.l %a1,%d7
	jne .L1744
.L1745:
	addq.l #1,%d1
	lea (16,%a2),%a2
	moveq #8,%d4
	cmp.l %d1,%d4
	jne .L1749
	moveq #-9,%d5
	pea 139.w
	move.l %d2,-(%sp)
	move.b %d5,-2(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1755
	move.b pj+180,%d0
	addq.l #8,%d0
	move.b %d0,pj+180
	jra .L1755
.L1689:
	lea pj,%a0
	move.l (%a0),%d0
.L1756:
	cmp.l pj+4.l,%d0
	jeq .L1755
	moveq #31,%d1
	moveq #10,%d2
	and.l pj+4,%d1
	mvz.b 8(%a0,%d1.l*4),%d1
	cmp.l %d1,%d2
	jeq .L1757
	addq.l #1,pj+156
.L1757:
	addq.l #1,pj+4
	jra .L1756
.L1767:
	tst.l %d0
	jge .L1768
	clr.l %d0
	jra .L1768
.L1770:
	addq.l #1,%d2
	jra .L1771
.L1775:
	mov3q.l #3,%d7
	and.l %d7,%d0
	moveq #16,%d6
	lea 64(%a3,%d0.l*2),%a0
	lea 65(%a3,%d0.l*2),%a1
	moveq #-9,%d0
	move.b %d6,-134(%fp)
	move.b (%a0),-133(%fp)
	move.b (%a1),-132(%fp)
	pea 10.w
	move.l %d2,-(%sp)
	move.b %d0,-131(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1766
	addq.l #1,qp+60
.L1774:
	move.l qp+60,%d0
	cmp.l qp+56.l,%d0
	jne .L1775
	move.l qp+92,%d1
	cmp.l qp+96.l,%d1
	jeq .L1766
	move.l qp+92,%d2
	moveq #16,%d3
	move.w #503,%d4
	move.l qp+88,%d0
	pea 10.w
	pea -140(%fp)
	move.b %d0,-133(%fp)
	move.b %d3,-134(%fp)
	move.w %d4,-132(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1766
	move.l %d2,qp+96
.L1766:
	tst.l st
	jeq .L1759
.L1765:
	mov3q.l #1,%d5
	cmp.l 1094562388.l,%d5
	jne .L1759
	tst.l st+968
	jeq .L1759
	move.l pmo+64,%d2
	tst.l qp+100
	jeq .L1759
	move.w #11521,%d7
	move.l #-260222380,%d6
	move.l %d6,-140(%fp)
	move.w %d7,-136(%fp)
	cmp.l pmo+124.l,%d2
	jeq .L1777
	moveq #17,%d0
	moveq #127,%d1
	move.b %d0,-134(%fp)
	move.l pmo,%d0
	cmp.l %d0,%d1
	jcc .L1778
	moveq #127,%d0
.L1778:
	move.b %d0,-133(%fp)
	move.l pmo+4,%d0
	cmp.l #16383,%d0
	jls .L1779
	mvz.w #16383,%d0
.L1779:
	move.l %d0,%d1
	moveq #127,%d3
	and.l %d3,%d0
	lsr.l #7,%d1
	move.b %d1,-132(%fp)
	move.b %d0,-131(%fp)
	move.l pmo+8,%d0
	cmp.l #16383,%d0
	jls .L1780
	mvz.w #16383,%d0
.L1780:
	move.l %d0,%d1
	moveq #127,%d4
	and.l %d4,%d0
	lsr.l #7,%d1
	move.b %d1,-130(%fp)
	move.b %d0,-129(%fp)
	move.l pmo+12,%d0
	cmp.l %d0,%d4
	jcc .L1781
	moveq #127,%d0
.L1781:
	move.b %d0,-128(%fp)
	lea fp,%a0
	tst.l pmo+52
	jeq .L1807
	move.l (%a0),%d1
	sub.l pmo+108,%d1
	cmp.l #1499,%d1
	sls %d1
	neg.l %d1
.L1782:
	move.l (%a0),%d0
	mov3q.l #1,%d5
	moveq #-9,%d6
	pea 15.w
	sub.l pmo+112,%d0
	pea -140(%fp)
	cmp.l %d0,%d5
	scc %d0
	move.b %d6,-126(%fp)
	neg.l %d0
	add.l %d0,%d0
	or.l %d1,%d0
	move.b %d0,-127(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1759
	move.l %d2,pmo+124
.L1777:
	move.l pmo+16,%d2
	cmp.l pmo+128.l,%d2
	jeq .L1759
	move.l st+8,%d0
	moveq #19,%d7
	sub.l pmo+132,%d0
	cmp.l %d0,%d7
	jcc .L1759
	moveq #16,%d0
	move.w #759,%a1
	lea pmo+123,%a0
	move.b (%a0),-133(%fp)
	pea 10.w
	pea -140(%fp)
	move.b %d0,-134(%fp)
	move.w %a1,-132(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1759
	lea st+8,%a2
	move.l %d2,pmo+128
	move.l (%a2),pmo+132
.L1759:
	move.l -66650100,%d0
	addq.l #1,st+336
	sub.l -152(%fp),%d0
	add.l %d0,st+328
	cmp.l st+332.l,%d0
	jls .L1480
	move.l %d0,st+332
.L1480:
	movem.l -204(%fp),#15612
	unlk %fp
	rts
.L1807:
	clr.b %d1
	jra .L1782
	.size	rui_tick, .-rui_tick
	.text
.LC6:
	.string	"%s"
	.text
	.align	2
	.globl	rui_draw
	.type	rui_draw, @function
rui_draw:
	lea (-248,%sp),%sp
	movem.l #31996,(%sp)
	move.l 252(%sp),%a2
	move.l -66650100,%d1
	move.l st+1082,%d0
	move.l 16(%a2),%d3
	move.l %d1,60(%sp)
	tst.l %d0
	jeq .L2115
	sub.l st+8,%d0
	tst.l %d0
	jgt .L2116
.L2115:
	clr.l 44(%sp)
.L2117:
	move.l 16(%a2),%a2
	move.l %a2,52(%sp)
	tst.l st+4
	jne .L2119
	tst.l st+972
	jne .L2120
	tst.b sv+8.l
	jne .L2120
	tst.l 44(%sp)
	jeq .L2122
	jra .L2154
.L2116:
	move.l %d3,%a0
	move.l %d3,%d0
	addq.l #6,%a0
	lea (108,%sp),%a1
	add.l #566,%d0
.L2118:
	move.b 1(%a0),(%a1)
	addq.l #8,%a0
	move.b -8(%a0),1(%a1)
	addq.l #2,%a1
	cmp.l %a0,%d0
	jne .L2118
	mov3q.l #1,44(%sp)
	jra .L2117
.L2119:
	tst.l st+1058
	jne .L2122
	move.l commits,%a6
	cmp.l st+24.l,%a6
	jne .L2124
	move.l 52(%sp),%a0
	move.l %a0,%d0
	add.l #1024,%d0
.L2125:
	clr.l (%a0)+
	cmp.l %a0,%d0
	jne .L2125
	move.l %a6,st+20
.L2126:
	tst.l 44(%sp)
	jeq .L2122
	tst.l st+4
	jne .L2150
	tst.l st+972
	jne .L2151
.L2154:
	tst.b sv+8.l
	jne .L2151
.L2122:
	move.l -66650100,%d0
	addq.l #1,st+336
	sub.l 60(%sp),%d0
	add.l %d0,st+328
	cmp.l st+332.l,%d0
	jls .L2114
	move.l %d0,st+332
.L2114:
	movem.l (%sp),#31996
	lea (248,%sp),%sp
	rts
.L2120:
	move.l commits,%a6
.L2124:
	cmp.l st+340.l,%a6
	jne .L2127
	tst.l st+344
	jeq .L2128
.L2127:
	move.l -66650100,%d2
	move.l sh_seq,%d4
	lea copy32,%a2
	move.l %d2,64(%sp)
	btst #0,%d4
	jne .L2129
	pea 256.w
	pea shadow
	pea comp_in
	jsr (%a2)
	pea 704.w
	pea txt_sh
	pea (tl.0)
	jsr (%a2)
	lea (24,%sp),%sp
	cmp.l sh_seq.l,%d4
	jne .L2129
	pea 256.w
	pea comp_in
	pea comp
	jsr (%a2)
	lea (12,%sp),%sp
	tst.l st+872
	jne .L2130
	clr.l -(%sp)
	pea comp
	pea 64.w
	pea 128.w
	pea st+872
	jsr 1074198978
	lea (20,%sp),%sp
.L2130:
	lea (tl.0),%a2
	clr.l %d5
.L2143:
	tst.b 4(%a2)
	jeq .L2131
	move.l %a2,%d4
	clr.l %d7
	addq.l #8,%d4
	lea st+408,%a5
	lea st+552,%a0
.L2142:
	tst.l (%a5)+
	jeq .L2133
	mvz.b (%a0),%d0
	cmp.l %d0,%d5
	jne .L2133
	lea st+472,%a1
	mvz.b 5(%a0),%d1
	mvz.b (%a1,%d7.l),%d4
	lea (6,%a0),%a3
	sub.l %a1,%a1
.L2135:
	cmp.l %d1,%a1
	jlt .L2136
	move.b 4(%a0),%d0
	lea 72(%sp,%d1.l),%a3
	btst #1,%d0
	jeq .L2155
	move.l %d4,%d0
	add.l #-64,%d0
	move.l %d0,56(%sp)
	tst.l %d0
	jle .L2138
	move.b #43,(%a3)
	addq.l #1,%d1
	lea 72(%sp,%d1.l),%a3
.L2156:
	sub.l %a1,%a1
	jra .L2137
.L2136:
	lea (%a3,%a1.l),%a4
	move.b (%a4),72(%sp,%a1.l)
	addq.l #1,%a1
	jra .L2135
.L2138:
	tst.l 56(%sp)
	jeq .L2156
	move.b #45,(%a3)
	moveq #64,%d2
	mov3q.l #1,%a1
	sub.l %d4,%d2
	move.l %d2,56(%sp)
.L2137:
	lea (68,%sp),%a4
	clr.l %d4
.L2140:
	move.l 56(%sp),%d6
	moveq #10,%d0
	addq.l #1,%d4
	rems.l %d0,%d2:%d6
	divs.l %d0,%d6
	add.l #48,%d2
	move.b %d2,(%a4)
	move.l %d6,56(%sp)
	tst.l %d6
	jeq .L2139
	addq.l #1,%a4
	mov3q.l #4,%d6
	cmp.l %d4,%d6
	jne .L2140
.L2139:
	add.l %a1,%a3
	move.l %d4,%d0
.L2141:
	subq.l #1,%d0
	move.b 68(%sp,%d0.l),(%a3)+
	tst.l %d0
	jne .L2141
	mvz.w #248,%d0
	add.l %sp,%d0
	add.l %d1,%d0
	add.l %d4,%d0
	add.l %d0,%a1
	clr.b %d0
	move.l %sp,%d4
	add.l #72,%d4
	move.b %d0,-176(%a1)
.L2133:
	addq.l #1,%d7
	lea (20,%a0),%a0
	moveq #16,%d1
	cmp.l %d7,%d1
	jne .L2142
	mvz.b 2(%a2),%d0
	lsl.l #3,%d0
	add.l #1098790940,%d0
	move.l %d0,-(%sp)
	jsr 1074207612
	addq.l #4,%sp
	move.l %d0,%a0
	moveq #64,%d0
	mvz.w 6(%a0),%d1
	sub.l %d1,%d0
	mvz.b 1(%a2),%d1
	sub.l %d1,%d0
	mvz.w 4(%a0),%d1
	cmp.l %d0,%d1
	jgt .L2131
	move.b 3(%a2),%d1
	move.l %d4,-(%sp)
	pea .LC6
	move.l %d4,-(%sp)
	mov3q.l #1,%d2
	mov3q.l #3,%d6
	move.l %d1,%d4
	lsr.l #2,%d4
	and.l %d1,%d6
	and.l %d4,%d2
	move.l %d2,-(%sp)
	move.l %d6,-(%sp)
	move.l %d0,-(%sp)
	mvz.b (%a2),%d0
	move.l %d0,-(%sp)
	move.l %a0,-(%sp)
	pea st+872
	jsr 1074205920
	lea (36,%sp),%sp
	addq.l #1,st+352
.L2131:
	addq.l #1,%d5
	lea (44,%a2),%a2
	moveq #64,%d0
	cmp.l %d5,%d0
	jne .L2143
	move.l -66650100,%d0
	move.l %a6,st+340
	addq.l #1,st+348
	sub.l 64(%sp),%d0
	add.l %d0,st+356
	cmp.l st+360.l,%d0
	jls .L2144
	move.l %d0,st+360
.L2144:
	clr.l st+344
.L2128:
	pea 256.w
	pea comp
	move.l 60(%sp),-(%sp)
	jsr copy32
	lea (12,%sp),%sp
	cmp.l st+20.l,%a6
	jeq .L2145
	move.l -66650100,%d0
	addq.l #1,st+308
	sub.l t_commit,%d0
	add.l %d0,st+304
	cmp.l st+312.l,%d0
	jls .L2145
	move.l %d0,st+312
.L2145:
	move.l st+388,%d1
	tst.l %d1
	jeq .L2146
	cmp.l st+392.l,%a6
	jeq .L2146
	move.l -66650100,%d0
	sub.l %d1,%d0
	add.l %d0,st+396
	addq.l #1,st+400
	cmp.l st+404.l,%d0
	jls .L2147
	move.l %d0,st+404
.L2147:
	clr.l st+388
.L2146:
	move.l st+368,%d1
	tst.l %d1
	jeq .L2148
	move.l -66650100,%d0
	sub.l %d1,%d0
	add.l %d0,st+372
	addq.l #1,st+376
	cmp.l st+380.l,%d0
	jls .L2149
	move.l %d0,st+380
.L2149:
	clr.l st+368
.L2148:
	move.l %a6,st+20
	move.l -66650100,%d0
	move.l %d0,st+56
	sub.l t_commit,%d0
	addq.l #1,st+28
	move.l %d0,st+60
	jra .L2126
.L2155:
	move.l %d4,56(%sp)
	jra .L2156
.L2129:
	pea 256.w
	pea comp
	move.l 60(%sp),-(%sp)
	addq.l #1,st+32
	jsr (%a2)
	lea (12,%sp),%sp
	jra .L2126
.L2150:
	tst.l st+1058
	jne .L2122
.L2151:
	move.l %d3,%a0
	add.l #566,%d3
	lea (108,%sp),%a1
	addq.l #6,%a0
.L2152:
	move.b (%a0),%d0
	move.b (%a1),1(%a0)
	moveq #-2,%d1
	mov3q.l #1,%d2
	addq.l #2,%a1
	addq.l #8,%a0
	and.l %d1,%d0
	move.b -1(%a1),%d1
	and.l %d2,%d1
	or.l %d1,%d0
	move.b %d0,-8(%a0)
	cmp.l %d3,%a0
	jne .L2152
	jra .L2122
	.size	rui_draw, .-rui_draw
	.align	2
	.globl	rui_key
	.type	rui_key, @function
rui_key:
	lea (-100,%sp),%sp
	movem.l #31996,(%sp)
	move.l 108(%sp),%a4
	move.l -66650100,%d1
	move.l 104(%sp),%a3
	move.l 12(%a4),%d4
	move.l %d4,%d2
	mvz.b %d2,%d2
	move.l %d1,64(%sp)
	mov3q.l #1,%d1
	and.l 16(%a4),%d1
	cmp.l #178,%d2
	jne .L2180
	cmp.l ed+88.l,%d1
	jeq .L2180
	move.l %d1,ed+88
	mov3q.l #1,ed+92
.L2180:
	move.l 16(%a4),%d0
	move.l %d1,%d3
	lsl.l #8,%d3
	lea st,%a2
	lsl.l #8,%d0
	and.l #65024,%d0
	or.l %d3,%d0
	or.l %d2,%d0
	move.l %d0,st+72
	tst.l %d1
	jne .L2181
	moveq #66,%d5
	cmp.l %d2,%d5
	jne .L2182
	tst.b k44+20.l
	jeq .L2183
	clr.b %d6
	move.b %d6,k44+20
	tst.b k44+22.l
	jeq .L2183
	moveq #2,%d7
	move.w %d7,k44+22
.L2183:
	clr.l u46
	tst.b u46+48.l
	jeq .L2184
	clr.b %d0
	move.b %d0,u46+48
.L2191:
	mov3q.l #1,%d0
.L2185:
	move.l -66650100,%d1
	addq.l #1,st+336
	sub.l 64(%sp),%d1
	add.l %d1,st+328
	cmp.l st+332.l,%d1
	jls .L2179
	move.l %d1,st+332
.L2179:
	movem.l (%sp),#31996
	lea (100,%sp),%sp
	rts
.L2182:
	cmp.l #134,%d2
	jne .L2186
	clr.l tk
	tst.l tk+8
	jeq .L2184
	move.l st+248,%d0
	clr.l tk+8
	btst #6,%d0
	jeq .L2187
	moveq #-65,%d1
	and.l %d0,%d1
	move.l %d1,st+248
	tst.l st+4
	jne .L2496
.L2187:
	clr.l %d0
	jra .L2185
.L2186:
	move.l %d2,%d0
	add.l #-68,%d0
	lsr.l #1,%d0
	jne .L2184
	moveq #31,%d1
	mov3q.l #1,%d0
	and.l %d4,%d1
	lsl.l %d1,%d0
	and.l st+208,%d0
	tst.l %d0
	jeq .L2189
	move.l st+200,%d3
	move.l %d3,%d5
	move.l st+220,%d1
	move.l %d1,%d0
	and.l #2097152,%d0
	and.l #786432,%d5
	or.l %d5,%d0
	jeq .L2190
	addq.l #1,nk+16
.L2190:
	and.l #-786433,%d3
	bclr #21,%d1
	move.l %d3,st+200
	move.l %d1,st+220
.L2189:
	moveq #69,%d6
	cmp.l %d2,%d6
	jne .L2184
	tst.l nk
	jeq .L2184
	moveq #-33,%d7
	and.l %d7,st+240
	clr.l nk
	tst.l st+4
	jeq .L2191
	mov3q.l #1,-(%sp)
	pea 69.w
	lea queue_key,%a2
	jsr (%a2)
	clr.l -(%sp)
	pea 69.w
	jsr (%a2)
.L2495:
	jsr flush
.L2485:
	lea (16,%sp),%sp
	jra .L2191
.L2184:
	moveq #31,%d0
	and.l %d0,%d4
	move.l %d2,%d1
	lsr.l #5,%d1
	mov3q.l #1,%d0
	move.l %d1,%a0
	lea (66,%a0),%a0
	lsl.l %d4,%d0
	move.l (%a2,%a0.l*4),%d5
	move.l %d5,%d4
	and.l %d0,%d4
	tst.l %d4
	jeq .L2192
	not.l %d0
	and.l %d5,%d0
	move.l %d0,(%a2,%a0.l*4)
	jra .L2191
.L2192:
	move.l %d2,%d4
	mov3q.l #5,%d5
	add.l #-64,%d4
	cmp.l %d4,%d5
	jcs .L2193
	move.l ls+28,%d5
	btst %d4,%d5
	jeq .L2193
	mov3q.l #1,%d0
	lsl.l %d4,%d0
	move.l ls+32,%d1
	not.l %d0
	and.l %d0,%d5
	move.l %d5,ls+28
	btst %d4,%d1
	jeq .L2191
	and.l %d1,%d0
	move.l %d0,ls+32
.L2497:
	clr.l -(%sp)
.L2486:
	move.l %d2,-(%sp)
	jsr queue_key
	jsr flush
	jra .L2484
.L2193:
	move.l %d1,%a1
	move.l %d0,%d4
	lea (121,%a1),%a1
	lea sq,%a0
	move.l (%a0,%a1.l*4),%d3
	and.l %d3,%d4
	tst.l %d4
	jeq .L2194
	not.l %d0
	and.l %d3,%d0
	move.l %d0,(%a0,%a1.l*4)
	jra .L2497
.L2194:
	move.l %d1,%a0
	move.l %d0,%d4
	lea (50,%a0),%a0
	move.l (%a2,%a0.l*4),%d3
	and.l %d3,%d4
	tst.l %d4
	jeq .L2195
	not.l %d0
	and.l %d3,%d0
	move.l %d2,%d1
	mov3q.l #7,%d6
	add.l #-112,%d1
	move.l %d0,(%a2,%a0.l*4)
	cmp.l %d1,%d6
	jcs .L2187
	move.l ux,%d3
	btst %d1,%d3
	jeq .L2187
	mov3q.l #1,%d0
	lsl.l %d1,%d0
	not.l %d0
	and.l %d3,%d0
	move.l %d0,ux
.L2496:
	clr.l -(%sp)
	move.l %d2,-(%sp)
	jsr queue_key
	jsr flush
.L2490:
	addq.l #8,%sp
	jra .L2187
.L2195:
	move.l %d1,%a0
	move.l %d0,%d4
	lea (226,%a0),%a0
	move.l (%a2,%a0.l*4),%d3
	and.l %d3,%d4
	tst.l %d4
	jeq .L2196
	not.l %d0
	and.l %d3,%d0
	move.l %d0,(%a2,%a0.l*4)
	move.l st+4,%d0
	or.l sq+408,%d0
	jeq .L2187
	jra .L2496
.L2196:
	add.l #58,%d1
	move.l %d0,%d4
	move.l (%a2,%d1.l*4),%d3
	and.l %d3,%d4
	tst.l %d4
	jeq .L2187
	not.l %d0
	and.l %d3,%d0
	move.l %d0,(%a2,%d1.l*4)
	tst.l st+4
	jeq .L2191
	clr.l -(%sp)
	move.l %d2,-(%sp)
	jsr queue_key
.L2484:
	addq.l #8,%sp
	jra .L2191
.L2181:
	moveq #31,%d1
	mov3q.l #1,%d3
	and.l %d4,%d1
	move.l %d2,%d7
	lsr.l #5,%d7
	move.l %d7,%d0
	add.l #66,%d0
	move.l %d7,%a6
	move.l (%a2,%d0.l*4),%d0
	lsl.l %d1,%d3
	move.l %d1,58(%sp)
	and.l %d3,%d0
	tst.l %d0
	jne .L2191
	move.l %d7,%d5
	move.l %d3,%d0
	add.l #58,%d5
	and.l (%a2,%d5.l*4),%d0
	tst.l %d0
	jne .L2191
	move.l %d7,%d0
	add.l #121,%d0
	lea sq,%a5
	move.l (%a5,%d0.l*4),%d0
	and.l %d3,%d0
	tst.l %d0
	jne .L2191
	move.l %d7,%d6
	move.l %d3,%d0
	add.l #50,%d6
	and.l (%a2,%d6.l*4),%d0
	tst.l %d0
	jne .L2187
	move.l %d7,%d0
	add.l #226,%d0
	move.l (%a2,%d0.l*4),%d0
	and.l %d3,%d0
	tst.l %d0
	jne .L2187
	tst.l nk
	jeq .L2197
	move.l %d2,%d1
	add.l #-18,%d1
	lsr.l #1,%d1
	jeq .L2200
	cmp.l #181,%d2
	jne .L2199
.L2200:
	lea (%a4,%d0.l),%a0
	moveq #32,%d1
	move.l (%a0),68(%sp,%d0.l)
	addq.l #4,%d0
	cmp.l %d0,%d1
	jne .L2200
	moveq #69,%d2
	mov3q.l #1,%d4
	or.l %d4,84(%sp)
	moveq #-33,%d5
	and.l %d5,st+240
	or.l %d1,st+208
	clr.l nk
	addq.l #1,nk+4
	move.b %d2,83(%sp)
	pea 68(%sp)
	move.l %a3,-(%sp)
	jsr 1074397898
	or.l %d3,(%a2,%d6.l*4)
	jra .L2490
.L2199:
	clr.l nk
	addq.l #1,nk+8
	tst.l st+4
	jeq .L2197
	mov3q.l #1,-(%sp)
	pea 69.w
	jsr queue_key
	jsr flush
	addq.l #8,%sp
.L2197:
	moveq #66,%d6
	cmp.l %d2,%d6
	jne .L2201
	move.l st+4,%d0
	tst.l %d0
	jeq .L2202
	tst.l st+1058
	jne .L2203
.L2202:
	move.l st+216,%d1
	or.l st+248,%d1
	or.l st+920,%d1
	btst #0,%d1
	jne .L2203
	move.w #256,%d7
	lea st+8,%a0
	move.l (%a0),k44
	move.w %d7,k44+20
.L2203:
	lea st+8,%a0
	move.l (%a0),u46+4
	tst.l sq+408
	jeq .L2230
	tst.l %d0
	jeq .L2206
	tst.l st+1058
	jne .L2230
	move.l sq+484,%d1
	move.l st+232,%d0
.L2208:
	or.l %d1,%d0
	tst.w %d0
	jeq .L2230
	moveq #1,%d0
	clr.b %d1
	addq.l #1,u46+32
	move.b %d0,u46+48
	move.b %d1,k44+20
	jra .L2191
.L2201:
	cmp.l #128,%d2
	jne .L2204
	lea masks,%a0
	move.l (%a0),nk+20
.L2230:
	move.l %d2,%d6
	mov3q.l #1,%d0
	move.l st+4,%d7
	add.l #-64,%d6
	cmp.l %d6,%d0
	jcs .L2249
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jne .L2248
	tst.l fk_claim
	jeq .L2251
	move.b ls,%d0
	move.b u46+48,%d1
	or.l %d1,%d0
	tst.b %d0
	jne .L2251
	move.l st+216,%d0
	moveq #65,%d1
	or.l st+972,%d7
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d1,%d0
	or.l %d7,%d0
	jne .L2251
	tst.l sq+408
	jeq .L2252
	tst.w sq+486.l
	jne .L2251
.L2252:
	tst.w st+202.l
	jne .L2251
	move.l sv+88,-(%sp)
	jsr overlay
	addq.l #4,%sp
	or.l ov_list,%d0
	jne .L2251
	or.l %d3,st+272
	moveq #64,%d4
	cmp.l %d2,%d4
	jne .L2331
	moveq #15,%d0
.L2253:
	lea fk,%a0
	addq.l #1,(%a0,%d6.l*4)
	move.l %d0,dp
	addq.l #1,dp+4
	jra .L2494
.L2206:
	move.l sq+484,%d1
	jra .L2208
.L2204:
	moveq #68,%d6
	cmp.l %d2,%d6
	jne .L2209
	move.l tk,%d0
	or.l u46,%d0
	jeq .L2210
	tst.l st+4
	jeq .L2210
	addq.l #1,tk+4
	jra .L2230
.L2210:
	move.l st+216,%d0
	moveq #64,%d7
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d0,%d7
	move.l %d7,%a0
	btst #6,%d0
	jne .L2212
	move.l st+240,%d0
	move.l st+208,%d7
	move.l %d7,%d1
	move.l st+912,%d6
	or.l %d0,%d1
	or.l %d6,%d1
	move.w %d1,%ccr
	jeq .L2213
	tst.b u46+48.l
	jeq .L2214
.L2213:
	move.l st+8,%a1
	mov3q.l #2,%d1
	sub.l u46+4,%a1
	cmp.l %a1,%d1
	jcc .L2215
.L2212:
	moveq #16,%d2
	or.l %d2,st+272
	tst.l %a0
	jne .L2216
	moveq #1,%d4
	addq.l #1,u46+20
	addq.l #1,u46+16
	move.b %d4,k44+21
.L2216:
	tst.l st+4
	jeq .L2217
	tst.b k44+22.l
	jeq .L2218
	tst.b k44+26.l
	jne .L2218
	tst.l %a0
	jne .L2218
	moveq #1,%d6
	moveq #1,%d7
	clr.b %d0
	mvz.w #256,%d5
	move.l %d5,st+296
	move.b %d6,st+161
	move.w %d7,st+162
	move.b %d0,st+993
.L2488:
	jsr flush
	jra .L2191
.L2218:
	mov3q.l #3,-(%sp)
	move.l 32(%a3),-(%sp)
	jsr leave
	jra .L2484
.L2217:
	clr.l -(%sp)
.L2492:
	clr.l -(%sp)
	move.l 32(%a3),-(%sp)
	jsr enter
	jra .L2489
.L2215:
	move.w %d7,%ccr
	jeq .L2219
.L2214:
	or.l %d6,%d0
	move.w %d0,%ccr
	jeq .L2219
	tst.b u46+48.l
	jeq .L2230
.L2219:
	addq.l #1,u46+40
	jra .L2230
.L2209:
	moveq #53,%d1
	cmp.l %d2,%d1
	jne .L2220
	move.l st+216,%d6
	move.l st+248,%a0
	move.l st+920,%d7
	move.l %d6,50(%sp)
	btst #6,%d6
	jne .L2221
	move.l %a0,%d6
	moveq #64,%d0
	or.l %d7,%d6
	mov3q.l #4,%d1
	and.l %d0,%d6
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	and.l %d1,%d0
	or.l %d6,%d0
	jne .L2222
	tst.b u46+48.l
	jeq .L2230
.L2223:
	moveq #1,%d2
	mov3q.l #1,u46
	addq.l #1,u46+16
	move.b %d2,k44+21
	jra .L2221
.L2222:
	tst.l %d6
	jeq .L2223
.L2221:
	move.l %a0,%d1
	or.l 50(%sp),%d1
	moveq #32,%d4
	swap %d4
	or.l %d7,%d1
	or.l %d4,st+268
	btst #6,%d1
	jeq .L2225
	mov3q.l #1,tk
.L2225:
	clr.l st+1038
	tst.l st+4
	jeq .L2226
	moveq #1,%d6
	mvz.w #256,%d5
	moveq #1,%d7
	moveq #1,%d0
	move.l %d5,st+296
	addq.l #1,st+998
	move.b %d6,st+161
	move.w %d7,st+162
	move.b %d0,st+993
	jra .L2488
.L2226:
	mov3q.l #1,-(%sp)
	clr.l -(%sp)
	move.l 32(%a3),-(%sp)
	jsr enter
	addq.l #1,st+994
.L2489:
	lea (12,%sp),%sp
	jra .L2191
.L2220:
	moveq #16,%d1
	cmp.l %d2,%d1
	jne .L2205
	move.l st+216,%d6
	move.l st+248,%a0
	move.l st+920,%d7
	move.l %d6,50(%sp)
	btst #6,%d6
	jne .L2227
	move.l %a0,%d6
	moveq #64,%d0
	or.l %d7,%d6
	mov3q.l #4,%d1
	and.l %d0,%d6
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	and.l %d1,%d0
	or.l %d6,%d0
	jne .L2228
	tst.b u46+48.l
	jeq .L2230
.L2229:
	moveq #1,%d2
	mov3q.l #1,u46
	addq.l #1,u46+16
	move.b %d2,k44+21
	jra .L2227
.L2228:
	tst.l %d6
	jeq .L2229
.L2227:
	move.l %a0,%d1
	or.l 50(%sp),%d1
	moveq #1,%d4
	swap %d4
	or.l %d7,%d1
	or.l %d4,st+264
	btst #6,%d1
	jeq .L2231
	mov3q.l #1,tk
.L2231:
	clr.l st+1038
	tst.l st+4
	jeq .L2232
	moveq #1,%d6
	mvz.w #256,%d5
	moveq #1,%d7
	moveq #2,%d0
	move.l %d5,st+296
	move.b %d6,st+161
	move.w %d7,st+162
	move.b %d0,st+993
.L2491:
	addq.l #1,st+1078
	jra .L2488
.L2232:
	mov3q.l #2,-(%sp)
.L2493:
	clr.l -(%sp)
	move.l 32(%a3),-(%sp)
	jsr enter
	addq.l #1,st+1074
	jra .L2489
.L2205:
	moveq #52,%d1
	cmp.l %d2,%d1
	jne .L2207
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jeq .L2233
	tst.b u46+48.l
	jeq .L2230
.L2233:
	move.l st+216,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #6,%d0
	jne .L2230
	tst.l sq+408
	jeq .L2234
	tst.w sq+486.l
	jne .L2230
.L2234:
	tst.w st+202.l
	jne .L2230
	moveq #1,%d2
	moveq #16,%d4
	swap %d4
	mov3q.l #1,u46
	addq.l #1,u46+16
	addq.l #1,u46+44
	clr.l st+1038
	move.b %d2,k44+21
	or.l %d4,st+268
	tst.l st+4
	jeq .L2235
	moveq #1,%d6
	moveq #3,%d7
	mvz.w #256,%d5
	move.b %d2,st+161
	move.l %d5,st+296
	move.w %d6,st+162
	move.b %d7,st+993
	jra .L2491
.L2235:
	mov3q.l #3,-(%sp)
	jra .L2493
.L2207:
	moveq #51,%d0
	cmp.l %d2,%d0
	jne .L2211
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jeq .L2236
	tst.b u46+48.l
	jeq .L2230
.L2236:
	move.l st+216,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #6,%d0
	jne .L2230
	tst.l sq+408
	jeq .L2237
	tst.w sq+486.l
	jne .L2230
.L2237:
	tst.w st+202.l
	jne .L2230
	moveq #1,%d1
	moveq #8,%d2
	swap %d2
	mov3q.l #1,u46
	addq.l #1,u46+16
	clr.l st+1038
	move.b %d1,k44+21
	or.l %d2,st+268
	tst.l st+4
	jeq .L2238
	moveq #1,%d5
	moveq #4,%d6
	mvz.w #256,%d4
	move.b %d1,st+161
	move.l %d4,st+296
	move.w %d5,st+162
	move.b %d6,st+993
	jra .L2488
.L2238:
	mov3q.l #4,-(%sp)
	jra .L2492
.L2211:
	moveq #48,%d7
	cmp.l %d2,%d7
	jne .L2224
	move.l st+216,%d0
	move.l st+248,%a0
	move.l st+920,%d7
	move.l %d0,50(%sp)
	btst #6,%d0
	jne .L2239
	move.l st+208,%d0
	move.l %a0,%d6
	or.l %d7,%d6
	moveq #64,%d1
	or.l st+240,%d0
	and.l %d1,%d6
	mov3q.l #4,%d1
	or.l st+912,%d0
	and.l %d1,%d0
	or.l %d6,%d0
	jne .L2240
	tst.b u46+48.l
	jeq .L2230
.L2241:
	moveq #1,%d2
	mov3q.l #1,u46
	addq.l #1,u46+16
	move.b %d2,k44+21
	jra .L2239
.L2240:
	tst.l %d6
	jeq .L2241
.L2239:
	mvz.b 1093765506,%d0
	moveq #11,%d4
	cmp.l %d0,%d4
	jcs .L2330
	move.b 1093765506,%d0
	add.l #16,%d0
.L2242:
	move.l %a0,%d1
	or.l 50(%sp),%d1
	moveq #1,%d5
	swap %d5
	or.l %d7,%d1
	or.l %d5,st+268
	btst #6,%d1
	jeq .L2243
	mov3q.l #1,tk
.L2243:
	tst.l st+4
	jeq .L2244
	tst.l st+1038
	jeq .L2245
	mov3q.l #3,-(%sp)
	move.l 32(%a3),-(%sp)
	jsr leave
	addq.l #1,st+1050
	jra .L2484
.L2330:
	moveq #16,%d0
	jra .L2242
.L2245:
	moveq #1,%d7
	moveq #1,%d1
	mvz.w #256,%d6
	move.b %d0,st+993
	mov3q.l #1,st+1038
	addq.l #1,st+1046
	move.l %d6,st+296
	move.b %d7,st+161
	move.w %d1,st+162
	jra .L2488
.L2244:
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	clr.l -(%sp)
	move.l 32(%a3),-(%sp)
	jsr enter
	mov3q.l #1,st+1038
	addq.l #1,st+1042
	jra .L2489
.L2224:
	moveq #13,%d6
	cmp.l %d2,%d6
	jcs .L2230
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jeq .L2246
	tst.b u46+48.l
	jeq .L2247
.L2246:
	or.l %d3,st+264
	addq.l #1,%d2
	move.l %d2,dp
	addq.l #1,dp+4
.L2494:
	tst.b k44+22.l
	jne .L2191
	moveq #1,%d7
	move.b %d7,k44+21
	jra .L2191
.L2247:
	move.l %d2,%d6
	add.l #-64,%d6
.L2248:
	tst.l st+4
	jeq .L2263
	cmp.l #132,%d2
	jne .L2264
	move.l st+216,%d1
	move.l %d1,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #0,%d0
	jeq .L2264
	moveq #16,%d6
	or.l %d1,%d6
	move.l %d6,st+216
	tst.l st+1058
	jne .L2265
	lea st+8,%a0
	mov3q.l #1,st+1058
	clr.l st+1062
	move.l (%a0),st+1066
	addq.l #1,st+1070
.L2265:
	moveq #1,%d0
	move.l 32(%a3),%a0
	move.b %d0,32(%a0)
	jra .L2187
.L2331:
	moveq #16,%d0
	jra .L2253
.L2251:
	addq.l #1,fk+8
	jra .L2248
.L2249:
	moveq #49,%d0
	cmp.l %d2,%d0
	jne .L2248
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jeq .L2256
	tst.b u46+48.l
	jeq .L2257
.L2256:
	or.l st+972,%d7
	jne .L2257
	tst.l sq+408
	jeq .L2258
	tst.w sq+486.l
	jne .L2257
.L2258:
	move.l st+200,%d6
	mvz.w %d6,%d6
	tst.l %d6
	jne .L2257
	move.b 1093765506,%d1
	moveq #11,%d4
	mvz.b %d1,%d2
	cmp.l %d2,%d4
	jlt .L2259
	moveq #127,%d0
	ext.w %d1
	and.l -2147457096,%d0
	mulu.w #152,%d1
	mulu.w #2531,%d0
	move.l %d0,%a0
	add.l %d1,%a0
	add.l #1092966773,%a0
	mvz.b (%a0),%d6
.L2259:
	moveq #1,%d5
	addq.l #1,u46+24
	addq.l #1,u46+16
	move.b %d5,k44+21
	tst.b ls.l
	jeq .L2260
	mov3q.l #4,-(%sp)
	jsr ls_close
	addq.l #4,%sp
.L2260:
	clr.l u46+8
	moveq #11,%d7
	cmp.l %d2,%d7
	jlt .L2261
	move.l %d6,-(%sp)
	jsr ls_banked
	addq.l #4,%sp
	tst.l %d0
	jne .L2262
	moveq #45,%d0
	cmp.l %d6,%d0
	jeq .L2262
	moveq #43,%d1
	cmp.l %d6,%d1
	jne .L2261
.L2262:
	move.l %d6,-(%sp)
	move.l %d2,-(%sp)
	moveq #127,%d2
	jsr mr_vb
	addq.l #8,%sp
	mvz.b %d0,%d0
	cmp.l %d0,%d2
	jeq .L2261
	mov3q.l #1,%d4
	or.l st+8,%d4
	move.l %d6,u46+12
	move.l %d4,u46+8
.L2261:
	moveq #2,%d5
	swap %d5
	or.l %d5,st+204
	jra .L2187
.L2257:
	moveq #-15,%d6
	jra .L2248
.L2263:
	tst.b ls.l
	jeq .L2266
	mov3q.l #5,%d1
	cmp.l %d6,%d1
	jcs .L2267
	move.l st+216,%d0
	mov3q.l #1,%d3
	lsl.l %d6,%d3
	mov3q.l #1,%d4
	or.l st+920,%d0
	lea flush,%a2
	moveq #68,%d5
	or.l %d3,ls+28
	or.l st+248,%d0
	and.l %d4,%d0
	cmp.l %d2,%d5
	jne .L2268
	tst.l ls+36
	jne .L2269
	tst.l %d0
	jeq .L2270
	lea st+8,%a0
	move.l (%a0),ls+44
	lea ls_in_gen,%a0
	move.l (%a0),ls+48
	clr.l -(%sp)
	mov3q.l #1,ls+36
	clr.l ls+40
	mov3q.l #3,-(%sp)
	addq.l #1,ls+52
	jsr ls_queue
.L2498:
	jsr (%a2)
	jra .L2484
.L2268:
	moveq #69,%d1
	cmp.l %d2,%d1
	jne .L2269
	tst.l %d0
	jeq .L2271
	move.b ls+2,%d1
	add.l #-40,%d1
	mvz.b %d1,%d1
	lsr.l #1,%d1
	jne .L2269
.L2271:
	tst.l ls+36
	jeq .L2332
.L2269:
	move.l %d0,%a0
	pea 1(%a0)
	or.l %d3,ls+32
	move.l %d2,-(%sp)
	addq.l #1,ls+88
	jsr queue_key
	jra .L2498
.L2270:
	move.l 1100949720,%a3
	move.l %a3,%d0
	clr.l ls+64
	clr.l ls+60
	add.l #-1073741824,%d0
	cmp.l #67108863,%d0
	jhi .L2273
	jsr sq_grid
	tst.l %d0
	jeq .L2273
	lea (348,%a3),%a0
	move.l (%a0),ls+60
	lea (344,%a3),%a3
	move.l (%a3),ls+64
.L2273:
	mvz.b ls+1,%d0
	lea st+8,%a0
	move.l (%a0),ls+72
	move.l %d0,ls+68
	moveq #1,%d0
.L2272:
	mov3q.l #3,%d1
	and.l %d0,%d1
	move.l %d1,-(%sp)
	jsr ls_close
	jsr (%a2)
	addq.l #4,%sp
	jra .L2191
.L2332:
	moveq #2,%d0
	jra .L2272
.L2267:
	move.l %d4,%d0
	and.l #240,%d0
	tst.l %d0
	jeq .L2266
	cmp.l #128,%d2
	jeq .L2266
	move.l %d2,%d0
	mov3q.l #2,%d1
	add.l #-80,%d0
	cmp.l %d0,%d1
	jcc .L2266
	add.l #-64,%d0
	moveq #11,%d7
	cmp.l %d0,%d7
	jcc .L2266
	mov3q.l #4,-(%sp)
	jsr ls_close
	addq.l #4,%sp
	tst.l st+4
	jne .L2264
.L2266:
	move.l st+972,%d0
	tst.b ls.l
	jne .L2274
	moveq #68,%d1
	cmp.l %d2,%d1
	jne .L2274
	tst.l %d0
	jne .L2275
	tst.b sv.l
	jeq .L2264
	tst.b sv+8.l
	jeq .L2264
	move.b sv+10,%d6
	move.b sv+3,%d0
	or.l %d0,%d6
	tst.b %d6
	jne .L2264
	move.l ls+24,%d0
	mov3q.l #4,%d7
	addq.l #2,%d0
	cmp.l %d0,%d7
	jcs .L2264
	move.b sv+1,%d1
	move.b %d1,63(%sp)
	mvz.b %d1,%d1
	mvz.b 1093765506,%d0
	cmp.l %d1,%d0
	jne .L2264
	move.b sv+2,%d7
	mvz.b %d7,%d1
	move.l %d1,-(%sp)
	move.l %d1,58(%sp)
	jsr ls_banked
	addq.l #4,%sp
	move.l 54(%sp),%d1
	tst.l %d0
	jne .L2276
	moveq #45,%d0
	cmp.l %d1,%d0
	jeq .L2276
	moveq #43,%d0
	cmp.l %d1,%d0
	jne .L2264
.L2276:
	tst.l sq+408
	jeq .L2277
	tst.w sq+486.l
	jne .L2264
.L2277:
	move.l st+216,%d0
	or.l st+920,%d0
	or.l st+248,%d0
	btst #0,%d0
	jeq .L2264
	move.b 63(%sp),%d1
	move.b %d7,ls+2
	moveq #45,%d2
	move.b %d1,ls+1
	mvz.b %d7,%d1
	cmp.l %d1,%d2
	jeq .L2334
	moveq #43,%d4
	cmp.l %d1,%d4
	jne .L2278
.L2334:
	moveq #10,%d6
.L2278:
	move.b %d6,ls+124
	moveq #1,%d5
	clr.b %d6
	lea st+8,%a0
	move.l (%a0),ls+126
	clr.l -(%sp)
	mov3q.l #1,-(%sp)
	lea ls_queue,%a2
	move.b %d5,ls
	move.b %d6,ls+125
	addq.l #1,ls+76
	addq.l #1,ls+130
	jsr (%a2)
	mov3q.l #1,ls+36
	clr.l ls+40
	lea st+8,%a0
	move.l (%a0),ls+44
	lea ls_in_gen,%a0
	move.l (%a0),ls+48
	mov3q.l #6,-(%sp)
	mov3q.l #3,-(%sp)
	addq.l #1,ls+52
	jsr (%a2)
	moveq #16,%d0
	or.l %d0,st+272
	jra .L2495
.L2274:
	tst.l %d0
	jeq .L2264
	move.l %d2,%d0
	mov3q.l #2,%d1
	add.l #-80,%d0
	cmp.l %d0,%d1
	jcc .L2264
	add.l #-64,%d0
	moveq #11,%d7
	cmp.l %d0,%d7
	jcc .L2264
.L2275:
	mov3q.l #4,-(%sp)
	move.l 32(%a3),-(%sp)
	jsr splash_end
	addq.l #8,%sp
	mov3q.l #5,%d0
	cmp.l %d6,%d0
	jcs .L2264
	or.l %d3,st+272
	jra .L2191
.L2264:
	move.l st+4,%d0
	tst.l sq+408
	jeq .L2279
	tst.l %d0
	jeq .L2280
	tst.l st+1058
	jne .L2281
.L2280:
	move.l %d2,%d1
	mov3q.l #2,%d6
	add.l #-80,%d1
	cmp.l %d1,%d6
	jcs .L2282
	move.l st+920,%d1
	move.l st+248,%d7
	move.l st+208,%d6
	or.l st+216,%d1
	move.l %d7,46(%sp)
	or.l st+240,%d6
	or.l %d7,%d1
	btst #0,%d1
	jeq .L2283
	move.l sq+484,%a0
	tst.l %d0
	jeq .L2335
	move.l st+232,%a1
.L2284:
	move.l %a0,%d7
	move.l %a1,%d1
	or.l %d7,%d1
	move.l %d1,%d7
	moveq #16,%d1
	mvz.w %d7,%d7
	and.l sq+500,%d1
	or.l %d7,%d1
	jne .L2286
	tst.l %d0
	jeq .L2283
	move.l 46(%sp),%d7
	btst #4,%d7
	jne .L2286
.L2283:
	move.l %d6,%d1
	or.l st+912,%d1
	move.w %d1,%ccr
	jeq .L2288
	tst.b u46+48.l
	jeq .L2289
.L2288:
	move.l sq+484,%a0
	tst.l %d0
	jeq .L2336
	move.l st+232,%d1
.L2290:
	move.l %a0,%d7
	or.l %d7,%d1
	tst.w %d1
	jeq .L2289
.L2286:
	or.l st+912,%d6
	move.w %d6,%ccr
	jeq .L2291
	tst.b u46+48.l
	jeq .L2292
.L2291:
	addq.l #1,u46+36
.L2292:
	tst.l %d0
	jeq .L2293
	move.l st+232,%d0
.L2293:
	move.l %a0,%d1
	or.l %d1,%d0
	move.l %d0,%d1
	mvz.w %d1,%d1
	tst.w %d0
	jeq .L2294
	moveq #80,%d4
	cmp.l %d2,%d4
	jeq .L2337
	moveq #82,%d5
	cmp.l %d2,%d5
	jne .L2338
	moveq #14,%d0
.L2295:
	move.l %d1,-(%sp)
	mov3q.l #1,-(%sp)
	mov3q.l #1,-(%sp)
	or.l %d3,st+272
	move.l %d0,-(%sp)
	jsr ed_queue
	jra .L2485
.L2335:
	sub.l %a1,%a1
	jra .L2284
.L2336:
	clr.l %d1
	jra .L2290
.L2294:
	moveq #80,%d6
	cmp.l %d2,%d6
	jeq .L2339
	moveq #82,%d7
	cmp.l %d2,%d7
	jne .L2340
	moveq #10,%d0
	jra .L2295
.L2337:
	moveq #13,%d0
	jra .L2295
.L2338:
	moveq #15,%d0
	jra .L2295
.L2339:
	moveq #9,%d0
	jra .L2295
.L2340:
	moveq #11,%d0
	jra .L2295
.L2329:
	cmp.l #132,%d2
	jne .L2296
	move.l st+216,%d0
	move.l %d0,%d1
	or.l st+920,%d1
	btst #0,%d1
	jeq .L2296
	moveq #16,%d1
	or.l %d0,%d1
	addq.l #1,ed+84
	move.l %d1,st+216
	jra .L2187
.L2297:
	move.l %d4,%d0
	and.l #240,%d0
	tst.l %d0
	jeq .L2299
	and.l #251,%d4
	cmp.l #128,%d4
	jeq .L2299
	moveq #48,%d7
	cmp.l %d2,%d7
	jne .L2300
.L2299:
	lea sq,%a0
	addq.l #1,sq+460
	cmp.l #128,%d2
	jne .L2301
	mov3q.l #1,%d0
	or.l %d0,st+920
.L2302:
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	jsr queue_key
	jsr flush
	addq.l #8,%sp
	cmp.l #128,%d2
	sne %d0
.L2499:
	mvs.b %d0,%d0
	neg.l %d0
	jra .L2185
.L2301:
	lea (121,%a6),%a6
	or.l %d3,(%a0,%a6.l*4)
	jra .L2302
.L2307:
	move.l %d2,%d0
	add.l #-66,%d0
	lsr.l #1,%d0
	jne .L2310
	move.l st+216,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #0,%d0
	jeq .L2309
	move.l masks,%d6
	cmp.l nk+20.l,%d6
	jeq .L2308
.L2309:
	cmp.l #181,%d2
	jne .L2314
	move.l st+216,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #0,%d0
	jeq .L2318
.L2314:
	tst.l mask_set
	jeq .L2319
	lea mask_keys,%a0
	move.l (%a0,%a6.l*4),%d0
	move.l 58(%sp),%d7
	btst %d7,%d0
	jeq .L2318
.L2319:
	cmp.l #128,%d2
	jne .L2481
	mov3q.l #2,%d4
	jra .L2320
.L2311:
	addq.l #1,nk+24
	jra .L2312
.L2341:
	mov3q.l #1,%d0
	jra .L2315
.L2482:
	move.l %d2,%d0
	mov3q.l #2,%d6
	add.l #-80,%d0
	cmp.l %d0,%d6
	jcs .L2309
.L2317:
	addq.l #1,st+944
.L2303:
	lea (50,%a6),%a6
	or.l %d3,(%a2,%a6.l*4)
	jra .L2187
.L2481:
	mov3q.l #1,%d4
.L2320:
	addq.l #1,st+936
	mov3q.l #2,%d1
	cmp.l %d4,%d1
	jne .L2322
	lea (226,%a6),%a6
	or.l %d3,(%a2,%a6.l*4)
.L2323:
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	jsr queue_key
	jsr flush
	mov3q.l #2,%d2
	addq.l #8,%sp
	cmp.l %d4,%d2
	sne %d0
	jra .L2499
.L2322:
	or.l %d3,(%a2,%d5.l*4)
	jra .L2323
.L2310:
	moveq #69,%d0
	cmp.l %d2,%d0
	jne .L2482
	tst.l mask_set
	jeq .L2313
	lea mask_keys+8,%a0
	btst #5,3(%a0)
	jeq .L2314
.L2313:
	lea st+232,%a1
	clr.l %d1
	sub.l %a0,%a0
.L2316:
	tst.l (%a1)+
	jne .L2341
	tst.l 668(%a1)
	sne %d0
	mvs.b %d0,%d0
	neg.l %d0
.L2315:
	or.l %d0,%d1
	addq.l #1,%a0
	moveq #8,%d0
	cmp.l %a0,%d0
	jne .L2316
	move.l st+216,%d0
	mov3q.l #1,%d4
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d4,%d0
	or.l %d1,%d0
	jne .L2314
	moveq #32,%d5
	or.l %d5,st+240
	addq.l #1,st+936
	mov3q.l #1,nk
	jra .L2191
.L2306:
	moveq #69,%d1
	cmp.l %d2,%d1
	jeq .L2318
	add.l #-80,%d2
	mov3q.l #2,%d0
	cmp.l %d2,%d0
	jcc .L2317
.L2318:
	addq.l #1,st+940
	jra .L2303
.L2279:
	tst.l %d0
	jne .L2281
.L2300:
	tst.b sv.l
	jeq .L2281
	tst.b sv+10.l
	jne .L2281
	mvz.b sv+1,%d0
	moveq #11,%d1
	cmp.l %d0,%d1
	jcs .L2281
	moveq #111,%d4
	cmp.l %d2,%d4
	jcc .L2303
	moveq #119,%d6
	cmp.l %d2,%d6
	jcs .L2281
	move.l %d2,%d1
	mov3q.l #1,%d0
	add.l #-112,%d1
	lsl.l %d1,%d0
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	addq.l #1,ux+4
	or.l %d0,ux
	jsr queue_key
	jsr flush
	or.l %d3,st+212
	jra .L2490
.L2289:
	tst.l %d0
	jne .L2304
.L2296:
	tst.w sq+486.l
	jeq .L2297
	move.l %d2,%d0
	mov3q.l #5,%d6
	add.l #-48,%d0
	cmp.l %d0,%d6
	jcc .L2298
	moveq #16,%d7
	cmp.l %d2,%d7
	jeq .L2298
	add.l #-20,%d0
	mov3q.l #1,%d1
	cmp.l %d0,%d1
	jcc .L2298
	add.l #-44,%d0
	lsr.l #3,%d0
	jne .L2297
.L2298:
	lea (121,%a6),%a6
	or.l %d3,(%a5,%a6.l*4)
	addq.l #1,st+1054
.L2487:
	mov3q.l #1,-(%sp)
	jra .L2486
.L2282:
	tst.l %d0
	jeq .L2329
.L2281:
	move.l %d2,%d0
	moveq #11,%d7
	add.l #-144,%d0
	cmp.l %d0,%d7
	jcs .L2304
	moveq #64,%d0
	and.l st+248,%d0
	tst.l %d0
	jeq .L2304
	move.l tk+8,%d0
	tst.l %d0
	jne .L2304
.L2305:
	lea (%a4,%d0.l),%a0
	moveq #32,%d1
	move.l (%a0),68(%sp,%d0.l)
	addq.l #4,%d0
	cmp.l %d0,%d1
	jne .L2305
	moveq #-122,%d4
	mov3q.l #1,%d6
	or.l %d6,84(%sp)
	mov3q.l #1,tk+8
	addq.l #1,tk+12
	move.b %d4,83(%sp)
	pea 68(%sp)
	move.l %a3,-(%sp)
	jsr 1074397898
	addq.l #8,%sp
.L2304:
	tst.l st+4
	jeq .L2303
	tst.l st+1058
	jne .L2306
	moveq #68,%d7
	cmp.l %d2,%d7
	jne .L2307
	move.l st+216,%d0
	mov3q.l #1,%d1
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d1,%d0
	move.l st+232,%d1
	mvz.w %d1,%d1
	or.l %d1,%d0
	jeq .L2314
.L2308:
	addq.l #1,st+936
	moveq #68,%d7
	cmp.l %d2,%d7
	jne .L2311
	addq.l #1,nk+12
.L2312:
	or.l %d3,st+240
	jra .L2487
	.size	rui_key, .-rui_key
	.align	2
	.globl	rui_enc
	.type	rui_enc, @function
rui_enc:
	lea (-68,%sp),%sp
	move.l 76(%sp),%a0
	movem.l #23804,(%sp)
	move.l -66650100,%d1
	lea (4,%a0),%a1
	move.l (%a1),st+76
	lea (8,%a0),%a1
	move.l (%a1),st+80
	lea (12,%a0),%a1
	move.l %d1,44(%sp)
	move.l (%a1),st+84
	lea (16,%a0),%a1
	move.l (%a1),st+88
	lea st,%a2
	mvz.b 20(%a0),%d0
	move.l %d0,st+92
	move.l 12(%a0),%a6
	move.l 16(%a0),%d2
	tst.l st+4
	jne .L2501
	tst.l sq+408
	jeq .L2502
	tst.w sq+486.l
	jeq .L2502
	mov3q.l #7,%d0
	cmp.l %a6,%d0
	jcs .L2502
	tst.b 20(%a0)
	jne .L2530
	move.l st+216,%d0
	mov3q.l #1,%d1
	or.l st+920,%d0
	and.l %d1,%d0
.L2503:
	add.l %d2,96(%a2,%a6.l*4)
	move.b %d0,st+160
	addq.l #1,sq+464
	jsr flush
.L2504:
	mov3q.l #1,%d2
	jra .L2507
.L2530:
	mov3q.l #1,%d0
	jra .L2503
.L2502:
	move.l %d2,-(%sp)
	move.l %a6,-(%sp)
	jsr ls_enc
	addq.l #8,%sp
	move.l %d0,%d2
	tst.l %d0
	jne .L2507
	moveq #8,%d3
	cmp.l %a6,%d3
	jne .L2506
	tst.b sv+8.l
	jeq .L2506
	move.l st+8,%a0
	addq.l #1,st+1086
	lea (47,%a0),%a0
	move.l %a0,st+1082
.L2506:
	tst.l st+972
	jeq .L2507
	mov3q.l #5,-(%sp)
	move.l 76(%sp),%a1
	move.l 32(%a1),-(%sp)
	jsr splash_end
	addq.l #8,%sp
.L2507:
	move.l -66650100,%d0
	addq.l #1,st+336
	sub.l 44(%sp),%d0
	add.l %d0,st+328
	cmp.l st+332.l,%d0
	jls .L2500
	move.l %d0,st+332
.L2500:
	move.l %d2,%d0
	movem.l (%sp),#23804
	lea (68,%sp),%sp
	rts
.L2501:
	tst.l st+1058
	jeq .L2508
	addq.l #1,st+952
.L2509:
	clr.l %d2
	jra .L2507
.L2508:
	tst.l mask_set
	jeq .L2510
	moveq #15,%d0
	cmp.l %a6,%d0
	jcs .L2511
	move.l mask_enc,%d0
	move.l %a6,%d1
	btst %d1,%d0
	jne .L2510
.L2511:
	addq.l #1,st+952
	moveq #8,%d3
	cmp.l %a6,%d3
	jne .L2509
	move.l st+8,%a0
	addq.l #1,st+1086
	lea (47,%a0),%a0
	move.l %a0,st+1082
	jra .L2509
.L2510:
	addq.l #1,st+948
	tst.b 20(%a0)
	jne .L2531
	move.l st+216,%d0
	mov3q.l #1,%d1
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d1,%d0
.L2513:
	move.b %d0,st+160
	moveq #15,%d3
	cmp.l %a6,%d3
	jcs .L2504
	move.l %a6,%d4
	add.l #24,%d4
	add.l %d2,(%a2,%d4.l*4)
	tst.l st+64
	jne .L2515
	move.l #-66650100,%a0
	move.l (%a0),st+64
.L2515:
	tst.l st+388
	jne .L2516
	move.l #-66650100,%a1
	lea commits,%a0
	move.l (%a1),st+388
	move.l (%a0),st+392
.L2516:
	move.l %a6,%d5
	add.l #122,%d5
	lea bind_gen,%a4
	move.l (%a4,%a6.l*4),%d6
	move.l (%a2,%d5.l*4),%a3
	cmp.l %d6,%a3
	jeq .L2519
	btst #0,%d6
	jne .L2519
	moveq #20,%d0
	move.l %a6,%d3
	muls.l %d0,%d3
	mov3q.l #5,-(%sp)
	lea copy32,%a0
	move.l %d3,%d1
	add.l #bind_in,%d1
	move.l %d1,-(%sp)
	move.l %sp,%d7
	add.l #56,%d7
	move.l %d7,-(%sp)
	move.l %a0,52(%sp)
	jsr (%a0)
	lea (12,%sp),%sp
	move.l 40(%sp),%a0
	cmp.l (%a4,%a6.l*4),%d6
	jne .L2519
	move.l %d3,%d0
	move.l %a6,%d1
	add.l #st+552,%d0
	add.l #102,%d1
	tst.l (%a2,%d1.l*4)
	jeq .L2532
	move.l %d0,%a1
	move.b 48(%sp),%d3
	move.b (%a1),%d1
	eor.l %d1,%d3
	tst.b %d3
	seq %d3
	mvs.b %d3,%d3
	neg.l %d3
.L2521:
	mov3q.l #5,-(%sp)
	move.l %d7,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a0)
	lea (12,%sp),%sp
	tst.l %d3
	jne .L2522
	lea (%a2,%a6.l),%a0
	move.b 49(%sp),472(%a0)
.L2522:
	move.l %d6,(%a2,%d5.l*4)
	move.l %d6,%a3
.L2519:
	tst.l %a3
	jeq .L2523
	move.l %a6,%d0
	moveq #20,%d3
	muls.l %d3,%d0
	lea (%a2,%d0.l),%a0
	mvz.b 552(%a0),%d1
	lsr.l #6,%d1
	jne .L2523
	lea (102,%a6),%a1
	add.l #st,%a6
	tst.l (%a2,%a1.l*4)
	jne .L2524
	move.b 553(%a0),472(%a6)
.L2524:
	move.l %d0,%a0
	add.l #st+556,%a0
	move.b (%a0),%d1
	mvz.b 472(%a6),%d3
	btst #0,%d1
	jeq .L2533
	tst.b st+160.l
	jne .L2534
.L2533:
	mov3q.l #1,%d1
.L2525:
	muls.l %d1,%d2
	move.l %d0,%a0
	add.l #st+554,%a0
	mvz.b (%a0),%d1
	add.l %d3,%d2
	cmp.l %d2,%d1
	jle .L2526
	move.l %d1,%d2
.L2526:
	move.l %d0,%a0
	add.l #st+555,%a0
	mvz.b (%a0),%d1
	cmp.l %d2,%d1
	jge .L2527
	move.l %d1,%d2
.L2527:
	move.l %d0,%a0
	add.l #st+553,%a0
	move.b %d2,(%a0)
	move.l 8(%a2),%a0
	addq.l #8,%a0
	move.l %a0,(%a2,%a1.l*4)
	move.b %d2,472(%a6)
	mov3q.l #1,st+344
	addq.l #1,st+364
	tst.l st+368
	jne .L2528
	move.l #-66650100,%a1
	move.l (%a1),st+368
.L2528:
	moveq #1,%d0
	move.l 72(%sp),%a1
	move.l 32(%a1),%a0
	move.b %d0,32(%a0)
.L2523:
	jsr flush
	tst.l (%a2,%d4.l*4)
	jne .L2504
	addq.l #1,st+384
	jra .L2504
.L2531:
	mov3q.l #1,%d0
	jra .L2513
.L2532:
	clr.l %d3
	jra .L2521
.L2534:
	moveq #8,%d1
	jra .L2525
	.size	rui_enc, .-rui_enc
	.align	2
	.globl	pj_write
	.type	pj_write, @function
pj_write:
	move.l 4(%sp),%d0
	move.l 8(%sp),%d1
	cmp.l #1074464814,%d0
	jeq .L2544
	cmp.l #1073958730,%d0
	jeq .L2544
	lea pj_push,%a0
	cmp.l #1074076072,%d0
	jne .L2546
	move.l %d1,-(%sp)
	mov3q.l #-1,-(%sp)
	mov3q.l #5,-(%sp)
.L2559:
	jsr (%a0)
	lea (12,%sp),%sp
.L2544:
	rts
.L2546:
	cmp.l #1074076390,%d0
	jeq .L2547
	cmp.l #1074076276,%d0
	jne .L2548
.L2547:
	move.l %d1,-(%sp)
	mov3q.l #-1,-(%sp)
	mov3q.l #3,-(%sp)
	jra .L2559
.L2548:
	cmp.l #1073959500,%d0
	jne .L2549
	mvz.b pj+137,%d0
	move.l %d1,-(%sp)
	move.l %d0,%a1
	pea -1(%a1)
	mov3q.l #2,-(%sp)
	jra .L2559
.L2549:
	move.l %d1,-(%sp)
	mov3q.l #-1,-(%sp)
	mov3q.l #7,-(%sp)
	jra .L2559
	.size	pj_write, .-pj_write
	.align	2
	.globl	pj_delete
	.type	pj_delete, @function
pj_delete:
	move.l 4(%sp),-(%sp)
	mov3q.l #-1,-(%sp)
	mov3q.l #4,-(%sp)
	jsr pj_push
	lea (12,%sp),%sp
	rts
	.size	pj_delete, .-pj_delete
	.align	2
	.globl	pj_copy
	.type	pj_copy, @function
pj_copy:
	move.l 4(%sp),%d0
	moveq #127,%d1
	cmp.l %d0,%d1
	jcs .L2563
	addq.l #1,%d0
.L2562:
	move.b %d0,pj+137
	rts
.L2563:
	clr.b %d0
	jra .L2562
	.size	pj_copy, .-pj_copy
	.align	2
	.globl	pj_save
	.type	pj_save, @function
pj_save:
	move.l 4(%sp),%d0
	tst.l %d0
	jlt .L2564
	move.b 1079807565,%d1
	move.l %d0,-(%sp)
	mvs.b %d1,%d1
	move.l %d1,-(%sp)
	mov3q.l #1,-(%sp)
	jsr pj_push
	lea (12,%sp),%sp
.L2564:
	rts
	.size	pj_save, .-pj_save
	.align	2
	.globl	pj_activate
	.type	pj_activate, @function
pj_activate:
	move.l 4(%sp),%d0
	tst.l %d0
	jlt .L2566
	move.l #1074457822,%d1
	cmp.l 8(%sp),%d1
	jne .L2566
	move.l #1074479198,%d1
	cmp.l 12(%sp),%d1
	jne .L2566
	move.l %d0,12(%sp)
	moveq #10,%d0
	mov3q.l #-1,8(%sp)
	move.l %d0,4(%sp)
	jra pj_push
.L2566:
	rts
	.size	pj_activate, .-pj_activate
	.align	2
	.globl	kt_saved
	.type	kt_saved, @function
kt_saved:
	moveq #127,%d0
	moveq #127,%d1
	and.l 8(%sp),%d0
	move.l %d0,-(%sp)
	move.l 8(%sp),%d0
	cmp.l %d0,%d1
	jge .L2569
	moveq #127,%d0
.L2570:
	move.l %d0,-(%sp)
	pea 65.w
	jsr pj_push
	lea (12,%sp),%sp
	rts
.L2569:
	tst.l %d0
	jge .L2570
	clr.l %d0
	jra .L2570
	.size	kt_saved, .-kt_saved
	.align	2
	.globl	kt_reloaded
	.type	kt_reloaded, @function
kt_reloaded:
	addq.l #1,pmo+76
	move.l -2147457096,%d0
	moveq #127,%d1
	mov3q.l #-1,-(%sp)
	and.l %d0,%d1
	move.l %d1,-(%sp)
	mvz.b 15(%sp),%d0
	move.l %d0,-(%sp)
	jsr pj_push
	lea (12,%sp),%sp
	rts
	.size	kt_reloaded, .-kt_reloaded
	.text
	.type	CSWTCH.548, @object
	.size	CSWTCH.548, 7
CSWTCH.548:
	.byte	1
	.byte	0
	.byte	-1
	.byte	0
	.byte	-1
	.byte	-1
	.byte	2
	.zero	1
	.text
	.align	2
	.type	CSWTCH.546, @object
	.size	CSWTCH.546, 40
CSWTCH.546:
	.long	cu_sa_short
	.long	cu_fm_short
	.long	cu_fm_short
	.long	cu_wt_short
	.long	cu_gr_short
	.long	cu_li_short
	.long	cu_cp_short
	.long	cu_mi_name
	.long	cu_fm_short
	.long	cu_ms_short
	.text
	.type	CSWTCH.489, @object
	.size	CSWTCH.489, 6
CSWTCH.489:
	.byte	4
	.byte	5
	.byte	0
	.byte	3
	.byte	1
	.byte	2
	.zero	2
	.local	tl.0
	.comm	tl.0,2816,1
	.section	.bss,"aw",@nobits
	.align	4
	.type	pj, @object
	.size	pj, 188
pj:
	.zero	188
	.local	kd_t
	.comm	kd_t,4,2
	.local	kd_over
	.comm	kd_over,4,2
	.local	kd_drop
	.comm	kd_drop,4,2
	.text
	.align	2
	.type	pmo_rcp, @object
	.size	pmo_rcp, 256
pmo_rcp:
	.word	-32768
	.word	-32768
	.word	16384
	.word	10922
	.word	8192
	.word	6553
	.word	5461
	.word	4681
	.word	4096
	.word	3640
	.word	3276
	.word	2978
	.word	2730
	.word	2520
	.word	2340
	.word	2184
	.word	2048
	.word	1927
	.word	1820
	.word	1724
	.word	1638
	.word	1560
	.word	1489
	.word	1424
	.word	1365
	.word	1310
	.word	1260
	.word	1213
	.word	1170
	.word	1129
	.word	1092
	.word	1057
	.word	1024
	.word	992
	.word	963
	.word	936
	.word	910
	.word	885
	.word	862
	.word	840
	.word	819
	.word	799
	.word	780
	.word	762
	.word	744
	.word	728
	.word	712
	.word	697
	.word	682
	.word	668
	.word	655
	.word	642
	.word	630
	.word	618
	.word	606
	.word	595
	.word	585
	.word	574
	.word	564
	.word	555
	.word	546
	.word	537
	.word	528
	.word	520
	.word	512
	.word	504
	.word	496
	.word	489
	.word	481
	.word	474
	.word	468
	.word	461
	.word	455
	.word	448
	.word	442
	.word	436
	.word	431
	.word	425
	.word	420
	.word	414
	.word	409
	.word	404
	.word	399
	.word	394
	.word	390
	.word	385
	.word	381
	.word	376
	.word	372
	.word	368
	.word	364
	.word	360
	.word	356
	.word	352
	.word	348
	.word	344
	.word	341
	.word	337
	.word	334
	.word	330
	.word	327
	.word	324
	.word	321
	.word	318
	.word	315
	.word	312
	.word	309
	.word	306
	.word	303
	.word	300
	.word	297
	.word	295
	.word	292
	.word	289
	.word	287
	.word	284
	.word	282
	.word	280
	.word	277
	.word	275
	.word	273
	.word	270
	.word	268
	.word	266
	.word	264
	.word	262
	.word	260
	.word	258
	.local	cu
	.comm	cu,32,4
	.text
.LC7:
	.string	"Tune"
.LC8:
	.string	"TUNE"
.LC9:
	.string	"Fine Tune"
.LC10:
	.string	"FINE"
.LC11:
	.string	"-"
.LC12:
	.string	"Play Mode"
.LC13:
	.string	"PLAY"
.LC14:
	.string	"Start"
.LC15:
	.string	"STRT"
.LC16:
	.string	"End"
.LC17:
	.string	"END"
.LC18:
	.string	"Loop"
.LC19:
	.string	"LOOP"
.LC20:
	.string	"Level"
.LC21:
	.string	"LEV"
	.text
	.align	2
	.type	cu_sap2k, @object
	.size	cu_sap2k, 128
cu_sap2k:
	.long	.LC7
	.long	.LC8
	.word	39
	.byte	0
	.byte	64
	.word	0
	.byte	4
	.byte	124
	.long	.LC9
	.long	.LC10
	.word	40
	.byte	0
	.byte	64
	.word	0
	.zero	2
	.long	.LC11
	.long	.LC11
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC12
	.long	.LC13
	.word	410
	.byte	33
	.byte	0
	.word	265
	.zero	2
	.long	.LC14
	.long	.LC15
	.word	410
	.byte	0
	.byte	0
	.word	0
	.byte	0
	.byte	120
	.long	.LC16
	.long	.LC17
	.word	410
	.byte	0
	.byte	120
	.word	0
	.byte	0
	.byte	120
	.long	.LC18
	.long	.LC19
	.word	410
	.byte	19
	.byte	0
	.word	0
	.byte	0
	.byte	120
	.long	.LC20
	.long	.LC21
	.word	101
	.byte	0
	.byte	100
	.word	0
	.zero	2
	.text
.LC22:
	.string	"CC 1 Value"
.LC23:
	.string	"VAL1"
.LC24:
	.string	"CC 2 Value"
.LC25:
	.string	"VAL2"
.LC26:
	.string	"CC 3 Value"
.LC27:
	.string	"VAL3"
.LC28:
	.string	"CC 4 Value"
.LC29:
	.string	"VAL4"
.LC30:
	.string	"CC 1 Select"
.LC31:
	.string	"SEL1"
.LC32:
	.string	"CC 2 Select"
.LC33:
	.string	"SEL2"
.LC34:
	.string	"CC 3 Select"
.LC35:
	.string	"SEL3"
.LC36:
	.string	"CC 4 Select"
.LC37:
	.string	"SEL4"
	.text
	.align	2
	.type	cu_mip2k, @object
	.size	cu_mip2k, 128
cu_mip2k:
	.long	.LC22
	.long	.LC23
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC24
	.long	.LC25
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC26
	.long	.LC27
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC28
	.long	.LC29
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC30
	.long	.LC31
	.word	410
	.byte	32
	.byte	0
	.word	0
	.zero	2
	.long	.LC32
	.long	.LC33
	.word	410
	.byte	32
	.byte	0
	.word	0
	.zero	2
	.long	.LC34
	.long	.LC35
	.word	410
	.byte	32
	.byte	0
	.word	0
	.zero	2
	.long	.LC36
	.long	.LC37
	.word	410
	.byte	32
	.byte	0
	.word	0
	.zero	2
	.text
.LC38:
	.string	"Destination"
.LC39:
	.string	"DST"
.LC40:
	.string	"Channel"
.LC41:
	.string	"CHAN"
.LC42:
	.string	"Bank"
.LC43:
	.string	"BANK"
.LC44:
	.string	"Sub Bank"
.LC45:
	.string	"SBNK"
.LC46:
	.string	"Program"
.LC47:
	.string	"PROG"
.LC48:
	.string	"Pitch Bend"
.LC49:
	.string	"PB"
.LC50:
	.string	"Aftertouch"
.LC51:
	.string	"AT"
.LC52:
	.string	"Mod Wheel"
.LC53:
	.string	"MW"
	.text
	.align	2
	.type	cu_mik, @object
	.size	cu_mik, 128
cu_mik:
	.long	.LC38
	.long	.LC39
	.word	410
	.byte	27
	.byte	32
	.word	260
	.zero	2
	.long	.LC40
	.long	.LC41
	.word	410
	.byte	28
	.byte	0
	.word	272
	.zero	2
	.long	.LC42
	.long	.LC43
	.word	410
	.byte	30
	.byte	0
	.word	0
	.zero	2
	.long	.LC44
	.long	.LC45
	.word	410
	.byte	30
	.byte	0
	.word	0
	.zero	2
	.long	.LC46
	.long	.LC47
	.word	410
	.byte	19
	.byte	0
	.word	0
	.zero	2
	.long	.LC48
	.long	.LC49
	.word	410
	.byte	29
	.byte	0
	.word	0
	.zero	2
	.long	.LC50
	.long	.LC51
	.word	410
	.byte	31
	.byte	0
	.word	0
	.zero	2
	.long	.LC52
	.long	.LC53
	.word	410
	.byte	31
	.byte	0
	.word	0
	.zero	2
	.text
.LC54:
	.string	"Stutter"
.LC55:
	.string	"STUT"
.LC56:
	.string	"Stutter Len"
.LC57:
	.string	"SLEN"
.LC58:
	.string	"Tape"
.LC59:
	.string	"TAPE"
.LC60:
	.string	"Tape Time"
.LC61:
	.string	"TTIM"
.LC62:
	.string	"Attack"
.LC63:
	.string	"ATK"
.LC64:
	.string	"Decay"
.LC65:
	.string	"DEC"
.LC66:
	.string	"Direction"
.LC67:
	.string	"DIR"
	.text
	.align	2
	.type	cu_cpp2k, @object
	.size	cu_cpp2k, 128
cu_cpp2k:
	.long	.LC54
	.long	.LC55
	.word	410
	.byte	20
	.byte	0
	.word	272
	.zero	2
	.long	.LC56
	.long	.LC57
	.word	410
	.byte	25
	.byte	0
	.word	0
	.zero	2
	.long	.LC58
	.long	.LC59
	.word	410
	.byte	22
	.byte	0
	.word	260
	.zero	2
	.long	.LC60
	.long	.LC61
	.word	410
	.byte	25
	.byte	0
	.word	0
	.zero	2
	.long	.LC62
	.long	.LC63
	.word	410
	.byte	25
	.byte	0
	.word	0
	.zero	2
	.long	.LC64
	.long	.LC65
	.word	410
	.byte	26
	.byte	0
	.word	0
	.zero	2
	.long	.LC66
	.long	.LC67
	.word	410
	.byte	23
	.byte	0
	.word	259
	.zero	2
	.long	.LC18
	.long	.LC19
	.word	410
	.byte	24
	.byte	0
	.word	260
	.zero	2
	.text
.LC68:
	.string	"Sample"
.LC69:
	.string	"SRC"
.LC70:
	.string	"Slice"
.LC71:
	.string	"SLC"
.LC72:
	.string	"Morph"
.LC73:
	.string	"MRPH"
.LC74:
	.string	"Shuffle Seed"
.LC75:
	.string	"SEED"
.LC76:
	.string	"Neighbour"
.LC77:
	.string	"NBR"
.LC78:
	.string	"Velocity"
.LC79:
	.string	"VEL"
	.text
	.align	2
	.type	cu_cpk, @object
	.size	cu_cpk, 128
cu_cpk:
	.long	.LC68
	.long	.LC69
	.word	410
	.byte	9
	.byte	10
	.word	2944
	.zero	2
	.long	.LC70
	.long	.LC71
	.word	410
	.byte	16
	.byte	0
	.word	320
	.zero	2
	.long	.LC7
	.long	.LC8
	.word	40
	.byte	17
	.byte	64
	.word	0
	.zero	2
	.long	.LC72
	.long	.LC73
	.word	410
	.byte	18
	.byte	0
	.word	0
	.zero	2
	.long	.LC74
	.long	.LC75
	.word	410
	.byte	19
	.byte	0
	.word	0
	.zero	2
	.long	.LC76
	.long	.LC77
	.word	410
	.byte	18
	.byte	0
	.word	0
	.zero	2
	.long	.LC78
	.long	.LC79
	.word	410
	.byte	18
	.byte	64
	.word	0
	.zero	2
	.long	.LC20
	.long	.LC21
	.word	101
	.byte	0
	.byte	100
	.word	0
	.zero	2
	.text
.LC80:
	.string	"Release"
.LC81:
	.string	"REL"
	.text
	.align	2
	.type	cu_lip2k, @object
	.size	cu_lip2k, 128
cu_lip2k:
	.long	.LC80
	.long	.LC81
	.word	410
	.byte	0
	.byte	77
	.word	0
	.zero	2
	.long	.LC11
	.long	.LC11
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC11
	.long	.LC11
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC11
	.long	.LC11
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC11
	.long	.LC11
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC11
	.long	.LC11
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC11
	.long	.LC11
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC11
	.long	.LC11
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.text
.LC82:
	.string	"Input"
.LC83:
	.string	"INPT"
.LC84:
	.string	"Gain"
.LC85:
	.string	"GAIN"
.LC86:
	.string	"Gate"
.LC87:
	.string	"GATE"
.LC88:
	.string	"Hold"
.LC89:
	.string	"HOLD"
.LC90:
	.string	"Monitor"
.LC91:
	.string	"MON"
.LC92:
	.string	"Sustain"
.LC93:
	.string	"SUS"
	.text
	.align	2
	.type	cu_lik, @object
	.size	cu_lik, 128
cu_lik:
	.long	.LC82
	.long	.LC83
	.word	410
	.byte	13
	.byte	80
	.word	260
	.zero	2
	.long	.LC84
	.long	.LC85
	.word	40
	.byte	0
	.byte	64
	.word	0
	.zero	2
	.long	.LC86
	.long	.LC87
	.word	101
	.byte	15
	.byte	0
	.word	0
	.zero	2
	.long	.LC88
	.long	.LC89
	.word	410
	.byte	0
	.byte	28
	.word	0
	.zero	2
	.long	.LC90
	.long	.LC91
	.word	410
	.byte	14
	.byte	0
	.word	258
	.zero	2
	.long	.LC62
	.long	.LC63
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC64
	.long	.LC65
	.word	410
	.byte	0
	.byte	77
	.word	0
	.zero	2
	.long	.LC92
	.long	.LC93
	.word	101
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.text
.LC94:
	.string	"Hold/Freeze"
.LC95:
	.string	"Animate"
.LC96:
	.string	"ANIM"
.LC97:
	.string	"Chord"
.LC98:
	.string	"CHD"
.LC99:
	.string	"Inversion"
.LC100:
	.string	"INV"
.LC101:
	.string	"Spread"
.LC102:
	.string	"SPR"
.LC103:
	.string	"Voices"
.LC104:
	.string	"VOI"
	.text
	.align	2
	.type	cu_grp2k, @object
	.size	cu_grp2k, 128
cu_grp2k:
	.long	.LC62
	.long	.LC63
	.word	410
	.byte	0
	.byte	10
	.word	0
	.zero	2
	.long	.LC80
	.long	.LC81
	.word	410
	.byte	0
	.byte	60
	.word	0
	.zero	2
	.long	.LC94
	.long	.LC89
	.word	410
	.byte	10
	.byte	0
	.word	0
	.zero	2
	.long	.LC95
	.long	.LC96
	.word	410
	.byte	11
	.byte	0
	.word	0
	.zero	2
	.long	.LC97
	.long	.LC98
	.word	410
	.byte	3
	.byte	0
	.word	1552
	.zero	2
	.long	.LC99
	.long	.LC100
	.word	410
	.byte	4
	.byte	0
	.word	1540
	.zero	2
	.long	.LC101
	.long	.LC102
	.word	410
	.byte	5
	.byte	0
	.word	1539
	.zero	2
	.long	.LC103
	.long	.LC104
	.word	410
	.byte	6
	.byte	0
	.word	1543
	.zero	2
	.text
.LC105:
	.string	"Source"
.LC106:
	.string	"Position"
.LC107:
	.string	"POS"
.LC108:
	.string	"Spray"
.LC109:
	.string	"SPRY"
.LC110:
	.string	"Grain Size"
.LC111:
	.string	"SIZE"
.LC112:
	.string	"Density"
.LC113:
	.string	"DENS"
.LC114:
	.string	"Pitch Rand"
.LC115:
	.string	"PRND"
.LC116:
	.string	"Reverse"
.LC117:
	.string	"REV"
.LC118:
	.string	"WIN"
	.text
	.align	2
	.type	cu_grk, @object
	.size	cu_grk, 128
cu_grk:
	.long	.LC105
	.long	.LC69
	.word	410
	.byte	9
	.byte	10
	.word	2944
	.zero	2
	.long	.LC106
	.long	.LC107
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC108
	.long	.LC109
	.word	410
	.byte	0
	.byte	20
	.word	0
	.zero	2
	.long	.LC110
	.long	.LC111
	.word	410
	.byte	0
	.byte	64
	.word	0
	.zero	2
	.long	.LC112
	.long	.LC113
	.word	410
	.byte	0
	.byte	64
	.word	0
	.zero	2
	.long	.LC114
	.long	.LC115
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC116
	.long	.LC117
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC4
	.long	.LC118
	.word	410
	.byte	8
	.byte	0
	.word	260
	.zero	2
	.text
.LC119:
	.string	"Env>Pos"
.LC120:
	.string	"ENV"
	.text
	.align	2
	.type	cu_wtp2k, @object
	.size	cu_wtp2k, 128
cu_wtp2k:
	.long	.LC62
	.long	.LC63
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC64
	.long	.LC65
	.word	410
	.byte	0
	.byte	64
	.word	0
	.zero	2
	.long	.LC92
	.long	.LC93
	.word	410
	.byte	0
	.byte	100
	.word	0
	.zero	2
	.long	.LC119
	.long	.LC120
	.word	40
	.byte	0
	.byte	64
	.word	0
	.zero	2
	.long	.LC97
	.long	.LC98
	.word	410
	.byte	3
	.byte	0
	.word	1552
	.zero	2
	.long	.LC99
	.long	.LC100
	.word	410
	.byte	4
	.byte	0
	.word	1540
	.zero	2
	.long	.LC101
	.long	.LC102
	.word	410
	.byte	5
	.byte	0
	.word	1539
	.zero	2
	.long	.LC103
	.long	.LC104
	.word	410
	.byte	6
	.byte	0
	.word	1543
	.zero	2
	.text
.LC121:
	.string	"Table"
.LC122:
	.string	"TBL"
.LC123:
	.string	"Warp"
.LC124:
	.string	"WARP"
.LC125:
	.string	"Amount"
.LC126:
	.string	"AMT"
.LC127:
	.string	"Unison"
.LC128:
	.string	"UNI"
.LC129:
	.string	"Sub Osc"
.LC130:
	.string	"SUB"
.LC131:
	.string	"Cutoff"
.LC132:
	.string	"CUT"
.LC133:
	.string	"Resonance"
.LC134:
	.string	"RES"
	.text
	.align	2
	.type	cu_wtk, @object
	.size	cu_wtk, 128
cu_wtk:
	.long	.LC121
	.long	.LC122
	.word	410
	.byte	12
	.byte	1
	.word	2944
	.zero	2
	.long	.LC106
	.long	.LC107
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC123
	.long	.LC124
	.word	410
	.byte	7
	.byte	0
	.word	260
	.zero	2
	.long	.LC125
	.long	.LC126
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC127
	.long	.LC128
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC129
	.long	.LC130
	.word	101
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC131
	.long	.LC132
	.word	40
	.byte	0
	.byte	64
	.word	0
	.zero	2
	.long	.LC133
	.long	.LC134
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.align	2
	.type	cu_p2k, @object
	.size	cu_p2k, 128
cu_p2k:
	.long	.LC7
	.long	.LC8
	.word	40
	.byte	0
	.byte	64
	.word	0
	.zero	2
	.long	.LC9
	.long	.LC10
	.word	40
	.byte	0
	.byte	64
	.word	0
	.zero	2
	.long	.LC14
	.long	.LC15
	.word	410
	.byte	0
	.byte	0
	.word	0
	.zero	2
	.long	.LC18
	.long	.LC19
	.word	410
	.byte	2
	.byte	0
	.word	259
	.zero	2
	.long	.LC97
	.long	.LC98
	.word	410
	.byte	3
	.byte	0
	.word	1552
	.zero	2
	.long	.LC99
	.long	.LC100
	.word	410
	.byte	4
	.byte	0
	.word	1540
	.zero	2
	.long	.LC101
	.long	.LC102
	.word	410
	.byte	5
	.byte	0
	.word	1539
	.zero	2
	.long	.LC103
	.long	.LC104
	.word	410
	.byte	6
	.byte	0
	.word	1543
	.zero	2
	.text
.LC135:
	.string	"Instrument"
.LC136:
	.string	"INST"
.LC137:
	.string	"Release Trig"
.LC138:
	.string	"RTRG"
	.text
	.align	2
	.type	cu_srck, @object
	.size	cu_srck, 128
cu_srck:
	.long	.LC135
	.long	.LC136
	.word	410
	.byte	12
	.byte	0
	.word	2944
	.zero	2
	.long	.LC78
	.long	.LC79
	.word	410
	.byte	0
	.byte	127
	.word	0
	.zero	2
	.long	.LC20
	.long	.LC21
	.word	101
	.byte	0
	.byte	100
	.word	0
	.zero	2
	.long	.LC137
	.long	.LC138
	.word	410
	.byte	1
	.byte	0
	.word	258
	.zero	2
	.long	.LC62
	.long	.LC63
	.word	40
	.byte	0
	.byte	64
	.word	0
	.zero	2
	.long	.LC64
	.long	.LC65
	.word	40
	.byte	0
	.byte	64
	.word	0
	.zero	2
	.long	.LC92
	.long	.LC93
	.word	40
	.byte	0
	.byte	64
	.word	0
	.zero	2
	.long	.LC80
	.long	.LC81
	.word	40
	.byte	0
	.byte	64
	.word	0
	.zero	2
	.type	cu_fmt_spr, @object
	.size	cu_fmt_spr, 6
cu_fmt_spr:
	.string	"SPR%d"
	.type	cu_fmt_inv, @object
	.size	cu_fmt_inv, 6
cu_fmt_inv:
	.string	"INV%d"
	.type	cu_fmt_bk, @object
	.size	cu_fmt_bk, 7
cu_fmt_bk:
	.string	"%c%03d"
	.type	cu_fmt_d, @object
	.size	cu_fmt_d, 3
cu_fmt_d:
	.string	"%d"
	.type	cu_fmt_s, @object
	.size	cu_fmt_s, 3
cu_fmt_s:
	.string	"%s"
	.type	cu_fm_short, @object
	.size	cu_fm_short, 4
cu_fm_short:
	.string	"6OP"
	.type	cu_fmt_pct, @object
	.size	cu_fmt_pct, 5
cu_fmt_pct:
	.string	"%d%%"
	.type	cu_fmt_x, @object
	.size	cu_fmt_x, 4
cu_fmt_x:
	.string	"X%d"
	.type	cu_fmt_pd, @object
	.size	cu_fmt_pd, 4
cu_fmt_pd:
	.string	"+%d"
	.type	cu_fmt_db, @object
	.size	cu_fmt_db, 5
cu_fmt_db:
	.string	"%dDB"
	.type	cu_dst, @object
	.size	cu_dst, 20
cu_dst:
	.string	"OFF"
	.zero	1
	.string	"DIN"
	.zero	1
	.string	"USBC"
	.string	"USBA"
	.type	cu_cloop, @object
	.size	cu_cloop, 20
cu_cloop:
	.string	"SLC"
	.zero	1
	.string	"OFF"
	.zero	1
	.string	"FWD"
	.zero	1
	.string	"PING"
	.type	cu_dir, @object
	.size	cu_dir, 12
cu_dir:
	.string	"SLC"
	.string	"FWD"
	.string	"REV"
	.type	cu_tape, @object
	.size	cu_tape, 20
cu_tape:
	.string	"SLC"
	.zero	1
	.string	"OFF"
	.zero	1
	.string	"STOP"
	.string	"SPIN"
	.type	cu_hold, @object
	.size	cu_hold, 5
cu_hold:
	.string	"HOLD"
	.type	cu_slc, @object
	.size	cu_slc, 4
cu_slc:
	.string	"SLC"
	.type	cu_mon, @object
	.size	cu_mon, 10
cu_mon:
	.string	"ALW"
	.zero	1
	.string	"TRIG"
	.type	cu_inpt, @object
	.size	cu_inpt, 16
cu_inpt:
	.string	"L"
	.zero	2
	.string	"R"
	.zero	2
	.string	"L+R"
	.string	"STR"
	.type	cu_play, @object
	.size	cu_play, 54
cu_play:
	.string	"FWD"
	.zero	2
	.string	"REV"
	.zero	2
	.string	"FLP"
	.zero	2
	.string	"RLP"
	.zero	2
	.string	"SLICE"
	.string	"GRAIN"
	.string	"STRCH"
	.string	"PLUCK"
	.string	"WAVE"
	.zero	1
	.globl	cu_sa_short
	.type	cu_sa_short, @object
	.size	cu_sa_short, 5
cu_sa_short:
	.string	"SMPR"
	.globl	cu_sa_name
	.type	cu_sa_name, @object
	.size	cu_sa_name, 8
cu_sa_name:
	.string	"SAMPLER"
	.globl	cu_mi_name
	.type	cu_mi_name, @object
	.size	cu_mi_name, 5
cu_mi_name:
	.string	"MIDI"
	.globl	cu_cp_short
	.type	cu_cp_short, @object
	.size	cu_cp_short, 5
cu_cp_short:
	.string	"CHOP"
	.globl	cu_cp_name
	.type	cu_cp_name, @object
	.size	cu_cp_name, 5
cu_cp_name:
	.string	"CHOP"
	.globl	cu_li_short
	.type	cu_li_short, @object
	.size	cu_li_short, 5
cu_li_short:
	.string	"LVIN"
	.globl	cu_li_name
	.type	cu_li_name, @object
	.size	cu_li_name, 8
cu_li_name:
	.string	"LIVE IN"
	.globl	cu_gr_short
	.type	cu_gr_short, @object
	.size	cu_gr_short, 5
cu_gr_short:
	.string	"GRAN"
	.globl	cu_gr_name
	.type	cu_gr_name, @object
	.size	cu_gr_name, 9
cu_gr_name:
	.string	"GRANULAR"
	.globl	cu_wt_short
	.type	cu_wt_short, @object
	.size	cu_wt_short, 5
cu_wt_short:
	.string	"WTBL"
	.globl	cu_wt_name
	.type	cu_wt_name, @object
	.size	cu_wt_name, 10
cu_wt_name:
	.string	"WAVETABLE"
	.globl	cu_ms_short
	.type	cu_ms_short, @object
	.size	cu_ms_short, 5
cu_ms_short:
	.string	"MSMP"
	.globl	cu_ms_name
	.type	cu_ms_name, @object
	.size	cu_ms_name, 10
cu_ms_name:
	.string	"MULTISAMP"
	.type	cu_off, @object
	.size	cu_off, 4
cu_off:
	.string	"OFF"
	.type	cu_frz, @object
	.size	cu_frz, 4
cu_frz:
	.string	"FRZ"
	.type	cu_anim, @object
	.size	cu_anim, 40
cu_anim:
	.string	"8BAR"
	.string	"4BAR"
	.string	"2BAR"
	.string	"1BAR"
	.string	"1/2"
	.zero	1
	.string	"1/4"
	.zero	1
	.string	"1/8"
	.zero	1
	.string	"1/16"
	.type	cu_win, @object
	.size	cu_win, 24
cu_win:
	.string	"HANN"
	.zero	1
	.string	"TRI"
	.zero	2
	.string	"TUKEY"
	.string	"PERC"
	.zero	1
	.type	cu_warp, @object
	.size	cu_warp, 20
cu_warp:
	.string	"OFF"
	.zero	1
	.string	"SYNC"
	.string	"PWM"
	.zero	1
	.string	"FM"
	.zero	2
	.type	cu_loop, @object
	.size	cu_loop, 15
cu_loop:
	.string	"AUTO"
	.string	"OFF"
	.zero	1
	.string	"ON"
	.zero	2
	.type	cu_chd, @object
	.size	cu_chd, 80
cu_chd:
	.string	"OFF"
	.zero	1
	.string	"MAJ"
	.zero	1
	.string	"MIN"
	.zero	1
	.string	"SUS2"
	.string	"SUS4"
	.string	"7"
	.zero	3
	.string	"MAJ7"
	.string	"MIN7"
	.string	"DIM"
	.zero	1
	.string	"AUG"
	.zero	1
	.string	"6"
	.zero	3
	.string	"MIN6"
	.string	"9"
	.zero	3
	.string	"ADD9"
	.string	"MIN9"
	.string	"5"
	.zero	3
	.align	2
	.type	cu_src, @object
	.size	cu_src, 16
cu_src:
	.word	398
	.word	443
	.word	399
	.word	400
	.word	401
	.word	402
	.word	406
	.word	407
	.align	2
	.type	cu_p2, @object
	.size	cu_p2, 16
cu_p2:
	.word	438
	.word	457
	.word	458
	.word	459
	.word	460
	.word	403
	.word	404
	.word	405
	.type	pm_t_track, @object
	.size	pm_t_track, 18
pm_t_track:
	.string	"SOUND TRACKS ONLY"
	.type	pm_t_none, @object
	.size	pm_t_none, 11
pm_t_none:
	.string	"NO SIDECAR"
	.globl	pm_text
	.type	pm_text, @object
	.size	pm_text, 12
pm_text:
	.string	"POLY CONFIG"
	.section	.bss
	.align	4
	.type	ls, @object
	.size	ls, 134
ls:
	.zero	134
	.align	4
	.type	pc, @object
	.size	pc, 94
pc:
	.zero	94
	.local	led_owed
	.comm	led_owed,1,1
	.local	uart_sub
	.comm	uart_sub,4,4
	.local	uart_bytes
	.comm	uart_bytes,4,4
	.local	ps_id
	.comm	ps_id,1,1
	.local	ps_pos
	.comm	ps_pos,1,1
	.local	ps_hdr
	.comm	ps_hdr,1,1
	.local	ps_left
	.comm	ps_left,1,1
	.local	sht
	.comm	sht,4,1
	.local	ovt_col
	.comm	ovt_col,1,1
	.local	ovt_on
	.comm	ovt_on,1,1
	.local	shp
	.comm	shp,16,1
	.local	ovp_col
	.comm	ovp_col,4,1
	.local	ovp_on
	.comm	ovp_on,1,1
	.local	led_again
	.comm	led_again,4,2
	.text
	.type	shs, @object
	.size	shs, 4
shs:
	.base64	"/////w=="
	.local	sh
	.comm	sh,64,1
	.local	ov_col
	.comm	ov_col,16,1
	.local	ov_on
	.comm	ov_on,1,1
	.local	din_drop
	.comm	din_drop,4,2
	.local	din_sent
	.comm	din_sent,4,2
	.local	sv_fxb
	.comm	sv_fxb,4,2
	.local	sv_umb
	.comm	sv_umb,4,2
	.local	ov_list
	.comm	ov_list,4,2
	.local	ov_n
	.comm	ov_n,4,2
	.local	ov_is
	.comm	ov_is,4,2
	.local	ov_vt
	.comm	ov_vt,4,2
	.text
.LC139:
	.string	"SoundBrowser"
.LC140:
	.string	"KitBrowserView"
.LC141:
	.string	"SongBrowserView"
.LC142:
	.string	"NameView"
.LC143:
	.string	"TapTempoView"
.LC144:
	.string	"ProjectManager"
.LC145:
	.string	"SoundManager"
.LC146:
	.string	"SampleManager"
.LC147:
	.string	"SongEditView"
.LC148:
	.string	"SoundSlotListView"
.LC149:
	.string	"SampleListView"
.LC150:
	.string	"TwoColumnMenu"
.LC151:
	.string	"SceneEditView"
.LC152:
	.string	"PerformanceEditView"
	.text
	.align	2
	.type	ov_names, @object
	.size	ov_names, 56
ov_names:
	.long	.LC139
	.long	.LC140
	.long	.LC141
	.long	.LC142
	.long	.LC143
	.long	.LC144
	.long	.LC145
	.long	.LC146
	.long	.LC147
	.long	.LC148
	.long	.LC149
	.long	.LC150
	.long	.LC151
	.long	.LC152
	.align	2
	.type	sv_covers, @object
	.size	sv_covers, 32
sv_covers:
	.long	1075731444
	.long	1075721968
	.long	1075664348
	.long	1075670552
	.long	1075670916
	.long	1075736788
	.long	1076038980
	.long	1075650164
	.section	.bss
	.align	4
	.type	sv, @object
	.size	sv, 128
sv:
	.zero	128
	.local	ar
	.comm	ar,70,2
	.align	4
	.type	mr, @object
	.size	mr, 22
mr:
	.zero	22
	.text
	.type	mr_flag, @object
	.size	mr_flag, 18
mr_flag:
	.string	"PX`hpH\b@ "
	.string	" (8x\030"
	.ascii	"\0200"
	.type	mr_voice, @object
	.size	mr_voice, 12
mr_voice:
	.base64	"AAIHBwEDBQUEBAYG"
	.local	kq_owes
	.comm	kq_owes,4,2
	.local	kq_owed
	.comm	kq_owed,32,2
	.local	kq_nodown
	.comm	kq_nodown,32,2
	.section	.bss
	.align	4
	.type	pmo, @object
	.size	pmo, 10078
pmo:
	.zero	10078
	.local	qp
	.comm	qp,104,4
	.local	fp
	.comm	fp,24,4
	.local	txsx_test_on
	.comm	txsx_test_on,4,2
	.local	txsx_test_end
	.comm	txsx_test_end,4,2
	.local	txsx_test
	.comm	txsx_test,4,2
	.local	txsx_gap
	.comm	txsx_gap,4,2
	.local	txsx_over
	.comm	txsx_over,4,2
	.local	txsx_on
	.comm	txsx_on,4,2
	.local	txsx_t0
	.comm	txsx_t0,4,2
	.align	4
	.type	fk, @object
	.size	fk, 12
fk:
	.zero	12
	.align	4
	.type	k44, @object
	.size	k44, 36
k44:
	.zero	36
	.align	4
	.type	dp, @object
	.size	dp, 64
dp:
	.zero	64
	.align	4
	.type	ux, @object
	.size	ux, 3968
ux:
	.zero	3968
	.local	pg_req
	.comm	pg_req,4,1
	.local	pg_gen
	.comm	pg_gen,4,4
	.align	4
	.type	ed, @object
	.size	ed, 392
ed:
	.zero	392
	.align	4
	.type	pin, @object
	.size	pin, 60
pin:
	.zero	60
	.local	sq_req
	.comm	sq_req,7,1
	.local	sq_gen
	.comm	sq_gen,4,4
	.align	4
	.type	sq, @object
	.size	sq, 556
sq:
	.zero	556
	.align	4
	.type	pm, @object
	.size	pm, 32
pm:
	.zero	32
	.align	4
	.type	u46, @object
	.size	u46, 50
u46:
	.zero	50
	.local	nk
	.comm	nk,28,4
	.local	tk
	.comm	tk,16,4
	.local	st
	.comm	st,1096,4
	.local	led_req
	.comm	led_req,16,1
	.local	led_req_mode
	.comm	led_req_mode,1,1
	.local	led_gen
	.comm	led_gen,4,4
	.local	splash_req
	.comm	splash_req,4,4
	.local	masks
	.comm	masks,4,4
	.local	mask_set
	.comm	mask_set,4,4
	.local	mask_enc
	.comm	mask_enc,4,4
	.local	mask_keys
	.comm	mask_keys,32,4
	.local	mt_calls
	.comm	mt_calls,4,2
	.local	mt_max
	.comm	mt_max,4,2
	.local	mt_sum
	.comm	mt_sum,4,2
	.local	st_valid
	.comm	st_valid,1,1
	.local	st_seq
	.comm	st_seq,1,1
	.local	ls_in_gen
	.comm	ls_in_gen,4,4
	.local	ls_in_v
	.comm	ls_in_v,4,2
	.local	fk_claim
	.comm	fk_claim,4,2
	.local	ls_host_presets
	.comm	ls_host_presets,4,2
	.local	pc_req
	.comm	pc_req,6,1
	.local	pc_seq
	.comm	pc_seq,4,4
	.local	t_commit
	.comm	t_commit,4,4
	.local	host_close
	.comm	host_close,1,1
	.local	host_open
	.comm	host_open,1,1
	.local	rx_bad
	.comm	rx_bad,4,4
	.local	rx
	.comm	rx,4,4
	.local	commits
	.comm	commits,4,4
	.local	sh_seq
	.comm	sh_seq,4,4
	.local	bind_gen
	.comm	bind_gen,64,4
	.local	bind_in
	.comm	bind_in,320,4
	.local	txt_sh
	.comm	txt_sh,2816,4
	.local	txt_st
	.comm	txt_st,2816,4
	.local	comp_in
	.comm	comp_in,1024,4
	.local	comp
	.comm	comp,1024,4
	.local	staging
	.comm	staging,1024,4
	.local	shadow
	.comm	shadow,1024,4
	.ident	"GCC: (GNU) 16.2.0"
