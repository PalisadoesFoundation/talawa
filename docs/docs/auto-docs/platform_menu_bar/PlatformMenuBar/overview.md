# Overview for `PlatformMenuBar`

## Description

A menu bar that uses the platform's native APIs to construct and render a
 menu described by a [PlatformMenu]/[PlatformMenuItem] hierarchy.

 This widget is especially useful on macOS, where a system menu is a required
 part of every application. Flutter only includes support for macOS out of
 the box, but support for other platforms may be provided via plugins that
 set [WidgetsBinding.platformMenuDelegate] in their initialization.

 The [menus] member contains [PlatformMenuItem]s, which configure the
 properties of the menus on the platform menu bar.

 As far as Flutter is concerned, this widget has no visual representation,
 and intercepts no events: it just returns the [child] from its build
 function. This is because all of the rendering, shortcuts, and event
 handling for the menu is handled by the plugin on the host platform. It is
 only part of the widget tree to provide a convenient refresh mechanism for
 the menu data.

 There can only be one [PlatformMenuBar] at a time using the same
 [PlatformMenuDelegate]. It will assert if more than one is detected.

 When calling [toStringDeep] on this widget, it will give a tree of
 [PlatformMenuItem]s, not a tree of widgets.

  This example shows a [PlatformMenuBar] that contains a single
 top level menu, containing three items for "About", a toggleable menu item
 for showing a message, a cascading submenu with message choices, and "Quit".

 **This example will only work on macOS.**

 ** See code in examples/api/lib/material/platform_menu_bar/platform_menu_bar.0.dart **
 

 The menus could just as effectively be managed without using the widget tree
 by using the following code, but mixing this usage with [PlatformMenuBar] is
 not recommended, since it will overwrite the menu configuration when it is
 rebuilt:

 ```dart
 List&lt;PlatformMenuItem&gt; menus = <PlatformMenuItem>[ /* Define menus... */ ];
 WidgetsBinding.instance.platformMenuDelegate.setMenus(menus);
 ```

## Dependencies

- StatefulWidget, DiagnosticableTreeMixin

## Members

- **child**: `Widget?`
  The widget below this widget in the tree.

 

- **menus**: `List&lt;PlatformMenuItem&gt;`
  The list of menu items that are the top level children of the
 [PlatformMenuBar].

 The [menus] member contains [PlatformMenuItem]s. They will not be part of
 the widget tree, since they are not widgets. They are provided to
 configure the properties of the menus on the platform menu bar.

 Also, a Widget in Flutter is immutable, so directly modifying the
 [menus] with `List` APIs such as
 `somePlatformMenuBarWidget.menus.add(...)` will result in incorrect
 behaviors. Whenever the menus list is modified, a new list object
 should be provided.

## Constructors

### Unnamed Constructor
Creates a const [PlatformMenuBar].

 The [child] and [menus] attributes are required.

