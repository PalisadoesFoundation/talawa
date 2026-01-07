# Overview for `SearchBarThemeData`

## Description

Defines default property values for descendant [SearchBar] widgets.

 Descendant widgets obtain the current [SearchBarThemeData] object using
 `SearchBarTheme.of(context)`. Instances of [SearchBarThemeData] can be customized
 with [SearchBarThemeData.copyWith].

 Typically a [SearchBarThemeData] is specified as part of the overall [Theme]
 with [ThemeData.searchBarTheme].

 All [SearchBarThemeData] properties are `null` by default. When null, the
 [SearchBar] will use the values from [ThemeData] if they exist, otherwise it
 will provide its own defaults based on the overall [Theme]'s colorScheme.
 See the individual [SearchBar] properties for details.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **elevation**: `MaterialStateProperty<double?>?`
  Overrides the default value of the [SearchBar.elevation].

- **backgroundColor**: `MaterialStateProperty<Color?>?`
  Overrides the default value of the [SearchBar.backgroundColor].

- **shadowColor**: `MaterialStateProperty<Color?>?`
  Overrides the default value of the [SearchBar.shadowColor].

- **surfaceTintColor**: `MaterialStateProperty<Color?>?`
  Overrides the default value of the [SearchBar.surfaceTintColor].

- **overlayColor**: `MaterialStateProperty<Color?>?`
  Overrides the default value of the [SearchBar.overlayColor].

- **side**: `MaterialStateProperty<BorderSide?>?`
  Overrides the default value of the [SearchBar.side].

- **shape**: `MaterialStateProperty<OutlinedBorder?>?`
  Overrides the default value of the [SearchBar.shape].

- **padding**: `MaterialStateProperty<EdgeInsetsGeometry?>?`
  Overrides the default value for [SearchBar.padding].

- **textStyle**: `MaterialStateProperty<TextStyle?>?`
  Overrides the default value for [SearchBar.textStyle].

- **hintStyle**: `MaterialStateProperty<TextStyle?>?`
  Overrides the default value for [SearchBar.hintStyle].

- **constraints**: `BoxConstraints?`
  Overrides the value of size constraints for [SearchBar].

- **textCapitalization**: `TextCapitalization?`
  Overrides the value of [SearchBar.textCapitalization].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.searchBarTheme].

