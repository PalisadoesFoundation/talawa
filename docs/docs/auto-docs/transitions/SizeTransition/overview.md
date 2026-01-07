# Overview for `SizeTransition`

## Description

Animates its own size and clips and aligns its child.

 [SizeTransition] acts as a [ClipRect] that animates either its width or its
 height, depending upon the value of [axis]. The alignment of the child along
 the [axis] is specified by the [axisAlignment].

 Like most widgets, [SizeTransition] will conform to the constraints it is
 given, so be sure to put it in a context where it can change size. For
 instance, if you place it into a [Container] with a fixed size, then the
 [SizeTransition] will not be able to change size, and will appear to do
 nothing.

 Here's an illustration of the [SizeTransition] widget, with it's [sizeFactor]
 animated by a [CurvedAnimation] set to [Curves.fastOutSlowIn]:
 

 
 This code defines a widget that uses [SizeTransition] to change the size
 of [FlutterLogo] continually. It is built with a [Scaffold]
 where the internal widget has space to change its size.

 ** See code in examples/api/lib/widgets/transitions/size_transition.0.dart **
 

 See also:

  * [AnimatedCrossFade], for a widget that automatically animates between
    the sizes of two children, fading between them.
  * [ScaleTransition], a widget that scales the size of the child instead of
    clipping it.
  * [PositionedTransition], a widget that animates its child from a start
    position to an end position over the lifetime of the animation.
  * [RelativePositionedTransition], a widget that transitions its child's
    position based on the value of a rectangle relative to a bounding box.

## Dependencies

- AnimatedWidget

## Members

- **axis**: `Axis`
  [Axis.horizontal] if [sizeFactor] modifies the width, otherwise
 [Axis.vertical].

- **axisAlignment**: `double`
  Describes how to align the child along the axis that [sizeFactor] is
 modifying.

 A value of -1.0 indicates the top when [axis] is [Axis.vertical], and the
 start when [axis] is [Axis.horizontal]. The start is on the left when the
 text direction in effect is [TextDirection.ltr] and on the right when it
 is [TextDirection.rtl].

 A value of 1.0 indicates the bottom or end, depending upon the [axis].

 A value of 0.0 (the default) indicates the center for either [axis] value.

- **fixedCrossAxisSizeFactor**: `double?`
  The factor by which to multiply the cross axis size of the child.

 If the value of [fixedCrossAxisSizeFactor] is less than one, the child
 will be clipped along the appropriate axis.

 If `null` (the default), the cross axis size is as large as the parent.

- **child**: `Widget?`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a size transition.

 The [axis] argument defaults to [Axis.vertical]. The [axisAlignment]
 defaults to zero, which centers the child along the main axis during the
 transition.

