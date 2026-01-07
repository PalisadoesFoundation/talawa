# Method: `maybeBrightnessOf`

## Description

Retrieves the [Brightness] to use for descendant Cupertino widgets, based
 on the value of [CupertinoThemeData.brightness] in the given [context].

 If no [CupertinoTheme] can be found in the given [context], it will fall
 back to [MediaQueryData.platformBrightness].

 Returns null if no valid [CupertinoTheme] or [MediaQuery] widgets exist in
 the ancestry tree.

 See also:

 * [CupertinoThemeData.brightness], the property takes precedence over
   [MediaQueryData.platformBrightness] for descendant Cupertino widgets.
 * [brightnessOf], which throws if no valid [CupertinoTheme] or
   [MediaQuery] exists, instead of returning null.

## Return Type
`Brightness?`

## Parameters

- `context`: `BuildContext`
