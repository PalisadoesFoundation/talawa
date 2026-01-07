# Overview for `BoxDecoration`

## Description

An immutable description of how to paint a box.

 The [BoxDecoration] class provides a variety of ways to draw a box.

 The box has a [border], a body, and may cast a [boxShadow].

 The [shape] of the box can be [BoxShape.circle] or [BoxShape.rectangle]. If
 it is [BoxShape.rectangle], then the [borderRadius] property can be used to
 make it a rounded rectangle ([RRect]).

 The body of the box is painted in layers. The bottom-most layer is the
 [color], which fills the box. Above that is the [gradient], which also fills
 the box. Finally there is the [image], the precise alignment of which is
 controlled by the [DecorationImage] class.

 The [border] paints over the body; the [boxShadow], naturally, paints below it.

 

 The following applies a [BoxDecoration] to a [Container] widget to draw an
 [image] of an owl with a thick black [border] and rounded corners.

 ![](https://flutter.github.io/assets-for-api-docs/assets/painting/box_decoration.png)

 ```dart
 Container(
   decoration: BoxDecoration(
     color: const Color(0xff7c94b6),
     image: const DecorationImage(
       image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
       fit: BoxFit.cover,
     ),
     border: Border.all(
       width: 8,
     ),
     borderRadius: BorderRadius.circular(12),
   ),
 )
 ```
 

 
 The [shape] or the [borderRadius] won't clip the children of the
 decorated [Container]. If the clip is required, insert a clip widget
 (e.g., [ClipRect], [ClipRRect], [ClipPath]) as the child of the [Container].
 Be aware that clipping may be costly in terms of performance.
 

 See also:

  * [DecoratedBox] and [Container], widgets that can be configured with
    [BoxDecoration] objects.
  * [DecoratedSliver], a widget that can be configured with a [BoxDecoration]
   that is converted to render with slivers.
  * [CustomPaint], a widget that lets you draw arbitrary graphics.
  * [Decoration], the base class which lets you define other decorations.

## Dependencies

- Decoration

## Members

- **color**: `Color?`
  The color to fill in the background of the box.

 The color is filled into the [shape] of the box (e.g., either a rectangle,
 potentially with a [borderRadius], or a circle).

 This is ignored if [gradient] is non-null.

 The [color] is drawn under the [image].

- **image**: `DecorationImage?`
  An image to paint above the background [color] or [gradient].

 If [shape] is [BoxShape.circle] then the image is clipped to the circle's
 boundary; if [borderRadius] is non-null then the image is clipped to the
 given radii.

- **border**: `BoxBorder?`
  A border to draw above the background [color], [gradient], or [image].

 Follows the [shape] and [borderRadius].

 Use [Border] objects to describe borders that do not depend on the reading
 direction.

 Use [BoxBorder] objects to describe borders that should flip their left
 and right edges based on whether the text is being read left-to-right or
 right-to-left.

- **borderRadius**: `BorderRadiusGeometry?`
  If non-null, the corners of this box are rounded by this [BorderRadius].

 Applies only to boxes with rectangular shapes; ignored if [shape] is not
 [BoxShape.rectangle].

 

- **boxShadow**: `List&lt;BoxShadow&gt;?`
  A list of shadows cast by this box behind the box.

 The shadow follows the [shape] of the box.

 See also:

  * [kElevationToShadow], for some predefined shadows used in Material
    Design.
  * [PhysicalModel], a widget for showing shadows.

- **gradient**: `Gradient?`
  A gradient to use when filling the box.

 If this is specified, [color] has no effect.

 The [gradient] is drawn under the [image].

- **backgroundBlendMode**: `BlendMode?`
  The blend mode applied to the [color] or [gradient] background of the box.

 If no [backgroundBlendMode] is provided then the default painting blend
 mode is used.

 If no [color] or [gradient] is provided then the blend mode has no impact.

- **shape**: `BoxShape`
  The shape to fill the background [color], [gradient], and [image] into and
 to cast as the [boxShadow].

 If this is [BoxShape.circle] then [borderRadius] is ignored.

 The [shape] cannot be interpolated; animating between two [BoxDecoration]s
 with different [shape]s will result in a discontinuity in the rendering.
 To interpolate between two shapes, consider using [ShapeDecoration] and
 different [ShapeBorder]s; in particular, [CircleBorder] instead of
 [BoxShape.circle] and [RoundedRectangleBorder] instead of
 [BoxShape.rectangle].

 

## Constructors

### Unnamed Constructor
Creates a box decoration.

 * If [color] is null, this decoration does not paint a background color.
 * If [image] is null, this decoration does not paint a background image.
 * If [border] is null, this decoration does not paint a border.
 * If [borderRadius] is null, this decoration uses more efficient background
   painting commands. The [borderRadius] argument must be null if [shape] is
   [BoxShape.circle].
 * If [boxShadow] is null, this decoration does not paint a shadow.
 * If [gradient] is null, this decoration does not paint gradients.
 * If [backgroundBlendMode] is null, this decoration paints with [BlendMode.srcOver]

