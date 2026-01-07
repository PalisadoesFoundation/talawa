# Method: `of`

## Description

Returns the [ShortcutRegistry] that belongs to the [ShortcutRegistrar]
 which most tightly encloses the given [BuildContext].

 If no [ShortcutRegistrar] widget encloses the context given, [of] will
 throw an exception in debug mode.

 There is a default [ShortcutRegistrar] instance in [WidgetsApp], so if
 [WidgetsApp], [MaterialApp] or [CupertinoApp] are used, an additional
 [ShortcutRegistrar] isn't needed.

 See also:

  * [maybeOf], which is similar to this function, but will return null if
    it doesn't find a [ShortcutRegistrar] ancestor.

## Return Type
`ShortcutRegistry`

## Parameters

- `context`: `BuildContext`
