# Method: `of`

## Description

The data from the closest instance of this class that encloses the given
 context, if any.

 If there is no ambient icon theme, defaults to [IconThemeData.fallback].
 The returned [IconThemeData] is concrete (all values are non-null; see
 [IconThemeData.isConcrete]). Any properties on the ambient icon theme that
 are null get defaulted to the values specified on
 [IconThemeData.fallback].

 The [Theme] widget from the `material` library introduces an [IconTheme]
 widget set to the [ThemeData.iconTheme], so in a Material Design
 application, this will typically default to the icon theme from the
 ambient [Theme].

 Typical usage is as follows:

 ```dart
 IconThemeData theme = IconTheme.of(context);
 ```

## Return Type
`IconThemeData`

## Parameters

- `context`: `BuildContext`
