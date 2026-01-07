# Overview for `StackParentData`

## Description

Parent data for use with [RenderStack].

## Dependencies

- ContainerBoxParentData

## Members

- **top**: `double?`
  The distance by which the child's top edge is inset from the top of the stack.

- **right**: `double?`
  The distance by which the child's right edge is inset from the right of the stack.

- **bottom**: `double?`
  The distance by which the child's bottom edge is inset from the bottom of the stack.

- **left**: `double?`
  The distance by which the child's left edge is inset from the left of the stack.

- **width**: `double?`
  The child's width.

 Ignored if both left and right are non-null.

- **height**: `double?`
  The child's height.

 Ignored if both top and bottom are non-null.

