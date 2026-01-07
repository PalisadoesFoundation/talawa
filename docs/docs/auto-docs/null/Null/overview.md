# Overview for `Null`

## Description

The reserved word `null` denotes an object that is the sole instance of
 this class.

 The `Null` class is the only class which does not implement `Object`.
 It is a compile-time error for a class to attempt to extend or implement
 [Null].

 The language contains a number of specialized operators for working with
 `null` value. Examples:
 ```dart
 e1!       // Throws if e1 is null.
 e2 ?? e3  // Same as e2, unless e2 is null, then use value of e3
 x ??= e4  // Same as x unless x is null, then same as `x = e4`.
 e5?. // call `foo` on e5, unless e5 is null.
 [...? e6] // spreads e6 into the list literal, unless e6 is null.
 ```

## Constructors

### _uninstantiable


