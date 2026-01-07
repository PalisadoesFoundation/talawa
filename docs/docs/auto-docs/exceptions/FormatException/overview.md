# Overview for `FormatException`

## Description

Exception thrown when a string or some other data does not have an expected
 format and cannot be parsed or processed.

## Dependencies

- Exception

## Members

- **message**: `String`
  A message describing the format error.

- **source**: `dynamic`
  The actual source input which caused the error.

 This is usually a [String], but can be other types too.
 If it is a string, parts of it may be included in the [toString] message.

 The source is `null` if omitted or unknown.

- **offset**: `int?`
  The offset in [source] where the error was detected.

 A zero-based offset into the source that marks the format error causing
 this exception to be created. If `source` is a string, this should be a
 string index in the range `0 <= offset <= source.length`.

 If input is a string, the [toString] method may represent this offset as
 a line and character position. The offset should be inside the string,
 or at the end of the string.

 May be omitted. If present, [source] should also be present if possible.

## Constructors

### Unnamed Constructor
Creates a new `FormatException` with an optional error [message].

 Optionally also supply the actual [source] with the incorrect format,
 and the [offset] in the format where a problem was detected.

