# Method: `applyOverlay`

## Description

Applies an overlay color to a surface color to indicate
 the level of its elevation in a dark theme.

 If using Material Design 3, this type of color overlay is no longer used.
 Instead a "surface tint" overlay is used instead. See [applySurfaceTint],
 [ThemeData.useMaterial3] for more information.

 Material drop shadows can be difficult to see in a dark theme, so the
 elevation of a surface should be portrayed with an "overlay" in addition
 to the shadow. As the elevation of the component increases, the
 overlay increases in opacity. This function computes and applies this
 overlay to a given color as needed.

 If the ambient theme is dark ([ThemeData.brightness] is [Brightness.dark]),
 and [ThemeData.applyElevationOverlayColor] is true, and the given
 [color] is [ColorScheme.surface] then this will return a version of
 the [color] with a semi-transparent [ColorScheme.onSurface] overlaid
 on top of it. The opacity of the overlay is computed based on the
 [elevation].

 Otherwise it will just return the [color] unmodified.

 See also:

  * [ThemeData.applyElevationOverlayColor] which controls the whether
    an overlay color will be applied to indicate elevation.
  * [overlayColor] which computes the needed overlay color.
  * [Material] which uses this to apply an elevation overlay to its surface.
  * <https://material.io/design/color/dark-theme.html>, which specifies how
    the overlay should be applied.

## Return Type
`Color`

## Parameters

- `context`: `BuildContext`
- `color`: `Color`
- `elevation`: `double`
