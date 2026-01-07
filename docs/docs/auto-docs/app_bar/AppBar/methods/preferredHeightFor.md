# Method: `preferredHeightFor`

## Description

Used by [Scaffold] to compute its [AppBar]'s overall height. The returned value is
 the same `preferredSize.height` unless [AppBar.toolbarHeight] was null and
 `AppBarTheme.of(context).toolbarHeight` is non-null. In that case the
 return value is the sum of the theme's toolbar height and the height of
 the app bar's [AppBar.bottom] widget.

## Return Type
`double`

## Parameters

- `context`: `BuildContext`
- `preferredSize`: `Size`
