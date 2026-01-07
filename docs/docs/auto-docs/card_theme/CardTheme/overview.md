# Overview for `CardTheme`

## Description

Defines default property values for descendant [Card] widgets.

 Descendant widgets obtain the current [CardTheme] object using
 `CardTheme.of(context)`. Instances of [CardTheme] can be
 customized with [CardTheme.copyWith].

 Typically a [CardTheme] is specified as part of the overall [Theme]
 with [ThemeData.cardTheme].

 All [CardTheme] properties are `null` by default. When null, the [Card]
 will use the values from [ThemeData] if they exist, otherwise it will
 provide its own defaults.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- InheritedWidget, Diagnosticable

## Members

- **_data**: `CardThemeData?`
- **_clipBehavior**: `Clip?`
- **_color**: `Color?`
- **_surfaceTintColor**: `Color?`
- **_shadowColor**: `Color?`
- **_elevation**: `double?`
- **_margin**: `EdgeInsetsGeometry?`
- **_shape**: `ShapeBorder?`
## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.cardTheme].

 The [elevation] must be null or non-negative.

