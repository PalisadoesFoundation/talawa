# Overview for `ElevatedButtonThemeData`

## Description

A [ButtonStyle] that overrides the default appearance of
 [ElevatedButton]s when it's used with [ElevatedButtonTheme] or with the
 overall [Theme]'s [ThemeData.elevatedButtonTheme].

 The [style]'s properties override [ElevatedButton]'s default style,
 i.e. the [ButtonStyle] returned by [ElevatedButton.defaultStyleOf]. Only
 the style's non-null property values or resolved non-null
 [WidgetStateProperty] values are used.

 See also:

  * [ElevatedButtonTheme], the theme which is configured with this class.
  * [ElevatedButton.defaultStyleOf], which returns the default [ButtonStyle]
    for text buttons.
  * [ElevatedButton.styleFrom], which converts simple values into a
    [ButtonStyle] that's consistent with [ElevatedButton]'s defaults.
  * [WidgetStateProperty.resolve], "resolve" a material state property
    to a simple value based on a set of [WidgetState]s.
  * [ThemeData.elevatedButtonTheme], which can be used to override the default
    [ButtonStyle] for [ElevatedButton]s below the overall [Theme].

## Dependencies

- Diagnosticable

## Members

- **style**: `ButtonStyle?`
  Overrides for [ElevatedButton]'s default style.

 Non-null properties or non-null resolved [WidgetStateProperty]
 values override the [ButtonStyle] returned by
 [ElevatedButton.defaultStyleOf].

 If [style] is null, then this theme doesn't override anything.

## Constructors

### Unnamed Constructor
Creates an [ElevatedButtonThemeData].

 The [style] may be null.

