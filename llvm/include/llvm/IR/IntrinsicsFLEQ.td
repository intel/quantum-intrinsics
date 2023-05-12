//===- IntrinsicsFLEQ.td - Defines FLEQ intrinsics ---*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines all of the FLEQ intrinsics.
//
//===----------------------------------------------------------------------===//

def llvm_qexpr_ty : LLVMType<i32>;
def llvm_dataptr_ty : LLVMQualPointerType<0>; 
def llvm_qbitptr_ty : LLVMQualPointerType<0>;
def llvm_qbitptrptr_ty : LLVMQualPointerType<0>;
def llvm_cbitptr_ty : LLVMQualPointerType<0>;

let TargetPrefix = "fleq" in { // All intrinsics start with "llvm.fleq."

  // NOTE: Note that any intrinsic using one of the llvm_any*_ty types for an
  // argument or return type will be deemed by tblgen as overloaded and the
  // corresponding suffix will be required on the intrinsic’s name.

  // NOTE: Following defintion must have the GCCBuiltin part so you don't have
  // to do any work on the front-end.

 // v1: basics
def int_fleq_qexpr_this_expression :
    Intrinsic<[llvm_qexpr_ty], 
              [], 
              []>;
                          
def int_fleq_qexpr_identity : 
    Intrinsic<[llvm_qexpr_ty], 
              [llvm_double_ty], 
              []>;

def int_fleq_qexpr_eval_hold : 
    Intrinsic<[], 
              [llvm_qexpr_ty], 
              []>;
                          
def int_fleq_qexpr_eval_release : 
    Intrinsic<[], 
              [llvm_qexpr_ty], 
              []>;
                          
def int_fleq_qexpr_join : 
    Intrinsic<[llvm_qexpr_ty], 
              [llvm_qexpr_ty,llvm_qexpr_ty], 
              []>;

def int_fleq_qexpr_bind : 
    Intrinsic<[llvm_qexpr_ty], 
              [llvm_qexpr_ty,llvm_qexpr_ty], 
              []>;

// v1.5: Coherent Transformations
def int_fleq_qexpr_invert : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qexpr_ty ], 
              []>;

def int_fleq_qexpr_control : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_i1_ty, llvm_qexpr_ty], 
              []>;

def int_fleq_qexpr_multi_control : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_i32_ty, llvm_qexpr_ty], 
              []>;

def int_fleq_qexpr_power : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_i32_ty, llvm_qexpr_ty], 
              []>;

// v1.5: Canonical gate expressions
def int_fleq_gate_qexpr_h :
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_x : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_y : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_z : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_s : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_s_dag : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_t : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_t_dag : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_rx : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_double_ty ], 
              []>;

def int_fleq_gate_qexpr_ry : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_double_ty ], 
              []>;

def int_fleq_gate_qexpr_rz : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_double_ty ], 
              []>;

def int_fleq_gate_qexpr_cz : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_cnot : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_swap : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_tof : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_qbitptr_ty, llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_prepx : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_prepy : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_prepz : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_measx : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_cbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_measy : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_cbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_measz : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_cbitptr_ty ], 
              []>;

def int_fleq_gate_qexpr_cphase : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_qbitptr_ty, llvm_double_ty ], 
              []>;

def int_fleq_gate_qexpr_swapa : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_qbitptr_ty, llvm_double_ty ], 
              []>;

def int_fleq_gate_qexpr_rxy : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qbitptr_ty, llvm_double_ty, llvm_double_ty ], 
              []>;


 // v2: qubit list
def int_fleq_qlist_join : 
    Intrinsic<[llvm_qbitptr_ty], 
              [llvm_qbitptr_ty,llvm_qbitptr_ty], 
              []>;
                         
def int_fleq_qlist_slice : 
    Intrinsic<[llvm_qbitptr_ty], 
              [llvm_qbitptr_ty,llvm_i64_ty,llvm_i64_ty], 
              []>;

def int_fleq_qlist_size : 
    Intrinsic<[llvm_i64_ty], 
              [llvm_qbitptr_ty], 
              []>;
                         
def int_fleq_qlist_at : 
    Intrinsic<[llvm_qbitptr_ty], 
              [llvm_qbitptr_ty,llvm_i64_ty], 
              []>;

def int_fleq_qlist_empty : 
    Intrinsic<[llvm_qbitptr_ty], 
              [], 
              []>;


def int_fleq_qlist_integerize : 
    Intrinsic<[llvm_i32_ty], 
              [llvm_qbitptr_ty], 
              []>;

