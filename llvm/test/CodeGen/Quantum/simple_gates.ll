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

; Function Attrs: alwaysinline uwtable
define dso_local void @_Z14all_gates_testv.stub() #0 section ".qbbs_text" {
entry:
  call void @llvm.quantum.prepz.imm(i16 0, i32 1)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 1, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 2, double 0x400921FB54442EEA, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 3, double 0x3FE921FB54432708, double 0.000000e+00, i32 0)
  call void @llvm.quantum.rotz.imm(i16 4, double 0x3FD921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 6, double 0x3FF921FB5443D6F4, double 0x4012D97C7F330D32, i32 0)
  call void @llvm.quantum.cphase.imm(i16 5, i16 6, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.rotxy.imm(i16 6, double 0x3FF921FB5443D6F4, double 0x3FF921FB5443D6F4, i32 0)
  call void @llvm.quantum.cphase.imm(i16 6, i16 5, double 0x400921FB54442EEA, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 0, i32 0, i32 2)
  ret void
}

declare void @llvm.quantum.prepz.imm(i16 immarg, i32 immarg)

declare void @llvm.quantum.measz.imm.index(i16 immarg, i32 immarg, i32 immarg) 

declare void @llvm.quantum.rotxy.imm(i16 immarg, double immarg, double immarg, i32 immarg) 

declare void @llvm.quantum.rotz.imm(i16 immarg, double immarg, i32 immarg) 

declare void @llvm.quantum.cphase.imm(i16 immarg, i16 immarg, double immarg, i32 immarg)

; CHECK: 	.text
; CHECK: 	.file	"simple_gates.ll"
; CHECK: 	.section        .qbbs_text,"ax",@progbits
; CHECK: 	.globl	_Z14all_gates_testv.stub // -- Begin function _Z14all_gates_testv.stub
; CHECK: 	.type	_Z14all_gates_testv.stub,@function
; CHECK: _Z14all_gates_testv.stub:               // @_Z14all_gates_testv.stub
; CHECK: // %bb.0:                               // %entry
; CHECK: 	quprep QUBIT[0] (slice_idx=1)
; CHECK: 	qurotxy QUBIT[1], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK: 	qurotxy QUBIT[1], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK: 	qurotxy QUBIT[2], 3.141593e+00, 0.000000e+00 (slice_idx=0)
; CHECK: 	qurotxy QUBIT[3], 7.853982e-01, 0.000000e+00 (slice_idx=0)
; CHECK: 	qurotz QUBIT[4], 3.926991e-01 (slice_idx=0)
; CHECK: 	qurotxy QUBIT[6], 1.570796e+00, 4.712389e+00 (slice_idx=0)
; CHECK: 	qucphase QUBIT[5], QUBIT[6], 3.141593e+00 (slice_idx=0)
; CHECK: 	qurotxy QUBIT[6], 1.570796e+00, 1.570796e+00 (slice_idx=0)
; CHECK: 	qucphase QUBIT[6], QUBIT[5], 3.141593e+00 (slice_idx=0)
; CHECK: 	qumeasz QUBIT[0] @shared_cbit_array[0] (slice_idx=2)
; CHECK: 	return
; CHECK: .Lfunc_end0:
; CHECK: 	.size	_Z14all_gates_testv.stub, .Lfunc_end0-_Z14all_gates_testv.stub
; CHECK:                                         // -- End function
; CHECK: 	.section	".note.GNU-stack","",@progbits

; QBBS_TEXT: Hex dump of section '.qbbs_text':
; QBBS_TEXT: 0x00000000 01010000 00000000 02000100 ff7fff3f 
; QBBS_TEXT: 0x00000010 02000100 ffff0000 02000200 ffff0000 
; QBBS_TEXT: 0x00000020 02000300 ff3f0000 03000400 0000ff0f 
; QBBS_TEXT: 0x00000030 02000600 ff7fffbf 05000500 0600ff7f 
; QBBS_TEXT: 0x00000040 02000600 ff7fff3f 05000600 0500ff7f 
; QBBS_TEXT: 0x00000050 06020000 00000000 00030000 00000000 

; FILE-OBJ-32: 0000000 457f 464c 0101 0001 0000 0000 0000 0000
; FILE-OBJ-32: 0000010 0001 0104 0001 0000 0000 0000 0000 0000
; FILE-OBJ-32: 0000020 0120 0000 0000 0000 0034 0000 0000 0028
; FILE-OBJ-32: 0000030 0006 0001 0101 0000 0000 0000 0002 0001
; FILE-OBJ-32: 0000040 7fff 3fff 0002 0001 ffff 0000 0002 0002
; FILE-OBJ-32: 0000050 ffff 0000 0002 0003 3fff 0000 0003 0004
; TODO - Check for off-by-one error. Alternate result (c000 vs bfff)
; FILE-OBJ-32: 0000060 0000 0fff 0002 0006 7fff bfff 0005 0005
; FILE-OBJ-32: 0000070 0006 7fff 0002 0006 7fff 3fff 0005 0006
; FILE-OBJ-32: 0000080 0005 7fff 0206 0000 0000 0000 0300 0000
; FILE-OBJ-32: 0000090 0000 0000 0000 0000 0000 0000 0000 0000

; FILE-OBJ-64: 0000000 457f 464c 0102 0001 0000 0000 0000 0000
; FILE-OBJ-64: 0000010 0001 0104 0001 0000 0000 0000 0000 0000
; FILE-OBJ-64: 0000020 0000 0000 0000 0000 0148 0000 0000 0000
; FILE-OBJ-64: 0000030 0000 0000 0040 0000 0000 0040 0006 0001
; FILE-OBJ-64: 0000040 0101 0000 0000 0000 0002 0001 7fff 3fff
; FILE-OBJ-64: 0000050 0002 0001 ffff 0000 0002 0002 ffff 0000
; FILE-OBJ-64: 0000060 0002 0003 3fff 0000 0003 0004 0000 0fff
; FILE-OBJ-64: 0000070 0002 0006 7fff bfff 0005 0005 0006 7fff
; FILE-OBJ-64: 0000080 0002 0006 7fff 3fff 0005 0006 0005 7fff
; FILE-OBJ-64: 0000090 0206 0000 0000 0000 0300 0000 0000 0000
; FILE-OBJ-64: 00000a0 0000 0000 0000 0000 0000 0000 0000 0000
