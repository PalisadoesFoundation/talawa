# Overview for `Latin1Encoder`

## Description

This class converts strings of only ISO Latin-1 characters to bytes.

 Example:
 ```dart
 final latin1Encoder = latin1.encoder;

 const sample = 'àáâãäå';
 final encoded = latin1Encoder.convert(sample);
 print(encoded); // [224, 225, 226, 227, 228, 229]
 ```

## Dependencies

- _UnicodeSubsetEncoder

## Constructors

### Unnamed Constructor


