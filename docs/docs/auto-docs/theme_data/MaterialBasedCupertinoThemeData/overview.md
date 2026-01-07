# Overview for `MaterialBasedCupertinoThemeData`

## Description

A [CupertinoThemeData] that defers unspecified theme attributes to an
 upstream Material [ThemeData].

 This type of [CupertinoThemeData] is used by the Material [Theme] to
 harmonize the [CupertinoTheme] with the material theme's colors and text
 styles.

 In the most basic case, [ThemeData]'s `cupertinoOverrideTheme` is null and
 descendant Cupertino widgets' styling is derived from the Material theme.

 To override individual parts of the Material-derived Cupertino styling,
 `cupertinoOverrideTheme`'s construction parameters can be used.

 To completely decouple the Cupertino styling from Material theme derivation,
 another [CupertinoTheme] widget can be inserted as a descendant of the
 Material [Theme]. On a [MaterialApp], this can be done using the `builder`
 parameter on the constructor.

 See also:

  * [CupertinoThemeData], whose null constructor parameters default to
    reasonable iOS styling defaults rather than harmonizing with a Material
    theme.
  * [Theme], widget which inserts a [CupertinoTheme] with this
    [MaterialBasedCupertinoThemeData].

## Dependencies

- CupertinoThemeData

## Members

- **_materialTheme**: `ThemeData`
- **_cupertinoOverrideTheme**: `NoDefaultCupertinoThemeData`
## Constructors

### Unnamed Constructor
Create a [MaterialBasedCupertinoThemeData] based on a Material [ThemeData]
 and its `cupertinoOverrideTheme`.

### _


#### Parameters

- `_materialTheme`: `dynamic`
- `_cupertinoOverrideTheme`: `dynamic`
