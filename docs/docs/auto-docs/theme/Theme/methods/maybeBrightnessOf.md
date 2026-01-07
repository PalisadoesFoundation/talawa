# Method: `maybeBrightnessOf`

## Description

Retrieves the [Brightness] to use for descendant Material widgets, based
 on the value of [ThemeData.brightness] in the given [context].

 If no [InheritedTheme] or [MediaQuery] can be found in the given [context], it will
 return null.

 See also:

 * [ThemeData.brightness], the property that takes precedence over
   [MediaQueryData.platformBrightness] for descendant Material widgets.
 * [brightnessOf], which return a default value if no valid [InheritedTheme] or
   [MediaQuery] exists, instead of returning null.

## Return Type
`Brightness?`

## Parameters

- `context`: `BuildContext`
