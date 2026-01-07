# Method: `merge`

## Description

Creates a new [TextTheme] where each text style from this object has been
 merged with the matching text style from the `other` object.

 The merging is done by calling [TextStyle.merge] on each respective pair
 of text styles from this and the [other] text themes and is subject to
 the value of [TextStyle.inherit] flag. For more details, see the
 documentation on [TextStyle.merge] and [TextStyle.inherit].

 If this theme, or the `other` theme has members that are null, then the
 non-null one (if any) is used. If the `other` theme is itself null, then
 this [TextTheme] is returned unchanged. If values in both are set, then
 the values are merged using [TextStyle.merge].

 This is particularly useful if one [TextTheme] defines one set of
 properties and another defines a different set, e.g. having colors
 defined in one text theme and font sizes in another, or when one
 [TextTheme] has only some fields defined, and you want to define the rest
 by merging it with a default theme.

 

 ```dart
  A Widget that sets the ambient theme's title text color for its
  descendants, while leaving other ambient theme attributes alone.
 class TitleColorTheme extends StatelessWidget 
 ```
 

 See also:

  * [copyWith] is used instead of [merge] when you wish to override
    individual fields in the [TextTheme] instead of merging all of the
    fields of two [TextTheme]s.

## Return Type
`TextTheme`

## Parameters

- `other`: `TextTheme?`
