# Overview for `MenuBarTheme`

## Description

An inherited widget that defines the configuration for the [MenuBar] widgets
 in this widget's descendants.

 This class defines the visual properties of [MenuBar] widgets themselves,
 but not their submenus. Those properties are defined by [MenuTheme] or
 [MenuButtonTheme] instead.

 Values specified here are used for [MenuBar]'s properties that are not given
 an explicit non-null value.

 See also:
 * [MenuStyle], a configuration object that holds attributes of a menu, and
   is used by this theme to define those attributes.
 * [MenuTheme], which does the same thing for the menus created by a
   [SubmenuButton] or [MenuAnchor].
 * [MenuButtonTheme], which does the same thing for the [MenuItemButton]s
   inside of the menus.
 * [SubmenuButton], a button that manages a submenu that uses these
   properties.
 * [MenuBar], a widget that creates a menu bar that can use [SubmenuButton]s.

## Dependencies

- InheritedTheme

## Members

- **data**: `MenuBarThemeData`
  The properties to set for [MenuBar] in this widget's descendants.

## Constructors

### Unnamed Constructor
Creates a theme that controls the configurations for [MenuBar] and
 [MenuItemButton] in its widget subtree.

