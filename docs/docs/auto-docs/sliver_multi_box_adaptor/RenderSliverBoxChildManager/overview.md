# Overview for `RenderSliverBoxChildManager`

## Description

A delegate used by [RenderSliverMultiBoxAdaptor] to manage its children.

 [RenderSliverMultiBoxAdaptor] objects reify their children lazily to avoid
 spending resources on children that are not visible in the viewport. This
 delegate lets these objects create and remove children as well as estimate
 the total scroll offset extent occupied by the full child list.

