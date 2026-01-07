# Overview for `SearchViewThemeData`

## Description

Defines the configuration of the search views created by the [SearchAnchor]
 widget.

 Descendant widgets obtain the current [SearchViewThemeData] object using
 `SearchViewTheme.of(context)`.

 Typically, a [SearchViewThemeData] is specified as part of the overall [Theme]
 with [ThemeData.searchViewTheme]. Otherwise, [SearchViewTheme] can be used
 to configure its own widget subtree.

 All [SearchViewThemeData] properties are `null` by default. If any of these
 properties are null, the search view will provide its own defaults.

 See also:

 * [ThemeData], which describes the overall theme for the application.
 * [SearchBarThemeData], which describes the theme for the search bar itself in a
   [SearchBar] widget.
 * [SearchAnchor], which is used to open a search view route.

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `Color?`
  Overrides the default value of the [SearchAnchor.viewBackgroundColor].

- **elevation**: `double?`
  Overrides the default value of the [SearchAnchor.viewElevation].

- **surfaceTintColor**: `Color?`
  Overrides the default value of the [SearchAnchor.viewSurfaceTintColor].

- **side**: `BorderSide?`
  Overrides the default value of the [SearchAnchor.viewSide].

- **shape**: `OutlinedBorder?`
  Overrides the default value of the [SearchAnchor.viewShape].

- **headerHeight**: `double?`
  Overrides the default value of the [SearchAnchor.headerHeight].

- **headerTextStyle**: `TextStyle?`
  Overrides the default value for [SearchAnchor.headerTextStyle].

- **headerHintStyle**: `TextStyle?`
  Overrides the default value for [SearchAnchor.headerHintStyle].

- **constraints**: `BoxConstraints?`
  Overrides the value of size constraints for [SearchAnchor.viewConstraints].

- **padding**: `EdgeInsetsGeometry?`
  Overrides the value of the padding for [SearchAnchor.viewPadding].

- **barPadding**: `EdgeInsetsGeometry?`
  Overrides the value of the padding for [SearchAnchor.viewBarPadding]

- **shrinkWrap**: `bool?`
  Overrides the value of the shrink wrap for [SearchAnchor.shrinkWrap].

- **dividerColor**: `Color?`
  Overrides the value of the divider color for [SearchAnchor.dividerColor].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.searchViewTheme].

