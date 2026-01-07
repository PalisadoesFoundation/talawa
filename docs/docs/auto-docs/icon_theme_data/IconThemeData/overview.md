# Overview for `IconThemeData`

## Description

Defines the size, font variations, color, opacity, and shadows of icons.

 Used by [IconTheme] to control those properties in a widget subtree.

 To obtain the current icon theme, use [IconTheme.of]. To convert an icon
 theme to a version with all the fields filled in, use
 [IconThemeData.fallback].

## Dependencies

- Diagnosticable

## Members

- **size**: `double?`
  The default for [Icon.size].

 Falls back to 24.0.

- **fill**: `double?`
  The default for [Icon.fill].

 Falls back to 0.0.

- **weight**: `double?`
  The default for [Icon.weight].

 Falls back to 400.0.

- **grade**: `double?`
  The default for [Icon.grade].

 Falls back to 0.0.

- **opticalSize**: `double?`
  The default for [Icon.opticalSize].

 Falls back to 48.0.

- **color**: `Color?`
  The default for [Icon.color].

 In material apps, if there is a [Theme] without any [IconTheme]s
 specified, icon colors default to white if [ThemeData.brightness] is dark
 and black if [ThemeData.brightness] is light.

 Otherwise, falls back to black.

- **_opacity**: `double?`
- **shadows**: `List&lt;Shadow&gt;?`
  The default for [Icon.shadows].

- **applyTextScaling**: `bool?`
  The default for [Icon.applyTextScaling].

## Constructors

### Unnamed Constructor
Creates an icon theme data.

 The opacity applies to both explicit and default icon colors. The value
 is clamped between 0.0 and 1.0.

### fallback
Creates an icon theme with some reasonable default values.

 The [size] is 24.0, [fill] is 0.0, [weight] is 400.0, [grade] is 0.0,
 opticalSize is 48.0, [color] is black, and [opacity] is 1.0.

