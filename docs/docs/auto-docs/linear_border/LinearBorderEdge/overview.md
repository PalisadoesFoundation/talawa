# Overview for `LinearBorderEdge`

## Description

Defines the relative size and alignment of one [LinearBorder] edge.

 A [LinearBorder] defines a box outline as zero to four edges, each
 of which is rendered as a single line. The width and color of the
 lines is defined by [LinearBorder.side].

 Each line's length is defined by [size], a value between 0.0 and 1.0
 (the default) which defines the length as a percentage of the
 length of a box edge.

 When [size] is less than 1.0, the line is aligned within the
 available space according to [alignment], a value between -1.0 and
 1.0.  The default is 0.0, which means centered, -1.0 means align on the
 "start" side, and 1.0 means align on the "end" side. The meaning of
 start and end depend on the current [TextDirection], see
 [Directionality].

## Members

- **size**: `double`
  A value between 0.0 and 1.0 that defines the length of the edge as a
 percentage of the length of the corresponding box
 edge. Default is 1.0.

- **alignment**: `double`
  A value between -1.0 and 1.0 that defines how edges for which [size]
 is less than 1.0 are aligned relative to the corresponding box edge.

  * -1.0, aligned in the "start" direction. That's left
    for [TextDirection.ltr] and right for [TextDirection.rtl].
  * 0.0, centered.
  * 1.0, aligned in the "end" direction. That's right
    for [TextDirection.ltr] and left for [TextDirection.rtl].

## Constructors

### Unnamed Constructor
Defines one side of a [LinearBorder].

 The values of [size] and [alignment] must be between
 0.0 and 1.0, and -1.0 and 1.0 respectively.

