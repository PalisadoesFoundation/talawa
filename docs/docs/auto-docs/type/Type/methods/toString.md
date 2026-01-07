# Method: `toString`

## Description

Returns a string which represents the underlying type.

 The string is only intended for providing information to a reader
 while debugging.
 There is no guaranteed format,
 the string value returned for a [Type] instances is entirely
 implementation dependent.

 The string should be consistent, so a `Type` object for the *same* type
 returns the same string throughout a program execution.
 The string may or may not contain parts corresponding to the
 source name of declaration of the type, if the type has a source name
 at all (some types reachable through `dart:mirrors` may not).

## Return Type
`String`

