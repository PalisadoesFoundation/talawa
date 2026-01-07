# Method: `paint`

## Description

Paint this input border on [canvas].

 The [rect] parameter bounds the [InputDecorator]'s container.

 The additional `gap` parameters reflect the state of the [InputDecorator]'s
 floating label. When an input decorator gains the focus, its label
 animates upwards, to make room for the input child. The [gapStart] and
 [gapExtent] parameters define a floating label width interval, and
 [gapPercentage] defines the animation's progress (0.0 to 1.0).

## Return Type
`void`

## Parameters

- `canvas`: `Canvas`
- `rect`: `Rect`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
