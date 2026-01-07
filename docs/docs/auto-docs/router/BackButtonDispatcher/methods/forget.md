# Method: `forget`

## Description

Causes the given child to be removed from the list of children to which
 this object might defer, as if [deferTo] had never been called for that
 child.

 This should only be called once per child, even if [deferTo] was called
 multiple times for that child.

 If no children are left in the list, this object will stop deferring to
 its children. (This is not the same as calling [takePriority], since, if
 this object itself is a [ChildBackButtonDispatcher], [takePriority] would
 additionally attempt to claim priority from its parent, whereas removing
 the last child does not.)

## Return Type
`void`

## Parameters

- `child`: `ChildBackButtonDispatcher`
