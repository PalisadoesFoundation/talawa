# Method: `adoptChild`

## Description

Called by subclasses when they decide a render object is a child.

 Only for use by subclasses when changing their child lists. Calling this
 in other cases will lead to an inconsistent tree and probably cause crashes.

## Return Type
`void`

## Parameters

- `child`: `RenderObject`
