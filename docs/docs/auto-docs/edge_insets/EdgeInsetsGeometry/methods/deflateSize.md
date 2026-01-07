# Method: `deflateSize`

## Description

Returns a new size that is smaller than the given size by the amount of
 inset in the horizontal and vertical directions.

 If the argument is smaller than [collapsedSize], then the resulting size
 will have negative dimensions.

 See also:

  * [EdgeInsets.deflateRect], to deflate a [Rect] rather than a [Size]. (for
    [EdgeInsetsDirectional], requires first calling [resolve] to establish
    how the start and end map to the left or right).
  * [inflateSize], to inflate a [Size] rather than deflating it.

## Return Type
`Size`

## Parameters

- `size`: `Size`
