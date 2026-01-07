# Overview for `DividerThemeData`

## Description

Defines the visual properties of [Divider], [VerticalDivider], dividers
 between [ListTile]s, and dividers between rows in [DataTable]s.

 Descendant widgets obtain the current [DividerThemeData] object using
 `DividerTheme.of(context)`. Instances of [DividerThemeData]
 can be customized with [DividerThemeData.copyWith].

 Typically a [DividerThemeData] is specified as part of the overall
 [Theme] with [ThemeData.dividerTheme].

 All [DividerThemeData] properties are `null` by default. When null,
 the widgets will provide their own defaults.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **color**: `Color?`
  The color of [Divider]s and [VerticalDivider]s, also
 used between [ListTile]s, between rows in [DataTable]s, and so forth.

- **space**: `double?`
  The [Divider]'s height or the [VerticalDivider]'s width.

 This represents the amount of horizontal or vertical space the divider
 takes up.

- **thickness**: `double?`
  The thickness of the line drawn within the divider.

- **indent**: `double?`
  The amount of empty space at the leading edge of [Divider] or top edge of
 [VerticalDivider].

- **endIndent**: `double?`
  The amount of empty space at the trailing edge of [Divider] or bottom edge
 of [VerticalDivider].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [DividerTheme] or
 [ThemeData.dividerTheme].

