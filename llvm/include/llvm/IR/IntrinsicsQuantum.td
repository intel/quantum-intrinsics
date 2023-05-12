//===- IntrinsicsQuantum.td - Defines Quantum intrinsics ---*- tablegen -*-===//
//
// Copyright (C) 2023 Intel Corporation
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//
//
// This file defines all of the Quantum-specific intrinsics for use with
// Quantum processor.
//
//===----------------------------------------------------------------------===//

// ASKME: What's the use of llvm_abit_ty?
def llvm_abit_ty : LLVMType<i8>;

def llvm_cbit_ty : LLVMType<i1>;

let TargetPrefix = "quantum" in { // All intrinsics start with "llvm.quantum."

  // NOTE: Note that any intrinsic using one of the llvm_any*_ty types for an
  // argument or return type will be deemed by tblgen as overloaded and the
  // corresponding suffix will be required on the intrinsic’s name.

  // NOTE: Following definitions must have the ClangBuiltin part so you don't have
  // to do any work on the front-end.

  def int_quantum_prepz
      : Intrinsic<[], [llvm_i16_ty, llvm_i32_ty], [ImmArg<ArgIndex<1>>]>;

  def int_quantum_measz
      : Intrinsic<[], [llvm_i16_ty, llvm_ptr_ty, llvm_i1_ty, llvm_i32_ty], [ImmArg<ArgIndex<3>>]>;

  def int_quantum_rotxy
      : Intrinsic<[],
                  [llvm_i16_ty, llvm_double_ty, llvm_double_ty, llvm_i32_ty],
                  [ImmArg<ArgIndex<3>>]>;

  def int_quantum_rotz
      : Intrinsic<[], [llvm_i16_ty, llvm_double_ty, llvm_i32_ty],
                  [ImmArg<ArgIndex<2>>]>;

  def int_quantum_cphase
      : Intrinsic<[], [llvm_i16_ty, llvm_i16_ty, llvm_double_ty, llvm_i32_ty],
                  [ImmArg<ArgIndex<3>>]>;

  def int_quantum_swapalp
      : Intrinsic<[], [llvm_i16_ty, llvm_i16_ty, llvm_double_ty, llvm_i32_ty],
                  [ImmArg<ArgIndex<3>>]>;

  // Following represent the generic intrinsics to capture arguments to quantum
  // operations

  def int_quantum_qubit : Intrinsic<[], [llvm_ptr_ty], []>;

  def int_quantum_param : Intrinsic<[], [llvm_double_ty], []>;

  def int_quantum_cbit : Intrinsic<[], [llvm_ptr_ty], []>;

  // Frontend user-facing intrinsics for QBB control

  def int_quantum_release_quantum_state : Intrinsic<[], [], []>;

  /// Intrinsics for capturing run-time data movement

  def int_quantum_move_qubit_to_cbit
      : Intrinsic<[], [llvm_i16_ty, llvm_ptr_ty, llvm_i8_ty], []>;

  // Intrinsics with only ImmArgs
  
  def int_quantum_prepz_imm
      : Intrinsic<[], [llvm_i16_ty, llvm_i32_ty], [ImmArg<ArgIndex<0>>, ImmArg<ArgIndex<1>>]>;

  def int_quantum_measz_imm
      : Intrinsic<[], [llvm_i16_ty, llvm_i32_ty], [ImmArg<ArgIndex<0>>, ImmArg<ArgIndex<1>>]>;
  
  def int_quantum_measz_imm_index
      : Intrinsic<[], [llvm_i16_ty, llvm_i32_ty, llvm_i32_ty], [ImmArg<ArgIndex<0>>, ImmArg<ArgIndex<1>>, ImmArg<ArgIndex<2>>]>;

  def int_quantum_rotxy_imm
      : Intrinsic<[],
                  [llvm_i16_ty, llvm_double_ty, llvm_double_ty, llvm_i32_ty],
                  [ImmArg<ArgIndex<0>>, ImmArg<ArgIndex<1>>, ImmArg<ArgIndex<2>>, ImmArg<ArgIndex<3>>]>;

  def int_quantum_rotxy_imm_index
      : Intrinsic<[],
                  [llvm_i16_ty, llvm_i32_ty, llvm_i32_ty, llvm_i32_ty],
                  [ImmArg<ArgIndex<0>>, ImmArg<ArgIndex<1>>, ImmArg<ArgIndex<2>>, ImmArg<ArgIndex<3>>]>;

  def int_quantum_rotz_imm
      : Intrinsic<[], [llvm_i16_ty, llvm_double_ty, llvm_i32_ty],
                  [ImmArg<ArgIndex<0>>, ImmArg<ArgIndex<1>>, ImmArg<ArgIndex<2>>]>;

  def int_quantum_rotz_imm_index
      : Intrinsic<[], [llvm_i16_ty, llvm_i32_ty, llvm_i32_ty],
                  [ImmArg<ArgIndex<0>>, ImmArg<ArgIndex<1>>, ImmArg<ArgIndex<2>>]>;

  def int_quantum_cphase_imm
      : Intrinsic<[], [llvm_i16_ty, llvm_i16_ty, llvm_double_ty, llvm_i32_ty],
                  [ImmArg<ArgIndex<0>>, ImmArg<ArgIndex<1>>, ImmArg<ArgIndex<2>>, ImmArg<ArgIndex<3>>]>;

   def int_quantum_cphase_imm_index
      : Intrinsic<[], [llvm_i16_ty, llvm_i16_ty, llvm_i32_ty, llvm_i32_ty],
                  [ImmArg<ArgIndex<0>>, ImmArg<ArgIndex<1>>, ImmArg<ArgIndex<2>>, ImmArg<ArgIndex<3>>]>;

  def int_quantum_swapalp_imm
      : Intrinsic<[], [llvm_i16_ty, llvm_i16_ty, llvm_double_ty, llvm_i32_ty],
                  [ImmArg<ArgIndex<0>>, ImmArg<ArgIndex<1>>, ImmArg<ArgIndex<2>>, ImmArg<ArgIndex<3>>]>;

  def int_quantum_swapalp_imm_index
      : Intrinsic<[], [llvm_i16_ty, llvm_i16_ty, llvm_i32_ty, llvm_i32_ty],
                  [ImmArg<ArgIndex<0>>, ImmArg<ArgIndex<1>>, ImmArg<ArgIndex<2>>, ImmArg<ArgIndex<3>>]>;


} // End TargetPrefix = "quantum"
