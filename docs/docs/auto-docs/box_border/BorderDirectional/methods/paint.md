# Method: `paint`

## Description

Paints the border within the given [Rect] on the given [Canvas].

 Uniform borders are more efficient to paint than more complex borders.

 You can provide a [BoxShape] to draw the border on. If the `shape` in
 [BoxShape.circle], there is the requirement that the border [isUniform].

 If you specify a rectangular box shape ([BoxShape.rectangle]), then you
 may specify a [BorderRadius]. If a `borderRadius` is specified, there is
 the requirement that the border [isUniform].

 The [getInnerPath] and [getOuterPath] methods do not know about the
 `shape` and `borderRadius` arguments.

 The `textDirection` argument is used to determine which of [start] and
 [end] map to the left and right. For [TextDirection.ltr], the [start] is
 the left and the [end] is the right; for [TextDirection.rtl], it is the
 reverse.

 See also:

  * [paintBorder], which is used if the border has non-uniform colors or styles and no borderRadius.

## Return Type
`void`

## Parameters

- `canvas`: `Canvas`
- `rect`: `Rect`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
