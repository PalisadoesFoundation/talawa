# Overview for `PlatformProvidedMenuItem`

## Description

A class that represents a menu item that is provided by the platform.

 This is used to add things like the "About" and "Quit" menu items to a
 platform menu.

 The [type] enum determines which type of platform defined menu will be
 added.

 This is most useful on a macOS platform where there are many different types
 of platform provided menu items in the standard menu setup.

 In order to know if a [PlatformProvidedMenuItem] is available on a
 particular platform, call [PlatformProvidedMenuItem.hasMenu].

 If the platform does not support the given [type], then the menu item will
 throw an [ArgumentError] when it is sent to the platform.

 See also:

  * [PlatformMenuBar] which takes these items for inclusion in a
    platform-rendered menu bar.

## Dependencies

- PlatformMenuItem

## Members

- **type**: `PlatformProvidedMenuItemType`
  The type of default menu this is.

 See [PlatformProvidedMenuItemType] for the different types available. Not
 all of the types will be available on every platform. Use [hasMenu] to
 determine if the current platform has a given default menu item.

 If the platform does not support the given [type], then the menu item will
 throw an [ArgumentError] in debug mode.

- **enabled**: `bool`
  True if this [PlatformProvidedMenuItem] should be enabled or not.

## Constructors

### Unnamed Constructor
Creates a const [PlatformProvidedMenuItem] of the appropriate type. Throws if the
 platform doesn't support the given default menu type.

 The [type] argument is required.

