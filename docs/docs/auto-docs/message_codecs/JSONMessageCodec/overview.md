# Overview for `JSONMessageCodec`

## Description

[MessageCodec] with UTF-8 encoded JSON messages.

 Supported messages are acyclic values of these forms:

  * null
  * [bool]s
  * [num]s
  * [String]s
  * [List]s of supported values
  * [Map]s from strings to supported values

 On Android, messages are decoded using the `org.json` library.
 On iOS, messages are decoded using the `NSJSONSerialization` library.
 In both cases, the use of top-level simple messages (null, [bool], [num],
 and [String]) is supported (by the Flutter SDK). The decoded value will be
 null/nil for null, and identical to what would result from decoding a
 singleton JSON array with a Boolean, number, or string value, and then
 extracting its single element.

 The type returned from [decodeMessage] is `dynamic` (not `Object?`), which
 means *no type checking is performed on its return value*. It is strongly
 recommended that the return value be immediately cast to a known type to
 prevent runtime errors due to typos that the type checker could otherwise
 catch.

## Dependencies

- MessageCodec

## Constructors

### Unnamed Constructor
Creates a [MessageCodec] with UTF-8 encoded JSON messages.

