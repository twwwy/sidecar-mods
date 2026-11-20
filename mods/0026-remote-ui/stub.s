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
	.type	blit, @function
blit:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 12(%sp),%a0
	tst.b sv+8.l
	jeq .L133
	move.l #1075719224,%d0
	cmp.l sv+88.l,%d0
	jeq .L134
.L133:
	clr.l %d1
.L131:
	move.l %a0,%d3
	add.l #1024,%d3
	lea comp,%a1
.L132:
	move.l (%a1),%d2
	addq.l #8,%a1
	move.l (%a0),%d0
	eor.l %d2,%d0
	and.l %d1,%d0
	eor.l %d2,%d0
	move.l %d0,(%a0)
	move.l -4(%a1),4(%a0)
	addq.l #8,%a0
	cmp.l %d3,%a0
	jne .L132
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L134:
	move.l #-16777216,%d1
	jra .L131
	.size	blit, .-blit
	.align	2
	.type	cu_tab, @function
cu_tab:
	move.l %d2,-(%sp)
	moveq #12,%d2
	move.l 8(%sp),%d1
	add.l #-40,%d1
	move.l 12(%sp),%d0
	cmp.l %d1,%d2
	jcs .L147
	move.w .L139(%pc,%d1.l*2),%d1
	ext.l %d1
	jmp %pc@(2,%d1:l)
	.balignw 2,0x284c
	.swbeg	&13
.L139:
	.word .L146-.L139
	.word .L147-.L139
	.word .L147-.L139
	.word .L145-.L139
	.word .L147-.L139
	.word .L147-.L139
	.word .L144-.L139
	.word .L143-.L139
	.word .L142-.L139
	.word .L141-.L139
	.word .L140-.L139
	.word .L147-.L139
	.word .L138-.L139
.L144:
	tst.l %d0
	jeq .L148
	move.l #cu_wtp2k,%d0
.L136:
	move.l (%sp)+,%d2
	rts
.L143:
	tst.l %d0
	jeq .L149
	move.l #cu_grp2k,%d0
	jra .L136
.L138:
	tst.l %d0
	jne .L155
	move.l #cu_srck,%d0
	jra .L136
.L142:
	tst.l %d0
	jeq .L151
	move.l #cu_lip2k,%d0
	jra .L136
.L141:
	tst.l %d0
	jeq .L152
	move.l #cu_cpp2k,%d0
	jra .L136
.L140:
	tst.l %d0
	jeq .L153
	move.l #cu_mip2k,%d0
	jra .L136
.L145:
	tst.l %d0
	jeq .L136
	move.l #cu_sap2k,%d0
	jra .L136
.L146:
	tst.l %d0
	jeq .L136
.L155:
	move.l #cu_p2k,%d0
	jra .L136
.L147:
	clr.l %d0
	jra .L136
.L148:
	move.l #cu_wtk,%d0
	jra .L136
.L149:
	move.l #cu_grk,%d0
	jra .L136
.L151:
	move.l #cu_lik,%d0
	jra .L136
.L152:
	move.l #cu_cpk,%d0
	jra .L136
.L153:
	move.l #cu_mik,%d0
	jra .L136
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
.L161:
	mvs.w (%a3,%a0.l),%d5
	cmp.l %d5,%d6
	jne .L157
	tst.l %d7
	jeq .L159
	mvz.b (%a1),%d1
.L159:
	add.l #16,%d0
	lea (16,%a1),%a1
	addq.l #2,%a0
	moveq #16,%d5
	cmp.l %a0,%d5
	jne .L161
	cmp.l #441,%d6
	jne .L162
	moveq #12,%d1
.L162:
	move.l %d3,%d0
	moveq #127,%d5
	cmp.l %d3,%d5
	jge .L163
	moveq #127,%d0
.L164:
	addq.l #1,cu+4
	subq.l #1,%d1
	moveq #32,%d5
	cmp.l %d1,%d5
	jcs .L165
	move.w .L167(%pc,%d1.l*2),%d1
	ext.l %d1
	jmp %pc@(2,%d1:l)
	.balignw 2,0x284c
	.swbeg	&33
.L167:
	.word .L197-.L167
	.word .L196-.L167
	.word .L195-.L167
	.word .L194-.L167
	.word .L193-.L167
	.word .L192-.L167
	.word .L191-.L167
	.word .L190-.L167
	.word .L187-.L167
	.word .L189-.L167
	.word .L188-.L167
	.word .L187-.L167
	.word .L186-.L167
	.word .L185-.L167
	.word .L184-.L167
	.word .L183-.L167
	.word .L182-.L167
	.word .L181-.L167
	.word .L180-.L167
	.word .L179-.L167
	.word .L165-.L167
	.word .L178-.L167
	.word .L177-.L167
	.word .L176-.L167
	.word .L175-.L167
	.word .L174-.L167
	.word .L173-.L167
	.word .L172-.L167
	.word .L171-.L167
	.word .L168-.L167
	.word .L169-.L167
	.word .L168-.L167
	.word .L166-.L167
.L157:
	mvs.w (%a4,%a0.l),%d5
	cmp.l %d5,%d6
	jne .L159
	tst.l %a2
	jeq .L159
	move.l %d0,%a5
	mvz.b (%a5),%d1
	jra .L159
.L163:
	tst.l %d3
	jge .L164
	clr.l %d0
	jra .L164
.L197:
	moveq #63,%d0
	cmp.l %d3,%d0
	jge .L214
	move.l #cu_loop+10,%d0
.L248:
	move.l %d0,60(%sp)
	move.l #cu_fmt_s,%d1
.L237:
	move.l %d1,56(%sp)
	jra .L233
.L214:
	move.l #cu_loop+5,%d0
	jra .L248
.L196:
	muls.w #3,%d0
	asr.l #7,%d0
	mulu.w #5,%d0
	add.l #cu_loop,%d0
.L245:
	move.l %d0,60(%sp)
	move.l #cu_fmt_s,%d3
	jra .L239
.L195:
	moveq #15,%d5
	cmp.l %d3,%d5
	jge .L199
	clr.l %d0
.L199:
	mulu.w #5,%d0
	add.l #cu_chd,%d0
.L251:
	move.l %d0,60(%sp)
	lea cu_fmt_s,%a0
	jra .L238
.L194:
	mov3q.l #3,%d1
	cmp.l %d3,%d1
	jge .L200
	clr.l %d0
.L200:
	move.l %d0,60(%sp)
	move.l #cu_fmt_inv,%d3
.L239:
	move.l %d3,56(%sp)
.L233:
	move.l %d2,52(%sp)
	movem.l (%sp),#15612
	lea (48,%sp),%sp
	jmp 1074365954
.L193:
	mov3q.l #2,%d5
	cmp.l %d3,%d5
	jge .L201
	clr.l %d0
.L201:
	move.l %d0,60(%sp)
	lea cu_fmt_spr,%a0
.L238:
	move.l %a0,56(%sp)
	jra .L233
.L192:
	move.l %d0,%d1
	mov3q.l #5,%d3
	subq.l #1,%d1
	cmp.l %d1,%d3
	jcs .L202
.L249:
	move.l %d0,60(%sp)
	move.l #cu_fmt_d,%d5
	jra .L240
.L202:
	lea cu_loop,%a0
	move.l %a0,60(%sp)
.L236:
	lea cu_fmt_s,%a5
	jra .L234
.L191:
	mvs.w %d0,%d0
	asr.l #5,%d0
	mulu.w #5,%d0
	add.l #cu_warp,%d0
.L241:
	move.l %d0,60(%sp)
	jra .L243
.L190:
	mvs.w %d0,%d0
	asr.l #5,%d0
	mulu.w #6,%d0
	add.l #cu_win,%d0
	jra .L248
.L189:
	moveq #119,%d5
	cmp.l %d3,%d5
	jlt .L203
	muls.w #99,%d0
	divs.l %d5,%d0
.L242:
	move.l %d0,60(%sp)
	lea cu_fmt_d,%a0
	jra .L238
.L203:
	lea cu_frz,%a5
	move.l %a5,60(%sp)
.L243:
	move.l #cu_fmt_s,%d0
	move.l %d0,56(%sp)
	jra .L233
.L188:
	tst.l %d3
	jle .L204
	asr.l #4,%d0
	mulu.w #5,%d0
	add.l #cu_anim,%d0
	jra .L248
.L186:
	mvs.w %d0,%d0
	lsr.l #3,%d0
	and.l #262140,%d0
	add.l #cu_inpt,%d0
	jra .L251
.L185:
	mvs.w %d0,%d0
	asr.l #6,%d0
	mulu.w #5,%d0
	add.l #cu_mon,%d0
.L235:
	move.l %d0,60(%sp)
	jra .L236
.L184:
	tst.l %d3
	jle .L204
	muls.w #60,%d0
	moveq #126,%d3
	move.l #cu_fmt_db,%d5
	addq.l #3,%d0
	divs.l %d3,%d0
	add.l #-80,%d0
	move.l %d0,60(%sp)
.L240:
	move.l %d5,56(%sp)
	jra .L233
.L183:
	asr.l #1,%d0
	addq.l #1,%d0
	jra .L242
.L182:
	moveq #63,%d1
	cmp.l %d3,%d1
	jge .L205
	muls.w #48,%d0
	moveq #126,%d3
	add.l #-3009,%d0
	divs.l %d3,%d0
	tst.l %d0
	jeq .L219
.L247:
	move.l #cu_fmt_pd,%d1
.L208:
	move.l %d0,60(%sp)
	jra .L237
.L205:
	moveq #64,%d1
	moveq #-126,%d5
	sub.l %d0,%d1
	muls.w #48,%d1
	move.l %d1,%d0
	add.l #63,%d0
	divs.l %d5,%d0
.L219:
	move.l #cu_fmt_d,%d1
	jra .L208
.L181:
	muls.w #100,%d0
	moveq #127,%d3
	move.l #cu_fmt_pct,%d5
	add.l #63,%d0
	divs.l %d3,%d0
	move.l %d0,60(%sp)
	jra .L240
.L180:
	tst.l %d3
	jgt .L242
.L204:
	move.l #cu_off,%d3
.L244:
	move.l %d3,60(%sp)
	jra .L246
.L179:
	mvs.w %d0,%d0
	asr.l #3,%d0
	jeq .L207
	addq.l #1,%d0
	move.l %d0,60(%sp)
	lea cu_fmt_x,%a5
.L234:
	move.l %a5,56(%sp)
	jra .L233
.L178:
	mvs.w %d0,%d0
	asr.l #5,%d0
	mulu.w #5,%d0
	add.l #cu_tape,%d0
	jra .L245
.L177:
	muls.w #3,%d0
	lsr.l #5,%d0
	and.l #262140,%d0
	add.l #cu_dir,%d0
	move.l %d0,60(%sp)
.L246:
	move.l #cu_fmt_s,%d5
	jra .L240
.L176:
	mvs.w %d0,%d0
	asr.l #5,%d0
	mulu.w #5,%d0
	add.l #cu_cloop,%d0
	jra .L251
.L175:
	tst.l %d3
	jle .L207
.L165:
	move.l %d0,60(%sp)
	lea cu_fmt_d,%a5
	jra .L234
.L173:
	mvs.w %d0,%d0
	asr.l #5,%d0
	mulu.w #5,%d0
	add.l #cu_dst,%d0
	jra .L241
.L172:
	mvs.w %d0,%d0
	asr.l #3,%d0
	move.l #cu_fmt_d,%d1
	addq.l #1,%d0
	move.l %d0,60(%sp)
	jra .L237
.L171:
	tst.l %d3
	jle .L204
	add.l #-64,%d0
	moveq #64,%d5
	cmp.l %d3,%d5
	jge .L219
	jra .L247
.L169:
	tst.l %d3
	jle .L204
	subq.l #1,%d0
	muls.w #127,%d0
	moveq #126,%d3
	divs.l %d3,%d0
	jra .L249
.L168:
	tst.l %d3
	jle .L204
	subq.l #1,%d0
	jra .L242
.L166:
	muls.w #9,%d0
	asr.l #7,%d0
	mulu.w #6,%d0
	add.l #cu_play,%d0
	jra .L235
.L174:
	moveq #126,%d1
	cmp.l %d3,%d1
	jge .L209
	move.l #cu_hold,%d3
	jra .L244
.L209:
	tst.l %d3
	jgt .L242
.L207:
	move.l #cu_slc,%d0
	jra .L248
.L187:
	cmp.l #441,%d6
	jeq .L220
	move.b 43(%sp),%d5
	mov3q.l #6,%d1
	add.l #-46,%d5
	mvz.b %d5,%d5
	cmp.l %d5,%d1
	jcs .L221
	lea CSWTCH.549,%a0
	mvs.b (%a0,%d5.l),%d1
.L210:
	tst.l %d3
	jle .L204
	asr.l #5,%d4
	mov3q.l #7,%d3
	mov3q.l #-1,%d5
	and.l %d3,%d4
	cmp.l %d1,%d5
	jeq .L211
	lea ux,%a1
	lea (%a1,%d1.l),%a0
	mvz.b 3948(%a0),%d3
	cmp.l %d3,%d4
	jne .L211
	mvz.w #1280,%d3
	moveq #10,%d5
	muls.l %d0,%d5
	muls.l %d1,%d3
	move.l %d5,%a0
	add.l %d3,%a0
	tst.b 40(%a1,%a0.l)
	jeq .L211
	mulu.w #10,%d0
	mulu.w #1280,%d1
	move.l %d0,%a0
	lea 40(%a0,%d1.l),%a0
	move.l %a0,%d0
	add.l %a1,%d0
	jra .L235
.L220:
	clr.l %d1
	jra .L210
.L221:
	mov3q.l #-1,%d1
	jra .L210
.L211:
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
.L254:
	lea (%a2,%d0.l),%a4
	moveq #84,%d2
	move.l %d1,%a3
	move.l (%a4),(%a3,%d0.l)
	addq.l #4,%d0
	cmp.l %d0,%d2
	jne .L254
	tst.b 10(%a1)
	jeq .L255
	lea cu_text,%a2
	move.l %a2,32(%a3)
.L255:
	move.l (%a1),40(%a0)
	move.l 4(%a1),48(%a0)
	move.l 28(%sp),44(%a0)
	mvz.b 14(%a1),%d0
	move.w 12(%a1),%d1
	lsl.l #8,%d0
	and.l #2048,%d1
	move.l %d0,8(%a0)
	move.b 15(%a1),%d0
	jeq .L256
	mvz.b %d0,%d0
	lsl.l #8,%d0
.L257:
	move.l %d0,12(%a0)
	mvz.b 11(%a1),%d0
	lsl.l #8,%d0
	move.l %d0,16(%a0)
	tst.w %d1
	jeq .L253
	mov3q.l #1,20(%a0)
.L253:
	movem.l (%sp),#7172
	lea (16,%sp),%sp
	rts
.L256:
	tst.w %d1
	jeq .L259
	mvz.w #32736,%d0
	jra .L257
.L259:
	mvz.w #32512,%d0
	jra .L257
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
	jeq .L264
	moveq #40,%d0
	cmp.l %d2,%d0
	jeq .L264
	move.l #1094564988,%a0
.L266:
	move.l (%a0),%d0
	addq.l #4,%a0
	move.l %d0,-68(%a0)
	move.l %d0,-100(%a0)
	move.l %d0,-132(%a0)
	move.l %d0,-164(%a0)
	move.l %d0,-196(%a0)
	cmp.l #1094565020,%a0
	jne .L266
	mvz.b cu+8,%d0
	cmp.l %d0,%d2
	jeq .L267
.L269:
	move.l %d2,%d5
	clr.l %d3
	add.l #-43,%d5
	lea cu_src,%a6
	lea CSWTCH.547,%a5
	lea cu_knob,%a4
	move.l #1075575064,%a3
.L268:
	moveq #9,%d0
	cmp.l %d5,%d0
	jcs .L271
	move.l (%a5,%d5.l*4),%d0
.L270:
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
	jne .L268
	move.b %d2,cu+8
	jra .L264
.L267:
	move.l 1075595808,%d0
	cmp.l 4(%a2),%d0
	jne .L269
	move.l 1075596276,%d0
	cmp.l 116(%a2),%d0
	jne .L269
	cmp.l 1075595760.l,%d2
	jne .L269
.L264:
	movem.l (%sp),#31804
	lea (36,%sp),%sp
	rts
.L271:
	move.l #cu_fm_short,%d0
	jra .L270
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
	jle .L281
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
	jgt .L282
	mvz.b %d0,%d2
	mov3q.l #2,%d4
	move.l %d2,%a0
	lea (-48,%a0),%a0
	cmp.l %a0,%d4
	jcc .L283
	moveq #43,%d3
	cmp.l %d2,%d3
	jne .L282
.L283:
	move.b %d0,cu+9
	mvz.b cu+30,%d0
	lea st+8,%a0
	move.b %d1,cu+10
	move.l (%a0),cu+16
	cmp.l %d0,%d1
	jne .L296
	move.b cu+28,%d0
.L284:
	move.b %d0,cu+29
.L282:
	clr.l %d0
.L280:
	movem.l (%sp),#28
	lea (12,%sp),%sp
	rts
.L296:
	clr.b %d0
	jra .L284
.L281:
	tst.l %d2
	jge .L286
	mvz.b cu+9,%d0
	moveq #50,%d1
	cmp.l %d0,%d1
	jne .L287
	mvz.b cu+10,%d1
	move.l %d2,%d0
	not.l %d0
	cmp.l %d1,%d0
	jeq .L297
.L287:
	mvz.b cu+11,%d0
	neg.l %d2
	cmp.l %d0,%d2
	jne .L282
	move.l st+8,%d0
	mov3q.l #3,%d2
	sub.l cu+24,%d0
	cmp.l %d0,%d2
	scc %d0
	mvs.b %d0,%d0
	neg.l %d0
	jra .L280
.L286:
	cmp.l #441,%d2
	jeq .L298
	lea cu_src,%a0
	clr.l %d3
.L289:
	mvs.w (%a0),%d1
	cmp.l %d1,%d2
	jne .L288
	mvz.b cu+8,%d0
	clr.l -(%sp)
	move.l %d0,-(%sp)
	jsr cu_tab
	addq.l #8,%sp
	tst.l %d0
	jeq .L282
	mvz.w %d3,%d3
	move.l %d0,%a0
	lsl.l #4,%d3
	mvz.w 12(%a0,%d3.l),%d0
	jra .L280
.L288:
	addq.l #2,%a0
	addq.l #1,%d3
	moveq #8,%d1
	cmp.l %d3,%d1
	jne .L289
	mvz.b %d0,%d0
	moveq #11,%d3
	cmp.l %d0,%d3
	jge .L290
	clr.l %d0
.L290:
	moveq #127,%d1
	and.l -2147457096,%d1
	mulu.w #152,%d0
	mulu.w #2531,%d1
	move.l %d1,%a0
	add.l #1092966773,%a0
	mvz.b (%a0,%d0.l),%d3
	mvz.b cu+1,%d0
	cmp.l %d3,%d0
	jne .L282
	mov3q.l #1,-(%sp)
	move.l %d3,-(%sp)
	jsr cu_tab
	addq.l #8,%sp
	tst.l %d0
	jeq .L282
	move.l 1075596172,%d1
	move.l %d0,%a0
	cmp.l 116(%a0),%d1
	jne .L282
	lea cu_p2,%a0
	clr.l %d1
.L291:
	mvs.w (%a0),%d4
	cmp.l %d4,%d2
	jne .L292
	moveq #40,%d2
	cmp.l %d3,%d2
	jne .L295
	mov3q.l #3,%d2
	cmp.l %d1,%d2
	jge .L282
.L295:
	mvz.w %d1,%d1
	move.l %d0,%a0
	lsl.l #4,%d1
	mvz.w 12(%a0,%d1.l),%d0
	jra .L280
.L292:
	addq.l #2,%a0
	addq.l #1,%d1
	moveq #8,%d4
	cmp.l %d1,%d4
	jne .L291
	jra .L282
.L297:
	mov3q.l #1,%d0
	jra .L280
.L298:
	mvz.w #2944,%d0
	jra .L280
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
.L314:
	move.l %d2,-(%sp)
	move.l %a6,-(%sp)
	jsr (%a2)
	addq.l #1,%a6
	addq.l #4,%d2
	addq.l #8,%sp
	moveq #16,%d0
	cmp.l %a6,%d0
	jne .L314
	move.l %sp,%d2
	sub.l %a6,%a6
	lea shs,%a3
	add.l #22,%d2
	lea rui_uart_raw,%a2
.L316:
	move.b (%a3,%a6.l),%d0
	mvz.b %d0,%d1
	cmp.l #255,%d1
	jeq .L315
	move.l %a6,%d1
	moveq #32,%d3
	or.l %d3,%d1
	move.b %d0,23(%sp)
	move.b %d1,22(%sp)
	move.l %d2,-(%sp)
	mov3q.l #2,-(%sp)
	jsr (%a2)
	addq.l #8,%sp
.L315:
	addq.l #1,%a6
	mov3q.l #4,%d0
	cmp.l %a6,%d0
	jne .L316
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
	jne .L323
	lea txsx_wait,%a2
	jsr (%a2)
	move.l %d0,%d2
	tst.l %d0
	jeq .L324
	addq.l #1,st+40
.L323:
	clr.l %d2
.L322:
	move.l %d2,%d0
	move.l (%sp)+,%d2
	move.l (%sp)+,%a2
	rts
.L324:
	move.l #1123449384,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L326
	addq.l #1,st+40
	jra .L322
.L326:
	jsr (%a2)
	tst.l %d0
	jne .L327
	mvz.w #4027,%d0
	cmp.l 1094562392.l,%d0
	jlt .L327
	move.l 1094562704,%a0
	mov3q.l #4,%d0
.L328:
	tst.l %a0
	jeq .L327
	move.l 52(%a0),%a0
	subq.l #1,%d0
	tst.l %d0
	jne .L328
	move.l 12(%sp),-(%sp)
	move.l 20(%sp),-(%sp)
	jsr 1073752544
	move.l #1123449384,-(%sp)
	jsr 1073746414
	lea (12,%sp),%sp
	mov3q.l #1,%d2
	addq.l #1,st+36
	jra .L322
.L327:
	move.l #1123449384,-(%sp)
	jsr 1073746414
	addq.l #1,st+40
	addq.l #4,%sp
	jra .L322
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
.L337:
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
	jgt .L337
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
	jne .L340
	mvz.b mr+18,%d0
	cmp.l -12(%fp),%d0
	jeq .L339
