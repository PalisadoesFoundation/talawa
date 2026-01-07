# Overview for `int`

## Description

An integer number.

 The default implementation of `int` is 64-bit two's complement integers
 with operations that wrap to that range on overflow.

 **Note:** When compiling to JavaScript, integers are restricted to values
 that can be represented exactly by double-precision floating point values.
 The available integer values include all integers between -2^53 and 2^53,
 and some integers with larger magnitude. That includes some integers larger
 than 2^63.
 The behavior of the operators and methods in the [int]
 class therefore sometimes differs between the Dart VM and Dart code
 compiled to JavaScript. For example, the bitwise operators truncate their
 operands to 32-bit integers when compiled to JavaScript.

 Classes cannot extend, implement, or mix in `int`.

 **See also:**
 * [num] the super class for [int].
 * [Numbers](https://dart.dev/guides/language/numbers) in
 [A tour of the Dart language](https://dart.dev/guides/language/language-tour).

## Dependencies

- num

## Constructors

### fromEnvironment
Integer value for [name] in the compilation configuration environment.

 The compilation configuration environment is provided by the
 surrounding tools which are compiling or running the Dart program.
 The environment is a mapping from a set of string keys to their associated
 string value.
 The string value, or lack of a value, associated with a [name]
 must be consistent across all calls to [String.fromEnvironment],
 `int.fromEnvironment`, [bool.fromEnvironment] and [bool.hasEnvironment]
 in a single program.
 The string values can be directly accessed using
 [String.fromEnvironment].

 This constructor looks up the string value for [name],
 then attempts to parse it as an integer, using the same syntax rules as
 [int.parse]/[int.tryParse]. That is, it accepts decimal numerals
 and hexadecimal numerals with a `0x` prefix, and it accepts a leading
 minus sign.
 If there is no value associated with [name] in the compilation
 configuration environment, or if the associated string value cannot
 be parsed as an integer, the value of the constructor invocation
 is the [defaultValue] integer, which defaults to the integer zero.

 The result is effectively the same as that of:
 ```dart template:expression
 int.tryParse(const String.fromEnvironment(name, defaultValue: ""))
     ?? defaultValue
 ```
 except that the constructor invocation can be a constant value.

 Example:
 ```dart
 const defaultPort = int.fromEnvironment("defaultPort", defaultValue: 80);
 ```
 In order to check whether a value is there at all, use
 [bool.hasEnvironment]. Example:
 ```dart
 const int? maybeDeclared = bool.hasEnvironment("defaultPort")
     ? int.fromEnvironment("defaultPort")
     : null;
 ```

 The string value, or lack of a value, associated with a [name]
 must be consistent across all calls to [String.fromEnvironment],
 `int.fromEnvironment`, [bool.fromEnvironment] and [bool.hasEnvironment]
 in a single program.

 This constructor is only guaranteed to work when invoked as `const`.
 It may work as a non-constant invocation on some platforms which
 have access to compiler options at run-time, but most ahead-of-time
 compiled platforms will not have this information.

#### Parameters

- `name`: `String`
- ``: `dynamic`
