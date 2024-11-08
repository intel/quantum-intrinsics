;<--- 32-bit variant --->
; RUN: llc -march=quantum32 -filetype=asm %s -o - | FileCheck %s
;<--- 64-bit variant --->
; RUN: llc -march=quantum64 -filetype=asm %s -o - | FileCheck %s

define dso_local void @_Z9mbl7_test.stub() #0 section ".qbbs_text" {
entry:
  call void @llvm.quantum.prepz.imm(i16 0, i32 1)
  call void @llvm.quantum.prepz.imm(i16 1, i32 0)
  call void @llvm.quantum.prepz.imm(i16 2, i32 0)
  call void @llvm.quantum.prepz.imm(i16 3, i32 0)
  call void @llvm.quantum.prepz.imm(i16 4, i32 0)
  call void @llvm.quantum.prepz.imm(i16 5, i32 0)
  call void @llvm.quantum.prepz.imm(i16 6, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 0, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 4, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 6, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 0, i16 1, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 3, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 2, i16 3, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 3, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 5, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 4, i16 5, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 5, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotz.imm(i16 6, double 0x4027B0228ED0F7FD, i32 0)
  call void @llvm.quantum.rotz.imm(i16 0, double 0x4023208DCA464625, i32 0)
  call void @llvm.quantum.rotz.imm(i16 1, double 8.000000e+00, i32 0)
  call void @llvm.quantum.rotz.imm(i16 2, double 0x3FF6A4AADAA35752, i32 0)
  call void @llvm.quantum.rotz.imm(i16 3, double 8.000000e+00, i32 0)
  call void @llvm.quantum.rotz.imm(i16 4, double 0x40225AB85AA5E40E, i32 0)
  call void @llvm.quantum.rotz.imm(i16 5, double 8.000000e+00, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 0, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 4, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 4, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)

  call void @llvm.quantum.rotz.imm(i16 0, double 0x3FFB7812AEEF4459, i32 0)
  call void @llvm.quantum.rotz.imm(i16 2, double 0x3FFB7812AEEF4459, i32 0)
  call void @llvm.quantum.rotz.imm(i16 4, double 0x3FFB7812AEEF4459, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 0, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 1, i16 0, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 3, i16 2, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 4, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 5, i16 4, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 4, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotz.imm(i16 0, double 0x4025B2F8FE66442C, i32 0)
  call void @llvm.quantum.rotz.imm(i16 2, double 0x4025B2F8FE66442C, i32 0)
  call void @llvm.quantum.rotz.imm(i16 4, double 0x4025B2F8FE66442C, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 0, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 1, i16 0, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 3, i16 2, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 4, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 5, i16 4, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 4, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 0, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 4, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 4, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 0, i16 1, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 3, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 2, i16 3, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 3, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 5, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 4, i16 5, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 5, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 0, double 0x4013C9D45DCAC069, double 0.000000e+00, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 1, i16 2, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 4, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 3, i16 4, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 4, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 6, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 5, i16 6, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 6, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotz.imm(i16 1, double 0x401C48122CADE12F, i32 0)
  call void @llvm.quantum.rotz.imm(i16 2, double 8.000000e+00, i32 0)
  call void @llvm.quantum.rotz.imm(i16 3, double 0x3FFE7C72183E883B, i32 0)
  call void @llvm.quantum.rotz.imm(i16 4, double 8.000000e+00, i32 0)
  call void @llvm.quantum.rotz.imm(i16 5, double 0x4018F92744F1072F, i32 0)
  call void @llvm.quantum.rotz.imm(i16 6, double 8.000000e+00, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 3, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 3, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 5, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 5, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)

  call void @llvm.quantum.rotz.imm(i16 1, double 0x3FFB7812AEEF4459, i32 0)
  call void @llvm.quantum.rotz.imm(i16 3, double 0x3FFB7812AEEF4459, i32 0)
  call void @llvm.quantum.rotz.imm(i16 5, double 0x3FFB7812AEEF4459, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 2, i16 1, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 3, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 4, i16 3, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 3, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 5, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 6, i16 5, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 5, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotz.imm(i16 1, double 0x4025B2F8FE66442C, i32 0)
  call void @llvm.quantum.rotz.imm(i16 3, double 0x4025B2F8FE66442C, i32 0)
  call void @llvm.quantum.rotz.imm(i16 5, double 0x4025B2F8FE66442C, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 2, i16 1, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 3, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 4, i16 3, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 3, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 5, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 6, i16 5, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 5, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 3, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 3, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 5, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 5, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 1, i16 2, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 4, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 3, i16 4, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 4, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 6, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 5, i16 6, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 6, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 1, double 0x40142AD833D5964B, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF412DB519D4FE8, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 3, double 0x4028C148BD7CD19C, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 4, double 0x40206E02BC4AC2D2, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 5, double 0x4024EA7BEB762BBB, double 0.000000e+00, i32 0)

  call void @llvm.quantum.measz.imm.index(i16 0, i32 0, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 1, i32 1, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 2, i32 2, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 3, i32 3, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 4, i32 4, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 5, i32 5, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 6, i32 6, i32 2)
  ret void
}

declare void @llvm.quantum.prepz.imm(i16 immarg, i32 immarg)

declare void @llvm.quantum.measz.imm.index(i16 immarg, i32 immarg, i32 immarg)

declare void @llvm.quantum.rotxy.imm(i16 immarg, double immarg, double immarg, i32 immarg) 

declare void @llvm.quantum.rotz.imm(i16 immarg, double immarg, i32 immarg) 

declare void @llvm.quantum.cphase.imm(i16 immarg, i16 immarg, double immarg, i32 immarg)

; CHECK:         .text
; CHECK:         .file   "mbl_q7.ll"
; CHECK:         .section        .qbbs_text,"ax",@progbits
; CHECK:         .globl  _Z9mbl7_test.stub // -- Begin function _Z9mbl7_test.stub
; CHECK:         .type   _Z9mbl7_test.stub,@function
; CHECK: _Z9mbl7_test.stub:               // @_Z9mbl7_test.stub
; CHECK: // %bb.0:                               // %entry
; CHECK:         quprep QUBIT[0] (slice_idx=1)
; CHECK:         quprep QUBIT[1] (slice_idx=0)
; CHECK:         quprep QUBIT[2] (slice_idx=0)
; CHECK:         quprep QUBIT[3] (slice_idx=0)
; CHECK:         quprep QUBIT[4] (slice_idx=0)
; CHECK:         quprep QUBIT[5] (slice_idx=0)
; CHECK:         quprep QUBIT[6] (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[6], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[0], QUBIT[1], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[3], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[2], QUBIT[3], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[3], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[5], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[4], QUBIT[5], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[5], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[6], 1.184401e+01 (slice_idx=0)
; CHECK:         qurotz QUBIT[0], 9.563582e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[1], 8.000000e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[2], 1.415202e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[3], 8.000000e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[4], 9.177188e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[5], 8.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[0], 1.716815e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[2], 1.716815e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[4], 1.716815e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[1], QUBIT[0], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[3], QUBIT[2], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[5], QUBIT[4], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[0], 1.084956e+01 (slice_idx=0)
; CHECK:         qurotz QUBIT[2], 1.084956e+01 (slice_idx=0)
; CHECK:         qurotz QUBIT[4], 1.084956e+01 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[1], QUBIT[0], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[3], QUBIT[2], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[5], QUBIT[4], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[0], QUBIT[1], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[3], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[2], QUBIT[3], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[3], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[5], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[4], QUBIT[5], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[5], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 4.947099e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[1], QUBIT[2], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[3], QUBIT[4], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[6], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[5], QUBIT[6], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[6], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[1], 7.070382e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[2], 8.000000e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[3], 1.905382e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[4], 8.000000e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[5], 6.243314e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[6], 8.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[3], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[3], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[5], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[5], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[1], 1.716815e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[3], 1.716815e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[5], 1.716815e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[2], QUBIT[1], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[3], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[4], QUBIT[3], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[3], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[5], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[6], QUBIT[5], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[5], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[1], 1.084956e+01 (slice_idx=0)
; CHECK:         qurotz QUBIT[3], 1.084956e+01 (slice_idx=0)
; CHECK:         qurotz QUBIT[5], 1.084956e+01 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[2], QUBIT[1], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[3], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[4], QUBIT[3], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[3], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[5], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[6], QUBIT[5], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[5], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[3], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[3], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[5], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[5], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[1], QUBIT[2], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[3], QUBIT[4], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[6], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[5], QUBIT[6], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[6], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 5.041840e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.254604e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[3], 1.237751e+01, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[4], 8.214865e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[5], 1.045798e+01, 0.000000e+00 (slice_idx=0)
; CHECK:         qumeasz QUBIT[0] @shared_cbit_array[0] (slice_idx=0)
; CHECK:         qumeasz QUBIT[1] @shared_cbit_array[1] (slice_idx=0)
; CHECK:         qumeasz QUBIT[2] @shared_cbit_array[2] (slice_idx=0)
; CHECK:         qumeasz QUBIT[3] @shared_cbit_array[3] (slice_idx=0)
; CHECK:         qumeasz QUBIT[4] @shared_cbit_array[4] (slice_idx=0)
; CHECK:         qumeasz QUBIT[5] @shared_cbit_array[5] (slice_idx=0)
; CHECK:         qumeasz QUBIT[6] @shared_cbit_array[6] (slice_idx=2)
; CHECK:         return
; CHECK: .Lfunc_end0:
; CHECK:         .size   _Z9mbl7_test.stub, .Lfunc_end0-_Z9mbl7_test.stub
; CHECK:                                         // -- End function
; CHECK:         .section        ".note.GNU-stack","",@progbits
