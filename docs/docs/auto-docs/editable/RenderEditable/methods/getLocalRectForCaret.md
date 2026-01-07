# Method: `getLocalRectForCaret`

## Description

Returns the [Rect] in local coordinates for the caret at the given text
 position.

 See also:

  * [getPositionForPoint], which is the reverse operation, taking
    an [Offset] in global coordinates and returning a [TextPosition].
  * [getEndpointsForSelection], which is the equivalent but for
    a selection rather than a particular text position.
  * [TextPainter.getOffsetForCaret], the equivalent method for a
    [TextPainter] object.

## Return Type
`Rect`

## Parameters

- `caretPosition`: `TextPosition`
