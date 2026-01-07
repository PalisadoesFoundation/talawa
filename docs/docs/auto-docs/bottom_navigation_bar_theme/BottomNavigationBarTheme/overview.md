# Overview for `BottomNavigationBarTheme`

## Description

Applies a bottom navigation bar theme to descendant [BottomNavigationBar]
 widgets.

 Descendant widgets obtain the current theme's [BottomNavigationBarTheme]
 object using [BottomNavigationBarTheme.of]. When a widget uses
 [BottomNavigationBarTheme.of], it is automatically rebuilt if the theme
 later changes.

 A bottom navigation theme can be specified as part of the overall Material
 theme using [ThemeData.bottomNavigationBarTheme].

 See also:

  * [BottomNavigationBarThemeData], which describes the actual configuration
    of a bottom navigation bar theme.

## Dependencies

- InheritedWidget

## Members

- **data**: `BottomNavigationBarThemeData`
  The properties used for all descendant [BottomNavigationBar] widgets.

## Constructors

### Unnamed Constructor
Constructs a bottom navigation bar theme that configures all descendant
 [BottomNavigationBar] widgets.

