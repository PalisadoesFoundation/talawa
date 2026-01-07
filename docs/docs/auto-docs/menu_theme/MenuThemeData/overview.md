# Overview for `MenuThemeData`

## Description

Defines the configuration of the submenus created by the [SubmenuButton],
 [MenuBar], or [MenuAnchor] widgets.

 Descendant widgets obtain the current [MenuThemeData] object using
 `MenuTheme.of(context)`.

 Typically, a [MenuThemeData] is specified as part of the overall [Theme]
 with [ThemeData.menuTheme]. Otherwise, [MenuTheme] can be used to configure
 its own widget subtree.

 All [MenuThemeData] properties are `null` by default. If any of these
 properties are null, the menu bar will provide its own defaults.

 See also:

 * [ThemeData], which describes the overall theme for the application.
 * [MenuBarThemeData], which describes the theme for the menu bar itself in a
   [MenuBar] widget.

## Dependencies

- Diagnosticable

## Members

- **style**: `MenuStyle?`
  The [MenuStyle] of a [SubmenuButton] menu.

 Any values not set in the [MenuStyle] will use the menu default for that
 property.

- **submenuIcon**: `MaterialStateProperty<Widget?>?`
  If provided, the widget replaces the default [SubmenuButton] arrow icon.

 Resolves in the following states:
  * [WidgetState.disabled].
  * [WidgetState.hovered].
  * [WidgetState.focused].

## Constructors

### Unnamed Constructor
Creates a const set of properties used to configure [MenuTheme].

