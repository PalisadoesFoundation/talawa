# Method: `getTextColor`

## Description

The foreground color of the [button]'s text and icon.

 If [button] is not [MaterialButton.enabled], the value of
 [getDisabledTextColor] is returned. If the button is enabled and
 [MaterialButton.textColor] is non-null, then [MaterialButton.textColor]
 is returned.

 Otherwise the text color depends on the value of [getTextTheme]
 and [getBrightness].

  * [ButtonTextTheme.normal]: [Colors.white] is used if [getBrightness]
    resolves to [Brightness.dark]. [Colors.black87] is used if
    [getBrightness] resolves to [Brightness.light].
  * [ButtonTextTheme.accent]: [ColorScheme.secondary] of [colorScheme].
  * [ButtonTextTheme.primary]: If [getFillColor] is dark then [Colors.white],
    otherwise [Colors.black].

## Return Type
`Color`

## Parameters

- `button`: `MaterialButton`
