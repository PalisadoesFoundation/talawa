# Overview for `AsciiCodec`

## Description

An [AsciiCodec] allows encoding strings as ASCII bytes
 and decoding ASCII bytes to strings.

## Dependencies

- Encoding

## Members

- **_allowInvalid**: `bool`
## Constructors

### Unnamed Constructor
Instantiates a new [AsciiCodec].

 If [allowInvalid] is true, the [decode] method and the converter
 returned by [decoder] will default to allowing invalid values.
 If allowing invalid values, the values will be decoded into the Unicode
 Replacement character (U+FFFD). If not, an exception will be thrown.
 Calls to the [decode] method can choose to override this default.

 Encoders will not accept invalid (non ASCII) characters.

