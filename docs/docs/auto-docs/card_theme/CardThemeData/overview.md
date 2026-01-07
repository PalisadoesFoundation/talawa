# Overview for `CardThemeData`

## Description

Defines default property values for descendant [Card] widgets.

 Descendant widgets obtain the current [CardThemeData] object using
 `CardTheme.of(context)`. Instances of [CardThemeData] can be
 customized with [CardThemeData.copyWith].

 Typically a [CardThemeData] is specified as part of the overall [Theme]
 with [ThemeData.cardTheme].

 All [CardThemeData] properties are `null` by default. When null, the [Card]
 will use the values from [ThemeData] if they exist, otherwise it will
 provide its own defaults. See the individual [Card] properties for details.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **clipBehavior**: `Clip?`
  Overrides the default value for [Card.clipBehavior].

- **color**: `Color?`
  Overrides the default value for [Card.color].

- **shadowColor**: `Color?`
  Overrides the default value for [Card.shadowColor].

- **surfaceTintColor**: `Color?`
  Overrides the default value for [Card.surfaceTintColor].

- **elevation**: `double?`
  Overrides the default value for [Card.elevation].

- **margin**: `EdgeInsetsGeometry?`
  Overrides the default value for [Card.margin].

- **shape**: `ShapeBorder?`
  Overrides the default value for [Card.shape].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.cardTheme].

 The [elevation] must be null or non-negative.

