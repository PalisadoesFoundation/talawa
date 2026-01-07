# Overview for `IconButtonThemeData`

## Description

A [ButtonStyle] that overrides the default appearance of
 [IconButton]s when it's used with the [IconButton], the [IconButtonTheme] or the
 overall [Theme]'s [ThemeData.iconButtonTheme].

 The [IconButton] will be affected by [IconButtonTheme] and [IconButtonThemeData]
 only if [ThemeData.useMaterial3] is set to true; otherwise, [IconTheme] will be used.

 The [style]'s properties override [IconButton]'s default style. Only
 the style's non-null property values or resolved non-null
 [WidgetStateProperty] values are used.

 See also:

  * [IconButtonTheme], the theme which is configured with this class.
  * [IconButton.styleFrom], which converts simple values into a
    [ButtonStyle] that's consistent with [IconButton]'s defaults.
  * [WidgetStateProperty.resolve], "resolve" a material state property
    to a simple value based on a set of [WidgetState]s.
  * [ThemeData.iconButtonTheme], which can be used to override the default
    [ButtonStyle] for [IconButton]s below the overall [Theme].

## Dependencies

- Diagnosticable

## Members

- **style**: `ButtonStyle?`
  Overrides for [IconButton]'s default style if [ThemeData.useMaterial3]
 is set to true.

 Non-null properties or non-null resolved [WidgetStateProperty]
 values override the default [ButtonStyle] in [IconButton].

 If [style] is null, then this theme doesn't override anything.

## Constructors

### Unnamed Constructor
Creates a [IconButtonThemeData].

 The [style] may be null.

