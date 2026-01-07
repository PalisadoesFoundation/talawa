# Method: `getHoverColor`

## Description

The fill color of the button when it has input focus.

 Returns the button's [MaterialButton.focusColor] if it is non-null.
 Otherwise the focus color depends on [getTextTheme]:

  * [ButtonTextTheme.normal], [ButtonTextTheme.accent],
    [ButtonTextTheme.primary]: returns the value of the `focusColor`
    constructor parameter if it is non-null, otherwise the value of
    [getTextColor] with opacity 0.04.

## Return Type
`Color`

## Parameters

- `button`: `MaterialButton`
