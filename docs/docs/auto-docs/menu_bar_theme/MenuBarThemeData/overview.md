# Overview for `MenuBarThemeData`

## Description

A data class that [MenuBarTheme] uses to define the visual properties of
 [MenuBar] widgets.

 This class defines the visual properties of [MenuBar] widgets themselves,
 but not their submenus. Those properties are defined by [MenuThemeData] or
 [MenuButtonThemeData] instead.

 Descendant widgets obtain the current [MenuBarThemeData] object using
 `MenuBarTheme.of(context)`.

 Typically, a [MenuBarThemeData] is specified as part of the overall [Theme]
 with [ThemeData.menuBarTheme]. Otherwise, [MenuTheme] can be used to
 configure its own widget subtree.

 All [MenuBarThemeData] properties are `null` by default. If any of these
 properties are null, the menu bar will provide its own defaults.

 See also:

 * [MenuThemeData], which describes the theme for the submenus of a
   [MenuBar].
 * [MenuButtonThemeData], which describes the theme for the [MenuItemButton]s
   in a menu.
 * [ThemeData], which describes the overall theme for the application.

## Dependencies

- MenuThemeData

## Constructors

### Unnamed Constructor
Creates a const set of properties used to configure [MenuTheme].

