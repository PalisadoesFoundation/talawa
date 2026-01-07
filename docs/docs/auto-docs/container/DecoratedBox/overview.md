# Overview for `DecoratedBox`

## Description

A widget that paints a [Decoration] either before or after its child paints.

 [Container] insets its child by the widths of the borders; this widget does
 not.

 Commonly used with [BoxDecoration].

 The [child] is not clipped. To clip a child to the shape of a particular
 [ShapeDecoration], consider using a [ClipPath] widget.

 

 This sample shows a radial gradient that draws a moon on a night sky:

 ```dart
 const DecoratedBox(
   decoration: BoxDecoration(
     gradient: RadialGradient(
       center: Alignment(-0.5, -0.6),
       radius: 0.15,
       colors: <Color>[
         Color(0xFFEEEEEE),
         Color(0xFF111133),
       ],
       stops: <double>[0.9, 1.0],
     ),
   ),
 )
 ```
 

 See also:

  * [Ink], which paints a [Decoration] on a [Material], allowing
    [InkResponse] and [InkWell] splashes to paint over them.
  * [DecoratedBoxTransition], the version of this class that animates on the
    [decoration] property.
  * [Decoration], which you can extend to provide other effects with
    [DecoratedBox].
  * [CustomPaint], another way to draw custom effects from the widget layer.
  * [DecoratedSliver], which applies a [Decoration] to a sliver.

## Dependencies

- SingleChildRenderObjectWidget

## Members

- **decoration**: `Decoration`
  What decoration to paint.

 Commonly a [BoxDecoration].

- **position**: `DecorationPosition`
  Whether to paint the box decoration behind or in front of the child.

## Constructors

### Unnamed Constructor
Creates a widget that paints a [Decoration].

 By default the decoration paints behind the child.

