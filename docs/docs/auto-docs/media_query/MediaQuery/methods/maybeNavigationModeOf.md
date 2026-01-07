# Method: `maybeNavigationModeOf`

## Description

Returns [MediaQueryData.navigationMode] for the nearest [MediaQuery]
 ancestor or null, if no such ancestor exists.

 Use of this method will cause the given [context] to rebuild any time that
 the [MediaQueryData.navigationMode] property of the ancestor [MediaQuery]
 changes.

 

## Return Type
`NavigationMode?`

## Parameters

- `context`: `BuildContext`
