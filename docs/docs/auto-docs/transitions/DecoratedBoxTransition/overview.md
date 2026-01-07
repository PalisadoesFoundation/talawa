# Overview for `DecoratedBoxTransition`

## Description

Animated version of a [DecoratedBox] that animates the different properties
 of its [Decoration].

 Here's an illustration of the [DecoratedBoxTransition] widget, with it's
 [decoration] animated by a [CurvedAnimation] set to [Curves.decelerate]:
 

 
 The following code implements the [DecoratedBoxTransition] as seen in the video
 above:

 ** See code in examples/api/lib/widgets/transitions/decorated_box_transition.0.dart **
 

 See also:

  * [DecoratedBox], which also draws a [Decoration] but is not animated.
  * [AnimatedContainer], a more full-featured container that also animates on
    decoration using an internal animation.

## Dependencies

- AnimatedWidget

## Members

- **decoration**: `Animation&lt;Decoration&gt;`
  Animation of the decoration to paint.

 Can be created using a [DecorationTween] interpolating typically between
 two [BoxDecoration].

- **position**: `DecorationPosition`
  Whether to paint the box decoration behind or in front of the child.

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates an animated [DecoratedBox] whose [Decoration] animation updates
 the widget.

 See also:

  * [DecoratedBox.new]

