# Overview for `RenderIndexedStack`

## Description

Implements the same layout algorithm as RenderStack but only paints the child
 specified by index.

 Although only one child is displayed, the cost of the layout algorithm is
 still O(N), like an ordinary stack.

## Dependencies

- RenderStack

## Members

- **_index**: `int?`
## Constructors

### Unnamed Constructor
Creates a stack render object that paints a single child.

 If the [index] parameter is null, nothing is displayed.

