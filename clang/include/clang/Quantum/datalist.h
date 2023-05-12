//===--- datalist.h ------------------------------------------------*- C++ -*-===//
//
// Copyright (C) 2023 Intel Corporation
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//
///
/// \file
/// DataList definition
///
//===----------------------------------------------------------------------===//

#include "fleq_fw_decs.h"

#ifndef LLVM_CLANG_QUANTUM_DATALIST_H
#define LLVM_CLANG_QUANTUM_DATALIST_H

#define STRINGIFYDATA(D) #D
#define import_with_name_begin(NAME) const char NAME ## _raw[] = 
#define import_with_name_end(NAME) ; const datalist::DataList NAME(NAME ## _raw)

#include <string>

namespace datalist { class DataList; }

namespace qexpr{
  QExpr exitAtCompile(datalist::DataList d);
  QExpr exitAtRuntime(datalist::DataList d);
  QExpr printDataList(datalist::DataList d, QExpr e);
}

using namespace quantum_builtin;

namespace datalist {

struct DataList {

  private: 
    /// @cond
    const char * const _datalist;

    WRAP_ATTR operator const char*() const { 
      return _datalist; }
    /// @endcond

  public:

    /// @brief Create a \c DataList from a C string.
    WRAP_ATTR DataList(const char *d) : _datalist(d) {}
    /// @brief Create a copy of a \c DataList
    DataList(const DataList &dl) = default;

    /// @brief Create a \c DataList from an \c int.
    WRAP_ATTR DataList(int val) : _datalist(__datalist_from(val)){}

    /// @brief Returns an empty \c DataList
    static const DataList WRAP_ATTR empty_list(){
      return DataList(__datalist_empty()); }

    /// @brief Returns the integer corresponding to the \c DataList \c a
    /// @param a A \c DataList representing an integer
    friend int WRAP_ATTR _i(const DataList a){
      return __datalist_integerize(a._datalist); }

    /// @brief Returns the integer corresponding to current \c DataList
    int WRAP_ATTR to_int() const {
      return __datalist_integerize(_datalist); }

    /// @brief Returns the \c double corresponding to the \c DataList \c a
    /// @param a A \c DataList representing a floating-point number
    friend double WRAP_ATTR _d(const DataList a){
      return __datalist_floatize(a._datalist); }

    /// @brief Returns the \c double corresponding to the current \c DataList
    double WRAP_ATTR to_double() const {
      return __datalist_floatize(_datalist); }

    /// @brief Returns the boolean corresponding to the \c DataList \c a
    /// @param a A \c DataList representing a boolean
    friend bool WRAP_ATTR _b(const DataList a){
      return __datalist_booleanize(a._datalist); }

    /// Returns the boolean corresponding to the current \c DataList
    bool WRAP_ATTR to_bool() const {
      return __datalist_booleanize(_datalist); }
 
    /// @brief Index into a \c DataList
    char WRAP_ATTR operator[](unsigned long i) const { 
      return __datalist_at(_datalist, i); }
  
    /// @brief Dereference a \c DataList
    char WRAP_ATTR operator*() const {
      return __datalist_at(_datalist, 0); }
  
    /// @brief Returns \c true if the size of the \c DataList is 0
    bool WRAP_ATTR empty() const {
      return __datalist_size(_datalist) <= 0; }

    /// @brief Return the size of the current \c DataList
    unsigned long WRAP_ATTR size() const {
      return __datalist_size(_datalist); }

    /// @brief Return the size of the \c DataList
    friend unsigned long WRAP_ATTR size(const DataList a){
      return __datalist_size(a._datalist); }

    /// @brief Produces a slice of a \c DataList, starting from index \c a and
    ///        ending at index \c b-1.
    ///
    /// @details Example: If <tt>d = "uvxyz"</tt> then <tt>d(2,4) = "xy"</tt>.
    const DataList WRAP_ATTR operator()(unsigned long a, unsigned long b) const{
      return DataList(__datalist_slice(_datalist, a, b)); }

    /// @brief Produces a slice of a \c DataList
    const DataList WRAP_ATTR operator()(unsigned long from, const DataList to) const {
      return DataList(__datalist_slice(_datalist, from, find(to))); }

    /// @brief Produces a slice of a \c DataList
    const DataList WRAP_ATTR operator()(const DataList from, unsigned long to) const {
      return DataList(__datalist_slice(_datalist, find(from), to)); }
  
    /// @brief Produces a slice of a \c DataList
    const DataList WRAP_ATTR operator()(const DataList from, const DataList to) const{
      return DataList(__datalist_slice(_datalist, find(from), find(to))); }  

