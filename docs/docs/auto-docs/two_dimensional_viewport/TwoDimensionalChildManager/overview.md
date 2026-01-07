# Overview for `TwoDimensionalChildManager`

## Description

A delegate used by [RenderTwoDimensionalViewport] to manage its children.

 [RenderTwoDimensionalViewport] objects reify their children lazily to avoid
 spending resources on children that are not visible in the viewport. This
 delegate lets these objects create, reuse and remove children.

