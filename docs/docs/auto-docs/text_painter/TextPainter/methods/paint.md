# Method: `paint`

## Description

Paints the text onto the given canvas at the given offset.

 Valid only after [layout] has been called.

 If you cannot see the text being painted, check that your text color does
 not conflict with the background on which you are drawing. The default
 text color is white (to contrast with the default black background color),
 so if you are writing an application with a white background, the text
 will not be visible by default.

 To set the text style, specify a [TextStyle] when creating the [TextSpan]
 that you pass to the [TextPainter] constructor or to the [text] property.

## Return Type
`void`

## Parameters

- `canvas`: `Canvas`
- `offset`: `Offset`