    /// @brief Concatenates two \c DataLists together.
    ///
    /// @details Example: <tt>"abc" + "xyz" = "abcxyz"</tt>
    friend const DataList WRAP_ATTR operator+(const DataList a, const DataList b){
      return DataList(__datalist_join(a._datalist, b._datalist)); }

    /// @brief Shifts the \c DataList right by 1.
    const DataList WRAP_ATTR operator++() const {
      return DataList(_datalist + 1); }

    /// @brief Shifts the \c DataList left by \c i.
    ///
    /// @details Example: <tt>"abc" << 1 = "ab"</tt>.
    const DataList WRAP_ATTR operator<<(const unsigned i) const {
      return DataList(__datalist_slice(_datalist, 0, __datalist_size(_datalist) - i)); }

    /// @brief Shifts the \c DataList right by \c i.
    ///
    /// @details Example: <tt>"abc" >> 1 = "bc"</tt>.
    const DataList WRAP_ATTR operator>>(const unsigned i) const {
      return DataList(_datalist + i); }

    /// @brief Returns the index of the first occurrence of \c d in the current
    ///        \c DataList.
    unsigned long WRAP_ATTR find(const DataList d) const {
      return __datalist_find(_datalist, d._datalist, 0); }

    /// @brief Returns the index of the last occurrence of \c d in the current
    ///        \c DataList.
    unsigned long WRAP_ATTR find_last(const DataList d) const {
      return __datalist_find(_datalist, d._datalist, 1); }

    /// @brief Returns the index of the first occurrence of any of the
    ///        characters in \c d in the current \c DataList.
    ///
    /// @details Example: <tt>DataList("xyz20").find_any("012")</tt>
    ///        will return the index 3, because <tt>"xyz20"[3] = 2</tt>.
    unsigned long WRAP_ATTR find_any(const DataList d) const {
      return __datalist_find(_datalist, d._datalist, 2); }

    /// @brief Returns the index of the last occurrence of any of the
    ///        characters in \c d in the current \c DataList.
    unsigned long WRAP_ATTR find_any_last(const DataList d) const {
      return __datalist_find(_datalist, d._datalist, 3); }

    /// @brief Returns the index of the first character not matching
    ///        \c d. Will return 0 if \c d is not a prefix of the
    ///        current \c DataList.
    unsigned long WRAP_ATTR find_not(const DataList d) const {
      return __datalist_find(_datalist, d._datalist, -1); }

    /// @brief Returns the index of the last character not matching
    ///        \c d. Will return \c size() if \c d is not a suffix
    ///        of the current \c DataList.
    unsigned long WRAP_ATTR find_not_last(const DataList d) const {
      return __datalist_find(_datalist, d._datalist, -2); }

    /// @brief Returns the \c DataList sliced beginning at the first occurrence
    ///        of \c d.
    ///
    /// @details Example: <tt>DataList("find this 123 or this 345").next("this") =
    ///       "this 123 or this 345"</tt>
    const DataList WRAP_ATTR next(const DataList d) const {
      return DataList(__datalist_slice(_datalist, find(d), size())); }

    /** @brief Returns the DataList sliced beginning at the next occurrence of
      *        any of the given arguments. Example:
    @code{.unparsed}
    DataList("The quick brown fox.").next("fox", "quick") = "quick brown fox."
    DataList("The quick brown fox.").next("fox", "house") = "fox."
    @endcode
      */
    template<typename... Args>
    const DataList WRAP_ATTR next(const DataList d, Args... ds) const {
      return DataList(__datalist_longer(next(d), next(ds...))); }

    /// @brief Returns the \c DataList occurring directly after the first occurrence
    ///        of \c d in the current \c DataList.
    const DataList WRAP_ATTR after_next(const DataList d) const {
      return DataList(__datalist_slice(_datalist, find(d) + d.size(), size())); }

    /// @brief Returns the \c DataList sliced starting after the next occurrence
    ///        of \c d.
    ///
    /// @details Example: <tt>DataList("find this 123").next("this") = " 123"</tt>
    template<typename... Args>
    const DataList WRAP_ATTR after_next(const DataList d, Args... ds) const {
      return DataList(__datalist_longer(after_next(d), after_next(ds...))); }

    /// @brief Returns the \c DataList occurring after the index \c find_not(d)
    const DataList WRAP_ATTR next_not(const DataList d) const {
      return DataList(__datalist_slice(_datalist, find_not(d), size())); }

    /// @brief    Returns the first \c DataList block whose elements
    ///           all match any of the characters in \c d
    ///
    ///           For example, <tt>next_block("0123456789")</tt> will return
    ///           the first integer in the current \c DataList.
    const DataList WRAP_ATTR next_block(const DataList d) const {
      auto start = find_any(d);
      auto width = DataList(_datalist + start).find_not(d);
      return DataList(__datalist_slice(_datalist, start, start+width));
    }

