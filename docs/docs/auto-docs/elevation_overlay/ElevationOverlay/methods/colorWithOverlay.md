# Method: `colorWithOverlay`

## Description

Returns a color blended by laying a semi-transparent overlay (using the
 [overlay] color) on top of a surface (using the [surface] color).

 If using Material Design 3, this type of color overlay is no longer used.
 Instead a "surface tint" overlay is used instead. See [applySurfaceTint],
 [ThemeData.useMaterial3] for more information.

 The opacity of the overlay depends on [elevation]. As [elevation]
 increases, the opacity will also increase.

 See https://material.io/design/color/dark-theme.html#properties.

## Return Type
`Color`

## Parameters

- `surface`: `Color`
- `overlay`: `Color`
- `elevation`: `double`
