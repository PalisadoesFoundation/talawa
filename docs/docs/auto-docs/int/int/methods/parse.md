# Method: `parse`

## Description

Parse [source] as a, possibly signed, integer literal and return its value.

 The [source] must be a non-empty sequence of base-[radix] digits,
 optionally prefixed with a minus or plus sign ('-' or '+').

 The [radix] must be in the range 2..36. The digits used are
 first the decimal digits 0..9, and then the letters 'a'..'z' with
 values 10 through 35. Also accepts upper-case letters with the same
 values as the lower-case ones.

 If no [radix] is given then it defaults to 10. In this case, the [source]
 digits may also start with `0x`, in which case the number is interpreted
 as a hexadecimal integer literal,
 When `int` is implemented by 64-bit signed integers,
 hexadecimal integer literals may represent values larger than
 2&lt;sup&gt;63</sup>, in which case the value is parsed as if it is an
 *unsigned* number, and the resulting value is the corresponding
 signed integer value.

 For any int `n` and valid radix `r`, it is guaranteed that
 `n == int.parse(n.toRadixString(r), radix: r)`.

 If the [source] string does not contain a valid integer literal,
 optionally prefixed by a sign, a [FormatException] is thrown.

 Rather than throwing and immediately catching the [FormatException],
 instead use [tryParse] to handle a potential parsing error.

 Example:
 ```dart
 var value = int.tryParse(text);
 if (value == null) 
 ```

## Return Type
`int`

## Parameters

- `source`: `String`
- ``: `dynamic`
