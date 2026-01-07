# Method: `paint`

## Description

Paints the border within the given [Rect] on the given [Canvas].

 This is an extension of the [ShapeBorder.paint] method. It allows
 [BoxBorder] borders to be applied to different [BoxShape]s and with
 different [borderRadius] parameters, without changing the [BoxBorder]
 object itself.

 The `shape` argument specifies the [BoxShape] to draw the border on.

 If the `shape` is specifies a rectangular box shape
 ([BoxShape.rectangle]), then the `borderRadius` argument describes the
 corners of the rectangle.

 The [getInnerPath] and [getOuterPath] methods do not know about the
 `shape` and `borderRadius` arguments.

 See also:

  * [paintBorder], which is used if the border has non-uniform colors or styles and no borderRadius.
  * [Border.paint], similar to this method, includes additional comments
    and provides more details on each parameter than described here.

## Return Type
`void`

## Parameters

- `canvas`: `Canvas`
- `rect`: `Rect`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
