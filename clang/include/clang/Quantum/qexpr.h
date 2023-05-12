//===--- qexpr.h ------------------------------------------------*- C++ -*-===//
//
// Copyright (C) 2023 Intel Corporation
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//
///
/// \file
/// Basic set of functions which return QExpr's
///
//===----------------------------------------------------------------------===//

#include "qlist.h"
#include "datalist.h"
#include "fleq_fw_decs.h"

#ifndef LLVM_CLANG_QEXPR_H
#define LLVM_CLANG_QEXPR_H

using namespace quantum_builtin;

namespace qexpr {

////////////////////////////////////
// qexpr wrappers around builtins //
////////////////////////////////////

  /// @brief Returns the contents of the current \c quantum_kernel function as a
  /// \c QExpr.
  ///
  /// @note Use of \c this_as_expr requires the use of the
  /// \c PROTECT function attribute.
  #define this_as_expr __qexpr_this_expression()

  /// @brief A \c QExpr that has no effect on the quantum state.
  QExpr WRAP_ATTR identity() {
    return __qexpr_identity(0.); }
  /// @brief A \c QExpr that applies a global phase.
  QExpr WRAP_ATTR global_phase(double angle){ 
    return __qexpr_identity(angle);}

  /// @brief Class that supports converting a \c quantum_kernel function
  ///        into a \c QExpr. Implements the \c convert function.
  template<auto *F>
  struct Converter{};


  
  /// @brief Class that supports converting a \c quantum_kernel function
  ///        into a \c QExpr. Implements the \c convert function.
  ///
  ///        Note the circuitous method is because we require
  ///        qk function argument deduction from the pointer,
  ///        and C++ does not allow for partial specialization
  ///        of functions.
  /// @tparam F   A \c quantum_kernel function that returns \c void
  template <class... Args, auto (*F)(Args...)->void>
  struct Converter<F>{

    /// @brief Convert a \c quantum_kernel function into a \c QExpr.
    /// @param ...args  Arguments to be passed to \c F
    PROTECT QExpr convert(Args... args) const {
      F(args...);
      return this_as_expr;
    }
  };

  /// @brief Convert a \c quantum_kernel function to a quantum kernel
  /// expression ( a \c QExpr ).
  template<auto *F, class... Args>
  QExpr convert(Args&&... args){
    Converter<F> converter;
    return converter.convert(args...);
  }

  /// @brief Evaluate a \c QExpr, ensuring the quantum state is maintained after
  /// evaluation.
  void WRAP_ATTR eval_hold(QExpr e){
    __qexpr_eval_hold(e); }

  /// @brief Evaluate a \c QExpr, making no guarantees about the quantum state after evaluation.
  ///        Equivalent to \c release_quantum_state for quantum_kernel functions.
  void WRAP_ATTR eval_release(QExpr e){
    __qexpr_eval_release(e); }

  ///////////////////////////
  // QExpr-returning gates //
  ///////////////////////////

  /// @brief \c QExpr implementing a Hadamard gate
  QExpr WRAP_ATTR _H(qbit &q) {
     return __qexpr_H(&q); }
  /// @brief \c QExpr implementing a Pauli X gate
  QExpr WRAP_ATTR _X(qbit &q){ 
    return __qexpr_X(&q); }
  /// @brief \c QExpr implementing a Pauli Y gate
  QExpr WRAP_ATTR _Y(qbit &q){ 
    return __qexpr_Y(&q); }
  /// @brief \c QExpr implementing a Pauli Z gate
  QExpr WRAP_ATTR _Z(qbit &q){ 
    return __qexpr_Z(&q); }
  /// @brief \c QExpr implementing an S gate
  QExpr WRAP_ATTR _S(qbit &q){ 
    return __qexpr_S(&q); }
  /// @brief \c QExpr implementing an inverse S gate
  QExpr WRAP_ATTR _Sdag(qbit &q){ 
    return __qexpr_Sdag(&q); }
  /// @brief \c QExpr implementing a T gate
  QExpr WRAP_ATTR _T(qbit &q){ 
    return __qexpr_T(&q); }
  /// @brief \c QExpr implementing an inverse T gate
  QExpr WRAP_ATTR _Tdag(qbit &q){ 
    return __qexpr_Tdag(&q); }
  /// @brief \c QExpr implementing an X rotation
  QExpr WRAP_ATTR _RX(qbit &q, double angle){ 
    return __qexpr_RX(&q, angle); }
  /// @brief \c QExpr implementing a Y rotation
  QExpr WRAP_ATTR _RY(qbit &q, double angle){ 
    return __qexpr_RY(&q, angle); }
  /// @brief \c QExpr implementing a Z rotation
  QExpr WRAP_ATTR _RZ(qbit &q, double angle){ 
    return __qexpr_RZ(&q, angle); }
  /// @brief \c QExpr implementing a controlled-Z rotation
  QExpr WRAP_ATTR _CZ(qbit &ctrl, qbit &tgt){ 
    return __qexpr_CZ(&ctrl, &tgt); }
  /// @brief \c QExpr implementing a controlled-X rotation
  QExpr WRAP_ATTR _CNOT(qbit &ctrl, qbit &tgt){ 
    return __qexpr_CNOT(&ctrl, &tgt); }
  /// @brief \c QExpr implementing a SWAP gate
  QExpr WRAP_ATTR _SWAP(qbit &q1, qbit &q2){ 
    return __qexpr_SWAP(&q1, &q2); }
  /// @brief \c QExpr implementing a Toffoli gate
  QExpr WRAP_ATTR _Toffoli(qbit &q1, qbit &q2, qbit &q3){ 
    return __qexpr_Toffoli(&q1, &q2, &q3); }

