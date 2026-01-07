# Overview for `RenderStack`

## Description

Implements the stack layout algorithm.

 In a stack layout, the children are positioned on top of each other in the
 order in which they appear in the child list. First, the non-positioned
 children (those with null values for top, right, bottom, and left) are
 laid out and initially placed in the upper-left corner of the stack. The
 stack is then sized to enclose all of the non-positioned children. If there
 are no non-positioned children, the stack becomes as large as possible.

 The final location of non-positioned children is determined by the alignment
 parameter. The left of each non-positioned child becomes the
 difference between the child's width and the stack's width scaled by
 alignment.x. The top of each non-positioned child is computed
 similarly and scaled by alignment.y. So if the alignment x and y properties
 are 0.0 (the default) then the non-positioned children remain in the
 upper-left corner. If the alignment x and y properties are 0.5 then the
 non-positioned children are centered within the stack.

 Next, the positioned children are laid out. If a child has top and bottom
 values that are both non-null, the child is given a fixed height determined
 by subtracting the sum of the top and bottom values from the height of the stack.
 Similarly, if the child has right and left values that are both non-null,
 the child is given a fixed width derived from the stack's width.
 Otherwise, the child is given unbounded constraints in the non-fixed dimensions.

 Once the child is laid out, the stack positions the child
 according to the top, right, bottom, and left properties of their
 [StackParentData]. For example, if the bottom value is 10.0, the
 bottom edge of the child will be inset 10.0 pixels from the bottom
 edge of the stack. If the child extends beyond the bounds of the
 stack, the stack will clip the child's painting to the bounds of
 the stack.

 See also:

  * [RenderFlow]

## Dependencies

- RenderBox, ContainerRenderObjectMixin, RenderBoxContainerDefaultsMixin

## Members

- **_hasVisualOverflow**: `bool`
- **_resolvedAlignmentCache**: `Alignment?`
- **_alignment**: `AlignmentGeometry`
- **_textDirection**: `TextDirection?`
- **_fit**: `StackFit`
- **_clipBehavior**: `Clip`
- **_clipRectLayer**: `LayerHandle&lt;ClipRectLayer&gt;`
## Constructors

### Unnamed Constructor
Creates a stack render object.

 By default, the non-positioned children of the stack are aligned by their
 top left corners.

