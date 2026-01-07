# Method: `layout`

## Description

Computes the visual position of the glyphs for painting the text.

 The text will layout with a width that's as close to its max intrinsic
 width (or its longest line, if [textWidthBasis] is set to
 [TextWidthBasis.parent]) as possible while still being greater than or
 equal to `minWidth` and less than or equal to `maxWidth`.

 The [text] and [textDirection] properties must be non-null before this is
 called.

## Return Type
`void`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