  /// @brief \c QExpr implementing a preparation in the X basis
  QExpr WRAP_ATTR _PrepX(qbit &q){ 
    return __qexpr_PrepX(&q); }
  /// @brief \c QExpr implementing a preparation in the Y basis
  QExpr WRAP_ATTR _PrepY(qbit &q){ 
    return __qexpr_PrepY(&q); }
  /// @brief \c QExpr implementing a preparation in the Z basis
  QExpr WRAP_ATTR _PrepZ(qbit &q){
    return __qexpr_PrepZ(&q); }
    
  /// @brief \c QExpr implementing a measurement in the X basis
  QExpr WRAP_ATTR _MeasX(qbit &q, cbit &c) { 
    return __qexpr_MeasX(&q, &c); }
  /// @brief \c QExpr implementing a measurement in the Y basis
  QExpr WRAP_ATTR _MeasY(qbit &q, cbit &c) { 
    return __qexpr_MeasY(&q, &c); }
  /// @brief \c QExpr implementing a measurement in the Z basis
  QExpr WRAP_ATTR _MeasZ(qbit &q, cbit &c) { 
    return __qexpr_MeasZ(&q, &c); }

  /// @brief \c QExpr implementing a CPhase gate
  QExpr WRAP_ATTR _CPhase(qbit &ctrl, qbit &tgt, double angle){ 
    return __qexpr_CPhase(&ctrl, &tgt, angle); }
  /// @brief \c QExpr implementing a two-axis rotation
  QExpr WRAP_ATTR _RXY(qbit &q, double theta, double phi) { 
    return __qexpr_RXY(&q, theta, phi); }
  /// @brief \c QExpr implementing a SwapA gate
  QExpr WRAP_ATTR _SwapA(qbit &q1, qbit &q2, double angle){ 
    return __qexpr_SwapA(&q1, &q2, angle); }

  //////////////////////////
  // QExpr coherent logic //
  //////////////////////////

  /** @brief Concatenate two QExprs in composition order.
    *        Example: <tt>join(_H(q), _PrepZ(q))</tt> is equivalent
    *        to the circuit:
  @verbatim
  |q> --- PrepZ --- H ---
  @endverbatim
  */
  QExpr WRAP_ATTR join(QExpr e1, QExpr e2) { 
    return __qexpr_join(e1, e2); }
  
  /// @brief Concatenate two QExprs in composition order,
  ///        with a circuit barrier. Measurement outcomes in
  ///        \c e2 will be available to \c e1. Will not optimize
  ///        across the barrier.
  QExpr WRAP_ATTR bind(QExpr e1, QExpr e2) { 
    return __qexpr_bind(e1, e2); }

  /// @brief Implement the inverse of the \c QExpr \c e
  /// @param e    A unitary \c QExpr.
  QExpr WRAP_ATTR invert(QExpr e){ 
    return __qexpr_invert(e); }

  /// @brief Concatenate \c e with itself \c n times.
  ///        Assumes \c n is a constant resolvable at compile-time.
  ///        Example: <tt>power(3,e) = join(e, join(e, e))</tt>
  QExpr WRAP_ATTR power(unsigned int n, QExpr e){ 
    return __qexpr_power(n, e); }

  /** @brief Control \c e by the qubit \c ctrl.
    *        Assumes \c e is unitary.
    *        Example: <tt>control(ctrl, _H(q))</tt> implements:
  @code{.unparsed}
  |ctrl> --- o ---
             |
  |q>    --- H ---
  @endcode
    * @param ctrl   A qubit that does not appear in \c e.
    * @param e      A Unitary \c QExpr.
    */
  QExpr WRAP_ATTR control(qbit &ctrl, QExpr e){ 
    return __qexpr_control(&ctrl, true, e); }

  /** @brief Control the unitary \c e by <tt>ctrl = |control_if></tt>.
    *        Example: <tt>control(ctrl, false, _H(q))</tt> implements:
  @code{.unparsed}
  |ctrl> --- X --- o --- X ---
                   |
  |q>    --------- H ---------
  @endcode
    * @param ctrl A qubit that does not appear in \c e.
    * @param e    A unitary \c QExpr.
    */
  QExpr WRAP_ATTR control(qbit &ctrl, bool control_if, QExpr e){ 
    return __qexpr_control(&ctrl, control_if, e); }

