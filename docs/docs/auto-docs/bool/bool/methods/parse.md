# Method: `parse`

## Description

Parses [source] as an, optionally case-insensitive, boolean literal.

 If [caseSensitive] is `true`, which is the default,
 the only accepted inputs are the strings `"true"` and `"false"`,
 which returns the results `true` and `false` respectively.

 If [caseSensitive] is `false`, any combination of upper and lower case
 ASCII letters in the words `"true"` and `"false"` are accepted,
 as if the input was first lower-cased.

 Throws a [FormatException] if the [source] string does not contain
 a valid boolean literal.

 Rather than throwing and immediately catching the [FormatException],
 instead use [tryParse] to handle a potential parsing error.

 Example:
 ```dart
 print(bool.parse('true')); // true
 print(bool.parse('false')); // false
 print(bool.parse('TRUE')); // throws FormatException
 print(bool.parse('TRUE', caseSensitive: false)); // true
 print(bool.parse('FALSE', caseSensitive: false)); // false
 print(bool.parse('NO')); // throws FormatException
 print(bool.parse('YES')); // throws FormatException
 print(bool.parse('0')); // throws FormatException
 print(bool.parse('1')); // throws FormatException
 ```

## Return Type
`bool`

## Parameters

- `source`: `String`
- ``: `dynamic`
