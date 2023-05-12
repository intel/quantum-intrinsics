//===--- quintrinsics.h - Quantum extensions---------------------*- C++ -*-===//
//
// Copyright (C) 2023 Intel Corporation
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//
///
/// \file
/// Quantum-specific intrinsics and operations
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_CLANG_QUANTUM_QUINTRINSICS_CHANGED_H
#define LLVM_CLANG_QUANTUM_QUINTRINSICS_CHANGED_H

#define quantum_kernel                                                         \
  __attribute__((section(".qbbs_text"))) __attribute__((noinline))

#define quantum_shared_double_array double

///////////////////////////////////////////////////////////////////////////////
/// Generic gate definitions
///////////////////////////////////////////////////////////////////////////////

using qbit = unsigned short int;
using cbit = bool;

void __quantum_qubit(qbit *q);
void __quantum_cbit(cbit *c);
void __quantum_param(double d);
void release_quantum_state();

/*
 * Hadamard (H) gate
 */
__attribute__((noinline))
void H(qbit &q) __attribute__((annotate("{ \
    \"matrix_real\" : \"1/sqrt(2)*[1, 1, 1, -1]\", \
    \"matrix_imag\" : [0, 0, 0, 0], \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : true, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [4], \
    \"identifier\" : 3 \
  }"))) {
  __quantum_qubit(&q);
}

/*
 * Pauli-X gate
 */
__attribute__((noinline))
void X(qbit &q) __attribute__((annotate("{ \
    \"matrix_real\" : [0, 1, 1, 0], \
    \"matrix_imag\" : [0, 0, 0, 0], \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : true, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [1], \
    \"identifier\" : 12 \
  }"))) {
  __quantum_qubit(&q);
}

/*
 * Pauli-Y gate
 */
__attribute__((noinline))
void Y(qbit &q) __attribute__((annotate("{ \
    \"matrix_real\" : [0, 0, 0, 0], \
    \"matrix_imag\" : [0, -1, 1, 0], \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : true, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [2], \
    \"identifier\" : 18 \
  }"))) {
  __quantum_qubit(&q);
};

/*
 * Pauli-Z gate
 * Phase shift with phi = π
 */
__attribute__((noinline))
void Z(qbit &q) __attribute__((annotate("{ \
    \"matrix_real\" : [1, 0, 0, -1], \
    \"matrix_imag\" : [0, 0, 0, 0], \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : true, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [3], \
    \"identifier\" : 6 \
  }"))) {
  __quantum_qubit(&q);
};

/*
 * Phase shift with phi = π / 2 (Phase gate)
 */
__attribute__((noinline))
void S(qbit &q) __attribute__((annotate("{ \
    \"matrix_real\" : [1, 0, 0, 0], \
    \"matrix_imag\" : [0, 0, 0, 1], \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [3], \
    \"identifier\" : 5 \
  }"))) {
  __quantum_qubit(&q);
};

/*
 *  S dagger gate is the conjugate transpose of the S gate
 */
__attribute__((noinline))
void Sdag(qbit &q) __attribute__((annotate("{ \
    \"matrix_real\" : [1, 0, 0, 0], \
    \"matrix_imag\" : [0, 0, 0, -1], \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [3], \
    \"identifier\" : 11 \
  }"))) {
  __quantum_qubit(&q);
};

/*
 * Phase shift with phi = π / 4 (T gate)
 */
__attribute__((noinline))
void T(qbit &q) __attribute__((annotate("{ \
    \"matrix_real\" : \"[1, 0, 0, cos(pi/4)]\", \
    \"matrix_imag\" : \"[0, 0, 0, sin(pi/4)]\", \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [3], \
    \"identifier\" : 24 \
  }"))) {
  __quantum_qubit(&q);
};

/*
 * T dagger gate is conjugate transpose of the T gate
 */
__attribute__((noinline))
void Tdag(qbit &q) __attribute__((annotate("{ \
    \"matrix_real\" : \"[1, 0, 0, cos(pi/4)]\", \
    \"matrix_imag\" : \"[0, 0, 0, -sin(pi/4)]\", \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [3], \
    \"identifier\" : 25 \
  }"))) {
  __quantum_qubit(&q);
};

/*
 * Arbitrary rotation around X-axis (RX gate)
 */
__attribute__((noinline))
void RX(qbit &q, double angle) __attribute__((annotate("{ \
    \"matrix_real\" : \"[cos(angle/2), 0, 0, cos(angle/2)]\", \
    \"matrix_imag\" : \"[0, -sin(angle/2), sin(angle/2), 0]\", \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [1], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [1], \
    \"identifier\" : 26 \
  }"))) {
  __quantum_qubit(&q);
  __quantum_param(angle);
}

/*
 * Arbitrary rotation around Y-axis (RY gate)
 */
