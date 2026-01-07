# Method: `getBoxesForSelection`

## Description

Returns a list of rects that bound the given selection.

 The [boxHeightStyle] and [boxWidthStyle] arguments may be used to select
 the shape of the [TextBox]es. These properties default to
 [ui.BoxHeightStyle.tight] and [ui.BoxWidthStyle.tight] respectively.

 A given selection might have more than one rect if the [RenderParagraph]
 contains multiple [InlineSpan]s or bidirectional text, because logically
 contiguous text might not be visually contiguous.

 Valid only after [layout].

 See also:

  * [TextPainter.getBoxesForSelection], the method in TextPainter to get
    the equivalent boxes.

## Return Type
`List<ui.TextBox>`

## Parameters

- `selection`: `TextSelection`
- ``: `dynamic`
- ``: `dynamic`
