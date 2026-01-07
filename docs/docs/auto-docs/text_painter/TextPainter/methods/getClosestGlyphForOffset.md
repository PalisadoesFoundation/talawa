# Method: `getClosestGlyphForOffset`

## Description

Returns the [GlyphInfo] of the glyph closest to the given `offset` in the
 paragraph coordinate system, or null if the text is empty, or is entirely
 clipped or ellipsized away.

 This method first finds the line closest to `offset.dy`, and then returns
 the [GlyphInfo] of the closest glyph(s) within that line.

## Return Type
`ui.GlyphInfo?`

## Parameters

- `offset`: `Offset`
