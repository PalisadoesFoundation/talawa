# Method: `parse`

## Description

Parses [source] as a, possibly signed, integer literal and returns its
 value.

 The [source] must be a non-empty sequence of base-[radix] digits,
 optionally prefixed with a minus or plus sign ('-' or '+').

 The [radix] must be in the range 2..36. The digits used are
 first the decimal digits 0..9, and then the letters 'a'..'z' with
 values 10 through 35. Also accepts upper-case letters with the same
 values as the lower-case ones.

 If no [radix] is given then it defaults to 10. In this case, the [source]
 digits may also start with `0x`, in which case the number is interpreted
 as a hexadecimal literal, which effectively means that the `0x` is ignored
 and the radix is instead set to 16.

 For any int `n` and radix `r`, it is guaranteed that
 `n == int.parse(n.toRadixString(r), radix: r)`.

 Throws a [FormatException] if the [source] is not a valid integer literal,
 optionally prefixed by a sign.
 Examples:
 ```dart
 print(BigInt.parse('-12345678901234567890')); // -12345678901234567890
 print(BigInt.parse('0xFF')); // 255
 print(BigInt.parse('0xffffffffffffffff')); // 18446744073709551615

 // From binary (base 2) value.
 print(BigInt.parse('1100', radix: 2)); // 12
 print(BigInt.parse('00011111', radix: 2)); // 31
 print(BigInt.parse('011111100101', radix: 2)); // 2021
 // From octal (base 8) value.
 print(BigInt.parse('14', radix: 8)); // 12
 print(BigInt.parse('37', radix: 8)); // 31
 print(BigInt.parse('3745', radix: 8)); // 2021
 // From hexadecimal (base 16) value.
 print(BigInt.parse('c', radix: 16)); // 12
 print(BigInt.parse('1f', radix: 16)); // 31
 print(BigInt.parse('7e5', radix: 16)); // 2021
 // From base 35 value.
 print(BigInt.parse('y1', radix: 35)); // 1191 == 34 * 35 + 1
 print(BigInt.parse('z1', radix: 35)); // Throws.
 // From base 36 value.
 print(BigInt.parse('y1', radix: 36)); // 1225 == 34 * 36 + 1
 print(BigInt.parse('z1', radix: 36)); // 1261 == 35 * 36 + 1
 ```

## Return Type
`BigInt`

## Parameters

- `source`: `String`
- ``: `dynamic`