    /// @brief Returns the \c DataList sliced beginning at the last occurrence of \c d.
    ///
    /// @details Example: <tt>DataList("find this 123 or this 345").last("this") = "this 345"</tt>
    const DataList WRAP_ATTR last(const DataList d) const{
      return DataList(__datalist_slice(_datalist, find_last(d), size())); }

    /// @brief Returns the \c DataList sliced beginning at the last occurrence of
    ///        any of the given arguments.
    ///
    /// @details Example: <tt>DataList("find this or this 123").last("1", "2", "3") = "3"</tt>
    template<typename... Args>
    const DataList WRAP_ATTR last(const DataList d, Args... ds) const {
      return DataList(__datalist_shorter(last(d), last(ds...))); }

    /// @brief Returns the slice of the current \c DataList after the last instance
    ///				 of \c d.
    const DataList WRAP_ATTR after_last(const DataList d) const {
      return DataList(__datalist_slice(_datalist, find_last(d) + d.size(), size())); }

    /// @brief Returns the \c DataList sliced beginning immediately after the last
    /// occurrence of \c d.
    ///
    /// @details Example: <tt>DataList("find this 123 or this 345").last("this") = " 345"</tt>
    template<typename... Args>
    const DataList WRAP_ATTR after_last(const DataList d, Args... ds) const {
      return DataList(__datalist_shorter(after_last(d), after_last(ds...))); }

    /// @brief Returns the slice of the current \c DataList after the
    ///        index \c find_not_last(d).
    const DataList WRAP_ATTR last_not(const DataList d) const{
      return DataList(__datalist_slice(_datalist, find_not_last(d), size())); }

    /// @brief    Returns the last \c DataList block whose elements
    ///           all match any of the characters in \c d
    ///
    /// @details For example, <tt>last_block("0123456789")</tt> will return
    ///           the last integer in the current \c DataList.
    const DataList WRAP_ATTR last_block(const DataList d) const {
      auto start = find_any_last(d);
      auto width = DataList(_datalist + start).find_not(d);
      return DataList(__datalist_slice(_datalist, start, start+width));
    }

    /// @brief Returns \c true if the current \c DataList contains \c d.
    bool WRAP_ATTR contains(const DataList d) const {
      return __datalist_contains(_datalist, d._datalist); }

    /// @brief Returns the number of instances of \c d in the current \c DataList.
    unsigned long WRAP_ATTR count(const DataList d) const {
      return __datalist_count(_datalist, d._datalist); }

    /// @brief Returns the number of instances of any of the arguments in the
    ///        in the current \c DataList.
    template<typename... Args>
    unsigned long WRAP_ATTR count(const DataList d, Args... ds) const {
      return count(d) + count(ds...); }

    /// @brief Returns the \c DataList stripped of beginning and trailing characters.
    ///         If \c start and \c end are not the first and/or last characters of
    ///         \c name respectively, then \c trim will have no effect.
    const DataList WRAP_ATTR trim(const DataList start = DataList(" "),
                                  const DataList end = DataList(" ")) const{
      return DataList(__datalist_slice(_datalist, find_not(start), find_not_last(end) + 1));
    }

    /// @brief Compares two \c DataLists for equality.
    const friend bool WRAP_ATTR operator==(const DataList a, const DataList b) {
      return a.contains(b) && b.contains(a);
    }

    /// @brief Converts a \c DataList into a C++ string
    friend std::string WRAP_ATTR to_string(const DataList a){
      return std::string(__datalist_build(a._datalist));
    }

    /// @brief Converts a \c DataList into a C string
    friend const char * WRAP_ATTR to_char_array(const DataList a){
      return __datalist_build(a._datalist);
    }

    /// @brief Generate an array of \c Type` objects of size \c N with IR name
    /// \c name (for printing and debugging purposes) and return a pointer to
    /// the first element. No additional memory management is required.
    /// The scope of the variable will be the same as that of the evaluation
    /// call.
    template<class Type>
    friend Type * WRAP_ATTR IQC_alloca(const DataList name, const unsigned long size){
      return __datalist_alloca(name._datalist, size, Type());
    }

    /// @brief Exit at compile-time with the error message \c d
    friend QExpr qexpr::exitAtCompile(DataList d);
    /// @brief Exit at runtime with the error message \c d
    friend QExpr qexpr::exitAtRuntime(DataList d);
    /// @brief Print the \c DataList \c d and return \c e
    friend QExpr qexpr::printDataList(DataList d, QExpr e);

};

template<class Type>
Type * WRAP_ATTR IQC_alloca(const DataList name, const unsigned long size);

}

#endif //LLVM_CLANG_QUANTUM_DATALIST_H
