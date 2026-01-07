# Overview for `DropdownMenuThemeData`

## Description

Overrides the default values of visual properties for descendant [DropdownMenu] widgets.

 Descendant widgets obtain the current [DropdownMenuThemeData] object with
 [DropdownMenuTheme.of]. Instances of [DropdownMenuTheme] can
 be customized with [DropdownMenuThemeData.copyWith].

 Typically a [DropdownMenuTheme] is specified as part of the overall [Theme] with
 [ThemeData.dropdownMenuTheme].

 All [DropdownMenuThemeData] properties are null by default. When null, the [DropdownMenu]
 computes its own default values, typically based on the overall
 theme's [ThemeData.colorScheme], [ThemeData.textTheme], and [ThemeData.iconTheme].

## Dependencies

- Diagnosticable

## Members

- **textStyle**: `TextStyle?`
  Overrides the default value for [DropdownMenu.textStyle].

- **inputDecorationTheme**: `InputDecorationTheme?`
  The input decoration theme for the [TextField]s in a [DropdownMenu].

 If this is null, the [DropdownMenu] provides its own defaults.

- **menuStyle**: `MenuStyle?`
  Overrides the menu's default style in a [DropdownMenu].

 Any values not set in the [MenuStyle] will use the menu default for that
 property.

## Constructors

### Unnamed Constructor
Creates a [DropdownMenuThemeData] that can be used to override default properties
 in a [DropdownMenuTheme] widget.

