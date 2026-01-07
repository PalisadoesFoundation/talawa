# Overview for `CheckboxTheme`

## Description

Applies a checkbox theme to descendant [Checkbox] widgets.

 Descendant widgets obtain the current theme's [CheckboxTheme] object using
 [CheckboxTheme.of]. When a widget uses [CheckboxTheme.of], it is
 automatically rebuilt if the theme later changes.

 A checkbox theme can be specified as part of the overall Material theme
 using [ThemeData.checkboxTheme].

 See also:

  * [CheckboxThemeData], which describes the actual configuration of a
  checkbox theme.

## Dependencies

- InheritedWidget

## Members

- **data**: `CheckboxThemeData`
  The properties used for all descendant [Checkbox] widgets.

## Constructors

### Unnamed Constructor
Constructs a checkbox theme that configures all descendant [Checkbox]
 widgets.

