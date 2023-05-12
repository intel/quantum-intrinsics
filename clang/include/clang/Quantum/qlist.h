//===--- qlist.h - Quantum extensions----------------------------*- C++ -*-===//
//
// Copyright (C) 2023 Intel Corporation
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//
///
/// \file
/// QList definition
///
//===----------------------------------------------------------------------===//

#include "fleq_fw_decs.h"

#include <vector>
#include <functional>

#ifndef LLVM_CLANG_QLIST_H
#define LLVM_CLANG_QLIST_H

#define GET_LISTABLE(_1,_2,_3,NAME,...) NAME
#define RM_PARANS(...) __VA_ARGS__
#define listable(...) GET_LISTABLE(__VA_ARGS__, listable_array_init, listable_array, listable_scalar)(__VA_ARGS__)
#define listable_array_init(NAME, NUM, INIT) NAME ## _raw[NUM] = {RM_PARANS INIT};  const qlist::QList NAME(NAME ## _raw)
#define listable_array(NAME, NUM) NAME ## _raw[NUM];  const qlist::QList NAME(NAME ## _raw)
#define listable_scalar(NAME) NAME ## _raw;  const qlist::QList NAME(& NAME ## _raw)

//Forward declaration for friending with QList
namespace qlist {
struct QList;
const QList join(qbit *, qbit *);
const QList slice(qbit *, unsigned long, unsigned long);
const QList join(const QList &, const QList &);
const QList slice(const QList &, unsigned long, unsigned long);
}

namespace qexpr {
QExpr control(const qlist::QList &, unsigned int, QExpr);
QExpr control(const qlist::QList &, QExpr);
}

using namespace quantum_builtin;

namespace qlist {

struct QList {

  private: 
    /// @cond
    qbit *_qlist;
      
    explicit inline operator qbit*() const { 
      return _qlist; }

    explicit inline operator const qbit*() const { 
      return _qlist; }
    /// @endcond

  public:
    /// @brief  Empty \c QList
    QList() = default;
    /// @brief  Construct a \c QList from a qubit array
    WRAP_ATTR QList(qbit *qa) : _qlist(qa) {}
    /// @brief Construct a \c QList consisting of a single qubit
    WRAP_ATTR QList(qbit &q) {
        _qlist = __qlist_slice(&q, 0, 1);
    }
    /// @brief
    QList(const QList &ql) = default;

    /// @brief Returns an empty \c QList
    static const QList WRAP_ATTR empty_list(){
      return QList(__qlist_empty()); }

    /// @brief Index into the \c QList at index \c i. Example:
    ///        if <tt>qs={a,b,c}</tt> then <tt>qs[1] = b</tt>.
    qbit WRAP_ATTR &operator[](unsigned long i) const { 
      return *__qlist_at(_qlist, i); }

    /// @brief Index into the \c QList at index \c 0.
    WRAP_ATTR qbit &operator *() const {
      return *__qlist_at(_qlist, 0); }
  
    /// @brief Return the size of the \c QList
    unsigned long WRAP_ATTR size() const {
      return __qlist_size(_qlist); }

    /// @brief Return the size of the \c QList
    friend unsigned long WRAP_ATTR size(const QList &a){
      return __qlist_size(a._qlist); }

    /// @brief Index into the \c QList at index \c i.
    qbit WRAP_ATTR &at(unsigned long i) const {
      return *__qlist_at(_qlist, i); }

    /// @brief Produces a slice of a \c QList, starting from index \c a and ending
    /// at index \c b-1.
    ///
    /// @details Example: If <tt>qs = {u,v,x,y,z}</tt> then <tt>qs(2,4) = {x,y}</tt>.
    const QList WRAP_ATTR operator()(unsigned long a, unsigned long b) const{
      return QList(__qlist_slice(_qlist, a, b)); }

    /// @brief Concatenate two \c QLists in sequence. For example,
    ///        <tt>{a,b,c} + {x,y} = {a,b,c,x,y}</tt>
    friend const QList WRAP_ATTR operator+(const QList & a, const QList &b){
      return QList(__qlist_join(a._qlist, b._qlist)); }

