# Overview for `AsciiDecoder`

## Description

Converts ASCII bytes to string.

 Example:
 ```dart
 const asciiDecoder = ;
 final asciiValues = [68, 97, 114, 116];
 final result = asciiDecoder.convert(asciiValues);
 print(result); // Dart
 ```
 Throws a [FormatException] if [bytes] contains values that are not
 in the range 0 .. 127, and [allowInvalid] is `false` (the default).

 If [allowInvalid] is `true`, any byte outside the range 0..127 is replaced
 by the Unicode replacement character, U+FFFD ('�').

 Example with `allowInvalid` set to true:
 ```dart
 const asciiDecoder = AsciiDecoder(allowInvalid: true);
 final asciiValues = [68, 97, 114, 116, 20, 0xFF];
 final result = asciiDecoder.convert(asciiValues);
 print(result); // Dart �
 print(result.codeUnits.last.toRadixString(16)); // fffd
 ```

## Dependencies

- _UnicodeSubsetDecoder

## Constructors

### Unnamed Constructor


