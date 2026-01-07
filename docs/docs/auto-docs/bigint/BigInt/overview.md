# Overview for `BigInt`

## Description

An arbitrarily large integer value.

 Big integers are signed and can have an arbitrary number of
 significant digits, only limited by memory.

 To create a big integer from the provided number, use [BigInt.from].
 ```dart
 var bigInteger = BigInt.from(-1); // -1
 bigInteger = BigInt.from(0.9999); // 0
 bigInteger = BigInt.from(-10.99); // -10
 bigInteger = BigInt.from(0x7FFFFFFFFFFFFFFF); // 9223372036854775807
 bigInteger = BigInt.from(1e+30); // 1000000000000000019884624838656
 ```
 To parse a large integer value from a string, use [parse] or [tryParse].
 ```dart
 var value = BigInt.parse('0x1ffffffffffffffff'); // 36893488147419103231
 value = BigInt.parse('12345678901234567890'); // 12345678901234567890
 ```
 To check whether a big integer can be represented as an [int] without losing
 precision, use [isValidInt].
 ```dart continued
 print(bigNumber.isValidInt); // false
 ```
 To convert a big integer into an [int], use [toInt].
 To convert a big integer into an [double], use [toDouble].
 ```dart
 var bigValue = BigInt.from(10).pow(3);
 print(bigValue.isValidInt); // true
 print(bigValue.); // 1000
 print(bigValue.); // 1000.0
 ```
 **See also:**
 * [int]: An integer number.
 * [double]: A double-precision floating point number.
 * [num]: The super class for [int] and [double].
 * [Numbers](https://dart.dev/guides/language/numbers) in
 [A tour of the Dart language](https://dart.dev/guides/language/language-tour).

## Dependencies

- Comparable

## Constructors

### from
Creates a big integer from the provided [value] number.

 Examples:
 ```dart
 var bigInteger = BigInt.from(1); // 1
 bigInteger = BigInt.from(0.9999); // 0
 bigInteger = BigInt.from(-10.99); // -10
 ```

#### Parameters

- `value`: `num`
