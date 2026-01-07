# Method: `resolve`

## Description

Called by [IconTheme.of] to convert this instance to an [IconThemeData]
 that fits the given [BuildContext].

 This method gives the ambient [IconThemeData] a chance to update itself,
 after it's been retrieved by [IconTheme.of], and before being returned as
 the final result. For instance, [CupertinoIconThemeData] overrides this method
 to resolve [color], in case [color] is a [CupertinoDynamicColor] and needs
 to be resolved against the given [BuildContext] before it can be used as a
 regular [Color].

 The default implementation returns this [IconThemeData] as-is.

 See also:

  * [CupertinoIconThemeData.resolve] an implementation that resolves
    the color of [CupertinoIconThemeData] before returning.

## Return Type
`IconThemeData`

## Parameters

- `context`: `BuildContext`
