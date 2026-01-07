# Method: `alignChild`

## Description

Apply the current [alignment] to the [child].

 Subclasses should call this method if they have a child, to have
 this class perform the actual alignment. If there is no child,
 do not call this method.

 This method must be called after the child has been laid out and
 this object's own size has been set.

## Return Type
`void`

