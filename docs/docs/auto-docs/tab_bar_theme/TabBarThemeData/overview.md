# Overview for `TabBarThemeData`

## Description

Defines default property values for descendant [TabBar] widgets.

 Descendant widgets obtain the current [TabBarThemeData] object using
 `TabBarTheme.of(context).data`. Instances of [TabBarThemeData] can be
 customized with [TabBarThemeData.copyWith].

 Typically a [TabBarThemeData] is specified as part of the overall [Theme]
 with [ThemeData.tabBarTheme].

 All [TabBarThemeData] properties are `null` by default. When null, the [TabBar]
 will use the values from [ThemeData] if they exist, otherwise it will
 provide its own defaults. See the individual [TabBar] properties for details.

 See also:

  * [TabBar], which displays a row of tabs.
  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **indicator**: `Decoration?`
  Overrides the default value for [TabBar.indicator].

- **indicatorColor**: `Color?`
  Overrides the default value for [TabBar.indicatorColor].

- **indicatorSize**: `TabBarIndicatorSize?`
  Overrides the default value for [TabBar.indicatorSize].

- **dividerColor**: `Color?`
  Overrides the default value for [TabBar.dividerColor].

- **dividerHeight**: `double?`
  Overrides the default value for [TabBar.dividerHeight].

- **labelColor**: `Color?`
  Overrides the default value for [TabBar.labelColor].

 If [labelColor] is a [WidgetStateColor], then the effective color will
 depend on the [WidgetState.selected] state, i.e. if the [Tab] is
 selected or not. In case of unselected state, this [WidgetStateColor]'s
 resolved color will be used even if [TabBar.unselectedLabelColor] or
 [unselectedLabelColor] is non-null.

- **labelPadding**: `EdgeInsetsGeometry?`
  Overrides the default value for [TabBar.labelPadding].

 If there are few tabs with both icon and text and few
 tabs with only icon or text, this padding is vertically
 adjusted to provide uniform padding to all tabs.

- **labelStyle**: `TextStyle?`
  Overrides the default value for [TabBar.labelStyle].

- **unselectedLabelColor**: `Color?`
  Overrides the default value for [TabBar.unselectedLabelColor].

- **unselectedLabelStyle**: `TextStyle?`
  Overrides the default value for [TabBar.unselectedLabelStyle].

- **overlayColor**: `MaterialStateProperty<Color?>?`
  Overrides the default value for [TabBar.overlayColor].

- **splashFactory**: `InteractiveInkFeatureFactory?`
  Overrides the default value for [TabBar.splashFactory].

- **mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
  

 If specified, overrides the default value of [TabBar.mouseCursor].

- **tabAlignment**: `TabAlignment?`
  Overrides the default value for [TabBar.tabAlignment].

- **textScaler**: `TextScaler?`
  Overrides the default value for [TabBar.textScaler].

- **indicatorAnimation**: `TabIndicatorAnimation?`
  Overrides the default value for [TabBar.indicatorAnimation].

- **splashBorderRadius**: `BorderRadius?`
  Defines the clipping radius of splashes that extend outside the bounds of the tab.

## Constructors

### Unnamed Constructor
Creates a tab bar theme that can be used with [ThemeData.tabBarTheme].

