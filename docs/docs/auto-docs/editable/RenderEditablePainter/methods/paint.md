# Method: `paint`

## Description

Paints within the bounds of a [RenderEditable].

 The given [Canvas] has the same coordinate space as the [RenderEditable],
 which may be different from the coordinate space the [RenderEditable]'s
 [TextPainter] uses, when the text moves inside the [RenderEditable].

 Paint operations performed outside of the region defined by the [canvas]'s
 origin and the [size] parameter may get clipped, when [RenderEditable]'s
 [RenderEditable.clipBehavior] is not [Clip.none].

## Return Type
`void`

## Parameters

- `canvas`: `Canvas`
- `size`: `Size`
- `renderEditable`: `RenderEditable`
