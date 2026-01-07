# Overview for `SegmentedButtonThemeData`

## Description

Overrides the default values of visual properties for descendant
 [SegmentedButton] widgets.

 Descendant widgets obtain the current [SegmentedButtonThemeData] object with
 [SegmentedButtonTheme.of]. Instances of [SegmentedButtonTheme] can
 be customized with [SegmentedButtonThemeData.copyWith].

 Typically a [SegmentedButtonTheme] is specified as part of the overall
 [Theme] with [ThemeData.segmentedButtonTheme].

 All [SegmentedButtonThemeData] properties are null by default. When null,
 the [SegmentedButton] computes its own default values, typically based on
 the overall theme's [ThemeData.colorScheme], [ThemeData.textTheme], and
 [ThemeData.iconTheme].

## Dependencies

- Diagnosticable

## Members

- **style**: `ButtonStyle?`
  Overrides the [SegmentedButton]'s default style.

 Non-null properties or non-null resolved [WidgetStateProperty]
 values override the default values used by [SegmentedButton].

 If [style] is null, then this theme doesn't override anything.

- **selectedIcon**: `Widget?`
  Override for [SegmentedButton.selectedIcon] property.

 If non-null, then [selectedIcon] will be used instead of default
 value for [SegmentedButton.selectedIcon].

## Constructors

### Unnamed Constructor
Creates a [SegmentedButtonThemeData] that can be used to override default properties
 in a [SegmentedButtonTheme] widget.

