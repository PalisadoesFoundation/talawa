# Method: `toRadixString`

## Description

Converts this [int] to a string representation in the given [radix].

 In the string representation, lower-case letters are used for digits above
 '9', with 'a' being 10 and 'z' being 35.

 The [radix] argument must be an integer in the range 2 to 36.

 Example:
 ```dart
 // Binary (base 2).
 print(12.toRadixString(2)); // 1100
 print(31.toRadixString(2)); // 11111
 print(2021.toRadixString(2)); // 11111100101
 print((-12).toRadixString(2)); // -1100
 // Octal (base 8).
 print(12.toRadixString(8)); // 14
 print(31.toRadixString(8)); // 37
 print(2021.toRadixString(8)); // 3745
 // Hexadecimal (base 16).
 print(12.toRadixString(16)); // c
 print(31.toRadixString(16)); // 1f
 print(2021.toRadixString(16)); // 7e5
 // Base 36.
 print((35 * 36 + 1).toRadixString(36)); // z1
 ```

## Return Type
`String`

## Parameters

- `radix`: `int`
