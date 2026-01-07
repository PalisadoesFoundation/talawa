# Overview for `RenderConstraintsTransformBox`

## Description

A [RenderBox] that applies an arbitrary transform to its constraints,
 and sizes its child using the resulting [BoxConstraints], optionally
 clipping, or treating the overflow as an error.

 This [RenderBox] sizes its child using a [BoxConstraints] created by
 applying [constraintsTransform] to this [RenderBox]'s own [constraints].
 This box will then attempt to adopt the same size, within the limits of its
 own constraints. If it ends up with a different size, it will align the
 child based on [alignment]. If the box cannot expand enough to accommodate
 the entire child, the child will be clipped if [clipBehavior] is not
 [Clip.none].

 In debug mode, if [clipBehavior] is [Clip.none] and the child overflows the
 container, a warning will be printed on the console, and black and yellow
 striped areas will appear where the overflow occurs.

 When [child] is null, this [RenderBox] takes the smallest possible size and
 never overflows.

 This [RenderBox] can be used to ensure some of [child]'s natural dimensions
 are honored, and get an early warning during development otherwise. For
 instance, if [child] requires a minimum height to fully display its content,
 [constraintsTransform] can be set to a function that removes the `maxHeight`
 constraint from the incoming [BoxConstraints], so that if the parent
 [RenderObject] fails to provide enough vertical space, a warning will be
 displayed in debug mode, while still allowing [child] to grow vertically.

 See also:

  * [ConstraintsTransformBox], the widget that makes use of this
    [RenderObject] and exposes the same functionality.
  * [RenderConstrainedBox], which renders a box which imposes constraints
    on its child.
  * [RenderConstrainedOverflowBox], which renders a box that imposes different
    constraints on its child than it gets from its parent, possibly allowing
    the child to overflow the parent.
  * [RenderConstraintsTransformBox] for a render object that applies an
    arbitrary transform to its constraints before sizing its child using
    the new constraints, treating any overflow as error.

## Dependencies

- RenderAligningShiftedBox, DebugOverflowIndicatorMixin

## Members

- **_constraintsTransform**: `BoxConstraintsTransform`
- **_clipBehavior**: `Clip`
- **_overflowContainerRect**: `Rect`
- **_overflowChildRect**: `Rect`
- **_isOverflowing**: `bool`
- **_childConstraints**: `BoxConstraints?`
- **_clipRectLayer**: `LayerHandle&lt;ClipRectLayer&gt;`
## Constructors

### Unnamed Constructor
Creates a [RenderBox] that sizes itself to the child and modifies the
 [constraints] before passing it down to that child.

