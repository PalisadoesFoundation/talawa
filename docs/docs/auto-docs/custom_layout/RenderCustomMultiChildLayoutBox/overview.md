# Overview for `RenderCustomMultiChildLayoutBox`

## Description

Defers the layout of multiple children to a delegate.

 The delegate can determine the layout constraints for each child and can
 decide where to position each child. The delegate can also determine the
 size of the parent, but the size of the parent cannot depend on the sizes of
 the children.

## Dependencies

- RenderBox, ContainerRenderObjectMixin, RenderBoxContainerDefaultsMixin

## Members

- **_delegate**: `MultiChildLayoutDelegate`
## Constructors

### Unnamed Constructor
Creates a render object that customizes the layout of multiple children.

