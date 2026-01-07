# Overview for `RenderLimitedBox`

## Description

Constrains the child's [BoxConstraints.maxWidth] and
 [BoxConstraints.maxHeight] if they're otherwise unconstrained.

 This has the effect of giving the child a natural dimension in unbounded
 environments. For example, by providing a [maxHeight] to a widget that
 normally tries to be as big as possible, the widget will normally size
 itself to fit its parent, but when placed in a vertical list, it will take
 on the given height.

 This is useful when composing widgets that normally try to match their
 parents' size, so that they behave reasonably in lists (which are
 unbounded).

## Dependencies

- RenderProxyBox

## Members

- **_maxWidth**: `double`
- **_maxHeight**: `double`
## Constructors

### Unnamed Constructor
Creates a render box that imposes a maximum width or maximum height on its
 child if the child is otherwise unconstrained.

 The [maxWidth] and [maxHeight] arguments not be null and must be
 non-negative.

