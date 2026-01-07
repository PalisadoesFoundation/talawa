# Overview for `Container`

## Description

A convenience widget that combines common painting, positioning, and sizing
 widgets.

 

 A container first surrounds the child with [padding] (inflated by any
 borders present in the [decoration]) and then applies additional
 [constraints] to the padded extent (incorporating the `width` and `height`
 as constraints, if either is non-null). The container is then surrounded by
 additional empty space described from the [margin].

 During painting, the container first applies the given [transform], then
 paints the [decoration] to fill the padded extent, then it paints the child,
 and finally paints the [foregroundDecoration], also filling the padded
 extent.

 Containers with no children try to be as big as possible unless the incoming
 constraints are unbounded, in which case they try to be as small as
 possible. Containers with children size themselves to their children. The
 `width`, `height`, and [constraints] arguments to the constructor override
 this.

 By default, containers return false for all hit tests. If the [color]
 property is specified, the hit testing is handled by [ColoredBox], which
 always returns true. If the [decoration] or [foregroundDecoration] properties
 are specified, hit testing is handled by [Decoration.hitTest].

 ## Layout behavior

 _See [BoxConstraints] for an introduction to box layout models._

 Since [Container] combines a number of other widgets each with their own
 layout behavior, [Container]'s layout behavior is somewhat complicated.

 Summary: [Container] tries, in order: to honor [alignment], to size itself
 to the [child], to honor the `width`, `height`, and [constraints], to expand
 to fit the parent, to be as small as possible.

 More specifically:

 If the widget has no child, no `height`, no `width`, no [constraints],
 and the parent provides unbounded constraints, then [Container] tries to
 size as small as possible.

 If the widget has no child and no [alignment], but a `height`, `width`, or
 [constraints] are provided, then the [Container] tries to be as small as
 possible given the combination of those constraints and the parent's
 constraints.

 If the widget has no child, no `height`, no `width`, no [constraints], and
 no [alignment], but the parent provides bounded constraints, then
 [Container] expands to fit the constraints provided by the parent.

 If the widget has an [alignment], and the parent provides unbounded
 constraints, then the [Container] tries to size itself around the child.

 If the widget has an [alignment], and the parent provides bounded
 constraints, then the [Container] tries to expand to fit the parent, and
 then positions the child within itself as per the [alignment].

 Otherwise, the widget has a [child] but no `height`, no `width`, no
 [constraints], and no [alignment], and the [Container] passes the
 constraints from the parent to the child and sizes itself to match the
 child.

 The [margin] and [padding] properties also affect the layout, as described
 in the documentation for those properties. (Their effects merely augment the
 rules described above.) The [decoration] can implicitly increase the
 [padding] (e.g. borders in a [BoxDecoration] contribute to the [padding]);
 see [Decoration.padding].

 ## Example

 
 This example shows a 48x48 amber square (placed inside a [Center] widget in
 case the parent widget has its own opinions regarding the size that the
 [Container] should take), with a margin so that it stays away from
 neighboring widgets:

 ![An amber colored container with the dimensions of 48 square pixels.](https://flutter.github.io/assets-for-api-docs/assets/widgets/container_a.png)

 ```dart
 Center(
   child: Container(
     margin: const EdgeInsets.all(10.0),
     color: Colors.amber[600],
     width: 48.0,
     height: 48.0,
   ),
 )
 ```
 

 

 This example shows how to use many of the features of [Container] at once.
 The [constraints] are set to fit the font size plus ample headroom
 vertically, while expanding horizontally to fit the parent. The [padding] is
 used to make sure there is space between the contents and the text. The
 [color] makes the box blue. The [alignment] causes the [child] to be
 centered in the box. Finally, the [transform] applies a slight rotation to the
 entire contraption to complete the effect.

 ![A blue rectangular container with 'Hello World' in the center, rotated
 slightly in the z axis.](https://flutter.github.io/assets-for-api-docs/assets/widgets/container_b.png)

 ```dart
 Container(
   constraints: BoxConstraints.expand(
     height: Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 + 200.0,
   ),
   padding: const EdgeInsets.all(8.0),
   color: Colors.blue[600],
   alignment: Alignment.center,
   transform: Matrix4.rotationZ(0.1),
   child: Text('Hello World',
     style: Theme.of(context)
         .textTheme
         .headlineMedium!
         .copyWith(color: Colors.white)),
 )
 ```
 

 See also:

  * [AnimatedContainer], a variant that smoothly animates the properties when
    they change.
  * [Border], which has a sample which uses [Container] heavily.
  * [Ink], which paints a [Decoration] on a [Material], allowing
    [InkResponse] and [InkWell] splashes to paint over them.
  * Cookbook: [Animate the properties of a container](https://docs.flutter.dev/cookbook/animation/animated-container)
  * The [catalog of layout widgets](https://docs.flutter.dev/ui/widgets/layout).

## Dependencies

- StatelessWidget

## Members

- **child**: `Widget?`
  The [child] contained by the container.

 If null, and if the [constraints] are unbounded or also null, the
 container will expand to fill all available space in its parent, unless
 the parent provides unbounded constraints, in which case the container
 will attempt to be as small as possible.

 

- **alignment**: `AlignmentGeometry?`
  Align the [child] within the container.

 If non-null, the container will expand to fill its parent and position its
 child within itself according to the given value. If the incoming
 constraints are unbounded, then the child will be shrink-wrapped instead.

 Ignored if [child] is null.

 See also:

  * [Alignment], a class with convenient constants typically used to
    specify an [AlignmentGeometry].
  * [AlignmentDirectional], like [Alignment] for specifying alignments
    relative to text direction.

- **padding**: `EdgeInsetsGeometry?`
  Empty space to inscribe inside the [decoration]. The [child], if any, is
 placed inside this padding.

 This padding is in addition to any padding inherent in the [decoration];
 see [Decoration.padding].

- **color**: `Color?`
  The color to paint behind the [child].

 This property should be preferred when the background is a simple color.
 For other cases, such as gradients or images, use the [decoration]
 property.

 If the [decoration] is used, this property must be null. A background
 color may still be painted by the [decoration] even if this property is
 null.

- **decoration**: `Decoration?`
  The decoration to paint behind the [child].

 Use the [color] property to specify a simple solid color.

 The [child] is not clipped to the decoration. To clip a child to the shape
 of a particular [ShapeDecoration], consider using a [ClipPath] widget.

- **foregroundDecoration**: `Decoration?`
  The decoration to paint in front of the [child].

- **constraints**: `BoxConstraints?`
  Additional constraints to apply to the child.

 The constructor `width` and `height` arguments are combined with the
 `constraints` argument to set this property.

 The [padding] goes inside the constraints.

- **margin**: `EdgeInsetsGeometry?`
  Empty space to surround the [decoration] and [child].

- **transform**: `Matrix4?`
  The transformation matrix to apply before painting the container.

- **transformAlignment**: `AlignmentGeometry?`
  The alignment of the origin, relative to the size of the container, if [transform] is specified.

 When [transform] is null, the value of this property is ignored.

 See also:

  * [Transform.alignment], which is set by this property.

- **clipBehavior**: `Clip`
  The clip behavior when [Container.decoration] is not null.

 Defaults to [Clip.none]. Must be [Clip.none] if [decoration] is null.

 If a clip is to be applied, the [Decoration.getClipPath] method
 for the provided decoration must return a clip path. (This is not
 supported by all decorations; the default implementation of that
 method throws an [UnsupportedError].)

## Constructors

### Unnamed Constructor
Creates a widget that combines common painting, positioning, and sizing widgets.

 The `height` and `width` values include the padding.

 The `color` and `decoration` arguments cannot both be supplied, since
 it would potentially result in the decoration drawing over the background
 color. To supply a decoration with a color, use `decoration:
 BoxDecoration(color: color)`.

