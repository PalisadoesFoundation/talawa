# Overview for `DefaultPlatformMenuDelegate`

## Description

The platform menu delegate that handles the built-in macOS platform menu
 generation using the 'flutter/menu' channel.

 An instance of this class is set on [WidgetsBinding.platformMenuDelegate] by
 default when the [WidgetsBinding] is initialized.

 See also:

  * [PlatformMenuBar], the widget that adds a platform menu bar to an
    application.
  * [PlatformMenu], the class that describes a menu item with children
    that appear in a cascading menu.
  * [PlatformMenuItem], the class that describes the leaves of a menu
    hierarchy.

## Dependencies

- PlatformMenuDelegate

## Members

- **_idMap**: `Map&lt;int, PlatformMenuItem&gt;`
- **_serial**: `int`
- **_lockedContext**: `BuildContext?`
- **channel**: `MethodChannel`
  Defines the channel that the [DefaultPlatformMenuDelegate] uses to
 communicate with the platform.

 Defaults to [SystemChannels.menu].

## Constructors

### Unnamed Constructor
Creates a const [DefaultPlatformMenuDelegate].

 The optional [channel] argument defines the channel used to communicate
 with the platform. It defaults to [SystemChannels.menu] if not supplied.

