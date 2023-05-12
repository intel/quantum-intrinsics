;<--- 32-bit variant --->
; RUN: llc -march=quantum32 -filetype=asm %s -o - | FileCheck %s
; RUN: llc -march=quantum32 -filetype=obj %s -o %t
; RUN: file %t | FileCheck %s --check-prefix=FILE-TYPE-32
; RUN: llvm-readelf -x .qbbs_text %t | FileCheck %s --check-prefix=QBBS_TEXT
; RUN: hexdump %t | FileCheck %s --check-prefix=FILE-OBJ-32

;<--- 64-bit variant --->
; RUN: llc -march=quantum64 -filetype=asm %s -o - | FileCheck %s
; RUN: llc -march=quantum64 -filetype=obj %s -o %t 
; RUN: file %t | FileCheck %s --check-prefix=FILE-TYPE-64
; RUN: llvm-readelf -x .qbbs_text %t | FileCheck %s --check-prefix=QBBS_TEXT
; RUN: hexdump %t | FileCheck %s --check-prefix=FILE-OBJ-64

define dso_local void @_Z9ghz_minus.stub() local_unnamed_addr #0 section ".qbbs_text" {
entry:
  call void @llvm.quantum.prepz.imm(i16 0, i32 1)

  call void @llvm.quantum.prepz.imm(i16 1, i32 0)

  call void @llvm.quantum.rotxy.imm(i16 0, double 0x400921FB54442EEA, double 0.000000e+00, i32 0) 

  call void @llvm.quantum.rotxy.imm(i16 0, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0) 

  call void @llvm.quantum.rotxy.imm(i16 0, double 0x400921FB54442EEA, double 0.000000e+00, i32 0) 

  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0) 

  call void @llvm.quantum.cphase.imm(i16 0, i16 1, double 0x400921FB54442EEA, i32 0) 

  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0) 

  call void @llvm.quantum.measz.imm.index(i16 0, i32 0, i32 0)

  call void @llvm.quantum.measz.imm.index(i16 1, i32 1, i32 2)

  ret void
}

;;NOTE-04/14/2022 DEPRECATED QUPREP ; declare void @llvm.quantum.prepz(i16, i32 immarg)
declare void @llvm.quantum.prepz.imm(i16 immarg, i32 immarg)

;;NOTE-04/14/2022 DEPRECATED QUROTXY ; declare void @llvm.quantum.rotxy(i16, double immarg, double immarg, i32 immarg)
declare void @llvm.quantum.rotxy.imm(i16 immarg, double immarg, double immarg, i32 immarg)

;;NOTE-04/14/2022 DEPRECATED MEASZ ; declare i1 @llvm.quantum.measz(i16, i32 immarg)
declare void @llvm.quantum.measz.imm.index(i16 immarg, i32 immarg, i32 immarg)

;;NOTE-04/14/2022 DEPRECATED QUCPHASE ; declare void @llvm.quantum.cphase(i16, i16, double immarg, i32 immarg)
declare void @llvm.quantum.cphase.imm(i16 immarg, i16 immarg, double immarg, i32 immarg)

; CHECK:         .text
; CHECK:         .file   "ghz_minus.ll"
; CHECK:         .section        .qbbs_text,"ax",@progbits
; CHECK: .globl  _Z9ghz_minus.stub     // -- Begin function _Z9ghz_minus.stub
; CHECK:         .type   _Z9ghz_minus.stub,@function
; CHECK: _Z9ghz_minus.stub:                    // @_Z9ghz_minus.stub
; CHECK: // %bb.0:                               // %entry
; CHECK:         quprep QUBIT[0] (slice_idx=1)
; CHECK:         quprep QUBIT[1] (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[0], QUBIT[1], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qumeasz QUBIT[0] @shared_cbit_array[0] (slice_idx=0)
; CHECK:         qumeasz QUBIT[1] @shared_cbit_array[1] (slice_idx=2)
; CHECK:         return
; CHECK: .Lfunc_end0:
; CHECK:         size   _Z9ghz_minus.stub, .Lfunc_end0-_Z9ghz_minus.stub
; CHECK:                                         // -- End function
; CHECK:         .section        ".note.GNU-stack","",@progbits

; FILE-TYPE-32: ELF 32-bit LSB relocatable
; FILE-TYPE-64: ELF 64-bit LSB relocatable

; QBBS_TEXT: Hex dump of section '.qbbs_text':
; QBBS_TEXT: 0x00000000 01010000 00000000 01000100 00000000 
; QBBS_TEXT: 0x00000010 02000000 ffff0000 02000000 ff7fff3f 
; QBBS_TEXT: 0x00000020 02000000 ffff0000 02000100 ff7fffbf 
; QBBS_TEXT: 0x00000030 05000000 0100ff7f 02000100 ff7fff3f 
; QBBS_TEXT: 0x00000040 06000000 00000000 06020101 00000000 
; QBBS_TEXT: 0x00000050 00030000 00000000                   

;<--- 32-bit variant --->
; FILE-OBJ-32: 0000000 457f 464c 0101 0001 0000 0000 0000 0000
; NOTE - EM_QUANTUM = 260
; FILE-OBJ-32: 0000010 0001 0104 0001 0000 0000 0000 0000 0000
; FILE-OBJ-32: 0000020 0110 0000 0000 0000 0034 0000 0000 0028
; FILE-OBJ-32: 0000030 0006 0001 0101 0000 0000 0000 0001 0001
; FILE-OBJ-32: 0000040 0000 0000 0002 0000 ffff 0000 0002 0000
; FILE-OBJ-32: 0000050 7fff 3fff 0002 0000 ffff 0000 0002 0001
; TODO - Check for off-by-one error. Alternate result (c000 vs bfff) -> 0000060 7fff c000 0305 0000 0001 7fff 0302 0001
; FILE-OBJ-32: 0000060 7fff bfff 0005 0000 0001 7fff 0002 0001
; FILE-OBJ-32: 0000070 7fff 3fff 0006 0000 0000 0000 0206 0101
; FILE-OBJ-32: 0000080 0000 0000 0300 0000 0000 0000 0000 0000

;<--- 64-bit variant --->
; FILE-OBJ-64: 0000000 457f 464c 0102 0001 0000 0000 0000 0000
; NOTE - EM_QUANTUM = 260
; FILE-OBJ-64: 0000010 0001 0104 0001 0000 0000 0000 0000 0000
; FILE-OBJ-64: 0000020 0000 0000 0000 0000 0138 0000 0000 0000
; FILE-OBJ-64: 0000030 0000 0000 0040 0000 0000 0040 0006 0001
; FILE-OBJ-64: 0000040 0101 0000 0000 0000 0001 0001 0000 0000
; FILE-OBJ-64: 0000050 0002 0000 ffff 0000 0002 0000 7fff 3fff
; FILE-OBJ-64: 0000060 0002 0000 ffff 0000 0002 0001 7fff bfff
; FILE-OBJ-64: 0000070 0005 0000 0001 7fff 0002 0001 7fff 3fff
; FILE-OBJ-64: 0000080 0006 0000 0000 0000 0206 0101 0000 0000
; FILE-OBJ-64: 0000090 0300 0000 0000 0000 0000 0000 0000 0000
; FILE-OBJ-64: 00000a0 0000 0000 0000 0000 0000 0000 0000 0000
