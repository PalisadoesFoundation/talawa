# Overview for `AnimatedContainer`

## Description

Animated version of [Container] that gradually changes its values over a period of time.

 The [AnimatedContainer] will automatically animate between the old and
 new values of properties when they change using the provided curve and
 duration. Properties that are null are not animated. Its child and
 descendants are not animated.

 This class is useful for generating simple implicit transitions between
 different parameters to [Container] with its internal [AnimationController].
 For more complex animations, you'll likely want to use a subclass of
 [AnimatedWidget] such as the [DecoratedBoxTransition] or use your own
 [AnimationController].

 

 
 The following example (depicted above) transitions an AnimatedContainer
 between two states. It adjusts the `height`, `width`, `color`, and
 [alignment] properties when tapped.

 ** See code in examples/api/lib/widgets/implicit_animations/animated_container.0.dart **
 

 See also:

  * [AnimatedPadding], which is a subset of this widget that only
    supports animating the [padding].
  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  * [AnimatedPositioned], which, as a child of a [Stack], automatically
    transitions its child's position over a given duration whenever the given
    position changes.
  * [AnimatedAlign], which automatically transitions its child's
    position over a given duration whenever the given [AnimatedAlign.alignment] changes.
  * [AnimatedSwitcher], which switches out a child for a new one with a customizable transition.
  * [AnimatedCrossFade], which fades between two children and interpolates their sizes.

## Dependencies

- ImplicitlyAnimatedWidget

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

- **decoration**: `Decoration?`
  The decoration to paint behind the [child].

 A shorthand for specifying just a solid color is available in the
 constructor: set the `color` argument instead of the `decoration`
 argument.

- **foregroundDecoration**: `Decoration?`
  The decoration to paint in front of the child.

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
  The clip behavior when [AnimatedContainer.decoration] is not null.

 Defaults to [Clip.none]. Must be [Clip.none] if [decoration] is null.

 Unlike other properties of [AnimatedContainer], changes to this property
 apply immediately and have no animation.

 If a clip is to be applied, the [Decoration.getClipPath] method
 for the provided decoration must return a clip path. (This is not
 supported by all decorations; the default implementation of that
 method throws an [UnsupportedError].)

## Constructors

### Unnamed Constructor
Creates a container that animates its parameters implicitly.

