# Overview for `TextButtonThemeData`

## Description

A [ButtonStyle] that overrides the default appearance of
 [TextButton]s when it's used with [TextButtonTheme] or with the
 overall [Theme]'s [ThemeData.textButtonTheme].

 The [style]'s properties override [TextButton]'s default style,
 i.e. the [ButtonStyle] returned by [TextButton.defaultStyleOf]. Only
 the style's non-null property values or resolved non-null
 [WidgetStateProperty] values are used.

 See also:

  * [TextButtonTheme], the theme which is configured with this class.
  * [TextButton.defaultStyleOf], which returns the default [ButtonStyle]
    for text buttons.
  * [TextButton.styleFrom], which converts simple values into a
    [ButtonStyle] that's consistent with [TextButton]'s defaults.
  * [WidgetStateProperty.resolve], "resolve" a material state property
    to a simple value based on a set of [WidgetState]s.
  * [ThemeData.textButtonTheme], which can be used to override the default
    [ButtonStyle] for [TextButton]s below the overall [Theme].

## Dependencies

- Diagnosticable

## Members

- **style**: `ButtonStyle?`
  Overrides for [TextButton]'s default style.

 Non-null properties or non-null resolved [WidgetStateProperty]
 values override the [ButtonStyle] returned by
 [TextButton.defaultStyleOf].

 If [style] is null, then this theme doesn't override anything.

## Constructors

### Unnamed Constructor
Creates a [TextButtonThemeData].

 The [style] may be null.

