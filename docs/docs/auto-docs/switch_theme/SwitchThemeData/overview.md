# Overview for `SwitchThemeData`

## Description

Defines default property values for descendant [Switch] widgets.

 Descendant widgets obtain the current [SwitchThemeData] object using
 `SwitchTheme.of(context)`. Instances of [SwitchThemeData] can be customized
 with [SwitchThemeData.copyWith].

 Typically a [SwitchThemeData] is specified as part of the overall [Theme]
 with [ThemeData.switchTheme].

 All [SwitchThemeData] properties are `null` by default. When null, the
 [Switch] will use the values from [ThemeData] if they exist, otherwise it
 will provide its own defaults based on the overall [Theme]'s colorScheme.
 See the individual [Switch] properties for details.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **thumbColor**: `MaterialStateProperty<Color?>?`
  

 If specified, overrides the default value of [Switch.thumbColor].

- **trackColor**: `MaterialStateProperty<Color?>?`
  

 If specified, overrides the default value of [Switch.trackColor].

- **trackOutlineColor**: `MaterialStateProperty<Color?>?`
  

 If specified, overrides the default value of [Switch.trackOutlineColor].

- **trackOutlineWidth**: `MaterialStateProperty<double?>?`
  

 If specified, overrides the default value of [Switch.trackOutlineWidth].

- **materialTapTargetSize**: `MaterialTapTargetSize?`
  

 If specified, overrides the default value of
 [Switch.materialTapTargetSize].

- **mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
  

 If specified, overrides the default value of [Switch.mouseCursor].

- **overlayColor**: `MaterialStateProperty<Color?>?`
  

 If specified, overrides the default value of [Switch.overlayColor].

- **splashRadius**: `double?`
  

 If specified, overrides the default value of [Switch.splashRadius].

- **thumbIcon**: `MaterialStateProperty<Icon?>?`
  

 It is overridden by [Switch.thumbIcon].

- **padding**: `EdgeInsetsGeometry?`
  If specified, overrides the default value of [Switch.padding].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.switchTheme].

