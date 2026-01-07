# Overview for `FilledButtonThemeData`

## Description

A [ButtonStyle] that overrides the default appearance of
 [FilledButton]s when it's used with [FilledButtonTheme] or with the
 overall [Theme]'s [ThemeData.filledButtonTheme].

 The [style]'s properties override [FilledButton]'s default style,
 i.e. the [ButtonStyle] returned by [FilledButton.defaultStyleOf]. Only
 the style's non-null property values or resolved non-null
 [WidgetStateProperty] values are used.

 See also:

  * [FilledButtonTheme], the theme which is configured with this class.
  * [FilledButton.defaultStyleOf], which returns the default [ButtonStyle]
    for text buttons.
  * [FilledButton.styleFrom], which converts simple values into a
    [ButtonStyle] that's consistent with [FilledButton]'s defaults.
  * [WidgetStateProperty.resolve], "resolve" a material state property
    to a simple value based on a set of [WidgetState]s.
  * [ThemeData.filledButtonTheme], which can be used to override the default
    [ButtonStyle] for [FilledButton]s below the overall [Theme].

## Dependencies

- Diagnosticable

## Members

- **style**: `ButtonStyle?`
  Overrides for [FilledButton]'s default style.

 Non-null properties or non-null resolved [WidgetStateProperty]
 values override the [ButtonStyle] returned by
 [FilledButton.defaultStyleOf].

 If [style] is null, then this theme doesn't override anything.

## Constructors

### Unnamed Constructor
Creates an [FilledButtonThemeData].

 The [style] may be null.

