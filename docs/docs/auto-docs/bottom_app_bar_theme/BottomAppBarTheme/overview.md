# Overview for `BottomAppBarTheme`

## Description

Defines default property values for descendant [BottomAppBar] widgets.

 Descendant widgets obtain the current [BottomAppBarTheme] object using
 `BottomAppBarTheme.of(context)`. Instances of [BottomAppBarTheme] can be
 customized with [BottomAppBarTheme.copyWith].

 Typically a [BottomAppBarTheme] is specified as part of the overall [Theme]
 with [ThemeData.bottomAppBarTheme].

 All [BottomAppBarTheme] properties are `null` by default. When null, the
 [BottomAppBar] constructor provides defaults.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **color**: `Color?`
  Overrides the default value for [BottomAppBar.color].

- **elevation**: `double?`
  Overrides the default value for [BottomAppBar.elevation].

- **shape**: `NotchedShape?`
  Overrides the default value for [BottomAppBar.shape].

- **height**: `double?`
  Overrides the default value for [BottomAppBar.height].

- **surfaceTintColor**: `Color?`
  Overrides the default value for [BottomAppBar.surfaceTintColor].

 If null, [BottomAppBar] will not display an overlay color.

 See [Material.surfaceTintColor] for more details.

- **shadowColor**: `Color?`
  Overrides the default value for [BottomAppBar.shadowColor].

- **padding**: `EdgeInsetsGeometry?`
  Overrides the default value for [BottomAppBar.padding].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.bottomAppBarTheme].

