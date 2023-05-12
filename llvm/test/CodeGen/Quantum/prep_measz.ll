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

define void @_Z5test_func() #0 section ".qbbs_text" {
entry:
  call void @llvm.quantum.prepz.imm(i16 1, i32 1)
  call void @llvm.quantum.prepz.imm(i16 2, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 1, i32 0, i32 0)
  call void @llvm.quantum.measz.imm.index(i16 2, i32 1, i32 2)

  ret void
}

declare void @llvm.quantum.prepz.imm(i16 immarg, i32 immarg)
declare void @llvm.quantum.measz.imm.index(i16 immarg, i32 immarg, i32 immarg)

attributes #0 = { alwaysinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

; CHECK:         .text
; CHECK:         .file   "prep_measz.ll"
; CHECK:         .section        .qbbs_text,"ax",@progbits
; CHECK:         .globl  _Z5test_func           // -- Begin function _Z5test_func
; CHECK:         .type   _Z5test_func,@function
; CHECK: _Z5test_func:                          // @_Z5test_func
; CHECK: // %bb.0:                               // %entry
; CHECK:         quprep QUBIT[1] (slice_idx=1)
; CHECK:         quprep QUBIT[2] (slice_idx=0)
; CHECK:         qumeasz QUBIT[1] @shared_cbit_array[0] (slice_idx=0)
; CHECK:         qumeasz QUBIT[2] @shared_cbit_array[1] (slice_idx=2)
; CHECK:         return
; CHECK: .Lfunc_end0:
; CHECK:         .size   _Z5test_func, .Lfunc_end0-_Z5test_func
; CHECK:                                         // -- End function
; CHECK:         .section        ".note.GNU-stack","",@progbits

; FILE-TYPE-32: ELF 32-bit LSB relocatable
; FILE-TYPE-64: ELF 64-bit LSB relocatable

; QBBS_TEXT: Hex dump of section '.qbbs_text':
; QBBS_TEXT: 0x00000000 01010100 00000000 01000200 00000000 
; QBBS_TEXT: 0x00000010 06000100 00000000 06020201 00000000 
; QBBS_TEXT: 0x00000020 00030000 00000000                   

;<--- 32-bit variant --->
; FILE-OBJ-32: 0000000 457f 464c 0101 0001 0000 0000 0000 0000
; FILE-OBJ-32: 0000010 0001 0104 0001 0000 0000 0000 0000 0000
; FILE-OBJ-32: 0000020 00dc 0000 0000 0000 0034 0000 0000 0028
; FILE-OBJ-32: 0000030 0006 0001 0101 0001 0000 0000 0001 0002
; FILE-OBJ-32: 0000040 0000 0000 0006 0001 0000 0000 0206 0102
; FILE-OBJ-32: 0000050 0000 0000 0300 0000 0000 0000 0000 0000
; FILE-OBJ-32: 0000060 0000 0000 0000 0000 0000 0000 0012 0000

;<--- 64-bit variant --->
; FILE-OBJ-64: 0000000 457f 464c 0102 0001 0000 0000 0000 0000
; FILE-OBJ-64: 0000010 0001 0104 0001 0000 0000 0000 0000 0000
; FILE-OBJ-64: 0000020 0000 0000 0000 0000 0100 0000 0000 0000
; FILE-OBJ-64: 0000030 0000 0000 0040 0000 0000 0040 0006 0001
; FILE-OBJ-64: 0000040 0101 0001 0000 0000 0001 0002 0000 0000
; FILE-OBJ-64: 0000050 0006 0001 0000 0000 0206 0102 0000 0000
; FILE-OBJ-64: 0000060 0300 0000 0000 0000 0000 0000 0000 0000
; FILE-OBJ-64: 0000070 0000 0000 0000 0000 0000 0000 0000 0000
