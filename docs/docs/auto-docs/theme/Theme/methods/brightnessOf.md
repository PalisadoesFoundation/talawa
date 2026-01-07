# Method: `brightnessOf`

## Description

Retrieves the [Brightness] to use for descendant Material widgets, based
 on the value of [ThemeData.brightness] in the given [context].

 If no [InheritedTheme] can be found in the given [context], or its `brightness`
 is null, it will fall back to [MediaQueryData.platformBrightness].

 See also:

 * [maybeBrightnessOf], which returns null if no valid [InheritedTheme] or
   [MediaQuery] exists.
 * [ThemeData.brightness], the property that takes precedence over
   [MediaQueryData.platformBrightness] for descendant Material widgets.

## Return Type
`Brightness`

## Parameters

- `context`: `BuildContext`
