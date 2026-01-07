# Method: `withClampedTextScaling`

## Description

Wraps the `child` in a [MediaQuery] and applies [TextScaler.clamp] on the
 current [MediaQueryData.textScaler].

 The returned widget must be inserted in a widget tree below an existing
 [MediaQuery] widget.

 This is a convenience function to restrict the range of the scaled text
 size to `[minScaleFactor * fontSize, maxScaleFactor * fontSize]` (to
 prevent excessive text scaling that would break the UI, for example). When
 `minScaleFactor` equals `maxScaleFactor`, the scaler becomes
 `TextScaler.linear(minScaleFactor)`.

## Return Type
`Widget`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