__attribute__((noinline))
void RY(qbit &q, double angle) __attribute__((annotate("{ \
    \"matrix_real\" : \"[cos(angle/2), -sin(angle/2), sin(angle/2), cos(angle/2)]\", \
    \"matrix_imag\" : [0, 0, 0, 0], \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [1], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [2], \
    \"identifier\" : 27 \
  }"))) {
  __quantum_qubit(&q);
  __quantum_param(angle);
}

/*
 * Arbitrary rotation around Z-axis (RZ gate)
 */
__attribute__((noinline))
void RZ(qbit &q, double angle) __attribute__((annotate("{ \
    \"matrix_real\" : \"[cos(angle/2), 0, 0, cos(angle/2)]\", \
    \"matrix_imag\" : \"[-sin(angle/2), 0, 0, sin(angle/2)]\", \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [1], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [3], \
    \"identifier\" : 28 \
  }"))) {
  __quantum_qubit(&q);
  __quantum_param(angle);
}

/*
 * Controlled Z (CZ) gate
 */
__attribute__((noinline))
void CZ(qbit &ctrl, qbit &target) __attribute__((annotate("{ \
    \"matrix_real\" : [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, -1], \
    \"matrix_imag\" : [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : true, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0, 1], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [0, 1], \
    \"local_basis_list\" : [3, 3], \
    \"identifier\" : 37 \
  }"))) {
  __quantum_qubit(&ctrl);
  __quantum_qubit(&target);
}

/*
 * Controlled NOT (CNOT, CX) gate
 */
__attribute__((noinline))
void CNOT(qbit &ctrl, qbit &target) __attribute__((annotate("{ \
    \"matrix_real\" : [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0], \
    \"matrix_imag\" : [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : true, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0, 1], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [0], \
    \"local_basis_list\" : [3, 1], \
    \"identifier\" : 35 \
  }"))) {
  __quantum_qubit(&ctrl);
  __quantum_qubit(&target);
}

/*
 * Swap (SWAP) gate
 */
__attribute__((noinline))
void SWAP(qbit &ctrl, qbit &target) __attribute__((annotate("{ \
    \"matrix_real\" : [1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1], \
    \"matrix_imag\" : [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : true, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0, 1], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [0, 0], \
    \"identifier\" : 38 \
  }"))) {
  __quantum_qubit(&ctrl);
  __quantum_qubit(&target);
};

/*
 * Toffoli (CCNOT) gate
 */
__attribute__((noinline))
void Toffoli(qbit &ctrl0, qbit &ctrl1, qbit &target) __attribute__((annotate("{ \
    \"matrix_real\" : [1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \
    \"matrix_imag\" : [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : true, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0, 1, 2], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [0, 1], \
    \"local_basis_list\" : [3, 3, 1], \
    \"identifier\" : 39 \
  }"))) {
  __quantum_qubit(&ctrl0);
  __quantum_qubit(&ctrl1);
  __quantum_qubit(&target);
};

///////////////////////////////////////////////////////////////////////////////
/// Prep and Meas instructions
///////////////////////////////////////////////////////////////////////////////

// PrepX
__attribute__((noinline))
void PrepX(qbit &q) __attribute__((annotate("{ \
    \"matrix_real\" : \"{qt(prob0) : [0.5, 0.5, 0.5, 0.5], qt(prob1) : [0.5, -0.5, 0.5, -0.5]}\", \
    \"matrix_imag\" : \"{qt(prob0) : [0, 0, 0, 0], qt(prob1) : [0, 0, 0, 0]}\", \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : false, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [1], \
    \"identifier\" : 40 \
  }"))) {
  __quantum_qubit(&q);
}

// PrepY
__attribute__((noinline))
void PrepY(qbit &q) __attribute__((annotate("{ \
    \"matrix_real\" : \"{qt(prob0) : [0.5, 0, 0, 0.5], qt(prob1) : [0.5, 0, 0, -0.5]}\", \
    \"matrix_imag\" : \"{qt(prob0) : [0, 0.5, -0.5, 0], qt(prob1) : [0, 0.5, 0.5, 0]}\", \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : false, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [2], \
    \"identifier\" : 41 \
  }"))) {
  __quantum_qubit(&q);
}

// PrepZ
__attribute__((noinline))
void PrepZ(qbit &q) __attribute__((annotate("{ \
    \"matrix_real\" : \"{qt(prob0) : [1, 0, 0, 0], qt(prob1) : [0, 1, 0, 0]}\", \
    \"matrix_imag\" : \"{qt(prob0) : [0, 0, 0, 0], qt(prob1) : [0, 0, 0, 0]}\", \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : false, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [3], \
    \"identifier\" : 42 \
  }"))) {
  __quantum_qubit(&q);
}

