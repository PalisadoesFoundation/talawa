# Method: `of`

## Description

The data from the closest [Theme] instance that encloses the given
 context.

 If the given context is enclosed in a [Localizations] widget providing
 [MaterialLocalizations], the returned data is localized according to the
 nearest available [MaterialLocalizations].

 Defaults to [ThemeData.fallback] if there is no [Theme] in the given
 build context.

 Typical usage is as follows:

 ```dart
 @override
 Widget build(BuildContext context) 
 ```

 When the [Theme] is actually created in the same `build` function
 (possibly indirectly, e.g. as part of a [MaterialApp]), the `context`
 argument to the `build` function can't be used to find the [Theme] (since
 it's "above" the widget being returned). In such cases, the following
 technique with a [Builder] can be used to provide a new scope with a
 [BuildContext] that is "under" the [Theme]:

 ```dart
 @override
 Widget build(BuildContext context) 
 ```

 See also:

 * [ColorScheme.of], a convenience method that returns [ThemeData.colorScheme]
   from the closest [Theme] ancestor. (equivalent to `Theme.of(context).colorScheme`).
 * [TextTheme.of], a convenience method that returns [ThemeData.textTheme]
   from the closest [Theme] ancestor. (equivalent to `Theme.of(context).textTheme`).
 * [IconTheme.of], that returns [ThemeData.iconTheme] from the closest [Theme] or
   [IconThemeData.fallback] if there is no [IconTheme] ancestor.

## Return Type
`ThemeData`

## Parameters

- `context`: `BuildContext`
