# Overview for `Comparable`

## Description

Interface used by types that have an intrinsic ordering.

 The [compareTo] operation defines a total ordering of objects,
 which can be used for ordering and sorting.

 The [Comparable] interface should be used for the natural ordering of a type.
 If a type can be ordered in more than one way,
 and none of them is the obvious natural ordering,
 then it might be better not to use the [Comparable] interface,
 and to provide separate [Comparator]s instead.

 It is recommended that the order of a [Comparable] agrees
 with its operator [operator ==] equality (`a.compareTo(b) == 0` iff `a == b`),
 but this is not a requirement.
 For example, [double] and [DateTime] have `compareTo` methods
 that do not agree with operator [operator ==].
 For doubles the [compareTo] method is more precise than the equality,
 and for [DateTime] it is less precise.

 Examples:
 ```dart
 (0.0).compareTo(-0.0);   // => 1
 0.0 == -0.0;             // => true
 var now = DateTime.;
 var utcNow = now.;
 now == utcNow;           // => false
 now.compareTo(utcNow);   // => 0
 ```
 The [Comparable] interface does not imply the existence
 of the comparison operators `<`, `<=`, `>` and `>=`.
 These should only be defined
 if the ordering is a less-than/greater-than ordering,
 that is, an ordering where you would naturally
 use the words "less than" about the order of two elements.

 If the equality operator and [compareTo] disagree,
 the comparison operators should follow the equality operator,
 and will likely also disagree with [compareTo].
 Otherwise they should match the [compareTo] method,
 so that `a < b` iff `a.compareTo(b) < 0`.

 The [double] class defines comparison operators
 that are compatible with equality.
 The operators differ from [double.compareTo] on -0.0 and NaN.

 The [DateTime] class has no comparison operators, instead it has the more
 precisely named [DateTime.isBefore] and [DateTime.isAfter], which both
 agree with [DateTime.compareTo].

