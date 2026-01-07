# Overview for `JSNumber`

## Description

Interceptor class for all Dart [num] implementations.

 JavaScript numbers (doubles) are used to represent both Dart [int] and Dart
 [double] values. Some values, e.g. `3.0` are both Dart [int] values and Dart
 [double] values. Other values are just [double] values, e.g. `3.1`.

 There are two disjoint subclasses of [JSNumber]: [JSInt] and [JSNumNotInt].

 Most methods are on [JSNumber]. Since some values can 'be' (i.e. implement)
 both [int] and [double], the int and double operations have to be the same.
 Consider the JavaScript value `0`. This is both Dart int 0, and Dart double
 0.0. From the dynamic type we can't tell the intention, so the
 `0.0.` on the web returns `0`, and not `0.0` like on the Dart VM
 implementation. For `toString` we prefer the `int` version. For negation, we
 prefer the `double` version (returning `-0.0`, not `0`). This is usually
 hidden because the JavaScript `-0.0` value is also considered to implement
 [int].

 Note that none of the methods in [JSNumber] delegate to a method defined on
 JSInt (or JSNumNotInt).  This is exploited in
 [tryComputeConstantInterceptor] to avoid most interceptor lookups on
 numbers.

## Dependencies

- Interceptor, double

## Members

- **_MIN_INT32**: `int`
- **_MAX_INT32**: `int`
## Constructors

### Unnamed Constructor


