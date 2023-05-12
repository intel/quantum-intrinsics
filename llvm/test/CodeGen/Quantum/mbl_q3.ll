;<--- 32-bit variant --->
; RUN: llc -march=quantum32 -filetype=asm %s -o - | FileCheck %s
; RUN: llc -march=quantum32 -filetype=obj %s -o %t 
; RUN: llvm-readelf -x .qbbs_text %t | FileCheck %s --check-prefix=QBBS_TEXT
; RUN: hexdump %t | FileCheck %s --check-prefix=FILE-OBJ

;<--- 64-bit variant --->
; RUN: llc -march=quantum64 -filetype=asm %s -o - | FileCheck %s
; RUN: llc -march=quantum64 -filetype=obj %s -o %t 
; RUN: llvm-readelf -x .qbbs_text %t | FileCheck %s --check-prefix=QBBS_TEXT

define dso_local void @_Z9mbl3_test.stub() #0 section ".qbbs_text" {
entry:
  call void @llvm.quantum.prepz.imm(i16 0, i32 1)
  call void @llvm.quantum.prepz.imm(i16 1, i32 0)
  call void @llvm.quantum.prepz.imm(i16 2, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 0, i16 1, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotz.imm(i16 0, double 0x4023208DCA464625, i32 0)
  call void @llvm.quantum.rotz.imm(i16 1, double 8.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotz.imm(i16 0, double 0x3FFB7812AEEF4459, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 1, i16 0, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotz.imm(i16 0, double 0x4025B2F8FE66442C, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 1, i16 0, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 0, i16 1, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotz.imm(i16 2, double 0x3FF6A4AADAA35752, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 1, i16 2, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotz.imm(i16 1, double 0x401C48122CADE12F, i32 0)
  call void @llvm.quantum.rotz.imm(i16 2, double 8.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotz.imm(i16 1, double 0x3FFB7812AEEF4459, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 2, i16 1, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotz.imm(i16 1, double 0x4025B2F8FE66442C, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 2, i16 1, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 1, i16 2, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 0, double 0x4013C9D45DCAC069, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x40142AD833D5964B, double 0.000000e+00, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 0, i32 0, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 1, i32 1, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 2, i32 2, i32 2)
  ret void
}

declare void @llvm.quantum.prepz.imm(i16 immarg, i32 immarg)

declare void @llvm.quantum.measz.imm.index(i16 immarg, i32 immarg, i32 immarg)

declare void @llvm.quantum.rotxy.imm(i16 immarg, double immarg, double immarg, i32 immarg) 

declare void @llvm.quantum.rotz.imm(i16 immarg, double immarg, i32 immarg) 

declare void @llvm.quantum.cphase.imm(i16 immarg, i16 immarg, double immarg, i32 immarg)

; CHECK:         .text
; CHECK:         .file   "mbl_q3.ll"
; CHECK:         .section        .qbbs_text,"ax",@progbits
; CHECK:         .globl  _Z9mbl3_test.stub    // -- Begin function _Z9mbl3_test.stub
; CHECK:         .type   _Z9mbl3_test.stub,@function
; CHECK: _Z9mbl3_test.stub:                   // @_Z9mbl3_test.stub
; CHECK: // %bb.0:                               // %entry
; CHECK:         quprep QUBIT[0] (slice_idx=1)
; CHECK:         quprep QUBIT[1] (slice_idx=0)
; CHECK:         quprep QUBIT[2] (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[0], QUBIT[1], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[0], 9.563582e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[1], 8.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[0], 1.716815e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[1], QUBIT[0], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[0], 1.084956e+01 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[1], QUBIT[0], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[0], QUBIT[1], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[2], 1.415202e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[1], QUBIT[2], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[1], 7.070382e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[2], 8.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[1], 1.716815e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[2], QUBIT[1], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotz QUBIT[1], 1.084956e+01 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[2], QUBIT[1], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK:         qucphase QUBIT[1], QUBIT[2], 3.141593e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[2], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[0], 4.947099e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qurotxy QUBIT[1], 5.041840e+00, 0.000000e+00 (slice_idx=0)
; CHECK:         qumeasz QUBIT[0] @shared_cbit_array[0] (slice_idx=0)
; CHECK:         qumeasz QUBIT[1] @shared_cbit_array[1] (slice_idx=0)
; CHECK:         qumeasz QUBIT[2] @shared_cbit_array[2] (slice_idx=2)
; CHECK:         return
; CHECK: .Lfunc_end0:
; CHECK:         .size   _Z9mbl3_test.stub, .Lfunc_end0-_Z9mbl3_test.stub
; CHECK:                                         // -- End function
; CHECK:         .section        ".note.GNU-stack","",@progbits

; QBBS_TEXT: Hex dump of section '.qbbs_text':
; QBBS_TEXT: 0x00000000 01010000 00000000 01000100 00000000 
; QBBS_TEXT: 0x00000010 01000200 00000000 02000000 ffff0000 
; QBBS_TEXT: 0x00000020 02000200 ffff0000 02000100 ff7fffbf 
; QBBS_TEXT: 0x00000030 05000000 0100ff7f 02000100 ff7fff3f 
; QBBS_TEXT: 0x00000040 03000000 0000a785 03000100 0000f245 
; QBBS_TEXT: 0x00000050 02000000 ff7fff3f 02000000 ffff0000 
; QBBS_TEXT: 0x00000060 03000000 0000f245 02000000 ff7fffbf 
; QBBS_TEXT: 0x00000070 05000100 0000ff7f 02000000 ff7fff3f 
; QBBS_TEXT: 0x00000080 03000000 00000cba 02000000 ff7fffbf 
; QBBS_TEXT: 0x00000090 05000100 0000ff7f 02000000 ff7fff3f 
; QBBS_TEXT: 0x000000a0 02000000 ff7fff3f 02000000 ffff0000 
; QBBS_TEXT: 0x000000b0 02000100 ff7fffbf 05000000 0100ff7f 
; QBBS_TEXT: 0x000000c0 02000100 ff7fff3f 03000200 0000a839 
; QBBS_TEXT: 0x000000d0 02000200 ff7fffbf 05000100 0200ff7f 
; QBBS_TEXT: 0x000000e0 02000200 ff7fff3f 03000100 00001220  
; QBBS_TEXT: 0x000000f0 03000200 0000f245 02000100 ff7fff3f 
; QBBS_TEXT: 0x00000100 02000100 ffff0000 03000100 0000f245 
; QBBS_TEXT: 0x00000110 02000100 ff7fffbf 05000200 0100ff7f 
; QBBS_TEXT: 0x00000120 02000100 ff7fff3f 03000100 00000cba 
; QBBS_TEXT: 0x00000130 02000100 ff7fffbf 05000200 0100ff7f 
; QBBS_TEXT: 0x00000140 02000100 ff7fff3f 02000100 ff7fff3f 
; QBBS_TEXT: 0x00000150 02000100 ffff0000 02000200 ff7fffbf 
; QBBS_TEXT: 0x00000160 05000100 0200ff7f 02000200 ff7fff3f 
; QBBS_TEXT: 0x00000170 02000000 1e930000 02000100 d79a0000 
; QBBS_TEXT: 0x00000180 06000000 00000000 06000101 00000000 
; QBBS_TEXT: 0x00000190 06020202 00000000 00030000 00000000 

;<--- 32-bit variant --->
; FILE-OBJ: 0000000 457f 464c 0101 0001 0000 0000 0000 0000
; FILE-OBJ: 0000010 0001 0104 0001 0000 0000 0000 0000 0000
; FILE-OBJ: 0000020 0254 0000 0000 0000 0034 0000 0000 0028
; FILE-OBJ: 0000030 0006 0001 0101 0000 0000 0000 0001 0001
; FILE-OBJ: 0000040 0000 0000 0001 0002 0000 0000 0002 0000
; FILE-OBJ: 0000050 ffff 0000 0002 0002 ffff 0000 0002 0001
; TODO - Check for off-by-one error. Alternate result (c000 vs bfff) -> 0000060 7fff c000 0305 0000 0001 7fff 0302 0001
; FILE-OBJ: 0000060 7fff bfff 0005 0000 0001 7fff 0002 0001
; FILE-OBJ: 0000070 7fff 3fff 0003 0000 0000 85a7 0003 0001
; TODO - Check for off-by-one error. Alternate result (45f3 vs 45f2) -> 0000080 0000 45f3 0302 0000 7fff 3fff 0302 0000
; FILE-OBJ: 0000080 0000 45f2 0002 0000 7fff 3fff 0002 0000
; TODO - Check for off-by-one error. Alternate result (45f3 vs 45f2) -> 0000090 ffff 0000 0303 0000 0000 45f3 0302 0000
; FILE-OBJ: 0000090 ffff 0000 0003 0000 0000 45f2 0002 0000
; TODO - Check for off-by-one error. Alternate result (c000 vs bfff) -> 00000a0 7fff c000 0305 0001 0000 7fff 0302 0000
; FILE-OBJ: 00000a0 7fff bfff 0005 0001 0000 7fff 0002 0000
; FILE-OBJ: 00000b0 7fff 3fff 0003 0000 0000 ba0c 0002 0000
; TODO - Check for off-by-one error. Alternate result (c000 vs bfff) -> 00000c0 7fff c000 0305 0001 0000 7fff 0302 0000
; FILE-OBJ: 00000c0 7fff bfff 0005 0001 0000 7fff 0002 0000
; FILE-OBJ: 00000d0 7fff 3fff 0002 0000 7fff 3fff 0002 0000
; TODO - Check for off-by-one error. Alternate result (c000 vs bfff) -> 00000e0 ffff 0000 0302 0001 7fff c000 0305 0000
; FILE-OBJ: 00000e0 ffff 0000 0002 0001 7fff bfff 0005 0000
; FILE-OBJ: 00000f0 0001 7fff 0002 0001 7fff 3fff 0003 0002
; TODO - Check for off-by-one error. Alternate result (c000 vs bfff and 39a9 vs 39a8) -> 0000100 0000 39a9 0302 0002 7fff c000 0305 0001
; FILE-OBJ: 0000100 0000 39a8 0002 0002 7fff bfff 0005 0001
; FILE-OBJ: 0000110 0002 7fff 0002 0002 7fff 3fff 0003 0001
; TODO - Check for off-by-one error. Alternate result (45f3 vs 45f2) -> 0000120 0000 2012 0303 0002 0000 45f3 0302 0001
; FILE-OBJ: 0000120 0000 2012 0003 0002 0000 45f2 0002 0001
; FILE-OBJ: 0000130 7fff 3fff 0002 0001 ffff 0000 0003 0001
; TODO - Check for off-by-one error. Alternate result (45f3 vs 45f2 and c000 vs bfff) -> 0000140 0000 45f3 0302 0001 7fff c000 0305 0002
; FILE-OBJ: 0000140 0000 45f2 0002 0001 7fff bfff 0005 0002
; FILE-OBJ: 0000150 0001 7fff 0002 0001 7fff 3fff 0003 0001
; TODO - Check for off-by-one error. Alternate result (c000 vs bfff) -> 0000160 0000 ba0c 0302 0001 7fff c000 0305 0002
; FILE-OBJ: 0000160 0000 ba0c 0002 0001 7fff bfff 0005 0002
; FILE-OBJ: 0000170 0001 7fff 0002 0001 7fff 3fff 0002 0001
; FILE-OBJ: 0000180 7fff 3fff 0002 0001 ffff 0000 0002 0002
; TODO - Check for off-by-one error. Alternate result (c000 vs bfff) -> 0000190 7fff c000 0305 0001 0002 7fff 0302 0002
; FILE-OBJ: 0000190 7fff bfff 0005 0001 0002 7fff 0002 0002
; TODO - Check for off-by-two error. Alternate result (9320 vs 931e) -> 00001a0 7fff 3fff 0302 0000 9320 0000 0302 0001
; FILE-OBJ: 00001a0 7fff 3fff 0002 0000 931e 0000 0002 0001
; TODO - Check for off-by-one error. Alternate result (9ad8 vs 9ad7) -> 00001b0 9ad8 0000 0306 0000 0000 0000 0306 0001
; FILE-OBJ: 00001b0 9ad7 0000 0006 0000 0000 0000 0006 0101
; FILE-OBJ: 00001c0 0000 0000 0206 0202 0000 0000 0300 0000
; FILE-OBJ: 00001d0 0000 0000 0000 0000 0000 0000 0000 0000
