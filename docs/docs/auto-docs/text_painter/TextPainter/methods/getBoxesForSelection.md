# Method: `getBoxesForSelection`

## Description

Returns a list of rects that bound the given selection.

 The [selection] must be a valid range (with [TextSelection.isValid] true).

 The [boxHeightStyle] and [boxWidthStyle] arguments may be used to select
 the shape of the [TextBox]s. These properties default to
 [ui.BoxHeightStyle.tight] and [ui.BoxWidthStyle.tight] respectively.

 A given selection might have more than one rect if this text painter
 contains bidirectional text because logically contiguous text might not be
 visually contiguous.

 Leading or trailing newline characters will be represented by zero-width
 `TextBox`es.

 The method only returns `TextBox`es of glyphs that are entirely enclosed by
 the given `selection`: a multi-code-unit glyph will be excluded if only
 part of its code units are in `selection`.

## Return Type
`List&lt;TextBox&gt;`

## Parameters

- `selection`: `TextSelection`
- ``: `dynamic`
- ``: `dynamic`