.L340:
	pea 8.w
	pea -8(%fp)
	move.b -9(%fp),-2(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L339
	clr.b %d0
	lea (-9,%fp),%a0
	move.b (%a0),mr+18
	move.b %d0,mr+19
	move.w mr+20,%d0
	addq.l #1,%d0
	move.w %d0,mr+20
.L339:
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
.L351:
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
	jeq .L346
	clr.w %d7
	lea ar+48,%a3
	move.w %d7,(%a5,%d1.l*2)
	moveq #127,%d1
	and.l -2147457096,%d1
	mvz.b (%a3,%a6.l),%d6
	cmp.l %d6,%d1
	jne .L346
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
.L346:
	move.b 1(%a0),%d6
	move.b (%a0),%d0
	lsl.l #2,%d6
	mvz.b %d0,%d1
	and.l #768,%d6
	or.l %d1,%d6
	mvz.w (%a2),%d1
	cmp.l %d1,%d6
	jne .L347
	mvz.w ar+60,%d1
	move.l %a6,%d7
	btst %d7,%d1
	jeq .L348
.L347:
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
	jeq .L345
	move.w %d6,(%a2)
	move.l %a6,%d1
	mov3q.l #1,%d0
	lsl.l %d1,%d0
	addq.l #1,ar+62
	move.w ar+60,%d1
	not.l %d0
	and.l %d1,%d0
	move.w %d0,ar+60
.L348:
	addq.l #1,%a6
	add.l #152,%d5
	addq.l #2,%a2
	add.l #162,%d4
	moveq #12,%d6
	cmp.l %a6,%d6
	jne .L351
.L345:
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
.L360:
	lea (%a1,%d0.l),%a2
	move.b (%a2),-9(%fp,%d0.l)
	move.l %d0,%a0
	addq.l #1,%d0
	cmp.l 16(%fp),%d0
	jne .L360
	moveq #-9,%d0
	move.b %d0,-8(%fp,%a0.l)
	pea 9(%a0)
	pea -16(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L359
	addq.l #1,sq+456
.L359:
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
.L370:
	moveq #15,%d3
	cmp.l %d0,%d3
	jcs .L385
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
	jeq .L371
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
.L371:
	addq.l #1,%d1
	cmp.l #256,%d1
	jne .L370
.L385:
	tst.b %d2
	jeq .L369
	move.l %a0,kq_owes
	move.l %d0,st+196
.L369:
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
	jeq .L387
	move.l st+8,%d0
	cmp.l #16383,%d0
	jls .L388
	mvz.w #16383,%d0
.L388:
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
	jeq .L386
	clr.b %d1
	addq.l #1,qp+8
	addq.l #1,st+968
	mov3q.l #1,qp+48
	mov3q.l #1,qp+100
	addq.l #1,pmo+68
	move.b %d1,st+992
.L387:
	tst.b st+161.l
	jeq .L391
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
	jeq .L386
	clr.b %d1
	move.b %d1,st+161
.L391:
	lea ls+4,%a0
	clr.l %d2
	move.l %fp,%d3
	move.l #-260222380,%a3
	lea ls,%a2
	add.l #-12,%d3
	move.l %a0,-16(%fp)
.L393:
	cmp.l ls+24.l,%d2
	jcs .L396
.L395:
	move.w %d2,%d0
	move.l ls+24,%d1
	move.l %d1,-16(%fp)
	mulu.w #5,%d0
	lea (%a2,%d0.l),%a0
	move.l %d2,%d0
.L397:
	cmp.l -16(%fp),%d0
	jcs .L398
	move.l -16(%fp),%d1
	sub.l %d2,%d1
	move.l %d1,-16(%fp)
	move.l %d1,ls+24
	tst.l %d1
	jne .L386
	lea st+164,%a2
	move.l %a2,%a4
.L399:
	move.l -16(%fp),%a0
	cmp.l st+196.l,%a0
	jcc .L403
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
	jne .L400
.L403:
	move.l st+196,%d0
	move.l -16(%fp),%d1
.L401:
	cmp.l %d0,%d1
	jcs .L404
	sub.l -16(%fp),%d0
	move.l %d0,st+196
	tst.l %d0
	jne .L386
	move.l kq_owes,%d2
	tst.l %d2
	jeq .L405
	movem.l -36(%fp),#7180
	unlk %fp
	jra (kq_owed_in.part.0)
.L396:
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
	jeq .L395
	addq.l #5,-16(%fp)
	addq.l #1,%d2
	jra .L393
.L398:
	addq.l #5,%a0
	addq.l #5,%a2
	move.b -1(%a0),-1(%a2)
	addq.l #1,%d0
	move.b (%a0),(%a2)
	move.b 1(%a0),1(%a2)
	move.b 2(%a0),2(%a2)
	move.b 3(%a0),3(%a2)
	jra .L397
.L400:
	addq.l #2,%a4
	addq.l #1,-16(%fp)
	jra .L399
.L404:
	move.l -16(%fp),%a1
	addq.l #1,%d1
	move.b (%a2,%a1.l*2),(%a2)
	lea 1(%a2,%a1.l*2),%a0
	addq.l #2,%a2
	move.b (%a0),-1(%a2)
	jra .L401
.L405:
	lea st+96,%a2
.L410:
	move.l (%a2)+,-16(%fp)
	tst.l -16(%fp)
	jeq .L406
	moveq #-63,%d0
	cmp.l -16(%fp),%d0
	jle .L407
	moveq #-63,%d1
.L424:
	move.l %d1,-16(%fp)
.L408:
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
	jeq .L386
	move.l -16(%fp),%d1
	sub.l %d1,-4(%a2)
	move.l st+64,%d1
	tst.l %d1
	jeq .L406
	move.l -66650100,%d0
	sub.l %d1,%d0
	move.l %d0,st+68
	add.l %d0,st+316
	addq.l #1,st+320
	cmp.l st+324.l,%d0
	jls .L409
	move.l %d0,st+324
.L409:
	clr.l st+64
.L406:
	addq.l #1,%d2
	moveq #16,%d0
	cmp.l %d2,%d0
	jne .L410
.L386:
	movem.l -36(%fp),#7180
	unlk %fp
	rts
.L407:
	moveq #63,%d0
	cmp.l -16(%fp),%d0
	jge .L408
	moveq #63,%d1
	jra .L424
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
	jeq .L425
	move.l ed+64,%d0
	move.l %d0,%a0
	mov3q.l #7,%d2
	sub.l ed+68,%a0
	cmp.l %a0,%d2
	jcc .L427
	addq.l #1,ed+72
.L425:
	move.l (%sp)+,%d2
	rts
.L427:
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
	jcc .L428
	lea (-16,%a1),%a1
	mov3q.l #1,%d2
	cmp.l %a1,%d2
	jcc .L428
	mvz.b 1093765506,%d0
	moveq #11,%d2
	cmp.l %d0,%d2
	jcc .L429
.L428:
	moveq #127,%d0
.L430:
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
	jra .L425
.L429:
	move.b 1093765506,%d0
	jra .L430
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
	jcc .L435
	addq.l #1,ls+92
.L434:
	move.l (%sp)+,%a2
	move.l (%sp)+,%a3
	rts
.L435:
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
	jra .L434
	.size	ls_queue, .-ls_queue
	.align	2
	.type	ls_close, @function
ls_close:
	lea ls,%a0
	tst.b ls.l
	jeq .L437
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
.L437:
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
	jeq .L440
	tst.l ls+36
	jeq .L441
	move.b ls+2,%d1
	add.l #-40,%d1
	mvz.b %d1,%d1
	lsr.l #1,%d1
	jeq .L441
	mov3q.l #7,%d1
	cmp.l %d0,%d1
	jne .L441
	add.l %d2,st+124
.L456:
	jsr flush
	jra .L442
.L441:
	mvz.b ls+125,%d1
	cmp.l %d1,%d0
	jeq .L440
	mov3q.l #3,-(%sp)
	jsr ls_close
	addq.l #4,%sp
.L444:
	clr.l %d0
.L439:
	movem.l (%sp),#28
	lea (12,%sp),%sp
	rts
.L440:
	or.l st+972,%d0
	jne .L444
	tst.b %d3
	jne .L445
	tst.b sv.l
	jeq .L444
	tst.b sv+8.l
	jeq .L444
	move.b sv+10,%d3
	jne .L444
	move.b sv+2,%d4
	mvz.b %d4,%d2
	move.l %d2,-(%sp)
	jsr ls_banked
	addq.l #4,%sp
	tst.l %d0
	jne .L446
	moveq #45,%d1
	cmp.l %d2,%d1
	jeq .L446
	moveq #43,%d1
	cmp.l %d2,%d1
	jne .L439
.L446:
	lea sv+1,%a0
	moveq #45,%d0
	move.b (%a0),ls+1
	move.b %d4,ls+2
	cmp.l %d2,%d0
	jeq .L449
	moveq #43,%d1
	cmp.l %d2,%d1
	jne .L447
.L449:
	moveq #10,%d3
.L447:
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
.L442:
	mov3q.l #1,%d0
	jra .L439
.L445:
	add.l %d2,st+96
	addq.l #1,ls+84
	jra .L456
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
	jne .L458
	clr.b %d1
	move.l pmo+104,%d4
	move.l pmo+9096,%d0
	lea pmo+9100,%a1
.L459:
	tst.l %d0
	jne .L461
	tst.b %d1
	jeq .L462
	clr.l pmo+9096
.L462:
	moveq #127,%d0
	cmp.l %d4,%d0
	jcc .L468
	clr.l %d0
	jra .L457
.L458:
	mulu.w #44,%d0
	add.l #pmo+3420,%d0
.L457:
	movem.l (%sp),#3196
	lea (28,%sp),%sp
	rts
.L461:
	subq.l #1,%d0
	moveq #1,%d1
	mvz.b (%a1,%d0.l),%d6
	cmp.l %d6,%d4
	jls .L459
	move.l %d0,pmo+9096
	lea (%a2,%d0.l),%a0
	mvz.b 9100(%a0),%d0
	move.l %d0,%a1
	jra .L466
.L468:
	move.l %d4,%a1
.L466:
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
	jls .L457
	move.l %d1,pmo+104
	jra .L457
	.size	pmo_get, .-pmo_get
	.align	2
	.type	pj_push, @function
pj_push:
	lea (-12,%sp),%sp
	movem.l #28,(%sp)
	move.l 20(%sp),%d1
	move.l 24(%sp),%a1
#APP
| 5056 "rui.c" 1
	tas pj+136
	smi %d2
| 0 "" 2
#NO_APP
	tst.b %d2
	jeq .L474
	addq.l #1,pj+156
.L473:
	movem.l (%sp),#28
	lea (12,%sp),%sp
	rts
.L474:
	move.l pj,%d3
	move.l %d3,%d0
	sub.l pj+4,%d0
	lsr.l #5,%d0
	jeq .L476
	addq.l #1,pj+156
.L477:
	clr.b %d0
	move.b %d0,pj+136
	jra .L473
.L476:
	moveq #31,%d0
	and.l %d3,%d0
	lsl.l #2,%d0
	move.l %d0,%a0
	add.l #pj+8,%a0
	move.b 19(%sp),(%a0)
	moveq #127,%d0
	cmp.l %d1,%d0
	jcs .L480
	move.l %d1,%d0
	addq.l #1,%d0
.L478:
	move.b %d0,1(%a0)
	moveq #127,%d4
	cmp.l %a1,%d4
	jcs .L479
	move.l %a1,%d2
	addq.l #1,%d2
.L479:
	move.b %d2,2(%a0)
	addq.l #1,%d3
	move.l %d3,pj
	jra .L477
.L480:
	clr.b %d0
	jra .L478
	.size	pj_push, .-pj_push
	.align	2
	.type	led_restore, @function
led_restore:
	tst.b ov_on.l
	jeq .L481
	move.l #1100088672,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L483
	addq.l #1,st+1018
.L481:
	rts
.L483:
	clr.b %d0
	move.b %d0,ov_on
	jsr led_stock
	move.l #1100088672,-(%sp)
	jsr 1073746414
	addq.l #4,%sp
	move.l st+8,%d0
	addq.l #4,%d0
	tst.l %d0
	jne .L484
	mov3q.l #1,%d0
.L484:
	move.l %d0,led_again
	addq.l #1,st+1014
	jra .L481
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
	jne .L489
	clr.l sq+468
	clr.l st+1006
.L490:
	clr.b %d1
	move.b %d1,led_owed
	jsr led_restore
	move.l led_again,%d0
	tst.l %d0
	jeq .L488
	tst.b ov_on.l
	jne .L488
	move.l st+8,%d1
	sub.l %d0,%d1
	jmi .L488
	move.l #1100088672,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L499
.L515:
	addq.l #1,st+1018
.L488:
	movem.l (%sp),#19460
	lea (32,%sp),%sp
	rts
.L489:
	tst.l sq+468
	jne .L491
	lea led_gen,%a0
	move.l (%a0),st+1002
	lea pg_gen,%a1
	move.l #2139062143,%a2
	clr.l st+1006
	mov3q.l #1,sq+476
	move.l (%a1),sq+472
	move.l %a2,sq+480
.L491:
	mov3q.l #1,sq+468
	cmp.l st+1002.l,%d1
	jeq .L492
	btst #0,%d1
	jne .L492
	move.b led_req_mode,%d0
	lea led_req,%a1
	move.w %d0,%a0
	clr.l %d0
.L493:
	lea (%a1,%d0.l),%a2
	moveq #16,%d2
	move.b (%a2),16(%sp,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d2
	jne .L493
	cmp.l led_gen.l,%d1
	jne .L492
	move.l %d1,st+1002
	move.w %a0,%d1
	lea st+1022,%a0
	mvz.b %d1,%d0
	move.l %d0,st+1006
	clr.l %d0
.L495:
	lea 16(%sp,%d0.l),%a1
	moveq #16,%d1
	move.b (%a1),(%a0,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L495
	moveq #1,%d2
	move.b %d2,led_owed
.L492:
	mov3q.l #1,%d0
	cmp.l st+1006.l,%d0
	jne .L490
	clr.l led_again
	tst.b ov_on.l
	jeq .L500
	tst.b led_owed.l
	jeq .L488
.L500:
	move.l #1100088672,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jeq .L515
	clr.l %d0
	lea st+1022,%a2
	lea ov_col,%a0
.L501:
	lea (%a2,%d0.l),%a1
	moveq #16,%d1
	move.b (%a1),(%a0,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L501
	moveq #1,%d2
	sub.l %a6,%a6
	lea led_send4,%a3
	move.b %d2,ov_on
.L502:
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
	jne .L502
	move.l #1100088672,-(%sp)
	jsr 1073746414
	clr.b %d1
	addq.l #1,st+1010
	move.b %d1,led_owed
	jra .L514
.L499:
	jsr led_stock
	move.l #1100088672,-(%sp)
	jsr 1073746414
	clr.l led_again
.L514:
	addq.l #4,%sp
	jra .L488
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
	jge .L520
	mvz.b 5(%a5),%d1
	subq.l #1,%d1
	tst.l %d1
	jne .L520
	mvz.b -1(%a5,%d0.l),%d1
	cmp.l #247,%d1
	jeq .L518
.L520:
	addq.l #1,rx_bad
	jra .L519
.L518:
	move.b 4(%a5),%d3
	move.l %d0,%d2
	moveq #50,%d4
	subq.l #7,%d2
	move.l %d3,%d1
	add.l #-40,%d1
	mvz.b %d1,%d1
	cmp.l %d1,%d4
	jcs .L520
	move.w .L522(%pc,%d1.l*2),%d1
	ext.l %d1
	jmp %pc@(2,%d1:l)
	.balignw 2,0x284c
	.swbeg	&51
.L522:
	.word .L541-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L540-.L522
	.word .L539-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L538-.L522
	.word .L520-.L522
	.word .L537-.L522
	.word .L536-.L522
	.word .L535-.L522
	.word .L534-.L522
	.word .L533-.L522
	.word .L520-.L522
	.word .L532-.L522
	.word .L531-.L522
	.word .L530-.L522
	.word .L529-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L528-.L522
	.word .L527-.L522
	.word .L526-.L522
	.word .L525-.L522
	.word .L520-.L522
	.word .L524-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L523-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L520-.L522
	.word .L521-.L522
.L535:
	mov3q.l #4,%d5
	cmp.l %d2,%d5
	jge .L542
	move.b 7(%a5),%d2
	moveq #15,%d6
	mvz.b %d2,%d4
	cmp.l %d4,%d6
	jcs .L542
	mvz.b 8(%a5),%d5
	mov3q.l #7,%d7
	cmp.l %d5,%d7
	jcs .L542
	move.b 9(%a5),%d1
	jeq .L542
	move.b 10(%a5),%d3
	jeq .L542
	mvz.b %d1,%d6
	add.l %d6,%d4
	moveq #16,%d6
	cmp.l %d4,%d6
	jlt .L542
	mvz.b %d3,%d4
	move.l %d5,%a0
	moveq #8,%d7
	add.l %d4,%a0
	cmp.l %a0,%d7
	jlt .L542
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
	jne .L542
	mvs.b %d2,%d2
	lea (11,%a5),%a2
	clr.l %d0
	lsl.l #6,%d2
	move.l %d2,%a0
	add.l %d5,%a0
	add.l #staging,%a0
.L546:
	move.l %d1,%a1
	mov3q.l #7,%d2
	cmp.l %d1,%d2
	jge .L543
	mov3q.l #7,%a1
.L543:
	move.l %a2,%a3
	sub.l %a1,%d1
	mvz.b (%a3)+,%d3
	clr.l %d2
.L545:
	move.l %d3,%d5
	lsr.l #1,%d3
	move.b 1(%a2,%d2.l),%d6
	lsl.l #7,%d5
	or.l %d6,%d5
	move.b %d5,(%a0,%d0.l)
	addq.l #1,%d0
	cmp.l %d4,%d0
	jne .L544
	addq.l #8,%a0
	clr.l %d0
.L544:
	addq.l #1,%d2
	cmp.l %a1,%d2
	jne .L545
	lea (%a3,%a1.l),%a2
	tst.l %d1
	jgt .L546
.L757:
	moveq #1,%d3
	addq.l #6,%a5
	move.b (%a5),st_seq
	move.b %d3,st_valid
	jra .L532
.L542:
	clr.b %d4
	addq.l #1,rx_bad
	move.b %d4,st_valid
.L519:
	move.l -66650100,%d0
	addq.l #1,mt_calls
	sub.l -38(%fp),%d0
	add.l %d0,mt_sum
	cmp.l mt_max.l,%d0
	jls .L702
	move.l %d0,mt_max
.L702:
	movem.l -80(%fp),#15612
	mov3q.l #1,%d0
	unlk %fp
	rts
.L534:
	tst.l %d2
	jeq .L520
	tst.b st_valid.l
	jeq .L548
	mvz.b 6(%a5),%d1
	mvz.b st_seq,%d0
	cmp.l %d1,%d0
	jne .L548
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
.L548:
	clr.b %d0
	move.b %d0,st_valid
.L532:
	addq.l #1,rx
	jra .L519
.L533:
	mov3q.l #1,%d1
	cmp.l %d2,%d1
	jge .L520
	tst.b 7(%a5)
	jeq .L550
	moveq #1,%d2
	move.b %d2,host_open
	jra .L532
.L550:
	moveq #1,%d3
	move.b %d3,host_close
	jra .L532
.L521:
	move.l qp+56,%d4
	tst.l %d2
	jeq .L551
	move.b 6(%a5),%d5
	mov3q.l #3,%d6
	mvz.b %d5,%d0
	move.b %d5,-40(%fp)
	cmp.l %d0,%d6
	jcc .L552
	mov3q.l #7,%d7
	cmp.l %d0,%d7
	jcs .L553
	clr.l %d1
.L555:
	tst.b 6(%a5,%d1.l)
	jlt .L554
	addq.l #1,%d1
	cmp.l %d2,%d1
	jlt .L555
	mov3q.l #7,%d1
	cmp.l %d0,%d1
	jne .L556
	mov3q.l #1,%d3
	cmp.l %d2,%d3
	jne .L554
	addq.l #1,pmo+64
.L557:
	addq.l #1,qp+72
	jra .L532
.L556:
	mov3q.l #6,%d5
	cmp.l %d0,%d5
	jne .L558
	mov3q.l #5,%d6
	cmp.l %d2,%d6
	jne .L554
	mvz.b 10(%a5),%d1
	lsr.l #6,%d1
	jeq .L559
.L554:
	addq.l #1,pmo+20
.L551:
	mov3q.l #1,%d0
.L578:
	addq.l #1,qp+72
	tst.l %d0
	jeq .L583
	addq.l #1,qp+76
.L583:
	move.l %d4,%d1
	sub.l qp+60,%d1
	lsr.l #2,%d1
	jeq .L584
	addq.l #1,qp+80
	tst.l %d0
	jeq .L532
	tst.l %d2
	jeq .L672
	move.b 6(%a5),%d0
	moveq #127,%d4
	and.l %d4,%d0
.L585:
	move.l %d0,qp+88
	addq.l #1,qp+92
	jra .L532
.L558:
	mov3q.l #4,%d1
	cmp.l %d0,%d1
	jne .L668
	mov3q.l #4,%d5
.L560:
	mov3q.l #3,%d3
	cmp.l %d2,%d3
	jge .L554
	move.b 9(%a5),%d1
	mvz.b %d1,%d6
	tst.b %d1
	jeq .L554
	mov3q.l #4,%d7
	cmp.l %d0,%d7
	jne .L669
	move.w #28,%a0
.L561:
	cmp.l %d6,%a0
	jlt .L554
	ext.w %d1
	muls.w %d5,%d1
	addq.l #4,%d1
	cmp.l %d2,%d1
	jne .L554
	lea (10,%a5),%a0
	sub.l %a1,%a1
.L567:
	mvz.b (%a0),%d3
	moveq #12,%d1
	cmp.l %d3,%d1
	jcs .L554
	move.b 1(%a0),%d7
	move.w %d7,%a2
	moveq #63,%d7
	move.l %a2,%d1
	and.l %d7,%d1
	moveq #40,%d7
	move.l %d1,%a3
	subq.l #1,%a3
	cmp.l %a3,%d7
	jcs .L562
	mov3q.l #4,%d7
	cmp.l %d1,%d7
	jeq .L554
	moveq #12,%d7
	cmp.l %d3,%d7
	jne .L563
	moveq #29,%d3
	cmp.l %d1,%d3
	jeq .L554
	moveq #37,%d7
	cmp.l %d1,%d7
	jcs .L554
.L563:
	mov3q.l #4,%d3
	cmp.l %d0,%d3
	jeq .L565
.L566:
	addq.l #1,%a1
	add.l %d5,%a0
	cmp.l %d6,%a1
	jlt .L567
.L559:
	moveq #127,%d1
	and.l -2147457096,%d1
	mvz.b 7(%a5),%d2
	cmp.l %d2,%d1
	jeq .L568
	addq.l #1,pmo+8
	jra .L557
.L668:
	mov3q.l #5,%d5
	jra .L560
.L669:
	move.w #22,%a0
	jra .L561
.L562:
	move.l %d1,%a3
	mov3q.l #7,%d7
	lea (-48,%a3),%a3
	cmp.l %a3,%d7
	jcs .L564
	moveq #12,%d1
	cmp.l %d3,%d1
	jeq .L554
	mov3q.l #4,%d3
	cmp.l %d0,%d3
	jne .L554
.L565:
	move.l %a2,%d7
	btst #6,%d7
	jeq .L566
	jra .L554
.L564:
	moveq #56,%d7
	cmp.l %d1,%d7
	jne .L554
	moveq #12,%d1
	cmp.l %d3,%d1
	jne .L563
	jra .L554
.L568:
	lea fp,%a0
	mov3q.l #6,%d3
	move.l (%a0),pmo+60
	move.b 8(%a5),%d1
	move.b 7(%a5),%d2
	move.b %d1,-34(%fp)
	move.b %d2,-33(%fp)
	cmp.l %d0,%d3
	jeq .L670
	mvz.b 9(%a5),%d6
.L569:
	mov3q.l #4,%d4
	cmp.l %d0,%d4
	seq %d1
	neg.l %d1
	tst.b %d1
	jeq .L570
	mov3q.l #4,%a3
.L571:
	lea (10,%a5),%a0
	clr.l %d3
	lea pmo,%a2
.L572:
	cmp.l %d3,%d6
	jeq .L557
	mov3q.l #6,%d5
	cmp.l %d0,%d5
	jne .L573
	mvz.b 10(%a5),%d1
	clr.b %d7
	mvz.b 9(%a5),%d2
	clr.b %d5
	lsl.l #7,%d1
	sub.l %a4,%a4
	move.b %d7,-39(%fp)
	or.l %d1,%d2
	move.l %d2,%a1
.L574:
	move.l pmo+56,%d4
	move.l %d4,%d1
	sub.l pmo+80,%d1
	lsr.l #8,%d1
	jeq .L575
	addq.l #1,pmo+4
.L576:
	addq.l #1,%d3
	add.l %a3,%a0
	jra .L572
.L670:
	mov3q.l #1,%d6
	jra .L569
.L570:
	mov3q.l #5,%a3
	jra .L571
.L573:
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
	jne .L671
	move.b 4(%a0),%d5
	jra .L574
.L671:
	clr.b %d5
	jra .L574
.L575:
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
	jra .L576
.L552:
	mov3q.l #1,%d6
	cmp.l %d0,%d6
	jne .L553
	mov3q.l #5,%d7
	cmp.l %d2,%d7
	jne .L553
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
.L580:
	btst %d6,%d3
	jeq .L579
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
.L579:
	addq.l #1,%d6
	moveq #12,%d0
	cmp.l %d6,%d0
	jne .L580
.L581:
	clr.l %d0
	jra .L578
.L553:
	mov3q.l #2,%d1
	cmp.l %d2,%d1
	jne .L582
	cmp.l %d0,%d1
	jne .L551
	mvz.b 7(%a5),%d3
	moveq #12,%d5
	cmp.l %d3,%d5
	jcs .L551
	jsr 1075312702
	clr.l -(%sp)
	move.l %d3,%a0
	pea -1(%a0)
	move.l %d0,%a1
	pea 352(%a1)
	jsr 1074429188
.L756:
	lea (12,%sp),%sp
	jra .L581
.L582:
	mov3q.l #3,%d1
	cmp.l %d2,%d1
	jne .L551
	cmp.l %d0,%d1
	jne .L551
	move.b 7(%a5),%d3
	moveq #11,%d5
	move.l %d3,%d0
	subq.l #1,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d5
	jcs .L551
	move.b 8(%a5),%d5
	jmi .L551
	lsl.l #8,%d5
	jsr 1075398792
	mvz.b %d3,%d3
	move.l %d3,%a0
	and.l #65280,%d5
	move.l %d5,-(%sp)
	pea -1(%a0)
	move.l %d0,-(%sp)
	jsr 1074499748
	jra .L756
.L672:
	clr.l %d0
	jra .L585
.L584:
	tst.l %d2
	jeq .L673
	move.b 6(%a5),%d1
	moveq #127,%d5
	and.l %d5,%d1
.L586:
	mov3q.l #3,%d2
	and.l %d4,%d2
	lea qp,%a0
	move.b %d1,64(%a0,%d2.l*2)
	move.b %d0,65(%a0,%d2.l*2)
	addq.l #1,%d4
	move.l %d4,qp+56
	jra .L532
.L673:
	clr.b %d1
	jra .L586
.L524:
	mov3q.l #2,%d6
	cmp.l %d2,%d6
	jne .L587
	mvz.b 6(%a5),%d0
	moveq #127,%d7
	cmp.l %d0,%d7
	jne .L588
	mvz.b 7(%a5),%d0
	mov3q.l #1,%d1
	cmp.l %d0,%d1
	jcs .L588
	move.l %d0,ls_host_presets
	jra .L532
.L587:
	mov3q.l #1,%d3
	cmp.l %d2,%d3
	jge .L520
.L588:
	mvz.b 6(%a5),%d0
	moveq #126,%d4
	cmp.l %d0,%d4
	jne .L590
	move.b 7(%a5),%d0
	mov3q.l #1,%d5
	and.l %d0,%d5
	move.l %d5,fk_claim
	jra .L532
.L590:
	subq.l #2,%d2
	tst.l %d2
	jne .L520
	moveq #11,%d7
	cmp.l %d0,%d7
	jcs .L520
	mvz.b 7(%a5),%d0
	lsr.l #1,%d0
	jne .L520
	mvz.w 6(%a5),%d0
	move.l %d0,ls_in_v
	addq.l #1,ls_in_gen
	jra .L532
.L541:
	subq.l #6,%d2
	tst.l %d2
	jne .L520
	move.l %a5,%d0
	add.l #12,%d0
	lea (6,%a5),%a0
.L594:
	tst.b (%a0)
	jlt .L520
	addq.l #1,%a0
	cmp.l %a0,%d0
	jne .L594
	addq.l #1,pc_seq
	clr.l %d0
	lea pc_req,%a0
.L595:
	lea 6(%a5,%d0.l),%a1
	mov3q.l #6,%d1
	move.b (%a1),(%a0,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L595
	addq.l #1,pc_seq
	jra .L532
.L538:
	tst.l %d2
	jeq .L520
	move.b 6(%a5),%d0
	mov3q.l #1,%d3
	mvz.b %d0,%d1
	cmp.l %d1,%d3
	jcs .L520
	jne .L597
	moveq #17,%d4
	cmp.l %d2,%d4
	jne .L520
	move.l %a5,%d1
	add.l #23,%d1
	lea (7,%a5),%a0
.L600:
	mvz.b (%a0),%d2
	moveq #111,%d5
	cmp.l %d2,%d5
	jcs .L520
	addq.l #1,%a0
	cmp.l %a0,%d1
	jne .L600
.L597:
	addq.l #1,led_gen
	move.b %d0,led_req_mode
	clr.l %d0
	lea led_req,%a0
.L601:
	mvz.b 6(%a5),%d1
	subq.l #1,%d1
	tst.l %d1
	jne .L602
	moveq #16,%d3
	cmp.l %d0,%d3
	jne .L603
.L602:
	addq.l #1,led_gen
	jra .L532
.L603:
	lea 7(%a5,%d0.l),%a1
	move.b (%a1),(%a0,%d0.l)
	addq.l #1,%d0
	jra .L601
.L540:
	moveq #14,%d4
	cmp.l %d0,%d4
	jcs .L520
	mvz.w #21504,%d1
	btst %d0,%d1
	jeq .L520
	mvz.b 7(%a5),%d0
	moveq #31,%d5
	cmp.l %d0,%d5
	jcs .L520
	mov3q.l #4,%d6
	cmp.l %d2,%d6
	jge .L605
	mvz.b 10(%a5),%d0
	cmp.l %d0,%d5
	jcs .L520
	mov3q.l #7,%d7
	cmp.l %d2,%d7
	jne .L605
	mvz.b 12(%a5),%d0
	cmp.l %d0,%d5
	jcs .L520
.L605:
	addq.l #1,sq_gen
	clr.l %d0
	lea sq_req,%a0
.L607:
	cmp.l %d2,%d0
	jge .L674
	moveq #127,%d3
	move.b 6(%a5,%d0.l),%d1
	and.l %d3,%d1
.L606:
	move.b %d1,(%a0,%d0.l)
	addq.l #1,%d0
	mov3q.l #7,%d4
	cmp.l %d0,%d4
	jne .L607
	addq.l #1,sq_gen
	jra .L532
.L674:
	clr.b %d1
	jra .L606
.L527:
	subq.l #2,%d2
	tst.l %d2
	jne .L520
	mvz.b 7(%a5),%d0
	moveq #31,%d6
	cmp.l %d0,%d6
	jcs .L520
	lsl.l #7,%d0
	mvz.b 6(%a5),%d1
	addq.l #1,pin+56
	or.l %d0,%d1
	move.l %d1,pin+4
	jra .L532
.L526:
	move.l %d0,%d1
	moveq #14,%d7
	add.l #-10,%d1
	rems.l %d7,%d6:%d1
	tst.l %d6
	jne .L675
	mov3q.l #3,%d1
.L610:
	mov3q.l #2,%d3
	cmp.l %d2,%d3
	jge .L611
	move.b 6(%a5),%d4
	mvz.b %d4,%d5
	cmp.l %d5,%d3
	jcs .L611
	move.b 7(%a5),%d3
	mvz.b %d3,%d7
	move.l %d7,%a0
	mov3q.l #1,%d7
	cmp.l %a0,%d7
	jcs .L611
	tst.l %d6
	jeq .L612
	add.l #-11,%d0
	moveq #14,%d7
	rems.l %d7,%d6:%d0
	tst.l %d6
	jne .L611
.L612:
	mov3q.l #4,%d0
	cmp.l %d1,%d0
	jne .L613
	mvz.b 9(%a5),%d0
	lsr.l #3,%d0
	jeq .L613
.L611:
	addq.l #1,ux+12
	jra .L520
.L675:
	mov3q.l #4,%d1
	jra .L610
.L613:
	ext.w %d4
	tst.b %d3
	jne .L614
	move.l %d5,%a0
	add.l #ux,%a0
	mvz.b 3948(%a0),%d0
	mov3q.l #4,%d7
	cmp.l %d1,%d7
	jne .L615
	mvz.b 9(%a5),%d3
	cmp.l %d0,%d3
	jeq .L616
.L614:
	move.w %d4,%d0
	mulu.w #1280,%d0
	move.l %d0,%a0
	add.l #ux+40,%a0
	mvz.w #128,%d0
.L617:
	clr.b (%a0)
	subq.l #1,%d0
	lea (10,%a0),%a0
	tst.l %d0
	jne .L617
	mov3q.l #4,%d0
	cmp.l %d1,%d0
	jne .L676
.L616:
	move.b 9(%a5),%d3
.L618:
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
.L619:
	move.l %d1,%d0
	add.l #12,%d0
	cmp.l %d2,%d0
	jlt .L624
	addq.l #1,ux+8
	jra .L532
.L676:
	clr.b %d3
	jra .L618
.L624:
	move.b 6(%a2),%d0
	jmi .L620
	ext.w %d0
	move.l %d4,%a0
	mulu.w #10,%d0
	lea 40(%a0,%d0.l),%a1
	sub.l %a0,%a0
	add.l #ux,%a1
.L621:
	move.b 7(%a2,%a0.l),%d3
	moveq #94,%d5
	move.l %d3,%d0
	add.l #-32,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d5
	jcs .L622
	move.b %d3,(%a1,%a0.l)
	addq.l #1,%a0
	moveq #9,%d0
	cmp.l %a0,%d0
	jne .L621
.L622:
	clr.b %d6
	move.b %d6,(%a1,%a0.l)
.L620:
	lea (14,%a2),%a2
	add.l #14,%d1
	jra .L619
.L523:
	move.b 6(%a5),%d1
	moveq #96,%d0
	moveq #64,%d7
	and.l %d1,%d0
	cmp.l %d0,%d7
	jne .L677
	tst.l %d2
	jeq .L520
	mov3q.l #1,%a1
	mov3q.l #2,%d0
.L625:
	cmp.l %d2,%d0
	jne .L520
	mvz.b %d1,%d0
	moveq #111,%d3
	cmp.l %d0,%d3
	jcs .L520
	moveq #-128,%d0
	or.l %d1,%d0
	move.b %d0,-32(%fp)
	move.b 7(%a5),-31(%fp)
	tst.l %a1
	jne .L678
	move.b 8(%a5),%d0
.L628:
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
	jne .L629
	tst.l %a1
	jne .L681
	tst.b 8(%a5)
	jeq .L681
	mvz.w #512,%d0
.L630:
	add.l %a0,%d0
	cmp.l %d0,%d3
	jge .L631
	addq.l #1,din_drop
	jra .L532
.L677:
	sub.l %a1,%a1
	mov3q.l #3,%d0
	jra .L625
.L678:
	clr.b %d0
	jra .L628
.L629:
	lsr.l #5,%d1
	jeq .L681
	mvz.w #1536,%d0
	jra .L630
.L681:
	moveq #8,%d0
	jra .L630
.L631:
	mov3q.l #3,-(%sp)
	pea -32(%fp)
	move.l %d2,-(%sp)
	jsr 1074288478
	lea (12,%sp),%sp
	addq.l #1,din_sent
	jra .L532
.L528:
	subq.l #3,%d2
	tst.l %d2
	jne .L520
	mvz.b 6(%a5),%d0
	moveq #11,%d1
	cmp.l %d0,%d1
	jcs .L520
	tst.b 7(%a5)
	jlt .L520
	mvz.b 8(%a5),%d1
	lsr.l #3,%d1
	jne .L520
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
	jra .L532
.L525:
	move.l ux+3880,%d3
	add.l #-10,%d0
	mov3q.l #2,%d4
	cmp.l %d0,%d4
	jcs .L520
	move.b 6(%a5),%d1
	moveq #11,%d5
	mvz.b %d1,%d0
	cmp.l %d0,%d5
	jcs .L520
	mvz.b 7(%a5),%d0
	lsr.l #4,%d0
	jne .L520
	tst.b 8(%a5)
	jlt .L520
	mov3q.l #3,%d7
	cmp.l %d2,%d7
	jge .L636
	tst.b 9(%a5)
	jlt .L520
	mov3q.l #5,%d0
	cmp.l %d2,%d0
	jne .L636
	tst.b 10(%a5)
	jlt .L520
.L636:
	move.l %d3,%d0
	sub.l ux+3884,%d0
	lea ux,%a0
	lsr.l #3,%d0
	jeq .L637
	addq.l #1,ux+28
	jra .L532
.L637:
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
	jlt .L638
	clr.b %d6
	move.b %d6,3891(%a1)
.L639:
	clr.b %d1
.L641:
	add.l %d0,%a0
	addq.l #1,%d3
	move.b %d1,3952(%a0)
	move.l %d3,ux+3880
	addq.l #1,ux+16
	jra .L532
.L638:
	move.b 9(%a5),3891(%a1)
	subq.l #5,%d2
	tst.l %d2
	jne .L639
	move.b 10(%a5),%d1
	jra .L641
.L539:
	subq.l #4,%d2
	tst.l %d2
	jne .L520
	move.l %a5,%d1
	add.l #10,%d1
	lea (6,%a5),%a0
.L644:
	mvz.b (%a0),%d0
	moveq #111,%d2
	cmp.l %d0,%d2
	jcc .L643
	moveq #127,%d3
	cmp.l %d0,%d3
	jne .L520
.L643:
	addq.l #1,%a0
	cmp.l %d1,%a0
	jne .L644
	addq.l #1,pg_gen
	clr.l %d0
	lea pg_req,%a0
.L645:
	lea 6(%a5,%d0.l),%a1
	mov3q.l #4,%d1
	move.b (%a1),(%a0,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L645
	addq.l #1,pg_gen
	jra .L532
.L537:
	tst.l %d2
	jeq .L520
	move.b 6(%a5),%d0
	moveq #127,%d2
	and.l %d2,%d0
	bset #8,%d0
	move.l %d0,splash_req
	jra .L532
.L536:
	add.l #-10,%d0
	moveq #37,%d3
	cmp.l %d0,%d3
	jcs .L520
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
.L648:
	cmp.l %d2,%d0
	jgt .L651
	mvz.w %d1,%d1
	lea (-32,%fp),%a0
	clr.l %d0
	lea mask_keys,%a1
	move.l %d1,mask_enc
.L652:
	move.l (%a0)+,(%a1,%d0.l*4)
	moveq #8,%d1
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L652
	mov3q.l #1,mask_set
	addq.l #1,masks
	jra .L532
.L651:
	move.w %d2,%d3
	mvz.b 9(%a5,%d2.l),%d6
	clr.l %d4
	mulu.w #7,%d3
.L650:
	btst %d4,%d6
	jeq .L649
	cmp.l #255,%d3
	jgt .L649
	moveq #31,%d7
	and.l %d3,%d7
	move.l %d7,%d5
	mov3q.l #1,%d7
	lsl.l %d5,%d7
	move.l %d3,%d5
	asr.l #5,%d5
	or.l %d7,-32(%fp,%d5.l*4)
.L649:
	addq.l #1,%d4
	addq.l #1,%d3
	mov3q.l #7,%d7
	cmp.l %d4,%d7
	jne .L650
	addq.l #1,%d2
	jra .L648
.L531:
	mov3q.l #5,%d3
	cmp.l %d2,%d3
	jge .L653
	move.b 7(%a5),%d1
	moveq #63,%d4
	mvz.b %d1,%d2
	cmp.l %d2,%d4
	jcs .L653
	move.b 8(%a5),%d4
	jmi .L653
	mvz.b 9(%a5),%d3
	lsr.l #6,%d3
	jne .L653
	mvz.b 10(%a5),%d3
	moveq #16,%d6
	cmp.l %d3,%d6
	jcs .L653
	add.l #-13,%d0
	moveq #32,%d7
	cmp.l %d0,%d7
	jge .L682
.L653:
	clr.b %d0
	addq.l #1,rx_bad
	move.b %d0,st_valid
	jra .L519
.L656:
	move.b 12(%a5,%a0.l),%d3
	moveq #94,%d5
	add.l #-32,%d3
	mvz.b %d3,%d3
	cmp.l %d3,%d5
	jcc .L655
	clr.b %d6
	addq.l #1,rx_bad
	move.b %d6,st_valid
	jra .L519
.L655:
	addq.l #1,%a0
.L654:
	cmp.l %d0,%a0
	jlt .L656
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
.L657:
	cmp.l %d0,%d1
	jlt .L658
	clr.b %d1
	add.l %d2,%a1
	moveq #1,%d2
	addq.l #6,%a5
	move.b %d1,8(%a1,%d0.l)
	move.b %d2,st_valid
	move.b (%a5),st_seq
	jra .L532
.L682:
	sub.l %a0,%a0
	jra .L654
.L658:
	lea 12(%a5,%d1.l),%a2
	move.b (%a2),8(%a0,%d1.l)
	addq.l #1,%d1
	jra .L657
.L530:
	tst.l %d2
	jeq .L520
	lea txt_st+4,%a0
	moveq #64,%d0
.L660:
	clr.b (%a0)
	subq.l #1,%d0
	lea (44,%a0),%a0
	tst.l %d0
	jne .L660
	jra .L757
.L529:
	mov3q.l #5,%d4
	cmp.l %d2,%d4
	jge .L520
	move.b 6(%a5),%d1
	moveq #15,%d5
	mvz.b %d1,%d2
	cmp.l %d2,%d5
	jcs .L520
	add.l #-13,%d0
	moveq #11,%d6
	cmp.l %d0,%d6
	jlt .L520
	lea bind_gen,%a1
	addq.l #1,(%a1,%d2.l*4)
	move.b 7(%a5),%d4
	mvz.b %d4,%d5
	lsr.l #6,%d5
	jeq .L663
	st %d4
.L663:
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
.L664:
	cmp.l %d0,%d1
	jlt .L666
	mvz.b 6(%a5),%d0
	addq.l #1,(%a1,%d0.l*4)
	jra .L532
.L666:
	move.b 12(%a5,%d1.l),%d2
	moveq #94,%d6
	move.l %d2,%d4
	add.l #-32,%d4
	mvz.b %d4,%d4
	cmp.l %d4,%d6
	jcc .L665
	move.b %d3,%d2
.L665:
	move.b %d2,6(%a0,%d1.l)
	addq.l #1,%d1
	jra .L664
.L615:
	tst.l %d0
	jne .L614
	jra .L618
	.size	rui_sysex, .-rui_sysex
	.align	2
	.type	ov_suffix, @function
ov_suffix:
	move.l %a2,-(%sp)
	move.l %d2,-(%sp)
	move.l 16(%sp),%d1
	clr.l %d0
.L760:
	move.l 20(%sp),%a0
	tst.b (%a0,%d0.l)
	jne .L761
	cmp.l %d1,%d0
	jle .L766
.L764:
	clr.l %d0
.L759:
	move.l (%sp)+,%d2
	move.l (%sp)+,%a2
	rts
.L761:
	addq.l #1,%d0
	jra .L760
.L765:
	move.l 20(%sp),%a2
	mvs.b (%a0,%a1.l),%d2
	mvs.b (%a2,%a1.l),%d1
	cmp.l %d2,%d1
	jne .L764
	addq.l #1,%a1
.L762:
	cmp.l %a1,%d0
	jne .L765
	mov3q.l #1,%d0
	jra .L759
.L766:
	add.l 12(%sp),%d1
	sub.l %a1,%a1
	move.l %d1,%a0
	sub.l %d0,%a0
	jra .L762
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
	jne .L768
.L780:
	move.l ov_is,%d0
	jra .L767
.L768:
	move.l %d0,%d1
	add.l #-1073742852,%d1
	move.l %d0,ov_vt
	clr.l ov_is
	clr.l ov_list
	addq.l #1,ov_n
	cmp.l #2997243,%d1
	jls .L770
.L771:
	clr.l %d0
.L767:
	movem.l (%sp),#7180
	lea (20,%sp),%sp
	rts
.L770:
	mov3q.l #3,%d1
	and.l %d0,%d1
	tst.l %d1
	jne .L771
	move.l %d0,%a0
	move.l -4(%a0),%d0
	move.l %d0,%d1
	add.l #-1073742848,%d1
	cmp.l #2997247,%d1
	jhi .L771
	btst #0,%d0
	jne .L771
	move.l %d0,%a0
	move.l 4(%a0),%a2
	move.l %a2,%d0
	add.l #-1073742848,%d0
	cmp.l #2997247,%d0
	jhi .L771
.L772:
	move.b (%a2),%d0
	moveq #9,%d1
	add.l #-48,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d1
	jcc .L773
	clr.l %d2
.L774:
	tst.b (%a2,%d2.l)
	jne .L775
	pea .LC5
	move.l %d2,-(%sp)
	move.l %a2,-(%sp)
	lea ov_suffix,%a3
	jsr (%a3)
	lea (12,%sp),%sp
	tst.l %d0
	jne .L777
	pea .LC0
	move.l %d2,-(%sp)
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	tst.l %d0
	jne .L777
	pea .LC1
	move.l %d2,-(%sp)
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
.L777:
	pea .LC2
	move.l %d2,-(%sp)
	move.l %a2,-(%sp)
	move.l %d0,ov_list
	jsr (%a3)
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L778
	moveq #17,%d1
	cmp.l %d2,%d1
	jne .L779
	pea .LC3
	pea 17.w
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	mov3q.l #1,%d1
	eor.l %d1,%d0
.L779:
	move.l %d0,ov_is
	jra .L780
.L773:
	addq.l #1,%a2
	jra .L772
.L775:
	addq.l #1,%d2
	moveq #48,%d0
	cmp.l %d2,%d0
	jne .L774
	jra .L771
.L778:
	pea .LC4
	move.l %d2,-(%sp)
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L781
	mov3q.l #1,ov_is
	jra .L780
.L781:
	lea ov_names,%a4
	clr.l %d3
.L785:
	move.l (%a4)+,%a0
	clr.l %d0
.L782:
	tst.b (%a0,%d0.l)
	jne .L783
	cmp.l %d0,%d2
	jne .L784
	move.l %a0,-(%sp)
	move.l %d2,-(%sp)
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L784
	mov3q.l #1,ov_is
.L784:
	addq.l #1,%d3
	moveq #14,%d0
	cmp.l %d3,%d0
	jne .L785
	jra .L780
.L783:
	addq.l #1,%d0
	jra .L782
	.size	overlay, .-overlay
	.align	2
	.type	sv_tick, @function
sv_tick:
	lea (-60,%sp),%sp
	sub.l %a1,%a1
	movem.l #31996,(%sp)
	move.l 64(%sp),%a4
	sub.l %a6,%a6
	clr.l sv+80
	sub.l %a5,%a5
	move.l 28(%a4),%a2
	clr.l %d0
	lea (20,%a4),%a0
	clr.l %d6
	clr.l %d7
	clr.l %d2
	move.b 1093765506,%d1
	move.l %a0,56(%sp)
	move.b %d1,47(%sp)
	mvz.b %d1,%d4
	clr.l %d1
.L797:
	tst.l %a2
	jeq .L812
	cmp.l 56(%sp),%a2
	jeq .L812
	move.l 8(%a2),%a3
	tst.l %a3
	jne .L798
.L821:
	clr.l %d2
.L799:
	move.l %d2,%d3
	moveq #16,%d5
	lsl.l #2,%d3
	move.b sv+103,%d6
	moveq #11,%d0
	and.l %d5,%d3
	move.w %d6,%a5
	cmp.l %d4,%d0
	jge .L826
	move.l sv_fxb,%a2
	tst.l %a2
	jne .L827
	move.l #1397119061,%d1
	cmp.l 1075551828.l,%d1
	jne .L828
	move.l 1075551832,%a0
	clr.l -(%sp)
	clr.l -(%sp)
	jsr (%a0)
	addq.l #8,%sp
	btst #0,%d0
	jne .L829
	move.l %d0,%a2
	move.l #1397119062,%d5
	cmp.l (%a2),%d5
	jeq .L830
.L829:
	mov3q.l #1,sv_fxb
.L828:
	clr.b %d5
	clr.l %d7
	clr.l %d2
.L831:
	mvz.b %d5,%d1
	mov3q.l #3,%d0
	and.l %d0,%d2
	mov3q.l #4,%d6
	move.l %d1,%a2
	lea (-35,%a2),%a3
	cmp.l %a3,%d6
	jcc .L834
	tst.l %d3
	jeq .L835
	clr.l sv+80
.L835:
	tst.l %d2
	jne .L842
.L836:
	tst.b sv.l
	jeq .L847
	move.b sv+4,%d0
	mov3q.l #1,%d5
	clr.b %d4
	addq.l #1,sv+60
	or.l %d5,%d0
	move.b %d4,sv
	move.b %d4,sv+6
	move.b %d0,sv+4
	jra .L847
.L798:
	move.l (%a3),%d3
	tst.l %d2
	jeq .L800
	cmp.l #1075718412,%d3
	jeq .L801
	cmp.l #1075712228,%d3
	jeq .L801
	cmp.l #1075719596,%d3
	jeq .L801
	cmp.l #1075717140,%d3
	jne .L800
.L801:
	move.l (%a2),%a2
.L802:
	addq.l #1,%d6
	moveq #16,%d3
	cmp.l %d6,%d3
	jne .L797
.L812:
	cmp.l sv+84.l,%d0
	jne .L816
	cmp.l sv+88.l,%a5
	jeq .L817
.L816:
	move.l %d0,sv+84
	move.l %a5,sv+88
	clr.l sv+96
.L818:
	move.l %d6,sv+92
	tst.l %d7
	jeq .L819
	moveq #16,%d5
	cmp.l %d6,%d5
	jeq .L819
	tst.l %a2
	jne .L820
.L819:
	clr.l sv+80
	jra .L821
.L800:
	move.l %d3,%a5
	cmp.l #1075721468,%d3
	jne .L803
	move.l %a3,sv+80
	mov3q.l #1,%d7
.L804:
	tst.l %d2
	jeq .L807
	jra .L876
.L803:
	cmp.l #1075720560,%d3
	jne .L805
	mov3q.l #2,%d0
	or.l %d0,%d7
	move.l %a3,%a1
	jra .L804
.L805:
	cmp.l #1075628548,%d3
	jne .L806
	tst.b 127(%a3)
	sne %d0
	mvs.b %d0,%d0
	neg.l %d0
	or.l %d0,%d1
	jra .L804
.L806:
	tst.l %d2
	jeq .L807
	cmp.l #1075719224,%d3
	jeq .L808
.L876:
	lea sv_covers,%a0
	clr.l %d0
.L809:
	cmp.l (%a0),%d3
	jne .L811
.L884:
	mov3q.l #1,%d1
.L807:
	cmp.l #1076055292,%d3
	seq %d3
	mvs.b %d3,%d3
	neg.l %d3
	or.l %d3,%d2
.L808:
	move.l (%a2),%a2
	move.l %a3,%d0
	jra .L802
.L811:
	addq.l #4,%a0
	addq.l #1,%d0
	moveq #8,%d5
	cmp.l %d0,%d5
	jne .L809
	move.l %d3,-(%sp)
	move.l %d1,56(%sp)
	move.l %a1,52(%sp)
	jsr overlay
	addq.l #4,%sp
	move.l 52(%sp),%d1
	move.l 48(%sp),%a1
	tst.l %d0
	jne .L884
	mov3q.l #1,%a6
	jra .L807
.L817:
	move.l sv+96,%d0
	cmp.l #65534,%d0
	jhi .L818
	addq.l #1,%d0
	move.l %d0,sv+96
	jra .L818
.L820:
	mov3q.l #1,%d6
	eor.l %d6,%d2
	or.l %d1,%d2
	tst.l %a6
	jeq .L823
	cmp.l #1076055292,%a5
	jeq .L823
	moveq #59,%d1
	cmp.l sv+96.l,%d1
	scc %d0
	mvs.b %d0,%d0
	neg.l %d0
	or.l %d0,%d2
.L823:
	btst #0,%d7
	jne .L825
	move.l %a1,sv+80
	addq.l #5,%d2
	jra .L799
.L825:
	addq.l #1,%d2
	jra .L799
.L830:
	move.l %d0,sv_fxb
.L832:
	move.l %a4,-(%sp)
	move.l 4(%a2),%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l %d0,%d2
	tst.l %d0
	jeq .L877
	moveq #15,%d4
	moveq #48,%d3
	and.l %d0,%d4
	and.l %d0,%d3
	btst #6,%d0
	jeq .L878
	mov3q.l #2,%d2
.L833:
	mvz.b -4(%a2,%d4.l),%d7
	clr.l sv+80
.L956:
	clr.b %d5
	jra .L831
.L827:
	mov3q.l #1,%d6
	cmp.l %a2,%d6
	jne .L832
	jra .L828
.L878:
	mov3q.l #1,%d2
	jra .L833
.L826:
	tst.l %d2
	jeq .L879
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
	jra .L831
.L877:
	clr.l %d7
	jra .L956
.L879:
	clr.l %d7
	clr.l %d3
	jra .L956
.L834:
	tst.l %d2
	jeq .L836
	move.l sv_umb,%d0
	tst.l %d0
	jne .L837
	move.l #1481856080,%a0
	cmp.l 1073848892.l,%a0
	jne .L842
	move.l 1073848896,%a0
	moveq #28,%d6
	move.l #1431130183,-(%sp)
	jsr (%a0)
	addq.l #4,%sp
	move.l %d0,%d1
	lsr.l %d6,%d1
	subq.l #4,%d1
	tst.l %d1
	jeq .L839
.L840:
	mov3q.l #1,sv_umb
.L842:
	moveq #11,%d6
	cmp.l %d4,%d6
	jlt .L843
	move.l %a2,-(%sp)
	move.l %d4,-(%sp)
	jsr mr_vb
	addq.l #8,%sp
	moveq #127,%d1
	mvz.b %d0,%d0
	cmp.l %d0,%d1
	jeq .L836
.L843:
	tst.b sv.l
	jeq .L844
	mvz.b sv+1,%d6
	mvz.b sv+10,%d0
	move.l %d6,%a0
	cmp.l %d6,%d4
	jne .L845
	mvz.b sv+2,%d1
	cmp.l %d1,%a2
	jne .L845
	cmp.l %d3,%d0
	jne .L846
.L847:
	mov3q.l #2,%d6
	cmp.l %d2,%d6
	seq %d3
	move.b sv,%d4
	neg.l %d3
	move.b %d3,sv+3
	tst.b %d4
	jeq .L853
	mov3q.l #1,%d0
	cmp.l %d2,%d0
	jeq .L854
.L853:
	mov3q.l #-1,%d0
.L855:
	move.l 68(%sp),%d5
	move.l %d0,sv+116
	cmp.l sv+20.l,%d5
	jeq .L861
	clr.l sv+16
	sub.l %a0,%a0
.L862:
	move.l 68(%sp),%d6
	move.l sv+12,%d0
	move.l st+4,%d7
	move.l %d6,sv+20
	cmp.l commits.l,%d0
	jne .L863
	tst.b %d4
	jeq .L864
	move.l %d7,%d1
	or.l st+972,%d1
	jne .L865
	move.b sv+103,%d1
	jeq .L866
	subq.l #1,%d1
	move.b %d1,sv+103
	mvz.b %d1,%d1
	cmp.l #128,%d1
	jne .L866
.L865:
	clr.b %d1
	move.b %d1,sv+103
.L866:
	mov3q.l #2,%d1
	cmp.l %d2,%d1
	jeq .L868
	cmp.l commits.l,%d0
	jne .L869
	tst.b sv+103.l
	jle .L868
.L869:
	moveq #19,%d5
	cmp.l %a0,%d5
	jcs .L868
	move.l %d7,%d1
	or.l st+972,%d1
	seq %d1
	mvs.b %d1,%d1
	neg.l %d1
	jra .L867
.L839:
	mov3q.l #3,%d1
	and.l %d0,%d1
	tst.l %d1
	jne .L840
	move.l #1431130183,%a1
	move.l %d0,%a0
	cmp.l (%a0),%a1
	jne .L840
	move.l %d0,sv_umb
.L841:
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
	jne .L842
	add.l #32,%d3
	clr.l sv+80
	jra .L842
.L837:
	mov3q.l #1,%d1
	cmp.l %d0,%d1
	jne .L841
	jra .L842
.L845:
	cmp.l %d3,%d0
	jne .L846
	moveq #11,%d1
	moveq #11,%d6
	cmp.l %d4,%d1
	slt %d0
	moveq #1,%d1
	neg.l %d0
	cmp.l %a0,%d6
	jcs .L848
	clr.b %d1
.L848:
	mvz.b %d1,%d1
	mvz.b %d0,%d0
	cmp.l %d1,%d0
	jeq .L844
.L846:
	move.b sv+4,%d0
	mov3q.l #2,%d1
	lea sv+5,%a0
	move.b (%a0),sv+11
	or.l %d1,%d0
	move.b %d0,sv+4
.L844:
	tst.l %d7
	jne .L849
	mvz.b sv+1,%d0
	cmp.l %d0,%d4
	jeq .L850
.L957:
	clr.b %d0
.L851:
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
	jra .L847
.L850:
	mvz.b sv+2,%d0
	cmp.l %d0,%a2
	jne .L957
	mov3q.l #4,%d6
	cmp.l %a3,%d6
	jcs .L957
.L849:
	tst.b sv+8.l
	jne .L880
	tst.l %d7
	jeq .L957
	move.l st+972,%d0
	or.l st+4,%d0
	jne .L957
	moveq #19,%d0
	cmp.l sv+16.l,%d0
	jcs .L957
	moveq #-122,%d0
	jra .L851
.L880:
	moveq #6,%d0
	jra .L851
.L854:
	mvz.b sv+10,%d0
	lsr.l #5,%d0
	jne .L853
	move.l 1100949720,%a2
	move.l %a2,%d0
	add.l #-1073741824,%d0
	cmp.l #67108863,%d0
	jhi .L853
	jsr sq_grid
	tst.l %d0
	jeq .L853
	move.l 348(%a2),%d1
	tst.l %d1
	jeq .L955
	clr.l %d0
	jra .L856
.L858:
	addq.l #1,%d0
.L856:
	btst %d0,%d1
	jeq .L858
	jra .L855
.L955:
	move.l 344(%a2),%d1
	clr.l %d0
	tst.l %d1
	jeq .L853
.L859:
	btst %d0,%d1
	jeq .L860
	add.l #32,%d0
	jra .L855
.L860:
	addq.l #1,%d0
	jra .L859
.L861:
	move.l sv+16,%a0
	cmp.l #65534,%a0
	jhi .L862
	addq.l #1,%a0
	move.l %a0,sv+16
	jra .L862
.L864:
	clr.b %d5
	move.b %d5,sv+103
.L868:
	clr.l %d1
.L867:
	move.w %a5,%d6
	move.b %d1,%d5
	move.b %d1,sv+8
	tst.b %d6
	jge .L870
	tst.b sv+103.l
	jlt .L870
	moveq #1,%d6
	move.b %d6,32(%a4)
.L870:
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
	jne .L871
	move.l sv+104,%d6
	cmp.l sv+88.l,%d6
	jne .L871
	tst.l %d2
	jeq .L872
	move.l st+8,%a0
	moveq #19,%d3
	sub.l sv+108,%a0
	cmp.l %a0,%d3
	jge .L872
.L871:
	moveq #1,%d4
	move.b %d4,sv+102
.L872:
	move.b %d0,sv+100
	mvz.b %d5,%d0
	mvz.b sv+9,%d3
	cmp.l %d0,%d3
	jeq .L796
	tst.l %d1
	jeq .L874
	addq.l #1,sv+72
	mov3q.l #-1,st+20
	mov3q.l #1,st+344
.L875:
	moveq #1,%d0
	move.b %d5,sv+9
	move.b %d0,32(%a4)
.L796:
	movem.l (%sp),#31996
	lea (60,%sp),%sp
	rts
.L863:
	clr.b %d6
	move.b %d6,sv+103
	tst.b %d4
	jeq .L868
	jra .L866
.L874:
	subq.l #2,%d2
	tst.l %d2
	jne .L875
	addq.l #1,sv+76
	jra .L875
	.size	sv_tick, .-sv_tick
	.align	2
	.type	enter, @function
enter:
	move.l %d2,-(%sp)
	move.b 15(%sp),%d1
	tst.l st+4
	jne .L958
	tst.l st+972
	jeq .L960
	clr.l st+972
	mov3q.l #6,st+988
.L960:
	lea commits,%a0
	moveq #16,%d0
	move.l (%a0),st+24
	mov3q.l #1,st+4
	clr.l st+12
	mov3q.l #-1,st+20
	lea st+96,%a0
	addq.l #1,st+48
.L961:
	clr.l (%a0)+
	subq.l #1,%d0
	tst.l %d0
	jne .L961
	lea st+408,%a0
.L962:
	clr.l (%a0)+
	moveq #16,%d2
	addq.l #1,%d0
	cmp.l %d0,%d2
	jne .L962
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
.L958:
	move.l (%sp)+,%d2
	rts
	.size	enter, .-enter
	.align	2
	.type	leave, @function
leave:
	move.l %d2,-(%sp)
	move.b 15(%sp),%d1
	tst.l st+4
	jeq .L965
	clr.l st+4
	clr.l st+1038
	addq.l #1,st+52
	clr.l st+1058
	clr.l st+196
	tst.l nk
	jeq .L967
	moveq #-33,%d0
	moveq #32,%d2
	and.l %d0,st+240
	or.l %d2,st+272
	clr.l nk
.L967:
	clr.l %d0
	lea kq_nodown,%a1
	lea kq_owed,%a0
.L968:
	clr.l (%a1,%d0.l)
	moveq #32,%d2
	clr.l (%a0,%d0.l)
	addq.l #4,%d0
	cmp.l %d0,%d2
	jne .L968
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
	jne .L969
	clr.l st+1006
	jsr led_restore
.L969:
	moveq #1,%d0
	move.l 8(%sp),%a0
	move.b %d0,32(%a0)
.L965:
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
	jeq .L972
	move.l st+8,%d0
	mov3q.l #1,txsx_test_on
	add.l txsx_test,%d0
	clr.l txsx_test
	move.l %d0,txsx_test_end
.L972:
	tst.l kq_owes
	jeq .L973
	jsr (kq_owed_in.part.0)
.L973:
	moveq #31,%d1
	mov3q.l #1,%d0
	and.l %d3,%d1
	move.l %d3,%d2
	lsr.l #5,%d2
	lea kq_nodown,%a0
	move.l (%a0,%d2.l*4),%d4
	lsl.l %d1,%d0
	tst.l 28(%sp)
	jeq .L974
	move.l %d0,%d1
	not.l %d1
	and.l %d4,%d1
	move.l %d1,(%a0,%d2.l*4)
	tst.l kq_owes
	jne .L975
	move.l st+196,%d1
	moveq #15,%d5
	move.l %d1,%a1
	addq.l #6,%a1
	cmp.l %a1,%d5
	jcc .L976
.L975:
	or.l %d0,%d4
	addq.l #1,st+44
	move.l %d4,(%a0,%d2.l*4)
.L971:
	movem.l (%sp),#1084
	lea (20,%sp),%sp
	rts
.L974:
	move.l %d4,%d1
	and.l %d0,%d1
	tst.l %d1
	jeq .L978
	not.l %d0
	and.l %d4,%d0
	move.l %d0,(%a0,%d2.l*4)
	jra .L971
.L978:
	move.l st+196,%d1
	moveq #15,%d4
	cmp.l %d1,%d4
	jcc .L976
	move.l %d1,%a1
	subq.l #1,%a1
	lea st+164,%a0
.L979:
	tst.l %a1
	jlt .L980
	mvz.b (%a0,%a1.l*2),%d4
	cmp.l %d4,%d3
	jne .L981
	move.l %a1,%d3
	add.l %d3,%d3
	move.l %d3,%d4
	add.l #st,%d4
	move.l %d4,%a2
	tst.b 165(%a2)
	jeq .L980
	add.l %d3,%a0
.L982:
	addq.l #1,%a1
	cmp.l %d1,%a1
	jlt .L983
	subq.l #1,%d1
	move.l %d1,st+196
	addq.l #1,st+44
	jra .L971
.L981:
	subq.l #1,%a1
	jra .L979
.L983:
	addq.l #2,%a0
	move.b (%a0),-2(%a0)
	move.b 1(%a0),-1(%a0)
	jra .L982
.L980:
	lea kq_owed,%a0
	move.l (%a0,%d2.l*4),%d1
	move.l %d1,%d3
	and.l %d0,%d3
	tst.l %d3
	jne .L971
	or.l %d0,%d1
	addq.l #1,kq_owes
	move.l %d1,(%a0,%d2.l*4)
	jra .L971
.L976:
	lea st,%a0
	move.l %d1,%d0
	add.l #82,%d0
	move.b %d3,(%a0,%d0.l*2)
	lea (%a0,%d1.l*2),%a0
	addq.l #1,%d1
	move.l %d1,st+196
	move.b 31(%sp),165(%a0)
	jra .L971
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
	jne .L988
	move.l %d0,28(%a0)
	clr.b %d0
	move.l %d1,16(%a0)
.L989:
	move.b %d0,3(%a0)
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L988:
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
	jra .L989
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
.L991:
	cmp.l pmo+104.l,%d3
	jcs .L995
	movem.l (%sp),#3084
	lea (16,%sp),%sp
	rts
.L995:
	move.b (%a2),%d0
	jeq .L992
	mvz.b %d0,%d0
	move.l 20(%sp),%d1
	subq.l #1,%d0
	btst %d0,%d1
	jeq .L992
	clr.l 12(%a2)
	tst.l %d2
	jne .L993
	clr.b %d0
	clr.l 4(%a2)
.L994:
	move.b %d0,2(%a2)
	move.l %d2,-(%sp)
	clr.l -(%sp)
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
.L992:
	addq.l #1,%d3
	lea (44,%a2),%a2
	jra .L991
.L993:
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
	jra .L994
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
	jeq .L1002
	move.l %d2,-(%sp)
	jsr cu_src_setup
	mvz.b cu+1,%d0
	move.l %d2,%d4
	addq.l #4,%sp
	add.l #-43,%d4
	cmp.l %d0,%d2
	jne .L1004
	move.l 1075597888,%d0
	cmp.l 4(%a2),%d0
	jne .L1004
	move.l 1075596172,%d0
	cmp.l 116(%a2),%d0
	jne .L1004
	move.l 1075597884,%d1
	moveq #9,%d0
	cmp.l %d4,%d0
	jcs .L1008
	lea CSWTCH.547,%a0
	move.l (%a0,%d4.l*4),%d0
.L1005:
	cmp.l %d0,%d1
	jeq .L1002
.L1004:
	lea cu_p2,%a3
	clr.l %d3
	lea CSWTCH.547,%a5
	lea cu_knob,%a4
.L1007:
	moveq #9,%d0
	cmp.l %d4,%d0
	jcs .L1009
	move.l (%a5,%d4.l*4),%d0
.L1006:
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
	jne .L1007
	move.w cu+2,%d0
	move.b %d2,cu+1
	addq.l #1,%d0
	move.w %d0,cu+2
.L1002:
	movem.l (%sp),#15388
	lea (28,%sp),%sp
	rts
.L1008:
	move.l #cu_fm_short,%d0
	jra .L1005
.L1009:
	move.l #cu_fm_short,%d0
	jra .L1006
	.size	cu_setup, .-cu_setup
	.align	2
	.type	isr_send, @function
isr_send:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 16(%sp),%d1
	mov3q.l #1,%d0
	cmp.l 1094562388.l,%d0
	jeq .L1015
.L1023:
	clr.l %d0
.L1014:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L1015:
#APP
| 1782 "rui.c" 1
	move.w %sr,%d0
| 0 "" 2
#NO_APP
	move.l %d0,%d3
	move.l %d0,%d2
	and.l #1792,%d3
	mvz.w %d2,%d2
	cmp.l #1279,%d3
	jhi .L1017
	and.l #63743,%d0
	or.l #1280,%d0
#APP
| 1786 "rui.c" 1
	move.w %d0,%sr
| 0 "" 2
#NO_APP
.L1017:
	tst.l 1123449384
	jeq .L1018
.L1020:
#APP
| 1791 "rui.c" 1
	move.w %d2,%sr
| 0 "" 2
#NO_APP
	addq.l #1,sq+388
	jra .L1023
.L1018:
	tst.l 1094562372
	jne .L1020
	move.l %d1,%d0
	add.l 1094562392,%d0
	cmp.l #3800,%d0
	jgt .L1020
	move.l 1094562704,%a0
	tst.l %a0
	jeq .L1020
	move.l 52(%a0),%a0
	tst.l %a0
	jeq .L1020
	move.l 52(%a0),%d0
	move.l 12(%sp),-(%sp)
	move.l %d1,-(%sp)
	jsr 1073752544
#APP
| 1791 "rui.c" 1
	move.w %d2,%sr
| 0 "" 2
#NO_APP
	mov3q.l #1,%d0
	addq.l #8,%sp
	jra .L1014
	.size	isr_send, .-isr_send
	.align	2
	.globl	rui_render_in
	.type	rui_render_in, @function
rui_render_in:
	link.w %fp,#-112
	movem.l #1084,(%sp)
	tst.l 1094562372
	jne .L1031
	mov3q.l #1,txsx_gap
.L1031:
	lea fp,%a0
	addq.l #1,(%a0)
	tst.l fp+8
	jeq .L1032
	move.l (%a0),%d0
	sub.l fp+4,%d0
	cmp.l #3000,%d0
	jls .L1032
	move.l fp+8,%a0
	move.l fp,%d0
	move.l fp+4,%d1
	move.l 1123449124,%d2
	tst.l fp+12
	jeq .L1033
	move.l fp,%a1
	sub.l fp+12,%a1
	cmp.l #7499,%a1
	jls .L1032
.L1033:
	cmp.l %a0,%d2
	seq %d3
	sub.l %d1,%d0
	lea (-90,%fp),%a1
	clr.l %d1
	move.l %a1,%d4
	neg.l %d3
.L1034:
	move.l %d4,%a2
	addq.l #1,%d1
	clr.l (%a2)+
	moveq #9,%d5
	move.l %a2,%d4
	cmp.l %d1,%d5
	jne .L1034
	cmp.l %a0,%d2
	jeq .L1035
	mov3q.l #1,%d1
	move.l 72(%a0),%d2
	and.l %d2,%d1
	btst #0,%d2
	jne .L1035
	move.l %d2,%a0
	add.l #-1073741824,%a0
	cmp.l #129892303,%a0
	jhi .L1035
.L1036:
	move.l %d2,%a0
	moveq #36,%d4
	lea 4(%a0,%d1.l),%a2
	move.l (%a2),(%a1,%d1.l)
	addq.l #4,%d1
	cmp.l %d1,%d4
	jne .L1036
.L1035:
	move.w #19969,%a0
	move.l #-260222380,%d5
	move.b %d3,-48(%fp)
	move.l %d5,-54(%fp)
	move.w %a0,-50(%fp)
	cmp.l #191999,%d0
	jhi .L1048
	mvz.w #1500,%d2
	divu.l %d2,%d0
.L1037:
	move.b %d0,-47(%fp)
	lea (-46,%fp),%a0
	clr.l %d1
.L1038:
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
	jne .L1038
	moveq #-9,%d5
	pea 54.w
	pea -54(%fp)
	move.b %d5,-1(%fp)
	jsr isr_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1032
	lea fp,%a0
	tst.l (%a0)
	jeq .L1049
	move.l (%a0),%d0
.L1040:
	move.l %d0,fp+12
	addq.l #1,fp+16
.L1032:
	move.l 1123623180,%d0
	move.l qp,%d4
	move.l qp+8,%d3
	tst.l qp+12
	jne .L1041
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
.L1041:
	tst.l qp+24
	jne .L1042
	cmp.l qp+16.l,%d0
	jne .L1043
	move.l qp+20,%a2
	cmp.l 1123623184.l,%a2
	jeq .L1042
.L1043:
	mov3q.l #1,qp+24
.L1042:
	tst.l qp+4
	jeq .L1030
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
	jne .L1045
	cmp.l qp+36.l,%d3
	jeq .L1030
.L1045:
	move.l fp,%d1
	moveq #11,%d5
	sub.l qp+32,%d1
	cmp.l %d1,%d5
	jcc .L1030
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
	jeq .L1030
	move.l qp+40,%d0
	tst.l %d0
	jeq .L1046
	move.l qp+84,%a0
	move.l qp+32,%d1
	tst.l %a0
	jeq .L1047
	move.l fp,%a1
	sub.l %d1,%a1
	cmp.l %a0,%a1
	jcc .L1046
.L1047:
	move.l fp,%d4
	sub.l %d1,%d4
	move.l %d4,qp+84
.L1046:
	lea fp,%a1
	addq.l #1,%d0
	move.l %d2,qp+28
	move.l %d3,qp+36
	move.l %d0,qp+40
	move.l (%a1),qp+32
.L1030:
	movem.l -112(%fp),#1084
	unlk %fp
	rts
.L1048:
	moveq #127,%d0
	jra .L1037
.L1049:
	mov3q.l #1,%d0
	jra .L1040
	.size	rui_render_in, .-rui_render_in
	.align	2
	.globl	rui_uart
	.type	rui_uart, @function
rui_uart:
	lea (-40,%sp),%sp
	movem.l #19468,(%sp)
	clr.l %d2
	tst.b ov_on.l
	jne .L1089
	tst.b ovp_on.l
	jne .L1089
	tst.b ovt_on.l
	jeq .L1076
.L1089:
	move.l 44(%sp),%a0
	subq.l #1,%a0
	sub.l %a6,%a6
	lea rui_uart_raw,%a3
	move.l %a0,20(%sp)
	jra .L1081
.L1077:
	move.l 48(%sp),%a0
	mvz.b (%a0,%d2.l),%d0
	addq.l #1,%d2
	move.l %d0,-(%sp)
	jsr uart_byte
	addq.l #4,%sp
.L1076:
	cmp.l 44(%sp),%d2
	jlt .L1077
	clr.l %d0
.L1074:
	movem.l (%sp),#19468
	lea (40,%sp),%sp
	rts
.L1082:
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
	jeq .L1079
	cmp.l 20(%sp),%a6
	jne .L1080
.L1079:
	pea 24(%sp)
	move.l %d3,-(%sp)
	jsr (%a3)
	addq.l #8,%sp
	clr.l %d3
.L1080:
	addq.l #1,%a6
	move.l %d3,%d2
.L1081:
	cmp.l 44(%sp),%a6
	jlt .L1082
	mov3q.l #1,%d0
	jra .L1074
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
	jcc .L1091
.L1095:
	clr.l %d0
.L1090:
	move.l (%sp)+,%d2
	rts
.L1091:
	tst.l sq
	jeq .L1093
	move.l sq+4,%a0
	move.l %a0,%d2
	btst %d1,%d2
	jeq .L1093
	addq.l #1,sq+448
	mov3q.l #1,%d0
	jra .L1090
.L1093:
	tst.l %d0
	jlt .L1096
	moveq #63,%d2
	cmp.l %d0,%d2
	jlt .L1097
.L1094:
	lea pc,%a0
	move.b %d0,48(%a0,%d1.l)
	moveq #1,%d0
	lea st+8,%a1
	move.l (%a1),(%a0,%d1.l*4)
	move.b %d0,60(%a0,%d1.l)
	jra .L1095
.L1096:
	clr.b %d0
	jra .L1094
.L1097:
	moveq #63,%d0
	jra .L1094
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
	jcs .L1104
	mov3q.l #1,%d1
	cmp.l 1079807120.l,%d1
	jeq .L1106
	clr.l sq+540
	clr.l sq+544
.L1104:
	movem.l (%sp),#3132
	lea (24,%sp),%sp
	rts
.L1106:
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
	jeq .L1108
	mvz.b 516(%a0),%d1
	cmp.l %d4,%d1
	jeq .L1109
.L1110:
	clr.l %d0
.L1108:
	mov3q.l #1,%d1
	lsl.l %d2,%d1
	move.l %a1,%d5
	move.b %d3,516(%a0)
	move.b 35(%sp),528(%a0)
	or.l %d1,%d5
	move.l sq+360,%d1
	move.l %d5,sq+540
	btst #8,%d1
	jeq .L1112
	tst.l %d0
	jne .L1104
	tst.l %d4
	jeq .L1113
	tst.l sq+544
	jeq .L1114
.L1113:
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
.L1114:
	lsr.l #7,%d4
	jne .L1104
	tst.l (%a2)
	jeq .L1104
	move.l sq+8,%d0
	btst %d2,%d0
	jeq .L1104
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
	jne .L1115
	mvz.w #917,%d0
	muls.l %d2,%d0
	add.l #709,%d0
	move.b (%a0,%d0.l),%d0
	jpl .L1117
	moveq #127,%d0
.L1117:
#APP
| 1782 "rui.c" 1
	move.w %sr,%d1
| 0 "" 2
#NO_APP
	move.l %d1,%d5
	move.l %d1,%d4
	and.l #1792,%d5
	mvz.w %d4,%d4
	cmp.l #1792,%d5
	jeq .L1119
	and.l #63743,%d1
	or.l #1792,%d1
#APP
| 1786 "rui.c" 1
	move.w %d1,%sr
| 0 "" 2
#NO_APP
.L1119:
	move.l sq+268,%d1
	sub.l sq+272,%d1
	lsr.l #5,%d1
	jeq .L1120
	addq.l #1,sq+380
.L1121:
#APP
| 1791 "rui.c" 1
	move.w %d4,%sr
| 0 "" 2
#NO_APP
	jra .L1104
.L1109:
	mvz.b 528(%a0),%d1
	cmp.l 32(%sp),%d1
	jeq .L1110
	addq.l #1,sq+548
	mov3q.l #1,sq+544
	jra .L1108
.L1112:
	tst.l %d0
	jne .L1104
	jra .L1114
.L1115:
	move.l #85683,%d0
	move.b (%a0,%d0.l),%d0
	move.l #85684,%d1
	mvz.b (%a0,%d1.l),%d1
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d1,%d0
	moveq #127,%d1
	cmp.l %d0,%d1
	jcc .L1117
	moveq #127,%d0
	jra .L1117
.L1120:
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
	jra .L1121
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
	jcc .L1135
	clr.l %d2
.L1135:
	tst.l sq+348
	jne .L1136
	move.l %d2,sq+352
	move.l %d3,sq+356
	mov3q.l #1,sq+348
.L1136:
	lea sq,%a6
	tst.l (%a6)
	jeq .L1137
	cmp.l sq+352.l,%d2
	jeq .L1138
	move.l %d2,%d1
	mvz.b %d1,%d1
	move.l %d4,-(%sp)
	mov3q.l #1,-(%sp)
	clr.l -(%sp)
	move.l %d1,-(%sp)
	mov3q.l #1,-(%sp)
	jsr sq_event
	lea (20,%sp),%sp
.L1138:
	move.l sq+356,%d0
	cmp.l %d0,%d3
	jeq .L1139
	mov3q.l #1,%d1
	cmp.l %d2,%d1
	jne .L1140
	bset #8,%d0
	move.l %d0,sq+360
.L1137:
	move.l %d2,sq+352
	move.l %d3,sq+356
.L1142:
	tst.l sq+344
	jne .L1147
	move.l %sp,%d3
	move.l %sp,%d2
	add.l #42,%d3
	add.l #36,%d2
.L1148:
	move.l sq+272,%d4
	cmp.l sq+268.l,%d4
	jne .L1154
.L1153:
	move.l -66650100,%d0
	sub.l 32(%sp),%d0
	cmp.l sq+396.l,%d0
	jls .L1134
	move.l %d0,sq+396
.L1134:
	movem.l (%sp),#23612
	lea (104,%sp),%sp
	rts
.L1140:
	mvz.b %d0,%d0
	move.l %d4,-(%sp)
	mov3q.l #2,-(%sp)
	move.l %d5,-(%sp)
	move.l %d0,-(%sp)
	mov3q.l #3,-(%sp)
	jsr sq_event
	lea (20,%sp),%sp
.L1141:
	move.l sq+360,%d0
	btst #8,%d0
	jeq .L1137
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
	jra .L1137
.L1139:
	mov3q.l #1,%d0
	cmp.l %d2,%d0
	jne .L1141
	jra .L1137
.L1147:
	mvz.b sq+340,%d0
	move.l %d0,-(%sp)
	pea sq+276
	jsr isr_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1134
	move.l sq+344,%d3
	clr.l %d1
	addq.l #1,sq+376
	lea sq+340,%a0
.L1144:
	cmp.l %d3,%d0
	jlt .L1146
	subq.l #1,%d3
	move.l %d3,sq+344
	jra .L1142
.L1146:
	mvz.w %d0,%d2
	lea sq+276,%a2
	sub.l %a1,%a1
	sub.l %d1,%a2
	lsl.l #4,%d2
.L1145:
	move.l %a2,%d4
	add.l %d1,%d4
	move.l %d4,%a4
	addq.l #1,%a1
	move.b (%a4,%d2.l),(%a2)+
	moveq #16,%d4
	cmp.l %a1,%d4
	jne .L1145
	move.b 1(%a0),(%a0)
	addq.l #1,%a0
	addq.l #1,%d0
	add.l #-16,%d1
	jra .L1144
.L1154:
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
.L1149:
	move.l sq+272,%d0
	add.l %d4,%d0
	cmp.l sq+268.l,%d0
	jeq .L1150
	moveq #14,%d0
	cmp.l %d4,%d0
	jeq .L1150
	move.l sq+272,%d0
	moveq #31,%d1
	add.l %d4,%d0
	and.l %d1,%d0
	lsl.l #3,%d0
	cmp.l 12(%a6,%d0.l),%d5
	jeq .L1151
.L1150:
	move.b %d4,46(%sp)
	move.b #-9,(%a0)+
	sub.l %d2,%a0
	move.l %a0,-(%sp)
	move.l %d2,-(%sp)
	jsr isr_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1153
	add.l %d4,sq+272
	addq.l #1,sq+372
	jra .L1148
.L1151:
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
	jra .L1149
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
	jne .L1175
	move.l pin+16,%d0
	move.l pin+12,%d1
	addq.l #1,pin+32
	move.l %d0,50(%sp)
	or.l 58(%sp),%d0
	or.l %d1,%d0
	jeq .L1175
	move.l pin+20,%a1
	tst.l %a1
	jne .L1177
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
.L1177:
	clr.b %d4
	clr.b %d5
	sub.l %a0,%a0
	clr.l %d3
	move.l pin+8,%d2
	clr.l %d6
	move.l pin+48,%a6
	move.b %d4,63(%sp)
	move.b %d5,62(%sp)
.L1191:
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
	jcs .L1178
	move.l 58(%sp),%d5
	move.l %a4,%d7
	btst %d7,%d5
	jeq .L1178
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
	jeq .L1179
	move.l #128,(%a3)
	move.l #128,(%a2)
	move.l %a1,4(%a3)
	move.l %a1,4(%a2)
	tst.l %a5
	jeq .L1180
	addq.l #1,pin+44
.L1180:
	moveq #1,%d0
	and.l 54(%sp),%d2
	move.b %d0,62(%sp)
.L1181:
	move.l 46(%sp),%a2
	add.l #-2147457816,%a2
	clr.l (%a2)
	cmp.l #32512,%d5
	jeq .L1196
	cmp.l #255,%d5
	jls .L1184
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
	jls .L1185
	mvz.w #65535,%d4
.L1185:
	mulu.w #32512,%d0
	move.w %d4,(%a3)
	divu.l %d5,%d0
	cmp.l #65535,%d0
	jls .L1186
	mvz.w #65535,%d0
.L1186:
	move.w %d0,(%a2)
.L1184:
	moveq #1,%d0
	move.w #32512,(%a0)
	addq.l #1,%a6
	move.b %d0,63(%sp)
.L1196:
	move.w #1,%a0
	jra .L1183
.L1179:
	tst.l %a5
	jeq .L1182
	moveq #127,%d0
	moveq #127,%d4
	move.l %d0,(%a3)
	move.l pin+28,%d0
	move.l %d4,(%a2)
	move.l %d0,4(%a3)
	move.l %d0,4(%a2)
	jra .L1181
.L1182:
	moveq #1,%d4
	move.l pin+24,%d7
	move.l #1073741951,(%a3)
	move.l #1073741951,(%a2)
	move.l %d7,4(%a3)
	or.l %d0,%d2
	move.l %d7,4(%a2)
	addq.l #1,pin+40
	move.b %d4,62(%sp)
	jra .L1181
.L1178:
	move.l 50(%sp),%d4
	and.l %d0,%d4
	tst.l %d4
	jeq .L1187
	move.l %d0,%d4
	not.l %d4
	and.l %d4,%d2
	moveq #1,%d4
	or.l %d0,%d1
	move.w #1,%a0
	move.b %d4,62(%sp)
.L1187:
	move.l %d1,%d4
	and.l %d0,%d4
	tst.l %d4
	jeq .L1183
	btst #6,(%a2)
	jeq .L1189
	not.l %d0
	and.l %d0,%d1
	jra .L1196
.L1189:
	move.l #128,(%a3)
	move.l #128,(%a2)
	move.l %a1,4(%a3)
	move.l %a1,4(%a2)
.L1183:
	addq.l #1,%d3
	moveq #8,%d5
	cmp.l %d3,%d5
	jne .L1191
	tst.b 63(%sp)
	jeq .L1192
	move.l %a6,pin+48
.L1192:
	tst.b 62(%sp)
	jeq .L1193
	move.l %d2,pin+8
.L1193:
	move.w %a0,%d7
	tst.b %d7
	jeq .L1194
	move.l %d1,pin+12
.L1194:
	tst.l %d6
	jeq .L1195
	addq.l #1,pin+36
.L1195:
	move.l -66650100,%d0
	move.l %d6,pin+16
	sub.l 68(%sp),%d0
	cmp.l pin+52.l,%d0
	jls .L1175
	move.l %d0,pin+52
.L1175:
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
	jcc .L1223
.L1225:
	clr.l %d1
.L1224:
	move.l %d1,16(%sp)
	move.l %a0,%d1
	mvz.b %d1,%d1
	clr.l 12(%sp)
	move.l %d0,4(%sp)
	move.l %d1,8(%sp)
	jra ed_queue
.L1223:
	mvz.w #4368,%d1
	btst %d0,%d1
	jeq .L1225
	mov3q.l #3,%d1
	and.l 12(%sp),%d1
	jra .L1224
	.size	ed_report, .-ed_report
	.align	2
	.globl	pm_menu_add
	.type	pm_menu_add, @function
pm_menu_add:
	link.w %fp,#-68
	move.l %a3,-(%sp)
	move.l %a2,-(%sp)
	tst.l 8(%fp)
	jeq .L1229
	lea (-64,%fp),%a2
	clr.l %d0
	move.l %a2,%a0
.L1231:
	clr.l 12(%a0)
	clr.l 8(%a0)
	clr.l (%a0)
	clr.l 4(%a0)
	addq.l #1,%d0
	lea (16,%a0),%a0
	mov3q.l #4,%d1
	cmp.l %d0,%d1
	jne .L1231
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
	jeq .L1229
	tst.l %a3
	jeq .L1229
	tst.l -32(%fp)
	jeq .L1229
	tst.l %d0
	jeq .L1229
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
.L1232:
	mvz.w -66(%fp),%d0
	lsl.l #4,%d0
	pea (%a2,%d0.l)
	jsr 1075251654
	subq.l #1,-68(%fp)
	addq.l #4,%sp
	mov3q.l #-1,%d0
	cmp.l -68(%fp),%d0
	jne .L1232
	addq.l #1,pm+4
.L1229:
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
	jcc .L1245
	addq.l #1,pm+24
	pea pm_t_track
.L1249:
	move.l %a0,-(%sp)
	jsr pm_popup
	addq.l #8,%sp
	rts
.L1245:
	mov3q.l #1,%d1
	cmp.l 1094562388.l,%d1
	jne .L1247
	move.l commits,%d1
	cmp.l pm+28.l,%d1
	jne .L1248
.L1247:
	addq.l #1,pm+20
	pea pm_t_none
	jra .L1249
.L1248:
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
	jeq .L1250
	move.l %d2,-(%sp)
	addq.l #1,cu+12
	jsr cu_src_setup
	addq.l #4,%sp
	move.l %d2,%d0
	mov3q.l #2,%d1
	add.l #-48,%d0
	cmp.l %d0,%d1
	jcc .L1252
	moveq #43,%d0
	cmp.l %d2,%d0
	jne .L1250
.L1252:
	moveq #11,%d1
	cmp.l 12(%sp),%d1
	jcs .L1250
	move.l #1075731444,%a0
	cmp.l sv+88.l,%a0
	jne .L1250
	lea (15,%sp),%a0
	mvz.b cu+30,%d0
	move.b (%a0),cu+10
	lea st+8,%a0
	move.b %d2,cu+9
	move.l (%a0),cu+16
	cmp.l 12(%sp),%d0
	jne .L1254
	move.b cu+28,%d0
.L1253:
	move.b %d0,cu+29
.L1250:
	move.l (%sp)+,%d2
	rts
.L1254:
	clr.b %d0
	jra .L1253
	.size	cu_prep, .-cu_prep
	.align	2
	.globl	cu_mi_settling
	.type	cu_mi_settling, @function
cu_mi_settling:
	mvz.b cu+11,%d1
	move.l 4(%sp),%d0
	addq.l #1,%d0
	cmp.l %d1,%d0
	jne .L1257
	move.l st+8,%d0
	moveq #15,%d1
	sub.l cu+24,%d0
	cmp.l %d0,%d1
	scc %d0
	mvs.b %d0,%d0
	neg.l %d0
.L1255:
	rts
.L1257:
	clr.l %d0
	jra .L1255
	.size	cu_mi_settling, .-cu_mi_settling
	.align	2
	.type	sv_flush, @function
sv_flush:
	link.w %fp,#-112
	movem.l #15420,(%sp)
	move.w #10497,%d4
	move.l #-260222380,%d3
	lea (-42,%fp),%a2
.L1259:
	move.b sv+4,%d0
	jne .L1264
	tst.b sv+102.l
	jeq .L1265
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
	jcc .L1266
	moveq #127,%d0
.L1266:
	move.b %d0,-61(%fp)
	clr.l %d0
	lea (-42,%fp),%a0
.L1267:
	lea -74(%fp,%d0.l),%a1
	addq.l #1,%d0
	moveq #14,%d1
	move.b (%a1),-1(%a0,%d0.l)
	cmp.l %d0,%d1
	jne .L1267
	moveq #-9,%d3
	pea 15.w
	move.l %a0,-(%sp)
	move.b %d3,-28(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1258
	clr.b %d4
	lea sv+100,%a0
	move.b (%a0),sv+101
	lea st+8,%a1
	move.l %d2,sv+104
	move.l (%a1),sv+108
	addq.l #1,sv+112
	move.b %d4,sv+102
.L1265:
	tst.b sv.l
	jeq .L1258
	mvz.b sv+1,%d0
	moveq #11,%d1
	cmp.l %d0,%d1
	jcs .L1258
	not.l %d0
	move.l %d0,-(%sp)
	jsr cu_steps
	addq.l #4,%sp
	tst.l %d0
	jne .L1258
	move.l sv+120,%d3
	cmp.l sv+116.l,%d3
	jeq .L1269
	moveq #1,%d4
	move.b %d4,sv+7
.L1269:
	lea (-74,%fp),%a3
	moveq #16,%d5
	lea sv,%a4
	clr.l %d3
	mov3q.l #-1,%d2
	move.l %d5,-80(%fp)
	move.l %a3,%a2
.L1274:
	mvz.b sv+1,%d0
	move.l sv+116,-(%sp)
	move.l %d3,-(%sp)
	move.l %d0,-(%sp)
	jsr sv_word
	lea (12,%sp),%sp
	move.b sv+7,%d4
	move.w %d0,(%a3)
	tst.b %d4
	jne .L1270
	mvz.w %d0,%d1
	mvz.w 24(%a4),%d5
	cmp.l %d1,%d5
	jeq .L1271
.L1270:
	cmp.l -80(%fp),%d3
	jge .L1272
	move.l %d3,-80(%fp)
.L1272:
	move.l %d3,%d2
.L1271:
	mov3q.l #7,%d1
	cmp.l %d3,%d1
	jge .L1273
	tst.w %d0
	jeq .L1273
	mvz.b sv+1,%d0
	move.l %d0,-(%sp)
	jsr cu_mi_settling
	addq.l #4,%sp
	tst.l %d0
	jne .L1258
.L1273:
	addq.l #2,%a3
	addq.l #1,%d3
	addq.l #2,%a4
	moveq #16,%d5
	cmp.l %d3,%d5
	jne .L1274
	tst.b %d4
	jne .L1285
	mov3q.l #-1,%d0
	cmp.l %d2,%d0
	jne .L1275
.L1258:
	movem.l -112(%fp),#15420
	unlk %fp
	rts
.L1264:
	clr.b %d1
	mov3q.l #2,%d2
	and.l %d0,%d2
	move.w %d4,-38(%fp)
	move.l %d3,-42(%fp)
	move.b %d1,-33(%fp)
	btst #1,%d0
	jeq .L1260
	lea sv+11,%a0
	move.b (%a0),-36(%fp)
	clr.b %d0
.L1261:
	move.b %d0,-35(%fp)
	moveq #-9,%d0
	pea 9.w
	move.l %a2,-(%sp)
	move.b %d0,-34(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1258
	move.b sv+4,%d0
	lsr.l #1,%d2
	addq.l #1,sv+64
	and.l %d0,%d2
	move.b %d2,sv+4
	jra .L1259
.L1260:
	lea sv+5,%a1
	move.b (%a1),-36(%fp)
	move.b sv+6,%d0
	jra .L1261
.L1285:
	clr.l -80(%fp)
	moveq #15,%d2
.L1275:
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
.L1276:
	cmp.l %d2,%d1
	jle .L1277
	cmp.l -80(%fp),%d0
	sge %d0
	move.l %d0,%d1
	neg.l %d1
	tst.b %d1
	jeq .L1278
	move.l %d2,%d1
	sub.l -80(%fp),%d1
	add.l %d1,%d1
	add.l #11,%d1
.L1279:
	moveq #-9,%d5
	neg.l %d0
	move.b %d5,-42(%fp,%d1.l)
	tst.b %d0
	jeq .L1280
	move.l %d2,%d0
	addq.l #6,%d0
	sub.l -80(%fp),%d0
	add.l %d0,%d0
.L1281:
	move.l %d0,-(%sp)
	pea -42(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1258
	lea sv+24,%a0
.L1282:
	cmp.l -80(%fp),%d2
	jge .L1283
	clr.b %d3
	move.l sv+116,%d0
	addq.l #1,sv+68
	move.b %d3,sv+7
	tst.l %d0
	jlt .L1284
	addq.l #1,sv+124
.L1284:
	move.l %d0,sv+120
	jra .L1258
.L1277:
	move.w (%a2,%d1.l*2),%d3
	addq.l #1,%d1
	addq.l #2,%a0
	move.l %d3,%d4
	lsr.l #7,%d4
	move.b %d4,-2(%a0)
	moveq #127,%d4
	and.l %d4,%d3
	move.b %d3,-1(%a0)
	jra .L1276
.L1278:
	moveq #9,%d1
	jra .L1279
.L1280:
	moveq #10,%d0
	jra .L1281
.L1283:
	move.l -80(%fp),%d1
	lea (%a2,%d1.l*2),%a1
	move.w (%a1),(%a0,%d1.l*2)
	addq.l #1,%d1
	move.l %d1,-80(%fp)
	jra .L1282
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
	jne .L1298
	move.l pmo+96,%d2
	cmp.l pmo+76.l,%d2
	jeq .L1299
.L1298:
	lea pmo+76,%a0
	move.l %d0,pmo+100
	move.l (%a0),pmo+96
	tst.l pmo
	jeq .L1299
	lea pmo+584,%a0
	clr.l %d0
.L1300:
	clr.l (%a0)+
	addq.l #1,%d0
	cmp.l #208,%d0
	jne .L1300
	lea pmo+3464,%a0
	clr.l %d0
.L1301:
	clr.b (%a0)
	addq.l #1,%d0
	lea (44,%a0),%a0
	cmp.l #128,%d0
	jne .L1301
	clr.l %d0
.L1302:
	move.l %d0,%d1
	add.l #36,%d1
	clr.l (%a2,%d1.l*4)
	moveq #13,%d1
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L1302
	clr.l pmo
	clr.l pmo+104
	clr.l pmo+9096
	clr.l pmo+300
	addq.l #1,pmo+32
.L1299:
	move.l pmo+56,%d7
	move.l pmo+88,%d2
	cmp.l pmo+68.l,%d2
	jne .L1303
	move.l pmo+92,%d3
	cmp.l pmo+72.l,%d3
	jeq .L1365
.L1303:
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
.L1304:
	moveq #65,%d6
	sub.l %a4,%a4
	clr.l %d4
	lea pmo_get,%a5
.L1305:
	move.l pmo+80,%d2
	cmp.l %d2,%d7
	jeq .L1321
	subq.l #1,%d6
	tst.l %d6
	jne .L1322
.L1321:
	tst.l %d4
	jeq .L1323
.L1309:
	move.l %a4,-(%sp)
	move.l %d4,-(%sp)
	jsr pmo_fade
	addq.l #8,%sp
	mov3q.l #1,%d5
.L1323:
	tst.l pmo
	jne .L1324
.L1355:
	move.l 56(%sp),-(%sp)
	jsr pmo_time
	addq.l #4,%sp
	movem.l (%sp),#31996
	lea (80,%sp),%sp
	rts
.L1365:
	clr.l %d5
	jra .L1304
.L1322:
	mvz.b %d2,%d2
	move.l %d2,%d3
	lsl.l #3,%d3
	lea (%a2,%d3.l),%a0
	mvz.b 1423(%a0),%d0
	cmp.l pmo+100.l,%d0
	jeq .L1306
	addq.l #1,pmo+8
.L1307:
	addq.l #1,pmo+80
	jra .L1305
.L1306:
	mvz.b 1418(%a0),%d0
	mov3q.l #6,%d1
	move.l %d0,%a1
	cmp.l %d0,%d1
	jne .L1308
	mvz.w 1420(%a0),%d0
	mvz.b 1419(%a0),%d2
	addq.l #1,pmo+28
	or.l %d0,%d4
	move.l %d2,%a4
	jra .L1307
.L1308:
	tst.l %d4
	jne .L1309
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
	jne .L1310
	mvz.w 1420(%a0),%d2
	moveq #18,%d0
	lsl.l %d0,%d2
	move.l %d2,%a0
	asr.l %d0,%d2
	tst.l %a0
	jne .L1311
	move.l %d1,%d0
	lsl.l #6,%d0
	lea (%a2,%d0.l),%a0
	add.l 52(%sp),%a0
	tst.b 584(%a0)
	jeq .L1307
.L1311:
	move.l 52(%sp),-(%sp)
	move.l %d1,-(%sp)
	jsr (%a5)
	addq.l #8,%sp
	move.l %d0,%a0
	tst.l %d0
	jne .L1313
	addq.l #1,pmo+16
	mov3q.l #4,pmo+120
	jra .L1307
.L1313:
	moveq #10,%d1
	lsl.l %d1,%d2
	move.l %d3,%a1
	add.l #pmo+1419,%a1
	move.b (%a1),%d0
	move.l %d2,12(%a0)
	tst.b %d0
	jne .L1314
	move.l %d2,4(%a0)
.L1315:
	move.b %d0,2(%a0)
	jra .L1307
.L1314:
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
	jra .L1315
.L1310:
	move.b 1422(%a0),%d0
	mvz.b %d0,%d2
	move.w %d0,%a1
	moveq #126,%d0
	move.l %d2,%a6
	cmp.l %d2,%d0
	jcs .L1366
	move.w %a1,%d2
	tst.b %d2
	jeq .L1317
	move.l %a6,%d0
	move.l #66052,%d2
	muls.l %d2,%d0
	move.l %d0,%a6
.L1316:
	move.l 52(%sp),-(%sp)
	move.l %d1,-(%sp)
	jsr (%a5)
	addq.l #8,%sp
	move.l %d0,%a0
	tst.l %d0
	jne .L1318
	addq.l #1,pmo+16
	mov3q.l #5,pmo+120
	jra .L1307
.L1317:
	move.l %d1,%d0
	lsl.l #6,%d0
	lea (%a2,%d0.l),%a0
	add.l 52(%sp),%a0
	tst.b 584(%a0)
	jeq .L1307
	sub.l %a6,%a6
	jra .L1316
.L1366:
	move.l #8388608,%a6
	jra .L1316
.L1318:
	move.l %d3,%a1
	add.l #pmo+1420,%a1
	mvz.w (%a1),%d1
	moveq #9,%d2
	lsl.l %d2,%d1
	move.l %d1,24(%a0)
	tst.l 28(%a0)
	jne .L1319
	tst.b 3(%a0)
	jne .L1319
	move.l %d1,16(%a0)
.L1319:
	move.l 60(%sp),%d2
	lsl.l #3,%d2
	move.b 1(%a2,%d2.l),%d1
	btst #6,%d1
	jne .L1367
	move.l %d3,%a1
	add.l #pmo+1419,%a1
	mvz.b (%a1),%d1
.L1320:
	move.l %d1,-(%sp)
	move.l %a6,-(%sp)
	move.l %a0,-(%sp)
	jsr pmo_mix
	lea (12,%sp),%sp
	jra .L1307
.L1367:
	clr.l %d1
	jra .L1320
.L1324:
	tst.l %d5
	jne .L1326
	move.l pmo+84,%d3
	cmp.l pmo+60.l,%d3
	jeq .L1326
	move.l (%a3),%d0
	sub.l pmo+60,%d0
	cmp.l #375,%d0
	jls .L1326
	lea pmo+60,%a0
	move.l (%a0),pmo+84
	pea 32.w
	pea 8191.w
	addq.l #1,pmo+12
	jsr pmo_fade
	addq.l #8,%sp
.L1326:
	tst.l -2147418904
	jeq .L1327
	lea pmo+512,%a0
	clr.l %d0
.L1328:
	clr.l (%a0)+
	moveq #18,%d1
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L1328
	move.l #-2147423060,%a0
.L1330:
	move.w (%a0),%d1
	mvz.w %d1,%d0
	cmp.l #571,%d0
	jhi .L1329
	moveq #31,%d3
	lsr.l #5,%d0
	and.l %d3,%d1
	mov3q.l #1,%d3
	add.l #128,%d0
	lsl.l %d1,%d3
	or.l %d3,(%a2,%d0.l*4)
.L1329:
	addq.l #2,%a0
	cmp.l #-2147422964,%a0
	jne .L1330
.L1327:
	move.l pmo+104,%a1
	clr.l %d2
	clr.l pmo+300
	lea pmo,%a4
	lea pmo+3464,%a0
.L1331:
	cmp.l %a1,%d2
	jne .L1345
	lea pmo+3464,%a0
	clr.b %d0
.L1348:
	tst.l %d2
	jne .L1346
	tst.b %d0
	jeq .L1347
	clr.l pmo+104
.L1347:
	move.l pmo+300,%d2
	move.l #-2147420170,%a2
	lea pmo,%a0
	clr.l %d1
	move.l #-2147457058,%a1
	jra .L1353
.L1345:
	move.b (%a0),%d1
	jeq .L1332
	move.b 2(%a0),%d0
	jeq .L1333
	subq.l #1,%d0
	move.b %d0,2(%a0)
	jeq .L1334
	move.l 8(%a0),%d4
	add.l %d4,4(%a0)
.L1333:
	move.b 3(%a0),%d0
	jeq .L1335
	subq.l #1,%d0
	move.b %d0,3(%a0)
	jeq .L1336
	move.l 20(%a0),%d5
	move.l 32(%a0),%d0
	add.l %d5,16(%a0)
	add.l %d0,28(%a0)
.L1335:
	move.b 1(%a0),%d4
	move.l 4(%a0),%d0
	mvz.b %d4,%d3
	tst.l %d0
	jne .L1337
	tst.b 2(%a0)
	jne .L1337
	tst.l 28(%a0)
	jne .L1337
	tst.b 3(%a0)
	jne .L1337
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
.L1332:
	addq.l #1,%d2
	lea (44,%a0),%a0
	jra .L1331
.L1334:
	move.l 12(%a0),4(%a0)
	jra .L1333
.L1336:
	move.l 24(%a0),16(%a0)
	move.l 36(%a0),28(%a0)
	jra .L1335
.L1337:
	moveq #8,%d5
	cmp.l %d3,%d5
	jcs .L1338
	move.l 40(%a0),%d1
	move.l %d1,%d3
	add.l %d3,%d3
	move.l 28(%a0),%d4
	move.l %d3,%a5
	add.l #-2147420300,%a5
	mvz.w (%a5),%d3
	tst.l %d4
	jeq .L1341
	tst.l -2147418904
	jeq .L1340
	move.l %d1,%d5
	lsr.l #5,%d5
	add.l #128,%d5
	move.l (%a2,%d5.l*4),%d6
	moveq #31,%d5
	and.l %d1,%d5
	btst %d5,%d6
	jeq .L1340
	addq.l #1,pmo+52
	move.l (%a3),pmo+108
.L1341:
	asr.l #8,%d0
	add.l %d3,%d0
	tst.l %d0
	jlt .L1368
	cmp.l #32767,%d0
	jgt .L1369
.L1342:
	move.w %d0,(%a5)
	jra .L1332
.L1340:
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
	jra .L1341
.L1368:
	clr.w %d0
	jra .L1342
.L1369:
	move.w #32767,%d0
	jra .L1342
.L1338:
	add.l #-48,%d4
	mvz.b %d4,%d4
	lsr.l #3,%d4
	jne .L1332
	mvz.b %d1,%d1
	move.l pmo+300,%d6
	asr.l #8,%d0
	move.l %d1,%d4
	subq.l #1,%d4
	btst %d4,%d6
	jne .L1343
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
.L1343:
	cmp.l #-32768,%d0
	jlt .L1370
	cmp.l #32767,%d0
	jgt .L1371
.L1344:
	lsl.l #3,%d4
	move.l %d4,%a6
	lea 104(%a6,%d3.l),%a5
	move.w %d0,(%a2,%a5.l*2)
	jra .L1332
.L1370:
	move.w #-32768,%d0
	jra .L1344
.L1371:
	move.w #32767,%d0
	jra .L1344
.L1372:
	moveq #1,%d0
	move.l %d1,%d2
	jra .L1348
.L1346:
	move.l %d2,%d1
	subq.l #1,%d1
	move.w %d1,%d3
	mulu.w #44,%d3
	tst.b (%a0,%d3.l)
	jeq .L1372
	tst.b %d0
	jeq .L1347
	move.l %d2,pmo+104
	jra .L1347
.L1354:
	btst #0,%d0
	jeq .L1350
	move.l %d1,%d3
	add.l #-536856241,%d3
	lsl.l #2,%d3
	mvz.w -26(%a1),%d0
	move.l %d3,%a3
	btst #3,3(%a3)
	jeq .L1373
	mvs.w (%a2),%d3
.L1351:
	move.l %d0,%a5
	add.l %d3,%a5
	move.l %a5,196(%a0)
	move.l %a5,%d0
	cmp.l #32767,%a5
	jle .L1352
	mvz.w #32767,%d0
.L1352:
	move.l %d0,196(%a0)
	mvs.w (%a1),%d0
	move.l %d0,248(%a0)
.L1350:
	addq.l #1,%d1
	addq.l #4,%a0
	addq.l #2,%a1
	lea (84,%a2),%a2
.L1353:
	move.l %d2,%d0
	lsr.l %d1,%d0
	jne .L1354
	tst.l %d2
	jeq .L1355
	lea pmo+9248,%a2
	clr.l %d5
	move.l #pmo+304,%d6
	lea pmo,%a6
.L1364:
	mov3q.l #1,%d1
	and.l %d2,%d1
	move.l %d1,64(%sp)
	btst #0,%d2
	jeq .L1356
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
.L1362:
	move.l %d4,%a5
	add.l #-2147423684,%a5
	lea (-32,%a1),%a3
	sub.l %a0,%a0
	move.l 48(%sp),52(%sp)
	move.l %a5,72(%sp)
.L1361:
	move.l 72(%sp),%a5
	move.l (%a5,%a0.l),%d1
	move.l 52(%sp),%a5
	addq.l #2,52(%sp)
	mvz.w %d1,%d1
	mvz.w (%a5)+,%d0
	move.l %d0,44(%sp)
	tst.l %d0
	jeq .L1357
	move.l %d1,%d0
	sub.l 68(%sp),%d0
	move.l %d0,60(%sp)
	subq.l #1,%d0
	move.l %d0,76(%sp)
	moveq #40,%d0
	cmp.l 76(%sp),%d0
	jcc .L1358
.L1357:
	move.l %d1,(%a1,%a0.l)
	move.l %d1,(%a3,%a0.l)
.L1359:
	addq.l #4,%a0
	moveq #16,%d1
	cmp.l %a0,%d1
	jne .L1361
	lea (16,%a1),%a1
	add.l #16,%d4
	addq.l #8,48(%sp)
	subq.l #1,%d7
	tst.l %d7
	jne .L1374
	move.b %d3,10064(%a6)
	btst #0,%d3
	jeq .L1363
	pea -16(%a2)
	move.l 196(%a4),-(%sp)
	jsr 1074912702
	addq.l #8,%sp
.L1363:
	btst #1,%d3
	jeq .L1356
	move.l %a2,-(%sp)
	move.l 248(%a4),-(%sp)
	jsr 1074912702
	addq.l #8,%sp
.L1356:
	lsr.l #1,%d2
	addq.l #4,%a4
	lea (64,%a2),%a2
	addq.l #1,%a6
	addq.l #2,%d5
	add.l #16,%d6
	tst.l %d2
	jne .L1364
	jra .L1355
.L1373:
	clr.l %d3
	jra .L1351
.L1374:
	move.l 64(%sp),%d7
	jra .L1362
.L1358:
	move.l 44(%sp),%d0
	swap %d0
	clr.w %d0
	or.l %d1,%d0
	move.l %d0,%a5
	moveq #8,%d0
	cmp.l 60(%sp),%d0
	jcs .L1360
	move.l %a5,(%a3,%a0.l)
	move.l %d1,(%a1,%a0.l)
	mov3q.l #1,%d0
.L1431:
	lsl.l %d7,%d0
	or.l %d0,%d3
	jra .L1359
.L1360:
	move.l %a5,(%a1,%a0.l)
	move.l %d1,(%a3,%a0.l)
	mov3q.l #4,%d0
	jra .L1431
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
	jeq .L1433
	move.w #12,%a6
	lea (44,%sp),%a2
	move.l %a2,%a0
.L1434:
	clr.l (%a0)+
	subq.l #1,%a6
	tst.l %a6
	jne .L1434
	move.l pmo+104,%d1
	clr.l %d5
	lea pmo,%a4
	lea pmo+3464,%a0
	move.l %d1,36(%sp)
.L1435:
	cmp.l 36(%sp),%d5
	jne .L1444
	move.l pmo+300,%d2
	tst.l %d2
	jeq .L1449
	lea pmo+9280,%a5
	move.l #pmo,%d3
.L1448:
	btst #0,%d2
	jeq .L1446
	move.b 10064(%a4),%d0
	move.w %d0,%ccr
	jne .L1447
	pea -16(%a5)
	move.l %d3,%a0
	move.l 196(%a0),-(%sp)
	jsr 1074912702
	addq.l #8,%sp
.L1447:
	move.b 10064(%a4),%d0
	move.w %d0,%ccr
	jpl .L1446
	move.l %a5,-(%sp)
	move.l %d3,%a1
	move.l 248(%a1),-(%sp)
	jsr 1074912702
	addq.l #8,%sp
.L1446:
	lsr.l #1,%d2
	addq.l #1,%a4
	addq.l #4,%d3
	lea (64,%a5),%a5
	tst.l %d2
	jne .L1448
.L1449:
	move.l %a6,%d0
	add.l #36,%d0
	move.l (%a2)+,(%a3,%d0.l*4)
	addq.l #1,%a6
	moveq #12,%d0
	cmp.l %a6,%d0
	jne .L1449
	mov3q.l #1,pmo+140
.L1450:
	move.l 40(%sp),-(%sp)
	jsr pmo_time
	addq.l #4,%sp
	move.l pmo+116,%d0
	cmp.l pmo+36.l,%d0
	jls .L1452
	move.l %d0,pmo+36
.L1452:
	movem.l (%sp),#31804
	add.l %d0,pmo+40
	addq.l #1,pmo+44
	lea (92,%sp),%sp
	rts
.L1444:
	move.b (%a0),%d1
	jeq .L1436
	mvz.b 1(%a0),%d0
	moveq #41,%d2
	cmp.l %d0,%d2
	jcs .L1437
	moveq #8,%d3
	cmp.l %d0,%d3
	jcc .L1436
	move.l 40(%a0),%d0
	move.l %d0,%d1
	add.l %d1,%d1
	move.l 28(%a0),%d3
	move.l %d1,%a5
	add.l #-2147420300,%a5
	mvz.w (%a5),%d2
	tst.l %d3
	jeq .L1440
	tst.l -2147418904
	jeq .L1439
	move.l %d0,%d1
	lsr.l #5,%d1
	add.l #128,%d1
	move.l (%a3,%d1.l*4),%d4
	moveq #31,%d1
	and.l %d0,%d1
	btst %d1,%d4
	jeq .L1439
	lea fp,%a1
	addq.l #1,pmo+52
	move.l (%a1),pmo+108
.L1440:
	move.l 4(%a0),%d0
	asr.l #8,%d0
	add.l %d2,%d0
	tst.l %d0
	jlt .L1453
	cmp.l #32767,%d0
	jgt .L1454
.L1441:
	move.w %d0,(%a5)
.L1436:
	addq.l #1,%d5
	lea (44,%a0),%a0
	jra .L1435
.L1439:
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
	jra .L1440
.L1453:
	clr.w %d0
	jra .L1441
.L1454:
	move.w #32767,%d0
	jra .L1441
.L1437:
	moveq #56,%d2
	cmp.l %d0,%d2
	jne .L1436
	move.l 4(%a0),%d0
	asr.l #8,%d0
	cmp.l #32767,%d0
	jle .L1442
	mvz.w #32767,%d0
.L1442:
	mvz.b %d1,%d1
	move.l 16(%a0),%d2
	subq.l #1,%d1
	and.l #8323072,%d2
	cmp.l #-32768,%d0
	jge .L1443
	mvs.w #-32768,%d0
.L1443:
	mvz.w %d0,%d0
	moveq #24,%d3
	or.l %d0,%d2
	mvs.w 28(%a0),%d0
	lsl.l %d3,%d0
	or.l %d0,%d2
	move.l %d2,44(%sp,%d1.l*4)
	jra .L1436
.L1433:
	tst.l pmo+140
	jeq .L1450
.L1451:
	move.l %d0,%d1
	add.l #36,%d1
	clr.l (%a3,%d1.l*4)
	moveq #12,%d1
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L1451
	clr.l pmo+140
	jra .L1450
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
	jcs .L1485
	add.l #36,%d1
	lea pmo,%a0
	move.l (%a0,%d1.l*4),%a0
	tst.l %a0
	jeq .L1485
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
	jge .L1487
	moveq #127,%d0
.L1485:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L1487:
	tst.l %d0
	jgt .L1485
	mov3q.l #1,%d0
	jra .L1485
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
.L1493:
	mov3q.l #1,%d0
	cmp.l fp+20.l,%d0
	jeq .L1493
.L1494:
	mov3q.l #2,%d1
	cmp.l fp+20.l,%d1
	jeq .L1495
	move.l 1100667228,%d0
	cmp.l #cu_text,%d0
	jeq .L1496
	cmp.l 1100664624.l,%d0
	jne .L1496
	move.l #cu_text,%d2
	move.l %d2,1100667228
.L1496:
	move.l #1075731444,%d3
	cmp.l sv+88.l,%d3
	jeq .L1497
	move.l #1093765506,%a1
	moveq #11,%d4
	mvz.b (%a1),%d0
	cmp.l %d0,%d4
	jcs .L1497
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
.L1497:
	tst.b cu.l
	jne .L1498
	move.l #1128813124,%d6
	cmp.l 1073849308.l,%d6
	jne .L1498
	moveq #1,%d7
	pea 52.w
	move.b %d7,cu
	jsr cu_src_setup
	addq.l #4,%sp
	lea cu_steps,%a0
	move.l %a0,1073849316
	lea cu_setup,%a1
	move.l %a1,1073849312
.L1498:
	move.l rx,%d2
	move.l #-66650100,%a2
	addq.l #1,st+8
	move.l (%a2),st+300
	tst.l st
	jne .L1499
	lea rui_sysex,%a3
	move.l %a3,1075551840
	move.l #1381321040,%a4
	move.l %a4,1075551836
	mov3q.l #1,st
	move.l %d2,st+16
.L1500:
	move.l #ux,%d5
	jra .L1670
.L1495:
	pea 10000.w
	jsr 1074367512
	addq.l #4,%sp
	jra .L1494
.L1499:
	tst.b host_close.l
	jeq .L1501
	clr.b %d0
	lea commits,%a0
	move.b %d0,host_close
	move.b %d0,host_open
	move.l (%a0),sv+12
	tst.b sv+103.l
	jeq .L1502
	moveq #-127,%d0
	move.b %d0,sv+103
.L1502:
	mov3q.l #1,-(%sp)
	move.l 8(%fp),-(%sp)
	jsr leave
	addq.l #8,%sp
.L1501:
	tst.b host_open.l
	jeq .L1503
	clr.b %d1
	clr.l -(%sp)
	mov3q.l #1,-(%sp)
	move.l 8(%fp),-(%sp)
	move.b %d1,host_open
	jsr enter
	lea (12,%sp),%sp
.L1503:
	move.l st+956,%d0
	mov3q.l #1,%d3
	cmp.l 1094562388.l,%d3
	jne .L1504
	cmp.l #65534,%d0
	jhi .L1505
	tst.l %d0
	jne .L1506
	moveq #50,%d4
	cmp.l st+8.l,%d4
	jcc .L1507
.L1506:
	addq.l #1,%d0
	move.l %d0,st+956
	moveq #10,%d5
	cmp.l %d0,%d5
	jne .L1505
.L1508:
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
.L1509:
	tst.b st+992.l
	jne .L1513
.L1514:
	tst.l splash_req
	jeq .L1516
	move.l splash_req,%d0
	clr.l splash_req
	tst.l st+4
	jne .L1517
	moveq #127,%d1
	and.l %d1,%d0
	tst.l %d0
	jeq .L1518
	tst.l commits
	jne .L1519
.L1517:
	addq.l #1,st+984
.L1516:
	tst.l st+4
	jeq .L1521
	cmp.l st+16.l,%d2
	jeq .L1522
	clr.l st+12
.L1523:
	move.l %d2,st+16
	clr.b %d1
	move.l st+8,%d3
	clr.l %d0
	lea st+408,%a0
.L1529:
	move.l (%a0)+,%a1
	tst.l %a1
	jeq .L1527
	move.l %d3,%d4
	sub.l %a1,%d4
	jmi .L1527
	moveq #1,%d1
	clr.l -4(%a0)
.L1527:
	addq.l #1,%d0
	moveq #16,%d5
	cmp.l %d0,%d5
	jne .L1529
	tst.b %d1
	jeq .L1530
	mov3q.l #1,st+344
.L1530:
	move.l %d2,-(%sp)
	move.l 8(%fp),-(%sp)
	jsr sv_tick
	addq.l #8,%sp
	tst.b ls.l
	jeq .L1531
	tst.b sv.l
	jeq .L1532
	tst.b sv+8.l
	jeq .L1532
	tst.b sv+10.l
	jne .L1532
	move.l sv,%d0
	move.l ls,%d6
	eor.l %d6,%d0
	and.l #16776960,%d0
	or.l st+4,%d0
	jeq .L1531
.L1532:
	mov3q.l #5,-(%sp)
	jsr ls_close
	addq.l #4,%sp
.L1531:
	move.l ls_in_gen,%d7
	cmp.l ls+48.l,%d7
	jeq .L1533
	move.l ls_in_v,%d0
	lea ls_in_gen,%a1
	move.l ls+36,%a0
	move.l (%a1),ls+48
	tst.b ls.l
	jeq .L1533
	move.l %d0,%d1
	lsr.l #8,%d1
	mvz.b ls+1,%d2
	cmp.l %d1,%d2
	jne .L1533
	mov3q.l #1,%d1
	and.l %d1,%d0
	tst.l %a0
	jeq .L1534
	tst.l %d0
	jne .L1534
	clr.l st+124
.L1534:
	move.l %d0,ls+36
	mov3q.l #1,ls+40
.L1533:
	tst.l ls+36
	jeq .L1535
	tst.l ls+40
	jne .L1535
	move.l st+8,%d0
	moveq #20,%d2
	sub.l ls+44,%d0
	cmp.l %d0,%d2
	jcc .L1535
	clr.l ls+36
	addq.l #1,ls+56
	clr.l st+124
.L1535:
	move.l u46+8,%d0
	tst.l %d0
	jeq .L1536
	tst.b ls.l
	jne .L1537
	tst.l st+4
	jne .L1537
	move.l st+8,%d1
	moveq #20,%d3
	sub.l %d0,%d1
	cmp.l %d1,%d3
	jcs .L1537
	move.l #1093765506,%a1
	moveq #11,%d4
	mvz.b (%a1),%d0
	cmp.l %d0,%d4
	jcs .L1537
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
	jeq .L1538
.L1537:
	clr.l u46+8
.L1536:
	move.l pm,%d2
	tst.l %d2
	jeq .L1539
	clr.l pm
	add.l #31,%d2
	tst.b ls.l
	jeq .L1540
	mov3q.l #4,-(%sp)
	jsr ls_close
	addq.l #4,%sp
.L1540:
	clr.l st+1038
	tst.l st+4
	jeq .L1541
	moveq #1,%d7
	mvz.w #256,%d6
	moveq #1,%d0
	move.b %d2,st+993
	addq.l #1,pm+16
	move.l %d6,st+296
	move.b %d7,st+161
	move.w %d0,st+162
.L1542:
	tst.l st+1058
	jne .L1544
	tst.l sv+96
	jne .L1545
	move.l sv+88,-(%sp)
	jsr overlay
	addq.l #4,%sp
	tst.l %d0
	jeq .L1543
	lea st+8,%a0
	mov3q.l #1,st+1058
	mov3q.l #1,st+1062
	move.l (%a0),st+1066
	addq.l #1,st+1070
	addq.l #1,st+1090
.L1544:
	tst.l st+4
	jne .L1546
	clr.l st+1058
.L1547:
	tst.l st+972
	jne .L1551
	tst.b sv+8.l
	jne .L1551
.L1552:
	move.l st+1082,%d0
	tst.l %d0
	jeq .L1554
	sub.l st+8,%d0
	tst.l %d0
	jgt .L1555
	clr.l st+1082
.L1555:
	moveq #1,%d0
	move.l 8(%fp),%a0
	move.b %d0,32(%a0)
.L1554:
	move.l sq_gen,%d0
	move.b 1093765506,%d2
	cmp.l sq+400.l,%d0
	jeq .L1556
	mov3q.l #1,%d1
	and.l %d0,%d1
	btst #0,%d0
	jne .L1556
	sub.l %a0,%a0
	lea sq_req,%a1
.L1557:
	lea (%a1,%a0.l),%a3
	mov3q.l #7,%d3
	lea (-140,%fp),%a2
	move.b (%a3),(%a2,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d3
	jne .L1557
	cmp.l sq_gen.l,%d0
	jne .L1556
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
	jeq .L1559
	move.l sq+4,%d1
.L1559:
	mvz.b -134(%fp),%d0
	mvz.b -135(%fp),%d4
	lsl.l #7,%d0
	or.l %d4,%d0
	and.l #4095,%d0
	or.l %d1,%d0
	move.l %d0,pin
	tst.l sq
	jeq .L1560
	btst #1,%d3
	jeq .L1561
.L1560:
	mvz.w #255,%d4
	mvz.w #8191,%d5
	addq.l #1,sq+452
	mov3q.l #1,ed+92
	move.l %d4,sq+404
	move.l %d5,ed+260
.L1561:
	mov3q.l #1,sq
.L1556:
	tst.l sq
	jne .L1562
	clr.l sq+408
.L1563:
	jsr led_tick
	move.l sq+468,%d2
	move.l pg_gen,%d0
	mvz.b ovp_on,%d3
	tst.l %d2
	jeq .L1613
	cmp.l sq+472.l,%d0
	jeq .L1614
	btst #0,%d0
	jne .L1614
	move.b pg_req,%d5
	move.b pg_req+1,%d4
	move.b pg_req+2,%d2
	move.b pg_req+3,%d1
	cmp.l pg_gen.l,%d0
	jne .L1614
	move.b %d5,sq+480
	move.b %d4,sq+481
	move.b %d2,sq+482
	move.b %d1,sq+483
	move.l %d0,sq+472
	mov3q.l #1,sq+476
.L1614:
	clr.l %d2
	clr.l %d0
	lea sq+480,%a0
.L1616:
	mvz.b (%a0,%d0.l),%d4
	moveq #111,%d5
	cmp.l %d4,%d5
	jcs .L1615
	mov3q.l #1,%d4
	lsl.l %d0,%d4
	or.l %d4,%d2
.L1615:
	addq.l #1,%d0
	mov3q.l #4,%d6
	cmp.l %d0,%d6
	jne .L1616
.L1613:
	cmp.l %d3,%d2
	jne .L1617
	tst.l sq+476
	jeq .L1618
.L1617:
	move.l #1100088672,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L1805
	addq.l #1,st+1018
.L1618:
	tst.l st+4
	jeq .L1806
	tst.l st+1058
	seq %d2
	mvs.b %d2,%d2
	neg.l %d2
.L1626:
	move.l st+8,%d0
	moveq #10,%d3
	divu.l %d3,%d0
	btst #0,%d0
	jeq .L1807
	clr.b %d3
.L1627:
	mvz.b k44+24,%d0
	cmp.l %d2,%d0
	jne .L1628
	tst.l %d2
	jeq .L1629
	mvz.b k44+25,%d1
	mvz.b %d3,%d0
	cmp.l %d1,%d0
	jeq .L1629
.L1628:
	move.l #1100088672,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L1630
	addq.l #1,st+1018
.L1629:
	jsr flush
	move.b pc+79,%d2
	move.l pc_seq,%d1
	lea pc,%a2
	tst.b %d2
	jne .L1633
	btst #0,%d1
	jne .L1634
	cmp.l pc+72.l,%d1
	jeq .L1634
	clr.l %d0
	lea pc_req,%a0
	lea (-140,%fp),%a3
.L1635:
	lea (%a0,%d0.l),%a1
	mov3q.l #6,%d3
	move.b (%a1),(%a3,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d3
	jne .L1635
	cmp.l pc_seq.l,%d1
	jne .L1634
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
	jlt .L1637
	jsr 1075320104
	move.l %d0,-(%sp)
	jsr 1073963888
	addq.l #4,%sp
	tst.l %d0
	jne .L1638
.L1637:
	moveq #3,%d2
.L1639:
	move.b %d2,pc+78
	mvz.b %d2,%d2
	moveq #1,%d1
	move.b %d4,pc+76
	add.l #42,%d2
	move.w (%a2,%d2.l*2),%d0
	move.b %d1,pc+79
	addq.l #1,%d0
	move.w %d0,(%a2,%d2.l*2)
.L1633:
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
	jeq .L1634
	move.w pc+92,%d0
	clr.b %d1
	addq.l #1,%d0
	move.b %d1,pc+79
	move.w %d0,pc+92
.L1634:
	move.b st+992,%d0
	move.b st+161,%d1
	or.l %d1,%d0
	tst.b %d0
	jne .L1654
	lea (-140,%fp),%a2
	sub.l %a1,%a1
	lea mr,%a4
	clr.l %d1
	move.l %a2,%a5
	move.l %a2,%d3
	move.l %a4,%a3
.L1656:
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
	jeq .L1655
	addq.l #1,%d1
.L1655:
	lea (152,%a1),%a1
	cmp.l #1824,%a1
	jne .L1656
	tst.b mr+12.l
	jne .L1657
	sub.l %a0,%a0
.L1658:
	lea (%a2,%a0.l),%a1
	moveq #12,%d0
	move.b (%a1),(%a3,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d0
	jne .L1658
	moveq #127,%d0
	and.l -2147457096,%d0
	moveq #1,%d1
	move.b %d0,mr+18
	move.b %d1,mr+12
.L1659:
	jsr sv_flush
	jsr arp_tick
.L1654:
	tst.b sv+103.l
	jge .L1666
	clr.b %d1
	move.l 8(%fp),%a0
	move.b %d1,32(%a0)
.L1666:
	tst.l st
	jne .L1500
.L1667:
	mvz.b cu+9,%d2
	tst.l %d2
	jeq .L1695
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
	jeq .L1696
	move.l st+8,%d0
	mov3q.l #4,%d3
	sub.l cu+16,%d0
	cmp.l %d0,%d3
	jcc .L1695
.L1700:
	clr.b %d4
	move.b %d4,cu+9
.L1695:
	tst.l st
	jeq .L1701
	mov3q.l #1,%d0
	cmp.l 1094562388.l,%d0
	jne .L1702
	tst.l st+968
	jeq .L1702
	move.l dp,%d0
	move.b 1093765506,%d2
	tst.l %d0
	jeq .L1703
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
	jeq .L1705
	clr.l dp
.L1703:
	tst.b k44+20.l
	jeq .L1706
	move.l k44+20,%d0
	and.l #16776960,%d0
	tst.l %d0
	jne .L1706
	tst.l st+4
	jeq .L1707
	tst.l st+1058
	jne .L1706
.L1707:
	move.l st+8,%d0
	sub.l k44,%d0
	lsr.l #3,%d0
	jeq .L1706
	move.l sv+88,-(%sp)
	jsr overlay
	addq.l #4,%sp
	or.l ov_list,%d0
	jne .L1706
	tst.l st+4
	sne %d0
	move.w #257,%d7
	neg.l %d0
	move.b %d0,k44+26
	move.w %d7,k44+22
.L1706:
	move.b k44+23,%d0
	jeq .L1708
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
	jeq .L1705
	mvz.b k44+23,%d0
	tst.b k44+26.l
	jeq .L1711
	mov3q.l #1,%d4
	cmp.l %d0,%d4
	jne .L1712
	addq.l #1,k44+28
.L1713:
	clr.b %d0
	move.b %d0,k44+23
.L1708:
	mvz.b %d2,%d1
	moveq #11,%d3
	cmp.l %d1,%d3
	jcs .L1705
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
	jeq .L1716
	clr.b %d6
	move.l %d0,dp+8
	move.b %d6,dp+22
.L1717:
	moveq #52,%d7
	cmp.l %d5,%d7
	jcs .L1812
	move.b %d3,%d0
	move.l #1075572644,%a0
	ext.w %d0
	mvz.w %d0,%d0
	lsl.l #3,%d0
	move.l (%a0,%d0.l),%a0
.L1719:
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
	jeq .L1813
	move.l %a0,%d0
	add.l #-1073741824,%d0
	cmp.l #67108863,%d0
	sls %d0
	mvs.b %d0,%d0
	neg.l %d0
.L1720:
	clr.l %d1
	lea (-140,%fp),%a1
.L1722:
	tst.l %d0
	jeq .L2125
	move.b (%a0,%d1.l),%d6
	move.l %d6,%d7
	subq.l #1,%d7
	mvz.b %d7,%d7
	move.l %d7,%a2
	moveq #125,%d7
	cmp.l %a2,%d7
	jcs .L1815
.L1721:
	move.b %d6,9(%a1,%d1.l)
	addq.l #1,%d1
	moveq #12,%d6
	cmp.l %d1,%d6
	jne .L1722
	moveq #-9,%d7
	pea 22.w
	move.l %a1,-(%sp)
	move.b %d7,-119(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1705
	move.w #257,%a0
	move.b %d2,dp+20
	move.b %d3,dp+21
	addq.l #1,dp+12
	move.w %a0,dp+22
	jra .L1718
.L1507:
	move.l st+4,%d0
	tst.l %d0
	jeq .L1505
	moveq #10,%d6
	move.l %d6,st+956
	jra .L1508
.L1505:
	move.l st+960,%d3
	move.l %d3,%d1
	subq.l #1,%d1
	lsr.l #1,%d1
	jne .L1509
	moveq #20,%d1
	moveq #20,%d5
	muls.l %d3,%d1
	cmp.l %d1,%d5
	seq %d1
	neg.l %d1
	tst.b %d1
	jeq .L1510
	moveq #30,%d1
.L1511:
	cmp.l %d1,%d0
	jne .L1509
	cmp.l st+964.l,%d2
	jne .L1512
	moveq #1,%d6
	move.w #4095,%d7
	addq.l #1,%d3
	move.l %d3,st+960
	move.b %d6,st+992
	move.b %d6,mr+13
	move.b %d6,mr+19
	move.w %d7,ar+60
.L1513:
	tst.b sv.l
	jeq .L1514
	moveq #1,%d0
	move.b sv+10,%d1
	move.b %d0,sv+4
	move.b sv+1,%d0
	or.l %d1,%d0
	move.w #257,%d1
	move.b %d0,sv+5
	move.w %d1,sv+6
	jra .L1514
.L1510:
	moveq #50,%d1
	jra .L1511
.L1512:
	mov3q.l #3,st+960
	jra .L1509
.L1504:
	tst.l %d0
	jeq .L1515
	addq.l #1,pmo+72
.L1515:
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
	jeq .L1514
	jsr sq_forget
	jra .L1514
.L1518:
	mov3q.l #2,-(%sp)
	move.l 8(%fp),-(%sp)
	jsr splash_end
	addq.l #8,%sp
	jra .L1516
.L1519:
	tst.l st+972
	jne .L1520
	mov3q.l #1,st+972
	addq.l #1,st+980
	mov3q.l #-1,st+20
	clr.l st+12
	mov3q.l #1,st+344
.L1520:
	move.l %d0,st+976
.L1521:
	tst.l st+972
	jeq .L1523
	cmp.l st+16.l,%d2
	jeq .L1524
	clr.l st+12
.L1525:
	move.l st+976,%d0
	subq.l #1,%d0
	move.l %d0,st+976
	tst.l %d0
	jne .L1523
	mov3q.l #1,-(%sp)
	jra .L2122
.L1522:
	move.l st+12,%d0
	addq.l #1,%d0
	move.l %d0,st+12
	moveq #19,%d3
	cmp.l %d0,%d3
	jcc .L1523
	mov3q.l #2,-(%sp)
	move.l 8(%fp),-(%sp)
	jsr leave
	clr.l mask_set
.L2121:
	addq.l #8,%sp
	jra .L1523
.L1524:
	move.l st+12,%d0
	addq.l #1,%d0
	move.l %d0,st+12
	moveq #19,%d4
	cmp.l %d0,%d4
	jcc .L1525
	mov3q.l #3,-(%sp)
.L2122:
	move.l 8(%fp),-(%sp)
	jsr splash_end
	jra .L2121
.L1538:
	tst.b sv.l
	jeq .L1536
	tst.b sv+8.l
	jeq .L1536
	tst.b sv+10.l
	jne .L1536
	mvz.b sv+1,%d2
	mvz.b (%a1),%d1
	cmp.l %d2,%d1
	jne .L1536
	mvz.b sv+2,%d1
	cmp.l %d0,%d1
	jne .L1536
	clr.l -(%sp)
	clr.l -(%sp)
	jsr ls_enc
	addq.l #8,%sp
	tst.l %d0
	jeq .L1536
	clr.l u46+8
	addq.l #1,u46+28
	jra .L1536
.L1541:
	mvz.b %d2,%d2
	move.l %d2,-(%sp)
	clr.l -(%sp)
	move.l 8(%fp),-(%sp)
	jsr enter
	lea (12,%sp),%sp
	addq.l #1,pm+12
.L1539:
	tst.l st+4
	jne .L1542
.L1543:
	tst.l st+1058
	jne .L1544
.L1545:
	tst.l st+4
	jeq .L1547
.L1551:
	tst.l st+1058
	jne .L1552
	move.l commits,%d2
	cmp.l st+20.l,%d2
	jne .L1553
	tst.l st+344
	jeq .L1552
.L1553:
	moveq #1,%d3
	move.l 8(%fp),%a0
	move.b %d3,32(%a0)
	jra .L1552
.L1546:
	move.l sv+88,%d0
	cmp.l #1075650164,%d0
	jeq .L1548
	move.l %d0,-(%sp)
	jsr overlay
	addq.l #4,%sp
	tst.l %d0
	jeq .L1549
.L1548:
	mov3q.l #1,st+1062
	jra .L1545
.L1549:
	tst.l st+1062
	jne .L1550
	move.l st+8,%d0
	moveq #20,%d1
	sub.l st+1066,%d0
	cmp.l %d0,%d1
	jcc .L1545
.L1550:
	clr.l st+1058
	mov3q.l #-1,st+20
	mov3q.l #1,st+344
	jra .L1545
.L1562:
	mvz.b %d2,%d2
	lea sq_grid,%a2
	moveq #11,%d6
	cmp.l %d2,%d6
	jcs .L1564
	move.l sq+4,%d0
	btst %d2,%d0
	jne .L1565
.L1564:
	clr.l %d0
.L1566:
	cmp.l sq+408.l,%d0
	jne .L1567
	tst.l %d0
	jeq .L1568
	cmp.l sq+412.l,%d2
	jeq .L1568
.L1567:
	mov3q.l #1,%d7
	or.l %d7,sq+404
	move.l %d0,sq+408
	move.l %d2,sq+412
.L1568:
	move.b 1093615249,%d0
	move.b 1093615250,%d2
	moveq #127,%d3
	move.b 1079807236,%d1
	and.l %d3,%d1
	move.l sq+360,%d3
	btst #8,%d3
	jeq .L1569
	move.l %d1,%d0
	moveq #127,%d1
	and.l %d3,%d1
.L1570:
	cmp.l %d0,%d1
	jeq .L1799
.L1571:
	cmp.l sq+420.l,%d1
	jne .L1572
	cmp.l sq+424.l,%d0
	jeq .L1573
.L1572:
	mov3q.l #4,%d5
	or.l %d5,sq+404
	move.l %d1,sq+420
	move.l %d0,sq+424
.L1573:
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
	jne .L1574
	cmp.l sq+432.l,%d0
	jeq .L1575
.L1574:
	moveq #16,%d6
	or.l %d6,sq+404
	move.l %d2,sq+428
	move.l %d0,sq+432
.L1575:
	move.l 1076395164,%d0
	and.l #2097151,%d0
	cmp.l sq+436.l,%d0
	jeq .L1576
	moveq #32,%d7
	or.l %d7,sq+404
	move.l %d0,sq+436
.L1576:
	move.b 1081877443,%d0
	mvz.b 1081877444,%d1
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d1,%d0
	and.l #8191,%d0
	cmp.l sq+440.l,%d0
	jeq .L1577
	move.l %d0,sq+440
	moveq #8,%d0
	or.l %d0,sq+404
.L1577:
	move.b 1081877445,%d0
	mvz.b 1081877446,%d1
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d1,%d0
	and.l #8191,%d0
	cmp.l sq+552.l,%d0
	jeq .L1578
	mvz.w #128,%d1
	move.l %d0,sq+552
	or.l %d1,sq+404
.L1578:
	mov3q.l #1,%d3
	move.l 1079807120,%d2
	cmp.l %d2,%d3
	jne .L1579
	move.l st+8,%d0
	moveq #19,%d4
	sub.l sq+444,%d0
	cmp.l %d0,%d4
	jcc .L1579
	moveq #64,%d5
	or.l %d5,sq+404
.L1579:
	move.l sq+404,%d0
	btst #0,%d0
	jeq .L1580
	move.l sq+408,%d0
	move.b %d0,-140(%fp)
	tst.l %d0
	jeq .L1800
	move.b sq+415,%d0
.L1581:
	mov3q.l #2,-(%sp)
	pea -140(%fp)
	pea 8.w
	move.b %d0,-139(%fp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1563
	moveq #-2,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1580:
	btst #1,%d0
	jeq .L1582
	mov3q.l #2,%d6
	cmp.l %d2,%d6
	jcc .L1801
	clr.l %d0
.L1583:
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
	jeq .L1563
	moveq #-3,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1582:
	move.w %d0,%ccr
	jne .L1584
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
	jeq .L1563
	moveq #-5,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1584:
	move.w %d0,%ccr
	jpl .L1585
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
	jeq .L1563
	moveq #-9,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1585:
	tst.b %d0
	jpl .L1586
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
	jeq .L1563
	move.l sq+404,%d0
	bclr #7,%d0
	move.l %d0,sq+404
.L1586:
	btst #4,%d0
	jeq .L1587
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
	jeq .L1563
	moveq #-17,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1587:
	btst #5,%d0
	jeq .L1588
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
	jeq .L1563
	moveq #-33,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1588:
	btst #6,%d0
	jeq .L1589
	move.l 1100784300,-(%sp)
	move.l %fp,%d3
	add.l #-140,%d3
	move.l %d3,-(%sp)
	jsr blk4
	addq.l #8,%sp
	mov3q.l #2,%d5
	cmp.l %d2,%d5
	jcc .L1590
	clr.l %d2
.L1590:
	move.b %d2,-136(%fp)
	moveq #127,%d6
	move.w 1079807124,%d0
	subq.l #1,%d0
	and.l %d6,%d0
	move.b %d0,-135(%fp)
	move.l sq+380,%d0
	cmp.l %d0,%d6
	jcc .L1591
	moveq #127,%d0
.L1591:
	mov3q.l #7,-(%sp)
	move.l %d3,-(%sp)
	pea 9.w
	move.b %d0,-134(%fp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1563
	moveq #-65,%d7
	and.l %d7,sq+404
	lea st+8,%a0
	move.l (%a0),sq+444
.L1589:
	move.l sq+360,%d0
	btst #8,%d0
	jeq .L1592
	moveq #127,%d1
	and.l %d1,%d0
.L1593:
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
.L1599:
	move.l #85689,%d5
	moveq #12,%d0
	mvz.b (%a2,%d5.l),%d4
	cmp.l %d1,%d0
	jeq .L1594
	mvz.b (%a0),%d0
	move.b 2(%a0),%d3
.L1595:
	mvz.b %d3,%d3
	cmp.l (%a1),%d0
	jne .L1596
	cmp.l 52(%a1),%d3
	jne .L1596
	cmp.l 104(%a1),%d4
	jne .L1596
	moveq #12,%d2
	cmp.l %d1,%d2
	jne .L1597
	move.l #85685,%d2
	move.b (%a2,%d2.l),%d2
	move.l #85686,%a5
	mvz.b (%a2,%a5.l),%d5
	mvz.b %d2,%d2
	lsl.l #8,%d2
	or.l %d5,%d2
	cmp.l ed+256.l,%d2
	jeq .L1597
.L1596:
	move.l %d0,(%a1)
	moveq #12,%d0
	move.l %d3,52(%a1)
	move.l %d4,104(%a1)
	cmp.l %d1,%d0
	jne .L1598
	move.b (%a2,%d6.l),%d0
	mvz.b (%a2,%d7.l),%d2
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d2,%d0
	move.l %d0,ed+256
.L1598:
	tst.l -156(%fp)
	jeq .L1597
	mov3q.l #1,%d0
	lsl.l %d1,%d0
	or.l %d0,ed+260
.L1597:
	addq.l #1,%d1
	addq.l #4,%a1
	lea (917,%a0),%a0
	moveq #13,%d2
	cmp.l %d1,%d2
	jne .L1599
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
	jeq .L1600
	move.l %d1,ed+272
	clr.l ed+268
	clr.l ed+372
.L1600:
	move.l ed+268,%d2
	move.l %d2,%d3
	addq.l #1,%d3
	move.l %d3,%d1
	moveq #10,%d4
	lsl.l %d4,%d1
	cmp.l %d0,%d1
	jls .L1802
	move.l %d2,%d1
	move.l %d0,%d5
	lsl.l %d4,%d1
	sub.l %d1,%d5
.L1601:
	move.l %d2,%d1
	moveq #12,%d6
	lsl.l %d6,%d1
	clr.l %d4
	add.l %d1,%a1
	clr.l %d1
.L1602:
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
	jne .L1602
	move.l ed+372,%d4
	move.l %d2,%a0
	lea (69,%a0),%a0
	btst %d2,%d4
	jeq .L1603
	cmp.l (%a4,%a0.l*4),%d1
	jeq .L1603
	mov3q.l #1,ed+376
.L1603:
	move.l %d1,(%a4,%a0.l*4)
	mov3q.l #1,%d1
	add.l #1023,%d0
	lsl.l %d2,%d1
	or.l %d4,%d1
	move.l %d1,ed+372
	moveq #10,%d1
	lsr.l %d1,%d0
	cmp.l %d3,%d0
	jhi .L1604
	clr.l %d3
.L1604:
	move.l %d3,ed+268
	move.l %fp,%d3
	clr.l %d2
	add.l #-148,%d3
.L1609:
	move.l ed+260,%d0
	btst %d2,%d0
	jeq .L1605
	moveq #12,%d5
	cmp.l %d2,%d5
	jne .L1803
	moveq #127,%d0
.L1606:
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
	jeq .L1804
	mov3q.l #5,%d0
.L1607:
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	mov3q.l #4,-(%sp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1563
	mov3q.l #1,%d0
	lsl.l %d2,%d0
	addq.l #1,ed+264
	not.l %d0
	and.l %d0,ed+260
.L1605:
	addq.l #1,%d2
	addq.l #4,%a3
	moveq #13,%d1
	cmp.l %d2,%d1
	jne .L1609
.L1610:
	move.l ed+68,%d0
	cmp.l ed+64.l,%d0
	jne .L1611
	tst.l ed+92
	jeq .L1612
	lea ed+91,%a0
	move.b (%a0),-148(%fp)
	mov3q.l #1,-(%sp)
	pea -148(%fp)
	pea 12.w
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1563
	clr.l ed+92
.L1612:
	tst.l ed+376
	jeq .L1563
	move.l st+8,%d0
	sub.l ed+380,%d0
	lsr.l #2,%d0
	jeq .L1563
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
	jeq .L1563
	lea st+8,%a0
	clr.l ed+376
	move.l (%a0),ed+380
	addq.l #1,ed+384
	jra .L1563
.L1565:
	jsr (%a2)
	jra .L1566
.L1569:
	mvz.b %d0,%d0
	mvz.b %d2,%d2
	moveq #127,%d4
	lsl.l #8,%d0
	or.l %d2,%d0
	cmp.l %d0,%d4
	jge .L1570
.L1799:
	moveq #127,%d0
	jra .L1571
.L1800:
	moveq #127,%d0
	jra .L1581
.L1801:
	move.l %d2,%d0
	jra .L1583
.L1592:
	move.b 1079807236,%d0
	moveq #127,%d2
	and.l %d2,%d0
	jra .L1593
.L1594:
	move.l #85683,%d2
	move.b (%a2,%d2.l),%d0
	move.l #85684,%d3
	move.l #85690,%d5
	mvz.b (%a2,%d3.l),%d2
	move.b (%a2,%d5.l),%d3
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d2,%d0
	jra .L1595
.L1802:
	mvz.w #1024,%d5
	jra .L1601
.L1803:
	move.l %d2,%d0
	jra .L1606
.L1804:
	mov3q.l #7,%d0
	jra .L1607
.L1611:
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
	jeq .L1563
	addq.l #1,ed+68
	addq.l #1,ed+76
	jra .L1610
.L1805:
	clr.l %d0
	lea sq+480,%a0
	lea ovp_col,%a1
.L1619:
	btst %d0,%d2
	jeq .L1620
	lea (%a0,%d0.l),%a2
	move.b (%a2),(%a1,%d0.l)
.L1620:
	addq.l #1,%d0
	mov3q.l #4,%d1
	cmp.l %d0,%d1
	jne .L1619
	move.l %d3,%d4
	clr.l %d3
	move.b %d2,ovp_on
	or.l %d2,%d4
	lea shp,%a2
	lea sq+480,%a4
	lea (-140,%fp),%a3
	lea rui_uart_raw,%a5
.L1625:
	btst %d3,%d4
	jeq .L1621
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
.L1624:
	tst.l %d0
	jeq .L1622
	move.b (%a4,%d3.l),%d1
.L1623:
	move.b %d1,2(%a3,%a0.l)
	addq.l #1,%a0
	mov3q.l #4,%d7
	cmp.l %a0,%d7
	jne .L1624
	move.l %a3,-(%sp)
	mov3q.l #6,-(%sp)
	jsr (%a5)
	addq.l #8,%sp
.L1621:
	addq.l #1,%d3
	addq.l #4,%a2
	mov3q.l #4,%d0
	cmp.l %d3,%d0
	jne .L1625
	move.l #1100088672,-(%sp)
	jsr 1073746414
	clr.l sq+476
	addq.l #4,%sp
	jra .L1618
.L1622:
	move.b (%a2,%a0.l),%d1
	jra .L1623
.L1806:
	clr.l %d2
	jra .L1626
.L1807:
	moveq #111,%d3
	jra .L1627
.L1630:
	move.b %d3,ovt_col
	move.b %d2,%d4
	move.b %d2,ovt_on
	lea led_send4,%a0
	tst.l %d2
	jeq .L1631
	move.b %d3,-137(%fp)
	move.b %d3,-138(%fp)
	move.b %d3,-139(%fp)
	move.b %d3,-140(%fp)
	pea -140(%fp)
	pea 55.w
	jsr (%a0)
	addq.l #1,k44+12
.L2123:
	addq.l #4,%sp
	move.l #1100088672,(%sp)
	jsr 1073746414
	addq.l #4,%sp
	move.b %d4,k44+24
	move.b %d3,k44+25
	jra .L1629
.L1631:
	pea sht
	pea 55.w
	jsr (%a0)
	addq.l #1,k44+16
	jra .L2123
.L1638:
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
	jeq .L1637
	tst.b 60(%a2,%d3.l)
	jeq .L1640
	move.l st+8,%d0
	moveq #20,%d1
	sub.l (%a2,%d3.l*4),%d0
	cmp.l %d0,%d1
	jcc .L1641
.L1640:
	moveq #1,%d2
	jra .L1639
.L1641:
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
	jeq .L1637
	move.l (%a5),%a0
	move.l %a5,-(%sp)
	move.l 40(%a0),%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l 32(%a5),%d1
	move.l %d0,%d3
	tst.l %d1
	jeq .L1642
	move.l %d1,%d5
	move.l %d1,%a0
	add.l #4752,%d5
	clr.l %d0
.L1646:
	mvz.b (%a0),%d7
	cmp.l #255,%d7
	jeq .L1644
	mvz.b 1(%a0),%d7
	cmp.l #255,%d7
	jeq .L1644
	addq.l #1,%d0
.L1644:
	lea (66,%a0),%a0
	cmp.l %d5,%a0
	jne .L1646
	mulu.w #5674,%d6
	move.l %d3,%a5
	move.l #1075599904,%a1
	add.l %d6,%a5
	mvz.b %d4,%d6
	move.l %d6,-160(%fp)
.L1651:
	mvz.b 3(%a1),%d7
	move.l %d1,%a0
.L1649:
	mvz.b (%a0),%d6
	cmp.l %d6,%d7
	jne .L1647
	mvz.b 1(%a0),%d6
	cmp.l -160(%fp),%d6
	jeq .L1648
.L1647:
	lea (66,%a0),%a0
	cmp.l %d5,%a0
	jne .L1649
	tst.b 5653(%a5)
	jne .L1796
	mov3q.l #1,%a0
	jra .L1797
.L1796:
	mov3q.l #2,%a0
.L1797:
	add.l %a0,%d0
	moveq #71,%d7
	cmp.l %d0,%d7
	jlt .L1808
.L1648:
	addq.l #4,%a1
	addq.l #1,%a5
	cmp.l #1075599920,%a1
	jne .L1651
.L1642:
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
.L1652:
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
	jne .L1652
	jra .L1639
.L1808:
	moveq #2,%d2
	jra .L1639
.L1657:
	mov3q.l #1,%d2
	cmp.l %d1,%d2
	jge .L1660
	moveq #1,%d3
	move.b %d3,mr+13
.L1661:
	move.l %a2,-(%sp)
	pea 12.w
	clr.l -(%sp)
	jsr mr_send
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1654
	sub.l %a0,%a0
.L1664:
	lea (%a2,%a0.l),%a1
	moveq #12,%d0
	move.b (%a1),(%a3,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d0
	jne .L1664
	move.w mr+16,%d0
	clr.b %d1
	addq.l #1,%d0
	move.b %d1,mr+13
	move.w %d0,mr+16
.L2124:
	jsr kit_tick
	jra .L1659
.L1660:
	clr.l %d2
	tst.b mr+13.l
	jne .L1661
.L1662:
	mvz.b (%a3,%d2.l),%d0
	mvz.b (%a2)+,%d1
	cmp.l %d1,%d0
	jeq .L1665
	move.l %d3,-(%sp)
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	jsr mr_send
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1654
	lea (-1,%a2),%a0
	move.b (%a0),(%a3,%d2.l)
	move.w mr+14,%d0
	addq.l #1,%d0
	move.w %d0,mr+14
.L1665:
	addq.l #1,%d2
	moveq #12,%d0
	cmp.l %d2,%d0
	jne .L1662
	jra .L2124
.L1671:
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
	jeq .L1667
	move.l ux+3944,%d1
	mov3q.l #1,%d0
	lea ux+3920,%a0
.L1668:
	cmp.l %d0,%d1
	jhi .L1669
	subq.l #1,%d1
	move.l %d1,ux+3944
	addq.l #1,ux+32
.L1670:
	tst.l ux+3944
	jne .L1671
.L1672:
	move.l ux+3880,%d1
	cmp.l ux+3884.l,%d1
	jeq .L1667
	mov3q.l #7,%d2
	cmp.l ux+3944.l,%d2
	jcs .L1667
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
	jle .L1810
	mvz.b 2(%a2),%d2
	mvz.b 3(%a2),%d0
	lsl.l #8,%d2
	add.l %d0,%d0
	or.l %d0,%d2
	mov3q.l #7,%d0
	cmp.l %a1,%d0
	jlt .L1674
	move.l %a3,%d0
	add.l #-46,%d0
	mvz.b %d0,%d0
	mov3q.l #4,%d1
	cmp.l %d0,%d1
	jcc .L1675
	moveq #52,%d0
	cmp.l %a5,%d0
	jne .L1676
.L1675:
	cmp.l 1075595760.l,%a5
	jne .L1677
.L1676:
	tst.l %a1
	jne .L1679
.L1680:
	move.l %a0,%d1
	mov3q.l #7,%d0
	and.l %d0,%d1
	move.l %d5,%a0
	add.l %d1,%a0
	move.b 3952(%a0),%d0
	btst #0,%d0
	jeq .L1679
	move.l ls+60,%d0
	or.l ls+64,%d0
	jeq .L1679
	cmp.l ls+68.l,%d3
	jne .L1679
	move.l st+8,%d0
	moveq #20,%d1
	sub.l ls+72,%d0
	cmp.l %d0,%d1
	jcs .L1679
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
	jeq .L1679
	move.l (%a5),%a0
	move.l %a5,-(%sp)
	move.l 40(%a0),%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l 32(%a5),%d0
	tst.l %d0
	jeq .L1681
	move.l %d0,%a0
	add.l #4753,%d0
	move.l %d0,-156(%fp)
	move.w %a3,%d0
	addq.l #1,%a0
	sub.l %a4,%a4
	sub.l %a1,%a1
	mvz.b %d0,%d0
	move.l %d0,%a3
.L1686:
	mvz.b -1(%a0),%d1
	cmp.l #255,%d1
	jeq .L1683
	mvz.b (%a0),%d0
	cmp.l #255,%d0
	jeq .L1683
	addq.l #1,%a1
.L1683:
	cmp.l %d1,%a3
	jne .L1685
	mvz.b (%a0),%d1
	move.l %a4,%d0
	cmp.l %d1,%d3
	seq %d1
	mvs.b %d1,%d1
	neg.l %d1
	or.l %d1,%d0
	move.l %d0,%a4
.L1685:
	lea (66,%a0),%a0
	cmp.l -156(%fp),%a0
	jne .L1686
	tst.l %a4
	jne .L1681
	moveq #69,%d1
	cmp.l %a1,%d1
	jge .L1681
	moveq #3,%d0
	addq.l #1,ux+3964
.L1673:
	addq.l #1,ux+24
	jra .L1693
.L1669:
	addq.l #3,%a0
	move.b (%a0),-3(%a0)
	move.b 1(%a0),-2(%a0)
	move.b 2(%a0),-1(%a0)
	addq.l #1,%d0
	jra .L1668
.L1674:
	move.l %a5,%d0
	mov3q.l #2,%d1
	add.l #-48,%d0
	cmp.l %d0,%d1
	jcs .L1678
	mvz.b cu+1,%d0
	cmp.l %a5,%d0
	jne .L1677
.L1679:
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
	jra .L1693
.L1678:
	moveq #10,%d0
	cmp.l %a1,%d0
	jne .L1679
	moveq #45,%d1
	cmp.l %a5,%d1
	jeq .L1680
	moveq #43,%d0
	cmp.l %a5,%d0
	jeq .L1680
	jra .L1679
.L1681:
	move.l %a2,-(%sp)
	moveq #64,%d3
	jsr 1074529464
	addq.l #4,%sp
	move.l %d0,%a3
	cmp.l %d0,%d3
	jge .L1687
	move.w #64,%a3
.L1687:
	clr.l %d3
.L1688:
	cmp.l %a3,%d3
	jlt .L1692
	moveq #4,%d0
	clr.l ls+64
	clr.l ls+60
	addq.l #1,ux+3960
.L1693:
	move.l ux+3944,%a0
	lea (%a0,%a0.l*2),%a1
	addq.l #1,%a0
	move.l %a0,ux+3944
	addq.l #1,ux+3884
	add.l %d5,%a1
	move.b %d7,3920(%a1)
	move.b %d6,3921(%a1)
	move.b %d0,3922(%a1)
	jra .L1672
.L1692:
	moveq #31,%d0
	cmp.l %d3,%d0
	jlt .L1689
	move.l ls+60,%d1
	lsr.l %d3,%d1
.L1690:
	btst #0,%d1
	jeq .L1691
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	move.l %d3,-(%sp)
	move.l %a2,-(%sp)
	jsr 1074529568
	lea (20,%sp),%sp
	addq.l #1,ls+96
.L1691:
	addq.l #1,%d3
	jra .L1688
.L1689:
	move.l %d3,%d0
	add.l #-32,%d0
	move.l ls+64,%d1
	lsr.l %d0,%d1
	jra .L1690
.L1677:
	moveq #1,%d0
	jra .L1673
.L1810:
	moveq #2,%d0
	jra .L1673
.L1696:
	move.l #1075731444,%d5
	cmp.l sv+88.l,%d5
	jeq .L1695
	move.l st+8,%d0
	sub.l cu+16,%d0
	lsr.l #1,%d0
	jeq .L1695
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	jsr cu_tab
	addq.l #8,%sp
	move.l %d0,%a2
	tst.l %d0
	jeq .L1695
	move.l %d2,-(%sp)
	moveq #8,%d3
	jsr cu_setup
	lea (11,%a2),%a2
	addq.l #4,%sp
.L1699:
	move.l %d3,%a3
	move.l %d2,-(%sp)
	lea (9,%a3),%a3
	move.l %a3,-(%sp)
	jsr 1073770536
	addq.l #8,%sp
	move.l %d0,%d5
	tst.l %d0
	jle .L1697
	moveq #43,%d0
	cmp.l %d2,%d0
	jne .L1698
	moveq #10,%d1
	cmp.l %d3,%d1
	jne .L1698
	mvz.b cu+29,%d0
	moveq #45,%d7
	cmp.l %d0,%d7
	jeq .L1697
	moveq #43,%d1
	cmp.l %d0,%d1
	jeq .L1697
.L1698:
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
.L1697:
	addq.l #1,%d3
	lea (16,%a2),%a2
	moveq #16,%d5
	cmp.l %d3,%d5
	jne .L1699
	addq.l #1,cu+20
	moveq #50,%d6
	cmp.l %d2,%d6
	jne .L1700
	addq.l #1,%d4
	lea st+8,%a0
	move.b %d4,cu+11
	move.l (%a0),cu+24
	jra .L1700
.L1712:
	addq.l #1,k44+32
.L1714:
	subq.l #2,%d0
	tst.l %d0
	jne .L1713
	clr.b %d7
	move.b %d7,k44+26
	jra .L1713
.L1711:
	mov3q.l #1,%d5
	cmp.l %d0,%d5
	jne .L1715
	addq.l #1,k44+4
	jra .L1713
.L1715:
	addq.l #1,k44+8
	jra .L1714
.L1716:
	tst.b dp+22.l
	jeq .L1717
	mvz.b dp+20,%d0
	cmp.l %d1,%d0
	jne .L1717
	mvz.b dp+21,%d0
	cmp.l %d5,%d0
	jne .L1717
.L1718:
	lea dp,%a3
	sub.l %a2,%a2
	lea dp+32,%a1
	move.l %a1,-156(%fp)
	move.l %a3,%a4
.L1730:
	moveq #43,%d0
	cmp.l %d5,%d0
	jeq .L1816
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
.L1723:
	move.l %d5,-(%sp)
	pea 9(%a2)
	jsr 1073770536
	addq.l #8,%sp
	tst.l %d0
	jgt .L1724
	clr.l -148(%fp)
.L1725:
	move.b -148(%fp),%d7
	move.b -147(%fp),%d0
	mvz.b %d3,%d6
	move.b -146(%fp),%d1
	move.w %d7,%a1
	mvz.b 24(%a4),%d7
	move.w %d0,%a0
	move.b -145(%fp),%d0
	cmp.l %d7,%d6
	jne .L1728
	move.l -156(%fp),%a5
	mvs.b %a1,%d6
	mvs.b (%a5),%d7
	cmp.l %d7,%d6
	jne .L1728
	mvs.b 1(%a5),%d7
	mvs.b %a0,%d6
	cmp.l %d7,%d6
	jne .L1728
	mvs.b 2(%a5),%d7
	mvs.b %d1,%d6
	cmp.l %d7,%d6
	jne .L1728
	mvs.b 3(%a5),%d7
	mvs.b %d0,%d6
	cmp.l %d7,%d6
	jeq .L1729
.L1728:
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
.L1729:
	addq.l #1,%a2
	addq.l #4,-156(%fp)
	addq.l #1,%a4
	moveq #8,%d7
	cmp.l %a2,%d7
	jne .L1730
	tst.b dp+23.l
	jeq .L1705
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
.L1732:
	move.b (%a2)+,(%a1)
	mov3q.l #1,%a0
.L1731:
	lea 31(%a3,%a0.l),%a4
	mov3q.l #5,%d2
	move.b (%a4),(%a1,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d2
	jne .L1731
	addq.l #5,%a1
	addq.l #5,%d0
	addq.l #4,%a3
	moveq #49,%d3
	cmp.l %d0,%d3
	jne .L1732
	moveq #-9,%d4
	pea 49.w
	move.l %d1,-(%sp)
	move.b %d4,-92(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1705
	clr.b %d5
	addq.l #1,dp+16
	move.b %d5,dp+23
.L1705:
	tst.l st
	jeq .L1701
.L1702:
	mov3q.l #1,%d6
	cmp.l 1094562388.l,%d6
	jne .L1701
	tst.l st+968
	jeq .L1701
	move.b 1079807565,%d2
	mvs.b %d2,%d0
	lsr.l #7,%d0
	jne .L1818
	addq.l #1,%d2
.L1733:
	move.l pj+160,%d0
	cmp.l pj+156.l,%d0
	jeq .L1737
	move.l pj+156,%d3
	sub.l %d0,%d3
	clr.l -(%sp)
	move.l %d3,%d0
	cmp.l #16383,%d3
	jls .L1735
	mvz.w #16383,%d0
.L1735:
	move.l %d0,-(%sp)
	mov3q.l #6,-(%sp)
	jsr pj_send
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1767
	moveq #2,%d0
	add.l %d3,pj+160
	move.w %d0,pj+180
.L1737:
	move.l pj,%d1
	cmp.l pj+4.l,%d1
	jne .L1738
	tst.b pj+139.l
	jeq .L1739
	mvz.b pj+138,%d1
	mvz.b %d2,%d0
	cmp.l %d1,%d0
	jeq .L1740
.L1739:
	clr.l %d0
.L1741:
	move.l #1081903571,%a0
	lea pj-1081903431,%a1
.L1742:
	tst.l %d0
	jne .L1744
.L1745:
	move.l st+968,%d6
	cmp.l pj+164.l,%d6
	jeq .L1762
	moveq #2,%d7
	move.w %d7,pj+180
.L1762:
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
.L1763:
	move.l #1081903571,%a2
	add.l %a0,%a2
	tst.b (%a2)
	jeq .L1764
	move.b (%a2),%d0
	moveq #127,%d1
	moveq #15,%d3
	and.l %d1,%d0
	move.b %d0,9(%a1,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d3
	jne .L1763
.L1764:
	moveq #-9,%d4
	lea (%fp,%a0.l),%a2
	move.b %d4,-131(%a2)
	pea 10(%a0)
	move.l %a1,-(%sp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1767
	moveq #1,%d5
	move.b %d2,pj+138
	lea st+968,%a0
	lea st+8,%a1
	move.l (%a0),pj+164
	move.l (%a1),pj+168
	move.l #1081903571,%a0
	lea pj-1081903431,%a1
	move.b %d5,pj+139
.L1766:
	move.b (%a0),(%a1,%a0.l)
	addq.l #1,%a0
	cmp.l #1081903587,%a0
	jne .L1766
	addq.l #1,pj+176
	jra .L1767
.L1812:
	sub.l %a0,%a0
	jra .L1719
.L1813:
	clr.l %d0
	jra .L1720
.L1815:
	clr.l %d0
.L2125:
	clr.b %d6
	jra .L1721
.L1816:
	clr.b %d3
	jra .L1723
.L1724:
	moveq #52,%d6
	muls.l %d6,%d0
	move.l #1075575112,%a0
	move.l (%a0,%d0.l),%a1
	clr.l -148(%fp)
	move.l %a1,%d0
	sub.l %a0,%a0
	add.l #-1073741824,%d0
	cmp.l #67108863,%d0
	jhi .L1725
.L1726:
	moveq #125,%d6
	move.b (%a1,%a0.l),%d1
	move.l %d1,%d0
	subq.l #1,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d6
	jcs .L1725
	lea (-148,%a0),%a5
	mov3q.l #4,%d0
	move.b %d1,(%a5,%fp.l)
	addq.l #1,%a0
	cmp.l %a0,%d0
	jne .L1726
	jra .L1725
.L1818:
	clr.b %d2
	jra .L1733
.L1738:
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
	jeq .L1767
	addq.l #1,pj+4
	addq.l #1,pj+172
	jra .L1737
.L1740:
	move.l st+968,%d3
	cmp.l pj+164.l,%d3
	jne .L1739
	move.l st+8,%d0
	moveq #99,%d4
	sub.l pj+168,%d0
	cmp.l %d0,%d4
	scc %d0
	mvs.b %d0,%d0
	neg.l %d0
	jra .L1741
.L1744:
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
	jne .L1742
	mvz.b %d3,%d3
	mvz.b %d1,%d1
	cmp.l %d3,%d1
	jne .L1745
	tst.b pj+181.l
	jeq .L1767
	move.l 1100949640,%d0
	mov3q.l #3,%d1
	and.l %d0,%d1
	tst.l %d1
	jne .L1746
	move.l %d0,%d1
	add.l #-1073741824,%d1
	cmp.l #129892351,%d1
	jhi .L1746
	move.l %d0,%a0
	add.l #1073744908,%d1
	lea (12,%a0),%a0
	move.l %a0,%a1
.L1749:
	mvz.b (%a1),%d0
	lsr.l #1,%d0
	jeq .L1747
.L1746:
	mvz.w #16383,%d0
	clr.l %d3
.L1748:
	clr.l -(%sp)
	move.l %d0,-(%sp)
	pea 9.w
	jsr pj_send
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1767
	addq.l #1,pj+184
	tst.l %d3
	jeq .L1753
	move.b pj+181,%d0
	mvz.b %d0,%d1
	lsr.l #1,%d1
	jeq .L1753
	clr.b %d7
	subq.l #1,%d0
	move.b %d0,pj+181
	move.b %d7,pj+180
.L1767:
	tst.l st
	jeq .L1771
	mov3q.l #1,%d3
	cmp.l 1094562388.l,%d3
	jne .L1772
	tst.l st+968
	jeq .L1772
	move.l st+44,%d1
	move.l txsx_over,%d0
	cmp.l kd_drop.l,%d1
	jne .L1773
	cmp.l kd_over.l,%d0
	jeq .L1774
.L1773:
	move.l st+8,%a0
	moveq #19,%d4
	sub.l kd_t,%a0
	cmp.l %a0,%d4
	jcc .L1774
	cmp.l #16383,%d1
	jls .L1775
	mvz.w #16383,%d1
.L1775:
	cmp.l #16383,%d0
	jls .L1776
	mvz.w #16383,%d0
.L1776:
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
	jeq .L1774
	lea st+44,%a0
	lea txsx_over,%a1
	lea st+8,%a2
	move.l (%a0),kd_drop
	move.l (%a1),kd_over
	move.l (%a2),kd_t
.L1774:
	tst.l st
	jeq .L1771
.L1772:
	mov3q.l #1,%d0
	cmp.l 1094562388.l,%d0
	jne .L1777
	tst.l st+968
	jeq .L1777
	jsr 1075312702
	move.l %d0,%d2
	add.l #352,%d2
	move.l %d2,-(%sp)
	move.l %d0,%a2
	jsr 1074425250
	addq.l #4,%sp
	tst.l qp+100
	jeq .L1778
	cmp.l #4095,%d0
	jle .L1779
	mvz.w #4095,%d0
.L1780:
	move.l 352(%a2),%a0
	lea qp,%a3
	move.l %d0,(%a3)
	move.l %d2,-(%sp)
	move.l 52(%a0),%a0
	mov3q.l #1,qp+4
	jsr (%a0)
	addq.l #4,%sp
	tst.l %d0
	jeq .L1781
	move.l %d0,%a0
	moveq #11,%d0
	mvz.b 2430(%a0),%d2
	cmp.l %d2,%d0
	jcc .L1782
.L1781:
	clr.l %d2
.L1783:
	move.w #11521,%d3
	move.l #-260222380,%d1
	move.l %d1,-140(%fp)
	move.w %d3,-136(%fp)
	cmp.l qp+44.l,%d2
	jne .L1784
	tst.l qp+48
	jeq .L1785
.L1784:
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
	jeq .L1778
	move.l %d2,qp+44
	clr.l qp+48
	addq.l #1,qp+52
.L1785:
	move.l %fp,%d2
	add.l #-140,%d2
	jra .L1786
.L1747:
	lea (24,%a1),%a1
	cmp.l %d1,%a1
	jne .L1749
	move.b pj+180,%d0
	move.l %a0,%d3
	tst.b %d0
	jge .L1750
	clr.l %d0
.L1751:
	tst.b (%a0)
	sne %d2
	lea (24,%a0),%a0
	mvs.b %d2,%d2
	sub.l %d2,%d0
	cmp.l %d1,%a0
	jne .L1751
	jra .L1748
.L1753:
	clr.b %d0
	move.b %d0,pj+181
	jra .L1767
.L1750:
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
.L1761:
	mvz.b pj+180,%d0
	sub.l %a3,%a3
	add.l %d1,%d0
	muls.w #24,%d0
	lea (%a0,%d0.l),%a1
	tst.b (%a1)
	sne %d0
	neg.l %d0
	move.b %d0,(%a2)
.L1755:
	move.b (%a1),%d0
	jeq .L1754
	move.b 8(%a1,%a3.l),%d0
	moveq #127,%d5
	and.l %d5,%d0
.L1754:
	addq.l #1,%a3
	move.b %d0,(%a2,%a3.l)
	moveq #15,%d6
	cmp.l %a3,%d6
	jne .L1755
	sub.l %a1,%a1
.L1756:
	move.l %a1,%a3
	addq.l #1,%a1
	tst.b (%a2,%a1.l)
	jne .L1758
.L1759:
	moveq #15,%d3
	cmp.l %a3,%d3
	jeq .L1757
	clr.b %d0
	addq.l #1,%a3
	move.b %d0,(%a2,%a3.l)
	jra .L1759
.L1758:
	moveq #15,%d7
	cmp.l %a1,%d7
	jne .L1756
.L1757:
	addq.l #1,%d1
	lea (16,%a2),%a2
	moveq #8,%d4
	cmp.l %d1,%d4
	jne .L1761
	moveq #-9,%d5
	pea 139.w
	move.l %d2,-(%sp)
	move.b %d5,-2(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1767
	move.b pj+180,%d0
	addq.l #8,%d0
	move.b %d0,pj+180
	jra .L1767
.L1701:
	lea pj,%a0
	move.l (%a0),%d0
.L1768:
	cmp.l pj+4.l,%d0
	jeq .L1767
	moveq #31,%d1
	moveq #10,%d2
	and.l pj+4,%d1
	mvz.b 8(%a0,%d1.l*4),%d1
	cmp.l %d1,%d2
	jeq .L1769
	addq.l #1,pj+156
.L1769:
	addq.l #1,pj+4
	jra .L1768
.L1779:
	tst.l %d0
	jge .L1780
	clr.l %d0
	jra .L1780
.L1782:
	addq.l #1,%d2
	jra .L1783
.L1787:
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
	jeq .L1778
	addq.l #1,qp+60
.L1786:
	move.l qp+60,%d0
	cmp.l qp+56.l,%d0
	jne .L1787
	move.l qp+92,%d1
	cmp.l qp+96.l,%d1
	jeq .L1778
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
	jeq .L1778
	move.l %d2,qp+96
.L1778:
	tst.l st
	jeq .L1771
.L1777:
	mov3q.l #1,%d5
	cmp.l 1094562388.l,%d5
	jne .L1771
	tst.l st+968
	jeq .L1771
	move.l pmo+64,%d2
	tst.l qp+100
	jeq .L1771
	move.w #11521,%d7
	move.l #-260222380,%d6
	move.l %d6,-140(%fp)
	move.w %d7,-136(%fp)
	cmp.l pmo+124.l,%d2
	jeq .L1789
	moveq #17,%d0
	moveq #127,%d1
	move.b %d0,-134(%fp)
	move.l pmo,%d0
	cmp.l %d0,%d1
	jcc .L1790
	moveq #127,%d0
.L1790:
	move.b %d0,-133(%fp)
	move.l pmo+4,%d0
	cmp.l #16383,%d0
	jls .L1791
	mvz.w #16383,%d0
.L1791:
	move.l %d0,%d1
	moveq #127,%d3
	and.l %d3,%d0
	lsr.l #7,%d1
	move.b %d1,-132(%fp)
	move.b %d0,-131(%fp)
	move.l pmo+8,%d0
	cmp.l #16383,%d0
	jls .L1792
	mvz.w #16383,%d0
.L1792:
	move.l %d0,%d1
	moveq #127,%d4
	and.l %d4,%d0
	lsr.l #7,%d1
	move.b %d1,-130(%fp)
	move.b %d0,-129(%fp)
	move.l pmo+12,%d0
	cmp.l %d0,%d4
	jcc .L1793
	moveq #127,%d0
.L1793:
	move.b %d0,-128(%fp)
	lea fp,%a0
	tst.l pmo+52
	jeq .L1819
	move.l (%a0),%d1
	sub.l pmo+108,%d1
	cmp.l #1499,%d1
	sls %d1
	neg.l %d1
.L1794:
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
	jeq .L1771
	move.l %d2,pmo+124
.L1789:
	move.l pmo+16,%d2
	cmp.l pmo+128.l,%d2
	jeq .L1771
	move.l st+8,%d0
	moveq #19,%d7
	sub.l pmo+132,%d0
	cmp.l %d0,%d7
	jcc .L1771
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
	jeq .L1771
	lea st+8,%a2
	move.l %d2,pmo+128
	move.l (%a2),pmo+132
.L1771:
	move.l -66650100,%d0
	addq.l #1,st+336
	sub.l -152(%fp),%d0
	add.l %d0,st+328
	cmp.l st+332.l,%d0
	jls .L1492
	move.l %d0,st+332
.L1492:
	movem.l -204(%fp),#15612
	unlk %fp
	rts
.L1819:
	clr.b %d1
	jra .L1794
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
	jeq .L2127
	sub.l st+8,%d0
	tst.l %d0
	jgt .L2128
.L2127:
	clr.l 44(%sp)
.L2129:
	move.l 16(%a2),%a2
	move.l %a2,52(%sp)
	tst.l st+4
	jne .L2131
	tst.l st+972
	jne .L2132
	tst.b sv+8.l
	jne .L2132
	tst.l 44(%sp)
	jeq .L2134
	jra .L2166
.L2128:
	move.l %d3,%a0
	move.l %d3,%d0
	addq.l #6,%a0
	lea (108,%sp),%a1
	add.l #566,%d0
.L2130:
	move.b 1(%a0),(%a1)
	addq.l #8,%a0
	move.b -8(%a0),1(%a1)
	addq.l #2,%a1
	cmp.l %a0,%d0
	jne .L2130
	mov3q.l #1,44(%sp)
	jra .L2129
.L2131:
	tst.l st+1058
	jne .L2134
	move.l commits,%a6
	cmp.l st+24.l,%a6
	jne .L2136
	move.l 52(%sp),%a0
	move.l %a0,%d0
	add.l #1024,%d0
.L2137:
	clr.l (%a0)+
	cmp.l %a0,%d0
	jne .L2137
	move.l %a6,st+20
.L2138:
	tst.l 44(%sp)
	jeq .L2134
	tst.l st+4
	jne .L2162
	tst.l st+972
	jne .L2163
.L2166:
	tst.b sv+8.l
	jne .L2163
.L2134:
	move.l -66650100,%d0
	addq.l #1,st+336
	sub.l 60(%sp),%d0
	add.l %d0,st+328
	cmp.l st+332.l,%d0
	jls .L2126
	move.l %d0,st+332
.L2126:
	movem.l (%sp),#31996
	lea (248,%sp),%sp
	rts
.L2132:
	move.l commits,%a6
.L2136:
	cmp.l st+340.l,%a6
	jne .L2139
	tst.l st+344
	jeq .L2140
.L2139:
	move.l -66650100,%d2
	move.l sh_seq,%d4
	move.l %d2,64(%sp)
	btst #0,%d4
	jne .L2141
	pea 256.w
	pea shadow
	pea comp_in
	lea copy32,%a2
	jsr (%a2)
	pea 704.w
	pea txt_sh
	pea (tl.0)
	jsr (%a2)
	lea (24,%sp),%sp
	cmp.l sh_seq.l,%d4
	jne .L2141
	pea 256.w
	pea comp_in
	pea comp
	jsr (%a2)
	lea (12,%sp),%sp
	tst.l st+872
	jne .L2142
	clr.l -(%sp)
	pea comp
	pea 64.w
	pea 128.w
	pea st+872
	jsr 1074198978
	lea (20,%sp),%sp
.L2142:
	lea (tl.0),%a2
	clr.l %d5
.L2155:
	tst.b 4(%a2)
	jeq .L2143
	move.l %a2,%d4
	clr.l %d7
	addq.l #8,%d4
	lea st+408,%a5
	lea st+552,%a0
.L2154:
	tst.l (%a5)+
	jeq .L2145
	mvz.b (%a0),%d0
	cmp.l %d0,%d5
	jne .L2145
	lea st+472,%a1
	mvz.b 5(%a0),%d1
	mvz.b (%a1,%d7.l),%d4
	lea (6,%a0),%a3
	sub.l %a1,%a1
.L2147:
	cmp.l %d1,%a1
	jlt .L2148
	move.b 4(%a0),%d0
	lea 72(%sp,%d1.l),%a3
	btst #1,%d0
	jeq .L2167
	move.l %d4,%d0
	add.l #-64,%d0
	move.l %d0,56(%sp)
	tst.l %d0
	jle .L2150
	move.b #43,(%a3)
	addq.l #1,%d1
	lea 72(%sp,%d1.l),%a3
.L2168:
	sub.l %a1,%a1
	jra .L2149
.L2148:
	lea (%a3,%a1.l),%a4
	move.b (%a4),72(%sp,%a1.l)
	addq.l #1,%a1
	jra .L2147
.L2150:
	tst.l 56(%sp)
	jeq .L2168
	move.b #45,(%a3)
	moveq #64,%d2
	mov3q.l #1,%a1
	sub.l %d4,%d2
	move.l %d2,56(%sp)
.L2149:
	lea (68,%sp),%a4
	clr.l %d4
.L2152:
	move.l 56(%sp),%d6
	moveq #10,%d0
	addq.l #1,%d4
	rems.l %d0,%d2:%d6
	divs.l %d0,%d6
	add.l #48,%d2
	move.b %d2,(%a4)
	move.l %d6,56(%sp)
	tst.l %d6
	jeq .L2151
	addq.l #1,%a4
	mov3q.l #4,%d6
	cmp.l %d4,%d6
	jne .L2152
.L2151:
	add.l %a1,%a3
	move.l %d4,%d0
.L2153:
	subq.l #1,%d0
	move.b 68(%sp,%d0.l),(%a3)+
	tst.l %d0
	jne .L2153
	mvz.w #248,%d0
	add.l %sp,%d0
	add.l %d1,%d0
	add.l %d4,%d0
	add.l %d0,%a1
	clr.b %d0
	move.l %sp,%d4
	add.l #72,%d4
	move.b %d0,-176(%a1)
.L2145:
	addq.l #1,%d7
	lea (20,%a0),%a0
	moveq #16,%d1
	cmp.l %d7,%d1
	jne .L2154
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
	jgt .L2143
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
.L2143:
	addq.l #1,%d5
	lea (44,%a2),%a2
	moveq #64,%d0
	cmp.l %d5,%d0
	jne .L2155
	move.l -66650100,%d0
	move.l %a6,st+340
	addq.l #1,st+348
	sub.l 64(%sp),%d0
	add.l %d0,st+356
	cmp.l st+360.l,%d0
	jls .L2156
	move.l %d0,st+360
.L2156:
	clr.l st+344
.L2140:
	move.l 52(%sp),-(%sp)
	jsr blit
	addq.l #4,%sp
	cmp.l st+20.l,%a6
	jeq .L2157
	move.l -66650100,%d0
	addq.l #1,st+308
	sub.l t_commit,%d0
	add.l %d0,st+304
	cmp.l st+312.l,%d0
	jls .L2157
	move.l %d0,st+312
.L2157:
	move.l st+388,%d1
	tst.l %d1
	jeq .L2158
	cmp.l st+392.l,%a6
	jeq .L2158
	move.l -66650100,%d0
	sub.l %d1,%d0
	add.l %d0,st+396
	addq.l #1,st+400
	cmp.l st+404.l,%d0
	jls .L2159
	move.l %d0,st+404
.L2159:
	clr.l st+388
.L2158:
	move.l st+368,%d1
	tst.l %d1
	jeq .L2160
	move.l -66650100,%d0
	sub.l %d1,%d0
	add.l %d0,st+372
	addq.l #1,st+376
	cmp.l st+380.l,%d0
	jls .L2161
	move.l %d0,st+380
.L2161:
	clr.l st+368
.L2160:
	move.l %a6,st+20
	move.l -66650100,%d0
	move.l %d0,st+56
	sub.l t_commit,%d0
	addq.l #1,st+28
	move.l %d0,st+60
	jra .L2138
.L2167:
	move.l %d4,56(%sp)
	jra .L2168
.L2141:
	move.l 52(%sp),-(%sp)
	addq.l #1,st+32
	jsr blit
	addq.l #4,%sp
	jra .L2138
.L2162:
	tst.l st+1058
	jne .L2134
.L2163:
	move.l %d3,%a0
	add.l #566,%d3
	lea (108,%sp),%a1
	addq.l #6,%a0
.L2164:
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
	jne .L2164
	jra .L2134
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
	jne .L2192
	cmp.l ed+88.l,%d1
	jeq .L2192
	move.l %d1,ed+88
	mov3q.l #1,ed+92
.L2192:
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
	jne .L2193
	moveq #66,%d5
	cmp.l %d2,%d5
	jne .L2194
	tst.b k44+20.l
	jeq .L2195
	clr.b %d6
	move.b %d6,k44+20
	tst.b k44+22.l
	jeq .L2195
	moveq #2,%d7
	move.w %d7,k44+22
.L2195:
	clr.l u46
	tst.b u46+48.l
	jeq .L2196
	clr.b %d0
	move.b %d0,u46+48
.L2203:
	mov3q.l #1,%d0
.L2197:
	move.l -66650100,%d1
	addq.l #1,st+336
	sub.l 64(%sp),%d1
	add.l %d1,st+328
	cmp.l st+332.l,%d1
	jls .L2191
	move.l %d1,st+332
.L2191:
	movem.l (%sp),#31996
	lea (100,%sp),%sp
	rts
.L2194:
	cmp.l #134,%d2
	jne .L2198
	clr.l tk
	tst.l tk+8
	jeq .L2196
	move.l st+248,%d0
	clr.l tk+8
	btst #6,%d0
	jeq .L2199
	moveq #-65,%d1
	and.l %d0,%d1
	move.l %d1,st+248
	tst.l st+4
	jne .L2508
.L2199:
	clr.l %d0
	jra .L2197
.L2198:
	move.l %d2,%d0
	add.l #-68,%d0
	lsr.l #1,%d0
	jne .L2196
	moveq #31,%d1
	mov3q.l #1,%d0
	and.l %d4,%d1
	lsl.l %d1,%d0
	and.l st+208,%d0
	tst.l %d0
	jeq .L2201
	move.l st+200,%d3
	move.l %d3,%d5
	move.l st+220,%d1
	move.l %d1,%d0
	and.l #2097152,%d0
	and.l #786432,%d5
	or.l %d5,%d0
	jeq .L2202
	addq.l #1,nk+16
.L2202:
	and.l #-786433,%d3
	bclr #21,%d1
	move.l %d3,st+200
	move.l %d1,st+220
.L2201:
	moveq #69,%d6
	cmp.l %d2,%d6
	jne .L2196
	tst.l nk
	jeq .L2196
	moveq #-33,%d7
	and.l %d7,st+240
	clr.l nk
	tst.l st+4
	jeq .L2203
	mov3q.l #1,-(%sp)
	pea 69.w
	lea queue_key,%a2
	jsr (%a2)
	clr.l -(%sp)
	pea 69.w
	jsr (%a2)
.L2507:
	jsr flush
.L2497:
	lea (16,%sp),%sp
	jra .L2203
.L2196:
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
	jeq .L2204
	not.l %d0
	and.l %d5,%d0
	move.l %d0,(%a2,%a0.l*4)
	jra .L2203
.L2204:
	move.l %d2,%d4
	mov3q.l #5,%d5
	add.l #-64,%d4
	cmp.l %d4,%d5
	jcs .L2205
	move.l ls+28,%d5
	btst %d4,%d5
	jeq .L2205
	mov3q.l #1,%d0
	lsl.l %d4,%d0
	move.l ls+32,%d1
	not.l %d0
	and.l %d0,%d5
	move.l %d5,ls+28
	btst %d4,%d1
	jeq .L2203
	and.l %d1,%d0
	move.l %d0,ls+32
.L2509:
	clr.l -(%sp)
.L2498:
	move.l %d2,-(%sp)
	jsr queue_key
	jsr flush
	jra .L2496
.L2205:
	move.l %d1,%a1
	move.l %d0,%d4
	lea (121,%a1),%a1
	lea sq,%a0
	move.l (%a0,%a1.l*4),%d3
	and.l %d3,%d4
	tst.l %d4
	jeq .L2206
	not.l %d0
	and.l %d3,%d0
	move.l %d0,(%a0,%a1.l*4)
	jra .L2509
.L2206:
	move.l %d1,%a0
	move.l %d0,%d4
	lea (50,%a0),%a0
	move.l (%a2,%a0.l*4),%d3
	and.l %d3,%d4
	tst.l %d4
	jeq .L2207
	not.l %d0
	and.l %d3,%d0
	move.l %d2,%d1
	mov3q.l #7,%d6
	add.l #-112,%d1
	move.l %d0,(%a2,%a0.l*4)
	cmp.l %d1,%d6
	jcs .L2199
	move.l ux,%d3
	btst %d1,%d3
	jeq .L2199
	mov3q.l #1,%d0
	lsl.l %d1,%d0
	not.l %d0
	and.l %d3,%d0
	move.l %d0,ux
.L2508:
	clr.l -(%sp)
	move.l %d2,-(%sp)
	jsr queue_key
	jsr flush
.L2502:
	addq.l #8,%sp
	jra .L2199
.L2207:
	move.l %d1,%a0
	move.l %d0,%d4
	lea (226,%a0),%a0
	move.l (%a2,%a0.l*4),%d3
	and.l %d3,%d4
	tst.l %d4
	jeq .L2208
	not.l %d0
	and.l %d3,%d0
	move.l %d0,(%a2,%a0.l*4)
	move.l st+4,%d0
	or.l sq+408,%d0
	jeq .L2199
	jra .L2508
.L2208:
	add.l #58,%d1
	move.l %d0,%d4
	move.l (%a2,%d1.l*4),%d3
	and.l %d3,%d4
	tst.l %d4
	jeq .L2199
	not.l %d0
	and.l %d3,%d0
	move.l %d0,(%a2,%d1.l*4)
	tst.l st+4
	jeq .L2203
	clr.l -(%sp)
	move.l %d2,-(%sp)
	jsr queue_key
.L2496:
	addq.l #8,%sp
	jra .L2203
.L2193:
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
	jne .L2203
	move.l %d7,%d5
	move.l %d3,%d0
	add.l #58,%d5
	and.l (%a2,%d5.l*4),%d0
	tst.l %d0
	jne .L2203
	move.l %d7,%d0
	add.l #121,%d0
	lea sq,%a5
	move.l (%a5,%d0.l*4),%d0
	and.l %d3,%d0
	tst.l %d0
	jne .L2203
	move.l %d7,%d6
	move.l %d3,%d0
	add.l #50,%d6
	and.l (%a2,%d6.l*4),%d0
	tst.l %d0
	jne .L2199
	move.l %d7,%d0
	add.l #226,%d0
	move.l (%a2,%d0.l*4),%d0
	and.l %d3,%d0
	tst.l %d0
	jne .L2199
	tst.l nk
	jeq .L2209
	move.l %d2,%d1
	add.l #-18,%d1
	lsr.l #1,%d1
	jeq .L2212
	cmp.l #181,%d2
	jne .L2211
.L2212:
	lea (%a4,%d0.l),%a0
	moveq #32,%d1
	move.l (%a0),68(%sp,%d0.l)
	addq.l #4,%d0
	cmp.l %d0,%d1
	jne .L2212
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
	jra .L2502
.L2211:
	clr.l nk
	addq.l #1,nk+8
	tst.l st+4
	jeq .L2209
	mov3q.l #1,-(%sp)
	pea 69.w
	jsr queue_key
	jsr flush
	addq.l #8,%sp
.L2209:
	moveq #66,%d6
	cmp.l %d2,%d6
	jne .L2213
	move.l st+4,%d0
	tst.l %d0
	jeq .L2214
	tst.l st+1058
	jne .L2215
.L2214:
	move.l st+216,%d1
	or.l st+248,%d1
	or.l st+920,%d1
	btst #0,%d1
	jne .L2215
	move.w #256,%d7
	lea st+8,%a0
	move.l (%a0),k44
	move.w %d7,k44+20
.L2215:
	lea st+8,%a0
	move.l (%a0),u46+4
	tst.l sq+408
	jeq .L2242
	tst.l %d0
	jeq .L2218
	tst.l st+1058
	jne .L2242
	move.l sq+484,%d1
	move.l st+232,%d0
.L2220:
	or.l %d1,%d0
	tst.w %d0
	jeq .L2242
	moveq #1,%d0
	clr.b %d1
	addq.l #1,u46+32
	move.b %d0,u46+48
	move.b %d1,k44+20
	jra .L2203
.L2213:
	cmp.l #128,%d2
	jne .L2216
	lea masks,%a0
	move.l (%a0),nk+20
.L2242:
	move.l %d2,%d6
	mov3q.l #1,%d0
	move.l st+4,%d7
	add.l #-64,%d6
	cmp.l %d6,%d0
	jcs .L2261
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jne .L2260
	tst.l fk_claim
	jeq .L2263
	move.b ls,%d0
	move.b u46+48,%d1
	or.l %d1,%d0
	tst.b %d0
	jne .L2263
	move.l st+216,%d0
	moveq #65,%d1
	or.l st+972,%d7
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d1,%d0
	or.l %d7,%d0
	jne .L2263
	tst.l sq+408
	jeq .L2264
	tst.w sq+486.l
	jne .L2263
.L2264:
	tst.w st+202.l
	jne .L2263
	move.l sv+88,-(%sp)
	jsr overlay
	addq.l #4,%sp
	or.l ov_list,%d0
	jne .L2263
	or.l %d3,st+272
	moveq #64,%d4
	cmp.l %d2,%d4
	jne .L2343
	moveq #15,%d0
.L2265:
	lea fk,%a0
	addq.l #1,(%a0,%d6.l*4)
	move.l %d0,dp
	addq.l #1,dp+4
	jra .L2506
.L2218:
	move.l sq+484,%d1
	jra .L2220
.L2216:
	moveq #68,%d6
	cmp.l %d2,%d6
	jne .L2221
	move.l tk,%d0
	or.l u46,%d0
	jeq .L2222
	tst.l st+4
	jeq .L2222
	addq.l #1,tk+4
	jra .L2242
.L2222:
	move.l st+216,%d0
	moveq #64,%d7
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d0,%d7
	move.l %d7,%a0
	btst #6,%d0
	jne .L2224
	move.l st+240,%d0
	move.l st+208,%d7
	move.l %d7,%d1
	move.l st+912,%d6
	or.l %d0,%d1
	or.l %d6,%d1
	move.w %d1,%ccr
	jeq .L2225
	tst.b u46+48.l
	jeq .L2226
.L2225:
	move.l st+8,%a1
	mov3q.l #2,%d1
	sub.l u46+4,%a1
	cmp.l %a1,%d1
	jcc .L2227
.L2224:
	moveq #16,%d2
	or.l %d2,st+272
	tst.l %a0
	jne .L2228
	moveq #1,%d4
	addq.l #1,u46+20
	addq.l #1,u46+16
	move.b %d4,k44+21
.L2228:
	tst.l st+4
	jeq .L2229
	tst.b k44+22.l
	jeq .L2230
	tst.b k44+26.l
	jne .L2230
	tst.l %a0
	jne .L2230
	moveq #1,%d6
	moveq #1,%d7
	clr.b %d0
	mvz.w #256,%d5
	move.l %d5,st+296
	move.b %d6,st+161
	move.w %d7,st+162
	move.b %d0,st+993
.L2500:
	jsr flush
	jra .L2203
.L2230:
	mov3q.l #3,-(%sp)
	move.l 32(%a3),-(%sp)
	jsr leave
	jra .L2496
.L2229:
	clr.l -(%sp)
.L2504:
	clr.l -(%sp)
	move.l 32(%a3),-(%sp)
	jsr enter
	jra .L2501
.L2227:
	move.w %d7,%ccr
	jeq .L2231
.L2226:
	or.l %d6,%d0
	move.w %d0,%ccr
	jeq .L2231
	tst.b u46+48.l
	jeq .L2242
.L2231:
	addq.l #1,u46+40
	jra .L2242
.L2221:
	moveq #53,%d1
	cmp.l %d2,%d1
	jne .L2232
	move.l st+216,%d6
	move.l st+248,%a0
	move.l st+920,%d7
	move.l %d6,50(%sp)
	btst #6,%d6
	jne .L2233
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
	jne .L2234
	tst.b u46+48.l
	jeq .L2242
.L2235:
	moveq #1,%d2
	mov3q.l #1,u46
	addq.l #1,u46+16
	move.b %d2,k44+21
	jra .L2233
.L2234:
	tst.l %d6
	jeq .L2235
.L2233:
	move.l %a0,%d1
	or.l 50(%sp),%d1
	moveq #32,%d4
	swap %d4
	or.l %d7,%d1
	or.l %d4,st+268
	btst #6,%d1
	jeq .L2237
	mov3q.l #1,tk
.L2237:
	clr.l st+1038
	tst.l st+4
	jeq .L2238
	moveq #1,%d6
	mvz.w #256,%d5
	moveq #1,%d7
	moveq #1,%d0
	move.l %d5,st+296
	addq.l #1,st+998
	move.b %d6,st+161
	move.w %d7,st+162
	move.b %d0,st+993
	jra .L2500
.L2238:
	mov3q.l #1,-(%sp)
	clr.l -(%sp)
	move.l 32(%a3),-(%sp)
	jsr enter
	addq.l #1,st+994
.L2501:
	lea (12,%sp),%sp
	jra .L2203
.L2232:
	moveq #16,%d1
	cmp.l %d2,%d1
	jne .L2217
	move.l st+216,%d6
	move.l st+248,%a0
	move.l st+920,%d7
	move.l %d6,50(%sp)
	btst #6,%d6
	jne .L2239
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
	jne .L2240
	tst.b u46+48.l
	jeq .L2242
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
	move.l %a0,%d1
	or.l 50(%sp),%d1
	moveq #1,%d4
	swap %d4
	or.l %d7,%d1
	or.l %d4,st+264
	btst #6,%d1
	jeq .L2243
	mov3q.l #1,tk
.L2243:
	clr.l st+1038
	tst.l st+4
	jeq .L2244
	moveq #1,%d6
	mvz.w #256,%d5
	moveq #1,%d7
	moveq #2,%d0
	move.l %d5,st+296
	move.b %d6,st+161
	move.w %d7,st+162
	move.b %d0,st+993
.L2503:
	addq.l #1,st+1078
	jra .L2500
.L2244:
	mov3q.l #2,-(%sp)
.L2505:
	clr.l -(%sp)
	move.l 32(%a3),-(%sp)
	jsr enter
	addq.l #1,st+1074
	jra .L2501
.L2217:
	moveq #52,%d1
	cmp.l %d2,%d1
	jne .L2219
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jeq .L2245
	tst.b u46+48.l
	jeq .L2242
.L2245:
	move.l st+216,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #6,%d0
	jne .L2242
	tst.l sq+408
	jeq .L2246
	tst.w sq+486.l
	jne .L2242
.L2246:
	tst.w st+202.l
	jne .L2242
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
	jeq .L2247
	moveq #1,%d6
	moveq #3,%d7
	mvz.w #256,%d5
	move.b %d2,st+161
	move.l %d5,st+296
	move.w %d6,st+162
	move.b %d7,st+993
	jra .L2503
.L2247:
	mov3q.l #3,-(%sp)
	jra .L2505
.L2219:
	moveq #51,%d0
	cmp.l %d2,%d0
	jne .L2223
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jeq .L2248
	tst.b u46+48.l
	jeq .L2242
.L2248:
	move.l st+216,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #6,%d0
	jne .L2242
	tst.l sq+408
	jeq .L2249
	tst.w sq+486.l
	jne .L2242
.L2249:
	tst.w st+202.l
	jne .L2242
	moveq #1,%d1
	moveq #8,%d2
	swap %d2
	mov3q.l #1,u46
	addq.l #1,u46+16
	clr.l st+1038
	move.b %d1,k44+21
	or.l %d2,st+268
	tst.l st+4
	jeq .L2250
	moveq #1,%d5
	moveq #4,%d6
	mvz.w #256,%d4
	move.b %d1,st+161
	move.l %d4,st+296
	move.w %d5,st+162
	move.b %d6,st+993
	jra .L2500
.L2250:
	mov3q.l #4,-(%sp)
	jra .L2504
.L2223:
	moveq #48,%d7
	cmp.l %d2,%d7
	jne .L2236
	move.l st+216,%d0
	move.l st+248,%a0
	move.l st+920,%d7
	move.l %d0,50(%sp)
	btst #6,%d0
	jne .L2251
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
	jne .L2252
	tst.b u46+48.l
	jeq .L2242
.L2253:
	moveq #1,%d2
	mov3q.l #1,u46
	addq.l #1,u46+16
	move.b %d2,k44+21
	jra .L2251
.L2252:
	tst.l %d6
	jeq .L2253
.L2251:
	mvz.b 1093765506,%d0
	moveq #11,%d4
	cmp.l %d0,%d4
	jcs .L2342
	move.b 1093765506,%d0
	add.l #16,%d0
.L2254:
	move.l %a0,%d1
	or.l 50(%sp),%d1
	moveq #1,%d5
	swap %d5
	or.l %d7,%d1
	or.l %d5,st+268
	btst #6,%d1
	jeq .L2255
	mov3q.l #1,tk
.L2255:
	tst.l st+4
	jeq .L2256
	tst.l st+1038
	jeq .L2257
	mov3q.l #3,-(%sp)
	move.l 32(%a3),-(%sp)
	jsr leave
	addq.l #1,st+1050
	jra .L2496
.L2342:
	moveq #16,%d0
	jra .L2254
.L2257:
	moveq #1,%d7
	moveq #1,%d1
	mvz.w #256,%d6
	move.b %d0,st+993
	mov3q.l #1,st+1038
	addq.l #1,st+1046
	move.l %d6,st+296
	move.b %d7,st+161
	move.w %d1,st+162
	jra .L2500
.L2256:
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	clr.l -(%sp)
	move.l 32(%a3),-(%sp)
	jsr enter
	mov3q.l #1,st+1038
	addq.l #1,st+1042
	jra .L2501
.L2236:
	moveq #13,%d6
	cmp.l %d2,%d6
	jcs .L2242
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jeq .L2258
	tst.b u46+48.l
	jeq .L2259
.L2258:
	or.l %d3,st+264
	addq.l #1,%d2
	move.l %d2,dp
	addq.l #1,dp+4
.L2506:
	tst.b k44+22.l
	jne .L2203
	moveq #1,%d7
	move.b %d7,k44+21
	jra .L2203
.L2259:
	move.l %d2,%d6
	add.l #-64,%d6
.L2260:
	tst.l st+4
	jeq .L2275
	cmp.l #132,%d2
	jne .L2276
	move.l st+216,%d1
	move.l %d1,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #0,%d0
	jeq .L2276
	moveq #16,%d6
	or.l %d1,%d6
	move.l %d6,st+216
	tst.l st+1058
	jne .L2277
	lea st+8,%a0
	mov3q.l #1,st+1058
	clr.l st+1062
	move.l (%a0),st+1066
	addq.l #1,st+1070
.L2277:
	moveq #1,%d0
	move.l 32(%a3),%a0
	move.b %d0,32(%a0)
	jra .L2199
.L2343:
	moveq #16,%d0
	jra .L2265
.L2263:
	addq.l #1,fk+8
	jra .L2260
.L2261:
	moveq #49,%d0
	cmp.l %d2,%d0
	jne .L2260
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jeq .L2268
	tst.b u46+48.l
	jeq .L2269
.L2268:
	or.l st+972,%d7
	jne .L2269
	tst.l sq+408
	jeq .L2270
	tst.w sq+486.l
	jne .L2269
.L2270:
	move.l st+200,%d6
	mvz.w %d6,%d6
	tst.l %d6
	jne .L2269
	move.b 1093765506,%d1
	moveq #11,%d4
	mvz.b %d1,%d2
	cmp.l %d2,%d4
	jlt .L2271
	moveq #127,%d0
	ext.w %d1
	and.l -2147457096,%d0
	mulu.w #152,%d1
	mulu.w #2531,%d0
	move.l %d0,%a0
	add.l %d1,%a0
	add.l #1092966773,%a0
	mvz.b (%a0),%d6
.L2271:
	moveq #1,%d5
	addq.l #1,u46+24
	addq.l #1,u46+16
	move.b %d5,k44+21
	tst.b ls.l
	jeq .L2272
	mov3q.l #4,-(%sp)
	jsr ls_close
	addq.l #4,%sp
.L2272:
	clr.l u46+8
	moveq #11,%d7
	cmp.l %d2,%d7
	jlt .L2273
	move.l %d6,-(%sp)
	jsr ls_banked
	addq.l #4,%sp
	tst.l %d0
	jne .L2274
	moveq #45,%d0
	cmp.l %d6,%d0
	jeq .L2274
	moveq #43,%d1
	cmp.l %d6,%d1
	jne .L2273
.L2274:
	move.l %d6,-(%sp)
	move.l %d2,-(%sp)
	moveq #127,%d2
	jsr mr_vb
	addq.l #8,%sp
	mvz.b %d0,%d0
	cmp.l %d0,%d2
	jeq .L2273
	mov3q.l #1,%d4
	or.l st+8,%d4
	move.l %d6,u46+12
	move.l %d4,u46+8
.L2273:
	moveq #2,%d5
	swap %d5
	or.l %d5,st+204
	jra .L2199
.L2269:
	moveq #-15,%d6
	jra .L2260
.L2275:
	tst.b ls.l
	jeq .L2278
	mov3q.l #5,%d1
	cmp.l %d6,%d1
	jcs .L2279
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
	jne .L2280
	tst.l ls+36
	jne .L2281
	tst.l %d0
	jeq .L2282
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
.L2510:
	jsr (%a2)
	jra .L2496
.L2280:
	moveq #69,%d1
	cmp.l %d2,%d1
	jne .L2281
	tst.l %d0
	jeq .L2283
	move.b ls+2,%d1
	add.l #-40,%d1
	mvz.b %d1,%d1
	lsr.l #1,%d1
	jne .L2281
.L2283:
	tst.l ls+36
	jeq .L2344
.L2281:
	move.l %d0,%a0
	pea 1(%a0)
	or.l %d3,ls+32
	move.l %d2,-(%sp)
	addq.l #1,ls+88
	jsr queue_key
	jra .L2510
.L2282:
	move.l 1100949720,%a3
	move.l %a3,%d0
	clr.l ls+64
	clr.l ls+60
	add.l #-1073741824,%d0
	cmp.l #67108863,%d0
	jhi .L2285
	jsr sq_grid
	tst.l %d0
	jeq .L2285
	lea (348,%a3),%a0
	move.l (%a0),ls+60
	lea (344,%a3),%a3
	move.l (%a3),ls+64
.L2285:
	mvz.b ls+1,%d0
	lea st+8,%a0
	move.l (%a0),ls+72
	move.l %d0,ls+68
	moveq #1,%d0
.L2284:
	mov3q.l #3,%d1
	and.l %d0,%d1
	move.l %d1,-(%sp)
	jsr ls_close
	jsr (%a2)
	addq.l #4,%sp
	jra .L2203
.L2344:
	moveq #2,%d0
	jra .L2284
.L2279:
	move.l %d4,%d0
	and.l #240,%d0
	tst.l %d0
	jeq .L2278
	cmp.l #128,%d2
	jeq .L2278
	move.l %d2,%d0
	mov3q.l #2,%d1
	add.l #-80,%d0
	cmp.l %d0,%d1
	jcc .L2278
	add.l #-64,%d0
	moveq #11,%d7
	cmp.l %d0,%d7
	jcc .L2278
	mov3q.l #4,-(%sp)
	jsr ls_close
	addq.l #4,%sp
	tst.l st+4
	jne .L2276
.L2278:
	move.l st+972,%d0
	tst.b ls.l
	jne .L2286
	moveq #68,%d1
	cmp.l %d2,%d1
	jne .L2286
	tst.l %d0
	jne .L2287
	tst.b sv.l
	jeq .L2276
	tst.b sv+8.l
	jeq .L2276
	move.b sv+10,%d6
	move.b sv+3,%d0
	or.l %d0,%d6
	tst.b %d6
	jne .L2276
	move.l ls+24,%d0
	mov3q.l #4,%d7
	addq.l #2,%d0
	cmp.l %d0,%d7
	jcs .L2276
	move.b sv+1,%d1
	move.b %d1,63(%sp)
	mvz.b %d1,%d1
	mvz.b 1093765506,%d0
	cmp.l %d1,%d0
	jne .L2276
	move.b sv+2,%d7
	mvz.b %d7,%d1
	move.l %d1,-(%sp)
	move.l %d1,58(%sp)
	jsr ls_banked
	addq.l #4,%sp
	move.l 54(%sp),%d1
	tst.l %d0
	jne .L2288
	moveq #45,%d0
	cmp.l %d1,%d0
	jeq .L2288
	moveq #43,%d0
	cmp.l %d1,%d0
	jne .L2276
.L2288:
	tst.l sq+408
	jeq .L2289
	tst.w sq+486.l
	jne .L2276
.L2289:
	move.l st+216,%d0
	or.l st+920,%d0
	or.l st+248,%d0
	btst #0,%d0
	jeq .L2276
	move.b 63(%sp),%d1
	move.b %d7,ls+2
	moveq #45,%d2
	move.b %d1,ls+1
	mvz.b %d7,%d1
	cmp.l %d1,%d2
	jeq .L2346
	moveq #43,%d4
	cmp.l %d1,%d4
	jne .L2290
.L2346:
	moveq #10,%d6
.L2290:
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
	jra .L2507
.L2286:
	tst.l %d0
	jeq .L2276
	move.l %d2,%d0
	mov3q.l #2,%d1
	add.l #-80,%d0
	cmp.l %d0,%d1
	jcc .L2276
	add.l #-64,%d0
	moveq #11,%d7
	cmp.l %d0,%d7
	jcc .L2276
.L2287:
	mov3q.l #4,-(%sp)
	move.l 32(%a3),-(%sp)
	jsr splash_end
	addq.l #8,%sp
	mov3q.l #5,%d0
	cmp.l %d6,%d0
	jcs .L2276
	or.l %d3,st+272
	jra .L2203
.L2276:
	move.l st+4,%d0
	tst.l sq+408
	jeq .L2291
	tst.l %d0
	jeq .L2292
	tst.l st+1058
	jne .L2293
.L2292:
	move.l %d2,%d1
	mov3q.l #2,%d6
	add.l #-80,%d1
	cmp.l %d1,%d6
	jcs .L2294
	move.l st+920,%d1
	move.l st+248,%d7
	move.l st+208,%d6
	or.l st+216,%d1
	move.l %d7,46(%sp)
	or.l st+240,%d6
	or.l %d7,%d1
	btst #0,%d1
	jeq .L2295
	move.l sq+484,%a0
	tst.l %d0
	jeq .L2347
	move.l st+232,%a1
.L2296:
	move.l %a0,%d7
	move.l %a1,%d1
	or.l %d7,%d1
	move.l %d1,%d7
	moveq #16,%d1
	mvz.w %d7,%d7
	and.l sq+500,%d1
	or.l %d7,%d1
	jne .L2298
	tst.l %d0
	jeq .L2295
	move.l 46(%sp),%d7
	btst #4,%d7
	jne .L2298
.L2295:
	move.l %d6,%d1
	or.l st+912,%d1
	move.w %d1,%ccr
	jeq .L2300
	tst.b u46+48.l
	jeq .L2301
.L2300:
	move.l sq+484,%a0
	tst.l %d0
	jeq .L2348
	move.l st+232,%d1
.L2302:
	move.l %a0,%d7
	or.l %d7,%d1
	tst.w %d1
	jeq .L2301
.L2298:
	or.l st+912,%d6
	move.w %d6,%ccr
	jeq .L2303
	tst.b u46+48.l
	jeq .L2304
.L2303:
	addq.l #1,u46+36
.L2304:
	tst.l %d0
	jeq .L2305
	move.l st+232,%d0
.L2305:
	move.l %a0,%d1
	or.l %d1,%d0
	move.l %d0,%d1
	mvz.w %d1,%d1
	tst.w %d0
	jeq .L2306
	moveq #80,%d4
	cmp.l %d2,%d4
	jeq .L2349
	moveq #82,%d5
	cmp.l %d2,%d5
	jne .L2350
	moveq #14,%d0
.L2307:
	move.l %d1,-(%sp)
	mov3q.l #1,-(%sp)
	mov3q.l #1,-(%sp)
	or.l %d3,st+272
	move.l %d0,-(%sp)
	jsr ed_queue
	jra .L2497
.L2347:
	sub.l %a1,%a1
	jra .L2296
.L2348:
	clr.l %d1
	jra .L2302
.L2306:
	moveq #80,%d6
	cmp.l %d2,%d6
	jeq .L2351
	moveq #82,%d7
	cmp.l %d2,%d7
	jne .L2352
	moveq #10,%d0
	jra .L2307
.L2349:
	moveq #13,%d0
	jra .L2307
.L2350:
	moveq #15,%d0
	jra .L2307
.L2351:
	moveq #9,%d0
	jra .L2307
.L2352:
	moveq #11,%d0
	jra .L2307
.L2341:
	cmp.l #132,%d2
	jne .L2308
	move.l st+216,%d0
	move.l %d0,%d1
	or.l st+920,%d1
	btst #0,%d1
	jeq .L2308
	moveq #16,%d1
	or.l %d0,%d1
	addq.l #1,ed+84
	move.l %d1,st+216
	jra .L2199
.L2309:
	move.l %d4,%d0
	and.l #240,%d0
	tst.l %d0
	jeq .L2311
	and.l #251,%d4
	cmp.l #128,%d4
	jeq .L2311
	moveq #48,%d7
	cmp.l %d2,%d7
	jne .L2312
.L2311:
	lea sq,%a0
	addq.l #1,sq+460
	cmp.l #128,%d2
	jne .L2313
	mov3q.l #1,%d0
	or.l %d0,st+920
.L2314:
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	jsr queue_key
	jsr flush
	addq.l #8,%sp
	cmp.l #128,%d2
	sne %d0
.L2511:
	mvs.b %d0,%d0
	neg.l %d0
	jra .L2197
.L2313:
	lea (121,%a6),%a6
	or.l %d3,(%a0,%a6.l*4)
	jra .L2314
.L2319:
	move.l %d2,%d0
	add.l #-66,%d0
	lsr.l #1,%d0
	jne .L2322
	move.l st+216,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #0,%d0
	jeq .L2321
	move.l masks,%d6
	cmp.l nk+20.l,%d6
	jeq .L2320
.L2321:
	cmp.l #181,%d2
	jne .L2326
	move.l st+216,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #0,%d0
	jeq .L2330
.L2326:
	tst.l mask_set
	jeq .L2331
	lea mask_keys,%a0
	move.l (%a0,%a6.l*4),%d0
	move.l 58(%sp),%d7
	btst %d7,%d0
	jeq .L2330
.L2331:
	cmp.l #128,%d2
	jne .L2493
	mov3q.l #2,%d4
	jra .L2332
.L2323:
	addq.l #1,nk+24
	jra .L2324
.L2353:
	mov3q.l #1,%d0
	jra .L2327
.L2494:
	move.l %d2,%d0
	mov3q.l #2,%d6
	add.l #-80,%d0
	cmp.l %d0,%d6
	jcs .L2321
.L2329:
	addq.l #1,st+944
.L2315:
	lea (50,%a6),%a6
	or.l %d3,(%a2,%a6.l*4)
	jra .L2199
.L2493:
	mov3q.l #1,%d4
.L2332:
	addq.l #1,st+936
	mov3q.l #2,%d1
	cmp.l %d4,%d1
	jne .L2334
	lea (226,%a6),%a6
	or.l %d3,(%a2,%a6.l*4)
.L2335:
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	jsr queue_key
	jsr flush
	mov3q.l #2,%d2
	addq.l #8,%sp
	cmp.l %d4,%d2
	sne %d0
	jra .L2511
.L2334:
	or.l %d3,(%a2,%d5.l*4)
	jra .L2335
.L2322:
	moveq #69,%d0
	cmp.l %d2,%d0
	jne .L2494
	tst.l mask_set
	jeq .L2325
	lea mask_keys+8,%a0
	btst #5,3(%a0)
	jeq .L2326
.L2325:
	lea st+232,%a1
	clr.l %d1
	sub.l %a0,%a0
.L2328:
	tst.l (%a1)+
	jne .L2353
	tst.l 668(%a1)
	sne %d0
	mvs.b %d0,%d0
	neg.l %d0
.L2327:
	or.l %d0,%d1
	addq.l #1,%a0
	moveq #8,%d0
	cmp.l %a0,%d0
	jne .L2328
	move.l st+216,%d0
	mov3q.l #1,%d4
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d4,%d0
	or.l %d1,%d0
	jne .L2326
	moveq #32,%d5
	or.l %d5,st+240
	addq.l #1,st+936
	mov3q.l #1,nk
	jra .L2203
.L2318:
	moveq #69,%d1
	cmp.l %d2,%d1
	jeq .L2330
	add.l #-80,%d2
	mov3q.l #2,%d0
	cmp.l %d2,%d0
	jcc .L2329
.L2330:
	addq.l #1,st+940
	jra .L2315
.L2291:
	tst.l %d0
	jne .L2293
.L2312:
	tst.b sv.l
	jeq .L2293
	tst.b sv+10.l
	jne .L2293
	mvz.b sv+1,%d0
	moveq #11,%d1
	cmp.l %d0,%d1
	jcs .L2293
	moveq #111,%d4
	cmp.l %d2,%d4
	jcc .L2315
	moveq #119,%d6
	cmp.l %d2,%d6
	jcs .L2293
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
	jra .L2502
.L2301:
	tst.l %d0
	jne .L2316
.L2308:
	tst.w sq+486.l
	jeq .L2309
	move.l %d2,%d0
	mov3q.l #5,%d6
	add.l #-48,%d0
	cmp.l %d0,%d6
	jcc .L2310
	moveq #16,%d7
	cmp.l %d2,%d7
	jeq .L2310
	add.l #-20,%d0
	mov3q.l #1,%d1
	cmp.l %d0,%d1
	jcc .L2310
	add.l #-44,%d0
	lsr.l #3,%d0
	jne .L2309
.L2310:
	lea (121,%a6),%a6
	or.l %d3,(%a5,%a6.l*4)
	addq.l #1,st+1054
.L2499:
	mov3q.l #1,-(%sp)
	jra .L2498
.L2294:
	tst.l %d0
	jeq .L2341
.L2293:
	move.l %d2,%d0
	moveq #11,%d7
	add.l #-144,%d0
	cmp.l %d0,%d7
	jcs .L2316
	moveq #64,%d0
	and.l st+248,%d0
	tst.l %d0
	jeq .L2316
	move.l tk+8,%d0
	tst.l %d0
	jne .L2316
.L2317:
	lea (%a4,%d0.l),%a0
	moveq #32,%d1
	move.l (%a0),68(%sp,%d0.l)
	addq.l #4,%d0
	cmp.l %d0,%d1
	jne .L2317
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
.L2316:
	tst.l st+4
	jeq .L2315
	tst.l st+1058
	jne .L2318
	moveq #68,%d7
	cmp.l %d2,%d7
	jne .L2319
	move.l st+216,%d0
	mov3q.l #1,%d1
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d1,%d0
	move.l st+232,%d1
	mvz.w %d1,%d1
	or.l %d1,%d0
	jeq .L2326
.L2320:
	addq.l #1,st+936
	moveq #68,%d7
	cmp.l %d2,%d7
	jne .L2323
	addq.l #1,nk+12
.L2324:
	or.l %d3,st+240
	jra .L2499
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
	jne .L2513
	tst.l sq+408
	jeq .L2514
	tst.w sq+486.l
	jeq .L2514
	mov3q.l #7,%d0
	cmp.l %a6,%d0
	jcs .L2514
	tst.b 20(%a0)
	jne .L2542
	move.l st+216,%d0
	mov3q.l #1,%d1
	or.l st+920,%d0
	and.l %d1,%d0
.L2515:
	add.l %d2,96(%a2,%a6.l*4)
	move.b %d0,st+160
	addq.l #1,sq+464
	jsr flush
.L2516:
	mov3q.l #1,%d2
	jra .L2519
.L2542:
	mov3q.l #1,%d0
	jra .L2515
.L2514:
	move.l %d2,-(%sp)
	move.l %a6,-(%sp)
	jsr ls_enc
	addq.l #8,%sp
	move.l %d0,%d2
	tst.l %d0
	jne .L2519
	moveq #8,%d3
	cmp.l %a6,%d3
	jne .L2518
	tst.b sv+8.l
	jeq .L2518
	move.l st+8,%a0
	addq.l #1,st+1086
	lea (47,%a0),%a0
	move.l %a0,st+1082
.L2518:
	tst.l st+972
	jeq .L2519
	mov3q.l #5,-(%sp)
	move.l 76(%sp),%a1
	move.l 32(%a1),-(%sp)
	jsr splash_end
	addq.l #8,%sp
.L2519:
	move.l -66650100,%d0
	addq.l #1,st+336
	sub.l 44(%sp),%d0
	add.l %d0,st+328
	cmp.l st+332.l,%d0
	jls .L2512
	move.l %d0,st+332
.L2512:
	move.l %d2,%d0
	movem.l (%sp),#23804
	lea (68,%sp),%sp
	rts
.L2513:
	tst.l st+1058
	jeq .L2520
	addq.l #1,st+952
.L2521:
	clr.l %d2
	jra .L2519
.L2520:
	tst.l mask_set
	jeq .L2522
	moveq #15,%d0
	cmp.l %a6,%d0
	jcs .L2523
	move.l mask_enc,%d0
	move.l %a6,%d1
	btst %d1,%d0
	jne .L2522
.L2523:
	addq.l #1,st+952
	moveq #8,%d3
	cmp.l %a6,%d3
	jne .L2521
	move.l st+8,%a0
	addq.l #1,st+1086
	lea (47,%a0),%a0
	move.l %a0,st+1082
	jra .L2521
.L2522:
	addq.l #1,st+948
	tst.b 20(%a0)
	jne .L2543
	move.l st+216,%d0
	mov3q.l #1,%d1
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d1,%d0
.L2525:
	move.b %d0,st+160
	moveq #15,%d3
	cmp.l %a6,%d3
	jcs .L2516
	move.l %a6,%d4
	add.l #24,%d4
	add.l %d2,(%a2,%d4.l*4)
	tst.l st+64
	jne .L2527
	move.l #-66650100,%a0
	move.l (%a0),st+64
.L2527:
	tst.l st+388
	jne .L2528
	move.l #-66650100,%a1
	lea commits,%a0
	move.l (%a1),st+388
	move.l (%a0),st+392
.L2528:
	move.l %a6,%d5
	add.l #122,%d5
	lea bind_gen,%a4
	move.l (%a4,%a6.l*4),%d6
	move.l (%a2,%d5.l*4),%a3
	cmp.l %d6,%a3
	jeq .L2531
	btst #0,%d6
	jne .L2531
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
	jne .L2531
	move.l %d3,%d0
	move.l %a6,%d1
	add.l #st+552,%d0
	add.l #102,%d1
	tst.l (%a2,%d1.l*4)
	jeq .L2544
	move.l %d0,%a1
	move.b 48(%sp),%d3
	move.b (%a1),%d1
	eor.l %d1,%d3
	tst.b %d3
	seq %d3
	mvs.b %d3,%d3
	neg.l %d3
.L2533:
	mov3q.l #5,-(%sp)
	move.l %d7,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a0)
	lea (12,%sp),%sp
	tst.l %d3
	jne .L2534
	lea (%a2,%a6.l),%a0
	move.b 49(%sp),472(%a0)
.L2534:
	move.l %d6,(%a2,%d5.l*4)
	move.l %d6,%a3
.L2531:
	tst.l %a3
	jeq .L2535
	move.l %a6,%d0
	moveq #20,%d3
	muls.l %d3,%d0
	lea (%a2,%d0.l),%a0
	mvz.b 552(%a0),%d1
	lsr.l #6,%d1
	jne .L2535
	lea (102,%a6),%a1
	add.l #st,%a6
	tst.l (%a2,%a1.l*4)
	jne .L2536
	move.b 553(%a0),472(%a6)
.L2536:
	move.l %d0,%a0
	add.l #st+556,%a0
	move.b (%a0),%d1
	mvz.b 472(%a6),%d3
	btst #0,%d1
	jeq .L2545
	tst.b st+160.l
	jne .L2546
.L2545:
	mov3q.l #1,%d1
.L2537:
	muls.l %d1,%d2
	move.l %d0,%a0
	add.l #st+554,%a0
	mvz.b (%a0),%d1
	add.l %d3,%d2
	cmp.l %d2,%d1
	jle .L2538
	move.l %d1,%d2
.L2538:
	move.l %d0,%a0
	add.l #st+555,%a0
	mvz.b (%a0),%d1
	cmp.l %d2,%d1
	jge .L2539
	move.l %d1,%d2
.L2539:
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
	jne .L2540
	move.l #-66650100,%a1
	move.l (%a1),st+368
.L2540:
	moveq #1,%d0
	move.l 72(%sp),%a1
	move.l 32(%a1),%a0
	move.b %d0,32(%a0)
.L2535:
	jsr flush
	tst.l (%a2,%d4.l*4)
	jne .L2516
	addq.l #1,st+384
	jra .L2516
.L2543:
	mov3q.l #1,%d0
	jra .L2525
.L2544:
	clr.l %d3
	jra .L2533
.L2546:
	moveq #8,%d1
	jra .L2537
	.size	rui_enc, .-rui_enc
	.align	2
	.globl	pj_write
	.type	pj_write, @function
pj_write:
	move.l 4(%sp),%d0
	move.l 8(%sp),%d1
	cmp.l #1074464814,%d0
	jeq .L2556
	cmp.l #1073958730,%d0
	jeq .L2556
	lea pj_push,%a0
	cmp.l #1074076072,%d0
	jne .L2558
	move.l %d1,-(%sp)
	mov3q.l #-1,-(%sp)
	mov3q.l #5,-(%sp)
.L2571:
	jsr (%a0)
	lea (12,%sp),%sp
.L2556:
	rts
.L2558:
	cmp.l #1074076390,%d0
	jeq .L2559
	cmp.l #1074076276,%d0
	jne .L2560
.L2559:
	move.l %d1,-(%sp)
	mov3q.l #-1,-(%sp)
	mov3q.l #3,-(%sp)
	jra .L2571
.L2560:
	cmp.l #1073959500,%d0
	jne .L2561
	mvz.b pj+137,%d0
	move.l %d1,-(%sp)
	move.l %d0,%a1
	pea -1(%a1)
	mov3q.l #2,-(%sp)
	jra .L2571
.L2561:
	move.l %d1,-(%sp)
	mov3q.l #-1,-(%sp)
	mov3q.l #7,-(%sp)
	jra .L2571
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
	jcs .L2575
	addq.l #1,%d0
.L2574:
	move.b %d0,pj+137
	rts
.L2575:
	clr.b %d0
	jra .L2574
	.size	pj_copy, .-pj_copy
	.align	2
	.globl	pj_save
	.type	pj_save, @function
pj_save:
	move.l 4(%sp),%d0
	tst.l %d0
	jlt .L2576
	move.b 1079807565,%d1
	move.l %d0,-(%sp)
	mvs.b %d1,%d1
	move.l %d1,-(%sp)
	mov3q.l #1,-(%sp)
	jsr pj_push
	lea (12,%sp),%sp
.L2576:
	rts
	.size	pj_save, .-pj_save
	.align	2
	.globl	pj_activate
	.type	pj_activate, @function
pj_activate:
	move.l 4(%sp),%d0
	tst.l %d0
	jlt .L2578
	move.l #1074457822,%d1
	cmp.l 8(%sp),%d1
	jne .L2578
	move.l #1074479198,%d1
	cmp.l 12(%sp),%d1
	jne .L2578
	move.l %d0,12(%sp)
	moveq #10,%d0
	mov3q.l #-1,8(%sp)
	move.l %d0,4(%sp)
	jra pj_push
.L2578:
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
	jge .L2581
	moveq #127,%d0
.L2582:
	move.l %d0,-(%sp)
	pea 65.w
	jsr pj_push
	lea (12,%sp),%sp
	rts
.L2581:
	tst.l %d0
	jge .L2582
	clr.l %d0
	jra .L2582
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
	.type	CSWTCH.549, @object
	.size	CSWTCH.549, 7
CSWTCH.549:
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
	.type	CSWTCH.547, @object
	.size	CSWTCH.547, 40
CSWTCH.547:
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
