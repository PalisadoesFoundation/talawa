# Method: `getDisabledFillColor`

## Description

The [button]'s background color when [MaterialButton.onPressed] is null
 (when [MaterialButton.enabled] is false).

 Returns the button's [MaterialButton.disabledColor] if it is non-null.

 Otherwise the value of the `disabledColor` constructor parameter
 is returned, if it is non-null.

 Otherwise the color scheme's [ColorScheme.onSurface] color is returned
 with its opacity set to 0.38.

## Return Type
`Color`

## Parameters

- `button`: `MaterialButton`
