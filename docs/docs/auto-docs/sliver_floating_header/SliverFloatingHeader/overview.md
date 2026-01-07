# Overview for `SliverFloatingHeader`

## Description

A sliver that shows its [child] when the user scrolls forward and hides it
 when the user scrolls backwards.

 This sliver is preferable to the general purpose [SliverPersistentHeader]
 for its relatively narrow use case because there's no need to create a
 [SliverPersistentHeaderDelegate] or to predict the header's size.

 
 This example shows how to create a SliverFloatingHeader.

 ** See code in examples/api/lib/widgets/sliver/sliver_floating_header.0.dart **
 

 See also:

  * [PinnedHeaderSliver] - which just pins the header at the top
    of the [CustomScrollView].
  * [SliverResizingHeader] - which similarly pins the header at the top
    of the [CustomScrollView] but reacts to scrolling by resizing the header
    between its minimum and maximum extent limits.
  * [SliverPersistentHeader] - a general purpose header that can be
    configured as a pinned, resizing, or floating header.

## Dependencies

- StatefulWidget

## Members

- **animationStyle**: `AnimationStyle?`
  Non null properties override the default durations (300ms) and
 curves (Curves.easeInOut) for subsequent header animations.

 The reverse duration and curve apply to the animation that hides the header.

- **snapMode**: `FloatingHeaderSnapMode?`
  Specifies how a partially visible [SliverFloatingHeader] animates
 into a view when a user scroll gesture ends.

 The default is [FloatingHeaderSnapMode.overlay]. This parameter doesn't
 modify an animation in progress, just subsequent animations.

- **child**: `Widget`
  The widget contained by this sliver.

## Constructors

### Unnamed Constructor
Create a floating header sliver that animates into view when the user
 scrolls forward, and disappears the user starts scrolling in the
 opposite direction.

