# Method: `paint`

## Description

Paints the border around the given [Rect] on the given [Canvas], with the
 given rows and columns.

 Uniform borders are more efficient to paint than more complex borders.

 The `rows` argument specifies the vertical positions between the rows,
 relative to the given rectangle. For example, if the table contained two
 rows of height 100.0 each, then `rows` would contain a single value,
 100.0, which is the vertical position between the two rows (relative to
 the top edge of `rect`).

 The `columns` argument specifies the horizontal positions between the
 columns, relative to the given rectangle. For example, if the table
 contained two columns of height 100.0 each, then `columns` would contain a
 single value, 100.0, which is the vertical position between the two
 columns (relative to the left edge of `rect`).

 The [verticalInside] border is only drawn if there are at least two
 columns. The [horizontalInside] border is only drawn if there are at least
 two rows. The horizontal borders are drawn after the vertical borders.

 The outer borders (in the order [top], [right], [bottom], [left], with
 [left] above the others) are painted after the inner borders.

 The paint order is particularly notable in the case of
 partially-transparent borders.

## Return Type
`void`

## Parameters

- `canvas`: `Canvas`
- `rect`: `Rect`
- ``: `dynamic`
- ``: `dynamic`
