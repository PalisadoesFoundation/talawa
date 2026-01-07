# Method: `localize`

## Description

Returns a new theme built by merging the text geometry provided by the
 [localTextGeometry] theme with the [baseTheme].

 For those text styles in the [baseTheme] whose [TextStyle.inherit] is set
 to true, the returned theme's text styles inherit the geometric properties
 of [localTextGeometry]. The resulting text styles' [TextStyle.inherit] is
 set to those provided by [localTextGeometry].

## Return Type
`ThemeData`

## Parameters

- `baseTheme`: `ThemeData`
- `localTextGeometry`: `TextTheme`
