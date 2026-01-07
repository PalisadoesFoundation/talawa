# Method: `frictionFactor`

## Description

The multiple applied to overscroll to make it appear that scrolling past
 the edge of the scrollable contents is harder than scrolling the list.
 This is done by reducing the ratio of the scroll effect output vs the
 scroll gesture input.

 This factor starts at 0.52 and progressively becomes harder to overscroll
 as more of the area past the edge is dragged in (represented by an increasing
 `overscrollFraction` which starts at 0 when there is no overscroll).

## Return Type
`double`

## Parameters

- `overscrollFraction`: `double`
