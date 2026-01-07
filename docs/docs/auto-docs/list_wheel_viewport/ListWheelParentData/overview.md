# Overview for `ListWheelParentData`

## Description

[ParentData] for use with [RenderListWheelViewport].

## Dependencies

- ContainerBoxParentData

## Members

- **index**: `int?`
  Index of this child in its parent's child list.

 This must be maintained by the [ListWheelChildManager].

- **transform**: `Matrix4?`
  Transform applied to this child during painting.

 Can be used to find the local bounds of this child in the viewport,
 and then use it, for example, in hit testing.

 May be null if child was laid out, but not painted
 by the parent, but normally this shouldn't happen,
 because [RenderListWheelViewport] paints all of the
 children it has laid out.

