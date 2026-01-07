# Method: `of`

## Description

The data from the closest instance of this class that encloses the given
 context.

 You can use this function to query the user interface elevation level within
 the given [BuildContext]. When that information changes, your widget will
 be scheduled to be rebuilt, keeping your widget up-to-date.

 See also:

  * [maybeOf], which is similar, but will return null if no
    [CupertinoUserInterfaceLevel] encloses the given context.

## Return Type
`CupertinoUserInterfaceLevelData`

## Parameters

- `context`: `BuildContext`
