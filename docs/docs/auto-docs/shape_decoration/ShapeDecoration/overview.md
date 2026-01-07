# Overview for `ShapeDecoration`

## Description

An immutable description of how to paint an arbitrary shape.

 The [ShapeDecoration] class provides a way to draw a [ShapeBorder],
 optionally filling it with a color or a gradient, optionally painting an
 image into it, and optionally casting a shadow.

 

 The following example uses the [Container] widget from the widgets layer to
 draw a white rectangle with a 24-pixel multicolor outline, with the text
 "RGB" inside it:

 ```dart
 Container(
   decoration: ShapeDecoration(
     color: Colors.white,
     shape: Border.all(
       color: Colors.red,
       width: 8.0,
     ) + Border.all(
       color: Colors.green,
       width: 8.0,
     ) + Border.all(
       color: Colors.blue,
       width: 8.0,
     ),
   ),
   child: const Text('RGB', textAlign: TextAlign.center),
 )
 ```
 

 See also:

  * [DecoratedBox] and [Container], widgets that can be configured with
    [ShapeDecoration] objects.
  * [BoxDecoration], a similar [Decoration] that is optimized for rectangles
    specifically.
  * [ShapeBorder], the base class for the objects that are used in the
    [shape] property.

## Dependencies

- Decoration

## Members

- **color**: `Color?`
  The color to fill in the background of the shape.

 The color is under the [image].

 If a [gradient] is specified, [color] must be null.

- **gradient**: `Gradient?`
  A gradient to use when filling the shape.

 The gradient is under the [image].

 If a [color] is specified, [gradient] must be null.

- **image**: `DecorationImage?`
  An image to paint inside the shape (clipped to its outline).

 The image is drawn over the [color] or [gradient].

- **shadows**: `List&lt;BoxShadow&gt;?`
  A list of shadows cast by the [shape].

 See also:

  * [kElevationToShadow], for some predefined shadows used in Material
    Design.
  * [PhysicalModel], a widget for showing shadows.

- **shape**: `ShapeBorder`
  The shape to fill the [color], [gradient], and [image] into and to cast as
 the [shadows].

 Shapes can be stacked (using the `+` operator). The color, gradient, and
 image are drawn into the inner-most shape specified.

 The [shape] property specifies the outline (border) of the decoration.

 ## Directionality-dependent shapes

 Some [ShapeBorder] subclasses are sensitive to the [TextDirection]. The
 direction that is provided to the border (e.g. for its [ShapeBorder.paint]
 method) is the one specified in the [ImageConfiguration]
 ([ImageConfiguration.textDirection]) provided to the [BoxPainter] (via its
 [BoxPainter.paint method). The [BoxPainter] is obtained when
 [createBoxPainter] is called.

 When a [ShapeDecoration] is used with a [Container] widget or a
 [DecoratedBox] widget (which is what [Container] uses), the
 [TextDirection] specified in the [ImageConfiguration] is obtained from the
 ambient [Directionality], using [createLocalImageConfiguration].

## Constructors

### Unnamed Constructor
Creates a shape decoration.

 * If [color] is null, this decoration does not paint a background color.
 * If [gradient] is null, this decoration does not paint gradients.
 * If [image] is null, this decoration does not paint a background image.
 * If [shadows] is null, this decoration does not paint a shadow.

 The [color] and [gradient] properties are mutually exclusive, one (or
 both) of them must be null.

### fromBoxDecoration
Creates a shape decoration configured to match a [BoxDecoration].

 The [BoxDecoration] class is more efficient for shapes that it can
 describe than the [ShapeDecoration] class is for those same shapes,
 because [ShapeDecoration] has to be more general as it can support any
 shape. However, having a [ShapeDecoration] is sometimes necessary, for
 example when calling [ShapeDecoration.lerp] to transition between
 different shapes (e.g. from a [CircleBorder] to a
 [RoundedRectangleBorder]; the [BoxDecoration] class cannot animate the
 transition from a [BoxShape.circle] to [BoxShape.rectangle]).

#### Parameters

- `source`: `BoxDecoration`
