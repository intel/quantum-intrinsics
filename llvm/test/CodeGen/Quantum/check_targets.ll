;<--- THIS TEST CHECKS THE REQUIRED TARGET(S) IS REGISTERED AND USABLE --->

;<--- 32-bit variant --->
; RUN: llc < %s -march=quantum32

;<--- 64-bit variant --->
; RUN: llc < %s -march=quantum64

define void @foo() {
entry:
    ret void
}
