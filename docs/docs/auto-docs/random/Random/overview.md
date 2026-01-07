# Overview for `Random`

## Description

A generator of random bool, int, or double values.

 The default implementation supplies a stream of pseudo-random bits that are
 not suitable for cryptographic purposes.

 Use the [Random.secure] constructor for cryptographic purposes.

 To create a non-negative random integer uniformly distributed in the range
 from 0, inclusive, to max, exclusive, use [nextInt(int max)].
 ```dart
 var intValue = .nextInt(10); // Value is >= 0 and < 10.
 intValue = .nextInt(100) + 50; // Value is >= 50 and < 150.
 ```
 To create a non-negative random floating point value uniformly distributed
 in the range from 0.0, inclusive, to 1.0, exclusive, use [nextDouble].
 ```dart
 var doubleValue = .; // Value is >= 0.0 and < 1.0.
 doubleValue = . * 256; // Value is >= 0.0 and < 256.0.
 ```
 To create a random Boolean value, use [nextBool].
 ```dart
 var boolValue = .; // true or false, with equal chance.
 ```

## Constructors

### Unnamed Constructor
Creates a random number generator.

 The optional parameter [seed] is used to initialize the
 internal state of the generator. The implementation of the
 random stream can change between releases of the library.

### secure
Creates a cryptographically secure random number generator.

 If the program cannot provide a cryptographically secure
 source of random numbers, it throws an [UnsupportedError].

