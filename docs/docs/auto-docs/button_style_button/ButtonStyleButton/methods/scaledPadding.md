# Method: `scaledPadding`

## Description

A convenience method used by subclasses in the framework, that returns an
 interpolated value based on the [fontSizeMultiplier] parameter:

  * 0 - 1 [geometry1x]
  * 1 - 2 lerp([geometry1x], [geometry2x], [fontSizeMultiplier] - 1)
  * 2 - 3 lerp([geometry2x], [geometry3x], [fontSizeMultiplier] - 2)
  * otherwise [geometry3x]

 This method is used by the framework for estimating the default paddings to
 use on a button with a text label, when the system text scaling setting
 changes. It's usually supplied with empirical [geometry1x], [geometry2x],
 [geometry3x] values adjusted for different system text scaling values, when
 the unscaled font size is set to 14.0 (the default [TextTheme.labelLarge]
 value).

 The `fontSizeMultiplier` argument, for historical reasons, is the default
 font size specified in the [ButtonStyle], scaled by the ambient font
 scaler, then divided by 14.0 (the default font size used in buttons).

## Return Type
`EdgeInsetsGeometry`

## Parameters

- `geometry1x`: `EdgeInsetsGeometry`
- `geometry2x`: `EdgeInsetsGeometry`
- `geometry3x`: `EdgeInsetsGeometry`
- `fontSizeMultiplier`: `double`
