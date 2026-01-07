# Overview for `AsciiEncoder`

## Description

Converts strings of only ASCII characters to bytes.

 Example:
 ```dart import:typed_data
 const asciiEncoder = ;
 const sample = 'Dart';
 final asciiValues = asciiEncoder.convert(sample);
 print(asciiValues); // [68, 97, 114, 116]
 ```

## Dependencies

- _UnicodeSubsetEncoder

## Constructors

### Unnamed Constructor


