//===--- qexpr_fwd_dec.h ----------------------------------------*- C++ -*-===//
//
// Copyright (C) 2023 Intel Corporation
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//
///
/// \file
/// forward declarations for the FLEQ builtins
///
//===----------------------------------------------------------------------===//

#include "quintrinsics.h"

#ifndef LLVM_CLANG_QEXPR_FW_DEC_H
#define LLVM_CLANG_QEXPR_FW_DEC_H

typedef int QExpr;

#ifndef WRAP_ATTR
#define WRAP_ATTR __attribute__((annotate("{\"fleq_wrapper\" : true }"))) __attribute__ ((always_inline))
#endif

#ifndef PROTECT
#define PROTECT __attribute__((noinline))
#endif

namespace quantum_builtin {

///////////////////////////////////////////////////////////////////////////////
/// qexpr builtins
///////////////////////////////////////////////////////////////////////////////

  QExpr __qexpr_this_expression() noexcept;
  QExpr __qexpr_identity(double) noexcept;

  //QExpr evaluation methods
  void __qexpr_eval_hold(QExpr) noexcept;
  void __qexpr_eval_release(QExpr) noexcept;

  //QExpr returning gates
  QExpr __qexpr_H(qbit*) noexcept;
  QExpr __qexpr_X(qbit*) noexcept;
  QExpr __qexpr_Y(qbit*) noexcept;
  QExpr __qexpr_Z(qbit*) noexcept;
  QExpr __qexpr_S(qbit*) noexcept;
  QExpr __qexpr_Sdag(qbit*) noexcept;
  QExpr __qexpr_T(qbit*) noexcept;
  QExpr __qexpr_Tdag(qbit*) noexcept;
  QExpr __qexpr_RX(qbit*, double) noexcept;
  QExpr __qexpr_RY(qbit*, double) noexcept;
  QExpr __qexpr_RZ(qbit*, double) noexcept;
  QExpr __qexpr_CZ(qbit*, qbit*) noexcept; 
  QExpr __qexpr_CNOT(qbit*, qbit*) noexcept; 
  QExpr __qexpr_SWAP(qbit*, qbit*) noexcept;
  QExpr __qexpr_Toffoli(qbit*, qbit*, qbit*) noexcept;
  QExpr __qexpr_PrepX(qbit*) noexcept;
  QExpr __qexpr_PrepY(qbit*) noexcept;
  QExpr __qexpr_PrepZ(qbit*) noexcept;
  QExpr __qexpr_MeasX(qbit*, cbit*) noexcept;
  QExpr __qexpr_MeasY(qbit*, cbit*) noexcept;
  QExpr __qexpr_MeasZ(qbit*, cbit*) noexcept;
  QExpr __qexpr_CPhase(qbit*, qbit*, double) noexcept;
  QExpr __qexpr_RXY(qbit*, double, double) noexcept;
  QExpr __qexpr_SwapA(qbit*, qbit*, double) noexcept;

  //basic builtins
  QExpr __qexpr_join(QExpr, QExpr) noexcept;
  QExpr __qexpr_bind(QExpr, QExpr) noexcept;
  QExpr __qexpr_invert(QExpr) noexcept;
  QExpr __qexpr_power(unsigned int, QExpr) noexcept;
  QExpr __qexpr_control(qbit*, bool, QExpr) noexcept;
  QExpr __qexpr_multi_control(qbit*, unsigned int, QExpr) noexcept;  
  QExpr __qexpr_branch(bool, QExpr, QExpr) noexcept;
  void  __qexpr_let(const char[], QExpr) noexcept; 
  QExpr __qexpr_get(const char[]) noexcept; 

  //qlist builtins
  qbit* __qlist_empty() noexcept;
  qbit* __qlist_at(qbit*, unsigned long) noexcept;
  unsigned long __qlist_size(qbit*) noexcept;
  qbit* __qlist_slice(qbit*, unsigned long, unsigned long) noexcept;
  qbit* __qlist_join(qbit*, qbit*) noexcept;
  bool __qlist_equal(qbit*, qbit*) noexcept;
  qbit** __qlist_build(qbit*) noexcept;

  //datalist builtins
  char * __datalist_empty() noexcept;
  const char * const __datalist_from(int) noexcept;
  char * __datalist_build(const char*) noexcept;
  int __datalist_integerize(const char*) noexcept;
  double __datalist_floatize(const char*) noexcept;
  bool __datalist_booleanize(const char*) noexcept;
  char __datalist_at(const char*, unsigned long) noexcept;
  unsigned long __datalist_size(const char*) noexcept;
  const char *__datalist_slice(const char*, unsigned long, unsigned long) noexcept;
  const char *__datalist_join(const char*, const char*) noexcept;
  //find code:
  //  -2 -> find not last
  //  -1 -> find not 
  //   0 -> find
  //   1 -> find last
  //   2 -> find any
  //   3 -> find any last
  unsigned long __datalist_find(const char *, const char *, const unsigned) noexcept;
  const char *__datalist_longer(const char*, const char*) noexcept; 
  const char *__datalist_shorter(const char*, const char*) noexcept; 
  bool __datalist_contains(const char*, const char*) noexcept; 
  unsigned long __datalist_count(const char*, const char*) noexcept; 

  template<class Type>
  Type *__datalist_alloca(const char*, unsigned long, Type) noexcept;

  //build control and debug builtins
  QExpr __qexpr_print_passthru(QExpr) noexcept;
  QExpr __datalist_print_passthru(const char *, QExpr) noexcept;
  QExpr __qexpr_ct_exit(const char *) noexcept;
  QExpr __qexpr_rt_exit(const char *) noexcept;



}

#endif //LLVM_CLANG_QEXPR_H