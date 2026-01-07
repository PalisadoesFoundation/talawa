# Overview for `DataTableTheme`

## Description

Applies a data table theme to descendant [DataTable] widgets.

 Descendant widgets obtain the current theme's [DataTableTheme] object using
 [DataTableTheme.of]. When a widget uses [DataTableTheme.of], it is
 automatically rebuilt if the theme later changes.

 A data table theme can be specified as part of the overall Material
 theme using [ThemeData.dataTableTheme].

 See also:

  * [DataTableThemeData], which describes the actual configuration
    of a data table theme.

## Dependencies

- InheritedWidget

## Members

- **data**: `DataTableThemeData`
  The properties used for all descendant [DataTable] widgets.

## Constructors

### Unnamed Constructor
Constructs a data table theme that configures all descendant
 [DataTable] widgets.

