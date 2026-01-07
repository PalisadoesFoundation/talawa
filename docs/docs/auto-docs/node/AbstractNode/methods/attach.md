# Method: `attach`

## Description

Mark this node as attached to the given owner.

 Typically called only from the [parent]'s [attach] method, and by the
 [owner] to mark the root of a tree as attached.

 Subclasses with children should override this method to
 [attach] all their children to the same [owner]
 after calling the inherited method, as in `super.attach(owner)`.

## Return Type
`void`

## Parameters

- `owner`: `Object`
