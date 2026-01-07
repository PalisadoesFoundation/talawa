# Overview for `AlwaysScrollableScrollPhysics`

## Description

Scroll physics that always lets the user scroll.

 This overrides the default behavior which is to disable scrolling
 when there is no content to scroll. It does not override the
 handling of overscrolling.

 On Android, overscrolls will be clamped by default and result in an
 overscroll glow. On iOS, overscrolls will load a spring that will return the
 scroll view to its normal range when released.

 See also:

  * [ScrollPhysics], which can be used instead of this class when the default
    behavior is desired instead.
  * [BouncingScrollPhysics], which provides the bouncing overscroll behavior
    found on iOS.
  * [ClampingScrollPhysics], which provides the clamping overscroll behavior
    found on Android.

## Dependencies

- ScrollPhysics

## Constructors

### Unnamed Constructor
Creates scroll physics that always lets the user scroll.

