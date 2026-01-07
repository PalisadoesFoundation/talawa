# Overview for `BadgeThemeData`

## Description

Overrides the default properties values for descendant [Badge] widgets.

 Descendant widgets obtain the current [BadgeThemeData] object
 using `BadgeTheme.of(context)`. Instances of [BadgeThemeData] can
 be customized with [BadgeThemeData.copyWith].

 Typically a [BadgeThemeData] is specified as part of the
 overall [Theme] with [ThemeData.badgeTheme].

 All [BadgeThemeData] properties are `null` by default.
 When null, the [Badge] will use the values from [ThemeData]
 if they exist, otherwise it will provide its own defaults.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `Color?`
  Overrides the default value for [Badge.backgroundColor].

- **textColor**: `Color?`
  Overrides the default value for [Badge.textColor].

- **smallSize**: `double?`
  Overrides the default value for [Badge.smallSize].

- **largeSize**: `double?`
  Overrides the default value for [Badge.largeSize].

- **textStyle**: `TextStyle?`
  Overrides the default value for [Badge.textStyle].

- **padding**: `EdgeInsetsGeometry?`
  Overrides the default value for [Badge.padding].

- **alignment**: `AlignmentGeometry?`
  Overrides the default value for [Badge.alignment].

- **offset**: `Offset?`
  Overrides the default value for [Badge.offset].

## Constructors

### Unnamed Constructor
Creates the set of color, style, and size properties used to configure [Badge].

