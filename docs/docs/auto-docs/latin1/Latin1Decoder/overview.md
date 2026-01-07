# Overview for `Latin1Decoder`

## Description

This class converts Latin-1 bytes (lists of unsigned 8-bit integers)
 to a string.

 Example:
 ```dart
 final latin1Decoder = latin1.decoder;

 const encodedBytes = [224, 225, 226, 227, 228, 229];
 final decoded = latin1Decoder.convert(encodedBytes);
 print(decoded); // àáâãäå

 // Hexadecimal values as source
 const hexBytes = [0xe0, 0xe1, 0xe2, 0xe3, 0xe4, 0xe5];
 final decodedHexBytes = latin1Decoder.convert(hexBytes);
 print(decodedHexBytes); // àáâãäå
 ```
 Throws a [FormatException] if the encoded input contains values that are
 not in the range 0 .. 255 and [allowInvalid] is false ( the default ).

 If [allowInvalid] is true, invalid bytes are converted
 to Unicode Replacement character U+FFFD (�).

 Example with `allowInvalid` set to true:
 ```dart
 const latin1Decoder = Latin1Decoder(allowInvalid: true);
 const encodedBytes = [300];
 final decoded = latin1Decoder.convert(encodedBytes);
 print(decoded); // �
 ```

## Dependencies

- _UnicodeSubsetDecoder

## Constructors

### Unnamed Constructor
Instantiates a new [Latin1Decoder].

 The optional [allowInvalid] argument defines how [convert] deals
 with invalid bytes.

 If it is `true`, [convert] replaces invalid bytes with the Unicode
 Replacement character `U+FFFD` (�).
 Otherwise it throws a [FormatException].