// MeasX
__attribute__((noinline))
void MeasX(qbit &q, cbit &c, bool flip = false) __attribute__((annotate("{ \
    \"matrix_real\" : \"{qt(prob0) : [0.5, 0.5, 0.5, 0.5], qt(prob1) : [0.5, -0.5, -0.5, 0.5]}\", \
    \"matrix_imag\" : \"{qt(prob0) : [0, 0, 0, 0], qt(prob1) : [0, 0, 0, 0]}\", \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : false, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [1, 2], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [1], \
    \"identifier\" : 43 \
  }"))) {
  __quantum_qubit(&q);
  __quantum_cbit(&c);
  __quantum_param((double)flip);
}

// MeasY
__attribute__((noinline))
void MeasY(qbit &q, cbit &c, bool flip = false) __attribute__((annotate("{ \
    \"matrix_real\" : \"{qt(prob0) : [0.5, 0, 0, 0.5], qt(prob1) : [0.5, 0, 0, 0.5]}\", \
    \"matrix_imag\" : \"{qt(prob0) : [0, 0.5, -0.5, 0], qt(prob1) : [0, -0.5, 0.5, 0]}\", \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : false, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [1, 2], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [2], \
    \"identifier\" : 44 \
  }"))) {
  __quantum_qubit(&q);
  __quantum_cbit(&c);
  __quantum_param((double)flip);
}

// MeasZ
__attribute__((noinline))
void MeasZ(qbit &q, cbit &c, bool flip = false) __attribute__((annotate("{ \
    \"matrix_real\" : \"{qt(prob0) : [1, 0, 0, 0], qt(prob1) : [0, 0, 0, 1]}\", \
    \"matrix_imag\" : \"{qt(prob0) : [0, 0, 0, 0], qt(prob1) : [0, 0, 0, 0]}\", \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : false, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [1, 2], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [3], \
    \"identifier\" : 45 \
  }"))) {
  __quantum_qubit(&q);
  __quantum_cbit(&c);
  __quantum_param((double)flip);
}

///////////////////////////////////////////////////////////////////////////////
/// Canonical versions of the Spin Native gates
/// Note: there is no new definition of MeasZ, PrepZ, and RotZ.
/// The versions from Above will suffice.
///////////////////////////////////////////////////////////////////////////////

/*
 * Controlled Phase (CPhase) gate
 */
__attribute__((noinline))
void CPhase(qbit &ctrl, qbit &target, double angle) __attribute__((annotate("{ \
    \"matrix_real\" : \"[1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, cos(angle)]\", \
    \"matrix_imag\" : \"[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -sin(angle)]\", \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0, 1], \
    \"parametric_list\" : [2], \
    \"control_qubit_list\" : [0, 1], \
    \"local_basis_list\" : [3, 3], \
    \"identifier\" : 46 \
  }"))) {
  __quantum_qubit(&ctrl);
  __quantum_qubit(&target);
  __quantum_param(angle);
}

/*
 * Arbitrary rotation around an axis in the X-Y of the Bloch sphere (RXY gate)
 */
__attribute__((noinline))
void RXY(qbit &q, double theta, double phi) __attribute__((annotate("{ \
    \"matrix_real\" : \"[cos(theta/2), -sin(theta/2) sin(phi), sin(theta/2) sin(phi), cos(theta/2)]\", \
    \"matrix_imag\" : \"[0, -sin(theta/2)cos(phi), sin(theta/2)cos(phi), 0]\", \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0], \
    \"parametric_list\" : [1,2], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [0], \
    \"identifier\" : 47 \
  }"))) {
  __quantum_qubit(&q);
  __quantum_param(theta);
  __quantum_param(phi);
}

/*
 * Abitrary rotation in the Span{|01> |10>} subspace (SwapA) gate
 */
__attribute__((noinline))
void SwapA(qbit &q1, qbit &q2, double angle) __attribute__((annotate("{ \
    \"matrix_real\" : \"[1, 0, 0, 0, 0, (1+cos(angle))/2, (1-cos(angle))/2, 0, 0, (1-cos(angle))/2, (1+cos(angle))/2, 0, 0, 0, 0, 1]\", \
    \"matrix_imag\" : \"[0, 0, 0, 0, 0, sin(angle)/2, -sin(angle)/2, 0, 0, -sin(angle)/2, sin(angle)/2, 0, 0, 0, 0, 0]\", \
    \"matrix_order\" : \"rm\", \
    \"is_hermitian\" : false, \
    \"is_unitary\" : true, \
    \"is_mutable\" : true, \
    \"qubit_list\" : [0, 1], \
    \"parametric_list\" : [2], \
    \"control_qubit_list\" : [], \
    \"local_basis_list\" : [0, 0], \
    \"identifier\" : 53 \
  }"))) {
  __quantum_qubit(&q1);
  __quantum_qubit(&q2);
  __quantum_param(angle);
}

///////////////////////////////////////////////////////////////////////////////

#endif // LLVM_CLANG_QUANTUM_QUINTRINSICS_CHANGED_H
