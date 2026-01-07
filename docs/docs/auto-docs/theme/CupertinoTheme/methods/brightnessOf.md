# Method: `brightnessOf`

## Description

Retrieves the [Brightness] to use for descendant Cupertino widgets, based
 on the value of [CupertinoThemeData.brightness] in the given [context].

 If no [CupertinoTheme] can be found in the given [context], or its `brightness`
 is null, it will fall back to [MediaQueryData.platformBrightness].

 Throws an exception if no valid [CupertinoTheme] or [MediaQuery] widgets
 exist in the ancestry tree.

 See also:

 * [maybeBrightnessOf], which returns null if no valid [CupertinoTheme] or
   [MediaQuery] exists, instead of throwing.
 * [CupertinoThemeData.brightness], the property takes precedence over
   [MediaQueryData.platformBrightness] for descendant Cupertino widgets.

## Return Type
`Brightness`

## Parameters

- `context`: `BuildContext`
