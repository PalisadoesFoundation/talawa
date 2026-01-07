# Method: `getDirection`

## Description

Returns the [AxisDirection] in which the scroll view scrolls.

 Combines the [scrollDirection] with the [reverse] boolean to obtain the
 concrete [AxisDirection].

 If the [scrollDirection] is [Axis.horizontal], the ambient
 [Directionality] is also considered when selecting the concrete
 [AxisDirection]. For example, if the ambient [Directionality] is
 [TextDirection.rtl], then the non-reversed [AxisDirection] is
 [AxisDirection.left] and the reversed [AxisDirection] is
 [AxisDirection.right].

## Return Type
`AxisDirection`

## Parameters

- `context`: `BuildContext`
