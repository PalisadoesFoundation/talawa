# Overview for `RenderFractionallySizedOverflowBox`

## Description

Sizes its child to a fraction of the total available space.

 For both its width and height, this render object imposes a tight
 constraint on its child that is a multiple (typically less than 1.0) of the
 maximum constraint it received from its parent on that axis. If the factor
 for a given axis is null, then the constraints from the parent are just
 passed through instead.

 It then tries to size itself to the size of its child. Where this is not
 possible (e.g. if the constraints from the parent are themselves tight), the
 child is aligned according to [alignment].

## Dependencies

- RenderAligningShiftedBox

## Members

- **_widthFactor**: `double?`
- **_heightFactor**: `double?`
## Constructors

### Unnamed Constructor
Creates a render box that sizes its child to a fraction of the total available space.

 If non-null, the [widthFactor] and [heightFactor] arguments must be
 non-negative.

 The [textDirection] must be non-null if the [alignment] is
 direction-sensitive.

