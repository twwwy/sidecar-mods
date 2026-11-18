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
	lea CSWTCH.483,%a0
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
	lea CSWTCH.542,%a0
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
	lea CSWTCH.540,%a5
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
| 5012 "rui.c" 1
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
	move.l 64(%sp),%a6
	clr.l %d5
	clr.l sv+80
	sub.l %a4,%a4
	move.l 28(%a6),%a2
	clr.l %d4
	lea (20,%a6),%a0
	clr.l %d6
	clr.l %d2
	move.b 1093765506,%d7
	clr.l 44(%sp)
	move.l %a0,56(%sp)
	mvz.b %d7,%d0
	move.l %d0,%a5
	clr.l %d0
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
	moveq #16,%d6
	lsl.l #2,%d3
	moveq #11,%d0
	and.l %d6,%d3
	cmp.l %a5,%d0
	jlt .L850
	tst.l %d2
	jeq .L851
	move.b %d7,%d1
	moveq #127,%d0
	and.l -2147457096,%d0
	ext.w %d1
	mulu.w #2531,%d0
	mulu.w #152,%d1
	move.l %d0,%a0
	add.l %d1,%a0
	add.l #1092966773,%a0
	move.b (%a0),%d4
.L818:
	mvz.b %d4,%d5
	mov3q.l #3,%d1
	and.l %d1,%d2
	mov3q.l #4,%d6
	move.l %d5,%d0
	add.l #-35,%d0
	cmp.l %d0,%d6
	jcc .L819
	tst.l %d3
	jeq .L820
	clr.l sv+80
	moveq #16,%d3
.L820:
	tst.l %d2
	jne .L827
.L821:
	tst.b sv.l
	jeq .L831
	move.b sv+4,%d0
	mov3q.l #1,%d1
	clr.b %d6
	addq.l #1,sv+60
	or.l %d1,%d0
	move.b %d6,sv
	move.b %d6,sv+6
	move.b %d0,sv+4
	jra .L831
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
	addq.l #1,%d4
	moveq #16,%d1
	cmp.l %d4,%d1
	jne .L791
.L804:
	cmp.l sv+84.l,%d0
	jne .L808
	cmp.l sv+88.l,%a4
	jeq .L809
.L808:
	move.l %d0,sv+84
	move.l %a4,sv+88
	clr.l sv+96
.L810:
	move.l %d4,sv+92
	tst.l %d6
	jeq .L811
	moveq #16,%d0
	cmp.l %d4,%d0
	jeq .L811
	tst.l %a2
	jne .L812
.L811:
	clr.l sv+80
	jra .L813
.L794:
	move.l %d3,%a4
	cmp.l #1075721468,%d3
	jne .L797
	move.l %a3,sv+80
	mov3q.l #1,%d6
.L798:
	tst.l %d2
	jeq .L800
	lea sv_covers,%a0
	clr.l %d0
.L801:
	cmp.l (%a0),%d3
	jne .L803
.L854:
	move.l %d2,%d5
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
	or.l %d0,%d6
	move.l %a3,%a1
	jra .L798
.L799:
	cmp.l #1075628548,%d3
	jne .L798
	tst.b 127(%a3)
	sne %d0
	mvs.b %d0,%d0
	neg.l %d0
	or.l %d0,%d5
	jra .L798
.L803:
	addq.l #4,%a0
	addq.l #1,%d0
	moveq #8,%d1
	cmp.l %d0,%d1
	jne .L801
	move.l %d3,-(%sp)
	move.l %a1,56(%sp)
	jsr overlay
	addq.l #4,%sp
	move.l 52(%sp),%a1
	tst.l %d0
	jne .L854
	move.l %d2,44(%sp)
	jra .L800
.L809:
	move.l sv+96,%d0
	cmp.l #65534,%d0
	jhi .L810
	addq.l #1,%d0
	move.l %d0,sv+96
	jra .L810
.L812:
	mov3q.l #1,%d1
	eor.l %d1,%d2
	or.l %d5,%d2
	tst.l 44(%sp)
	jeq .L815
	cmp.l #1076055292,%a4
	jeq .L815
	moveq #59,%d4
	cmp.l sv+96.l,%d4
	scc %d0
	mvs.b %d0,%d0
	neg.l %d0
	or.l %d0,%d2
.L815:
	btst #0,%d6
	jne .L817
	move.l %a1,sv+80
	addq.l #5,%d2
	jra .L793
.L817:
	addq.l #1,%d2
	jra .L793
.L850:
	clr.l %d2
.L851:
	clr.b %d4
	jra .L818
.L819:
	tst.l %d2
	jeq .L821
	move.l sv_umb,%d0
	tst.l %d0
	jne .L822
	move.l #1481856080,%a0
	cmp.l 1073848892.l,%a0
	jne .L827
	move.l 1073848896,%a0
	moveq #28,%d6
	move.l #1431130183,-(%sp)
	jsr (%a0)
	addq.l #4,%sp
	move.l %d0,%d1
	lsr.l %d6,%d1
	subq.l #4,%d1
	tst.l %d1
	jeq .L824
.L825:
	mov3q.l #1,sv_umb
.L827:
	move.l %d5,-(%sp)
	moveq #127,%d6
	move.l %a5,-(%sp)
	jsr mr_vb
	addq.l #8,%sp
	mvz.b %d0,%d0
	cmp.l %d0,%d6
	jeq .L821
	tst.b sv.l
	jeq .L828
	mvz.b sv+1,%d1
	mvz.b sv+10,%d0
	cmp.l %a5,%d1
	jne .L829
	mvz.b sv+2,%d1
	cmp.l %d1,%d5
	jne .L829
	cmp.l %d3,%d0
	jne .L830
.L831:
	mov3q.l #2,%d6
	cmp.l %d2,%d6
	seq %d4
	move.b sv,%d5
	neg.l %d4
	move.b %d4,sv+3
	tst.b %d5
	jeq .L832
	mov3q.l #1,%d0
	cmp.l %d2,%d0
	jeq .L833
.L832:
	mov3q.l #-1,%d0
.L834:
	move.l 68(%sp),%d6
	move.l %d0,sv+116
	cmp.l sv+20.l,%d6
	jeq .L840
	clr.l sv+16
	sub.l %a0,%a0
.L841:
	move.l 68(%sp),%a1
	move.l sv+12,%d1
	move.l %a1,sv+20
	move.l st+4,%a1
	move.l st+972,%d7
	tst.b %d5
	jeq .L842
	mov3q.l #2,%d0
	cmp.l %d2,%d0
	jne .L843
.L842:
	clr.l %d3
.L844:
	cmp.l commits.l,%d1
	sne %d0
	tst.l %a1
	sne %d1
	tst.l %d7
	sne %d7
	add.l %d4,%d4
	move.b %d3,%d6
	move.b %d3,sv+8
	neg.l %d0
	neg.l %d1
	lsl.l #4,%d1
	lsl.l #2,%d0
	neg.l %d7
	lsl.l #5,%d7
	or.l %d1,%d0
	or.l %d5,%d0
	or.l %d7,%d0
	or.l %d4,%d0
	moveq #19,%d4
	cmp.l %a0,%d4
	scs %d1
	mvz.b sv+101,%d4
	neg.l %d1
	lsl.l #3,%d1
	or.l %d1,%d0
	move.l %d3,%d1
	lsl.l #6,%d1
	or.l %d1,%d0
	mvz.b %d0,%d1
	cmp.l %d4,%d1
	jne .L845
	move.l sv+104,%a0
	cmp.l sv+88.l,%a0
	jne .L845
	tst.l %d2
	jeq .L846
	move.l st+8,%d1
	moveq #19,%d4
	sub.l sv+108,%d1
	cmp.l %d1,%d4
	jge .L846
.L845:
	moveq #1,%d1
	move.b %d1,sv+102
.L846:
	move.b %d0,sv+100
	mvz.b %d6,%d0
	mvz.b sv+9,%d1
	cmp.l %d0,%d1
	jeq .L790
	tst.l %d3
	jeq .L848
	addq.l #1,sv+72
	mov3q.l #-1,st+20
	mov3q.l #1,st+344
.L849:
	move.b %d6,sv+9
	moveq #1,%d6
	move.b %d6,32(%a6)
.L790:
	movem.l (%sp),#31996
	lea (60,%sp),%sp
	rts
.L824:
	mov3q.l #3,%d1
	and.l %d0,%d1
	tst.l %d1
	jne .L825
	move.l #1431130183,%a1
	move.l %d0,%a0
	cmp.l (%a0),%a1
	jne .L825
	move.l %d0,sv_umb
.L826:
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
	jne .L827
	add.l #32,%d3
	clr.l sv+80
	jra .L827
.L822:
	mov3q.l #1,%d1
	cmp.l %d0,%d1
	jne .L826
	jra .L827
.L829:
	cmp.l %d3,%d0
	jeq .L828
.L830:
	move.b sv+4,%d0
	mov3q.l #2,%d1
	lea sv+5,%a0
	move.b (%a0),sv+11
	or.l %d1,%d0
	move.b %d0,sv+4
.L828:
	move.b sv+4,%d0
	move.b %d4,sv+2
	move.b %d3,sv+10
	mov3q.l #1,%d1
	moveq #1,%d6
	or.l %d7,%d3
	move.w #257,%d4
	lea commits,%a0
	move.b %d7,sv+1
	move.l (%a0),sv+12
	or.l %d1,%d0
	addq.l #1,sv+56
	move.b %d6,sv
	move.b %d3,sv+5
	move.w %d4,sv+6
	move.b %d0,sv+4
	jra .L831
.L833:
	mvz.b sv+10,%d0
	lsr.l #5,%d0
	jne .L832
	move.l 1100949720,%a2
	move.l %a2,%d0
	add.l #-1073741824,%d0
	cmp.l #67108863,%d0
	jhi .L832
	jsr sq_grid
	tst.l %d0
	jeq .L832
	move.l 348(%a2),%d1
	tst.l %d1
	jeq .L907
	clr.l %d0
	jra .L835
.L837:
	addq.l #1,%d0
.L835:
	btst %d0,%d1
	jeq .L837
	jra .L834
.L907:
	move.l 344(%a2),%d1
	clr.l %d0
	tst.l %d1
	jeq .L832
.L838:
	btst %d0,%d1
	jeq .L839
	add.l #32,%d0
	jra .L834
.L839:
	addq.l #1,%d0
	jra .L838
.L840:
	move.l sv+16,%a0
	cmp.l #65534,%a0
	jhi .L841
	addq.l #1,%a0
	move.l %a0,sv+16
	jra .L841
.L843:
	cmp.l commits.l,%d1
	jeq .L842
	moveq #19,%d6
	cmp.l %a0,%d6
	jcs .L842
	move.l %a1,%d3
	or.l %d7,%d3
	seq %d3
	mvs.b %d3,%d3
	neg.l %d3
	jra .L844
.L848:
	subq.l #2,%d2
	tst.l %d2
	jne .L849
	addq.l #1,sv+76
	jra .L849
	.size	sv_tick, .-sv_tick
	.align	2
	.type	enter, @function
enter:
	move.l %d2,-(%sp)
	move.b 15(%sp),%d1
	tst.l st+4
	jne .L908
	tst.l st+972
	jeq .L910
	clr.l st+972
	mov3q.l #6,st+988
.L910:
	lea commits,%a0
	moveq #16,%d0
	move.l (%a0),st+24
	mov3q.l #1,st+4
	clr.l st+12
	mov3q.l #-1,st+20
	lea st+96,%a0
	addq.l #1,st+48
.L911:
	clr.l (%a0)+
	subq.l #1,%d0
	tst.l %d0
	jne .L911
	lea st+408,%a0
.L912:
	clr.l (%a0)+
	moveq #16,%d2
	addq.l #1,%d0
	cmp.l %d0,%d2
	jne .L912
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
.L908:
	move.l (%sp)+,%d2
	rts
	.size	enter, .-enter
	.align	2
	.type	leave, @function
leave:
	move.l %d2,-(%sp)
	move.b 15(%sp),%d1
	tst.l st+4
	jeq .L915
	clr.l st+4
	clr.l st+1038
	addq.l #1,st+52
	clr.l st+1058
	clr.l st+196
	tst.l nk
	jeq .L917
	moveq #-33,%d0
	moveq #32,%d2
	and.l %d0,st+240
	or.l %d2,st+272
	clr.l nk
.L917:
	clr.l %d0
	lea kq_nodown,%a1
	lea kq_owed,%a0
.L918:
	clr.l (%a1,%d0.l)
	moveq #32,%d2
	clr.l (%a0,%d0.l)
	addq.l #4,%d0
	cmp.l %d0,%d2
	jne .L918
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
	jne .L919
	clr.l st+1006
	jsr led_restore
.L919:
	moveq #1,%d0
	move.l 8(%sp),%a0
	move.b %d0,32(%a0)
.L915:
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
	jeq .L922
	move.l st+8,%d0
	mov3q.l #1,txsx_test_on
	add.l txsx_test,%d0
	clr.l txsx_test
	move.l %d0,txsx_test_end
.L922:
	tst.l kq_owes
	jeq .L923
	jsr (kq_owed_in.part.0)
.L923:
	moveq #31,%d1
	mov3q.l #1,%d0
	and.l %d3,%d1
	move.l %d3,%d2
	lsr.l #5,%d2
	lea kq_nodown,%a0
	move.l (%a0,%d2.l*4),%d4
	lsl.l %d1,%d0
	tst.l 28(%sp)
	jeq .L924
	move.l %d0,%d1
	not.l %d1
	and.l %d4,%d1
	move.l %d1,(%a0,%d2.l*4)
	tst.l kq_owes
	jne .L925
	move.l st+196,%d1
	moveq #15,%d5
	move.l %d1,%a1
	addq.l #6,%a1
	cmp.l %a1,%d5
	jcc .L926
.L925:
	or.l %d0,%d4
	addq.l #1,st+44
	move.l %d4,(%a0,%d2.l*4)
.L921:
	movem.l (%sp),#1084
	lea (20,%sp),%sp
	rts
.L924:
	move.l %d4,%d1
	and.l %d0,%d1
	tst.l %d1
	jeq .L928
	not.l %d0
	and.l %d4,%d0
	move.l %d0,(%a0,%d2.l*4)
	jra .L921
.L928:
	move.l st+196,%d1
	moveq #15,%d4
	cmp.l %d1,%d4
	jcc .L926
	move.l %d1,%a1
	subq.l #1,%a1
	lea st+164,%a0
.L929:
	tst.l %a1
	jlt .L930
	mvz.b (%a0,%a1.l*2),%d4
	cmp.l %d4,%d3
	jne .L931
	move.l %a1,%d3
	add.l %d3,%d3
	move.l %d3,%d4
	add.l #st,%d4
	move.l %d4,%a2
	tst.b 165(%a2)
	jeq .L930
	add.l %d3,%a0
.L932:
	addq.l #1,%a1
	cmp.l %d1,%a1
	jlt .L933
	subq.l #1,%d1
	move.l %d1,st+196
	addq.l #1,st+44
	jra .L921
.L931:
	subq.l #1,%a1
	jra .L929
.L933:
	addq.l #2,%a0
	move.b (%a0),-2(%a0)
	move.b 1(%a0),-1(%a0)
	jra .L932
.L930:
	lea kq_owed,%a0
	move.l (%a0,%d2.l*4),%d1
	move.l %d1,%d3
	and.l %d0,%d3
	tst.l %d3
	jne .L921
	or.l %d0,%d1
	addq.l #1,kq_owes
	move.l %d1,(%a0,%d2.l*4)
	jra .L921
.L926:
	lea st,%a0
	move.l %d1,%d0
	add.l #82,%d0
	move.b %d3,(%a0,%d0.l*2)
	lea (%a0,%d1.l*2),%a0
	addq.l #1,%d1
	move.l %d1,st+196
	move.b 31(%sp),165(%a0)
	jra .L921
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
	jne .L938
	move.l %d0,28(%a0)
	clr.b %d0
	move.l %d1,16(%a0)
.L939:
	move.b %d0,3(%a0)
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L938:
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
	jra .L939
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
.L941:
	cmp.l pmo+104.l,%d3
	jcs .L945
	movem.l (%sp),#3084
	lea (16,%sp),%sp
	rts
.L945:
	move.b (%a2),%d0
	jeq .L942
	mvz.b %d0,%d0
	move.l 20(%sp),%d1
	subq.l #1,%d0
	btst %d0,%d1
	jeq .L942
	clr.l 12(%a2)
	tst.l %d2
	jne .L943
	clr.b %d0
	clr.l 4(%a2)
.L944:
	move.b %d0,2(%a2)
	move.l %d2,-(%sp)
	clr.l -(%sp)
	move.l %a2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
.L942:
	addq.l #1,%d3
	lea (44,%a2),%a2
	jra .L941
.L943:
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
	jra .L944
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
	jeq .L952
	move.l %d2,-(%sp)
	jsr cu_src_setup
	mvz.b cu+1,%d0
	move.l %d2,%d4
	addq.l #4,%sp
	add.l #-43,%d4
	cmp.l %d0,%d2
	jne .L954
	move.l 1075597888,%d0
	cmp.l 4(%a2),%d0
	jne .L954
	move.l 1075596172,%d0
	cmp.l 116(%a2),%d0
	jne .L954
	move.l 1075597884,%d1
	moveq #9,%d0
	cmp.l %d4,%d0
	jcs .L958
	lea CSWTCH.540,%a0
	move.l (%a0,%d4.l*4),%d0
.L955:
	cmp.l %d0,%d1
	jeq .L952
.L954:
	lea cu_p2,%a3
	clr.l %d3
	lea CSWTCH.540,%a5
	lea cu_knob,%a4
.L957:
	moveq #9,%d0
	cmp.l %d4,%d0
	jcs .L959
	move.l (%a5,%d4.l*4),%d0
.L956:
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
	jne .L957
	move.w cu+2,%d0
	move.b %d2,cu+1
	addq.l #1,%d0
	move.w %d0,cu+2
.L952:
	movem.l (%sp),#15388
	lea (28,%sp),%sp
	rts
.L958:
	move.l #cu_fm_short,%d0
	jra .L955
.L959:
	move.l #cu_fm_short,%d0
	jra .L956
	.size	cu_setup, .-cu_setup
	.align	2
	.type	isr_send, @function
isr_send:
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 16(%sp),%d1
	mov3q.l #1,%d0
	cmp.l 1094562388.l,%d0
	jeq .L965
.L973:
	clr.l %d0
.L964:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L965:
#APP
| 1753 "rui.c" 1
	move.w %sr,%d0
| 0 "" 2
#NO_APP
	move.l %d0,%d3
	move.l %d0,%d2
	and.l #1792,%d3
	mvz.w %d2,%d2
	cmp.l #1279,%d3
	jhi .L967
	and.l #63743,%d0
	or.l #1280,%d0
#APP
| 1757 "rui.c" 1
	move.w %d0,%sr
| 0 "" 2
#NO_APP
.L967:
	tst.l 1123449384
	jeq .L968
.L970:
#APP
| 1762 "rui.c" 1
	move.w %d2,%sr
| 0 "" 2
#NO_APP
	addq.l #1,sq+388
	jra .L973
.L968:
	tst.l 1094562372
	jne .L970
	move.l %d1,%d0
	add.l 1094562392,%d0
	cmp.l #3800,%d0
	jgt .L970
	move.l 1094562704,%a0
	tst.l %a0
	jeq .L970
	move.l 52(%a0),%a0
	tst.l %a0
	jeq .L970
	move.l 52(%a0),%d0
	move.l 12(%sp),-(%sp)
	move.l %d1,-(%sp)
	jsr 1073752544
#APP
| 1762 "rui.c" 1
	move.w %d2,%sr
| 0 "" 2
#NO_APP
	mov3q.l #1,%d0
	addq.l #8,%sp
	jra .L964
	.size	isr_send, .-isr_send
	.align	2
	.globl	rui_render_in
	.type	rui_render_in, @function
rui_render_in:
	link.w %fp,#-112
	movem.l #1084,(%sp)
	tst.l 1094562372
	jne .L981
	mov3q.l #1,txsx_gap
.L981:
	lea fp,%a0
	addq.l #1,(%a0)
	tst.l fp+8
	jeq .L982
	move.l (%a0),%d0
	sub.l fp+4,%d0
	cmp.l #3000,%d0
	jls .L982
	move.l fp+8,%a0
	move.l fp,%d0
	move.l fp+4,%d1
	move.l 1123449124,%d2
	tst.l fp+12
	jeq .L983
	move.l fp,%a1
	sub.l fp+12,%a1
	cmp.l #7499,%a1
	jls .L982
.L983:
	cmp.l %a0,%d2
	seq %d3
	sub.l %d1,%d0
	lea (-90,%fp),%a1
	clr.l %d1
	move.l %a1,%d4
	neg.l %d3
.L984:
	move.l %d4,%a2
	addq.l #1,%d1
	clr.l (%a2)+
	moveq #9,%d5
	move.l %a2,%d4
	cmp.l %d1,%d5
	jne .L984
	cmp.l %a0,%d2
	jeq .L985
	mov3q.l #1,%d1
	move.l 72(%a0),%d2
	and.l %d2,%d1
	btst #0,%d2
	jne .L985
	move.l %d2,%a0
	add.l #-1073741824,%a0
	cmp.l #129892303,%a0
	jhi .L985
.L986:
	move.l %d2,%a0
	moveq #36,%d4
	lea 4(%a0,%d1.l),%a2
	move.l (%a2),(%a1,%d1.l)
	addq.l #4,%d1
	cmp.l %d1,%d4
	jne .L986
.L985:
	move.w #19969,%a0
	move.l #-260222380,%d5
	move.b %d3,-48(%fp)
	move.l %d5,-54(%fp)
	move.w %a0,-50(%fp)
	cmp.l #191999,%d0
	jhi .L998
	mvz.w #1500,%d2
	divu.l %d2,%d0
.L987:
	move.b %d0,-47(%fp)
	lea (-46,%fp),%a0
	clr.l %d1
.L988:
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
	jne .L988
	moveq #-9,%d5
	pea 54.w
	pea -54(%fp)
	move.b %d5,-1(%fp)
	jsr isr_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L982
	lea fp,%a0
	tst.l (%a0)
	jeq .L999
	move.l (%a0),%d0
.L990:
	move.l %d0,fp+12
	addq.l #1,fp+16
.L982:
	move.l 1123623180,%d0
	move.l qp,%d4
	move.l qp+8,%d3
	tst.l qp+12
	jne .L991
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
.L991:
	tst.l qp+24
	jne .L992
	cmp.l qp+16.l,%d0
	jne .L993
	move.l qp+20,%a2
	cmp.l 1123623184.l,%a2
	jeq .L992
.L993:
	mov3q.l #1,qp+24
.L992:
	tst.l qp+4
	jeq .L980
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
	jne .L995
	cmp.l qp+36.l,%d3
	jeq .L980
