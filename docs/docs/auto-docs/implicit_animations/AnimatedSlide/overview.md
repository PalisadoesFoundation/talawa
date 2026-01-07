# Overview for `AnimatedSlide`

## Description

Widget which automatically transitions the child's
 offset relative to its normal position whenever the given offset changes.

 The translation is expressed as an [Offset] scaled to the child's size. For
 example, an [Offset] with a `dx` of 0.25 will result in a horizontal
 translation of one quarter the width of the child.

 
 This code defines a widget that uses [AnimatedSlide] to translate a [FlutterLogo]
 up or down and right or left by dragging the X and Y axis sliders.

 ** See code in examples/api/lib/widgets/implicit_animations/animated_slide.0.dart **
 

 See also:

  * [AnimatedPositioned], which, as a child of a [Stack], automatically
    transitions its child's position over a given duration whenever the given
    position changes.
  * [AnimatedAlign], which automatically transitions its child's
    position over a given duration whenever the given [AnimatedAlign.alignment] changes.

## Dependencies

- ImplicitlyAnimatedWidget

## Members

- **child**: `Widget?`
  The widget below this widget in the tree.

 

- **offset**: `Offset`
  The target offset.
 The child will be translated horizontally by `width * dx` and vertically by `height * dy`

## Constructors

### Unnamed Constructor
Creates a widget that animates its offset translation implicitly.

