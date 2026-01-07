# Method: `getSplashColor`

## Description

The color of the ink "splash" overlay that appears when the (enabled)
 [button] is tapped.

 Returns the button's [MaterialButton.splashColor] if it is non-null.

 Otherwise, returns the value of the `splashColor` constructor parameter
 it is non-null.

 Otherwise, returns the value of the `splashColor` constructor parameter
 if it is non-null and [getTextTheme] is not [ButtonTextTheme.primary].

 Otherwise, returns [getTextColor] with an opacity of 0.12.

## Return Type
`Color`

## Parameters

- `button`: `MaterialButton`
