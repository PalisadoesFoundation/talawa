# Method: `paint`

## Description

Paints the border within the given [Rect] on the given [Canvas].

 Uniform borders and non-uniform borders with similar colors and styles
 are more efficient to paint than more complex borders.

 You can provide a [BoxShape] to draw the border on. If the `shape` in
 [BoxShape.circle], there is the requirement that the border has uniform
 color and style.

 If you specify a rectangular box shape ([BoxShape.rectangle]), then you
 may specify a [BorderRadius]. If a `borderRadius` is specified, there is
 the requirement that the border has uniform color and style.

 The [getInnerPath] and [getOuterPath] methods do not know about the
 `shape` and `borderRadius` arguments.

 The `textDirection` argument is not used by this paint method.

 See also:

  * [paintBorder], which is used if the border has non-uniform colors or styles and no borderRadius.
  * <https://pub.dev/packages/non_uniform_border>, a package that implements
    a Non-Uniform Border on ShapeBorder, which is used by Material Design
    buttons and other widgets, under the "shape" field.

## Return Type
`void`

## Parameters

- `canvas`: `Canvas`
- `rect`: `Rect`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
