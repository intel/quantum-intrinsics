;<--- 32-bit variant --->
; RUN: llc -march=quantum32 -filetype=asm %s -o - | FileCheck %s
; RUN: llc -march=quantum32 -filetype=obj %s -o %t 
; RUN: llvm-readelf -x .qbbs_text %t | FileCheck %s --check-prefix=QBBS_TEXT
; RUN: hexdump %t | FileCheck %s --check-prefix=FILE-OBJ-32

;<--- 64-bit variant --->
; RUN: llc -march=quantum64 -filetype=asm %s -o - | FileCheck %s
; RUN: llc -march=quantum64 -filetype=obj %s -o %t 
; RUN: llvm-readelf -x .qbbs_text %t | FileCheck %s --check-prefix=QBBS_TEXT
; RUN: hexdump %t | FileCheck %s --check-prefix=FILE-OBJ-64

define dso_local void @_Z10angle_test.stub() local_unnamed_addr #0 section ".qbbs_text" {
entry:
  call void @llvm.quantum.prepz.imm(i16 0, i32 1)
  call void @llvm.quantum.prepz.imm(i16 1, i32 0)
  call void @llvm.quantum.rotz.imm(i16 0, double 0x400921FB5444261E, i32 0)
  call void @llvm.quantum.rotz.imm(i16 0, double 3.141590e+00, i32 0)
  call void @llvm.quantum.rotz.imm(i16 1, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotz.imm(i16 1, double 0x3FF921FB5444261E, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 0, i32 0, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 1, i32 1, i32 2)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.quantum.prepz.imm(i16 immarg, i32 immarg)

; Function Attrs: nounwind
declare void @llvm.quantum.measz.imm.index(i16 immarg, i32 immarg, i32 immarg) 

; Function Attrs: nounwind
declare void @llvm.quantum.rotz.imm(i16 immarg, double immarg, i32 immarg) 

; CHECK:         .text
; CHECK:         .file   "qurotz_angle_conversion.ll"
; CHECK:         .section        .qbbs_text,"ax",@progbits
; CHECK:         .globl  _Z10angle_test.stub   // -- Begin function _Z10angle_test.stub
; CHECK:         .type   _Z10angle_test.stub,@function
; CHECK: _Z10angle_test.stub:                  // @_Z10angle_test.stub
; CHECK: // %bb.0:                               // %entry
; CHECK:         quprep QUBIT[0] (slice_idx=1)
; CHECK:         quprep QUBIT[1] (slice_idx=0)
; CHECK:         qurotz QUBIT[0], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[0], 3.141590e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[1], 0.000000e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[1], 1.570796e+00 (slice_idx=0)
; CHECK:         qumeasz QUBIT[0] @shared_cbit_array[0] (slice_idx=0)
; CHECK:         qumeasz QUBIT[1] @shared_cbit_array[1] (slice_idx=2)
; CHECK:         return
; CHECK: .Lfunc_end0:
; CHECK:         .size   _Z10angle_test.stub, .Lfunc_end0-_Z10angle_test.stub
; CHECK:                                         // -- End function
; CHECK:         .section        ".note.GNU-stack","",@progbits

; QBBS_TEXT: Hex dump of section '.qbbs_text':
; QBBS_TEXT: 0x00000000 01010000 00000000 01000100 00000000 
; QBBS_TEXT: 0x00000010 03000000 0000ff7f 03000000 0000ff7f 
; QBBS_TEXT: 0x00000020 03000100 00000000 03000100 0000ff3f 
; QBBS_TEXT: 0x00000030 06000000 00000000 06020101 00000000 
; QBBS_TEXT: 0x00000040 00030000 00000000                   

;<--- 32-bit variant --->
; FILE-OBJ-32: 0000000 457f 464c 0101 0001 0000 0000 0000 0000
; FILE-OBJ-32: 0000010 0001 0104 0001 0000 0000 0000 0000 0000
; FILE-OBJ-32: 0000020 0110 0000 0000 0000 0034 0000 0000 0028
; FILE-OBJ-32: 0000030 0006 0001 0101 0000 0000 0000 0001 0001
; FILE-OBJ-32: 0000040 0000 0000 0003 0000 0000 7fff 0003 0000
; FILE-OBJ-32: 0000050 0000 7fff 0003 0001 0000 0000 0003 0001
; FILE-OBJ-32: 0000060 0000 3fff 0006 0000 0000 0000 0206 0101
; FILE-OBJ-32: 0000070 0000 0000 0300 0000 0000 0000 0000 0000

;<--- 64-bit variant --->
; FILE-OBJ-64: 0000000 457f 464c 0102 0001 0000 0000 0000 0000
; FILE-OBJ-64: 0000010 0001 0104 0001 0000 0000 0000 0000 0000
; FILE-OBJ-64: 0000020 0000 0000 0000 0000 0138 0000 0000 0000
; FILE-OBJ-64: 0000030 0000 0000 0040 0000 0000 0040 0006 0001
; FILE-OBJ-64: 0000040 0101 0000 0000 0000 0001 0001 0000 0000
; FILE-OBJ-64: 0000050 0003 0000 0000 7fff 0003 0000 0000 7fff
; FILE-OBJ-64: 0000060 0003 0001 0000 0000 0003 0001 0000 3fff
; FILE-OBJ-64: 0000070 0006 0000 0000 0000 0206 0101 0000 0000
; FILE-OBJ-64: 0000080 0300 0000 0000 0000 0000 0000 0000 0000
; FILE-OBJ-64: 0000090 0000 0000 0000 0000 0000 0000 0000 0000
