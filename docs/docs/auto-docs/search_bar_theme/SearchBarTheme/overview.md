# Overview for `SearchBarTheme`

## Description

Applies a search bar theme to descendant [SearchBar] widgets.

 Descendant widgets obtain the current theme's [SearchBarTheme] object using
 [SearchBarTheme.of]. When a widget uses [SearchBarTheme.of], it is automatically
 rebuilt if the theme later changes.

 A search bar theme can be specified as part of the overall Material theme using
 [ThemeData.searchBarTheme].

 See also:

  * [SearchBarThemeData], which describes the actual configuration of a search bar
    theme.

## Dependencies

- InheritedWidget

## Members

- **data**: `SearchBarThemeData`
  The properties used for all descendant [SearchBar] widgets.

## Constructors

### Unnamed Constructor
Constructs a search bar theme that configures all descendant [SearchBar] widgets.

