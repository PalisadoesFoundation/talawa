# Method: `padding`

## Description

Returns the insets to apply when using this decoration on a box
 that has contents, so that the contents do not overlap the edges
 of the decoration. For example, if the decoration draws a frame
 around its edge, the padding would return the distance by which
 to inset the children so as to not overlap the frame.

 This only works for decorations that have absolute sizes. If the padding
 needed would change based on the size at which the decoration is drawn,
 then this will return incorrect padding values.

 For example, when a [BoxDecoration] has [BoxShape.circle], the padding
 does not take into account that the circle is drawn in the center of the
 box regardless of the ratio of the box; it does not provide the extra
 padding that is implied by changing the ratio.

 The value returned by this getter must be resolved (using
 [EdgeInsetsGeometry.resolve] to obtain an absolute [EdgeInsets]. (For
 example, [BorderDirectional] will return an [EdgeInsetsDirectional] for
 its [padding].)

## Return Type
`EdgeInsetsGeometry`

