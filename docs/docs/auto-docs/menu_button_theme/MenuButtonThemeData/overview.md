# Overview for `MenuButtonThemeData`

## Description

A [ButtonStyle] theme that overrides the default appearance of
 [SubmenuButton]s and [MenuItemButton]s when it's used with a
 [MenuButtonTheme] or with the overall [Theme]'s [ThemeData.menuTheme].

 The [style]'s properties override [MenuItemButton]'s and [SubmenuButton]'s
 default style, i.e. the [ButtonStyle] returned by
 [MenuItemButton.defaultStyleOf] and [SubmenuButton.defaultStyleOf]. Only the
 style's non-null property values or resolved non-null
 [WidgetStateProperty] values are used.

 See also:

 * [MenuButtonTheme], the theme which is configured with this class.
 * [MenuTheme], the theme used to configure the look of the menus these
   buttons reside in.
 * [MenuItemButton.defaultStyleOf] and [SubmenuButton.defaultStyleOf] which
   return the default [ButtonStyle]s for menu buttons.
 * [MenuItemButton.styleFrom] and [SubmenuButton.styleFrom], which converts
   simple values into a [ButtonStyle] that's consistent with their respective
   defaults.
 * [WidgetStateProperty.resolve], "resolve" a material state property to a
   simple value based on a set of [WidgetState]s.
 * [ThemeData.menuButtonTheme], which can be used to override the default
   [ButtonStyle] for [MenuItemButton]s and [SubmenuButton]s below the overall
   [Theme].
 * [MenuAnchor], a widget which hosts cascading menus.
 * [MenuBar], a widget which defines a menu bar of buttons hosting cascading
   menus.

## Dependencies

- Diagnosticable

## Members

- **style**: `ButtonStyle?`
  Overrides for [SubmenuButton] and [MenuItemButton]'s default style.

 Non-null properties or non-null resolved [WidgetStateProperty] values
 override the [ButtonStyle] returned by [SubmenuButton.defaultStyleOf] or
 [MenuItemButton.defaultStyleOf].

 If [style] is null, then this theme doesn't override anything.

## Constructors

### Unnamed Constructor
Creates a [MenuButtonThemeData].

 The [style] may be null.

