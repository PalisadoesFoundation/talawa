# Overview for `PlatformMenuDelegate`

## Description

An abstract delegate class that can be used to set
 [WidgetsBinding.platformMenuDelegate] to provide for managing platform
 menus.

 This can be subclassed to provide a different menu plugin than the default
 system-provided plugin for managing [PlatformMenuBar] menus.

 The [setMenus] method allows for setting of the menu hierarchy when the
 [PlatformMenuBar] menu hierarchy changes.

 This delegate doesn't handle the results of clicking on a menu item, which
 is left to the implementor of subclasses of [PlatformMenuDelegate] to
 handle for their implementation.

 This delegate typically knows how to serialize a [PlatformMenu]
 hierarchy, send it over a channel, and register for calls from the channel
 when a menu is invoked or a submenu is opened or closed.

 See [DefaultPlatformMenuDelegate] for an example of implementing one of
 these.

 See also:

  * [PlatformMenuBar], the widget that adds a platform menu bar to an
    application, and uses [setMenus] to send the menus to the platform.
  * [PlatformMenu], the class that describes a menu item with children
    that appear in a cascading menu.
  * [PlatformMenuItem], the class that describes the leaves of a menu
    hierarchy.

## Constructors

### Unnamed Constructor
A const constructor so that subclasses can have const constructors.

