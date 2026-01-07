# Method: `overlayColor`

## Description

Computes the appropriate overlay color used to indicate elevation in
 dark themes.

 If using Material Design 3, this type of color overlay is no longer used.
 Instead a "surface tint" overlay is used instead. See [applySurfaceTint],
 [ThemeData.useMaterial3] for more information.

 See also:

  * https://material.io/design/color/dark-theme.html#properties which
    specifies the exact overlay values for a given elevation.

## Return Type
`Color`

## Parameters

- `context`: `BuildContext`
- `elevation`: `double`