  /** @brief Control \c e by the entire qubit array \c ctrls.
    *        Example: if <tt>ctrls = {a,b}</tt> then
    *        <tt>control(ctrls, _X(q))</tt> implements:
  @code{.unparsed}
  |a> --- o ---
          |
  |b> --- o ---
          |
  |q> --- X ---
  @endcode
    * @param ctrls  A qubit array whose elements do not appear in \c e.
    * @param e      A unitary \c QExpr.
    */
  QExpr WRAP_ATTR control(qbit ctrls[], QExpr e){
    return __qexpr_multi_control(ctrls, -1, e); } 

  /** @brief Control the unitary \c e by <tt>ctrls = |control_on></tt>,
    *        where \c control_on is an index corresponding to a
    *        basis state. (See \c QssIndex for details of the index encoding.)
    *        Example: If <tt>ctrls = {a,b}</tt> and
    *        <tt>control_on = QssIndex("|01>").getIndex()</tt>
    *        then <tt>control(ctrls, control_on, _X(q))</tt> implements:
  @code{.unparsed}
    |a> --- X --- o --- X ---
                  |
    |b> --------- o ---------
                  |
    |q> --------- X ---------
  @endcode
    * @param ctrls    A qubit array that whose elements do not appear in e
    * @param e        A unitary QExpr.
    */
  QExpr WRAP_ATTR control(qbit ctrls[], unsigned int control_on, QExpr e){
    return __qexpr_multi_control(ctrls, control_on, e); }
  QExpr WRAP_ATTR control(const qlist::QList &ctrls, QExpr e){
    return __qexpr_multi_control(ctrls._qlist, -1, e); }  
  QExpr WRAP_ATTR control(const qlist::QList &ctrls, unsigned int control_on, QExpr e){
    return __qexpr_multi_control(ctrls._qlist, control_on, e); }

  /// @brief Control \c eT by \c ctrl=true and \c eF by \c ctrl=false.
  /// @param ctrl   A qubit not appearing in \c eT or \c eF.
  /// @param eT     A unitary \c QExpr.
  /// @param eF     A unitary \c QExpr.
  QExpr WRAP_ATTR qIf(qbit &ctrl, QExpr eT, QExpr eF){
    return __qexpr_join( 
      __qexpr_control(&ctrl, true, eT),
      __qexpr_control(&ctrl, false, eF)
    ); }


  /////////////////////////////
  // QExpr classical control //
  /////////////////////////////

  /// @brief If <tt>b=true</tt>, execute \c eTrue, otherwise execute \c eFalse.
  /// @param b      A runtime boolean value.
  QExpr WRAP_ATTR cIf(bool b, QExpr eTrue, QExpr eFalse){ 
    return __qexpr_branch(b, eTrue, eFalse); }

  /// @brief If <tt>b=true</tt>, execute \c eTrue, otherwise do nothing.
  /// @param b      A runtime boolean value.
  QExpr WRAP_ATTR cIfTrue(bool b, QExpr eTrue){ 
    return __qexpr_branch(b, eTrue, identity()); }

  /// @brief If <tt>b=false</tt>, execute \c eFalse, otherwise do nothing.
  /// @param b      A runtime boolean value.
  QExpr WRAP_ATTR cIfFalse(bool b, QExpr eFalse){ 
    return __qexpr_branch(b, identity(), eFalse); }

  ///////////////////////////////////
  // QExpr build control utilities //
  ///////////////////////////////////

  /// @brief Assign the \c QExpr \c e to a string key.
  void WRAP_ATTR let(const char key[], QExpr e){ 
    return __qexpr_let(key, e); }
  /// @brief Return the \c QExpr previously assigned to the key.
  QExpr WRAP_ATTR get(const char key[]){ 
    return __qexpr_get(key); }

  /// @brief Raise a compile-time error.
  QExpr WRAP_ATTR exitAtCompile(datalist::DataList d = datalist::DataList::empty_list()){
    return __qexpr_ct_exit(d._datalist); }

  /// @brief Raise a runtime error.
  QExpr WRAP_ATTR exitAtRuntime(datalist::DataList d = datalist::DataList::empty_list()){
    return __qexpr_rt_exit(d._datalist); }

  /// @brief Implement a barrier/fence after the \c QExpr \c e.
  QExpr WRAP_ATTR fence(QExpr e){
    return bind(e, identity());
  }

  ///////////////////////////
  // Compile-time printing //
  ///////////////////////////

  /// @brief Print out the PCOAST graph(s) generated by \c e at compile-time,
  ///        and return \c e.
  QExpr WRAP_ATTR printQuantumLogic(QExpr e){
    return __qexpr_print_passthru(e); }

  /// @brief Print the \c DataList at compile-time and return \c e.
  QExpr WRAP_ATTR printDataList(datalist::DataList d, QExpr e){
    return __datalist_print_passthru(d._datalist, e); }


}

#endif //LLVM_CLANG_QEXPR_H