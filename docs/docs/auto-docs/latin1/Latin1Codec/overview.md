# Overview for `Latin1Codec`

## Description

A [Latin1Codec] encodes strings to ISO Latin-1 (aka ISO-8859-1) bytes
 and decodes Latin-1 bytes to strings.

## Dependencies

- Encoding

## Members

- **_allowInvalid**: `bool`
## Constructors

### Unnamed Constructor
Instantiates a new [Latin1Codec].

 If [allowInvalid] is true, the [decode] method and the converter
 returned by [decoder] will default to allowing invalid values. Invalid
 values are decoded into the Unicode Replacement character (U+FFFD).
 Calls to the [decode] method can override this default.

 Encoders will not accept invalid (non Latin-1) characters.

