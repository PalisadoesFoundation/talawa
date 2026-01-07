# Method: `getRectCallback`

## Description

The rectangle to use for the highlight effect and for clipping
 the splash effects if [containedInkWell] is true.

 This method is intended to be overridden by descendants that
 specialize [InkResponse] for unusual cases. For example,
 [TableRowInkWell] implements this method to return the rectangle
 corresponding to the row that the widget is in.

 The default behavior returns null, which is equivalent to
 returning the referenceBox argument's bounding box (though
 slightly more efficient).

## Return Type
`RectCallback?`

## Parameters

- `referenceBox`: `RenderBox`