.L995:
	move.l fp,%d1
	moveq #11,%d5
	sub.l qp+32,%d1
	cmp.l %d1,%d5
	jcc .L980
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
	jeq .L980
	move.l qp+40,%d0
	tst.l %d0
	jeq .L996
	move.l qp+84,%a0
	move.l qp+32,%d1
	tst.l %a0
	jeq .L997
	move.l fp,%a1
	sub.l %d1,%a1
	cmp.l %a0,%a1
	jcc .L996
.L997:
	move.l fp,%d4
	sub.l %d1,%d4
	move.l %d4,qp+84
.L996:
	lea fp,%a1
	addq.l #1,%d0
	move.l %d2,qp+28
	move.l %d3,qp+36
	move.l %d0,qp+40
	move.l (%a1),qp+32
.L980:
	movem.l -112(%fp),#1084
	unlk %fp
	rts
.L998:
	moveq #127,%d0
	jra .L987
.L999:
	mov3q.l #1,%d0
	jra .L990
	.size	rui_render_in, .-rui_render_in
	.align	2
	.globl	rui_uart
	.type	rui_uart, @function
rui_uart:
	lea (-40,%sp),%sp
	movem.l #19468,(%sp)
	clr.l %d2
	tst.b ov_on.l
	jne .L1039
	tst.b ovp_on.l
	jne .L1039
	tst.b ovt_on.l
	jeq .L1026
.L1039:
	move.l 44(%sp),%a0
	subq.l #1,%a0
	sub.l %a6,%a6
	lea rui_uart_raw,%a3
	move.l %a0,20(%sp)
	jra .L1031
.L1027:
	move.l 48(%sp),%a0
	mvz.b (%a0,%d2.l),%d0
	addq.l #1,%d2
	move.l %d0,-(%sp)
	jsr uart_byte
	addq.l #4,%sp
.L1026:
	cmp.l 44(%sp),%d2
	jlt .L1027
	clr.l %d0
.L1024:
	movem.l (%sp),#19468
	lea (40,%sp),%sp
	rts
.L1032:
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
	jeq .L1029
	cmp.l 20(%sp),%a6
	jne .L1030
.L1029:
	pea 24(%sp)
	move.l %d3,-(%sp)
	jsr (%a3)
	addq.l #8,%sp
	clr.l %d3
.L1030:
	addq.l #1,%a6
	move.l %d3,%d2
.L1031:
	cmp.l 44(%sp),%a6
	jlt .L1032
	mov3q.l #1,%d0
	jra .L1024
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
	jcc .L1041
.L1045:
	clr.l %d0
.L1040:
	move.l (%sp)+,%d2
	rts
.L1041:
	tst.l sq
	jeq .L1043
	move.l sq+4,%a0
	move.l %a0,%d2
	btst %d1,%d2
	jeq .L1043
	addq.l #1,sq+448
	mov3q.l #1,%d0
	jra .L1040
.L1043:
	tst.l %d0
	jlt .L1046
	moveq #63,%d2
	cmp.l %d0,%d2
	jlt .L1047
.L1044:
	lea pc,%a0
	move.b %d0,48(%a0,%d1.l)
	moveq #1,%d0
	lea st+8,%a1
	move.l (%a1),(%a0,%d1.l*4)
	move.b %d0,60(%a0,%d1.l)
	jra .L1045
.L1046:
	clr.b %d0
	jra .L1044
.L1047:
	moveq #63,%d0
	jra .L1044
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
	jcs .L1054
	mov3q.l #1,%d1
	cmp.l 1079807120.l,%d1
	jeq .L1056
	clr.l sq+540
	clr.l sq+544
.L1054:
	movem.l (%sp),#3132
	lea (24,%sp),%sp
	rts
.L1056:
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
	jeq .L1058
	mvz.b 516(%a0),%d1
	cmp.l %d4,%d1
	jeq .L1059
.L1060:
	clr.l %d0
.L1058:
	mov3q.l #1,%d1
	lsl.l %d2,%d1
	move.l %a1,%d5
	move.b %d3,516(%a0)
	move.b 35(%sp),528(%a0)
	or.l %d1,%d5
	move.l sq+360,%d1
	move.l %d5,sq+540
	btst #8,%d1
	jeq .L1062
	tst.l %d0
	jne .L1054
	tst.l %d4
	jeq .L1063
	tst.l sq+544
	jeq .L1064
.L1063:
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
.L1064:
	lsr.l #7,%d4
	jne .L1054
	tst.l (%a2)
	jeq .L1054
	move.l sq+8,%d0
	btst %d2,%d0
	jeq .L1054
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
	jne .L1065
	mvz.w #917,%d0
	muls.l %d2,%d0
	add.l #709,%d0
	move.b (%a0,%d0.l),%d0
	jpl .L1067
	moveq #127,%d0
.L1067:
#APP
| 1753 "rui.c" 1
	move.w %sr,%d1
| 0 "" 2
#NO_APP
	move.l %d1,%d5
	move.l %d1,%d4
	and.l #1792,%d5
	mvz.w %d4,%d4
	cmp.l #1792,%d5
	jeq .L1069
	and.l #63743,%d1
	or.l #1792,%d1
#APP
| 1757 "rui.c" 1
	move.w %d1,%sr
| 0 "" 2
#NO_APP
.L1069:
	move.l sq+268,%d1
	sub.l sq+272,%d1
	lsr.l #5,%d1
	jeq .L1070
	addq.l #1,sq+380
.L1071:
#APP
| 1762 "rui.c" 1
	move.w %d4,%sr
| 0 "" 2
#NO_APP
	jra .L1054
.L1059:
	mvz.b 528(%a0),%d1
	cmp.l 32(%sp),%d1
	jeq .L1060
	addq.l #1,sq+548
	mov3q.l #1,sq+544
	jra .L1058
.L1062:
	tst.l %d0
	jne .L1054
	jra .L1064
.L1065:
	move.l #85683,%d0
	move.b (%a0,%d0.l),%d0
	move.l #85684,%d1
	mvz.b (%a0,%d1.l),%d1
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d1,%d0
	moveq #127,%d1
	cmp.l %d0,%d1
	jcc .L1067
	moveq #127,%d0
	jra .L1067
.L1070:
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
	jra .L1071
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
	jcc .L1085
	clr.l %d2
.L1085:
	tst.l sq+348
	jne .L1086
	move.l %d2,sq+352
	move.l %d3,sq+356
	mov3q.l #1,sq+348
.L1086:
	lea sq,%a6
	tst.l (%a6)
	jeq .L1087
	cmp.l sq+352.l,%d2
	jeq .L1088
	move.l %d2,%d1
	mvz.b %d1,%d1
	move.l %d4,-(%sp)
	mov3q.l #1,-(%sp)
	clr.l -(%sp)
	move.l %d1,-(%sp)
	mov3q.l #1,-(%sp)
	jsr sq_event
	lea (20,%sp),%sp
.L1088:
	move.l sq+356,%d0
	cmp.l %d0,%d3
	jeq .L1089
	mov3q.l #1,%d1
	cmp.l %d2,%d1
	jne .L1090
	bset #8,%d0
	move.l %d0,sq+360
.L1087:
	move.l %d2,sq+352
	move.l %d3,sq+356
.L1092:
	tst.l sq+344
	jne .L1097
	move.l %sp,%d3
	move.l %sp,%d2
	add.l #42,%d3
	add.l #36,%d2
.L1098:
	move.l sq+272,%d4
	cmp.l sq+268.l,%d4
	jne .L1104
.L1103:
	move.l -66650100,%d0
	sub.l 32(%sp),%d0
	cmp.l sq+396.l,%d0
	jls .L1084
	move.l %d0,sq+396
.L1084:
	movem.l (%sp),#23612
	lea (104,%sp),%sp
	rts
.L1090:
	mvz.b %d0,%d0
	move.l %d4,-(%sp)
	mov3q.l #2,-(%sp)
	move.l %d5,-(%sp)
	move.l %d0,-(%sp)
	mov3q.l #3,-(%sp)
	jsr sq_event
	lea (20,%sp),%sp
.L1091:
	move.l sq+360,%d0
	btst #8,%d0
	jeq .L1087
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
	jra .L1087
.L1089:
	mov3q.l #1,%d0
	cmp.l %d2,%d0
	jne .L1091
	jra .L1087
.L1097:
	mvz.b sq+340,%d0
	move.l %d0,-(%sp)
	pea sq+276
	jsr isr_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1084
	move.l sq+344,%d3
	clr.l %d1
	addq.l #1,sq+376
	lea sq+340,%a0
.L1094:
	cmp.l %d3,%d0
	jlt .L1096
	subq.l #1,%d3
	move.l %d3,sq+344
	jra .L1092
.L1096:
	mvz.w %d0,%d2
	lea sq+276,%a2
	sub.l %a1,%a1
	sub.l %d1,%a2
	lsl.l #4,%d2
.L1095:
	move.l %a2,%d4
	add.l %d1,%d4
	move.l %d4,%a4
	addq.l #1,%a1
	move.b (%a4,%d2.l),(%a2)+
	moveq #16,%d4
	cmp.l %a1,%d4
	jne .L1095
	move.b 1(%a0),(%a0)
	addq.l #1,%a0
	addq.l #1,%d0
	add.l #-16,%d1
	jra .L1094
.L1104:
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
.L1099:
	move.l sq+272,%d0
	add.l %d4,%d0
	cmp.l sq+268.l,%d0
	jeq .L1100
	moveq #14,%d0
	cmp.l %d4,%d0
	jeq .L1100
	move.l sq+272,%d0
	moveq #31,%d1
	add.l %d4,%d0
	and.l %d1,%d0
	lsl.l #3,%d0
	cmp.l 12(%a6,%d0.l),%d5
	jeq .L1101
.L1100:
	move.b %d4,46(%sp)
	move.b #-9,(%a0)+
	sub.l %d2,%a0
	move.l %a0,-(%sp)
	move.l %d2,-(%sp)
	jsr isr_send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1103
	add.l %d4,sq+272
	addq.l #1,sq+372
	jra .L1098
.L1101:
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
	jra .L1099
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
	jne .L1125
	move.l pin+16,%d0
	move.l pin+12,%d1
	addq.l #1,pin+32
	move.l %d0,50(%sp)
	or.l 58(%sp),%d0
	or.l %d1,%d0
	jeq .L1125
	move.l pin+20,%a1
	tst.l %a1
	jne .L1127
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
.L1127:
	clr.b %d4
	clr.b %d5
	sub.l %a0,%a0
	clr.l %d3
	move.l pin+8,%d2
	clr.l %d6
	move.l pin+48,%a6
	move.b %d4,63(%sp)
	move.b %d5,62(%sp)
.L1141:
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
	jcs .L1128
	move.l 58(%sp),%d5
	move.l %a4,%d7
	btst %d7,%d5
	jeq .L1128
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
	jeq .L1129
	move.l #128,(%a3)
	move.l #128,(%a2)
	move.l %a1,4(%a3)
	move.l %a1,4(%a2)
	tst.l %a5
	jeq .L1130
	addq.l #1,pin+44
.L1130:
	moveq #1,%d0
	and.l 54(%sp),%d2
	move.b %d0,62(%sp)
.L1131:
	move.l 46(%sp),%a2
	add.l #-2147457816,%a2
	clr.l (%a2)
	cmp.l #32512,%d5
	jeq .L1146
	cmp.l #255,%d5
	jls .L1134
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
	jls .L1135
	mvz.w #65535,%d4
.L1135:
	mulu.w #32512,%d0
	move.w %d4,(%a3)
	divu.l %d5,%d0
	cmp.l #65535,%d0
	jls .L1136
	mvz.w #65535,%d0
.L1136:
	move.w %d0,(%a2)
.L1134:
	moveq #1,%d0
	move.w #32512,(%a0)
	addq.l #1,%a6
	move.b %d0,63(%sp)
.L1146:
	move.w #1,%a0
	jra .L1133
.L1129:
	tst.l %a5
	jeq .L1132
	moveq #127,%d0
	moveq #127,%d4
	move.l %d0,(%a3)
	move.l pin+28,%d0
	move.l %d4,(%a2)
	move.l %d0,4(%a3)
	move.l %d0,4(%a2)
	jra .L1131
.L1132:
	moveq #1,%d4
	move.l pin+24,%d7
	move.l #1073741951,(%a3)
	move.l #1073741951,(%a2)
	move.l %d7,4(%a3)
	or.l %d0,%d2
	move.l %d7,4(%a2)
	addq.l #1,pin+40
	move.b %d4,62(%sp)
	jra .L1131
.L1128:
	move.l 50(%sp),%d4
	and.l %d0,%d4
	tst.l %d4
	jeq .L1137
	move.l %d0,%d4
	not.l %d4
	and.l %d4,%d2
	moveq #1,%d4
	or.l %d0,%d1
	move.w #1,%a0
	move.b %d4,62(%sp)
.L1137:
	move.l %d1,%d4
	and.l %d0,%d4
	tst.l %d4
	jeq .L1133
	btst #6,(%a2)
	jeq .L1139
	not.l %d0
	and.l %d0,%d1
	jra .L1146
.L1139:
	move.l #128,(%a3)
	move.l #128,(%a2)
	move.l %a1,4(%a3)
	move.l %a1,4(%a2)
.L1133:
	addq.l #1,%d3
	moveq #8,%d5
	cmp.l %d3,%d5
	jne .L1141
	tst.b 63(%sp)
	jeq .L1142
	move.l %a6,pin+48
.L1142:
	tst.b 62(%sp)
	jeq .L1143
	move.l %d2,pin+8
.L1143:
	move.w %a0,%d7
	tst.b %d7
	jeq .L1144
	move.l %d1,pin+12
.L1144:
	tst.l %d6
	jeq .L1145
	addq.l #1,pin+36
.L1145:
	move.l -66650100,%d0
	move.l %d6,pin+16
	sub.l 68(%sp),%d0
	cmp.l pin+52.l,%d0
	jls .L1125
	move.l %d0,pin+52
.L1125:
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
	jcc .L1173
.L1175:
	clr.l %d1
.L1174:
	move.l %d1,16(%sp)
	move.l %a0,%d1
	mvz.b %d1,%d1
	clr.l 12(%sp)
	move.l %d0,4(%sp)
	move.l %d1,8(%sp)
	jra ed_queue
.L1173:
	mvz.w #4368,%d1
	btst %d0,%d1
	jeq .L1175
	mov3q.l #3,%d1
	and.l 12(%sp),%d1
	jra .L1174
	.size	ed_report, .-ed_report
	.align	2
	.globl	pm_menu_add
	.type	pm_menu_add, @function
pm_menu_add:
	link.w %fp,#-68
	move.l %a3,-(%sp)
	move.l %a2,-(%sp)
	tst.l 8(%fp)
	jeq .L1179
	lea (-64,%fp),%a2
	clr.l %d0
	move.l %a2,%a0
.L1181:
	clr.l 12(%a0)
	clr.l 8(%a0)
	clr.l (%a0)
	clr.l 4(%a0)
	addq.l #1,%d0
	lea (16,%a0),%a0
	mov3q.l #4,%d1
	cmp.l %d0,%d1
	jne .L1181
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
	jeq .L1179
	tst.l %a3
	jeq .L1179
	tst.l -32(%fp)
	jeq .L1179
	tst.l %d0
	jeq .L1179
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
.L1182:
	mvz.w -66(%fp),%d0
	lsl.l #4,%d0
	pea (%a2,%d0.l)
	jsr 1075251654
	subq.l #1,-68(%fp)
	addq.l #4,%sp
	mov3q.l #-1,%d0
	cmp.l -68(%fp),%d0
	jne .L1182
	addq.l #1,pm+4
.L1179:
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
	jcc .L1195
	addq.l #1,pm+24
	pea pm_t_track
.L1199:
	move.l %a0,-(%sp)
	jsr pm_popup
	addq.l #8,%sp
	rts
.L1195:
	mov3q.l #1,%d1
	cmp.l 1094562388.l,%d1
	jne .L1197
	move.l commits,%d1
	cmp.l pm+28.l,%d1
	jne .L1198
.L1197:
	addq.l #1,pm+20
	pea pm_t_none
	jra .L1199
.L1198:
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
	jeq .L1200
	move.l %d2,-(%sp)
	addq.l #1,cu+12
	jsr cu_src_setup
	addq.l #4,%sp
	move.l %d2,%d0
	mov3q.l #2,%d1
	add.l #-48,%d0
	cmp.l %d0,%d1
	jcc .L1202
	moveq #43,%d0
	cmp.l %d2,%d0
	jne .L1200
.L1202:
	moveq #11,%d1
	cmp.l 12(%sp),%d1
	jcs .L1200
	move.l #1075731444,%a0
	cmp.l sv+88.l,%a0
	jne .L1200
	lea (15,%sp),%a0
	mvz.b cu+30,%d0
	move.b (%a0),cu+10
	lea st+8,%a0
	move.b %d2,cu+9
	move.l (%a0),cu+16
	cmp.l 12(%sp),%d0
	jne .L1204
	move.b cu+28,%d0
.L1203:
	move.b %d0,cu+29
.L1200:
	move.l (%sp)+,%d2
	rts
.L1204:
	clr.b %d0
	jra .L1203
	.size	cu_prep, .-cu_prep
	.align	2
	.globl	cu_mi_settling
	.type	cu_mi_settling, @function
cu_mi_settling:
	mvz.b cu+11,%d1
	move.l 4(%sp),%d0
	addq.l #1,%d0
	cmp.l %d1,%d0
	jne .L1207
	move.l st+8,%d0
	moveq #15,%d1
	sub.l cu+24,%d0
	cmp.l %d0,%d1
	scc %d0
	mvs.b %d0,%d0
	neg.l %d0
.L1205:
	rts
.L1207:
	clr.l %d0
	jra .L1205
	.size	cu_mi_settling, .-cu_mi_settling
	.align	2
	.type	sv_flush, @function
sv_flush:
	link.w %fp,#-112
	movem.l #15420,(%sp)
	move.w #10497,%d4
	move.l #-260222380,%d3
	lea (-42,%fp),%a2
.L1209:
	move.b sv+4,%d0
	jne .L1214
	tst.b sv+102.l
	jeq .L1215
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
	jcc .L1216
	moveq #127,%d0
.L1216:
	move.b %d0,-61(%fp)
	clr.l %d0
	lea (-42,%fp),%a0
