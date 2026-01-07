# Method: `getHighlightColor`

## Description

The color of the overlay that appears when the [button] is pressed.

 Returns the button's [MaterialButton.highlightColor] if it is non-null.
 Otherwise the highlight color depends on [getTextTheme]:

  * [ButtonTextTheme.normal], [ButtonTextTheme.accent]: returns the
    value of the `highlightColor` constructor parameter if it is non-null,
    otherwise the value of [getTextColor] with opacity 0.16.
  * [ButtonTextTheme.primary], returns [Colors.transparent].

## Return Type
`Color`

## Parameters

- `button`: `MaterialButton`
