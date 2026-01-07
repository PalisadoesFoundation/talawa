# Method: `paint`

## Description

Draw a rounded rectangle around [rect] using [borderRadius].

 The [borderSide] defines the line's color and weight.

 The top side of the rounded rectangle may be interrupted by a single gap
 if [gapExtent] is non-null. In that case the gap begins at
 `gapStart - gapPadding` (assuming that the [textDirection] is [TextDirection.ltr]).
 The gap's width is `(gapPadding + gapExtent + gapPadding) * gapPercentage`.

## Return Type
`void`

## Parameters

- `canvas`: `Canvas`
- `rect`: `Rect`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
