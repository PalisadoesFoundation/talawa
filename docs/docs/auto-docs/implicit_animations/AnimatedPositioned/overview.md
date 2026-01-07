# Overview for `AnimatedPositioned`

## Description

Animated version of [Positioned] which automatically transitions the child's
 position over a given duration whenever the given position changes.

 

 Only works if it's the child of a [Stack].

 This widget is a good choice if the _size_ of the child would end up
 changing as a result of this animation. If the size is intended to remain
 the same, with only the _position_ changing over time, then consider
 [SlideTransition] instead. [SlideTransition] only triggers a repaint each
 frame of the animation, whereas [AnimatedPositioned] will trigger a relayout
 as well.

 Here's an illustration of what using this widget looks like, using a [curve]
 of [Curves.fastOutSlowIn].
 

 For the animation, you can choose a [curve] as well as a [duration] and the
 widget will automatically animate to the new target position. If you require
 more control over the animation (e.g. if you want to stop it mid-animation),
 consider using a [PositionedTransition] instead, which takes a provided
 [Animation] as an argument. While that allows you to fine-tune the animation,
 it also requires more development overhead as you have to manually manage
 the lifecycle of the underlying [AnimationController].

 
 The following example transitions an AnimatedPositioned
 between two states. It adjusts the `height`, `width`, and
 [Positioned] properties when tapped.

 ** See code in examples/api/lib/widgets/implicit_animations/animated_positioned.0.dart **
 

 See also:

  * [AnimatedPositionedDirectional], which adapts to the ambient
    [Directionality] (the same as this widget, but for animating
    [PositionedDirectional]).

## Dependencies

- ImplicitlyAnimatedWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 

- **left**: `double?`
  The offset of the child's left edge from the left of the stack.

- **top**: `double?`
  The offset of the child's top edge from the top of the stack.

- **right**: `double?`
  The offset of the child's right edge from the right of the stack.

- **bottom**: `double?`
  The offset of the child's bottom edge from the bottom of the stack.

- **width**: `double?`
  The child's width.

 Only two out of the three horizontal values ([left], [right], [width]) can
 be set. The third must be null.

- **height**: `double?`
  The child's height.

 Only two out of the three vertical values ([top], [bottom], [height]) can
 be set. The third must be null.

## Constructors

### Unnamed Constructor
Creates a widget that animates its position implicitly.

 Only two out of the three horizontal values ([left], [right],
 [width]), and only two out of the three vertical values ([top],
 [bottom], [height]), can be set. In each case, at least one of
 the three must be null.

### fromRect
Creates a widget that animates the rectangle it occupies implicitly.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