def int_fleq_qlist_booleanize : 
    Intrinsic<[llvm_i1_ty], 
              [llvm_qbitptr_ty], 
              []>;

def int_fleq_qlist_equal : 
    Intrinsic<[llvm_i1_ty], 
              [llvm_qbitptr_ty, llvm_qbitptr_ty], 
              []>;

def int_fleq_qlist_build : 
    Intrinsic<[llvm_qbitptrptr_ty], 
              [llvm_qbitptr_ty], 
              []>;
                          
 // v2: Classical control flow 
def int_fleq_qexpr_branch : 
    Intrinsic<[llvm_qexpr_ty], 
              [LLVMType<i1>,llvm_qexpr_ty,llvm_qexpr_ty], 
              []>;

def int_fleq_qexpr_let : 
    Intrinsic<[], 
              [llvm_dataptr_ty,llvm_qexpr_ty], 
              []>;
                          
def int_fleq_qexpr_get : 
    Intrinsic<[llvm_qexpr_ty], 
              [llvm_dataptr_ty], 
              []>;

 // v2.5: data list
def int_fleq_datalist_join : 
    Intrinsic<[llvm_dataptr_ty], 
              [llvm_dataptr_ty,llvm_dataptr_ty], 
              []>;
                         
def int_fleq_datalist_slice : 
    Intrinsic<[llvm_dataptr_ty], 
              [llvm_dataptr_ty, llvm_i64_ty, llvm_i64_ty], 
              []>;

def int_fleq_datalist_size : 
    Intrinsic<[llvm_i64_ty], 
              [llvm_dataptr_ty], 
              []>;
                         
def int_fleq_datalist_at : 
    Intrinsic<[llvm_i8_ty], 
              [llvm_dataptr_ty,llvm_i64_ty], 
              []>;

def int_fleq_datalist_build : 
    Intrinsic<[llvm_dataptr_ty], 
              [llvm_dataptr_ty], 
              []>;

def int_fleq_datalist_from : 
    Intrinsic<[llvm_dataptr_ty], 
              [llvm_i32_ty], 
              []>;

def int_fleq_datalist_empty : 
    Intrinsic<[llvm_dataptr_ty], 
              [], 
              []>;

def int_fleq_datalist_integerize : 
    Intrinsic<[llvm_i32_ty], 
              [llvm_dataptr_ty], 
              []>;

def int_fleq_datalist_booleanize : 
    Intrinsic<[llvm_i1_ty], 
              [llvm_dataptr_ty], 
              []>;

def int_fleq_datalist_floatize : 
    Intrinsic<[llvm_double_ty], 
              [llvm_dataptr_ty], 
              []>;

def int_fleq_datalist_find : 
    Intrinsic<[llvm_i64_ty], 
              [llvm_dataptr_ty, llvm_dataptr_ty, llvm_i32_ty], 
              []>;

def int_fleq_datalist_contains : 
    Intrinsic<[llvm_i1_ty], 
              [llvm_dataptr_ty, llvm_dataptr_ty], 
              []>;

def int_fleq_datalist_count : 
    Intrinsic<[llvm_i64_ty], 
              [llvm_dataptr_ty, llvm_dataptr_ty], 
              []>;

def int_fleq_datalist_longer : 
    Intrinsic<[llvm_dataptr_ty], 
              [llvm_dataptr_ty, llvm_dataptr_ty], 
              []>;

def int_fleq_datalist_shorter : 
    Intrinsic<[llvm_dataptr_ty], 
              [llvm_dataptr_ty, llvm_dataptr_ty], 
              []>;

// v2.5: build control
def int_fleq_qexpr_print_passthru : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qexpr_ty], 
              []>;

def int_fleq_datalist_print_passthru : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_dataptr_ty, llvm_qexpr_ty], 
              []>;

def int_fleq_qexpr_rt_exit : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_dataptr_ty ], 
              []>;

def int_fleq_qexpr_ct_exit : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_dataptr_ty ], 
              []>;

def int_fleq_qexpr_eval_is_equal : 
    Intrinsic<[llvm_i32_ty ],
              [llvm_qexpr_ty, llvm_qexpr_ty], 
              []>; 

def int_fleq_qexpr_compute : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qexpr_ty ], 
              []>; 

def int_fleq_qexpr_uncompute : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_qexpr_ty ], 
              []>;

def int_fleq_qexpr_simplify : 
    Intrinsic<[llvm_qexpr_ty ], 
              [llvm_i32_ty, llvm_qexpr_ty], 
              []>;     

} // End TargetPrefix = "fleq"
