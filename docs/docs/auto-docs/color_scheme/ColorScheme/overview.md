# Overview for `ColorScheme`

## Description


 A set of 45 colors based on the
 [Material spec](https://m3.material.io/styles/color/the-color-system/color-roles)
 that can be used to configure the color properties of most components.
 

 ### Colors in Material 3

 

 The main accent color groups in the scheme are [primary], [secondary],
 and [tertiary].

 * Primary colors are used for key components across the UI, such as the FAB,
   prominent buttons, and active states.

 * Secondary colors are used for less prominent components in the UI, such as
   filter chips, while expanding the opportunity for color expression.

 * Tertiary colors are used for contrasting accents that can be used to
   balance primary and secondary colors or bring heightened attention to
   an element, such as an input field. The tertiary colors are left
   for makers to use at their discretion and are intended to support
   broader color expression in products.

 Each accent color group (primary, secondary and tertiary) includes '-Fixed'
 '-Dim' color roles, such as [primaryFixed] and [primaryFixedDim]. Fixed roles
 are appropriate to use in places where Container roles are normally used,
 but they stay the same color between light and dark themes. The '-Dim' roles
 provide a stronger, more emphasized color with the same fixed behavior.

 The remaining colors of the scheme are composed of neutral colors used for
 backgrounds and surfaces, as well as specific colors for errors, dividers
 and shadows. Surface colors are used for backgrounds and large, low-emphasis
 areas of the screen.

 Material 3 also introduces tone-based surfaces and surface containers.
 They replace the old opacity-based model which applied a tinted overlay on
 top of surfaces based on their elevation. These colors include: [surfaceBright],
 [surfaceDim], [surfaceContainerLowest], [surfaceContainerLow], [surfaceContainer],
 [surfaceContainerHigh], and [surfaceContainerHighest].

 Many of the colors have matching 'on' colors, which are used for drawing
 content on top of the matching color. For example, if something is using
 [primary] for a background color, [onPrimary] would be used to paint text
 and icons on top of it. For this reason, the 'on' colors should have a
 contrast ratio with their matching colors of at least 4.5:1 in order to
 be readable. On '-FixedVariant' roles, such as [onPrimaryFixedVariant],
 also have the same color between light and dark themes, but compared
 with on '-Fixed' roles, such as [onPrimaryFixed], they provide a
 lower-emphasis option for text and icons.

 
 This example shows all Material [ColorScheme] roles in light and dark
 brightnesses.

 ** See code in examples/api/lib/material/color_scheme/color_scheme.0.dart **
 

 ### Setting Colors in Flutter



## Dependencies

- Diagnosticable

## Members

- **brightness**: `Brightness`
  The overall brightness of this color scheme.

- **primary**: `Color`
  The color displayed most frequently across your app’s screens and components.

- **onPrimary**: `Color`
  A color that's clearly legible when drawn on [primary].

 To ensure that an app is accessible, a contrast ratio between
 [primary] and [onPrimary] of at least 4.5:1 is recommended. See
 <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.

- **_primaryContainer**: `Color?`
- **_onPrimaryContainer**: `Color?`
- **_primaryFixed**: `Color?`
- **_primaryFixedDim**: `Color?`
- **_onPrimaryFixed**: `Color?`
- **_onPrimaryFixedVariant**: `Color?`
- **secondary**: `Color`
  An accent color used for less prominent components in the UI, such as
 filter chips, while expanding the opportunity for color expression.

- **onSecondary**: `Color`
  A color that's clearly legible when drawn on [secondary].

 To ensure that an app is accessible, a contrast ratio between
 [secondary] and [onSecondary] of at least 4.5:1 is recommended. See
 <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.

- **_secondaryContainer**: `Color?`
- **_onSecondaryContainer**: `Color?`
- **_secondaryFixed**: `Color?`
- **_secondaryFixedDim**: `Color?`
- **_onSecondaryFixed**: `Color?`
- **_onSecondaryFixedVariant**: `Color?`
- **_tertiary**: `Color?`
- **_onTertiary**: `Color?`
- **_tertiaryContainer**: `Color?`
- **_onTertiaryContainer**: `Color?`
- **_tertiaryFixed**: `Color?`
- **_tertiaryFixedDim**: `Color?`
- **_onTertiaryFixed**: `Color?`
- **_onTertiaryFixedVariant**: `Color?`
- **error**: `Color`
  The color to use for input validation errors, e.g. for
 [InputDecoration.errorText].

- **onError**: `Color`
  A color that's clearly legible when drawn on [error].

 To ensure that an app is accessible, a contrast ratio between
 [error] and [onError] of at least 4.5:1 is recommended. See
 <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.

- **_errorContainer**: `Color?`
- **_onErrorContainer**: `Color?`
- **surface**: `Color`
  The background color for widgets like [Scaffold].

- **onSurface**: `Color`
  A color that's clearly legible when drawn on [surface].

 To ensure that an app is accessible, a contrast ratio between
 [surface] and [onSurface] of at least 4.5:1 is recommended. See
 <https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html>.

- **_surfaceVariant**: `Color?`
- **_surfaceDim**: `Color?`
- **_surfaceBright**: `Color?`
- **_surfaceContainerLowest**: `Color?`
- **_surfaceContainerLow**: `Color?`
- **_surfaceContainer**: `Color?`
- **_surfaceContainerHigh**: `Color?`
- **_surfaceContainerHighest**: `Color?`
- **_onSurfaceVariant**: `Color?`
- **_outline**: `Color?`
- **_outlineVariant**: `Color?`
- **_shadow**: `Color?`
- **_scrim**: `Color?`
- **_inverseSurface**: `Color?`
- **_onInverseSurface**: `Color?`
- **_inversePrimary**: `Color?`
- **_surfaceTint**: `Color?`
- **_background**: `Color?`
- **_onBackground**: `Color?`
## Constructors

### Unnamed Constructor
Create a ColorScheme instance from the given colors.

 [ColorScheme.fromSeed] can be used as a simpler way to create a full
 color scheme derived from a single seed color.

 For the color parameters that are nullable, it is still recommended
 that applications provide values for them. They are only nullable due
 to backwards compatibility concerns.

 If a color is not provided, the closest fallback color from the given
 colors will be used for it (e.g. [primaryContainer] will default
 to [primary]). Material Design 3 makes use of these colors for many
 component defaults, so for the best results the application should
 supply colors for all the parameters. An easy way to ensure this is to
 use [ColorScheme.fromSeed] to generate a full set of colors.

 During the migration to Material Design 3, if an app's
 [ThemeData.useMaterial3] is false, then components will only
 use the following colors for defaults:

 * [primary]
 * [onPrimary]
 * [secondary]
 * [onSecondary]
 * [error]
 * [onError]
 * [surface]
 * [onSurface]
 DEPRECATED:
 * [background]
 * [onBackground]

### fromSeed
Generate a [ColorScheme] derived from the given `seedColor`.

 Using the `seedColor` as a starting point, a set of tonal palettes are
 constructed. By default, the tonal palettes are based on the Material 3
 Color system and provide all of the [ColorScheme] colors. These colors are
 designed to work well together and meet contrast requirements for
 accessibility.

 If any of the optional color parameters are non-null they will be
 used in place of the generated colors for that field in the resulting
 color scheme. This allows apps to override specific colors for their
 needs.

 Given the nature of the algorithm, the `seedColor` may not wind up as
 one of the ColorScheme colors.

 The `dynamicSchemeVariant` parameter creates different types of
 [DynamicScheme]s, which are used to generate different styles of [ColorScheme]s.
 By default, `dynamicSchemeVariant` is set to `tonalSpot`. A [ColorScheme]
 constructed by `dynamicSchemeVariant.tonalSpot` has pastel palettes and
 won't be too "colorful" even if the `seedColor` has a high chroma value.
 If the resulting color scheme is too dark, consider setting `dynamicSchemeVariant`
 to [DynamicSchemeVariant.fidelity], whose palettes match the seed color.

 The `contrastLevel` parameter indicates the contrast level between color
 pairs, such as [primary] and [onPrimary]. 0.0 is the default (normal);
 -1.0 is the lowest; 1.0 is the highest. From Material Design guideline, the
 medium and high contrast correspond to 0.5 and 1.0 respectively.

 
 This sample shows how to use [ColorScheme.fromSeed] to create dynamic
 color schemes with different [DynamicSchemeVariant]s and different
 contrast level.

 ** See code in examples/api/lib/material/color_scheme/color_scheme.0.dart **
 

 See also:

  * <https://m3.material.io/styles/color/the-color-system/color-roles>, the
    Material 3 Color system specification.
  * <https://pub.dev/packages/material_color_utilities>, the package
    used to generate the tonal palettes needed for the scheme.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### light
Create a light ColorScheme based on a purple primary color that matches the
 [baseline Material 2 color scheme](https://material.io/design/color/the-color-system.html#color-theme-creation).

 This constructor shouldn't be used to update the Material 3 color scheme.

 For Material 3, use [ColorScheme.fromSeed] to create a color scheme
 from a single seed color based on the Material 3 color system.

 
 This example demonstrates how to create a color scheme similar to [ColorScheme.light]
 using the [ColorScheme.fromSeed] constructor:

 ```dart
 colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff6200ee)).copyWith(
   primaryContainer: const Color(0xff6200ee),
   onPrimaryContainer: Colors.white,
   secondaryContainer: const Color(0xff03dac6),
   onSecondaryContainer: Colors.black,
   error: const Color(0xffb00020),
   onError: Colors.white,
 ),
 ```
 

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### dark
Create the dark color scheme that matches the
 [baseline Material 2 color scheme](https://material.io/design/color/dark-theme.html#ui-application).

 This constructor shouldn't be used to update the Material 3 color scheme.

 For Material 3, use [ColorScheme.fromSeed] to create a color scheme
 from a single seed color based on the Material 3 color system.
 Override the `brightness` property of [ColorScheme.fromSeed] to create a
 dark color scheme.

 
 This example demonstrates how to create a color scheme similar to [ColorScheme.dark]
 using the [ColorScheme.fromSeed] constructor:

 ```dart
 colorScheme: ColorScheme.fromSeed(
   seedColor: const Color(0xffbb86fc),
   brightness: Brightness.dark,
 ).copyWith(
   primaryContainer: const Color(0xffbb86fc),
   onPrimaryContainer: Colors.black,
   secondaryContainer: const Color(0xff03dac6),
   onSecondaryContainer: Colors.black,
   error: const Color(0xffcf6679),
   onError: Colors.black,
 ),
 ```
 

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### highContrastLight
Create a high contrast ColorScheme based on a purple primary color that
 matches the [baseline Material 2 color scheme](https://material.io/design/color/the-color-system.html#color-theme-creation).

 This constructor shouldn't be used to update the Material 3 color scheme.

 For Material 3, use [ColorScheme.fromSeed] to create a color scheme
 from a single seed color based on the Material 3 color system. To create a
 high-contrast color scheme, set `contrastLevel` to 1.0.

 
 This example demonstrates how to create a color scheme similar to [ColorScheme.highContrastLight]
 using the [ColorScheme.fromSeed] constructor:

 ```dart
 colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0000ba)).copyWith(
   primaryContainer: const Color(0xff0000ba),
   onPrimaryContainer: Colors.white,
   secondaryContainer: const Color(0xff66fff9),
   onSecondaryContainer: Colors.black,
   error: const Color(0xff790000),
   onError: Colors.white,
 ),
 ```
 

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### highContrastDark
Create a high contrast ColorScheme based on the dark
 [baseline Material 2 color scheme](https://material.io/design/color/dark-theme.html#ui-application).

 This constructor shouldn't be used to update the Material 3 color scheme.

 For Material 3, use [ColorScheme.fromSeed] to create a color scheme
 from a single seed color based on the Material 3 color system.
 Override the `brightness` property of [ColorScheme.fromSeed] to create a
 dark color scheme. To create a high-contrast color scheme, set
 `contrastLevel` to 1.0.

 
 This example demonstrates how to create a color scheme similar to [ColorScheme.highContrastDark]
 using the [ColorScheme.fromSeed] constructor:

 ```dart
 colorScheme: ColorScheme.fromSeed(
   seedColor: const Color(0xffefb7ff),
   brightness: Brightness.dark,
 ).copyWith(
   primaryContainer: const Color(0xffefb7ff),
   onPrimaryContainer: Colors.black,
   secondaryContainer: const Color(0xff66fff9),
   onSecondaryContainer: Colors.black,
   error: const Color(0xff9b374d),
   onError: Colors.white,
 ),
 ```
 

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### fromSwatch
Creates a color scheme from a [MaterialColor] swatch.

 In Material 3, this constructor is ignored by [ThemeData] when creating
 its default color scheme. Instead, [ThemeData] uses [ColorScheme.fromSeed]
 to create its default color scheme. This constructor shouldn't be used
 to update the Material 3 color scheme. It will be phased out gradually;
 see https://github.com/flutter/flutter/issues/120064 for more details.

 If [ThemeData.useMaterial3] is false, then this constructor is used by
 [ThemeData] to create its default color scheme.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