.L1217:
	lea -74(%fp,%d0.l),%a1
	addq.l #1,%d0
	moveq #14,%d1
	move.b (%a1),-1(%a0,%d0.l)
	cmp.l %d0,%d1
	jne .L1217
	moveq #-9,%d3
	pea 15.w
	move.l %a0,-(%sp)
	move.b %d3,-28(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1208
	clr.b %d4
	lea sv+100,%a0
	move.b (%a0),sv+101
	lea st+8,%a1
	move.l %d2,sv+104
	move.l (%a1),sv+108
	addq.l #1,sv+112
	move.b %d4,sv+102
.L1215:
	tst.b sv.l
	jeq .L1208
	mvz.b sv+1,%d0
	not.l %d0
	move.l %d0,-(%sp)
	jsr cu_steps
	addq.l #4,%sp
	tst.l %d0
	jne .L1208
	move.l sv+120,%d0
	cmp.l sv+116.l,%d0
	jeq .L1219
	moveq #1,%d1
	move.b %d1,sv+7
.L1219:
	lea (-74,%fp),%a3
	moveq #16,%d4
	lea sv,%a4
	clr.l %d3
	mov3q.l #-1,%d2
	move.l %d4,-80(%fp)
	move.l %a3,%a2
.L1224:
	mvz.b sv+1,%d0
	move.l sv+116,-(%sp)
	move.l %d3,-(%sp)
	move.l %d0,-(%sp)
	jsr sv_word
	lea (12,%sp),%sp
	move.b sv+7,%d4
	move.w %d0,(%a3)
	tst.b %d4
	jne .L1220
	mvz.w %d0,%d1
	mvz.w 24(%a4),%d5
	cmp.l %d1,%d5
	jeq .L1221
.L1220:
	cmp.l -80(%fp),%d3
	jge .L1222
	move.l %d3,-80(%fp)
.L1222:
	move.l %d3,%d2
.L1221:
	mov3q.l #7,%d1
	cmp.l %d3,%d1
	jge .L1223
	tst.w %d0
	jeq .L1223
	mvz.b sv+1,%d0
	move.l %d0,-(%sp)
	jsr cu_mi_settling
	addq.l #4,%sp
	tst.l %d0
	jne .L1208
.L1223:
	addq.l #2,%a3
	addq.l #1,%d3
	addq.l #2,%a4
	moveq #16,%d5
	cmp.l %d3,%d5
	jne .L1224
	tst.b %d4
	jne .L1235
	mov3q.l #-1,%d0
	cmp.l %d2,%d0
	jne .L1225
.L1208:
	movem.l -112(%fp),#15420
	unlk %fp
	rts
.L1214:
	clr.b %d1
	mov3q.l #2,%d2
	and.l %d0,%d2
	move.w %d4,-38(%fp)
	move.l %d3,-42(%fp)
	move.b %d1,-33(%fp)
	btst #1,%d0
	jeq .L1210
	lea sv+11,%a0
	move.b (%a0),-36(%fp)
	clr.b %d0
.L1211:
	move.b %d0,-35(%fp)
	moveq #-9,%d0
	pea 9.w
	move.l %a2,-(%sp)
	move.b %d0,-34(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1208
	move.b sv+4,%d0
	lsr.l #1,%d2
	addq.l #1,sv+64
	and.l %d0,%d2
	move.b %d2,sv+4
	jra .L1209
.L1210:
	lea sv+5,%a1
	move.b (%a1),-36(%fp)
	move.b sv+6,%d0
	jra .L1211
.L1235:
	clr.l -80(%fp)
	moveq #15,%d2
.L1225:
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
.L1226:
	cmp.l %d2,%d1
	jle .L1227
	cmp.l -80(%fp),%d0
	sge %d0
	move.l %d0,%d1
	neg.l %d1
	tst.b %d1
	jeq .L1228
	move.l %d2,%d1
	sub.l -80(%fp),%d1
	add.l %d1,%d1
	add.l #11,%d1
.L1229:
	moveq #-9,%d5
	neg.l %d0
	move.b %d5,-42(%fp,%d1.l)
	tst.b %d0
	jeq .L1230
	move.l %d2,%d0
	addq.l #6,%d0
	sub.l -80(%fp),%d0
	add.l %d0,%d0
.L1231:
	move.l %d0,-(%sp)
	pea -42(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1208
	lea sv+24,%a0
.L1232:
	cmp.l -80(%fp),%d2
	jge .L1233
	clr.b %d3
	move.l sv+116,%d0
	addq.l #1,sv+68
	move.b %d3,sv+7
	tst.l %d0
	jlt .L1234
	addq.l #1,sv+124
.L1234:
	move.l %d0,sv+120
	jra .L1208
.L1227:
	move.w (%a2,%d1.l*2),%d3
	addq.l #1,%d1
	addq.l #2,%a0
	move.l %d3,%d4
	lsr.l #7,%d4
	move.b %d4,-2(%a0)
	moveq #127,%d4
	and.l %d4,%d3
	move.b %d3,-1(%a0)
	jra .L1226
.L1228:
	moveq #9,%d1
	jra .L1229
.L1230:
	moveq #10,%d0
	jra .L1231
.L1233:
	move.l -80(%fp),%d1
	lea (%a2,%d1.l*2),%a1
	move.w (%a1),(%a0,%d1.l*2)
	addq.l #1,%d1
	move.l %d1,-80(%fp)
	jra .L1232
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
	jne .L1248
	move.l pmo+96,%d2
	cmp.l pmo+76.l,%d2
	jeq .L1249
.L1248:
	lea pmo+76,%a0
	move.l %d0,pmo+100
	move.l (%a0),pmo+96
	tst.l pmo
	jeq .L1249
	lea pmo+584,%a0
	clr.l %d0
.L1250:
	clr.l (%a0)+
	addq.l #1,%d0
	cmp.l #208,%d0
	jne .L1250
	lea pmo+3464,%a0
	clr.l %d0
.L1251:
	clr.b (%a0)
	addq.l #1,%d0
	lea (44,%a0),%a0
	cmp.l #128,%d0
	jne .L1251
	clr.l %d0
.L1252:
	move.l %d0,%d1
	add.l #36,%d1
	clr.l (%a2,%d1.l*4)
	moveq #13,%d1
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L1252
	clr.l pmo
	clr.l pmo+104
	clr.l pmo+9096
	clr.l pmo+300
	addq.l #1,pmo+32
.L1249:
	move.l pmo+56,%d7
	move.l pmo+88,%d2
	cmp.l pmo+68.l,%d2
	jne .L1253
	move.l pmo+92,%d3
	cmp.l pmo+72.l,%d3
	jeq .L1315
.L1253:
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
.L1254:
	moveq #65,%d6
	sub.l %a4,%a4
	clr.l %d4
	lea pmo_get,%a5
.L1255:
	move.l pmo+80,%d2
	cmp.l %d2,%d7
	jeq .L1271
	subq.l #1,%d6
	tst.l %d6
	jne .L1272
.L1271:
	tst.l %d4
	jeq .L1273
.L1259:
	move.l %a4,-(%sp)
	move.l %d4,-(%sp)
	jsr pmo_fade
	addq.l #8,%sp
	mov3q.l #1,%d5
.L1273:
	tst.l pmo
	jne .L1274
.L1305:
	move.l 56(%sp),-(%sp)
	jsr pmo_time
	addq.l #4,%sp
	movem.l (%sp),#31996
	lea (80,%sp),%sp
	rts
.L1315:
	clr.l %d5
	jra .L1254
.L1272:
	mvz.b %d2,%d2
	move.l %d2,%d3
	lsl.l #3,%d3
	lea (%a2,%d3.l),%a0
	mvz.b 1423(%a0),%d0
	cmp.l pmo+100.l,%d0
	jeq .L1256
	addq.l #1,pmo+8
.L1257:
	addq.l #1,pmo+80
	jra .L1255
.L1256:
	mvz.b 1418(%a0),%d0
	mov3q.l #6,%d1
	move.l %d0,%a1
	cmp.l %d0,%d1
	jne .L1258
	mvz.w 1420(%a0),%d0
	mvz.b 1419(%a0),%d2
	addq.l #1,pmo+28
	or.l %d0,%d4
	move.l %d2,%a4
	jra .L1257
.L1258:
	tst.l %d4
	jne .L1259
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
	jne .L1260
	mvz.w 1420(%a0),%d2
	moveq #18,%d0
	lsl.l %d0,%d2
	move.l %d2,%a0
	asr.l %d0,%d2
	tst.l %a0
	jne .L1261
	move.l %d1,%d0
	lsl.l #6,%d0
	lea (%a2,%d0.l),%a0
	add.l 52(%sp),%a0
	tst.b 584(%a0)
	jeq .L1257
.L1261:
	move.l 52(%sp),-(%sp)
	move.l %d1,-(%sp)
	jsr (%a5)
	addq.l #8,%sp
	move.l %d0,%a0
	tst.l %d0
	jne .L1263
	addq.l #1,pmo+16
	mov3q.l #4,pmo+120
	jra .L1257
.L1263:
	moveq #10,%d1
	lsl.l %d1,%d2
	move.l %d3,%a1
	add.l #pmo+1419,%a1
	move.b (%a1),%d0
	move.l %d2,12(%a0)
	tst.b %d0
	jne .L1264
	move.l %d2,4(%a0)
.L1265:
	move.b %d0,2(%a0)
	jra .L1257
.L1264:
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
	jra .L1265
.L1260:
	move.b 1422(%a0),%d0
	mvz.b %d0,%d2
	move.w %d0,%a1
	moveq #126,%d0
	move.l %d2,%a6
	cmp.l %d2,%d0
	jcs .L1316
	move.w %a1,%d2
	tst.b %d2
	jeq .L1267
	move.l %a6,%d0
	move.l #66052,%d2
	muls.l %d2,%d0
	move.l %d0,%a6
.L1266:
	move.l 52(%sp),-(%sp)
	move.l %d1,-(%sp)
	jsr (%a5)
	addq.l #8,%sp
	move.l %d0,%a0
	tst.l %d0
	jne .L1268
	addq.l #1,pmo+16
	mov3q.l #5,pmo+120
	jra .L1257
.L1267:
	move.l %d1,%d0
	lsl.l #6,%d0
	lea (%a2,%d0.l),%a0
	add.l 52(%sp),%a0
	tst.b 584(%a0)
	jeq .L1257
	sub.l %a6,%a6
	jra .L1266
.L1316:
	move.l #8388608,%a6
	jra .L1266
.L1268:
	move.l %d3,%a1
	add.l #pmo+1420,%a1
	mvz.w (%a1),%d1
	moveq #9,%d2
	lsl.l %d2,%d1
	move.l %d1,24(%a0)
	tst.l 28(%a0)
	jne .L1269
	tst.b 3(%a0)
	jne .L1269
	move.l %d1,16(%a0)
.L1269:
	move.l 60(%sp),%d2
	lsl.l #3,%d2
	move.b 1(%a2,%d2.l),%d1
	btst #6,%d1
	jne .L1317
	move.l %d3,%a1
	add.l #pmo+1419,%a1
	mvz.b (%a1),%d1
.L1270:
	move.l %d1,-(%sp)
	move.l %a6,-(%sp)
	move.l %a0,-(%sp)
	jsr pmo_mix
	lea (12,%sp),%sp
	jra .L1257
.L1317:
	clr.l %d1
	jra .L1270
.L1274:
	tst.l %d5
	jne .L1276
	move.l pmo+84,%d3
	cmp.l pmo+60.l,%d3
	jeq .L1276
	move.l (%a3),%d0
	sub.l pmo+60,%d0
	cmp.l #375,%d0
	jls .L1276
	lea pmo+60,%a0
	move.l (%a0),pmo+84
	pea 32.w
	pea 8191.w
	addq.l #1,pmo+12
	jsr pmo_fade
	addq.l #8,%sp
.L1276:
	tst.l -2147418904
	jeq .L1277
	lea pmo+512,%a0
	clr.l %d0
.L1278:
	clr.l (%a0)+
	moveq #18,%d1
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L1278
	move.l #-2147423060,%a0
.L1280:
	move.w (%a0),%d1
	mvz.w %d1,%d0
	cmp.l #571,%d0
	jhi .L1279
	moveq #31,%d3
	lsr.l #5,%d0
	and.l %d3,%d1
	mov3q.l #1,%d3
	add.l #128,%d0
	lsl.l %d1,%d3
	or.l %d3,(%a2,%d0.l*4)
.L1279:
	addq.l #2,%a0
	cmp.l #-2147422964,%a0
	jne .L1280
.L1277:
	move.l pmo+104,%a1
	clr.l %d2
	clr.l pmo+300
	lea pmo,%a4
	lea pmo+3464,%a0
.L1281:
	cmp.l %a1,%d2
	jne .L1295
	lea pmo+3464,%a0
	clr.b %d0
.L1298:
	tst.l %d2
	jne .L1296
	tst.b %d0
	jeq .L1297
	clr.l pmo+104
.L1297:
	move.l pmo+300,%d2
	move.l #-2147420170,%a2
	lea pmo,%a0
	clr.l %d1
	move.l #-2147457058,%a1
	jra .L1303
.L1295:
	move.b (%a0),%d1
	jeq .L1282
	move.b 2(%a0),%d0
	jeq .L1283
	subq.l #1,%d0
	move.b %d0,2(%a0)
	jeq .L1284
	move.l 8(%a0),%d4
	add.l %d4,4(%a0)
.L1283:
	move.b 3(%a0),%d0
	jeq .L1285
	subq.l #1,%d0
	move.b %d0,3(%a0)
	jeq .L1286
	move.l 20(%a0),%d5
	move.l 32(%a0),%d0
	add.l %d5,16(%a0)
	add.l %d0,28(%a0)
.L1285:
	move.b 1(%a0),%d4
	move.l 4(%a0),%d0
	mvz.b %d4,%d3
	tst.l %d0
	jne .L1287
	tst.b 2(%a0)
	jne .L1287
	tst.l 28(%a0)
	jne .L1287
	tst.b 3(%a0)
	jne .L1287
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
.L1282:
	addq.l #1,%d2
	lea (44,%a0),%a0
	jra .L1281
.L1284:
	move.l 12(%a0),4(%a0)
	jra .L1283
.L1286:
	move.l 24(%a0),16(%a0)
	move.l 36(%a0),28(%a0)
	jra .L1285
.L1287:
	moveq #8,%d5
	cmp.l %d3,%d5
	jcs .L1288
	move.l 40(%a0),%d1
	move.l %d1,%d3
	add.l %d3,%d3
	move.l 28(%a0),%d4
	move.l %d3,%a5
	add.l #-2147420300,%a5
	mvz.w (%a5),%d3
	tst.l %d4
	jeq .L1291
	tst.l -2147418904
	jeq .L1290
	move.l %d1,%d5
	lsr.l #5,%d5
	add.l #128,%d5
	move.l (%a2,%d5.l*4),%d6
	moveq #31,%d5
	and.l %d1,%d5
	btst %d5,%d6
	jeq .L1290
	addq.l #1,pmo+52
	move.l (%a3),pmo+108
.L1291:
	asr.l #8,%d0
	add.l %d3,%d0
	tst.l %d0
	jlt .L1318
	cmp.l #32767,%d0
	jgt .L1319
.L1292:
	move.w %d0,(%a5)
	jra .L1282
.L1290:
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
	jra .L1291
.L1318:
	clr.w %d0
	jra .L1292
.L1319:
	move.w #32767,%d0
	jra .L1292
.L1288:
	add.l #-48,%d4
	mvz.b %d4,%d4
	lsr.l #3,%d4
	jne .L1282
	mvz.b %d1,%d1
	move.l pmo+300,%d6
	asr.l #8,%d0
	move.l %d1,%d4
	subq.l #1,%d4
	btst %d4,%d6
	jne .L1293
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
.L1293:
	cmp.l #-32768,%d0
	jlt .L1320
	cmp.l #32767,%d0
	jgt .L1321
.L1294:
	lsl.l #3,%d4
	move.l %d4,%a6
	lea 104(%a6,%d3.l),%a5
	move.w %d0,(%a2,%a5.l*2)
	jra .L1282
.L1320:
	move.w #-32768,%d0
	jra .L1294
.L1321:
	move.w #32767,%d0
	jra .L1294
.L1322:
	moveq #1,%d0
	move.l %d1,%d2
	jra .L1298
.L1296:
	move.l %d2,%d1
	subq.l #1,%d1
	move.w %d1,%d3
	mulu.w #44,%d3
	tst.b (%a0,%d3.l)
	jeq .L1322
	tst.b %d0
	jeq .L1297
	move.l %d2,pmo+104
	jra .L1297
.L1304:
	btst #0,%d0
	jeq .L1300
	move.l %d1,%d3
	add.l #-536856241,%d3
	lsl.l #2,%d3
	mvz.w -26(%a1),%d0
	move.l %d3,%a3
	btst #3,3(%a3)
	jeq .L1323
	mvs.w (%a2),%d3
.L1301:
	move.l %d0,%a5
	add.l %d3,%a5
	move.l %a5,196(%a0)
	move.l %a5,%d0
	cmp.l #32767,%a5
	jle .L1302
	mvz.w #32767,%d0
.L1302:
	move.l %d0,196(%a0)
	mvs.w (%a1),%d0
	move.l %d0,248(%a0)
.L1300:
	addq.l #1,%d1
	addq.l #4,%a0
	addq.l #2,%a1
	lea (84,%a2),%a2
.L1303:
	move.l %d2,%d0
	lsr.l %d1,%d0
	jne .L1304
	tst.l %d2
	jeq .L1305
	lea pmo+9248,%a2
	clr.l %d5
	move.l #pmo+304,%d6
	lea pmo,%a6
.L1314:
	mov3q.l #1,%d1
	and.l %d2,%d1
	move.l %d1,64(%sp)
	btst #0,%d2
	jeq .L1306
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
.L1312:
	move.l %d4,%a5
	add.l #-2147423684,%a5
	lea (-32,%a1),%a3
	sub.l %a0,%a0
	move.l 48(%sp),52(%sp)
	move.l %a5,72(%sp)
.L1311:
	move.l 72(%sp),%a5
	move.l (%a5,%a0.l),%d1
	move.l 52(%sp),%a5
	addq.l #2,52(%sp)
	mvz.w %d1,%d1
	mvz.w (%a5)+,%d0
	move.l %d0,44(%sp)
	tst.l %d0
	jeq .L1307
	move.l %d1,%d0
	sub.l 68(%sp),%d0
	move.l %d0,60(%sp)
	subq.l #1,%d0
	move.l %d0,76(%sp)
	moveq #40,%d0
	cmp.l 76(%sp),%d0
	jcc .L1308
.L1307:
	move.l %d1,(%a1,%a0.l)
	move.l %d1,(%a3,%a0.l)
.L1309:
	addq.l #4,%a0
	moveq #16,%d1
	cmp.l %a0,%d1
	jne .L1311
	lea (16,%a1),%a1
	add.l #16,%d4
	addq.l #8,48(%sp)
	subq.l #1,%d7
	tst.l %d7
	jne .L1324
	move.b %d3,10064(%a6)
	btst #0,%d3
	jeq .L1313
	pea -16(%a2)
	move.l 196(%a4),-(%sp)
	jsr 1074912702
	addq.l #8,%sp
.L1313:
	btst #1,%d3
	jeq .L1306
	move.l %a2,-(%sp)
	move.l 248(%a4),-(%sp)
	jsr 1074912702
	addq.l #8,%sp
.L1306:
	lsr.l #1,%d2
	addq.l #4,%a4
	lea (64,%a2),%a2
	addq.l #1,%a6
	addq.l #2,%d5
	add.l #16,%d6
	tst.l %d2
	jne .L1314
	jra .L1305
.L1323:
	clr.l %d3
	jra .L1301
.L1324:
	move.l 64(%sp),%d7
	jra .L1312
.L1308:
	move.l 44(%sp),%d0
	swap %d0
	clr.w %d0
	or.l %d1,%d0
	move.l %d0,%a5
	moveq #8,%d0
	cmp.l 60(%sp),%d0
	jcs .L1310
	move.l %a5,(%a3,%a0.l)
	move.l %d1,(%a1,%a0.l)
	mov3q.l #1,%d0
.L1381:
	lsl.l %d7,%d0
	or.l %d0,%d3
	jra .L1309
.L1310:
	move.l %a5,(%a1,%a0.l)
	move.l %d1,(%a3,%a0.l)
	mov3q.l #4,%d0
	jra .L1381
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
	jeq .L1383
	move.w #12,%a6
	lea (44,%sp),%a2
	move.l %a2,%a0
.L1384:
	clr.l (%a0)+
	subq.l #1,%a6
	tst.l %a6
	jne .L1384
	move.l pmo+104,%d1
	clr.l %d5
	lea pmo,%a4
	lea pmo+3464,%a0
	move.l %d1,36(%sp)
.L1385:
	cmp.l 36(%sp),%d5
	jne .L1394
	move.l pmo+300,%d2
	tst.l %d2
	jeq .L1399
	lea pmo+9280,%a5
	move.l #pmo,%d3
.L1398:
	btst #0,%d2
	jeq .L1396
	move.b 10064(%a4),%d0
	move.w %d0,%ccr
	jne .L1397
	pea -16(%a5)
	move.l %d3,%a0
	move.l 196(%a0),-(%sp)
	jsr 1074912702
	addq.l #8,%sp
.L1397:
	move.b 10064(%a4),%d0
	move.w %d0,%ccr
	jpl .L1396
	move.l %a5,-(%sp)
	move.l %d3,%a1
	move.l 248(%a1),-(%sp)
	jsr 1074912702
	addq.l #8,%sp
.L1396:
	lsr.l #1,%d2
	addq.l #1,%a4
	addq.l #4,%d3
	lea (64,%a5),%a5
	tst.l %d2
	jne .L1398
.L1399:
	move.l %a6,%d0
	add.l #36,%d0
	move.l (%a2)+,(%a3,%d0.l*4)
	addq.l #1,%a6
	moveq #12,%d0
	cmp.l %a6,%d0
	jne .L1399
	mov3q.l #1,pmo+140
.L1400:
	move.l 40(%sp),-(%sp)
	jsr pmo_time
	addq.l #4,%sp
	move.l pmo+116,%d0
	cmp.l pmo+36.l,%d0
	jls .L1402
	move.l %d0,pmo+36
.L1402:
	movem.l (%sp),#31804
	add.l %d0,pmo+40
	addq.l #1,pmo+44
	lea (92,%sp),%sp
	rts
.L1394:
	move.b (%a0),%d1
	jeq .L1386
	mvz.b 1(%a0),%d0
	moveq #41,%d2
	cmp.l %d0,%d2
	jcs .L1387
	moveq #8,%d3
	cmp.l %d0,%d3
	jcc .L1386
	move.l 40(%a0),%d0
	move.l %d0,%d1
	add.l %d1,%d1
	move.l 28(%a0),%d3
	move.l %d1,%a5
	add.l #-2147420300,%a5
	mvz.w (%a5),%d2
	tst.l %d3
	jeq .L1390
	tst.l -2147418904
	jeq .L1389
	move.l %d0,%d1
	lsr.l #5,%d1
	add.l #128,%d1
	move.l (%a3,%d1.l*4),%d4
	moveq #31,%d1
	and.l %d0,%d1
	btst %d1,%d4
	jeq .L1389
	lea fp,%a1
	addq.l #1,pmo+52
	move.l (%a1),pmo+108
.L1390:
	move.l 4(%a0),%d0
	asr.l #8,%d0
	add.l %d2,%d0
	tst.l %d0
	jlt .L1403
	cmp.l #32767,%d0
	jgt .L1404
.L1391:
	move.w %d0,(%a5)
.L1386:
	addq.l #1,%d5
	lea (44,%a0),%a0
	jra .L1385
.L1389:
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
	jra .L1390
.L1403:
	clr.w %d0
	jra .L1391
.L1404:
	move.w #32767,%d0
	jra .L1391
.L1387:
	moveq #56,%d2
	cmp.l %d0,%d2
	jne .L1386
	move.l 4(%a0),%d0
	asr.l #8,%d0
	cmp.l #32767,%d0
	jle .L1392
	mvz.w #32767,%d0
.L1392:
	mvz.b %d1,%d1
	move.l 16(%a0),%d2
	subq.l #1,%d1
	and.l #8323072,%d2
	cmp.l #-32768,%d0
	jge .L1393
	mvs.w #-32768,%d0
.L1393:
	mvz.w %d0,%d0
	moveq #24,%d3
	or.l %d0,%d2
	mvs.w 28(%a0),%d0
	lsl.l %d3,%d0
	or.l %d0,%d2
	move.l %d2,44(%sp,%d1.l*4)
	jra .L1386
.L1383:
	tst.l pmo+140
	jeq .L1400
.L1401:
	move.l %d0,%d1
	add.l #36,%d1
	clr.l (%a3,%d1.l*4)
	moveq #12,%d1
	addq.l #1,%d0
	cmp.l %d0,%d1
	jne .L1401
	clr.l pmo+140
	jra .L1400
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
	jcs .L1435
	add.l #36,%d1
	lea pmo,%a0
	move.l (%a0,%d1.l*4),%a0
	tst.l %a0
	jeq .L1435
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
	jge .L1437
	moveq #127,%d0
.L1435:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	rts
.L1437:
	tst.l %d0
	jgt .L1435
	mov3q.l #1,%d0
	jra .L1435
	.size	pmo_vel, .-pmo_vel
	.align	2
	.globl	rui_tick
	.type	rui_tick, @function
rui_tick:
	link.w %fp,#-204
	move.l #1123449124,%a0
	move.l -66650100,%d1
	movem.l #15612,(%sp)
	lea fp,%a1
	move.l (%a0),fp+8
	move.l 8(%fp),%a2
	move.l (%a1),fp+4
	move.l %d1,-152(%fp)
	clr.l fp+12
.L1443:
	mov3q.l #1,%d0
	cmp.l fp+20.l,%d0
	jeq .L1443
.L1444:
	mov3q.l #2,%d1
	cmp.l fp+20.l,%d1
	jeq .L1445
	move.l 1100667228,%d0
	cmp.l #cu_text,%d0
	jeq .L1446
	cmp.l 1100664624.l,%d0
	jne .L1446
	move.l #cu_text,%d2
	move.l %d2,1100667228
.L1446:
	move.l #1075731444,%d3
	cmp.l sv+88.l,%d3
	jeq .L1447
	move.l #1093765506,%a1
	moveq #11,%d4
	mvz.b (%a1),%d0
	cmp.l %d0,%d4
	jcs .L1447
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
.L1447:
	tst.b cu.l
	jne .L1448
	move.l #1128813124,%d6
	cmp.l 1073849308.l,%d6
	jne .L1448
	moveq #1,%d7
	pea 52.w
	move.b %d7,cu
	jsr cu_src_setup
	addq.l #4,%sp
	lea cu_steps,%a0
	move.l %a0,1073849316
	lea cu_setup,%a1
	move.l %a1,1073849312
.L1448:
	move.l rx,%d2
	move.l #-66650100,%a3
	addq.l #1,st+8
	move.l (%a3),st+300
	tst.l st
	jne .L1449
	lea rui_sysex,%a4
	move.l %a4,1075551840
	move.l #1381321040,%a5
	move.l %a5,1075551836
	mov3q.l #1,st
	move.l %d2,st+16
.L1450:
	move.l #ux,%d5
	jra .L1618
.L1445:
	pea 10000.w
	jsr 1074367512
	addq.l #4,%sp
	jra .L1444
.L1449:
	tst.b host_close.l
	jeq .L1451
	clr.b %d0
	lea commits,%a0
	move.b %d0,host_close
	move.b %d0,host_open
	move.l (%a0),sv+12
	mov3q.l #1,-(%sp)
	move.l %a2,-(%sp)
	jsr leave
	addq.l #8,%sp
.L1451:
	tst.b host_open.l
	jeq .L1452
	clr.b %d0
	clr.l -(%sp)
	mov3q.l #1,-(%sp)
	move.l %a2,-(%sp)
	move.b %d0,host_open
	jsr enter
	lea (12,%sp),%sp
.L1452:
	move.l st+956,%d0
	mov3q.l #1,%d1
	cmp.l 1094562388.l,%d1
	jne .L1453
	cmp.l #65534,%d0
	jhi .L1454
	tst.l %d0
	jne .L1455
	moveq #50,%d3
	cmp.l st+8.l,%d3
	jcc .L1456
.L1455:
	addq.l #1,%d0
	move.l %d0,st+956
	moveq #10,%d4
	cmp.l %d0,%d4
	jne .L1454
.L1457:
	moveq #1,%d6
	move.w #4095,%d7
	move.l %d2,st+964
	mov3q.l #1,st+960
	move.b %d6,st+992
	move.b %d6,mr+13
	move.b %d6,mr+19
	move.w %d7,ar+60
	jsr sq_forget
	lea commits,%a0
	move.l (%a0),pm+28
.L1458:
	tst.b st+992.l
	jne .L1462
.L1463:
	tst.l splash_req
	jeq .L1465
	move.l splash_req,%d0
	clr.l splash_req
	tst.l st+4
	jne .L1466
	moveq #127,%d1
	and.l %d1,%d0
	tst.l %d0
	jeq .L1467
	tst.l commits
	jne .L1468
.L1466:
	addq.l #1,st+984
.L1465:
	tst.l st+4
	jeq .L1470
	cmp.l st+16.l,%d2
	jeq .L1471
	clr.l st+12
.L1472:
	move.l %d2,st+16
	clr.b %d1
	move.l st+8,%d3
	clr.l %d0
	lea st+408,%a0
.L1478:
	move.l (%a0)+,%a1
	tst.l %a1
	jeq .L1476
	move.l %d3,%d4
	sub.l %a1,%d4
	jmi .L1476
	moveq #1,%d1
	clr.l -4(%a0)
.L1476:
	addq.l #1,%d0
	moveq #16,%d5
	cmp.l %d0,%d5
	jne .L1478
	tst.b %d1
	jeq .L1479
	mov3q.l #1,st+344
.L1479:
	move.l %d2,-(%sp)
	move.l %a2,-(%sp)
	jsr sv_tick
	addq.l #8,%sp
	tst.b ls.l
	jeq .L1480
	tst.b sv.l
	jeq .L1481
	tst.b sv+8.l
	jeq .L1481
	tst.b sv+10.l
	jne .L1481
	move.l sv,%d0
	move.l ls,%d6
	eor.l %d6,%d0
	and.l #16776960,%d0
	or.l st+4,%d0
	jeq .L1480
.L1481:
	mov3q.l #5,-(%sp)
	jsr ls_close
	addq.l #4,%sp
.L1480:
	move.l ls_in_gen,%d7
	cmp.l ls+48.l,%d7
	jeq .L1482
	move.l ls_in_v,%d0
	lea ls_in_gen,%a1
	move.l ls+36,%a0
	move.l (%a1),ls+48
	tst.b ls.l
	jeq .L1482
	move.l %d0,%d1
	lsr.l #8,%d1
	mvz.b ls+1,%d2
	cmp.l %d1,%d2
	jne .L1482
	mov3q.l #1,%d1
	and.l %d1,%d0
	tst.l %a0
	jeq .L1483
	tst.l %d0
	jne .L1483
	clr.l st+124
.L1483:
	move.l %d0,ls+36
	mov3q.l #1,ls+40
.L1482:
	tst.l ls+36
	jeq .L1484
	tst.l ls+40
	jne .L1484
	move.l st+8,%d0
	moveq #20,%d2
	sub.l ls+44,%d0
	cmp.l %d0,%d2
	jcc .L1484
	clr.l ls+36
	addq.l #1,ls+56
	clr.l st+124
.L1484:
	move.l u46+8,%d0
	tst.l %d0
	jeq .L1485
	tst.b ls.l
	jne .L1486
	tst.l st+4
	jne .L1486
	move.l st+8,%d1
	moveq #20,%d3
	sub.l %d0,%d1
	cmp.l %d1,%d3
	jcs .L1486
	move.l #1093765506,%a1
	moveq #11,%d4
	mvz.b (%a1),%d0
	cmp.l %d0,%d4
	jcs .L1486
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
	jeq .L1487
.L1486:
	clr.l u46+8
.L1485:
	move.l pm,%d2
	tst.l %d2
	jeq .L1488
	clr.l pm
	add.l #31,%d2
	tst.b ls.l
	jeq .L1489
	mov3q.l #4,-(%sp)
	jsr ls_close
	addq.l #4,%sp
.L1489:
	clr.l st+1038
	tst.l st+4
	jeq .L1490
	moveq #1,%d7
	mvz.w #256,%d6
	moveq #1,%d0
	move.b %d2,st+993
	addq.l #1,pm+16
	move.l %d6,st+296
	move.b %d7,st+161
	move.w %d0,st+162
.L1491:
	tst.l st+1058
	jne .L1493
	tst.l sv+96
	jne .L1494
	move.l sv+88,-(%sp)
	jsr overlay
	addq.l #4,%sp
	tst.l %d0
	jeq .L1492
	lea st+8,%a0
	mov3q.l #1,st+1058
	mov3q.l #1,st+1062
	move.l (%a0),st+1066
	addq.l #1,st+1070
	addq.l #1,st+1090
.L1493:
	tst.l st+4
	jne .L1495
	clr.l st+1058
.L1496:
	tst.l st+972
	jne .L1500
	tst.b sv+8.l
	jne .L1500
.L1501:
	move.l st+1082,%d0
	tst.l %d0
	jeq .L1503
	sub.l st+8,%d0
	tst.l %d0
	jgt .L1504
	clr.l st+1082
.L1504:
	moveq #1,%d4
	move.b %d4,32(%a2)
.L1503:
	move.l sq_gen,%d0
	move.b 1093765506,%d2
	cmp.l sq+400.l,%d0
	jeq .L1505
	mov3q.l #1,%d1
	and.l %d0,%d1
	btst #0,%d0
	jne .L1505
	sub.l %a0,%a0
	lea sq_req,%a1
.L1506:
	lea (%a1,%a0.l),%a3
	mov3q.l #7,%d3
	lea (-140,%fp),%a2
	move.b (%a3),(%a2,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d3
	jne .L1506
	cmp.l sq_gen.l,%d0
	jne .L1505
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
	jeq .L1508
	move.l sq+4,%d1
.L1508:
	mvz.b -134(%fp),%d0
	mvz.b -135(%fp),%d4
	lsl.l #7,%d0
	or.l %d4,%d0
	and.l #4095,%d0
	or.l %d1,%d0
	move.l %d0,pin
	tst.l sq
	jeq .L1509
	btst #1,%d3
	jeq .L1510
.L1509:
	mvz.w #255,%d4
	mvz.w #8191,%d5
	addq.l #1,sq+452
	mov3q.l #1,ed+92
	move.l %d4,sq+404
	move.l %d5,ed+260
.L1510:
	mov3q.l #1,sq
.L1505:
	tst.l sq
	jne .L1511
	clr.l sq+408
.L1512:
	jsr led_tick
	move.l sq+468,%d2
	move.l pg_gen,%d0
	mvz.b ovp_on,%d3
	tst.l %d2
	jeq .L1562
	cmp.l sq+472.l,%d0
	jeq .L1563
	btst #0,%d0
	jne .L1563
	move.b pg_req,%d5
	move.b pg_req+1,%d4
	move.b pg_req+2,%d2
	move.b pg_req+3,%d1
	cmp.l pg_gen.l,%d0
	jne .L1563
	move.b %d5,sq+480
	move.b %d4,sq+481
	move.b %d2,sq+482
	move.b %d1,sq+483
	move.l %d0,sq+472
	mov3q.l #1,sq+476
.L1563:
	clr.l %d2
	clr.l %d0
	lea sq+480,%a0
.L1565:
	mvz.b (%a0,%d0.l),%d4
	moveq #111,%d5
	cmp.l %d4,%d5
	jcs .L1564
	mov3q.l #1,%d4
	lsl.l %d0,%d4
	or.l %d4,%d2
.L1564:
	addq.l #1,%d0
	mov3q.l #4,%d6
	cmp.l %d0,%d6
	jne .L1565
.L1562:
	cmp.l %d3,%d2
	jne .L1566
	tst.l sq+476
	jeq .L1567
.L1566:
	move.l #1100088672,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L1753
	addq.l #1,st+1018
.L1567:
	tst.l st+4
	jeq .L1754
	tst.l st+1058
	seq %d2
	mvs.b %d2,%d2
	neg.l %d2
.L1575:
	move.l st+8,%d0
	moveq #10,%d3
	divu.l %d3,%d0
	btst #0,%d0
	jeq .L1755
	clr.b %d3
.L1576:
	mvz.b k44+24,%d0
	cmp.l %d2,%d0
	jne .L1577
	tst.l %d2
	jeq .L1578
	mvz.b k44+25,%d1
	mvz.b %d3,%d0
	cmp.l %d1,%d0
	jeq .L1578
.L1577:
	move.l #1100088672,-(%sp)
	jsr 1073746332
	addq.l #4,%sp
	tst.l %d0
	jne .L1579
	addq.l #1,st+1018
.L1578:
	jsr flush
	move.b pc+79,%d2
	move.l pc_seq,%d1
	lea pc,%a2
	tst.b %d2
	jne .L1582
	btst #0,%d1
	jne .L1583
	cmp.l pc+72.l,%d1
	jeq .L1583
	clr.l %d0
	lea pc_req,%a0
	lea (-140,%fp),%a3
.L1584:
	lea (%a0,%d0.l),%a1
	mov3q.l #6,%d3
	move.b (%a1),(%a3,%d0.l)
	addq.l #1,%d0
	cmp.l %d0,%d3
	jne .L1584
	cmp.l pc_seq.l,%d1
	jne .L1583
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
	jlt .L1586
	jsr 1075320104
	move.l %d0,-(%sp)
	jsr 1073963888
	addq.l #4,%sp
	tst.l %d0
	jne .L1587
.L1586:
	moveq #3,%d2
.L1588:
	move.b %d2,pc+78
	mvz.b %d2,%d2
	moveq #1,%d1
	move.b %d4,pc+76
	add.l #42,%d2
	move.w (%a2,%d2.l*2),%d0
	move.b %d1,pc+79
	addq.l #1,%d0
	move.w %d0,(%a2,%d2.l*2)
.L1582:
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
	jeq .L1583
	move.w pc+92,%d0
	clr.b %d1
	addq.l #1,%d0
	move.b %d1,pc+79
	move.w %d0,pc+92
.L1583:
	move.b st+992,%d0
	move.b st+161,%d1
	or.l %d1,%d0
	tst.b %d0
	jne .L1603
	lea (-140,%fp),%a2
	sub.l %a1,%a1
	lea mr,%a4
	clr.l %d1
	move.l %a2,%a5
	move.l %a2,%d3
	move.l %a4,%a3
.L1605:
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
	jeq .L1604
	addq.l #1,%d1
.L1604:
	lea (152,%a1),%a1
	cmp.l #1824,%a1
	jne .L1605
	tst.b mr+12.l
	jne .L1606
	sub.l %a0,%a0
.L1607:
	lea (%a2,%a0.l),%a1
	moveq #12,%d0
	move.b (%a1),(%a3,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d0
	jne .L1607
	moveq #127,%d0
	and.l -2147457096,%d0
	moveq #1,%d1
	move.b %d0,mr+18
	move.b %d1,mr+12
.L1608:
	jsr sv_flush
	jsr arp_tick
.L1603:
	tst.l st
	jne .L1450
.L1615:
	mvz.b cu+9,%d2
	tst.l %d2
	jeq .L1643
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
	jeq .L1644
	move.l st+8,%d0
	mov3q.l #4,%d3
	sub.l cu+16,%d0
	cmp.l %d0,%d3
	jcc .L1643
.L1648:
	clr.b %d4
	move.b %d4,cu+9
.L1643:
	tst.l st
	jeq .L1649
	mov3q.l #1,%d0
	cmp.l 1094562388.l,%d0
	jne .L1650
	tst.l st+968
	jeq .L1650
	move.l dp,%d0
	move.b 1093765506,%d2
	tst.l %d0
	jeq .L1651
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
	jeq .L1653
	clr.l dp
.L1651:
	tst.b k44+20.l
	jeq .L1654
	move.l k44+20,%d0
	and.l #16776960,%d0
	tst.l %d0
	jne .L1654
	tst.l st+4
	jeq .L1655
	tst.l st+1058
	jne .L1654
.L1655:
	move.l st+8,%d0
	sub.l k44,%d0
	lsr.l #3,%d0
	jeq .L1654
	move.l sv+88,-(%sp)
	jsr overlay
	addq.l #4,%sp
	or.l ov_list,%d0
	jne .L1654
	tst.l st+4
	sne %d0
	move.w #257,%d7
	neg.l %d0
	move.b %d0,k44+26
	move.w %d7,k44+22
.L1654:
	move.b k44+23,%d0
	jeq .L1656
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
	jeq .L1653
	mvz.b k44+23,%d0
	tst.b k44+26.l
	jeq .L1659
	mov3q.l #1,%d4
	cmp.l %d0,%d4
	jne .L1660
	addq.l #1,k44+28
.L1661:
	clr.b %d0
	move.b %d0,k44+23
.L1656:
	mvz.b %d2,%d1
	moveq #11,%d3
	cmp.l %d1,%d3
	jcs .L1653
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
	jeq .L1664
	clr.b %d6
	move.l %d0,dp+8
	move.b %d6,dp+22
.L1665:
	moveq #52,%d7
	cmp.l %d5,%d7
	jcs .L1760
	move.b %d3,%d0
	move.l #1075572644,%a0
	ext.w %d0
	mvz.w %d0,%d0
	lsl.l #3,%d0
	move.l (%a0,%d0.l),%a0
.L1667:
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
	jeq .L1761
	move.l %a0,%d0
	add.l #-1073741824,%d0
	cmp.l #67108863,%d0
	sls %d0
	mvs.b %d0,%d0
	neg.l %d0
.L1668:
	clr.l %d1
	lea (-140,%fp),%a1
.L1670:
	tst.l %d0
	jeq .L2073
	move.b (%a0,%d1.l),%d6
	move.l %d6,%d7
	subq.l #1,%d7
	mvz.b %d7,%d7
	move.l %d7,%a2
	moveq #125,%d7
	cmp.l %a2,%d7
	jcs .L1763
.L1669:
	move.b %d6,9(%a1,%d1.l)
	addq.l #1,%d1
	moveq #12,%d6
	cmp.l %d1,%d6
	jne .L1670
	moveq #-9,%d7
	pea 22.w
	move.l %a1,-(%sp)
	move.b %d7,-119(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1653
	move.w #257,%a0
	move.b %d2,dp+20
	move.b %d3,dp+21
	addq.l #1,dp+12
	move.w %a0,dp+22
	jra .L1666
.L1456:
	move.l st+4,%d0
	tst.l %d0
	jeq .L1454
	moveq #10,%d5
	move.l %d5,st+956
	jra .L1457
.L1454:
	move.l st+960,%d3
	move.l %d3,%d1
	subq.l #1,%d1
	lsr.l #1,%d1
	jne .L1458
	moveq #20,%d1
	moveq #20,%d5
	muls.l %d3,%d1
	cmp.l %d1,%d5
	seq %d1
	neg.l %d1
	tst.b %d1
	jeq .L1459
	moveq #30,%d1
.L1460:
	cmp.l %d1,%d0
	jne .L1458
	cmp.l st+964.l,%d2
	jne .L1461
	moveq #1,%d6
	move.w #4095,%d7
	addq.l #1,%d3
	move.l %d3,st+960
	move.b %d6,st+992
	move.b %d6,mr+13
	move.b %d6,mr+19
	move.w %d7,ar+60
.L1462:
	tst.b sv.l
	jeq .L1463
	moveq #1,%d0
	move.b sv+10,%d1
	move.b %d0,sv+4
	move.b sv+1,%d0
	or.l %d1,%d0
	move.w #257,%d1
	move.b %d0,sv+5
	move.w %d1,sv+6
	jra .L1463
.L1459:
	moveq #50,%d1
	jra .L1460
.L1461:
	mov3q.l #3,st+960
	jra .L1458
.L1453:
	tst.l %d0
	jeq .L1464
	addq.l #1,pmo+72
.L1464:
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
	jeq .L1463
	jsr sq_forget
	jra .L1463
.L1467:
	mov3q.l #2,-(%sp)
	move.l %a2,-(%sp)
	jsr splash_end
	addq.l #8,%sp
	jra .L1465
.L1468:
	tst.l st+972
	jne .L1469
	mov3q.l #1,st+972
	addq.l #1,st+980
	mov3q.l #-1,st+20
	clr.l st+12
	mov3q.l #1,st+344
.L1469:
	move.l %d0,st+976
.L1470:
	tst.l st+972
	jeq .L1472
	cmp.l st+16.l,%d2
	jeq .L1473
	clr.l st+12
.L1474:
	move.l st+976,%d0
	subq.l #1,%d0
	move.l %d0,st+976
	tst.l %d0
	jne .L1472
	mov3q.l #1,-(%sp)
	jra .L2070
.L1471:
	move.l st+12,%d0
	addq.l #1,%d0
	move.l %d0,st+12
	moveq #19,%d3
	cmp.l %d0,%d3
	jcc .L1472
	mov3q.l #2,-(%sp)
	move.l %a2,-(%sp)
	jsr leave
	clr.l mask_set
.L2069:
	addq.l #8,%sp
	jra .L1472
.L1473:
	move.l st+12,%d0
	addq.l #1,%d0
	move.l %d0,st+12
	moveq #19,%d4
	cmp.l %d0,%d4
	jcc .L1474
	mov3q.l #3,-(%sp)
.L2070:
	move.l %a2,-(%sp)
	jsr splash_end
	jra .L2069
.L1487:
	tst.b sv.l
	jeq .L1485
	tst.b sv+8.l
	jeq .L1485
	tst.b sv+10.l
	jne .L1485
	mvz.b sv+1,%d2
	mvz.b (%a1),%d1
	cmp.l %d2,%d1
	jne .L1485
	mvz.b sv+2,%d1
	cmp.l %d0,%d1
	jne .L1485
	clr.l -(%sp)
	clr.l -(%sp)
	jsr ls_enc
	addq.l #8,%sp
	tst.l %d0
	jeq .L1485
	clr.l u46+8
	addq.l #1,u46+28
	jra .L1485
.L1490:
	mvz.b %d2,%d2
	move.l %d2,-(%sp)
	clr.l -(%sp)
	move.l %a2,-(%sp)
	jsr enter
	lea (12,%sp),%sp
	addq.l #1,pm+12
.L1488:
	tst.l st+4
	jne .L1491
.L1492:
	tst.l st+1058
	jne .L1493
.L1494:
	tst.l st+4
	jeq .L1496
.L1500:
	tst.l st+1058
	jne .L1501
	move.l commits,%d2
	cmp.l st+20.l,%d2
	jne .L1502
	tst.l st+344
	jeq .L1501
.L1502:
	moveq #1,%d3
	move.b %d3,32(%a2)
	jra .L1501
.L1495:
	move.l sv+88,%d0
	cmp.l #1075650164,%d0
	jeq .L1497
	move.l %d0,-(%sp)
	jsr overlay
	addq.l #4,%sp
	tst.l %d0
	jeq .L1498
.L1497:
	mov3q.l #1,st+1062
	jra .L1494
.L1498:
	tst.l st+1062
	jne .L1499
	move.l st+8,%d0
	moveq #20,%d1
	sub.l st+1066,%d0
	cmp.l %d0,%d1
	jcc .L1494
.L1499:
	clr.l st+1058
	mov3q.l #-1,st+20
	mov3q.l #1,st+344
	jra .L1494
.L1511:
	mvz.b %d2,%d2
	lea sq_grid,%a2
	moveq #11,%d6
	cmp.l %d2,%d6
	jcs .L1513
	move.l sq+4,%d0
	btst %d2,%d0
	jne .L1514
.L1513:
	clr.l %d0
.L1515:
	cmp.l sq+408.l,%d0
	jne .L1516
	tst.l %d0
	jeq .L1517
	cmp.l sq+412.l,%d2
	jeq .L1517
.L1516:
	mov3q.l #1,%d7
	or.l %d7,sq+404
	move.l %d0,sq+408
	move.l %d2,sq+412
.L1517:
	move.b 1093615249,%d0
	move.b 1093615250,%d2
	moveq #127,%d3
	move.b 1079807236,%d1
	and.l %d3,%d1
	move.l sq+360,%d3
	btst #8,%d3
	jeq .L1518
	move.l %d1,%d0
	moveq #127,%d1
	and.l %d3,%d1
.L1519:
	cmp.l %d0,%d1
	jeq .L1747
.L1520:
	cmp.l sq+420.l,%d1
	jne .L1521
	cmp.l sq+424.l,%d0
	jeq .L1522
.L1521:
	mov3q.l #4,%d5
	or.l %d5,sq+404
	move.l %d1,sq+420
	move.l %d0,sq+424
.L1522:
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
	jne .L1523
	cmp.l sq+432.l,%d0
	jeq .L1524
.L1523:
	moveq #16,%d6
	or.l %d6,sq+404
	move.l %d2,sq+428
	move.l %d0,sq+432
.L1524:
	move.l 1076395164,%d0
	and.l #2097151,%d0
	cmp.l sq+436.l,%d0
	jeq .L1525
	moveq #32,%d7
	or.l %d7,sq+404
	move.l %d0,sq+436
.L1525:
	move.b 1081877443,%d0
	mvz.b 1081877444,%d1
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d1,%d0
	and.l #8191,%d0
	cmp.l sq+440.l,%d0
	jeq .L1526
	move.l %d0,sq+440
	moveq #8,%d0
	or.l %d0,sq+404
.L1526:
	move.b 1081877445,%d0
	mvz.b 1081877446,%d1
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d1,%d0
	and.l #8191,%d0
	cmp.l sq+552.l,%d0
	jeq .L1527
	mvz.w #128,%d1
	move.l %d0,sq+552
	or.l %d1,sq+404
.L1527:
	mov3q.l #1,%d3
	move.l 1079807120,%d2
	cmp.l %d2,%d3
	jne .L1528
	move.l st+8,%d0
	moveq #19,%d4
	sub.l sq+444,%d0
	cmp.l %d0,%d4
	jcc .L1528
	moveq #64,%d5
	or.l %d5,sq+404
.L1528:
	move.l sq+404,%d0
	btst #0,%d0
	jeq .L1529
	move.l sq+408,%d0
	move.b %d0,-140(%fp)
	tst.l %d0
	jeq .L1748
	move.b sq+415,%d0
.L1530:
	mov3q.l #2,-(%sp)
	pea -140(%fp)
	pea 8.w
	move.b %d0,-139(%fp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1512
	moveq #-2,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1529:
	btst #1,%d0
	jeq .L1531
	mov3q.l #2,%d6
	cmp.l %d2,%d6
	jcc .L1749
	clr.l %d0
.L1532:
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
	jeq .L1512
	moveq #-3,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1531:
	move.w %d0,%ccr
	jne .L1533
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
	jeq .L1512
	moveq #-5,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1533:
	move.w %d0,%ccr
	jpl .L1534
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
	jeq .L1512
	moveq #-9,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1534:
	tst.b %d0
	jpl .L1535
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
	jeq .L1512
	move.l sq+404,%d0
	bclr #7,%d0
	move.l %d0,sq+404
.L1535:
	btst #4,%d0
	jeq .L1536
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
	jeq .L1512
	moveq #-17,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1536:
	btst #5,%d0
	jeq .L1537
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
	jeq .L1512
	moveq #-33,%d0
	and.l sq+404,%d0
	move.l %d0,sq+404
.L1537:
	btst #6,%d0
	jeq .L1538
	move.l 1100784300,-(%sp)
	move.l %fp,%d3
	add.l #-140,%d3
	move.l %d3,-(%sp)
	jsr blk4
	addq.l #8,%sp
	mov3q.l #2,%d5
	cmp.l %d2,%d5
	jcc .L1539
	clr.l %d2
.L1539:
	move.b %d2,-136(%fp)
	moveq #127,%d6
	move.w 1079807124,%d0
	subq.l #1,%d0
	and.l %d6,%d0
	move.b %d0,-135(%fp)
	move.l sq+380,%d0
	cmp.l %d0,%d6
	jcc .L1540
	moveq #127,%d0
.L1540:
	mov3q.l #7,-(%sp)
	move.l %d3,-(%sp)
	pea 9.w
	move.b %d0,-134(%fp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1512
	moveq #-65,%d7
	and.l %d7,sq+404
	lea st+8,%a0
	move.l (%a0),sq+444
.L1538:
	move.l sq+360,%d0
	btst #8,%d0
	jeq .L1541
	moveq #127,%d1
	and.l %d1,%d0
.L1542:
	move.l #85760,%d3
	clr.l %d1
	muls.l %d3,%d0
	move.l ed+96,%d4
	move.l #85685,%d7
	lea ed,%a3
	lea ed+100,%a1
	move.l %d4,-156(%fp)
	move.l #85686,%a5
	move.l %a3,%a4
	move.l %d0,%a2
	move.l %d0,%a0
	add.l #1081989347,%a2
	add.l #1081990056,%a0
.L1548:
	move.l #85689,%d5
	moveq #12,%d0
	mvz.b (%a2,%d5.l),%d4
	cmp.l %d1,%d0
	jeq .L1543
	mvz.b (%a0),%d0
	move.b 2(%a0),%d3
.L1544:
	mvz.b %d3,%d3
	cmp.l (%a1),%d0
	jne .L1545
	cmp.l 52(%a1),%d3
	jne .L1545
	cmp.l 104(%a1),%d4
	jne .L1545
	moveq #12,%d2
	cmp.l %d1,%d2
	jne .L1546
	move.l #85685,%d2
	move.b (%a2,%d2.l),%d2
	move.l #85686,%d5
	mvz.b (%a2,%d5.l),%d5
	mvz.b %d2,%d2
	lsl.l #8,%d2
	or.l %d5,%d2
	cmp.l ed+256.l,%d2
	jeq .L1546
.L1545:
	move.l %d0,(%a1)
	moveq #12,%d0
	move.l %d3,52(%a1)
	move.l %d4,104(%a1)
	cmp.l %d1,%d0
	jne .L1547
	move.b (%a2,%d7.l),%d0
	mvz.b (%a2,%a5.l),%d2
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d2,%d0
	move.l %d0,ed+256
.L1547:
	tst.l -156(%fp)
	jeq .L1546
	mov3q.l #1,%d0
	lsl.l %d1,%d0
	or.l %d0,ed+260
.L1546:
	addq.l #1,%d1
	addq.l #4,%a1
	lea (917,%a0),%a0
	moveq #13,%d2
	cmp.l %d1,%d2
	jne .L1548
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
	jeq .L1549
	move.l %d1,ed+272
	clr.l ed+268
	clr.l ed+372
.L1549:
	move.l ed+268,%d2
	move.l %d2,%d3
	addq.l #1,%d3
	move.l %d3,%d1
	moveq #10,%d4
	lsl.l %d4,%d1
	cmp.l %d0,%d1
	jls .L1750
	move.l %d2,%d1
	move.l %d0,%d5
	lsl.l %d4,%d1
	sub.l %d1,%d5
.L1550:
	move.l %d2,%d1
	moveq #12,%d6
	lsl.l %d6,%d1
	clr.l %d4
	add.l %d1,%a1
	clr.l %d1
.L1551:
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
	jne .L1551
	move.l ed+372,%d4
	move.l %d2,%a0
	lea (69,%a0),%a0
	btst %d2,%d4
	jeq .L1552
	cmp.l (%a4,%a0.l*4),%d1
	jeq .L1552
	mov3q.l #1,ed+376
.L1552:
	move.l %d1,(%a4,%a0.l*4)
	mov3q.l #1,%d1
	add.l #1023,%d0
	lsl.l %d2,%d1
	or.l %d4,%d1
	move.l %d1,ed+372
	moveq #10,%d1
	lsr.l %d1,%d0
	cmp.l %d3,%d0
	jhi .L1553
	clr.l %d3
.L1553:
	move.l %d3,ed+268
	move.l %fp,%d3
	clr.l %d2
	add.l #-148,%d3
.L1558:
	move.l ed+260,%d0
	btst %d2,%d0
	jeq .L1554
	moveq #12,%d5
	cmp.l %d2,%d5
	jne .L1751
	moveq #127,%d0
.L1555:
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
	jeq .L1752
	mov3q.l #5,%d0
.L1556:
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	mov3q.l #4,-(%sp)
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1512
	mov3q.l #1,%d0
	lsl.l %d2,%d0
	addq.l #1,ed+264
	not.l %d0
	and.l %d0,ed+260
.L1554:
	addq.l #1,%d2
	addq.l #4,%a3
	moveq #13,%d1
	cmp.l %d2,%d1
	jne .L1558
.L1559:
	move.l ed+68,%d0
	cmp.l ed+64.l,%d0
	jne .L1560
	tst.l ed+92
	jeq .L1561
	lea ed+91,%a0
	move.b (%a0),-148(%fp)
	mov3q.l #1,-(%sp)
	pea -148(%fp)
	pea 12.w
	jsr sq_send2
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1512
	clr.l ed+92
.L1561:
	tst.l ed+376
	jeq .L1512
	move.l st+8,%d0
	sub.l ed+380,%d0
	lsr.l #2,%d0
	jeq .L1512
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
	jeq .L1512
	lea st+8,%a0
	clr.l ed+376
	move.l (%a0),ed+380
	addq.l #1,ed+384
	jra .L1512
.L1514:
	jsr (%a2)
	jra .L1515
.L1518:
	mvz.b %d0,%d0
	mvz.b %d2,%d2
	moveq #127,%d4
	lsl.l #8,%d0
	or.l %d2,%d0
	cmp.l %d0,%d4
	jge .L1519
.L1747:
	moveq #127,%d0
	jra .L1520
.L1748:
	moveq #127,%d0
	jra .L1530
.L1749:
	move.l %d2,%d0
	jra .L1532
.L1541:
	move.b 1079807236,%d0
	moveq #127,%d2
	and.l %d2,%d0
	jra .L1542
.L1543:
	move.l #85683,%d2
	move.b (%a2,%d2.l),%d0
	move.l #85684,%d3
	move.l #85690,%d5
	mvz.b (%a2,%d3.l),%d2
	move.b (%a2,%d5.l),%d3
	mvz.b %d0,%d0
	lsl.l #8,%d0
	or.l %d2,%d0
	jra .L1544
.L1750:
	mvz.w #1024,%d5
	jra .L1550
.L1751:
	move.l %d2,%d0
	jra .L1555
.L1752:
	mov3q.l #7,%d0
	jra .L1556
.L1560:
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
	jeq .L1512
	addq.l #1,ed+68
	addq.l #1,ed+76
	jra .L1559
.L1753:
	clr.l %d0
	lea sq+480,%a0
	lea ovp_col,%a1
.L1568:
	btst %d0,%d2
	jeq .L1569
	lea (%a0,%d0.l),%a2
	move.b (%a2),(%a1,%d0.l)
.L1569:
	addq.l #1,%d0
	mov3q.l #4,%d1
	cmp.l %d0,%d1
	jne .L1568
	move.l %d3,%d4
	clr.l %d3
	move.b %d2,ovp_on
	or.l %d2,%d4
	lea shp,%a2
	lea sq+480,%a4
	lea (-140,%fp),%a3
	lea rui_uart_raw,%a5
.L1574:
	btst %d3,%d4
	jeq .L1570
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
.L1573:
	tst.l %d0
	jeq .L1571
	move.b (%a4,%d3.l),%d1
.L1572:
	move.b %d1,2(%a3,%a0.l)
	addq.l #1,%a0
	mov3q.l #4,%d7
	cmp.l %a0,%d7
	jne .L1573
	move.l %a3,-(%sp)
	mov3q.l #6,-(%sp)
	jsr (%a5)
	addq.l #8,%sp
.L1570:
	addq.l #1,%d3
	addq.l #4,%a2
	mov3q.l #4,%d0
	cmp.l %d3,%d0
	jne .L1574
	move.l #1100088672,-(%sp)
	jsr 1073746414
	clr.l sq+476
	addq.l #4,%sp
	jra .L1567
.L1571:
	move.b (%a2,%a0.l),%d1
	jra .L1572
.L1754:
	clr.l %d2
	jra .L1575
.L1755:
	moveq #111,%d3
	jra .L1576
.L1579:
	move.b %d3,ovt_col
	move.b %d2,%d4
	move.b %d2,ovt_on
	lea led_send4,%a0
	tst.l %d2
	jeq .L1580
	move.b %d3,-137(%fp)
	move.b %d3,-138(%fp)
	move.b %d3,-139(%fp)
	move.b %d3,-140(%fp)
	pea -140(%fp)
	pea 55.w
	jsr (%a0)
	addq.l #1,k44+12
.L2071:
	addq.l #4,%sp
	move.l #1100088672,(%sp)
	jsr 1073746414
	addq.l #4,%sp
	move.b %d4,k44+24
	move.b %d3,k44+25
	jra .L1578
.L1580:
	pea sht
	pea 55.w
	jsr (%a0)
	addq.l #1,k44+16
	jra .L2071
.L1587:
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
	jeq .L1586
	tst.b 60(%a2,%d3.l)
	jeq .L1589
	move.l st+8,%d0
	moveq #20,%d1
	sub.l (%a2,%d3.l*4),%d0
	cmp.l %d0,%d1
	jcc .L1590
.L1589:
	moveq #1,%d2
	jra .L1588
.L1590:
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
	jeq .L1586
	move.l (%a5),%a0
	move.l %a5,-(%sp)
	move.l 40(%a0),%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l 32(%a5),%d1
	move.l %d0,%d3
	tst.l %d1
	jeq .L1591
	move.l %d1,%d5
	move.l %d1,%a0
	add.l #4752,%d5
	clr.l %d0
.L1595:
	mvz.b (%a0),%d7
	cmp.l #255,%d7
	jeq .L1593
	mvz.b 1(%a0),%d7
	cmp.l #255,%d7
	jeq .L1593
	addq.l #1,%d0
.L1593:
	lea (66,%a0),%a0
	cmp.l %d5,%a0
	jne .L1595
	mulu.w #5674,%d6
	move.l %d3,%a5
	move.l #1075599904,%a1
	add.l %d6,%a5
	mvz.b %d4,%d6
	move.l %d6,-160(%fp)
.L1600:
	mvz.b 3(%a1),%d7
	move.l %d1,%a0
.L1598:
	mvz.b (%a0),%d6
	cmp.l %d6,%d7
	jne .L1596
	mvz.b 1(%a0),%d6
	cmp.l -160(%fp),%d6
	jeq .L1597
.L1596:
	lea (66,%a0),%a0
	cmp.l %d5,%a0
	jne .L1598
	tst.b 5653(%a5)
	jne .L1744
	mov3q.l #1,%a0
	jra .L1745
.L1744:
	mov3q.l #2,%a0
.L1745:
	add.l %a0,%d0
	moveq #71,%d7
	cmp.l %d0,%d7
	jlt .L1756
.L1597:
	addq.l #4,%a1
	addq.l #1,%a5
	cmp.l #1075599920,%a1
	jne .L1600
.L1591:
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
.L1601:
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
	jne .L1601
	jra .L1588
.L1756:
	moveq #2,%d2
	jra .L1588
.L1606:
	mov3q.l #1,%d2
	cmp.l %d1,%d2
	jge .L1609
	moveq #1,%d3
	move.b %d3,mr+13
.L1610:
	move.l %a2,-(%sp)
	pea 12.w
	clr.l -(%sp)
	jsr mr_send
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1603
	sub.l %a0,%a0
.L1613:
	lea (%a2,%a0.l),%a1
	moveq #12,%d0
	move.b (%a1),(%a3,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d0
	jne .L1613
	move.w mr+16,%d0
	clr.b %d1
	addq.l #1,%d0
	move.b %d1,mr+13
	move.w %d0,mr+16
.L2072:
	jsr kit_tick
	jra .L1608
.L1609:
	clr.l %d2
	tst.b mr+13.l
	jne .L1610
.L1611:
	mvz.b (%a3,%d2.l),%d0
	mvz.b (%a2)+,%d1
	cmp.l %d1,%d0
	jeq .L1614
	move.l %d3,-(%sp)
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	jsr mr_send
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1603
	lea (-1,%a2),%a0
	move.b (%a0),(%a3,%d2.l)
	move.w mr+14,%d0
	addq.l #1,%d0
	move.w %d0,mr+14
.L1614:
	addq.l #1,%d2
	moveq #12,%d0
	cmp.l %d2,%d0
	jne .L1611
	jra .L2072
.L1619:
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
	jeq .L1615
	move.l ux+3944,%d1
	mov3q.l #1,%d0
	lea ux+3920,%a0
.L1616:
	cmp.l %d0,%d1
	jhi .L1617
	subq.l #1,%d1
	move.l %d1,ux+3944
	addq.l #1,ux+32
.L1618:
	tst.l ux+3944
	jne .L1619
.L1620:
	move.l ux+3880,%d1
	cmp.l ux+3884.l,%d1
	jeq .L1615
	mov3q.l #7,%d2
	cmp.l ux+3944.l,%d2
	jcs .L1615
	mov3q.l #7,%d0
	and.l ux+3884,%d0
	lsl.l #2,%d0
	move.l %d0,%a2
	moveq #127,%d0
	and.l -2147457096,%d0
	add.l #ux+3888,%a2
	move.b (%a2),%d7
	move.b 1(%a2),%d6
	mulu.w #2531,%d0
	mvz.b %d7,%d3
	mvz.b %d6,%d1
	move.l %d0,%a0
	add.l #1092966773,%a0
	move.w %d3,%d0
	move.l %d1,%d4
	add.l #9,%d4
	mulu.w #152,%d0
	move.b (%a0,%d0.l),%d0
	mvz.b %d0,%d2
	move.w %d0,%a3
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	move.l %d1,-164(%fp)
	jsr 1073770536
	move.l %d2,%a5
	addq.l #8,%sp
	move.l ux+3884,%a0
	move.l -164(%fp),%a1
	move.l %d0,%a4
	tst.l %d0
	jle .L1758
	mvz.b 2(%a2),%d2
	mvz.b 3(%a2),%d0
	lsl.l #8,%d2
	add.l %d0,%d0
	or.l %d0,%d2
	mov3q.l #7,%d0
	cmp.l %a1,%d0
	jlt .L1622
	move.l %a3,%d0
	add.l #-46,%d0
	mvz.b %d0,%d0
	mov3q.l #4,%d1
	cmp.l %d0,%d1
	jcc .L1623
	moveq #52,%d0
	cmp.l %a5,%d0
	jne .L1624
.L1623:
	cmp.l 1075595760.l,%a5
	jne .L1625
.L1624:
	tst.l %a1
	jne .L1627
.L1628:
	move.l %a0,%d1
	mov3q.l #7,%d0
	and.l %d0,%d1
	move.l %d5,%a0
	add.l %d1,%a0
	move.b 3952(%a0),%d0
	btst #0,%d0
	jeq .L1627
	move.l ls+60,%d0
	or.l ls+64,%d0
	jeq .L1627
	cmp.l ls+68.l,%d3
	jne .L1627
	move.l st+8,%d0
	moveq #20,%d1
	sub.l ls+72,%d0
	cmp.l %d0,%d1
	jcs .L1627
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
	jeq .L1627
	move.l (%a5),%a0
	move.l %a5,-(%sp)
	move.l 40(%a0),%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l 32(%a5),%d0
	tst.l %d0
	jeq .L1629
	move.l %d0,%a0
	add.l #4753,%d0
	move.l %d0,-156(%fp)
	move.w %a3,%d0
	addq.l #1,%a0
	sub.l %a4,%a4
	sub.l %a1,%a1
	mvz.b %d0,%d0
	move.l %d0,%a3
.L1634:
	mvz.b -1(%a0),%d1
	cmp.l #255,%d1
	jeq .L1631
	mvz.b (%a0),%d0
	cmp.l #255,%d0
	jeq .L1631
	addq.l #1,%a1
.L1631:
	cmp.l %d1,%a3
	jne .L1633
	mvz.b (%a0),%d1
	move.l %a4,%d0
	cmp.l %d1,%d3
	seq %d1
	mvs.b %d1,%d1
	neg.l %d1
	or.l %d1,%d0
	move.l %d0,%a4
.L1633:
	lea (66,%a0),%a0
	cmp.l -156(%fp),%a0
	jne .L1634
	tst.l %a4
	jne .L1629
	moveq #69,%d1
	cmp.l %a1,%d1
	jge .L1629
	moveq #3,%d0
	addq.l #1,ux+3964
.L1621:
	addq.l #1,ux+24
	jra .L1641
.L1617:
	addq.l #3,%a0
	move.b (%a0),-3(%a0)
	move.b 1(%a0),-2(%a0)
	move.b 2(%a0),-1(%a0)
	addq.l #1,%d0
	jra .L1616
.L1622:
	move.l %a5,%d0
	mov3q.l #2,%d1
	add.l #-48,%d0
	cmp.l %d0,%d1
	jcs .L1626
	mvz.b cu+1,%d0
	cmp.l %a5,%d0
	jne .L1625
.L1627:
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
	jra .L1641
.L1626:
	moveq #10,%d0
	cmp.l %a1,%d0
	jne .L1627
	moveq #45,%d1
	cmp.l %a5,%d1
	jeq .L1628
	moveq #43,%d0
	cmp.l %a5,%d0
	jeq .L1628
	jra .L1627
.L1629:
	move.l %a2,-(%sp)
	moveq #64,%d3
	jsr 1074529464
	addq.l #4,%sp
	move.l %d0,%a3
	cmp.l %d0,%d3
	jge .L1635
	move.w #64,%a3
.L1635:
	clr.l %d3
.L1636:
	cmp.l %a3,%d3
	jlt .L1640
	moveq #4,%d0
	clr.l ls+64
	clr.l ls+60
	addq.l #1,ux+3960
.L1641:
	move.l ux+3944,%a0
	lea (%a0,%a0.l*2),%a1
	addq.l #1,%a0
	move.l %a0,ux+3944
	addq.l #1,ux+3884
	add.l %d5,%a1
	move.b %d7,3920(%a1)
	move.b %d6,3921(%a1)
	move.b %d0,3922(%a1)
	jra .L1620
.L1640:
	moveq #31,%d0
	cmp.l %d3,%d0
	jlt .L1637
	move.l ls+60,%d1
	lsr.l %d3,%d1
.L1638:
	btst #0,%d1
	jeq .L1639
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	move.l %d4,-(%sp)
	move.l %d3,-(%sp)
	move.l %a2,-(%sp)
	jsr 1074529568
	lea (20,%sp),%sp
	addq.l #1,ls+96
.L1639:
	addq.l #1,%d3
	jra .L1636
.L1637:
	move.l %d3,%d0
	add.l #-32,%d0
	move.l ls+64,%d1
	lsr.l %d0,%d1
	jra .L1638
.L1625:
	moveq #1,%d0
	jra .L1621
.L1758:
	moveq #2,%d0
	jra .L1621
.L1644:
	move.l #1075731444,%d5
	cmp.l sv+88.l,%d5
	jeq .L1643
	move.l st+8,%d0
	sub.l cu+16,%d0
	lsr.l #1,%d0
	jeq .L1643
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	jsr cu_tab
	addq.l #8,%sp
	move.l %d0,%a2
	tst.l %d0
	jeq .L1643
	move.l %d2,-(%sp)
	moveq #8,%d3
	jsr cu_setup
	lea (11,%a2),%a2
	addq.l #4,%sp
.L1647:
	move.l %d3,%a3
	move.l %d2,-(%sp)
	lea (9,%a3),%a3
	move.l %a3,-(%sp)
	jsr 1073770536
	addq.l #8,%sp
	move.l %d0,%d5
	tst.l %d0
	jle .L1645
	moveq #43,%d0
	cmp.l %d2,%d0
	jne .L1646
	moveq #10,%d1
	cmp.l %d3,%d1
	jne .L1646
	mvz.b cu+29,%d0
	moveq #45,%d7
	cmp.l %d0,%d7
	jeq .L1645
	moveq #43,%d1
	cmp.l %d0,%d1
	jeq .L1645
.L1646:
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
.L1645:
	addq.l #1,%d3
	lea (16,%a2),%a2
	moveq #16,%d5
	cmp.l %d3,%d5
	jne .L1647
	addq.l #1,cu+20
	moveq #50,%d6
	cmp.l %d2,%d6
	jne .L1648
	addq.l #1,%d4
	lea st+8,%a0
	move.b %d4,cu+11
	move.l (%a0),cu+24
	jra .L1648
.L1660:
	addq.l #1,k44+32
.L1662:
	subq.l #2,%d0
	tst.l %d0
	jne .L1661
	clr.b %d7
	move.b %d7,k44+26
	jra .L1661
.L1659:
	mov3q.l #1,%d5
	cmp.l %d0,%d5
	jne .L1663
	addq.l #1,k44+4
	jra .L1661
.L1663:
	addq.l #1,k44+8
	jra .L1662
.L1664:
	tst.b dp+22.l
	jeq .L1665
	mvz.b dp+20,%d0
	cmp.l %d1,%d0
	jne .L1665
	mvz.b dp+21,%d0
	cmp.l %d5,%d0
	jne .L1665
.L1666:
	lea dp,%a3
	sub.l %a2,%a2
	lea dp+32,%a1
	move.l %a1,-156(%fp)
	move.l %a3,%a4
.L1678:
	moveq #43,%d0
	cmp.l %d5,%d0
	jeq .L1764
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
.L1671:
	move.l %d5,-(%sp)
	pea 9(%a2)
	jsr 1073770536
	addq.l #8,%sp
	tst.l %d0
	jgt .L1672
	clr.l -148(%fp)
.L1673:
	move.b -148(%fp),%d7
	move.b -147(%fp),%d0
	mvz.b %d3,%d6
	move.b -146(%fp),%d1
	move.w %d7,%a1
	mvz.b 24(%a4),%d7
	move.w %d0,%a0
	move.b -145(%fp),%d0
	cmp.l %d7,%d6
	jne .L1676
	move.l -156(%fp),%a5
	mvs.b %a1,%d6
	mvs.b (%a5),%d7
	cmp.l %d7,%d6
	jne .L1676
	mvs.b 1(%a5),%d7
	mvs.b %a0,%d6
	cmp.l %d7,%d6
	jne .L1676
	mvs.b 2(%a5),%d7
	mvs.b %d1,%d6
	cmp.l %d7,%d6
	jne .L1676
	mvs.b 3(%a5),%d7
	mvs.b %d0,%d6
	cmp.l %d7,%d6
	jeq .L1677
.L1676:
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
.L1677:
	addq.l #1,%a2
	addq.l #4,-156(%fp)
	addq.l #1,%a4
	moveq #8,%d7
	cmp.l %a2,%d7
	jne .L1678
	tst.b dp+23.l
	jeq .L1653
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
.L1680:
	move.b (%a2)+,(%a1)
	mov3q.l #1,%a0
.L1679:
	lea 31(%a3,%a0.l),%a4
	mov3q.l #5,%d2
	move.b (%a4),(%a1,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d2
	jne .L1679
	addq.l #5,%a1
	addq.l #5,%d0
	addq.l #4,%a3
	moveq #49,%d3
	cmp.l %d0,%d3
	jne .L1680
	moveq #-9,%d4
	pea 49.w
	move.l %d1,-(%sp)
	move.b %d4,-92(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1653
	clr.b %d5
	addq.l #1,dp+16
	move.b %d5,dp+23
.L1653:
	tst.l st
	jeq .L1649
.L1650:
	mov3q.l #1,%d6
	cmp.l 1094562388.l,%d6
	jne .L1649
	tst.l st+968
	jeq .L1649
	move.b 1079807565,%d2
	mvs.b %d2,%d0
	lsr.l #7,%d0
	jne .L1766
	addq.l #1,%d2
.L1681:
	move.l pj+160,%d0
	cmp.l pj+156.l,%d0
	jeq .L1685
	move.l pj+156,%d3
	sub.l %d0,%d3
	clr.l -(%sp)
	move.l %d3,%d0
	cmp.l #16383,%d3
	jls .L1683
	mvz.w #16383,%d0
.L1683:
	move.l %d0,-(%sp)
	mov3q.l #6,-(%sp)
	jsr pj_send
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1715
	moveq #2,%d0
	add.l %d3,pj+160
	move.w %d0,pj+180
.L1685:
	move.l pj,%d1
	cmp.l pj+4.l,%d1
	jne .L1686
	tst.b pj+139.l
	jeq .L1687
	mvz.b pj+138,%d1
	mvz.b %d2,%d0
	cmp.l %d1,%d0
	jeq .L1688
.L1687:
	clr.l %d0
.L1689:
	move.l #1081903571,%a0
	lea pj-1081903431,%a1
.L1690:
	tst.l %d0
	jne .L1692
.L1693:
	move.l st+968,%d6
	cmp.l pj+164.l,%d6
	jeq .L1710
	moveq #2,%d7
	move.w %d7,pj+180
.L1710:
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
.L1711:
	move.l #1081903571,%a2
	add.l %a0,%a2
	tst.b (%a2)
	jeq .L1712
	move.b (%a2),%d0
	moveq #127,%d1
	moveq #15,%d3
	and.l %d1,%d0
	move.b %d0,9(%a1,%a0.l)
	addq.l #1,%a0
	cmp.l %a0,%d3
	jne .L1711
.L1712:
	moveq #-9,%d4
	lea (%fp,%a0.l),%a2
	move.b %d4,-131(%a2)
	pea 10(%a0)
	move.l %a1,-(%sp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1715
	moveq #1,%d5
	move.b %d2,pj+138
	lea st+968,%a0
	lea st+8,%a1
	move.l (%a0),pj+164
	move.l (%a1),pj+168
	move.l #1081903571,%a0
	lea pj-1081903431,%a1
	move.b %d5,pj+139
.L1714:
	move.b (%a0),(%a1,%a0.l)
	addq.l #1,%a0
	cmp.l #1081903587,%a0
	jne .L1714
	addq.l #1,pj+176
	jra .L1715
.L1760:
	sub.l %a0,%a0
	jra .L1667
.L1761:
	clr.l %d0
	jra .L1668
.L1763:
	clr.l %d0
.L2073:
	clr.b %d6
	jra .L1669
.L1764:
	clr.b %d3
	jra .L1671
.L1672:
	moveq #52,%d6
	muls.l %d6,%d0
	move.l #1075575112,%a0
	move.l (%a0,%d0.l),%a1
	clr.l -148(%fp)
	move.l %a1,%d0
	sub.l %a0,%a0
	add.l #-1073741824,%d0
	cmp.l #67108863,%d0
	jhi .L1673
.L1674:
	moveq #125,%d6
	move.b (%a1,%a0.l),%d1
	move.l %d1,%d0
	subq.l #1,%d0
	mvz.b %d0,%d0
	cmp.l %d0,%d6
	jcs .L1673
	lea (-148,%a0),%a5
	mov3q.l #4,%d0
	move.b %d1,(%a5,%fp.l)
	addq.l #1,%a0
	cmp.l %a0,%d0
	jne .L1674
	jra .L1673
.L1766:
	clr.b %d2
	jra .L1681
.L1686:
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
	jeq .L1715
	addq.l #1,pj+4
	addq.l #1,pj+172
	jra .L1685
.L1688:
	move.l st+968,%d3
	cmp.l pj+164.l,%d3
	jne .L1687
	move.l st+8,%d0
	moveq #99,%d4
	sub.l pj+168,%d0
	cmp.l %d0,%d4
	scc %d0
	mvs.b %d0,%d0
	neg.l %d0
	jra .L1689
.L1692:
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
	jne .L1690
	mvz.b %d3,%d3
	mvz.b %d1,%d1
	cmp.l %d3,%d1
	jne .L1693
	tst.b pj+181.l
	jeq .L1715
	move.l 1100949640,%d0
	mov3q.l #3,%d1
	and.l %d0,%d1
	tst.l %d1
	jne .L1694
	move.l %d0,%d1
	add.l #-1073741824,%d1
	cmp.l #129892351,%d1
	jhi .L1694
	move.l %d0,%a0
	add.l #1073744908,%d1
	lea (12,%a0),%a0
	move.l %a0,%a1
.L1697:
	mvz.b (%a1),%d0
	lsr.l #1,%d0
	jeq .L1695
.L1694:
	mvz.w #16383,%d0
	clr.l %d3
.L1696:
	clr.l -(%sp)
	move.l %d0,-(%sp)
	pea 9.w
	jsr pj_send
	lea (12,%sp),%sp
	tst.l %d0
	jeq .L1715
	addq.l #1,pj+184
	tst.l %d3
	jeq .L1701
	move.b pj+181,%d0
	mvz.b %d0,%d1
	lsr.l #1,%d1
	jeq .L1701
	clr.b %d7
	subq.l #1,%d0
	move.b %d0,pj+181
	move.b %d7,pj+180
.L1715:
	tst.l st
	jeq .L1719
	mov3q.l #1,%d3
	cmp.l 1094562388.l,%d3
	jne .L1720
	tst.l st+968
	jeq .L1720
	move.l st+44,%d1
	move.l txsx_over,%d0
	cmp.l kd_drop.l,%d1
	jne .L1721
	cmp.l kd_over.l,%d0
	jeq .L1722
.L1721:
	move.l st+8,%a0
	moveq #19,%d4
	sub.l kd_t,%a0
	cmp.l %a0,%d4
	jcc .L1722
	cmp.l #16383,%d1
	jls .L1723
	mvz.w #16383,%d1
.L1723:
	cmp.l #16383,%d0
	jls .L1724
	mvz.w #16383,%d0
.L1724:
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
	jeq .L1722
	lea st+44,%a0
	lea txsx_over,%a1
	lea st+8,%a2
	move.l (%a0),kd_drop
	move.l (%a1),kd_over
	move.l (%a2),kd_t
.L1722:
	tst.l st
	jeq .L1719
.L1720:
	mov3q.l #1,%d0
	cmp.l 1094562388.l,%d0
	jne .L1725
	tst.l st+968
	jeq .L1725
	jsr 1075312702
	move.l %d0,%d2
	add.l #352,%d2
	move.l %d2,-(%sp)
	move.l %d0,%a3
	jsr 1074425250
	addq.l #4,%sp
	tst.l qp+100
	jeq .L1726
	cmp.l #4095,%d0
	jle .L1727
	mvz.w #4095,%d0
.L1728:
	move.l 352(%a3),%a0
	lea qp,%a2
	move.l %d0,(%a2)
	move.l %d2,-(%sp)
	move.l 52(%a0),%a0
	mov3q.l #1,qp+4
	jsr (%a0)
	addq.l #4,%sp
	tst.l %d0
	jeq .L1729
	move.l %d0,%a0
	moveq #11,%d0
	mvz.b 2430(%a0),%d2
	cmp.l %d2,%d0
	jcc .L1730
.L1729:
	clr.l %d2
.L1731:
	move.w #11521,%d3
	move.l #-260222380,%d1
	move.l %d1,-140(%fp)
	move.w %d3,-136(%fp)
	cmp.l qp+44.l,%d2
	jne .L1732
	tst.l qp+48
	jeq .L1733
.L1732:
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
	jeq .L1726
	move.l %d2,qp+44
	clr.l qp+48
	addq.l #1,qp+52
.L1733:
	move.l %fp,%d2
	add.l #-140,%d2
	jra .L1734
.L1695:
	lea (24,%a1),%a1
	cmp.l %d1,%a1
	jne .L1697
	move.b pj+180,%d0
	move.l %a0,%d3
	tst.b %d0
	jge .L1698
	clr.l %d0
.L1699:
	tst.b (%a0)
	sne %d2
	lea (24,%a0),%a0
	mvs.b %d2,%d2
	sub.l %d2,%d0
	cmp.l %d1,%a0
	jne .L1699
	jra .L1696
.L1701:
	clr.b %d0
	move.b %d0,pj+181
	jra .L1715
.L1698:
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
.L1709:
	mvz.b pj+180,%d0
	sub.l %a3,%a3
	add.l %d1,%d0
	muls.w #24,%d0
	lea (%a0,%d0.l),%a1
	tst.b (%a1)
	sne %d0
	neg.l %d0
	move.b %d0,(%a2)
.L1703:
	move.b (%a1),%d0
	jeq .L1702
	move.b 8(%a1,%a3.l),%d0
	moveq #127,%d5
	and.l %d5,%d0
.L1702:
	addq.l #1,%a3
	move.b %d0,(%a2,%a3.l)
	moveq #15,%d6
	cmp.l %a3,%d6
	jne .L1703
	sub.l %a1,%a1
.L1704:
	move.l %a1,%a3
	addq.l #1,%a1
	tst.b (%a2,%a1.l)
	jne .L1706
.L1707:
	moveq #15,%d3
	cmp.l %a3,%d3
	jeq .L1705
	clr.b %d0
	addq.l #1,%a3
	move.b %d0,(%a2,%a3.l)
	jra .L1707
.L1706:
	moveq #15,%d7
	cmp.l %a1,%d7
	jne .L1704
.L1705:
	addq.l #1,%d1
	lea (16,%a2),%a2
	moveq #8,%d4
	cmp.l %d1,%d4
	jne .L1709
	moveq #-9,%d5
	pea 139.w
	move.l %d2,-(%sp)
	move.b %d5,-2(%fp)
	jsr send
	addq.l #8,%sp
	tst.l %d0
	jeq .L1715
	move.b pj+180,%d0
	addq.l #8,%d0
	move.b %d0,pj+180
	jra .L1715
.L1649:
	lea pj,%a0
	move.l (%a0),%d0
.L1716:
	cmp.l pj+4.l,%d0
	jeq .L1715
	moveq #31,%d1
	moveq #10,%d2
	and.l pj+4,%d1
	mvz.b 8(%a0,%d1.l*4),%d1
	cmp.l %d1,%d2
	jeq .L1717
	addq.l #1,pj+156
.L1717:
	addq.l #1,pj+4
	jra .L1716
.L1727:
	tst.l %d0
	jge .L1728
	clr.l %d0
	jra .L1728
.L1730:
	addq.l #1,%d2
	jra .L1731
.L1735:
	mov3q.l #3,%d7
	and.l %d7,%d0
	moveq #16,%d6
	lea 64(%a2,%d0.l*2),%a0
	lea 65(%a2,%d0.l*2),%a1
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
	jeq .L1726
	addq.l #1,qp+60
.L1734:
	move.l qp+60,%d0
	cmp.l qp+56.l,%d0
	jne .L1735
	move.l qp+92,%d1
	cmp.l qp+96.l,%d1
	jeq .L1726
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
	jeq .L1726
	move.l %d2,qp+96
.L1726:
	tst.l st
	jeq .L1719
.L1725:
	mov3q.l #1,%d5
	cmp.l 1094562388.l,%d5
	jne .L1719
	tst.l st+968
	jeq .L1719
	move.l pmo+64,%d2
	tst.l qp+100
	jeq .L1719
	move.w #11521,%d7
	move.l #-260222380,%d6
	move.l %d6,-140(%fp)
	move.w %d7,-136(%fp)
	cmp.l pmo+124.l,%d2
	jeq .L1737
	moveq #17,%d0
	moveq #127,%d1
	move.b %d0,-134(%fp)
	move.l pmo,%d0
	cmp.l %d0,%d1
	jcc .L1738
	moveq #127,%d0
.L1738:
	move.b %d0,-133(%fp)
	move.l pmo+4,%d0
	cmp.l #16383,%d0
	jls .L1739
	mvz.w #16383,%d0
.L1739:
	move.l %d0,%d1
	moveq #127,%d3
	and.l %d3,%d0
	lsr.l #7,%d1
	move.b %d1,-132(%fp)
	move.b %d0,-131(%fp)
	move.l pmo+8,%d0
	cmp.l #16383,%d0
	jls .L1740
	mvz.w #16383,%d0
.L1740:
	move.l %d0,%d1
	moveq #127,%d4
	and.l %d4,%d0
	lsr.l #7,%d1
	move.b %d1,-130(%fp)
	move.b %d0,-129(%fp)
	move.l pmo+12,%d0
	cmp.l %d0,%d4
	jcc .L1741
	moveq #127,%d0
.L1741:
	move.b %d0,-128(%fp)
	lea fp,%a0
	tst.l pmo+52
	jeq .L1767
	move.l (%a0),%d1
	sub.l pmo+108,%d1
	cmp.l #1499,%d1
	sls %d1
	neg.l %d1
.L1742:
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
	jeq .L1719
	move.l %d2,pmo+124
.L1737:
	move.l pmo+16,%d2
	cmp.l pmo+128.l,%d2
	jeq .L1719
	move.l st+8,%d0
	moveq #19,%d7
	sub.l pmo+132,%d0
	cmp.l %d0,%d7
	jcc .L1719
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
	jeq .L1719
	lea st+8,%a2
	move.l %d2,pmo+128
	move.l (%a2),pmo+132
.L1719:
	move.l -66650100,%d0
	addq.l #1,st+336
	sub.l -152(%fp),%d0
	add.l %d0,st+328
	cmp.l st+332.l,%d0
	jls .L1442
	move.l %d0,st+332
.L1442:
	movem.l -204(%fp),#15612
	unlk %fp
	rts
.L1767:
	clr.b %d1
	jra .L1742
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
	jeq .L2075
	sub.l st+8,%d0
	tst.l %d0
	jgt .L2076
.L2075:
	clr.l 44(%sp)
.L2077:
	move.l 16(%a2),%a2
	move.l %a2,52(%sp)
	tst.l st+4
	jne .L2079
	tst.l st+972
	jne .L2080
	tst.b sv+8.l
	jne .L2080
	tst.l 44(%sp)
	jeq .L2082
	jra .L2114
.L2076:
	move.l %d3,%a0
	move.l %d3,%d0
	addq.l #6,%a0
	lea (108,%sp),%a1
	add.l #566,%d0
.L2078:
	move.b 1(%a0),(%a1)
	addq.l #8,%a0
	move.b -8(%a0),1(%a1)
	addq.l #2,%a1
	cmp.l %a0,%d0
	jne .L2078
	mov3q.l #1,44(%sp)
	jra .L2077
.L2079:
	tst.l st+1058
	jne .L2082
	move.l commits,%a6
	cmp.l st+24.l,%a6
	jne .L2084
	move.l 52(%sp),%a0
	move.l %a0,%d0
	add.l #1024,%d0
.L2085:
	clr.l (%a0)+
	cmp.l %a0,%d0
	jne .L2085
	move.l %a6,st+20
.L2086:
	tst.l 44(%sp)
	jeq .L2082
	tst.l st+4
	jne .L2110
	tst.l st+972
	jne .L2111
.L2114:
	tst.b sv+8.l
	jne .L2111
.L2082:
	move.l -66650100,%d0
	addq.l #1,st+336
	sub.l 60(%sp),%d0
	add.l %d0,st+328
	cmp.l st+332.l,%d0
	jls .L2074
	move.l %d0,st+332
.L2074:
	movem.l (%sp),#31996
	lea (248,%sp),%sp
	rts
.L2080:
	move.l commits,%a6
.L2084:
	cmp.l st+340.l,%a6
	jne .L2087
	tst.l st+344
	jeq .L2088
.L2087:
	move.l -66650100,%d2
	move.l sh_seq,%d4
	lea copy32,%a2
	move.l %d2,64(%sp)
	btst #0,%d4
	jne .L2089
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
	jne .L2089
	pea 256.w
	pea comp_in
	pea comp
	jsr (%a2)
	lea (12,%sp),%sp
	tst.l st+872
	jne .L2090
	clr.l -(%sp)
	pea comp
	pea 64.w
	pea 128.w
	pea st+872
	jsr 1074198978
	lea (20,%sp),%sp
.L2090:
	lea (tl.0),%a2
	clr.l %d5
.L2103:
	tst.b 4(%a2)
	jeq .L2091
	move.l %a2,%d4
	clr.l %d7
	addq.l #8,%d4
	lea st+408,%a5
	lea st+552,%a0
.L2102:
	tst.l (%a5)+
	jeq .L2093
	mvz.b (%a0),%d0
	cmp.l %d0,%d5
	jne .L2093
	lea st+472,%a1
	mvz.b 5(%a0),%d1
	mvz.b (%a1,%d7.l),%d4
	lea (6,%a0),%a3
	sub.l %a1,%a1
.L2095:
	cmp.l %d1,%a1
	jlt .L2096
	move.b 4(%a0),%d0
	lea 72(%sp,%d1.l),%a3
	btst #1,%d0
	jeq .L2115
	move.l %d4,%d0
	add.l #-64,%d0
	move.l %d0,56(%sp)
	tst.l %d0
	jle .L2098
	move.b #43,(%a3)
	addq.l #1,%d1
	lea 72(%sp,%d1.l),%a3
.L2116:
	sub.l %a1,%a1
	jra .L2097
.L2096:
	lea (%a3,%a1.l),%a4
	move.b (%a4),72(%sp,%a1.l)
	addq.l #1,%a1
	jra .L2095
.L2098:
	tst.l 56(%sp)
	jeq .L2116
	move.b #45,(%a3)
	moveq #64,%d2
	mov3q.l #1,%a1
	sub.l %d4,%d2
	move.l %d2,56(%sp)
.L2097:
	lea (68,%sp),%a4
	clr.l %d4
.L2100:
	move.l 56(%sp),%d6
	moveq #10,%d0
	addq.l #1,%d4
	rems.l %d0,%d2:%d6
	divs.l %d0,%d6
	add.l #48,%d2
	move.b %d2,(%a4)
	move.l %d6,56(%sp)
	tst.l %d6
	jeq .L2099
	addq.l #1,%a4
	mov3q.l #4,%d6
	cmp.l %d4,%d6
	jne .L2100
.L2099:
	add.l %a1,%a3
	move.l %d4,%d0
.L2101:
	subq.l #1,%d0
	move.b 68(%sp,%d0.l),(%a3)+
	tst.l %d0
	jne .L2101
	mvz.w #248,%d0
	add.l %sp,%d0
	add.l %d1,%d0
	add.l %d4,%d0
	add.l %d0,%a1
	clr.b %d0
	move.l %sp,%d4
	add.l #72,%d4
	move.b %d0,-176(%a1)
.L2093:
	addq.l #1,%d7
	lea (20,%a0),%a0
	moveq #16,%d1
	cmp.l %d7,%d1
	jne .L2102
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
	jgt .L2091
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
.L2091:
	addq.l #1,%d5
	lea (44,%a2),%a2
	moveq #64,%d0
	cmp.l %d5,%d0
	jne .L2103
	move.l -66650100,%d0
	move.l %a6,st+340
	addq.l #1,st+348
	sub.l 64(%sp),%d0
	add.l %d0,st+356
	cmp.l st+360.l,%d0
	jls .L2104
	move.l %d0,st+360
.L2104:
	clr.l st+344
.L2088:
	pea 256.w
	pea comp
	move.l 60(%sp),-(%sp)
	jsr copy32
	lea (12,%sp),%sp
	cmp.l st+20.l,%a6
	jeq .L2105
	move.l -66650100,%d0
	addq.l #1,st+308
	sub.l t_commit,%d0
	add.l %d0,st+304
	cmp.l st+312.l,%d0
	jls .L2105
	move.l %d0,st+312
.L2105:
	move.l st+388,%d1
	tst.l %d1
	jeq .L2106
	cmp.l st+392.l,%a6
	jeq .L2106
	move.l -66650100,%d0
	sub.l %d1,%d0
	add.l %d0,st+396
	addq.l #1,st+400
	cmp.l st+404.l,%d0
	jls .L2107
	move.l %d0,st+404
.L2107:
	clr.l st+388
.L2106:
	move.l st+368,%d1
	tst.l %d1
	jeq .L2108
	move.l -66650100,%d0
	sub.l %d1,%d0
	add.l %d0,st+372
	addq.l #1,st+376
	cmp.l st+380.l,%d0
	jls .L2109
	move.l %d0,st+380
.L2109:
	clr.l st+368
.L2108:
	move.l %a6,st+20
	move.l -66650100,%d0
	move.l %d0,st+56
	sub.l t_commit,%d0
	addq.l #1,st+28
	move.l %d0,st+60
	jra .L2086
.L2115:
	move.l %d4,56(%sp)
	jra .L2116
.L2089:
	pea 256.w
	pea comp
	move.l 60(%sp),-(%sp)
	addq.l #1,st+32
	jsr (%a2)
	lea (12,%sp),%sp
	jra .L2086
.L2110:
	tst.l st+1058
	jne .L2082
.L2111:
	move.l %d3,%a0
	add.l #566,%d3
	lea (108,%sp),%a1
	addq.l #6,%a0
.L2112:
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
	jne .L2112
	jra .L2082
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
	jne .L2140
	cmp.l ed+88.l,%d1
	jeq .L2140
	move.l %d1,ed+88
	mov3q.l #1,ed+92
.L2140:
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
	jne .L2141
	moveq #66,%d5
	cmp.l %d2,%d5
	jne .L2142
	tst.b k44+20.l
	jeq .L2143
	clr.b %d6
	move.b %d6,k44+20
	tst.b k44+22.l
	jeq .L2143
	moveq #2,%d7
	move.w %d7,k44+22
.L2143:
	clr.l u46
	tst.b u46+48.l
	jeq .L2144
	clr.b %d0
	move.b %d0,u46+48
.L2151:
	mov3q.l #1,%d0
.L2145:
	move.l -66650100,%d1
	addq.l #1,st+336
	sub.l 64(%sp),%d1
	add.l %d1,st+328
	cmp.l st+332.l,%d1
	jls .L2139
	move.l %d1,st+332
.L2139:
	movem.l (%sp),#31996
	lea (100,%sp),%sp
	rts
.L2142:
	cmp.l #134,%d2
	jne .L2146
	clr.l tk
	tst.l tk+8
	jeq .L2144
	move.l st+248,%d0
	clr.l tk+8
	btst #6,%d0
	jeq .L2147
	moveq #-65,%d1
	and.l %d0,%d1
	move.l %d1,st+248
	tst.l st+4
	jne .L2456
.L2147:
	clr.l %d0
	jra .L2145
.L2146:
	move.l %d2,%d0
	add.l #-68,%d0
	lsr.l #1,%d0
	jne .L2144
	moveq #31,%d1
	mov3q.l #1,%d0
	and.l %d4,%d1
	lsl.l %d1,%d0
	and.l st+208,%d0
	tst.l %d0
	jeq .L2149
	move.l st+200,%d3
	move.l %d3,%d5
	move.l st+220,%d1
	move.l %d1,%d0
	and.l #2097152,%d0
	and.l #786432,%d5
	or.l %d5,%d0
	jeq .L2150
	addq.l #1,nk+16
.L2150:
	and.l #-786433,%d3
	bclr #21,%d1
	move.l %d3,st+200
	move.l %d1,st+220
.L2149:
	moveq #69,%d6
	cmp.l %d2,%d6
	jne .L2144
	tst.l nk
	jeq .L2144
	moveq #-33,%d7
	and.l %d7,st+240
	clr.l nk
	tst.l st+4
	jeq .L2151
	mov3q.l #1,-(%sp)
	pea 69.w
	lea queue_key,%a2
	jsr (%a2)
	clr.l -(%sp)
	pea 69.w
	jsr (%a2)
.L2455:
	jsr flush
.L2445:
	lea (16,%sp),%sp
	jra .L2151
.L2144:
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
	jeq .L2152
	not.l %d0
	and.l %d5,%d0
	move.l %d0,(%a2,%a0.l*4)
	jra .L2151
.L2152:
	move.l %d2,%d4
	mov3q.l #5,%d5
	add.l #-64,%d4
	cmp.l %d4,%d5
	jcs .L2153
	move.l ls+28,%d5
	btst %d4,%d5
	jeq .L2153
	mov3q.l #1,%d0
	lsl.l %d4,%d0
	move.l ls+32,%d1
	not.l %d0
	and.l %d0,%d5
	move.l %d5,ls+28
	btst %d4,%d1
	jeq .L2151
	and.l %d1,%d0
	move.l %d0,ls+32
.L2457:
	clr.l -(%sp)
.L2446:
	move.l %d2,-(%sp)
	jsr queue_key
	jsr flush
	jra .L2444
.L2153:
	move.l %d1,%a1
	move.l %d0,%d4
	lea (121,%a1),%a1
	lea sq,%a0
	move.l (%a0,%a1.l*4),%d3
	and.l %d3,%d4
	tst.l %d4
	jeq .L2154
	not.l %d0
	and.l %d3,%d0
	move.l %d0,(%a0,%a1.l*4)
	jra .L2457
.L2154:
	move.l %d1,%a0
	move.l %d0,%d4
	lea (50,%a0),%a0
	move.l (%a2,%a0.l*4),%d3
	and.l %d3,%d4
	tst.l %d4
	jeq .L2155
	not.l %d0
	and.l %d3,%d0
	move.l %d2,%d1
	mov3q.l #7,%d6
	add.l #-112,%d1
	move.l %d0,(%a2,%a0.l*4)
	cmp.l %d1,%d6
	jcs .L2147
	move.l ux,%d3
	btst %d1,%d3
	jeq .L2147
	mov3q.l #1,%d0
	lsl.l %d1,%d0
	not.l %d0
	and.l %d3,%d0
	move.l %d0,ux
.L2456:
	clr.l -(%sp)
	move.l %d2,-(%sp)
	jsr queue_key
	jsr flush
.L2450:
	addq.l #8,%sp
	jra .L2147
.L2155:
	move.l %d1,%a0
	move.l %d0,%d4
	lea (226,%a0),%a0
	move.l (%a2,%a0.l*4),%d3
	and.l %d3,%d4
	tst.l %d4
	jeq .L2156
	not.l %d0
	and.l %d3,%d0
	move.l %d0,(%a2,%a0.l*4)
	move.l st+4,%d0
	or.l sq+408,%d0
	jeq .L2147
	jra .L2456
.L2156:
	add.l #58,%d1
	move.l %d0,%d4
	move.l (%a2,%d1.l*4),%d3
	and.l %d3,%d4
	tst.l %d4
	jeq .L2147
	not.l %d0
	and.l %d3,%d0
	move.l %d0,(%a2,%d1.l*4)
	tst.l st+4
	jeq .L2151
	clr.l -(%sp)
	move.l %d2,-(%sp)
	jsr queue_key
.L2444:
	addq.l #8,%sp
	jra .L2151
.L2141:
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
	jne .L2151
	move.l %d7,%d5
	move.l %d3,%d0
	add.l #58,%d5
	and.l (%a2,%d5.l*4),%d0
	tst.l %d0
	jne .L2151
	move.l %d7,%d0
	add.l #121,%d0
	lea sq,%a5
	move.l (%a5,%d0.l*4),%d0
	and.l %d3,%d0
	tst.l %d0
	jne .L2151
	move.l %d7,%d6
	move.l %d3,%d0
	add.l #50,%d6
	and.l (%a2,%d6.l*4),%d0
	tst.l %d0
	jne .L2147
	move.l %d7,%d0
	add.l #226,%d0
	move.l (%a2,%d0.l*4),%d0
	and.l %d3,%d0
	tst.l %d0
	jne .L2147
	tst.l nk
	jeq .L2157
	move.l %d2,%d1
	add.l #-18,%d1
	lsr.l #1,%d1
	jeq .L2160
	cmp.l #181,%d2
	jne .L2159
.L2160:
	lea (%a4,%d0.l),%a0
	moveq #32,%d1
	move.l (%a0),68(%sp,%d0.l)
	addq.l #4,%d0
	cmp.l %d0,%d1
	jne .L2160
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
	jra .L2450
.L2159:
	clr.l nk
	addq.l #1,nk+8
	tst.l st+4
	jeq .L2157
	mov3q.l #1,-(%sp)
	pea 69.w
	jsr queue_key
	jsr flush
	addq.l #8,%sp
.L2157:
	moveq #66,%d6
	cmp.l %d2,%d6
	jne .L2161
	move.l st+4,%d0
	tst.l %d0
	jeq .L2162
	tst.l st+1058
	jne .L2163
.L2162:
	move.l st+216,%d1
	or.l st+248,%d1
	or.l st+920,%d1
	btst #0,%d1
	jne .L2163
	move.w #256,%d7
	lea st+8,%a0
	move.l (%a0),k44
	move.w %d7,k44+20
.L2163:
	lea st+8,%a0
	move.l (%a0),u46+4
	tst.l sq+408
	jeq .L2190
	tst.l %d0
	jeq .L2166
	tst.l st+1058
	jne .L2190
	move.l sq+484,%d1
	move.l st+232,%d0
.L2168:
	or.l %d1,%d0
	tst.w %d0
	jeq .L2190
	moveq #1,%d0
	clr.b %d1
	addq.l #1,u46+32
	move.b %d0,u46+48
	move.b %d1,k44+20
	jra .L2151
.L2161:
	cmp.l #128,%d2
	jne .L2164
	lea masks,%a0
	move.l (%a0),nk+20
.L2190:
	move.l %d2,%d6
	mov3q.l #1,%d0
	move.l st+4,%d7
	add.l #-64,%d6
	cmp.l %d6,%d0
	jcs .L2209
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jne .L2208
	tst.l fk_claim
	jeq .L2211
	move.b ls,%d0
	move.b u46+48,%d1
	or.l %d1,%d0
	tst.b %d0
	jne .L2211
	move.l st+216,%d0
	moveq #65,%d1
	or.l st+972,%d7
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d1,%d0
	or.l %d7,%d0
	jne .L2211
	tst.l sq+408
	jeq .L2212
	tst.w sq+486.l
	jne .L2211
.L2212:
	tst.w st+202.l
	jne .L2211
	move.l sv+88,-(%sp)
	jsr overlay
	addq.l #4,%sp
	or.l ov_list,%d0
	jne .L2211
	or.l %d3,st+272
	moveq #64,%d4
	cmp.l %d2,%d4
	jne .L2291
	moveq #15,%d0
.L2213:
	lea fk,%a0
	addq.l #1,(%a0,%d6.l*4)
	move.l %d0,dp
	addq.l #1,dp+4
	jra .L2454
.L2166:
	move.l sq+484,%d1
	jra .L2168
.L2164:
	moveq #68,%d6
	cmp.l %d2,%d6
	jne .L2169
	move.l tk,%d0
	or.l u46,%d0
	jeq .L2170
	tst.l st+4
	jeq .L2170
	addq.l #1,tk+4
	jra .L2190
.L2170:
	move.l st+216,%d0
	moveq #64,%d7
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d0,%d7
	move.l %d7,%a0
	btst #6,%d0
	jne .L2172
	move.l st+240,%d0
	move.l st+208,%d7
	move.l %d7,%d1
	move.l st+912,%d6
	or.l %d0,%d1
	or.l %d6,%d1
	move.w %d1,%ccr
	jeq .L2173
	tst.b u46+48.l
	jeq .L2174
.L2173:
	move.l st+8,%a1
	mov3q.l #2,%d1
	sub.l u46+4,%a1
	cmp.l %a1,%d1
	jcc .L2175
.L2172:
	moveq #16,%d2
	or.l %d2,st+272
	tst.l %a0
	jne .L2176
	moveq #1,%d4
	addq.l #1,u46+20
	addq.l #1,u46+16
	move.b %d4,k44+21
.L2176:
	tst.l st+4
	jeq .L2177
	tst.b k44+22.l
	jeq .L2178
	tst.b k44+26.l
	jne .L2178
	tst.l %a0
	jne .L2178
	moveq #1,%d6
	moveq #1,%d7
	clr.b %d0
	mvz.w #256,%d5
	move.l %d5,st+296
	move.b %d6,st+161
	move.w %d7,st+162
	move.b %d0,st+993
.L2448:
	jsr flush
	jra .L2151
.L2178:
	mov3q.l #3,-(%sp)
	move.l 32(%a3),-(%sp)
	jsr leave
	jra .L2444
.L2177:
	clr.l -(%sp)
.L2452:
	clr.l -(%sp)
	move.l 32(%a3),-(%sp)
	jsr enter
	jra .L2449
.L2175:
	move.w %d7,%ccr
	jeq .L2179
.L2174:
	or.l %d6,%d0
	move.w %d0,%ccr
	jeq .L2179
	tst.b u46+48.l
	jeq .L2190
.L2179:
	addq.l #1,u46+40
	jra .L2190
.L2169:
	moveq #53,%d1
	cmp.l %d2,%d1
	jne .L2180
	move.l st+216,%d6
	move.l st+248,%a0
	move.l st+920,%d7
	move.l %d6,50(%sp)
	btst #6,%d6
	jne .L2181
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
	jne .L2182
	tst.b u46+48.l
	jeq .L2190
.L2183:
	moveq #1,%d2
	mov3q.l #1,u46
	addq.l #1,u46+16
	move.b %d2,k44+21
	jra .L2181
.L2182:
	tst.l %d6
	jeq .L2183
.L2181:
	move.l %a0,%d1
	or.l 50(%sp),%d1
	moveq #32,%d4
	swap %d4
	or.l %d7,%d1
	or.l %d4,st+268
	btst #6,%d1
	jeq .L2185
	mov3q.l #1,tk
.L2185:
	clr.l st+1038
	tst.l st+4
	jeq .L2186
	moveq #1,%d6
	mvz.w #256,%d5
	moveq #1,%d7
	moveq #1,%d0
	move.l %d5,st+296
	addq.l #1,st+998
	move.b %d6,st+161
	move.w %d7,st+162
	move.b %d0,st+993
	jra .L2448
.L2186:
	mov3q.l #1,-(%sp)
	clr.l -(%sp)
	move.l 32(%a3),-(%sp)
	jsr enter
	addq.l #1,st+994
.L2449:
	lea (12,%sp),%sp
	jra .L2151
.L2180:
	moveq #16,%d1
	cmp.l %d2,%d1
	jne .L2165
	move.l st+216,%d6
	move.l st+248,%a0
	move.l st+920,%d7
	move.l %d6,50(%sp)
	btst #6,%d6
	jne .L2187
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
	jne .L2188
	tst.b u46+48.l
	jeq .L2190
.L2189:
	moveq #1,%d2
	mov3q.l #1,u46
	addq.l #1,u46+16
	move.b %d2,k44+21
	jra .L2187
.L2188:
	tst.l %d6
	jeq .L2189
.L2187:
	move.l %a0,%d1
	or.l 50(%sp),%d1
	moveq #1,%d4
	swap %d4
	or.l %d7,%d1
	or.l %d4,st+264
	btst #6,%d1
	jeq .L2191
	mov3q.l #1,tk
.L2191:
	clr.l st+1038
	tst.l st+4
	jeq .L2192
	moveq #1,%d6
	mvz.w #256,%d5
	moveq #1,%d7
	moveq #2,%d0
	move.l %d5,st+296
	move.b %d6,st+161
	move.w %d7,st+162
	move.b %d0,st+993
.L2451:
	addq.l #1,st+1078
	jra .L2448
.L2192:
	mov3q.l #2,-(%sp)
.L2453:
	clr.l -(%sp)
	move.l 32(%a3),-(%sp)
	jsr enter
	addq.l #1,st+1074
	jra .L2449
.L2165:
	moveq #52,%d1
	cmp.l %d2,%d1
	jne .L2167
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jeq .L2193
	tst.b u46+48.l
	jeq .L2190
.L2193:
	move.l st+216,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #6,%d0
	jne .L2190
	tst.l sq+408
	jeq .L2194
	tst.w sq+486.l
	jne .L2190
.L2194:
	tst.w st+202.l
	jne .L2190
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
	jeq .L2195
	moveq #1,%d6
	moveq #3,%d7
	mvz.w #256,%d5
	move.b %d2,st+161
	move.l %d5,st+296
	move.w %d6,st+162
	move.b %d7,st+993
	jra .L2451
.L2195:
	mov3q.l #3,-(%sp)
	jra .L2453
.L2167:
	moveq #51,%d0
	cmp.l %d2,%d0
	jne .L2171
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jeq .L2196
	tst.b u46+48.l
	jeq .L2190
.L2196:
	move.l st+216,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #6,%d0
	jne .L2190
	tst.l sq+408
	jeq .L2197
	tst.w sq+486.l
	jne .L2190
.L2197:
	tst.w st+202.l
	jne .L2190
	moveq #1,%d1
	moveq #8,%d2
	swap %d2
	mov3q.l #1,u46
	addq.l #1,u46+16
	clr.l st+1038
	move.b %d1,k44+21
	or.l %d2,st+268
	tst.l st+4
	jeq .L2198
	moveq #1,%d5
	moveq #4,%d6
	mvz.w #256,%d4
	move.b %d1,st+161
	move.l %d4,st+296
	move.w %d5,st+162
	move.b %d6,st+993
	jra .L2448
.L2198:
	mov3q.l #4,-(%sp)
	jra .L2452
.L2171:
	moveq #48,%d7
	cmp.l %d2,%d7
	jne .L2184
	move.l st+216,%d0
	move.l st+248,%a0
	move.l st+920,%d7
	move.l %d0,50(%sp)
	btst #6,%d0
	jne .L2199
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
	jne .L2200
	tst.b u46+48.l
	jeq .L2190
.L2201:
	moveq #1,%d2
	mov3q.l #1,u46
	addq.l #1,u46+16
	move.b %d2,k44+21
	jra .L2199
.L2200:
	tst.l %d6
	jeq .L2201
.L2199:
	mvz.b 1093765506,%d0
	moveq #11,%d4
	cmp.l %d0,%d4
	jcs .L2290
	move.b 1093765506,%d0
	add.l #16,%d0
.L2202:
	move.l %a0,%d1
	or.l 50(%sp),%d1
	moveq #1,%d5
	swap %d5
	or.l %d7,%d1
	or.l %d5,st+268
	btst #6,%d1
	jeq .L2203
	mov3q.l #1,tk
.L2203:
	tst.l st+4
	jeq .L2204
	tst.l st+1038
	jeq .L2205
	mov3q.l #3,-(%sp)
	move.l 32(%a3),-(%sp)
	jsr leave
	addq.l #1,st+1050
	jra .L2444
.L2290:
	moveq #16,%d0
	jra .L2202
.L2205:
	moveq #1,%d7
	moveq #1,%d1
	mvz.w #256,%d6
	move.b %d0,st+993
	mov3q.l #1,st+1038
	addq.l #1,st+1046
	move.l %d6,st+296
	move.b %d7,st+161
	move.w %d1,st+162
	jra .L2448
.L2204:
	mvz.b %d0,%d0
	move.l %d0,-(%sp)
	clr.l -(%sp)
	move.l 32(%a3),-(%sp)
	jsr enter
	mov3q.l #1,st+1038
	addq.l #1,st+1042
	jra .L2449
.L2184:
	moveq #13,%d6
	cmp.l %d2,%d6
	jcs .L2190
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jeq .L2206
	tst.b u46+48.l
	jeq .L2207
.L2206:
	or.l %d3,st+264
	addq.l #1,%d2
	move.l %d2,dp
	addq.l #1,dp+4
.L2454:
	tst.b k44+22.l
	jne .L2151
	moveq #1,%d7
	move.b %d7,k44+21
	jra .L2151
.L2207:
	move.l %d2,%d6
	add.l #-64,%d6
.L2208:
	tst.l st+4
	jeq .L2223
	cmp.l #132,%d2
	jne .L2224
	move.l st+216,%d1
	move.l %d1,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #0,%d0
	jeq .L2224
	moveq #16,%d6
	or.l %d1,%d6
	move.l %d6,st+216
	tst.l st+1058
	jne .L2225
	lea st+8,%a0
	mov3q.l #1,st+1058
	clr.l st+1062
	move.l (%a0),st+1066
	addq.l #1,st+1070
.L2225:
	moveq #1,%d0
	move.l 32(%a3),%a0
	move.b %d0,32(%a0)
	jra .L2147
.L2291:
	moveq #16,%d0
	jra .L2213
.L2211:
	addq.l #1,fk+8
	jra .L2208
.L2209:
	moveq #49,%d0
	cmp.l %d2,%d0
	jne .L2208
	move.l st+208,%d0
	or.l st+240,%d0
	or.l st+912,%d0
	move.w %d0,%ccr
	jeq .L2216
	tst.b u46+48.l
	jeq .L2217
.L2216:
	or.l st+972,%d7
	jne .L2217
	tst.l sq+408
	jeq .L2218
	tst.w sq+486.l
	jne .L2217
.L2218:
	move.l st+200,%d6
	mvz.w %d6,%d6
	tst.l %d6
	jne .L2217
	move.b 1093765506,%d1
	moveq #11,%d4
	mvz.b %d1,%d2
	cmp.l %d2,%d4
	jlt .L2219
	moveq #127,%d0
	ext.w %d1
	and.l -2147457096,%d0
	mulu.w #152,%d1
	mulu.w #2531,%d0
	move.l %d0,%a0
	add.l %d1,%a0
	add.l #1092966773,%a0
	mvz.b (%a0),%d6
.L2219:
	moveq #1,%d5
	addq.l #1,u46+24
	addq.l #1,u46+16
	move.b %d5,k44+21
	tst.b ls.l
	jeq .L2220
	mov3q.l #4,-(%sp)
	jsr ls_close
	addq.l #4,%sp
.L2220:
	clr.l u46+8
	moveq #11,%d7
	cmp.l %d2,%d7
	jlt .L2221
	move.l %d6,-(%sp)
	jsr ls_banked
	addq.l #4,%sp
	tst.l %d0
	jne .L2222
	moveq #45,%d0
	cmp.l %d6,%d0
	jeq .L2222
	moveq #43,%d1
	cmp.l %d6,%d1
	jne .L2221
.L2222:
	move.l %d6,-(%sp)
	move.l %d2,-(%sp)
	moveq #127,%d2
	jsr mr_vb
	addq.l #8,%sp
	mvz.b %d0,%d0
	cmp.l %d0,%d2
	jeq .L2221
	mov3q.l #1,%d4
	or.l st+8,%d4
	move.l %d6,u46+12
	move.l %d4,u46+8
.L2221:
	moveq #2,%d5
	swap %d5
	or.l %d5,st+204
	jra .L2147
.L2217:
	moveq #-15,%d6
	jra .L2208
.L2223:
	tst.b ls.l
	jeq .L2226
	mov3q.l #5,%d1
	cmp.l %d6,%d1
	jcs .L2227
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
	jne .L2228
	tst.l ls+36
	jne .L2229
	tst.l %d0
	jeq .L2230
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
.L2458:
	jsr (%a2)
	jra .L2444
.L2228:
	moveq #69,%d1
	cmp.l %d2,%d1
	jne .L2229
	tst.l %d0
	jeq .L2231
	move.b ls+2,%d1
	add.l #-40,%d1
	mvz.b %d1,%d1
	lsr.l #1,%d1
	jne .L2229
.L2231:
	tst.l ls+36
	jeq .L2292
.L2229:
	move.l %d0,%a0
	pea 1(%a0)
	or.l %d3,ls+32
	move.l %d2,-(%sp)
	addq.l #1,ls+88
	jsr queue_key
	jra .L2458
.L2230:
	move.l 1100949720,%a3
	move.l %a3,%d0
	clr.l ls+64
	clr.l ls+60
	add.l #-1073741824,%d0
	cmp.l #67108863,%d0
	jhi .L2233
	jsr sq_grid
	tst.l %d0
	jeq .L2233
	lea (348,%a3),%a0
	move.l (%a0),ls+60
	lea (344,%a3),%a3
	move.l (%a3),ls+64
.L2233:
	mvz.b ls+1,%d0
	lea st+8,%a0
	move.l (%a0),ls+72
	move.l %d0,ls+68
	moveq #1,%d0
.L2232:
	mov3q.l #3,%d1
	and.l %d0,%d1
	move.l %d1,-(%sp)
	jsr ls_close
	jsr (%a2)
	addq.l #4,%sp
	jra .L2151
.L2292:
	moveq #2,%d0
	jra .L2232
.L2227:
	move.l %d4,%d0
	and.l #240,%d0
	tst.l %d0
	jeq .L2226
	cmp.l #128,%d2
	jeq .L2226
	move.l %d2,%d0
	mov3q.l #2,%d1
	add.l #-80,%d0
	cmp.l %d0,%d1
	jcc .L2226
	add.l #-64,%d0
	moveq #11,%d7
	cmp.l %d0,%d7
	jcc .L2226
	mov3q.l #4,-(%sp)
	jsr ls_close
	addq.l #4,%sp
	tst.l st+4
	jne .L2224
.L2226:
	move.l st+972,%d0
	tst.b ls.l
	jne .L2234
	moveq #68,%d1
	cmp.l %d2,%d1
	jne .L2234
	tst.l %d0
	jne .L2235
	tst.b sv.l
	jeq .L2224
	tst.b sv+8.l
	jeq .L2224
	move.b sv+10,%d6
	move.b sv+3,%d0
	or.l %d0,%d6
	tst.b %d6
	jne .L2224
	move.l ls+24,%d0
	mov3q.l #4,%d7
	addq.l #2,%d0
	cmp.l %d0,%d7
	jcs .L2224
	move.b sv+1,%d1
	move.b %d1,63(%sp)
	mvz.b %d1,%d1
	mvz.b 1093765506,%d0
	cmp.l %d1,%d0
	jne .L2224
	move.b sv+2,%d7
	mvz.b %d7,%d1
	move.l %d1,-(%sp)
	move.l %d1,58(%sp)
	jsr ls_banked
	addq.l #4,%sp
	move.l 54(%sp),%d1
	tst.l %d0
	jne .L2236
	moveq #45,%d0
	cmp.l %d1,%d0
	jeq .L2236
	moveq #43,%d0
	cmp.l %d1,%d0
	jne .L2224
.L2236:
	tst.l sq+408
	jeq .L2237
	tst.w sq+486.l
	jne .L2224
.L2237:
	move.l st+216,%d0
	or.l st+920,%d0
	or.l st+248,%d0
	btst #0,%d0
	jeq .L2224
	move.b 63(%sp),%d1
	move.b %d7,ls+2
	moveq #45,%d2
	move.b %d1,ls+1
	mvz.b %d7,%d1
	cmp.l %d1,%d2
	jeq .L2294
	moveq #43,%d4
	cmp.l %d1,%d4
	jne .L2238
.L2294:
	moveq #10,%d6
.L2238:
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
	jra .L2455
.L2234:
	tst.l %d0
	jeq .L2224
	move.l %d2,%d0
	mov3q.l #2,%d1
	add.l #-80,%d0
	cmp.l %d0,%d1
	jcc .L2224
	add.l #-64,%d0
	moveq #11,%d7
	cmp.l %d0,%d7
	jcc .L2224
.L2235:
	mov3q.l #4,-(%sp)
	move.l 32(%a3),-(%sp)
	jsr splash_end
	addq.l #8,%sp
	mov3q.l #5,%d0
	cmp.l %d6,%d0
	jcs .L2224
	or.l %d3,st+272
	jra .L2151
.L2224:
	move.l st+4,%d0
	tst.l sq+408
	jeq .L2239
	tst.l %d0
	jeq .L2240
	tst.l st+1058
	jne .L2241
.L2240:
	move.l %d2,%d1
	mov3q.l #2,%d6
	add.l #-80,%d1
	cmp.l %d1,%d6
	jcs .L2242
	move.l st+920,%d1
	move.l st+248,%d7
	move.l st+208,%d6
	or.l st+216,%d1
	move.l %d7,46(%sp)
	or.l st+240,%d6
	or.l %d7,%d1
	btst #0,%d1
	jeq .L2243
	move.l sq+484,%a0
	tst.l %d0
	jeq .L2295
	move.l st+232,%a1
.L2244:
	move.l %a0,%d7
	move.l %a1,%d1
	or.l %d7,%d1
	move.l %d1,%d7
	moveq #16,%d1
	mvz.w %d7,%d7
	and.l sq+500,%d1
	or.l %d7,%d1
	jne .L2246
	tst.l %d0
	jeq .L2243
	move.l 46(%sp),%d7
	btst #4,%d7
	jne .L2246
.L2243:
	move.l %d6,%d1
	or.l st+912,%d1
	move.w %d1,%ccr
	jeq .L2248
	tst.b u46+48.l
	jeq .L2249
.L2248:
	move.l sq+484,%a0
	tst.l %d0
	jeq .L2296
	move.l st+232,%d1
.L2250:
	move.l %a0,%d7
	or.l %d7,%d1
	tst.w %d1
	jeq .L2249
.L2246:
	or.l st+912,%d6
	move.w %d6,%ccr
	jeq .L2251
	tst.b u46+48.l
	jeq .L2252
.L2251:
	addq.l #1,u46+36
.L2252:
	tst.l %d0
	jeq .L2253
	move.l st+232,%d0
.L2253:
	move.l %a0,%d1
	or.l %d1,%d0
	move.l %d0,%d1
	mvz.w %d1,%d1
	tst.w %d0
	jeq .L2254
	moveq #80,%d4
	cmp.l %d2,%d4
	jeq .L2297
	moveq #82,%d5
	cmp.l %d2,%d5
	jne .L2298
	moveq #14,%d0
.L2255:
	move.l %d1,-(%sp)
	mov3q.l #1,-(%sp)
	mov3q.l #1,-(%sp)
	or.l %d3,st+272
	move.l %d0,-(%sp)
	jsr ed_queue
	jra .L2445
.L2295:
	sub.l %a1,%a1
	jra .L2244
.L2296:
	clr.l %d1
	jra .L2250
.L2254:
	moveq #80,%d6
	cmp.l %d2,%d6
	jeq .L2299
	moveq #82,%d7
	cmp.l %d2,%d7
	jne .L2300
	moveq #10,%d0
	jra .L2255
.L2297:
	moveq #13,%d0
	jra .L2255
.L2298:
	moveq #15,%d0
	jra .L2255
.L2299:
	moveq #9,%d0
	jra .L2255
.L2300:
	moveq #11,%d0
	jra .L2255
.L2289:
	cmp.l #132,%d2
	jne .L2256
	move.l st+216,%d0
	move.l %d0,%d1
	or.l st+920,%d1
	btst #0,%d1
	jeq .L2256
	moveq #16,%d1
	or.l %d0,%d1
	addq.l #1,ed+84
	move.l %d1,st+216
	jra .L2147
.L2257:
	move.l %d4,%d0
	and.l #240,%d0
	tst.l %d0
	jeq .L2259
	and.l #251,%d4
	cmp.l #128,%d4
	jeq .L2259
	moveq #48,%d7
	cmp.l %d2,%d7
	jne .L2260
.L2259:
	lea sq,%a0
	addq.l #1,sq+460
	cmp.l #128,%d2
	jne .L2261
	mov3q.l #1,%d0
	or.l %d0,st+920
.L2262:
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	jsr queue_key
	jsr flush
	addq.l #8,%sp
	cmp.l #128,%d2
	sne %d0
.L2459:
	mvs.b %d0,%d0
	neg.l %d0
	jra .L2145
.L2261:
	lea (121,%a6),%a6
	or.l %d3,(%a0,%a6.l*4)
	jra .L2262
.L2267:
	move.l %d2,%d0
	add.l #-66,%d0
	lsr.l #1,%d0
	jne .L2270
	move.l st+216,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #0,%d0
	jeq .L2269
	move.l masks,%d6
	cmp.l nk+20.l,%d6
	jeq .L2268
.L2269:
	cmp.l #181,%d2
	jne .L2274
	move.l st+216,%d0
	or.l st+248,%d0
	or.l st+920,%d0
	btst #0,%d0
	jeq .L2278
.L2274:
	tst.l mask_set
	jeq .L2279
	lea mask_keys,%a0
	move.l (%a0,%a6.l*4),%d0
	move.l 58(%sp),%d7
	btst %d7,%d0
	jeq .L2278
.L2279:
	cmp.l #128,%d2
	jne .L2441
	mov3q.l #2,%d4
	jra .L2280
.L2271:
	addq.l #1,nk+24
	jra .L2272
.L2301:
	mov3q.l #1,%d0
	jra .L2275
.L2442:
	move.l %d2,%d0
	mov3q.l #2,%d6
	add.l #-80,%d0
	cmp.l %d0,%d6
	jcs .L2269
.L2277:
	addq.l #1,st+944
.L2263:
	lea (50,%a6),%a6
	or.l %d3,(%a2,%a6.l*4)
	jra .L2147
.L2441:
	mov3q.l #1,%d4
.L2280:
	addq.l #1,st+936
	mov3q.l #2,%d1
	cmp.l %d4,%d1
	jne .L2282
	lea (226,%a6),%a6
	or.l %d3,(%a2,%a6.l*4)
.L2283:
	mov3q.l #1,-(%sp)
	move.l %d2,-(%sp)
	jsr queue_key
	jsr flush
	mov3q.l #2,%d2
	addq.l #8,%sp
	cmp.l %d4,%d2
	sne %d0
	jra .L2459
.L2282:
	or.l %d3,(%a2,%d5.l*4)
	jra .L2283
.L2270:
	moveq #69,%d0
	cmp.l %d2,%d0
	jne .L2442
	tst.l mask_set
	jeq .L2273
	lea mask_keys+8,%a0
	btst #5,3(%a0)
	jeq .L2274
.L2273:
	lea st+232,%a1
	clr.l %d1
	sub.l %a0,%a0
.L2276:
	tst.l (%a1)+
	jne .L2301
	tst.l 668(%a1)
	sne %d0
	mvs.b %d0,%d0
	neg.l %d0
.L2275:
	or.l %d0,%d1
	addq.l #1,%a0
	moveq #8,%d0
	cmp.l %a0,%d0
	jne .L2276
	move.l st+216,%d0
	mov3q.l #1,%d4
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d4,%d0
	or.l %d1,%d0
	jne .L2274
	moveq #32,%d5
	or.l %d5,st+240
	addq.l #1,st+936
	mov3q.l #1,nk
	jra .L2151
.L2266:
	moveq #69,%d1
	cmp.l %d2,%d1
	jeq .L2278
	add.l #-80,%d2
	mov3q.l #2,%d0
	cmp.l %d2,%d0
	jcc .L2277
.L2278:
	addq.l #1,st+940
	jra .L2263
.L2239:
	tst.l %d0
	jne .L2241
.L2260:
	tst.b sv.l
	jeq .L2241
	tst.b sv+10.l
	jne .L2241
	moveq #111,%d1
	cmp.l %d2,%d1
	jcc .L2263
	moveq #119,%d4
	cmp.l %d2,%d4
	jcs .L2241
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
	jra .L2450
.L2249:
	tst.l %d0
	jne .L2264
.L2256:
	tst.w sq+486.l
	jeq .L2257
	move.l %d2,%d0
	mov3q.l #5,%d6
	add.l #-48,%d0
	cmp.l %d0,%d6
	jcc .L2258
	moveq #16,%d7
	cmp.l %d2,%d7
	jeq .L2258
	add.l #-20,%d0
	mov3q.l #1,%d1
	cmp.l %d0,%d1
	jcc .L2258
	add.l #-44,%d0
	lsr.l #3,%d0
	jne .L2257
.L2258:
	lea (121,%a6),%a6
	or.l %d3,(%a5,%a6.l*4)
	addq.l #1,st+1054
.L2447:
	mov3q.l #1,-(%sp)
	jra .L2446
.L2242:
	tst.l %d0
	jeq .L2289
.L2241:
	move.l %d2,%d0
	moveq #11,%d6
	add.l #-144,%d0
	cmp.l %d0,%d6
	jcs .L2264
	moveq #64,%d0
	and.l st+248,%d0
	tst.l %d0
	jeq .L2264
	move.l tk+8,%d0
	tst.l %d0
	jne .L2264
.L2265:
	lea (%a4,%d0.l),%a0
	moveq #32,%d1
	move.l (%a0),68(%sp,%d0.l)
	addq.l #4,%d0
	cmp.l %d0,%d1
	jne .L2265
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
.L2264:
	tst.l st+4
	jeq .L2263
	tst.l st+1058
	jne .L2266
	moveq #68,%d7
	cmp.l %d2,%d7
	jne .L2267
	move.l st+216,%d0
	mov3q.l #1,%d1
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d1,%d0
	move.l st+232,%d1
	mvz.w %d1,%d1
	or.l %d1,%d0
	jeq .L2274
.L2268:
	addq.l #1,st+936
	moveq #68,%d7
	cmp.l %d2,%d7
	jne .L2271
	addq.l #1,nk+12
.L2272:
	or.l %d3,st+240
	jra .L2447
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
	jne .L2461
	tst.l sq+408
	jeq .L2462
	tst.w sq+486.l
	jeq .L2462
	mov3q.l #7,%d0
	cmp.l %a6,%d0
	jcs .L2462
	tst.b 20(%a0)
	jne .L2490
	move.l st+216,%d0
	mov3q.l #1,%d1
	or.l st+920,%d0
	and.l %d1,%d0
.L2463:
	add.l %d2,96(%a2,%a6.l*4)
	move.b %d0,st+160
	addq.l #1,sq+464
	jsr flush
.L2464:
	mov3q.l #1,%d2
	jra .L2467
.L2490:
	mov3q.l #1,%d0
	jra .L2463
.L2462:
	move.l %d2,-(%sp)
	move.l %a6,-(%sp)
	jsr ls_enc
	addq.l #8,%sp
	move.l %d0,%d2
	tst.l %d0
	jne .L2467
	moveq #8,%d3
	cmp.l %a6,%d3
	jne .L2466
	tst.b sv+8.l
	jeq .L2466
	move.l st+8,%a0
	addq.l #1,st+1086
	lea (47,%a0),%a0
	move.l %a0,st+1082
.L2466:
	tst.l st+972
	jeq .L2467
	mov3q.l #5,-(%sp)
	move.l 76(%sp),%a1
	move.l 32(%a1),-(%sp)
	jsr splash_end
	addq.l #8,%sp
.L2467:
	move.l -66650100,%d0
	addq.l #1,st+336
	sub.l 44(%sp),%d0
	add.l %d0,st+328
	cmp.l st+332.l,%d0
	jls .L2460
	move.l %d0,st+332
.L2460:
	move.l %d2,%d0
	movem.l (%sp),#23804
	lea (68,%sp),%sp
	rts
.L2461:
	tst.l st+1058
	jeq .L2468
	addq.l #1,st+952
.L2469:
	clr.l %d2
	jra .L2467
.L2468:
	tst.l mask_set
	jeq .L2470
	moveq #15,%d0
	cmp.l %a6,%d0
	jcs .L2471
	move.l mask_enc,%d0
	move.l %a6,%d1
	btst %d1,%d0
	jne .L2470
.L2471:
	addq.l #1,st+952
	moveq #8,%d3
	cmp.l %a6,%d3
	jne .L2469
	move.l st+8,%a0
	addq.l #1,st+1086
	lea (47,%a0),%a0
	move.l %a0,st+1082
	jra .L2469
.L2470:
	addq.l #1,st+948
	tst.b 20(%a0)
	jne .L2491
	move.l st+216,%d0
	mov3q.l #1,%d1
	or.l st+248,%d0
	or.l st+920,%d0
	and.l %d1,%d0
.L2473:
	move.b %d0,st+160
	moveq #15,%d3
	cmp.l %a6,%d3
	jcs .L2464
	move.l %a6,%d4
	add.l #24,%d4
	add.l %d2,(%a2,%d4.l*4)
	tst.l st+64
	jne .L2475
	move.l #-66650100,%a0
	move.l (%a0),st+64
.L2475:
	tst.l st+388
	jne .L2476
	move.l #-66650100,%a1
	lea commits,%a0
	move.l (%a1),st+388
	move.l (%a0),st+392
.L2476:
	move.l %a6,%d5
	add.l #122,%d5
	lea bind_gen,%a4
	move.l (%a4,%a6.l*4),%d6
	move.l (%a2,%d5.l*4),%a3
	cmp.l %d6,%a3
	jeq .L2479
	btst #0,%d6
	jne .L2479
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
	jne .L2479
	move.l %d3,%d0
	move.l %a6,%d1
	add.l #st+552,%d0
	add.l #102,%d1
	tst.l (%a2,%d1.l*4)
	jeq .L2492
	move.l %d0,%a1
	move.b 48(%sp),%d3
	move.b (%a1),%d1
	eor.l %d1,%d3
	tst.b %d3
	seq %d3
	mvs.b %d3,%d3
	neg.l %d3
.L2481:
	mov3q.l #5,-(%sp)
	move.l %d7,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a0)
	lea (12,%sp),%sp
	tst.l %d3
	jne .L2482
	lea (%a2,%a6.l),%a0
	move.b 49(%sp),472(%a0)
.L2482:
	move.l %d6,(%a2,%d5.l*4)
	move.l %d6,%a3
.L2479:
	tst.l %a3
	jeq .L2483
	move.l %a6,%d0
	moveq #20,%d3
	muls.l %d3,%d0
	lea (%a2,%d0.l),%a0
	mvz.b 552(%a0),%d1
	lsr.l #6,%d1
	jne .L2483
	lea (102,%a6),%a1
	add.l #st,%a6
	tst.l (%a2,%a1.l*4)
	jne .L2484
	move.b 553(%a0),472(%a6)
.L2484:
	move.l %d0,%a0
	add.l #st+556,%a0
	move.b (%a0),%d1
	mvz.b 472(%a6),%d3
	btst #0,%d1
	jeq .L2493
	tst.b st+160.l
	jne .L2494
.L2493:
	mov3q.l #1,%d1
.L2485:
	muls.l %d1,%d2
	move.l %d0,%a0
	add.l #st+554,%a0
	mvz.b (%a0),%d1
	add.l %d3,%d2
	cmp.l %d2,%d1
	jle .L2486
	move.l %d1,%d2
.L2486:
	move.l %d0,%a0
	add.l #st+555,%a0
	mvz.b (%a0),%d1
	cmp.l %d2,%d1
	jge .L2487
	move.l %d1,%d2
.L2487:
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
	jne .L2488
	move.l #-66650100,%a1
	move.l (%a1),st+368
.L2488:
	moveq #1,%d0
	move.l 72(%sp),%a1
	move.l 32(%a1),%a0
	move.b %d0,32(%a0)
.L2483:
	jsr flush
	tst.l (%a2,%d4.l*4)
	jne .L2464
	addq.l #1,st+384
	jra .L2464
.L2491:
	mov3q.l #1,%d0
	jra .L2473
.L2492:
	clr.l %d3
	jra .L2481
.L2494:
	moveq #8,%d1
	jra .L2485
	.size	rui_enc, .-rui_enc
	.align	2
	.globl	pj_write
	.type	pj_write, @function
pj_write:
	move.l 4(%sp),%d0
	move.l 8(%sp),%d1
	cmp.l #1074464814,%d0
	jeq .L2504
	cmp.l #1073958730,%d0
	jeq .L2504
	lea pj_push,%a0
	cmp.l #1074076072,%d0
	jne .L2506
	move.l %d1,-(%sp)
	mov3q.l #-1,-(%sp)
	mov3q.l #5,-(%sp)
.L2519:
	jsr (%a0)
	lea (12,%sp),%sp
.L2504:
	rts
.L2506:
	cmp.l #1074076390,%d0
	jeq .L2507
	cmp.l #1074076276,%d0
	jne .L2508
.L2507:
	move.l %d1,-(%sp)
	mov3q.l #-1,-(%sp)
	mov3q.l #3,-(%sp)
	jra .L2519
.L2508:
	cmp.l #1073959500,%d0
	jne .L2509
	mvz.b pj+137,%d0
	move.l %d1,-(%sp)
	move.l %d0,%a1
	pea -1(%a1)
	mov3q.l #2,-(%sp)
	jra .L2519
.L2509:
	move.l %d1,-(%sp)
	mov3q.l #-1,-(%sp)
	mov3q.l #7,-(%sp)
	jra .L2519
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
	jcs .L2523
	addq.l #1,%d0
.L2522:
	move.b %d0,pj+137
	rts
.L2523:
	clr.b %d0
	jra .L2522
	.size	pj_copy, .-pj_copy
	.align	2
	.globl	pj_save
	.type	pj_save, @function
pj_save:
	move.l 4(%sp),%d0
	tst.l %d0
	jlt .L2524
	move.b 1079807565,%d1
	move.l %d0,-(%sp)
	mvs.b %d1,%d1
	move.l %d1,-(%sp)
	mov3q.l #1,-(%sp)
	jsr pj_push
	lea (12,%sp),%sp
.L2524:
	rts
	.size	pj_save, .-pj_save
	.align	2
	.globl	pj_activate
	.type	pj_activate, @function
pj_activate:
	move.l 4(%sp),%d0
	tst.l %d0
	jlt .L2526
	move.l #1074457822,%d1
	cmp.l 8(%sp),%d1
	jne .L2526
	move.l #1074479198,%d1
	cmp.l 12(%sp),%d1
	jne .L2526
	move.l %d0,12(%sp)
	moveq #10,%d0
	mov3q.l #-1,8(%sp)
	move.l %d0,4(%sp)
	jra pj_push
.L2526:
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
	jge .L2529
	moveq #127,%d0
.L2530:
	move.l %d0,-(%sp)
	pea 65.w
	jsr pj_push
	lea (12,%sp),%sp
	rts
.L2529:
	tst.l %d0
	jge .L2530
	clr.l %d0
	jra .L2530
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
	.type	CSWTCH.542, @object
	.size	CSWTCH.542, 7
CSWTCH.542:
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
	.type	CSWTCH.540, @object
	.size	CSWTCH.540, 40
CSWTCH.540:
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
	.type	CSWTCH.483, @object
	.size	CSWTCH.483, 6
CSWTCH.483:
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
