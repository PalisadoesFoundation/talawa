# Method: `updateSubtreeNeedsAddToScene`

## Description

Traverses the layer subtree starting from this layer and determines whether it needs [addToScene].

 A layer needs [addToScene] if any of the following is true:

 - [alwaysNeedsAddToScene] is true.
 - [markNeedsAddToScene] has been called.
 - Any of its descendants need [addToScene].

 [ContainerLayer] overrides this method to recursively call it on its children.

## Return Type
`void`

