# Overview for `RenderCustomSingleChildLayoutBox`

## Description

Defers the layout of its single child to a delegate.

 The delegate can determine the layout constraints for the child and can
 decide where to position the child. The delegate can also determine the size
 of the parent, but the size of the parent cannot depend on the size of the
 child.

## Dependencies

- RenderShiftedBox

## Members

- **_delegate**: `SingleChildLayoutDelegate`
## Constructors

### Unnamed Constructor
Creates a render box that defers its layout to a delegate.

 The [delegate] argument must not be null.

