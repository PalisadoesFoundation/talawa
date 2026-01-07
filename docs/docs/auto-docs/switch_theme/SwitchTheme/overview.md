# Overview for `SwitchTheme`

## Description

Applies a switch theme to descendant [Switch] widgets.

 Descendant widgets obtain the current theme's [SwitchTheme] object using
 [SwitchTheme.of]. When a widget uses [SwitchTheme.of], it is automatically
 rebuilt if the theme later changes.

 A switch theme can be specified as part of the overall Material theme using
 [ThemeData.switchTheme].

 See also:

  * [SwitchThemeData], which describes the actual configuration of a switch
    theme.

## Dependencies

- InheritedWidget

## Members

- **data**: `SwitchThemeData`
  The properties used for all descendant [Switch] widgets.

## Constructors

### Unnamed Constructor
Constructs a switch theme that configures all descendant [Switch] widgets.

