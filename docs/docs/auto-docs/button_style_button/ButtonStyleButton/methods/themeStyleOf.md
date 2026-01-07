# Method: `themeStyleOf`

## Description

Returns the ButtonStyle that belongs to the button's component theme.

 The returned style can be overridden by the [style] parameter.

 Concrete button subclasses should return the ButtonStyle for the
 nearest subclass-specific inherited theme, and if no such theme
 exists, then the same value from the overall [Theme].

 See also:

  * [defaultStyleOf], Returns the default [ButtonStyle] for this button.

## Return Type
`ButtonStyle?`

## Parameters

- `context`: `BuildContext`
