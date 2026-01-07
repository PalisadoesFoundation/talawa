# Method: `invokeLayoutCallback`

## Description

Allows mutations to be made to this object's child list (and any
 descendants) as well as to any other dirty nodes in the render tree owned
 by the same [PipelineOwner] as this object. The `callback` argument is
 invoked synchronously, and the mutations are allowed only during that
 callback's execution.

 This exists to allow child lists to be built on-demand during layout (e.g.
 based on the object's size), and to enable nodes to be moved around the
 tree as this happens (e.g. to handle [GlobalKey] reparenting), while still
 ensuring that any particular node is only laid out once per frame.

 Calling this function disables a number of assertions that are intended to
 catch likely bugs. As such, using this function is generally discouraged.

 This function can only be called during layout.

## Return Type
`void`

## Parameters

- `callback`: `LayoutCallback&lt;T&gt;`
