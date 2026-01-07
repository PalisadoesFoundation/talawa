# Method: `getDisabledTextColor`

## Description

The foreground color of the [button]'s text and icon when
 [MaterialButton.onPressed] is null (when MaterialButton.enabled is false).

 Returns the button's [MaterialButton.disabledColor] if it is non-null.
 Otherwise the color scheme's [ColorScheme.onSurface] color is returned
 with its opacity set to 0.38.

 If [MaterialButton.textColor] is a [WidgetStateProperty&lt;Color&gt;], it will be
 used as the `disabledTextColor`. It will be resolved in the [WidgetState.disabled] state.

## Return Type
`Color`

## Parameters

- `button`: `MaterialButton`
