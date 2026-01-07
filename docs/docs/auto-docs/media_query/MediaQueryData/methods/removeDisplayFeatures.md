# Method: `removeDisplayFeatures`

## Description

Creates a copy of this media query data by removing [displayFeatures] that
 are completely outside the given sub-screen and adjusting the [padding],
 [viewInsets] and [viewPadding] to be zero on the sides that are not
 included in the sub-screen.

 Returns unmodified [MediaQueryData] if the sub-screen coincides with the
 available screen space.

 Asserts in debug mode, if the given sub-screen is outside the available
 screen space.

 See also:

  * [DisplayFeatureSubScreen], which removes the display features that
    split the screen, from the [MediaQuery] and adds a [Padding] widget to
    position the child to match the selected sub-screen.

## Return Type
`MediaQueryData`

## Parameters

- `subScreen`: `Rect`
