# Method: `getFillColor`

## Description

The button's background fill color or null for buttons that don't have
 a background color.

 Returns [MaterialButton.color] if it is non-null and the button
 is enabled.

 Otherwise, returns [MaterialButton.disabledColor] if it is non-null and
 the button is disabled.

 Otherwise the fill color depends on the value of [getTextTheme].

  * [ButtonTextTheme.normal] or [ButtonTextTheme.accent], the
    color scheme's [ColorScheme.primary] color if the [button] is enabled
    the value of [getDisabledFillColor] otherwise.
  * [ButtonTextTheme.primary], if the [button] is enabled then the value
    of the `buttonColor` constructor parameter if it is non-null,
    otherwise the color scheme's ColorScheme.primary color. If the button
    is not enabled then the colorScheme's [ColorScheme.onSurface] color
    with opacity 0.12.

## Return Type
`Color?`

## Parameters

- `button`: `MaterialButton`
