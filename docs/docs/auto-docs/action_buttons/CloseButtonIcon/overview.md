# Overview for `CloseButtonIcon`

## Description

A "close" icon that's appropriate for the current [TargetPlatform].

 The current platform is determined by querying for the ambient [Theme].

 See also:

  * [CloseButton], an [IconButton] with a [CloseButtonIcon] that calls
    [Navigator.maybePop] to return to the previous route.
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

