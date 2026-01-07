# Overview for `PopupMenuThemeData`

## Description

Defines the visual properties of the routes used to display popup menus
 as well as [PopupMenuItem] and [PopupMenuDivider] widgets.

 Descendant widgets obtain the current [PopupMenuThemeData] object
 using `PopupMenuTheme.of(context)`. Instances of
 [PopupMenuThemeData] can be customized with
 [PopupMenuThemeData.copyWith].

 Typically, a [PopupMenuThemeData] is specified as part of the
 overall [Theme] with [ThemeData.popupMenuTheme]. Otherwise,
 [PopupMenuTheme] can be used to configure its own widget subtree.

 All [PopupMenuThemeData] properties are `null` by default.
 If any of these properties are null, the popup menu will provide its
 own defaults.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **color**: `Color?`
  The background color of the popup menu.

- **shape**: `ShapeBorder?`
  The shape of the popup menu.

- **menuPadding**: `EdgeInsetsGeometry?`
  If specified, the padding of the popup menu.

 If [PopupMenuButton.menuPadding] is provided, [menuPadding] is ignored.

- **elevation**: `double?`
  The elevation of the popup menu.

- **shadowColor**: `Color?`
  The color used to paint shadow below the popup menu.

- **surfaceTintColor**: `Color?`
  The color used as an overlay on [color] of the popup menu.

- **textStyle**: `TextStyle?`
  The text style of items in the popup menu.

- **labelTextStyle**: `MaterialStateProperty<TextStyle?>?`
  You can use this to specify a different style of the label
 when the popup menu item is enabled and disabled.

- **enableFeedback**: `bool?`
  If specified, defines the feedback property for [PopupMenuButton].

 If [PopupMenuButton.enableFeedback] is provided, [enableFeedback] is ignored.

- **mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
  

 If specified, overrides the default value of [PopupMenuItem.mouseCursor].

- **position**: `PopupMenuPosition?`
  Whether the popup menu is positioned over or under the popup menu button.

 When not set, the position defaults to [PopupMenuPosition.over] which makes the
 popup menu appear directly over the button that was used to create it.

- **iconColor**: `Color?`
  The color of the icon in the popup menu button.

- **iconSize**: `double?`
  The size of the icon in the popup menu button.

## Constructors

### Unnamed Constructor
Creates the set of properties used to configure [PopupMenuTheme].

