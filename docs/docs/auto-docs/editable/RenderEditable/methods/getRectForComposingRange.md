# Method: `getRectForComposingRange`

## Description

Returns the smallest [Rect], in the local coordinate system, that covers
 the text within the [TextRange] specified.

 This method is used to calculate the approximate position of the IME bar
 on iOS.

 Returns null if [TextRange.isValid] is false for the given `range`, or the
 given `range` is collapsed.

## Return Type
`Rect?`

## Parameters

- `range`: `TextRange`
