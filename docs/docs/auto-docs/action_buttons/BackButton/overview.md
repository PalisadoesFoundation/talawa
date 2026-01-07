# Overview for `BackButton`

## Description

A Material Design back icon button.

 A [BackButton] is an [IconButton] with a "back" icon appropriate for the
 current [TargetPlatform]. When pressed, the back button calls
 [Navigator.maybePop] to return to the previous route unless a custom
 [onPressed] callback is provided.

 The [onPressed] callback can, for instance, be used to pop the platform's navigation stack
 via [SystemNavigator] instead of Flutter's [Navigator] in add-to-app
 situations.

 In Material Design 3, both [style]'s [ButtonStyle.iconColor] and [color] are
 used to override the default icon color of [BackButton]. If both exist, the [ButtonStyle.iconColor]
 will override [color] for states where [ButtonStyle.foregroundColor] resolves to non-null.

 When deciding to display a [BackButton], consider using
 `ModalRoute.canPopOf(context)` to check whether the current route can be
 popped. If that value is false (e.g., because the current route is the
 initial route), the [BackButton] will not have any effect when pressed,
 which could frustrate the user.

 Requires one of its ancestors to be a [Material] widget.

 See also:

  * [AppBar], which automatically uses a [BackButton] in its
    [AppBar.leading] slot when the [Scaffold] has no [Drawer] and the
    current [Route] is not the [Navigator]'s first route.
  * [BackButtonIcon], which is useful if you need to create a back button
    that responds differently to being pressed.
  * [IconButton], which is a more general widget for creating buttons with
    icons.
  * [CloseButton], an alternative which may be more appropriate for leaf
    node pages in the navigation tree.

## Dependencies

- _ActionButton

## Constructors

### Unnamed Constructor
Creates an [IconButton] with the appropriate "back" icon for the current
 target platform.

