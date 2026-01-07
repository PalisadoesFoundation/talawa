# Overview for `AnimatedPositionedDirectional`

## Description

Animated version of [PositionedDirectional] which automatically transitions
 the child's position over a given duration whenever the given position
 changes.

 The ambient [Directionality] is used to determine whether [start] is to the
 left or to the right.

 Only works if it's the child of a [Stack].

 This widget is a good choice if the _size_ of the child would end up
 changing as a result of this animation. If the size is intended to remain
 the same, with only the _position_ changing over time, then consider
 [SlideTransition] instead. [SlideTransition] only triggers a repaint each
 frame of the animation, whereas [AnimatedPositionedDirectional] will trigger
 a relayout as well. ([SlideTransition] is also text-direction-aware.)

 Here's an illustration of what using this widget looks like, using a [curve]
 of [Curves.fastOutSlowIn].
 

 See also:

  * [AnimatedPositioned], which specifies the widget's position visually (the
    same as this widget, but for animating [Positioned]).

## Dependencies

- ImplicitlyAnimatedWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 

- **start**: `double?`
  The offset of the child's start edge from the start of the stack.

- **top**: `double?`
  The offset of the child's top edge from the top of the stack.

- **end**: `double?`
  The offset of the child's end edge from the end of the stack.

- **bottom**: `double?`
  The offset of the child's bottom edge from the bottom of the stack.

- **width**: `double?`
  The child's width.

 Only two out of the three horizontal values ([start], [end], [width]) can
 be set. The third must be null.

- **height**: `double?`
  The child's height.

 Only two out of the three vertical values ([top], [bottom], [height]) can
 be set. The third must be null.

## Constructors

### Unnamed Constructor
Creates a widget that animates its position implicitly.

 Only two out of the three horizontal values ([start], [end], [width]), and
 only two out of the three vertical values ([top], [bottom], [height]), can
 be set. In each case, at least one of the three must be null.

