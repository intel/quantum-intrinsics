; RUN: llc -march=quantum64 -filetype=asm %s -o - | FileCheck %s
; RUN: llc -march=quantum64 -filetype=obj %s -o %t 
; RUN: llvm-readelf -x .qbbs_text %t | FileCheck %s --check-prefix=QBBS_TEXT

; ModuleID = '../clang/test/Quantum/empty_quantum_kernels.cpp'
source_filename = "../clang/test/Quantum/empty_quantum_kernels.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local void @_Z5test1v.stub() local_unnamed_addr #0 section ".qbbs_text" {
entry:
  ret void
}

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0"}

; CHECK:         .text
; CHECK:         .file   "empty_quantum_kernels.cpp"
; CHECK:         .section        .qbbs_text,"ax",@progbits
; CHECK:         .globl  _Z5test1v.stub          // -- Begin function _Z5test1v.stub
; CHECK:         .type   _Z5test1v.stub,@function
; CHECK: _Z5test1v.stub:                         // @_Z5test1v.stub
; CHECK: // %bb.0:                               // %entry
; CHECK:         return
; CHECK: .Lfunc_end0:
; CHECK:         .size   _Z5test1v.stub, .Lfunc_end0-_Z5test1v.stub
; CHECK:                                         // -- End function
; CHECK:         .ident  "clang version 10.0.0"
; CHECK:         .section        ".note.GNU-stack","",@progbits

; QBBS_TEXT: Hex dump of section '.qbbs_text':
; QBBS_TEXT: 0x00000000 00030000 00000000 
