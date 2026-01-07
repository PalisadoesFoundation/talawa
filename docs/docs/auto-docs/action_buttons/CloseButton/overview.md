# Overview for `CloseButton`

## Description

A Material Design close icon button.

 A [CloseButton] is an [IconButton] with a "close" icon. When pressed, the
 close button calls [Navigator.maybePop] to return to the previous route.

 The [onPressed] callback can, for instance, be used to pop the platform's navigation stack
 via [SystemNavigator] instead of Flutter's [Navigator] in add-to-app
 situations.

 In Material Design 3, both [style]'s [ButtonStyle.iconColor] and [color] are
 used to override the default icon color of [CloseButton]. If both exist, the [ButtonStyle.iconColor]
 will override [color] for states where [ButtonStyle.foregroundColor] resolves to non-null.

 Use a [CloseButton] instead of a [BackButton] on fullscreen dialogs or
 pages that may solicit additional actions to close.

 See also:

  * [AppBar], which automatically uses a [CloseButton] in its
    [AppBar.leading] slot when appropriate.
  * [BackButton], which is more appropriate for middle nodes in the
    navigation tree or where pages can be popped instantaneously with
    no user data consequence.
  * [IconButton], to create other Material Design icon buttons.

## Dependencies

- _ActionButton

## Constructors

### Unnamed Constructor
Creates a Material Design close icon button.

