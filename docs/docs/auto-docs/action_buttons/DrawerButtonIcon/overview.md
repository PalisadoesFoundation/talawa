# Overview for `DrawerButtonIcon`

## Description

A "drawer" icon that's appropriate for the current [TargetPlatform].

 The current platform is determined by querying for the ambient [Theme].

 See also:

  * [DrawerButton], an [IconButton] with a [DrawerButtonIcon] that calls
    [ScaffoldState.openDrawer] to open the [Scaffold.drawer].
  * [EndDrawerButton], an [IconButton] with an [EndDrawerButtonIcon] that
    calls [ScaffoldState.openEndDrawer] to open the [Scaffold.endDrawer].
  * [IconButton], which is a more general widget for creating buttons
    with icons.
  * [Icon], a Material Design icon.
  * [ThemeData.platform], which specifies the current platform.

## Dependencies

- StatelessWidget

## Constructors

### Unnamed Constructor
Creates an icon that shows the appropriate "close" image for
 the current platform (as obtained from the [Theme]).

