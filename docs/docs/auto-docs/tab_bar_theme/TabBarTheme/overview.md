# Overview for `TabBarTheme`

## Description

Defines a theme for [TabBar] widgets.

 Descendant widgets obtain the current [TabBarTheme] object using
 `TabBarTheme.of(context)`.

 See also:

  * [TabBarThemeData], which describes the actual configuration of a switch
    theme.

## Dependencies

- InheritedTheme, Diagnosticable

## Members

- **_data**: `TabBarThemeData?`
- **_indicator**: `Decoration?`
- **_indicatorColor**: `Color?`
- **_indicatorSize**: `TabBarIndicatorSize?`
- **_dividerColor**: `Color?`
- **_dividerHeight**: `double?`
- **_labelColor**: `Color?`
- **_labelPadding**: `EdgeInsetsGeometry?`
- **_labelStyle**: `TextStyle?`
- **_unselectedLabelColor**: `Color?`
- **_unselectedLabelStyle**: `TextStyle?`
- **_overlayColor**: `MaterialStateProperty<Color?>?`
- **_splashFactory**: `InteractiveInkFeatureFactory?`
- **_mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
- **_tabAlignment**: `TabAlignment?`
- **_textScaler**: `TextScaler?`
- **_indicatorAnimation**: `TabIndicatorAnimation?`
## Constructors

### Unnamed Constructor
Creates a tab bar theme that can be used with [ThemeData.tabBarTheme].

