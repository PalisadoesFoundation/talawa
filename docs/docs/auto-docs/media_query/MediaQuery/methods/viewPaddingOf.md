# Method: `viewPaddingOf`

## Description

Returns [MediaQueryData.viewPadding] for the nearest [MediaQuery] ancestor
 or throws an exception, if no such ancestor exists.

 Use of this method will cause the given [context] to rebuild any time that
 the [MediaQueryData.viewPadding] property of the ancestor [MediaQuery]
 changes.

 

## Return Type
`EdgeInsets`

## Parameters

- `context`: `BuildContext`
