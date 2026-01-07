# Method: `visitChildrenForSemantics`

## Description

Called when collecting the semantics of this node.

 The implementation has to return the children in paint order skipping all
 children that are not semantically relevant (e.g. because they are
 invisible).

 The default implementation mirrors the behavior of
 [visitChildren] (which is supposed to walk all the children).

## Return Type
`void`

## Parameters

- `visitor`: `RenderObjectVisitor`
