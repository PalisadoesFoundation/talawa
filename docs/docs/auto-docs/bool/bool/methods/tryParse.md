# Method: `tryParse`

## Description

Parses [source] as an, optionally case-insensitive, boolean literal.

 If [caseSensitive] is `true`, which is the default,
 the only accepted inputs are the strings `"true"` and `"false"`,
 which returns the results `true` and `false` respectively.

 If [caseSensitive] is `false`, any combination of upper and lower case
 ASCII letters in the words `"true"` and `"false"` are accepted,
 as if the input was first lower-cased.

 Returns `null` if the [source] string does not contain a valid
 boolean literal.

 If the input can be assumed to be valid, use [bool.parse] to avoid
 having to deal with a possible `null` result.

 Example:
 ```dart
 print(bool.tryParse('true')); // true
 print(bool.tryParse('false')); // false
 print(bool.tryParse('TRUE')); // null
 print(bool.tryParse('TRUE', caseSensitive: false)); // true
 print(bool.tryParse('FALSE', caseSensitive: false)); // false
 print(bool.tryParse('NO')); // null
 print(bool.tryParse('YES')); // null
 print(bool.tryParse('0')); // null
 print(bool.tryParse('1')); // null
 ```

## Return Type
`bool?`

## Parameters

- `source`: `String`
- ``: `dynamic`
