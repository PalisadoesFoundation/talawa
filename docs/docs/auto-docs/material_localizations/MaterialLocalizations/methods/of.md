# Method: `of`

## Description

The `MaterialLocalizations` from the closest [Localizations] instance
 that encloses the given context.

 If no [MaterialLocalizations] are available in the given `context`, this
 method throws an exception.

 This method is just a convenient shorthand for:
 `Localizations.of&lt;MaterialLocalizations&gt;(context, MaterialLocalizations)!`.

 References to the localized resources defined by this class are typically
 written in terms of this method. For example:

 ```dart
 tooltip: MaterialLocalizations.of(context).backButtonTooltip,
 ```

## Return Type
`MaterialLocalizations`

## Parameters

- `context`: `BuildContext`
