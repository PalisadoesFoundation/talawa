# Method: `isControlCharacter`

## Description

Returns true if the given label represents a Unicode control character.

 Examples of control characters are characters like "U+000A LINE FEED (LF)"
 or "U+001B ESCAPE (ESC)".

 See <https://en.wikipedia.org/wiki/Unicode_control_characters> for more
 information.

 Used by [RawKeyEvent] subclasses to help construct IDs.

## Return Type
`bool`

## Parameters

- `label`: `String`
