# Overview for `ClampingScrollPhysics`

## Description

Scroll physics for environments that prevent the scroll offset from reaching
 beyond the bounds of the content.

 This is the behavior typically seen on Android.

 See also:

  * [ScrollConfiguration], which uses this to provide the default
    scroll behavior on Android.
  * [BouncingScrollPhysics], which is the analogous physics for iOS' bouncing
    behavior.
  * [GlowingOverscrollIndicator], which is used by [ScrollConfiguration] to
    provide the glowing effect that is usually found with this clamping effect
    on Android. When using a [MaterialApp], the [GlowingOverscrollIndicator]'s
    glow color is specified to use the overall theme's
    [ColorScheme.secondary] color.

## Dependencies

- ScrollPhysics

## Constructors

### Unnamed Constructor
Creates scroll physics that prevent the scroll offset from exceeding the
 bounds of the content.