    /// @brief Increments the \c QList by \c i.
    ///        In other words, returns the slice \c qs(i,qs.size())
    const QList WRAP_ATTR operator+(unsigned i){
      return QList(_qlist + i); }

    /// @brief Increments the \c QList by \c 1
    const QList WRAP_ATTR operator++() const {
      return QList(_qlist + 1); }

    /// @brief Returns the first \c size()-i elements of \c qs.
    ///
    /// @details Example: If <tt>qs = {a,b,c}</tt> then <tt>qs << 1 = {a,b}</tt>.
    friend const QList WRAP_ATTR operator<<(const QList &qs, const unsigned long i) {
      return QList(__qlist_slice(qs._qlist, 0, __qlist_size(qs._qlist) - i)); }

    /// @brief Returns the last \c size()-i elements of \c qs
    ///
    /// @details Example: If <tt>qs = {a,b,c}</tt> then <tt>qs >> q = {b,c}</tt>.
    friend const QList WRAP_ATTR operator>>(const QList &qs, const unsigned long i) {
      return QList(qs._qlist + i); }

    /// @brief Slice into a \c qbit array
    friend const QList WRAP_ATTR slice(qbit* reg, const unsigned long a, const unsigned long b){
      return QList(__qlist_slice(reg, a, b)); }

    /// @brief Slice into a \c qbit array
    friend const QList WRAP_ATTR slice(qbit* reg, const int a, const int b){
      return QList(__qlist_slice(reg, a, b)); }

    /// Combine two \c qbit arrays
    friend const QList WRAP_ATTR join(qbit *reg1, qbit *reg2){
      return QList(__qlist_join(reg1, reg2)); }

    /// @brief Produces a slice of a \c QList, starting from index \c i and
    /// ending at index \c j-1.
    ///
    /// @details Example: If <tt>qs = {a,b,c,d,e}</tt> then
    ///          <tt>slice(qs,2,4) = {c,d}</tt>.
    friend const QList WRAP_ATTR slice(const QList &reg, const unsigned long i, const unsigned long j){
      return QList(__qlist_slice(reg._qlist, i, j)); }

    /// @brief Concatenate two \c QLists in sequence.
    ///
    /// @details Example:
    ///        <tt>join({a,b,c}, {x,y}) = {a,b,c,x,y}</tt>
    friend const QList WRAP_ATTR join(const QList &reg1, const QList &reg2){
      return QList(__qlist_join(reg1._qlist, reg2._qlist)); }

    /// @brief Returns a \c std::vector of \c std::ref_wrappers for the qubits
    /// contained in the passed \c QList
    ///
    /// @details \c std::vector<std::ref_wrapper<qbit>> is used by quantum
    /// runtime APIs to specify the qubits on which the API results are
    /// returned. As such, this function allows the user to convert a
    /// compile-time \c QList into a runtime construct for use by
    /// such APIs.
    /// @return \c std::vector<std::ref_wrapper<qbit>>
    ///
    friend std::vector<std::reference_wrapper<qbit>> 
    WRAP_ATTR to_ref_wrappers(QList reg){
      std::vector<std::reference_wrapper<qbit>> qbit_refs;
      unsigned N = reg.size();
      qbit** built_refs = __qlist_build(reg._qlist);
      for (int i = 0; i < N; i++) {
        qbit_refs.push_back(**built_refs);
        built_refs += 1; 
      }
      return qbit_refs; 
    }
    
      /// @brief Control a unitary \c QExpr by the qubits in the \c qs being
      ///        in the basis state \c idx
      friend QExpr qexpr::control(const QList &qs, unsigned int idx, QExpr);
      /// @brief Control a unitary \c QExpr by the qubits in the \c qs being
      ///        in the basis state \c |1...1>
      friend QExpr qexpr::control(const QList & qs, QExpr);

};

unsigned long WRAP_ATTR size(qbit *reg){
  return __qlist_size(reg); }

/// @brief Compare two qbits for equality
bool WRAP_ATTR qbits_equal(qbit& q1, qbit& q2){
  return __qlist_equal(&q1, &q2);
}

}

#endif //LLVM_CLANG_QLIST_H
