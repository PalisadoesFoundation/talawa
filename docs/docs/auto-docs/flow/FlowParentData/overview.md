# Overview for `FlowParentData`

## Description

Parent data for use with [RenderFlow].

 The [offset] property is ignored by [RenderFlow] and is always set to
 [Offset.zero]. Children of a [RenderFlow] are positioned using a
 transformation matrix, which is private to the [RenderFlow]. To set the
 matrix, use the [FlowPaintingContext.paintChild] function from an override
 of the [FlowDelegate.paintChildren] function.

## Dependencies

- ContainerBoxParentData

## Members

- **_transform**: `Matrix4?`
