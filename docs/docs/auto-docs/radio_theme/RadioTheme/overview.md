# Overview for `RadioTheme`

## Description

Applies a radio theme to descendant [Radio] widgets.

 Descendant widgets obtain the current theme's [RadioTheme] object using
 [RadioTheme.of]. When a widget uses [RadioTheme.of], it is automatically
 rebuilt if the theme later changes.

 A radio theme can be specified as part of the overall Material theme using
 [ThemeData.radioTheme].

 See also:

  * [RadioThemeData], which describes the actual configuration of a radio
    theme.

## Dependencies

- InheritedWidget

## Members

- **data**: `RadioThemeData`
  The properties used for all descendant [Radio] widgets.

## Constructors

### Unnamed Constructor
Constructs a radio theme that configures all descendant [Radio] widgets.

