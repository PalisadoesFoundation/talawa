# Method: `pop`

## Description

Ends the effect of the most recently pushed operation.

 Internally the scene builder maintains a stack of operations. Each of the
 operations in the stack applies to each of the objects added to the scene.
 Calling this function removes the most recently added operation from the
 stack.

## Return Type
`void`

