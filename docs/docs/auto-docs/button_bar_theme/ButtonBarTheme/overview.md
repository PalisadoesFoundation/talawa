# Overview for `ButtonBarTheme`

## Description

Applies a button bar theme to descendant [ButtonBar] widgets.

 A button bar theme describes the layout and properties for the buttons
 contained in a [ButtonBar].

 Descendant widgets obtain the current theme's [ButtonBarTheme] object using
 [ButtonBarTheme.of]. When a widget uses [ButtonBarTheme.of], it is automatically
 rebuilt if the theme later changes.

 A button bar theme can be specified as part of the overall Material theme
 using [ThemeData.buttonBarTheme].

 See also:

  * [ButtonBarThemeData], which describes the actual configuration of a button
    bar theme.

## Dependencies

- InheritedWidget

## Members

- **data**: `ButtonBarThemeData`
  The properties used for all descendant [ButtonBar] widgets.

## Constructors

### Unnamed Constructor
Constructs a button bar theme that configures all descendant [ButtonBar]
 widgets.

