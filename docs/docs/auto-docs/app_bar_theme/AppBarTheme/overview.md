# Overview for `AppBarTheme`

## Description

Overrides the default values of visual properties for descendant
 [AppBar] widgets.

 Descendant widgets obtain the current [AppBarTheme] object with
 `AppBarTheme.of(context)`. Instances of [AppBarTheme] can be customized
 with [AppBarTheme.copyWith].

 Typically an [AppBarTheme] is specified as part of the overall [Theme] with
 [ThemeData.appBarTheme].

 All [AppBarTheme] properties are `null` by default. When null, the [AppBar]
 compute its own default values, typically based on the overall theme's
 [ThemeData.colorScheme], [ThemeData.textTheme], and [ThemeData.iconTheme].

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `Color?`
  Overrides the default value of [AppBar.backgroundColor] in all
 descendant [AppBar] widgets.

 See also:

  * [foregroundColor], which overrides the default value of
    [AppBar.foregroundColor] in all descendant [AppBar] widgets.

- **foregroundColor**: `Color?`
  Overrides the default value of [AppBar.foregroundColor] in all
 descendant [AppBar] widgets.

 See also:

  * [backgroundColor], which overrides the default value of
    [AppBar.backgroundColor] in all descendant [AppBar] widgets.

- **elevation**: `double?`
  Overrides the default value of [AppBar.elevation] in all
 descendant [AppBar] widgets.

- **scrolledUnderElevation**: `double?`
  Overrides the default value of [AppBar.scrolledUnderElevation] in all
 descendant [AppBar] widgets.

- **shadowColor**: `Color?`
  Overrides the default value of [AppBar.shadowColor] in all
 descendant [AppBar] widgets.

- **surfaceTintColor**: `Color?`
  Overrides the default value of [AppBar.surfaceTintColor] in all
 descendant [AppBar] widgets.

- **shape**: `ShapeBorder?`
  Overrides the default value of [AppBar.shape] in all
 descendant [AppBar] widgets.

- **iconTheme**: `IconThemeData?`
  Overrides the default value of [AppBar.iconTheme] in all
 descendant [AppBar] widgets.

 See also:

  * [actionsIconTheme], which overrides the default value of
    [AppBar.actionsIconTheme] in all descendant [AppBar] widgets.
  * [foregroundColor], which overrides the default value
    [AppBar.foregroundColor] in all descendant [AppBar] widgets.

- **actionsIconTheme**: `IconThemeData?`
  Overrides the default value of [AppBar.actionsIconTheme] in all
 descendant [AppBar] widgets.

 See also:

  * [iconTheme], which overrides the default value of
    [AppBar.iconTheme] in all descendant [AppBar] widgets.
  * [foregroundColor], which overrides the default value
    [AppBar.foregroundColor] in all descendant [AppBar] widgets.

- **centerTitle**: `bool?`
  Overrides the default value of [AppBar.centerTitle]
 property in all descendant [AppBar] widgets.

- **titleSpacing**: `double?`
  Overrides the default value of the obsolete [AppBar.titleSpacing]
 property in all descendant [AppBar] widgets.

 If null, [AppBar] uses default value of [NavigationToolbar.kMiddleSpacing].

- **leadingWidth**: `double?`
  Overrides the default value of the [AppBar.leadingWidth]
 property in all descendant [AppBar] widgets.

- **toolbarHeight**: `double?`
  Overrides the default value of the [AppBar.toolbarHeight]
 property in all descendant [AppBar] widgets.

 See also:

  * [AppBar.preferredHeightFor], which computes the overall
    height of an AppBar widget, taking this value into account.

- **toolbarTextStyle**: `TextStyle?`
  Overrides the default value of the obsolete [AppBar.toolbarTextStyle]
 property in all descendant [AppBar] widgets.

 See also:

  * [titleTextStyle], which overrides the default of [AppBar.titleTextStyle]
    in all descendant [AppBar] widgets.

- **titleTextStyle**: `TextStyle?`
  Overrides the default value of [AppBar.titleTextStyle]
 property in all descendant [AppBar] widgets.

 See also:

  * [toolbarTextStyle], which overrides the default of [AppBar.toolbarTextStyle]
    in all descendant [AppBar] widgets.

- **systemOverlayStyle**: `SystemUiOverlayStyle?`
  Overrides the default value of [AppBar.systemOverlayStyle]
 property in all descendant [AppBar] widgets.

- **actionsPadding**: `EdgeInsetsGeometry?`
  Overrides the default value of [AppBar.actionsPadding]
 property in all descendant [AppBar] widgets.

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.appBarTheme].

