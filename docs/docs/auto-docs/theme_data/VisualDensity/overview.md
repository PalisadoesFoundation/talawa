# Overview for `VisualDensity`

## Description

Defines the visual density of user interface components.

 Density, in the context of a UI, is the vertical and horizontal
 "compactness" of the components in the UI. It is unitless, since it means
 different things to different UI components.

 The default for visual densities is zero for both vertical and horizontal
 densities, which corresponds to the default visual density of components in
 the Material Design specification. It does not affect text sizes, icon
 sizes, or padding values.

 For example, for buttons, it affects the spacing around the child of the
 button. For lists, it affects the distance between baselines of entries in
 the list. For chips, it only affects the vertical size, not the horizontal
 size.

 Here are some examples of widgets that respond to density changes:

  * [Checkbox]
  * [Chip]
  * [ElevatedButton]
  * [IconButton]
  * [InputDecorator] (which gives density support to [TextField], etc.)
  * [ListTile]
  * [MaterialButton]
  * [OutlinedButton]
  * [Radio]
  * [RawMaterialButton]
  * [TextButton]

 See also:

  * [ThemeData.visualDensity], where this property is used to specify the base
    horizontal density of Material components.
  * [Material design guidance on density](https://material.io/design/layout/applying-density.html).

## Dependencies

- Diagnosticable

## Members

- **minimumDensity**: `double`
  The minimum allowed density.

- **maximumDensity**: `double`
  The maximum allowed density.

- **standard**: `VisualDensity`
  The default profile for [VisualDensity] in [ThemeData].

 This default value represents a visual density that is less dense than
 either [comfortable] or [compact], and corresponds to density values of
 zero in both axes.

- **comfortable**: `VisualDensity`
  The profile for a "comfortable" interpretation of [VisualDensity].

 Individual components will interpret the density value independently,
 making themselves more visually dense than [standard] and less dense than
 [compact] to different degrees based on the Material Design specification
 of the "comfortable" setting for their particular use case.

 It corresponds to a density value of -1 in both axes.

- **compact**: `VisualDensity`
  The profile for a "compact" interpretation of [VisualDensity].

 Individual components will interpret the density value independently,
 making themselves more visually dense than [standard] and [comfortable] to
 different degrees based on the Material Design specification of the
 "comfortable" setting for their particular use case.

 It corresponds to a density value of -2 in both axes.

- **horizontal**: `double`
  The horizontal visual density of UI components.

 This property affects only the horizontal spacing between and within
 components, to allow for different UI visual densities. It does not affect
 text sizes, icon sizes, or padding values. The default value is 0.0,
 corresponding to the metrics specified in the Material Design
 specification. The value can range from [minimumDensity] to
 [maximumDensity], inclusive.

 See also:

  * [ThemeData.visualDensity], where this property is used to specify the base
    horizontal density of Material components.
  * [Material design guidance on density](https://material.io/design/layout/applying-density.html).

- **vertical**: `double`
  The vertical visual density of UI components.

 This property affects only the vertical spacing between and within
 components, to allow for different UI visual densities. It does not affect
 text sizes, icon sizes, or padding values. The default value is 0.0,
 corresponding to the metrics specified in the Material Design
 specification. The value can range from [minimumDensity] to
 [maximumDensity], inclusive.

 See also:

  * [ThemeData.visualDensity], where this property is used to specify the base
    vertical density of Material components.
  * [Material design guidance on density](https://material.io/design/layout/applying-density.html).

## Constructors

### Unnamed Constructor
A const constructor for [VisualDensity].

 The [horizontal] and [vertical] arguments must be in the interval between
 [minimumDensity] and [maximumDensity], inclusive.

