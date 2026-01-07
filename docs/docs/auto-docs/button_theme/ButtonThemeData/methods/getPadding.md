# Method: `getPadding`

## Description

Padding for the [button]'s child (typically the button's label).

 Returns the button's [MaterialButton.padding] if it is non-null,
 otherwise, returns the `padding` of the constructor parameter if it is
 non-null.

 Otherwise, returns horizontal padding of 24.0 on the left and right if
 [getTextTheme] is [ButtonTextTheme.primary], 16.0 on the left and right
 otherwise.

## Return Type
`EdgeInsetsGeometry`

## Parameters

- `button`: `MaterialButton`
