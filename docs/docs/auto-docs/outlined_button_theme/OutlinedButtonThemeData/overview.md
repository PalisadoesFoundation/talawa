# Overview for `OutlinedButtonThemeData`

## Description

A [ButtonStyle] that overrides the default appearance of
 [OutlinedButton]s when it's used with [OutlinedButtonTheme] or with the
 overall [Theme]'s [ThemeData.outlinedButtonTheme].

 The [style]'s properties override [OutlinedButton]'s default style,
 i.e. the [ButtonStyle] returned by [OutlinedButton.defaultStyleOf]. Only
 the style's non-null property values or resolved non-null
 [WidgetStateProperty] values are used.

 See also:

  * [OutlinedButtonTheme], the theme which is configured with this class.
  * [OutlinedButton.defaultStyleOf], which returns the default [ButtonStyle]
    for outlined buttons.
  * [OutlinedButton.styleFrom], which converts simple values into a
    [ButtonStyle] that's consistent with [OutlinedButton]'s defaults.
  * [WidgetStateProperty.resolve], "resolve" a material state property
    to a simple value based on a set of [WidgetState]s.
  * [ThemeData.outlinedButtonTheme], which can be used to override the default
    [ButtonStyle] for [OutlinedButton]s below the overall [Theme].

## Dependencies

- Diagnosticable

## Members

- **style**: `ButtonStyle?`
  Overrides for [OutlinedButton]'s default style.

 Non-null properties or non-null resolved [WidgetStateProperty]
 values override the [ButtonStyle] returned by
 [OutlinedButton.defaultStyleOf].

 If [style] is null, then this theme doesn't override anything.

## Constructors

### Unnamed Constructor
Creates a [OutlinedButtonThemeData].

 The [style] may be null.

