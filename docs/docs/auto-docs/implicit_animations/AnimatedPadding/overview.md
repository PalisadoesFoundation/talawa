# Overview for `AnimatedPadding`

## Description

Animated version of [Padding] which automatically transitions the
 indentation over a given duration whenever the given inset changes.

 

 Here's an illustration of what using this widget looks like, using a [curve]
 of [Curves.fastOutSlowIn].
 

 
 The following code implements the [AnimatedPadding] widget, using a [curve] of
 [Curves.easeInOut].

 ** See code in examples/api/lib/widgets/implicit_animations/animated_padding.0.dart **
 

 See also:

  * [AnimatedContainer], which can transition more values at once.
  * [AnimatedAlign], which automatically transitions its child's
    position over a given duration whenever the given
    [AnimatedAlign.alignment] changes.

## Dependencies

- ImplicitlyAnimatedWidget

## Members

- **padding**: `EdgeInsetsGeometry`
  The amount of space by which to inset the child.

- **child**: `Widget?`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a widget that insets its child by a value that animates
 implicitly.

