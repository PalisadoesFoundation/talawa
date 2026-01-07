# Overview for `MenuTheme`

## Description

An inherited widget that defines the configuration in this widget's
 descendants for menus created by the [SubmenuButton], [MenuBar], or
 [MenuAnchor] widgets.

 Values specified here are used for [SubmenuButton]'s menu properties that
 are not given an explicit non-null value.

 See also:

 * [MenuThemeData], a configuration object that holds attributes of a menu
   used by this theme.
 * [MenuBarTheme], which does the same thing for the [MenuBar] widget.
 * [MenuBar], a widget that manages [MenuItemButton]s.
 * [MenuAnchor], a widget that creates a region that has a submenu.
 * [MenuItemButton], a widget that is a selectable item in a menu bar menu.
 * [SubmenuButton], a widget that specifies an item with a cascading submenu
   in a [MenuBar] menu.

## Dependencies

- InheritedTheme

## Members

- **data**: `MenuThemeData`
  The properties for [MenuBar] and [MenuItemButton] in this widget's
 descendants.

## Constructors

### Unnamed Constructor
Creates a const theme that controls the configurations for the menus
 created by the [SubmenuButton] or [MenuAnchor] widgets.

