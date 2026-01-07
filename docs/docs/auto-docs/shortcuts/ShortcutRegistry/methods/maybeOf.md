# Method: `maybeOf`

## Description

Returns [ShortcutRegistry] of the [ShortcutRegistrar] that most tightly
 encloses the given [BuildContext].

 If no [ShortcutRegistrar] widget encloses the given context, [maybeOf]
 will return null.

 There is a default [ShortcutRegistrar] instance in [WidgetsApp], so if
 [WidgetsApp], [MaterialApp] or [CupertinoApp] are used, an additional
 [ShortcutRegistrar] isn't needed.

 See also:

  * [of], which is similar to this function, but returns a non-nullable
    result, and will throw an exception if it doesn't find a
    [ShortcutRegistrar] ancestor.

## Return Type
`ShortcutRegistry?`

## Parameters

- `context`: `BuildContext`
